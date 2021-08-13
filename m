Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8143EBC80
	for <lists+nbd@lfdr.de>; Fri, 13 Aug 2021 21:27:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 61B0B20412; Fri, 13 Aug 2021 19:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 13 19:27:09 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1CBCB203F2
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Aug 2021 19:09:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 85dNKPEFCMhY for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Aug 2021 19:09:29 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pj1-x1034.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8DC802026A
	for <nbd@other.debian.org>; Fri, 13 Aug 2021 19:09:29 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id j12-20020a17090aeb0c00b00179530520b3so1608060pjz.0
        for <nbd@other.debian.org>; Fri, 13 Aug 2021 12:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KK5PMM54npEpLZliacDt3bjyqyNhWCWju9QlXW/gHeU=;
        b=U/guKoSq65qEHQXiT1haSu/HNuyYOFEzBcn85ZhyuHkLjJslFTSZcFnvCxO+uxJcGZ
         ED/p3mZ8czr3VfKHD8NDwnZOOpPJLvmNHKKSBIf/r4Ic1SS4na4TL3V43Jlfn8BUBLfo
         laUSw9vHzOJAsHJRLwNUgt5mz0u8UjQGJkgd2PepLnY1JNZf91p5eTRF1upcNf1mVhLA
         xJaPiV5aW4S9ofBhGURAlkz0+qh5ULHuToCTtEynzDka22ed5kBGexYIQBXGAtHDgQqR
         So1v8rCOcapmuKSzYXmBwY6o7aDoKbSIGaI2yWedwVPWit9ZRgAF7Ut9c/RKouBeXo2p
         pWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KK5PMM54npEpLZliacDt3bjyqyNhWCWju9QlXW/gHeU=;
        b=HIlKmAtjPd4BIMO1tM0DDmx0WDXrLhVvDfMfIF5EwJINxx+rCiYtbu4mQzs9WhZX21
         7OAvC80zSdEXrwggcfS8c/dW+LaL6nVbhd93zVlLoDU1w68IKsX7Ev86JQwUfctATYbB
         915/Za5I87P1sTp1OajhQN+KHPgCdOFAeisdm/mCO/+U8mRHA22XhhAsQh3zlD1k/COC
         U77G9P1pq+0VM1N9A4PFAnX1paaUXl+YbJs60TgRVOhDVYxmDzywbWCpvmLRskX42x6J
         P/4PY+iczeArdejrOmi+dWoH4AQ8rvqZx5EJdml9tOD7py5EhE30wbfz10K+0IxTADw1
         Aqcw==
X-Gm-Message-State: AOAM5328QECmpkJAry3CnpiQe0Mt/o6yamIhKYhpJsHg+WLqP//ZNJAD
	R4wYxz3Pe8/KCVjQImXyS0pXAA==
X-Google-Smtp-Source: ABdhPJxXdASnvDJiJ6fHGFND576uYst/fbUWHCZzRU/brb8tc0H0JIPhAWxB5EB9agwiBwVnP6hUkw==
X-Received: by 2002:a17:902:9b90:b029:12d:5ce1:4d99 with SMTP id y16-20020a1709029b90b029012d5ce14d99mr3193439plp.37.1628881765412;
        Fri, 13 Aug 2021 12:09:25 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id d14sm2556095pjc.0.2021.08.13.12.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 12:09:25 -0700 (PDT)
Subject: Re: [PATCH -next v3] nbd: add the check to prevent overflow in
 __nbd_ioctl()
To: Baokun Li <libaokun1@huawei.com>, josef@toxicpanda.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
Cc: patchwork@huawei.com, yukuai3@huawei.com, Hulk Robot <hulkci@huawei.com>
References: <20210804021212.990223-1-libaokun1@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <1799b798-34dc-9589-72d8-367516daf7ee@kernel.dk>
Date: Fri, 13 Aug 2021 13:09:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210804021212.990223-1-libaokun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1wrQtrM_3VP.A.iMD.NesFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1287
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1799b798-34dc-9589-72d8-367516daf7ee@kernel.dk
Resent-Date: Fri, 13 Aug 2021 19:27:09 +0000 (UTC)

On 8/3/21 8:12 PM, Baokun Li wrote:
> If user specify a large enough value of NBD blocks option, it may trigger
> signed integer overflow which may lead to nbd->config->bytesize becomes a
> large or small value, zero in particular.
> 
> UBSAN: Undefined behaviour in drivers/block/nbd.c:325:31
> signed integer overflow:
> 1024 * 4611686155866341414 cannot be represented in type 'long long int'
> [...]
> Call trace:
> [...]
>  handle_overflow+0x188/0x1dc lib/ubsan.c:192
>  __ubsan_handle_mul_overflow+0x34/0x44 lib/ubsan.c:213
>  nbd_size_set drivers/block/nbd.c:325 [inline]
>  __nbd_ioctl drivers/block/nbd.c:1342 [inline]
>  nbd_ioctl+0x998/0xa10 drivers/block/nbd.c:1395
>  __blkdev_driver_ioctl block/ioctl.c:311 [inline]
> [...]
> 
> Although it is not a big deal, still silence the UBSAN by limit
> the input value.

Applied with unlikely() removed.

-- 
Jens Axboe

