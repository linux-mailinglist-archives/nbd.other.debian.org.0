Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5E3444BA
	for <lists+nbd@lfdr.de>; Thu, 13 Jun 2019 18:39:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0BA2220423; Thu, 13 Jun 2019 16:39:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 13 16:39:08 2019
Old-Return-Path: <roman.stratiienko@globallogic.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AFECA20418
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jun 2019 16:22:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id p0KBwA0OaeOI for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jun 2019 16:21:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0139020399
	for <nbd@other.debian.org>; Thu, 13 Jun 2019 16:21:56 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id z25so32046465edq.9
        for <nbd@other.debian.org>; Thu, 13 Jun 2019 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mz6GIPKtlkGerT/pt6ZWWFPZs8Zmg5qBehaRfeC+EUo=;
        b=EhoeFLRHnBhKbWvy9HbsUZYnmSqkMjgbw/4JBVzBmKwtC2BYciZon/sGwYlwxD2ArB
         820lhaGvsyDxIQBlup+5VKFfAjqc0UgL0AndVHVEjCUhxyB6MYwWpt9rVeipesbYJm9O
         9LctzS/TEIahM6LL9VOCpzIV8wbDeIGYc6LpG/4Ag9cMHwzd7NIdHtF03n3uFJ5oSCsa
         3G8seNu4kPRGCTWh5OLMltNpswqlywnH6ctZu426ea1q3OKYycClQ4ZPMg8bCkDfv5pf
         qrUMZwVvDtNADcRslOs9acphTWeWGkYvfzJ9d44UO3i9kqBf746dXPNN4G9zYO82urgl
         cWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mz6GIPKtlkGerT/pt6ZWWFPZs8Zmg5qBehaRfeC+EUo=;
        b=LdAU7XmsxfCqduvauKf/IaikLO0V5V1ibwgLtHDLZJN4b128lVyOdhHODIsz6nIjSP
         oJXqjbpPcWoXN8r6d2vOxUJniZ1JpR3HUMgToUGlZ7npbLwdHpsS+M+QipaUqT2TnhAh
         ThVilnjZJD1ngH8+t84mavyZFUDGquI/AdujsDw4yxFGA1Ji+lWg7CqE5h9BFqZTFz+N
         ZmCOCRexnnxwoxcRfAwsWBPIcMMTWR8+Y50+V62rXamLoXxX4ioqLM8ksVT3We4ckjMW
         9ocqHrlb2VXDL6ItDAMVEeBDtYpdTt5XzH4XYVbDOquMJ28aGWFECUSHY5aXE93KAwxu
         L5qQ==
X-Gm-Message-State: APjAAAVykNCBBIF08JIRFacceRHtEWajLFlt+BtzIbHV60qjqTBiIraW
	ubvJbc8vvhqsiwbmoIKnYxY4VUE9D7NotPWT+GJpVA==
X-Google-Smtp-Source: APXvYqxuWVuyBpuxXeXaLydjVhfXhrVUHymBl4vNZ13Z3Lq3A6ZwUrJo9f7zawIdyv/dg+ZkFHQ0nrTO50sHeOAATfU=
X-Received: by 2002:a17:906:3948:: with SMTP id g8mr45653628eje.168.1560442914546;
 Thu, 13 Jun 2019 09:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190612163144.18486-1-roman.stratiienko@globallogic.com>
 <20190612163144.18486-2-roman.stratiienko@globallogic.com>
 <20190613135241.aghcrrz7rg2au3bw@MacBook-Pro-91.local> <CAODwZ7v=RSsmVj5GjcvGn2dn+ejLRBHZ79x-+S9DrX4GoXuVaQ@mail.gmail.com>
 <20190613145535.tdesq3y2xy6ycpw7@MacBook-Pro-91.local>
In-Reply-To: <20190613145535.tdesq3y2xy6ycpw7@MacBook-Pro-91.local>
From: Roman Stratiienko <roman.stratiienko@globallogic.com>
Date: Thu, 13 Jun 2019 19:21:43 +0300
Message-ID: <CAODwZ7so4cVVJmPHXGGOxKRO_0L2NjZJac73wfaHPV7ZN6ce1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] nbd: add support for nbd as root device
To: Josef Bacik <josef@toxicpanda.com>
Cc: linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	Aleksandr Bulyshchenko <A.Bulyshchenko@globallogic.com>, linux-block@vger.kernel.org, 
	axboe@kernel.dkn.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FLc4gb7IP7C.A.PDF.swnAdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/591
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAODwZ7so4cVVJmPHXGGOxKRO_0L2NjZJac73wfaHPV7ZN6ce1g@mail.gmail.com
Resent-Date: Thu, 13 Jun 2019 16:39:08 +0000 (UTC)

> I don't doubt you have a good reason to want it, I'm just not clear on why an
> initramfs isn't an option?  You have this special kernel with your special
> option, and you manage to get these things to boot your special kernel right?
> So why is a initramfs with a tiny nbd-client binary in there not an option?
>
> Also I mean that there are a bunch of different nbd servers out there.  We have
> our own here at Facebook, qemu has one, IIRC there's a ceph one.  They all have
> their own connection protocols.  The beauty of NBD is that it doesn't have to
> know about that part, it just does the block device part, and I'd really rather
> leave it that way.  Thanks,
>
> Josef


The only reason I prefer embed client into the kernel is to save
valuable engineering time creating and supporting custom initramfs,
that is not so easy especially on Android-based systems.

Taking into account that if using NBD and creating custom initramfs
required only for automated testing, many companies would choose
manual deployment instead, that is bad for the human progress.

I believe that all users of non-standard NBD handshake protocols could
continue to use custom nbd-clients.

Either you accept this patch or not I would like to pass review from
maintainers and other persons that was involved in NBD development,
thus making a step closer to get this mainlined in some future.

--
Regards,
Roman

