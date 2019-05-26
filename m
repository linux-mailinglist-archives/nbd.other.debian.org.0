Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 713CE2A940
	for <lists+nbd@lfdr.de>; Sun, 26 May 2019 12:19:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 34B3C20417; Sun, 26 May 2019 10:19:48 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May 26 10:19:48 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7DF1F20469
	for <lists-other-nbd@bendel.debian.org>; Sun, 26 May 2019 10:19:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bYRD1XbLvUwx for <lists-other-nbd@bendel.debian.org>;
	Sun, 26 May 2019 10:19:36 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 02AA4203F9
	for <nbd@other.debian.org>; Sun, 26 May 2019 10:19:35 +0000 (UTC)
Received: from [197.89.111.44] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <w@uter.be>)
	id 1hUqFT-0008PO-Ks; Sun, 26 May 2019 12:19:32 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1hUqFB-0003Ov-3w; Sun, 26 May 2019 12:19:09 +0200
Date: Sun, 26 May 2019 12:19:08 +0200
From: Wouter Verhelst <w@uter.be>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, eblake@redhat.com, nsoffer@redhat.com,
	berrange@redhat.com, mkletzan@redhat.com
Subject: Re: [PATCH for discussion] doc: Define a standard URI syntax for NBD
 URIs.
Message-ID: <20190526101908.GC6936@grep.be>
References: <20190525170518.4799-1-rjones@redhat.com>
 <20190526081532.GA6936@grep.be>
 <20190526090018.GO9582@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190526090018.GO9582@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1tlF9YH-okP.A.l5B.Ehm6cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/525
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190526101908.GC6936@grep.be
Resent-Date: Sun, 26 May 2019 10:19:48 +0000 (UTC)

On Sun, May 26, 2019 at 10:00:18AM +0100, Richard W.M. Jones wrote:
> I intended to write a cover letter, got distracted while sending it
> and forgot ...
> 
> Anyway I was going to say:
> 
>  - There's no way to specify abstract Unix domain sockets.  Should
>    there be?  I'm not aware of any server that supports them.  Luckily
>    the common approach of using `@` at the beginning should work:
>    https://unix.stackexchange.com/questions/206386/what-does-the-symbol-denote-in-the-beginning-of-a-unix-domain-socket-path-in-l

It's probably a good idea, yes, even if indeed no current implementation
supports them.

(That being said, abstract UDSes are a Linux-specific feature, so...)

>  - As Wouter already picked up in his review, should we allow a
>    default Unix domain socket?  The corollary to this is: Should we
>    make the authority mandatory for TCP/IP sockets?  Are there
>    sensible defaults for the authority (localhost:10809 probably).

Yeah, that could be a sensible default, depending on the implementation.
Your document makes it clear that it's implementation-dependent though,
so I shouldn't worry about it too much.

>  - I notice that proto.md has a text symlink (proto.txt).  Would we
>    need one for url.txt -> url.md?

No.

The original protocol definition document was a .txt file. When I
restructured it and converted it to a markdown one, I added a symlink in
place, because there were some locations (QEMU, amongst others) that
linked to the .txt file, and I didn't want to break links.

This would be a new document, so there are no links to break.

(I guess the need for that backcompat symlink has subsided now and I can
remove it, but meh)

> Wouter Verhelst wrote:
> > Should we perhaps also add query parameters for certificate-based
> > authentication?
> 
> I think yes, although it could get complicated to define them all.

True, which is why I asked the question rather than suggesting we do ;-)

> qemu's NBD client needs a directory name, which contains certificates
> with particular names (see Dan's second example here:
> https://www.berrange.com/posts/2016/04/05/improving-qemu-security-part-5-tls-support-for-nbd-server-client/
> ).  If we were to specify every file by name then it would require
> probably 3 or 4 extra parameters (CA cert, client cert, client private
> key file, and optionally revocation list).

That's what nbd-client and nbd-server expect, FWIW.

> For TLS-PSK it only needs the path to the PSK key file.  The username
> is already provided in the userinfo authority field.

Right.

> We might also consider a tls type parameter to switch between X.509
> certs, PSK and anon.

There is that too, yes.

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

