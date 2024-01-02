Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 22408821F25
	for <lists+nbd@lfdr.de>; Tue,  2 Jan 2024 17:03:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EFFE820590; Tue,  2 Jan 2024 16:03:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  2 16:03:12 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4DCFF20C47
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Jan 2024 15:47:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1pWbgBAHXrJ4 for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Jan 2024 15:47:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x130.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D119620C44
	for <nbd@other.debian.org>; Tue,  2 Jan 2024 15:47:42 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-36016c6e19eso4043465ab.1
        for <nbd@other.debian.org>; Tue, 02 Jan 2024 07:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1704210459; x=1704815259; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySBFOJIM0DSvIVDKhQcLqvBT2yyLab4gqIewIhfdbtY=;
        b=gflQYE01Cp2pIXkIYbwQ/kbMyd92SrDEVf/XuIBTC8ENyIuAE1eWM6TDmvHQBsqZSI
         bExSMcK/NnZKVjCHg7qd8aJ6q2D0m73AWnVhcVvU7fhtGu2GV8LDPK9yhmwKpuVrUfqV
         k00SXwLGMk9NmxTVC4pKUuprfIgiqHXDULEg+RIysDJ0qa+LErY6DVStGbzhbielMz2/
         hs4LHKrOBYP+upFdPQpXa871pvbkVAmAxy27Dptd+be6BJOpSusgJ3lNdwCRQy/ASsnI
         UXAuzFtH7ZU9mymaH4AihKBqcFzWxFgxNHABiFUJGDgRdYVM7o+oJV3XAgGH7Ar418vk
         LA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704210459; x=1704815259;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySBFOJIM0DSvIVDKhQcLqvBT2yyLab4gqIewIhfdbtY=;
        b=f7urdVrPZ4inR8gLuGZsFWglo2I4IavLUIrhWx9b/SMwSMQuYo4dp8F5yyTcA4pUn3
         6F66GsBC3voeanYuOMjGijb0lMC6Qsm7otisfYrYfWvo0Wdyc594sge8fcRpGQ0TkBJz
         Y6MJL9M9beUCuqf94OL5VbkoZe48XavnM9rSm57T4Zx2y0LxS4NAi2hqdaauYBX5La6b
         zjsASx4NRP8A1cpMuttLfhy/iXJ4KOnhMu9hbAncodv6rD/vbk5paTOldP74MzkVz7sC
         eHzvns96JZgCSG7K1bRdRfVS8Wd1nAdJDRTgz0iHoXpSOQNILcHg9acyiCFqRubGRLiV
         9Fig==
X-Gm-Message-State: AOJu0YxyzllDIarjUznuaAhVmSUZpJ4IH/4RRYJ/wileavE077Sf8wwj
	q3LUp2PlW3NSA5lhvSFzMXoGr0NMmsvq0Q==
X-Google-Smtp-Source: AGHT+IFs9GZ/Ey7ptKHRHLLO93hZlIAauQjofaYqCnhw5oeOlPvARiPsQn3KTgYcoEx49b9b2zgL8Q==
X-Received: by 2002:a92:c26f:0:b0:35f:efdc:7738 with SMTP id h15-20020a92c26f000000b0035fefdc7738mr26703798ild.2.1704210459220;
        Tue, 02 Jan 2024 07:47:39 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id cb6-20020a056e02318600b0036003f7ce61sm5383610ilb.87.2024.01.02.07.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 07:47:38 -0800 (PST)
Message-ID: <92011368-a4a5-428b-9801-26a6a6a96752@kernel.dk>
Date: Tue, 2 Jan 2024 08:47:36 -0700
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
 <f3758a5a-986f-485c-9a6b-c11af20c3aa5@kernel.dk>
In-Reply-To: <f3758a5a-986f-485c-9a6b-c11af20c3aa5@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <j9h1vMERutD.A.JG.APDllB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2703
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/92011368-a4a5-428b-9801-26a6a6a96752@kernel.dk
Resent-Date: Tue,  2 Jan 2024 16:03:12 +0000 (UTC)

On 1/2/24 8:44 AM, Jens Axboe wrote:
> On 1/2/24 8:40 AM, Jens Axboe wrote:
>> On 1/1/24 6:15 PM, Sergey Senozhatsky wrote:
>>> On (23/12/28 07:55), Christoph Hellwig wrote:
>>>>
>>>> The discard granularity now defaults to a single sector, so don't set
>>>> that value explicitly
>>>
>>> Hmm, but sector size != PAGE_SIZE
>>>
>>> [..]
>>>
>>>> @@ -2227,7 +2227,6 @@ static int zram_add(void)
>>>>  					ZRAM_LOGICAL_BLOCK_SIZE);
>>>>  	blk_queue_io_min(zram->disk->queue, PAGE_SIZE);
>>>>  	blk_queue_io_opt(zram->disk->queue, PAGE_SIZE);
>>>> -	zram->disk->queue->limits.discard_granularity = PAGE_SIZE;
>>
>> Yep, that does indeed look buggy.
> 
> Ah no it's fine, it'll default to the sector size of the device, which
> is set before the discard limit/granularity. So should work fine as-is.

Replying to myself again... It does then default it to the logical block
size, not the physical one. Which does look odd, seems like that should
be the physical size?

In any case, this does change behavior for zram.

Christoph?

-- 
Jens Axboe

