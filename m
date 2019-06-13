Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4308D448BE
	for <lists+nbd@lfdr.de>; Thu, 13 Jun 2019 19:12:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0E01C2042B; Thu, 13 Jun 2019 17:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 13 17:12:09 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E618A202C6
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jun 2019 16:54:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CKxj_wDRFeBg for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jun 2019 16:54:52 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x743.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DEBA02034B
	for <nbd@other.debian.org>; Thu, 13 Jun 2019 16:54:51 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id x18so1210159qkn.13
        for <nbd@other.debian.org>; Thu, 13 Jun 2019 09:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yOlq9/cnKUf58RBN8U9nKcy5UZOs9qGQCumfqe7jZ8c=;
        b=gpHQ/bLmEGM/wfem9wjHlttvx5YiGjPwT/u36I7n7oSVzWpFpHjYj2L4hUjv4lm9XO
         88kzzQeW7JVz92cBQKqYiwLJEzdL4TVeLyPtZIvyGS4sTz1YMqYNAcVwAOiYu1DZ88uj
         imlKcFuW+ag52SlfM+r8drN5Rmpdu+YZCUxJJb6fQv3fEFfuOUHlloiz0kM5x8Zkl9du
         Vb03W/0Vn/7Svv9YarlOhUO3OOzNsqNb9ZENAauxnuBucS+p02IPc+Us5GhfTSTPrXwV
         tUSxOg8HGjp0M7ClHrKamigpXbDoaOSfkOuXpgz5saGaeyigGTAIJjT/pVPBCGI8LqPb
         p9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yOlq9/cnKUf58RBN8U9nKcy5UZOs9qGQCumfqe7jZ8c=;
        b=AGaTs1gGskLjd+D2Qv6gfVCc33vHs7YMwBbk24criBKQxoXvdOKOnmvlkqi1ub8diu
         G9twKRbHWOTDtrc39FUyRz46QvMiel4Q31j+FuRra+I8dgXH0VKoKEy9zr+zVnzFu9Pn
         BGjAQZzqKbBFRAphp5G6aq5afip4KWah83Grl0RMg57QwZwo1SAuKkcMmoH78g3SIp3j
         sks9U40La1Wen86mOMJ47E3/s/GKuqn9N/8qZ9jH7un3MrGxnLbOA+gcXWND54l26cb2
         3Ghn/leKz3oNeKP2rW1ZRjXo4K6sE6ANdTxxjTJ8wxUlEX95wf5pAhAM3jDmkZ8EnlFc
         rRGA==
X-Gm-Message-State: APjAAAWG11ghkM1Gbz0KzAfGfG+88sAGrN1jiBOiqiFo2nR+lh2oDJ0m
	feRGzIXu2UqZSrzoIjYfaLjPiA==
X-Google-Smtp-Source: APXvYqxyuH5IBObnKkcdS09bJVE6NC5rFdmbqwiDVXyLYGh2OnmAzufcVgAM1WT2j6xoZWPRgOuCnA==
X-Received: by 2002:a37:9bca:: with SMTP id d193mr72859834qke.122.1560444888347;
        Thu, 13 Jun 2019 09:54:48 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::d1])
        by smtp.gmail.com with ESMTPSA id x10sm138866qtc.34.2019.06.13.09.54.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 09:54:47 -0700 (PDT)
Date: Thu, 13 Jun 2019 12:54:46 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Roman Stratiienko <roman.stratiienko@globallogic.com>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	Aleksandr Bulyshchenko <A.Bulyshchenko@globallogic.com>,
	linux-block@vger.kernel.org, axboe@kernel.dkn.org
Subject: Re: [PATCH 2/2] nbd: add support for nbd as root device
Message-ID: <20190613165444.kfd53humatuv5j2w@MacBook-Pro-91.local>
References: <20190612163144.18486-1-roman.stratiienko@globallogic.com>
 <20190612163144.18486-2-roman.stratiienko@globallogic.com>
 <20190613135241.aghcrrz7rg2au3bw@MacBook-Pro-91.local>
 <CAODwZ7v=RSsmVj5GjcvGn2dn+ejLRBHZ79x-+S9DrX4GoXuVaQ@mail.gmail.com>
 <20190613145535.tdesq3y2xy6ycpw7@MacBook-Pro-91.local>
 <CAODwZ7so4cVVJmPHXGGOxKRO_0L2NjZJac73wfaHPV7ZN6ce1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwZ7so4cVVJmPHXGGOxKRO_0L2NjZJac73wfaHPV7ZN6ce1g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LsQKeUANrVF.A.6sB.pPoAdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/592
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190613165444.kfd53humatuv5j2w@MacBook-Pro-91.local
Resent-Date: Thu, 13 Jun 2019 17:12:09 +0000 (UTC)

On Thu, Jun 13, 2019 at 07:21:43PM +0300, Roman Stratiienko wrote:
> > I don't doubt you have a good reason to want it, I'm just not clear on why an
> > initramfs isn't an option?  You have this special kernel with your special
> > option, and you manage to get these things to boot your special kernel right?
> > So why is a initramfs with a tiny nbd-client binary in there not an option?
> >
> > Also I mean that there are a bunch of different nbd servers out there.  We have
> > our own here at Facebook, qemu has one, IIRC there's a ceph one.  They all have
> > their own connection protocols.  The beauty of NBD is that it doesn't have to
> > know about that part, it just does the block device part, and I'd really rather
> > leave it that way.  Thanks,
> >
> > Josef
> 
> 
> The only reason I prefer embed client into the kernel is to save
> valuable engineering time creating and supporting custom initramfs,
> that is not so easy especially on Android-based systems.
> 

I'm unconvinced that creating an initramfs is any harder than building your own
kernel with this patch and providing the configuration information to the
device, especially for android where we inside of Facebook provision android
devices with a custom initramfs all the time, and have done so for many, many
years.

> Taking into account that if using NBD and creating custom initramfs
> required only for automated testing, many companies would choose
> manual deployment instead, that is bad for the human progress.
> 
> I believe that all users of non-standard NBD handshake protocols could
> continue to use custom nbd-clients.

There is no "standard NBD handshake protocol" is my point.  That part exists
outside of the NBD spec that the kernel is concerned with.  The client is happy
to do whatever it pleases.  Now there's no doubt that the standard nbd client
and server that is shipped is the reference spec, but my point is that it is
still outside the kernel and so able to change as it sees fit.

> 
> Either you accept this patch or not I would like to pass review from
> maintainers and other persons that was involved in NBD development,
> thus making a step closer to get this mainlined in some future.

...I am the maintainer, but feel free to try to get Jens to take a patch that I
think is unnecessary.  Thanks,

Josef

