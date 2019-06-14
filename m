Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B785245FA3
	for <lists+nbd@lfdr.de>; Fri, 14 Jun 2019 15:54:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 90E9A20565; Fri, 14 Jun 2019 13:54:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 14 13:54:08 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 89B3C20556
	for <lists-other-nbd@bendel.debian.org>; Fri, 14 Jun 2019 13:38:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2ir6mmJY4F0V for <lists-other-nbd@bendel.debian.org>;
	Fri, 14 Jun 2019 13:38:09 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4F79420555
	for <nbd@other.debian.org>; Fri, 14 Jun 2019 13:38:09 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d23so2475749qto.2
        for <nbd@other.debian.org>; Fri, 14 Jun 2019 06:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5t38AdsOWv2f4Esw1W+MkepSRzr1WITdyAORH+5HjYw=;
        b=RDZZZjUcgP1IQISh2OS0tjJq7h2lcyaLEZF4ZlCEaiFMBb9xylkmRKTOFdBqzT4CmS
         pPUNoWCPpe3HFF/pMsbtof/jbvEp5RIksEwku+dWkHcrlYJ26kD9Dqq5vGTtWz2qLZsm
         VigUHIj4paQ6Tly6gHAio3+6dTylmk0AM/qW0Xa+828w0olfCI3nAOPWG3ZBTFlUUwjr
         9ow0YUAkq1hZQxV/aVZ/hWkdJ/YlB0EkCruIxzq+fKMxvsU6C/q0Q9meiBgvgag9IWlF
         nccl5LY9zCXLLTksQBIci7LGgigiZ7vLU/6wZgWVN3V/czpvgZ2WGFhaN6Pw1JJ3t5FP
         dI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5t38AdsOWv2f4Esw1W+MkepSRzr1WITdyAORH+5HjYw=;
        b=YIsrcVCmcGA152PNdMxJ4kjm+KbKcCwq6MgTymHf3STNkajGVKpMM7SnvxYJ4vT96n
         OFYRJGbGkI5Jw3Qt3c9yjTdhtwIaaFFHAb3lr4eYkaV/jViVLZMTqW9hTyzcuTtWyMDs
         FyF/ad4luVQMgWW+7hPhY5I/ChwUGr7hXQagY9gwVtfE6TM02p0DgItThOARuUaxe+2f
         l4aIIniq6vr/e8fSQLy3NeYdgU0tITACa5BD6471zrWUrwFZFhotlKL5EaUbQD7T0W2T
         1dPOv7NINWdm53MCTrCGH6GR1nuR0HjdX0PU80JmbWnPLVMpocF3bPqwgo+/rxaH6w9A
         aVIw==
X-Gm-Message-State: APjAAAVdYrQNYU6kxl/qnpZ859U/o9/Uh1q+hiaWLdSkncQdF7Kg9idV
	TSibrA+onzWtZnerSjktFgq/IA==
X-Google-Smtp-Source: APXvYqzNmd+0+Nn6Q5ZrbPLFXLvgSb2BGcTgyraQHFgk83zTbcB39HZrH2xAznSe9nH6+xMmLCqDLg==
X-Received: by 2002:ac8:2fa8:: with SMTP id l37mr78660838qta.358.1560519486142;
        Fri, 14 Jun 2019 06:38:06 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::a658])
        by smtp.gmail.com with ESMTPSA id t67sm1449588qkf.34.2019.06.14.06.38.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 06:38:05 -0700 (PDT)
Date: Fri, 14 Jun 2019 09:38:04 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Wouter Verhelst <w@uter.be>
Cc: Josef Bacik <josef@toxicpanda.com>,
	Roman Stratiienko <roman.stratiienko@globallogic.com>,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	Aleksandr Bulyshchenko <A.Bulyshchenko@globallogic.com>,
	linux-block@vger.kernel.org, axboe@kernel.dkn.org
Subject: Re: [PATCH 2/2] nbd: add support for nbd as root device
Message-ID: <20190614133802.vg3w3sxpid2fpbp4@MacBook-Pro-91.local>
References: <20190612163144.18486-1-roman.stratiienko@globallogic.com>
 <20190612163144.18486-2-roman.stratiienko@globallogic.com>
 <20190613135241.aghcrrz7rg2au3bw@MacBook-Pro-91.local>
 <CAODwZ7v=RSsmVj5GjcvGn2dn+ejLRBHZ79x-+S9DrX4GoXuVaQ@mail.gmail.com>
 <20190613145535.tdesq3y2xy6ycpw7@MacBook-Pro-91.local>
 <20190614103343.GB11340@grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614103343.GB11340@grep.be>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <96udBG4Dp9E.A.PGC.Ac6AdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/594
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190614133802.vg3w3sxpid2fpbp4@MacBook-Pro-91.local
Resent-Date: Fri, 14 Jun 2019 13:54:08 +0000 (UTC)

On Fri, Jun 14, 2019 at 12:33:43PM +0200, Wouter Verhelst wrote:
> On Thu, Jun 13, 2019 at 10:55:36AM -0400, Josef Bacik wrote:
> > Also I mean that there are a bunch of different nbd servers out there.  We have
> > our own here at Facebook, qemu has one, IIRC there's a ceph one.
> 
> I can't claim to know about the Facebook one of course, but the qemu one
> uses the same handshake protocol as anyone else. The ceph ones that I've
> seen do too (but there are various implementations of that, so...).
> 

Ah, for some reason I remembered Qemu's being distinctly different.

I suppose if most of the main ones people use are using the same handshake
protocol that makes it more compelling.  But there'd have to be a really good
reason why a initramfs isn't viable, and so far I haven't heard a solid reason
that's not an option other than "it's hard and we don't want to do it."

> > They all have their own connection protocols.  The beauty of NBD is
> > that it doesn't have to know about that part, it just does the block
> > device part, and I'd really rather leave it that way.  Thanks,
> 
> Sure.
> 
> OTOH, there is definitely also a benefit to using the same handshake
> protocol everywhere, for interoperability reasons.
> 

Sure, Facebook's isn't different because we hate the protocol, we just use
Thrift for all of our services, and thus it makes sense for us to use thrift for
the client connection stuff to make it easy on all the apps that use disagg.
Thanks,

Josef

