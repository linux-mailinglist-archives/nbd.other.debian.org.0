Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1839E1A9BE
	for <lists+nbd@lfdr.de>; Sun, 12 May 2019 00:55:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E7EDE2058B; Sat, 11 May 2019 22:55:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 11 22:55:12 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 037AC20586
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 May 2019 22:55:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id I13RM0r5xZdi for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 May 2019 22:55:01 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D5EAC20583
	for <nbd@other.debian.org>; Sat, 11 May 2019 22:55:01 +0000 (UTC)
Received: from [105.228.48.136] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <w@uter.be>)
	id 1hPaqC-0007QQ-OZ; Sun, 12 May 2019 00:51:41 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1hPaq5-00018A-AZ; Sun, 12 May 2019 00:51:33 +0200
Date: Sun, 12 May 2019 00:51:32 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, libguestfs@redhat.com,
	nbd@other.debian.org
Subject: Re: [Libguestfs] [nbdkit PATCH 3/7] RFC: protocol: Only send
 EOVERFLOW when valid
Message-ID: <20190511225132.GB3801@grep.be>
References: <20190423005026.21496-1-eblake@redhat.com>
 <20190423005026.21496-4-eblake@redhat.com>
 <20190423073639.GE5429@redhat.com>
 <2155d05a-99ed-b1c6-0edc-553c4778e278@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2155d05a-99ed-b1c6-0edc-553c4778e278@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <CQkKza7-y1G.A.vSC.QL11cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/496
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190511225132.GB3801@grep.be
Resent-Date: Sat, 11 May 2019 22:55:12 +0000 (UTC)

On Tue, Apr 23, 2019 at 07:38:41AM -0500, Eric Blake wrote:
> [adding NBD list]
> 
> On 4/23/19 2:36 AM, Richard W.M. Jones wrote:
> > On Mon, Apr 22, 2019 at 07:50:22PM -0500, Eric Blake wrote:
> >> Previously, we were squashing EOVERFLOW into EINVAL; continue to do so
> >> at points in the protocol where the client may not be expecting
> >> EOVERFLOW.
> 
> > 
> > The protocol spec is unclear on whether EOVERFLOW can be returned in
> > cases other than the DF flag being set.  Whether we include this patch
> > or not seems to hinge on the interpretation of the protocol spec which
> > I'm not really in a position to make.
> 
> Context: nbdkit previously did not allow the EOVERFLOW value over the
> wire, so I'm proposing a patch to nbdkit to support it.  But it raises
> the question on whether allowing EOVERFLOW to any arbitrary command is
> okay, or whether EOVERFLOW should only be exposed over the wire to a
> client that is likely to expect it. The NBD spec added EOVERFLOW as a
> valid error value when commit 7ff2e45e (Apr 2016) promoted structured
> replies to be part of the protocol, so any client that negotiates
> structured replies is thus new enough to expect EOVERFLOW; conversely,
> EOVERFLOW is only documented as being reasonable for the server to send
> in response to a client using NBD_CMD_FLAG_DF to NBD_CMD_READ (again,
> which implies the client negotiated structured replies), and not all
> clients support structured replies.

OTOH, for backcompat reasons it is reasonable to state that older
versions of nbd-server could send pretty much anything over the wire[1],
and that clients should therefore treat any nonzero value as an unknown
error.

I think that might also be a correct way to deal with error numbers in
cases where the client does not know what to do with it.

[1] I originally thought that errno values were way more standardized
than they happen to be in practice, and so the initial error handling in
nbd-server just sent the value of errno, whatever it happened to be,
over the wire. That worked just fine if client and server were the same
platform -- and more so since all the client would ever do when it saw
an error was yell "the server sent error code X" and abort, so that the
actual error number didn't even matter -- but it obviously wasn't ideal;
and when we chose the error values that got written in stone, we chose
the errno values that Linux/x86 uses for the types of errors that seemed
reasonable. What older servers sent is however not really defined, and
therefore should be treated as nasal daemons.

[...]
> SHOULD NOT rather than MUST NOT, as a server may still choose to expose
> non-standard errors over the wire if a client might benefit from those
> errors, and a well-written client will squash non-standard errors
> received over the wire back to EINVAL.

Indeed; I think that is what we should do.

> So the question at hand is whether I should patch the NBD spec to
> recommend that a server SHOULD NOT send EOVERFLOW except in response to
> NBD_CMD_READ when the NBD_CMD_FLAG_DF bit is set (similar to my proposed
> wording that a server SHOULD NOT send ENOTSUP except in response to
> NBD_CMD_FLAG_FAST_ZERO).

I think we can say that, but we should definitely also say that a client
should treat unknown errors in a particular way. Possibly "abort the
connection and give up", but something.

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

