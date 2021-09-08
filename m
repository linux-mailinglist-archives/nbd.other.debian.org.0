Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B7B4039AF
	for <lists+nbd@lfdr.de>; Wed,  8 Sep 2021 14:24:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 172A920877; Wed,  8 Sep 2021 12:24:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  8 12:24:42 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 5AF8220831
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Sep 2021 12:24:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lpEhEPJFy6oN for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Sep 2021 12:24:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 044802081A
	for <nbd@other.debian.org>; Wed,  8 Sep 2021 12:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tN+x6ieH1oAnvbZ5AbIV4XrNONI8s450tShPRkQojQg=; b=miT7SNwqE73rdCEUyMGI0yP8Ff
	mzxuptFFRl/Orgz1VGemXj1BIIX6dNqDPk+mUeM3dMhi61xxpTrlXUG8a5sHBCy1I1MNGTkFKaWF+
	n8BwzEdVeMm+BeW0diKpfT91K6QxGBuESRY2MFPDErFdGGdhoCDDNNcm5C227uN+fuDlbKX80kxgV
	NgptE8iTltk0qpFyBR+KNU1ArgoPME/bPDT/tTackyM0hb4PYBBNbnW4RgruyQtf9ZNmwpdmWeW3P
	9+pTSZD3gTj+0uzY7A7wra7+pJNDJnFwlyvsc6U4gvggbR8VpdEeUTFmVXzdPD8LijhAyroQLQilQ
	hJPv4GuQ==;
Received: from [102.39.151.73] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mNwcj-00Gybb-3w; Wed, 08 Sep 2021 14:24:17 +0200
Received: from wouter by pc181009 with local (Exim 4.95-RC2)
	(envelope-from <w@uter.be>)
	id 1mNwcZ-0002Bs-Cz;
	Wed, 08 Sep 2021 14:24:07 +0200
Date: Wed, 8 Sep 2021 14:24:07 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: Josh Triplett <josh@joshtriplett.org>, nbd@other.debian.org
Subject: Re: Linux kernel NBD driver support for structured replies?
Message-ID: <YTirZ88kN13gqqfp@pc181009.grep.be>
References: <YTfXZDs4YHrxHYJe@localhost>
 <20210907213513.aq5qxd3d6v3ss676@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907213513.aq5qxd3d6v3ss676@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <D0JYQL2rHJF.A.RdE.KuKOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1417
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTirZ88kN13gqqfp@pc181009.grep.be
Resent-Date: Wed,  8 Sep 2021 12:24:42 +0000 (UTC)

On Tue, Sep 07, 2021 at 04:35:13PM -0500, Eric Blake wrote:
> On Tue, Sep 07, 2021 at 02:19:32PM -0700, Josh Triplett wrote:
> > Does that seem reasonable to add to the kernel driver? I wanted to check
> > before considering development of a patch.
> 
> I'm not aware of anyone else doing it yet (I haven't yet been brave
> enough to dive into implementing this in the kernel, although I have
> implemented it in user space in both qemu and libnbd).  I'm certainly
> happy to help with integration testing, or give you tips on how to
> test it.

It's been on my low-priority TODO list since essentially when we
hammered down the spec, and even had a half-baked preliminary patch at
one point, but other things just keep being more urgent than that. I
won't complain if you implement it instead of me :)

Some thoughts you'll want to consider:

The kernel doesn't do the negotiation phase, only the transmission
phase; the negotiation phase is done in user space. This means the
client needs to figure out whether the currently-running kernel even
supports structured replies before it can negotiate them (otherwise the
kernel will be horribly confused). My half-baked patch would create a
driver sysfs attribute called "features" which just shows
"structured_replies" if they are supported by this kernel (the idea
being that the file could be extended in the future to also show
"metadata" if that ends up being supported, etc).

I was thinking it might also make sense to have an initial version of
structured replies set the "don't fragment" bit unconditionally, to keep
the accounting easier. Not sure whether that's worth it, though (never
got that far).

Obviously the server currently doesn't implement structured replies, and
implementing that properly could end up being somewhat complicated. I've
started working on that part of the equation recently, however.

Regards,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

