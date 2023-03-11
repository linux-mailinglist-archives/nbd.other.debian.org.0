Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FFA6B5B67
	for <lists+nbd@lfdr.de>; Sat, 11 Mar 2023 13:00:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 69DC220617; Sat, 11 Mar 2023 12:00:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 11 12:00:17 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 313F7205FD
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 Mar 2023 12:00:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IJrUlX9MEqBu for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 Mar 2023 12:00:01 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9A1282060F
	for <nbd@other.debian.org>; Sat, 11 Mar 2023 12:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GFL+0PTHSxjLZTQNd6zQIczun1Gy7NgnycqAYZ12s6A=; b=mDqi2Y0NBDnAG35YSq3qRgM4Wk
	3QFgDdov5fO/QqOs90L0pkYPA0TvjUK+zN5FjYnhzFeF0tb+MqCs5dXFTKrbaq3cF/zbhkzJ/gW/j
	9lVczcZbO1WGLz9RlJCFT9pahVC5vABU3Ob2G+poNRIyCMhgJH0cNCUrPHRV6ovld4I7+a1cHYB8G
	1h1fWPosX2b+qTG12DwzLHW9y1SVRuxfvHUs+H1Kf+7/PfQIfeTkUqx+5+wpfWc23MUPGe2HHejGz
	RQnGXtWnPT03IrFM+TXeogQbREGWW4oNrcjmQGNh2hmybbb+RfMN3eB5QEU3xH2n0XoW21obk132I
	ZH40K+JA==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1paxtG-0052Rm-9U; Sat, 11 Mar 2023 12:59:58 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1paxt7-0011Rl-0X;
	Sat, 11 Mar 2023 13:59:49 +0200
Date: Sat, 11 Mar 2023 13:59:49 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org
Subject: Re: Structured replies in nbd-server
Message-ID: <ZAxtNXhMfq1w3h/m@pc220518.home.grep.be>
References: <ZAdyUMh80sxzluyX@pc220518.home.grep.be>
 <20230309211913.wptrs2u4amjsq5re@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309211913.wptrs2u4amjsq5re@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7JuHnjSQePK.A.oJ.R1GDkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2373
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZAxtNXhMfq1w3h/m@pc220518.home.grep.be
Resent-Date: Sat, 11 Mar 2023 12:00:17 +0000 (UTC)

So, to provide some feedback:

On Thu, Mar 09, 2023 at 03:19:13PM -0600, Eric Blake wrote:
> On Tue, Mar 07, 2023 at 07:20:16PM +0200, Wouter Verhelst wrote:
> > Hi,
> > 
> > I've finally been working on structured replies in nbd-server (what?
> > it's only been 7 years), and today I managed to make it go through
> > nbdkit's "nbddump" without crashing. (yay!)
> 
> 'nbddump' comes from the libnbd project (client side), not nbdkit
> (server side).  But the two are closely related ;) And I'm glad to see
> that it helped you!
> 
> > 
> > I'm currently not (yet) implementing any other features that depend on
> > structured replies, but would like to see if people can poke holes in
> > what I've done so far -- I'd like to find bugs before release, rather
> > than after ;-)
> > 
> > The code is in the "structured" branch of
> > https://github.com/NetworkBlockDevice/nbd and feedback is more than
> > welcome.
> 
> Since you didn't post the code to the list, I've likewise only left my
> review comments on the patches on github.  If we want to copy the
> discussion to the list, I can do that too.

Some of your comments were:

>  I don't know if it is worth trying to piggyback
>  NBD_REPLY_FLAG_DONE to the last data or error chunk instead for less
>  network traffic, but the spec (intentionally) does not mandate that
>  optimization.

Yeah, I considered that but decided against it in the end. The extra
bookkeeping that would be required to be able to implement that felt
like too much effort to me.

(I did notice that I forgot to send the DONE flag in the case the client
sent the DF flag, which seems like a massive error -- will need to fix
that)

>  Maybe word the comment as "standard requires a minimum of 64KiB; we are
>  more generous by allowing up to 1MiB as our largest unfragmented
>  answer"

Thanks, that does sound better. Modified as such.

>  BUG - you must ALSO do socket_read() of len bytes, or disconnect
>  (particularly if len is larger than any NBD_OPT_ request you are
>  willing to accept) - otherwise, you are now out of sync with the
>  client's next request.

Thanks, good catch. Will be fixed for v2.

>  Reuse consume_len() for this purpose, rather than open-coding it. At
>  which point, do you really need buf[1024], or can you just directly
>  socket_read(&len)?

consume_len() is implemented in terms of consume(), but only accepts a
CLIENT* parameter, and expects to read the length from the socket first.
We've already done that at this point, so we can't. However, we can call
consume(), which does need a buffer (so that means we'll have keep it
then).

>  Possible improvement: if F_STRUCTURED is already set in
>  client->clientflags, the spec allows but does not require you to reply
>  NBD_REP_EINVAL to point out the client's redundant request.

That is indeed simple enough to implement, so added that, thanks.

>  BUG - this won't compile when TLS is linked in (clientflags, not
>  clientfeats). But you are correct that you must remove F_STRUCTURED
>  from client->clientflags during handling of NBD_OPT_STARTTLS, and blind
>  assignment to 0 also wipes out any other features we may add over time.

Indeed, I wiped out the wrong variable :-D

Thanks, good catch. Fixed for v2.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

