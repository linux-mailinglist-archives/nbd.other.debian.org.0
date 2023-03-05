Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C59AB6AAE9B
	for <lists+nbd@lfdr.de>; Sun,  5 Mar 2023 09:45:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AE9B92081E; Sun,  5 Mar 2023 08:45:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Mar  5 08:45:43 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A3A94204E2
	for <lists-other-nbd@bendel.debian.org>; Sun,  5 Mar 2023 08:45:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id AtACDHLqLBTP for <lists-other-nbd@bendel.debian.org>;
	Sun,  5 Mar 2023 08:45:24 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B9E052081A
	for <nbd@other.debian.org>; Sun,  5 Mar 2023 08:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1xHedHjJQbbL/esM2fTGRJYL0S9fcg1GwIr7aaxHfrI=; b=c7z2KtoOMTTnMEz42SvZFCszd/
	HJyFqmfchovuXGrKqdu07qgOoVDnbw3qRHusq9TaxrmYV+dIlLD7XdvmysbvhmwngFpz13u3l9I6j
	rvCn1f16ibOUUqSq23lboFChueESuMFwsxXeqAiVLXhZfrSLsjjzCd+28DlOMN+xvLFPjx1ReyGLQ
	QpxuWy9NAbdcBEaGZ1sg0M8SrnzCRG0h52hGhZS0RKpV6Bt2XcWEu/aWfJey4iPRWzJANWT+zVJ5m
	GrMk5MSgUYE9/lura2Jjli0jSEo4b3sQEyyb54g5eduL94uDKpZ5zhmTq16CEiwuSnbKzavPHNA50
	8tP1ttFw==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pYjze-0005Lc-Dm; Sun, 05 Mar 2023 09:45:22 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pYjzX-000SAt-0T;
	Sun, 05 Mar 2023 10:45:15 +0200
Date: Sun, 5 Mar 2023 10:45:15 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: Re: [PATCH v2 2/6] spec: Tweak description of maximum block size
Message-ID: <ZARWm7/vh0gMdjEC@pc220518.home.grep.be>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224655.2186173-1-eblake@redhat.com>
 <20221114224655.2186173-3-eblake@redhat.com>
 <Y/ThgdLldvb5rpwA@pc220518.home.grep.be>
 <20230303222653.xivvmvilswu3lii3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303222653.xivvmvilswu3lii3@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OWUSnbg-INO.A.cyB.3aFBkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2349
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZARWm7/vh0gMdjEC@pc220518.home.grep.be
Resent-Date: Sun,  5 Mar 2023 08:45:43 +0000 (UTC)

