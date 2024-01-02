Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A856A821F16
	for <lists+nbd@lfdr.de>; Tue,  2 Jan 2024 17:00:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 71B8620C85; Tue,  2 Jan 2024 16:00:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  2 16:00:13 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3607420C2F
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Jan 2024 15:44:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Q-KARDVojok1 for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Jan 2024 15:44:11 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd34.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E090F20B3E
	for <nbd@other.debian.org>; Tue,  2 Jan 2024 15:44:11 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7b8529ce303so122842039f.1
        for <nbd@other.debian.org>; Tue, 02 Jan 2024 07:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1704210248; x=1704815048; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9QVj7o90tQS3H4SwYTPIYauXLnJ6OU7xRh/0KG0CF0=;
        b=X2Eoon3N5XW75uybZHxlmL0bjm2XvJHItmZyfosCZd3WADHbI6q7QzbB5IbecWbsi1
         Xca4d1JghIWqhlFWt49IITVXG/r1uCvo+zWxZdQrZryrQQUYIKTcJ7/ydlkbQxdvQoa0
         pzoIDvj4QPFql1xtsotMNGpWYAaLHEkAxwRfv1GSfy9hr6IMR6Sysx4rjbxBKR5TukhC
         SvBOr0/2PJEE1flQRYScDx8IChj/RqMlEbh4v4e8kQmOQcHF+dGi3NOVQyYrCcyJw63M
         HWepyfVgT2qwdkhMns8/YX2IplhuHBAcTnuyMK45evPqEQm8IpoE9kChzsU6+/PSVWyB
         1N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704210248; x=1704815048;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9QVj7o90tQS3H4SwYTPIYauXLnJ6OU7xRh/0KG0CF0=;
        b=VwkCiioadp2p5LbFj3ZQlGX9w/Slo+95zWfLTF7U724u5hB3gNqs/HHIaj2jl+Zx4k
         uQsZcQAEe6kqQ+WqRrasdVUknOySwVBhskFw3iPjb3J5BuJOpHol0+oo7UmSNXBC8Z34
         9fCPMhoSYjqO+zKHA85ukqiLPJq80T7Wqh4Fy2gS5oJVKPZgZiUc58VObizRpDi5nYFI
         y65LKQGnRq/tm8yWpquIZQedvOpHHPiAgkplJznhybeDzdD/8LFX8V/m6HIsGkIPKfjx
         W2R8cy2hblBFOA9vkEyv0+V+4JRngI3JdJBDVKab2xJ7TvMOty+KkWlZT0yVQrwYWtsk
         CsXA==
X-Gm-Message-State: AOJu0Yw9G8SJcTUGVrLk4APsVh8pTndN0Buq7YtpHexzQx+9nZzHJU/s
	MB9oDwAVKNmf3oBn218NtIWYy2SgT6DchQ==
X-Google-Smtp-Source: AGHT+IFaAhZehoDkL/Lq9ymm1RdzzKN/67q+7aSVQpGW7QGqOVV9a9BjzLBm4rE1KB/JklVJV2PhvA==
X-Received: by 2002:a6b:e916:0:b0:7ba:9b40:2648 with SMTP id u22-20020a6be916000000b007ba9b402648mr24056653iof.1.1704210248423;
        Tue, 02 Jan 2024 07:44:08 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca16-20020a0566381c1000b0046dcfbc1bc4sm496784jab.79.2024.01.02.07.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 07:44:07 -0800 (PST)
Message-ID: <f3758a5a-986f-485c-9a6b-c11af20c3aa5@kernel.dk>
Date: Tue, 2 Jan 2024 08:44:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] zram: use the default discard granularity
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 Christoph Hellwig <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Josef Bacik <josef@toxicpanda.com>, Minchan Kim <minchan@kernel.org>,
 Coly Li <colyli@suse.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20231228075545.362768-1-hch@lst.de>
 <20231228075545.362768-8-hch@lst.de> <20240102011543.GA21409@google.com>
 <400dbdbf-e99e-4747-94db-54fb6674fdd5@kernel.dk>
In-Reply-To: <400dbdbf-e99e-4747-94db-54fb6674fdd5@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fXKI94R5lPI.A.uxH.NMDllB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2702
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f3758a5a-986f-485c-9a6b-c11af20c3aa5@kernel.dk
Resent-Date: Tue,  2 Jan 2024 16:00:13 +0000 (UTC)

On 1/2/24 8:40 AM, Jens Axboe wrote:
> On 1/1/24 6:15 PM, Sergey Senozhatsky wrote:
>> On (23/12/28 07:55), Christoph Hellwig wrote:
>>>
>>> The discard granularity now defaults to a single sector, so don't set
>>> that value explicitly
>>
>> Hmm, but sector size != PAGE_SIZE
>>
>> [..]
>>
>>> @@ -2227,7 +2227,6 @@ static int zram_add(void)
>>>  					ZRAM_LOGICAL_BLOCK_SIZE);
>>>  	blk_queue_io_min(zram->disk->queue, PAGE_SIZE);
>>>  	blk_queue_io_opt(zram->disk->queue, PAGE_SIZE);
>>> -	zram->disk->queue->limits.discard_granularity = PAGE_SIZE;
> 
> Yep, that does indeed look buggy.

Ah no it's fine, it'll default to the sector size of the device, which
is set before the discard limit/granularity. So should work fine as-is.

-- 
Jens Axboe


