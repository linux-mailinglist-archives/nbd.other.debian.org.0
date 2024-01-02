Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD19821F0B
	for <lists+nbd@lfdr.de>; Tue,  2 Jan 2024 16:57:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9A51D20D3A; Tue,  2 Jan 2024 15:57:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  2 15:57:12 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 55FBC20C44
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Jan 2024 15:40:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jpI_hGCICeED for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Jan 2024 15:40:43 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd35.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C3ADE20C2F
	for <nbd@other.debian.org>; Tue,  2 Jan 2024 15:40:43 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7bb5be6742fso35605239f.1
        for <nbd@other.debian.org>; Tue, 02 Jan 2024 07:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1704210040; x=1704814840; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yW0MzlHZomB+YZkCH4YUGFwdNBjbNMVw3h7xePuFXBw=;
        b=K2STWu+h/G9Zxp1Pi8FKwlJ0dBoqUNJ62oE/sxK5NwuiGtqREJw+RqmnvGN255BvRn
         OfIYzrXoMwSbA7g+1PGdiJT8C2XnyWVu+5Mdevvq/Uh1N7GXvzt6RH/vRfh+bqL5y1Yz
         lbu2rZklPxJj8EZ0N8SP0tMlbb+cJWDvxgxWa2CLlPsaapcdv9PavA2UqvLzHRLncRpx
         hieTbsr6Q539jmklUoRO56D0V+qmHagI0V6O4jaV8GJm2weWpX61qYmZeYyTVxn6wVdd
         GdbZJ02POX3T805y1pJZBplgS6PUEk2yryUWIuQQlXUsrAPhAo0lnOfX6ytlmRZSLQHG
         Jebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704210040; x=1704814840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yW0MzlHZomB+YZkCH4YUGFwdNBjbNMVw3h7xePuFXBw=;
        b=nsWH0rScoZAKeX2Xf6wiNxjwIoincrbj/CwfMT40zxNOhnLKnvUIJLLdLePbc9AjH1
         MLARY5lq7DUa5iB6PHIBwh234XAZpOuDt2nLpO4/VV7qnEdwY71D6NT5SJDoz3tBSgQQ
         3VbQ5PIc/Lq28E5uxFEWaoGgPvnAfDpP1ufPAuYA5sWc2x81uRrk2HGQUMvFHqNSat7V
         4GmIZdl2m8lwGJKucXEF/9mTLPnk1aHp6fIfIhe1SUhOCVbEkRkVYLpabk9vyGANqMDH
         yNF8r9Nfj7F0U4UIm5HZJw5mjbKE3I7q1WGrOA4VA1/peMBisJGa6AmgAMhx1bGFnMZk
         AdDg==
X-Gm-Message-State: AOJu0YwV/X7O0BjgrcN7QIZgnXZYjd1UndpHYz159myxPMXVXBTWq0vX
	0VQr3t8HOfgwyat1fXdtd0ieZFiK08jJ/w==
X-Google-Smtp-Source: AGHT+IEwoDpWa3DPCL2q3LLo73FXUxeDnS1RhrchV5t+VIVuVtSvXaa44wpnDuL6ftiaSS1FPUs3jg==
X-Received: by 2002:a05:6e02:20c5:b0:35f:ff56:c40a with SMTP id 5-20020a056e0220c500b0035fff56c40amr22286643ilq.0.1704210039707;
        Tue, 02 Jan 2024 07:40:39 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id f12-20020a056e020b4c00b0036002c8127asm5354004ilu.5.2024.01.02.07.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 07:40:39 -0800 (PST)
Message-ID: <400dbdbf-e99e-4747-94db-54fb6674fdd5@kernel.dk>
Date: Tue, 2 Jan 2024 08:40:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] zram: use the default discard granularity
Content-Language: en-US
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
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240102011543.GA21409@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <BOW2fODk5lH.A.IHG.YJDllB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2701
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/400dbdbf-e99e-4747-94db-54fb6674fdd5@kernel.dk
Resent-Date: Tue,  2 Jan 2024 15:57:12 +0000 (UTC)

On 1/1/24 6:15 PM, Sergey Senozhatsky wrote:
> On (23/12/28 07:55), Christoph Hellwig wrote:
>>
>> The discard granularity now defaults to a single sector, so don't set
>> that value explicitly
> 
> Hmm, but sector size != PAGE_SIZE
> 
> [..]
> 
>> @@ -2227,7 +2227,6 @@ static int zram_add(void)
>>  					ZRAM_LOGICAL_BLOCK_SIZE);
>>  	blk_queue_io_min(zram->disk->queue, PAGE_SIZE);
>>  	blk_queue_io_opt(zram->disk->queue, PAGE_SIZE);
>> -	zram->disk->queue->limits.discard_granularity = PAGE_SIZE;

Yep, that does indeed look buggy.

-- 
Jens Axboe