On Fri, Mar 03, 2023 at 04:26:53PM -0600, Eric Blake wrote:
> On Tue, Feb 21, 2023 at 05:21:37PM +0200, Wouter Verhelst wrote:
> > Hi Eric,
> > 
> > Busy days, busy times. Sorry about the insane delays here.
> 
> No problem; I've been tackling other things in the meantime too, so
> this extension has taken far longer than I planned for more reasons
> than just slow review time.
> 
> > 
> > On Mon, Nov 14, 2022 at 04:46:51PM -0600, Eric Blake wrote:
> > > Commit 9f30fedb improved the spec to allow non-payload requests that
> > > exceed any advertised maximum block size.  Take this one step further
> > > by permitting the server to use NBD_EOVERFLOW as a hint to the client
> > > when a request is oversize (while permitting NBD_EINVAL for
> > > back-compat), and by rewording the text to explicitly call out that
> > > what is being advertised is the maximum payload length, not maximum
> > > block size.  This becomes more important when we add 64-bit
> > > extensions, where it becomes possible to extend `NBD_CMD_BLOCK_STATUS`
> > > to have both an effect length (how much of the image does the client
> > > want status on - may be larger than 32 bits) and an optional payload
> > > length (a way to filter the response to a subset of negotiated
> > > metadata contexts).  In the shorter term, it means that a server may
> > > (but not must) accept a read request larger than the maximum block
> > > size if it can use structured replies to keep each chunk of the
> > > response under the maximum payload limits.
> > > ---
> > >  doc/proto.md | 127 +++++++++++++++++++++++++++++----------------------
> > >  1 file changed, 73 insertions(+), 54 deletions(-)
> > > 
> > > diff --git a/doc/proto.md b/doc/proto.md
> > > index 8f08583..53c334a 100644
> > > --- a/doc/proto.md
> > > +++ b/doc/proto.md
> > > @@ -745,8 +745,8 @@ text unless the client insists on TLS.
> > > 
> > >  During transmission phase, several operations are constrained by the
> > >  export size sent by the final `NBD_OPT_EXPORT_NAME` or `NBD_OPT_GO`,
> > > -as well as by three block size constraints defined here (minimum,
> > > -preferred, and maximum).
> > > +as well as by three block size constraints defined here (minimum
> > > +block, preferred block, and maximum payload).
> > > 
> > >  If a client can honour server block size constraints (as set out below
> > >  and under `NBD_INFO_BLOCK_SIZE`), it SHOULD announce this during the
> > > @@ -772,15 +772,15 @@ learn the server's constraints without committing to them.
> > > 
> > >  If block size constraints have not been advertised or agreed on
> > >  externally, then a server SHOULD support a default minimum block size
> > > -of 1, a preferred block size of 2^12 (4,096), and a maximum block size
> > > -that is effectively unlimited (0xffffffff, or the export size if that
> > > -is smaller), while a client desiring maximum interoperability SHOULD
> > > -constrain its requests to a minimum block size of 2^9 (512), and limit
> > > -`NBD_CMD_READ` and `NBD_CMD_WRITE` commands to a maximum block size of
> > > -2^25 (33,554,432).  A server that wants to enforce block sizes other
> > > -than the defaults specified here MAY refuse to go into transmission
> > > -phase with a client that uses `NBD_OPT_EXPORT_NAME` (via a hard
> > > -disconnect) or which uses `NBD_OPT_GO` without requesting
> > > +of 1, a preferred block size of 2^12 (4,096), and a maximum block
> > > +payload size that is at least 2^25 (33,554,432) (even if the export
> > > +size is smaller); while a client desiring maximum interoperability
> > > +SHOULD constrain its requests to a minimum block size of 2^9 (512),
> > > +and limit `NBD_CMD_READ` and `NBD_CMD_WRITE` commands to a maximum
> > > +block size of 2^25 (33,554,432).  A server that wants to enforce block
> > > +sizes other than the defaults specified here MAY refuse to go into
> > > +transmission phase with a client that uses `NBD_OPT_EXPORT_NAME` (via
> > > +a hard disconnect) or which uses `NBD_OPT_GO` without requesting
> > 
> > This does more than what the commit message says: it also limits payload
> > size from 0xffffffff to 2^25. We already have a "A server that desires
> > maximum interoperability" clause that mentions the 2^25, so I'm not
> > entirely sure why we need to restrict that for the default cause.
> > 
> > Remember, apart from specifying how something should be implemented, the
> > spec also documents current and historic behavior. I am probably
> > convinced that it makes more sense to steer people towards limiting to
> > 2^25, but it should be done in such a way that servers which accept a
> > 0xffffffff block size are not suddenly noncompliant. I don't think this
> > does that.
> 
> I'll have to play more with the wording here.  A client shouldn't send
> larger write requests to a server without knowing the server will
> accept it (because traditional servers disconnect instead - the
> alternative is to read the client's entire payload, and the larger the
> payload is, the longer that takes - the client is starving the server
> from serving other clients by making it chew through data).

Well, in the case of a preforking server (like nbd-server), that isn't
really the case, the client is instead only starving itself. But yeah.

>  But sending larger read requests MAY be tolerated by a server that
>  sends a graceful error message ("you requested more than I'm willing
>  to send, but my error response is short so the connection can stay
>  open"), even if several historical implementations have also hung up
>  at that point (at least qemu implements a malloc() call for both read
>  and writes; reads populate the buffer from the client, writes
>  populate the buffer to send back to the client - the connection is
>  aborted when the malloc() is not attempted because it exceeds 2^25
>  bytes).

Yeah, nbd-server does that too, except for the abortion. At least intentionally
so; again, since it's a preforking server, the worst that can happen here is
that it gets an ENOMEM, at which point it will just die, which causes the
client to lose its connection and nothing else.

> But I also see your point about not declaring a server non-compliant
> merely because it allows for a larger payload, nor a client that sends
> larger payloads to a known-happy server that accepts those payloads.
> nbdkit historically chose 64M as its limits instead of qemu's 32M.

Right, thanks.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

