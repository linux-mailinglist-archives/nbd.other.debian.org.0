Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0E646BD5
	for <lists+nbd@lfdr.de>; Fri, 14 Jun 2019 23:24:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F0F0D2052F; Fri, 14 Jun 2019 21:24:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 14 21:24:19 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 30D272052D
	for <lists-other-nbd@bendel.debian.org>; Fri, 14 Jun 2019 21:24:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wjm87dT_H2TY for <lists-other-nbd@bendel.debian.org>;
	Fri, 14 Jun 2019 21:24:09 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2113720528
	for <nbd@other.debian.org>; Fri, 14 Jun 2019 21:24:08 +0000 (UTC)
Received: from [105.227.108.147] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <w@uter.be>)
	id 1hbtg3-0004xK-TZ; Fri, 14 Jun 2019 23:24:04 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1hbtfv-0006f9-AY; Fri, 14 Jun 2019 23:23:55 +0200
Date: Fri, 14 Jun 2019 23:23:54 +0200
From: Wouter Verhelst <w@uter.be>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Roman Stratiienko <roman.stratiienko@globallogic.com>,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	Aleksandr Bulyshchenko <A.Bulyshchenko@globallogic.com>,
	linux-block@vger.kernel.org, axboe@kernel.dkn.org
Subject: Re: [PATCH 2/2] nbd: add support for nbd as root device
Message-ID: <20190614212354.GA24581@grep.be>
References: <20190612163144.18486-1-roman.stratiienko@globallogic.com>
 <20190612163144.18486-2-roman.stratiienko@globallogic.com>
 <20190613135241.aghcrrz7rg2au3bw@MacBook-Pro-91.local>
 <CAODwZ7v=RSsmVj5GjcvGn2dn+ejLRBHZ79x-+S9DrX4GoXuVaQ@mail.gmail.com>
 <20190613145535.tdesq3y2xy6ycpw7@MacBook-Pro-91.local>
 <20190614103343.GB11340@grep.be>
 <20190614133802.vg3w3sxpid2fpbp4@MacBook-Pro-91.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614133802.vg3w3sxpid2fpbp4@MacBook-Pro-91.local>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <v9UcaVVlNGL.A.snE.DCBBdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/595
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190614212354.GA24581@grep.be
Resent-Date: Fri, 14 Jun 2019 21:24:19 +0000 (UTC)

On Fri, Jun 14, 2019 at 09:38:04AM -0400, Josef Bacik wrote:
> On Fri, Jun 14, 2019 at 12:33:43PM +0200, Wouter Verhelst wrote:
> > On Thu, Jun 13, 2019 at 10:55:36AM -0400, Josef Bacik wrote:
> > > Also I mean that there are a bunch of different nbd servers out there.  We have
> > > our own here at Facebook, qemu has one, IIRC there's a ceph one.
> > 
> > I can't claim to know about the Facebook one of course, but the qemu one
> > uses the same handshake protocol as anyone else. The ceph ones that I've
> > seen do too (but there are various implementations of that, so...).
> > 
> 
> Ah, for some reason I remembered Qemu's being distinctly different.
> 
> I suppose if most of the main ones people use are using the same handshake
> protocol that makes it more compelling.  But there'd have to be a really good
> reason why a initramfs isn't viable, and so far I haven't heard a solid reason
> that's not an option other than "it's hard and we don't want to do it."

Oh, I agree with that. It's not hard at all; I'm aware of two
implementations of doing that (I've written an nbd initramfs hook for
Debian's initramfs infrastructure, and others have done it for dracut).
I'm assuming that buildroot will have an initramfs framework too (and if
it doesn't, then that probably just means someone should write it), and
then writing an nbd initramfs hook for that framework should be
reasonably easy.

Also, the proposed initramfs configuration protocol uses the same
"nbdroot" name as my Debian initramfs hooks, but in an incompatible way.
I'd really like to see that be done differently, before/if it's accepted
at all ;-)

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

