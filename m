Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CC3674228
	for <lists+nbd@lfdr.de>; Thu, 19 Jan 2023 20:06:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F12C920BE7; Thu, 19 Jan 2023 19:06:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 19 19:06:15 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=AVAILABLENOW,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MURPHY_FINANCE10,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E68CD20BCC
	for <lists-other-nbd@bendel.debian.org>; Thu, 19 Jan 2023 18:49:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.489 tagged_above=-10000 required=5.3
	tests=[AVAILABLENOW=1, BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	FOURLA=0.1, MURPHY_FINANCE10=0.5, NICE_REPLY_A=-0.089,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cXm0OcLxp5lz for <lists-other-nbd@bendel.debian.org>;
	Thu, 19 Jan 2023 18:49:12 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x135.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9FB0320BC2
	for <nbd@other.debian.org>; Thu, 19 Jan 2023 18:49:09 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id r19so1253195ilt.7
        for <nbd@other.debian.org>; Thu, 19 Jan 2023 10:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3wtwBFRkiv3X+2Mf5N6N6dytbuxwHCKEX2M461yzzZ4=;
        b=lMBkz8QDQPnPHUB4vYgP2C+JhfxfjbUPZ3Fr4QrobFtcxonCwGXYQIv+WOOb9XCEZy
         KhDKaf8dD4BVHOo9XTpbEvyj4y7+qdfhqxF2IJdcniC06Q1IWYIvGM3LYh872UF5c5wI
         RaTcO3g2pyey0WFLyj/8o1QrSoqVW+pBA57z7fWqpxc1WuIBTDQVoftwhoy4LDrbsz2X
         jJyfZTlbrwCnyUIPkwzJyqJlPpR09CvvZYLkBGUkpZevGgp3N8+Mo43t4ujg1CVg9uao
         AMhmFjZAv/6ELk8+w+ExsDR2dCIGQB58xVB+yVcqbnsj6e+fGVRxFT4LG4LYGQuQAWVc
         lMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3wtwBFRkiv3X+2Mf5N6N6dytbuxwHCKEX2M461yzzZ4=;
        b=vw/XcY3VPvUY9JtlAR7RUXgJYK2b5/P4rE0RdASk8yowRKChlUYgMiK16xgIUP7RDW
         HCv0RdndEheQ6ixQak9SJ0dHCKTrhxZ64qI+vYOy2Dzud4HZzoQkP6LwXxTdRBTbHjGk
         vHY2GkCwgkHHTo4lVxQY8YOpY/8LypTpQ4Xy84T01NvjUmcfejg0GIspIA21GaxpjvUJ
         wIRwkh0VCqrbKXGnxAHRhKGoJPKHxp+fwGkXIbiH2gfZu9jdPnxs4LdU0NO/K5RG8/m0
         E/mjr4IKLqzzmW/CVoxJQ+dVTF+KDEwLPG62hqnyF5ZRhpzLVuvranbqjimDVvvyC+3u
         FGSA==
X-Gm-Message-State: AFqh2kqM/eawN4qNPaJmranDiggiRrfc4ueclnI5oayc1pfwavxtx7pm
	CZpjEnXAd3w0oGleNvjW9FpvNg==
X-Google-Smtp-Source: AMrXdXuOIDv/Uc+qYNqeQ8Q8kAd4DMYl/OagR+jmXwMlKcHcWIjFQRndKUZEf8kRrQA9a4OoOFaVEg==
X-Received: by 2002:a92:d342:0:b0:30b:c9ec:fc23 with SMTP id a2-20020a92d342000000b0030bc9ecfc23mr2013949ilh.2.1674154145943;
        Thu, 19 Jan 2023 10:49:05 -0800 (PST)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id a88-20020a029461000000b0039e5786d7b7sm11754955jai.18.2023.01.19.10.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 10:49:05 -0800 (PST)
Message-ID: <4f22f15f-c15f-5fba-1569-3da8c0f37f0e@kernel.dk>
Date: Thu, 19 Jan 2023 11:49:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: ublk-nbd: ublk-nbd is avaialbe
Content-Language: en-US
To: Ming Lei <ming.lei@redhat.com>, io-uring@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 nbd@other.debian.org
References: <Y8lSYBU9q5fjs7jS@T590>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Y8lSYBU9q5fjs7jS@T590>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <o4ehpQug5mO.A.gfD.nSZyjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2320
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4f22f15f-c15f-5fba-1569-3da8c0f37f0e@kernel.dk
Resent-Date: Thu, 19 Jan 2023 19:06:15 +0000 (UTC)

On 1/19/23 7:23 AM, Ming Lei wrote:
> Hi,
> 
> ublk-nbd[1] is available now.
> 
> Basically it is one nbd client, but totally implemented in userspace,
> and wrt. current nbd-client in [2], the transmission phase is done
> by linux block nbd driver.
> 
> The handshake implementation is borrowed from nbd project[2], so
> basically ublk-nbd just adds new code for implementing transmission
> phase, and it can be thought as moving linux block nbd driver into
> userspace.
> 
> The added new code is basically in nbd/tgt_nbd.cpp, and io handling
> is based on liburing[3], and implemented by c++20 coroutine, so
> everything is done in single pthread totally lockless, meantime turns
> out it is pretty easy to design & implement, attributed to ublk framework,
> c++20 coroutine and liburing.
> 
> ublk-nbd supports both tcp and unix socket, and allows to enable io_uring
> send zero copy via command line '--send_zc', see details in README[4].
> 
> No regression is found in xfstests by using ublk-nbd as both test device
> and scratch device, and builtin test(make test T=nbd) runs well.
> 
> Fio test("make test T=nbd") shows that ublk-nbd performance is
> basically same with nbd-client/nbd driver when running fio on real
> ethernet link(1g, 10+g), but ublk-nbd IOPS is higher by ~40% than
> nbd-client(nbd driver) with 512K BS, which is because linux nbd
> driver sets max_sectors_kb as 64KB at default.
> 
> But when running fio over local tcp socket, it is observed in my test
> machine that ublk-nbd performs better than nbd-client/nbd driver,
> especially with 2 queue/2 jobs, and the gap could be 10% ~ 30%
> according to different block size.

This is pretty nice! Just curious, have you tried setting up your
ring with

p.flags |= IORING_SETUP_SINGLE_ISSUER | IORING_SETUP_DEFER_TASKRUN;

and see if that yields any extra performance improvements for you?
Depending on how you do processing, you should not need to do any
further changes there.

A "lighter" version is just setting IORING_SETUP_COOP_TASKRUN.

-- 
Jens Axboe


