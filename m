Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDBC3EDC2C
	for <lists+nbd@lfdr.de>; Mon, 16 Aug 2021 19:15:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 86FEE2063F; Mon, 16 Aug 2021 17:15:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 16 17:15:09 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1C61C206A5
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Aug 2021 16:57:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JxcZENroBYtj for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Aug 2021 16:56:59 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-oi1-x229.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 892F520697
	for <nbd@other.debian.org>; Mon, 16 Aug 2021 16:56:58 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id n27so2991058oij.0
        for <nbd@other.debian.org>; Mon, 16 Aug 2021 09:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QX4ks5jEbADrBKL2S0MNfqw+r43q1WO7tEHO0nENCIk=;
        b=BbATPvyySBsHiD4X6LlcNoorERrrsncim8+jXRiFqDA2nT5I6DauYiw88uZzfw5ygm
         ZAZ1HXAB4FtrHpzN7K4m9krfenv65F8WB0DHFatV2SXdv3hW7YVzIWWV1P9lOs8oV7b+
         Ad8+RxMAmgyk7nQhPGxsU9Mjzps7hMfpoNRfWbrt0/bTfGKNRbE/jF+xwv96/A5nHhJN
         A7QzK3QfrdSjySEve6URoWlGw+5c3IR2yM+Fno9TPP5lKT/7yxmPEj3rPZf6/ejiULpN
         ZAybaMEqfIhLwM/bG8OnVEWMXBdpL2TzsKfM1Fs4AR4VPB4aZ0PFS/RZUebR9PHBppYM
         7giA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QX4ks5jEbADrBKL2S0MNfqw+r43q1WO7tEHO0nENCIk=;
        b=op9R4zNCtYxjEJ/r6MeTGeu6LyS3FzZ0CTo9uZTC3FOWD9VCE/YhVwl/BceJLGNL/B
         GCsmW3XVpfh5hKyuACfj8RvGpJ6v0SGEF9mR9jII1t9ESRC6CYo7iyPNZJdPPzvSK/ml
         uEryC/8K/WAY20rUK8OyhqmWbIgSTZgA0ETsVlaztdyMsBBuWk9LQekgWI6NSi+hqFno
         fRqXuuqsZ4WyFvgh14PXNlNeZoWjU+W/p+JljnIYS7Oozs0zIPU4nf7X2luGAIrfnBSj
         3TdSBHOJdQaF8va8Lq36KEtzML8zbqZS658RMk0ZgHZ9UCaCsyE3Xv5NubBwz1haCuoJ
         1WPA==
X-Gm-Message-State: AOAM532pYYv3Lh+sMtNaHnh7Lfs8fBEfmTYCLHxmQrrpeLzVP4jvjp/A
	fHAUoQ8QpKIvCYXK6QjZMRotvg==
X-Google-Smtp-Source: ABdhPJyBPgXPWG1S8us14BFNk3bFnMIsL9w6Le25xuw3T3je5uxgT9MBjZb1fDsz6TYd/TRax+JiOQ==
X-Received: by 2002:aca:ea54:: with SMTP id i81mr65816oih.174.1629133015798;
        Mon, 16 Aug 2021 09:56:55 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id y66sm1181002oia.12.2021.08.16.09.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 09:56:55 -0700 (PDT)
Subject: Re: [PATCH] block: nbd: add sanity check for first_minor
To: Pavel Skripkin <paskripkin@gmail.com>, josef@toxicpanda.com
Cc: hch@lst.de, linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org,
 syzbot+9937dc42271cd87d4b98@syzkaller.appspotmail.com
References: <20210812091501.22648-1-paskripkin@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <a04bfff4-bb38-0d21-3432-5086efaa6c69@kernel.dk>
Date: Mon, 16 Aug 2021 10:56:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210812091501.22648-1-paskripkin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SMd6NfLb9xN.A.8g.d0pGhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1293
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a04bfff4-bb38-0d21-3432-5086efaa6c69@kernel.dk
Resent-Date: Mon, 16 Aug 2021 17:15:09 +0000 (UTC)

On 8/12/21 3:15 AM, Pavel Skripkin wrote:
> Syzbot hit WARNING in internal_create_group(). The problem was in
> too big disk->first_minor.
> 
> disk->first_minor is initialized by value, which comes from userspace
> and there wasn't any sanity checks about value correctness. It can cause
> duplicate creation of sysfs files/links, because disk->first_minor will
> be passed to MKDEV() which causes truncation to byte. Since maximum
> minor value is 0xff, let's check if first_minor is correct minor number.
> 
> NOTE: the root case of the reported warning was in wrong error handling
> in register_disk(), but we can avoid passing knowingly wrong values to
> sysfs API, because sysfs error messages can confuse users. For example:
> user passed 1048576 as index, but sysfs complains about duplicate
> creation of /dev/block/43:0. It's not obvious how 1048576 becomes 0.
> Log and reproducer for above example can be found on syzkaller bug
> report page.

Applied, thanks.

-- 
Jens Axboe

