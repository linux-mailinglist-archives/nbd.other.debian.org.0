Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 647C65F528B
	for <lists+nbd@lfdr.de>; Wed,  5 Oct 2022 12:27:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DFB0F204F8; Wed,  5 Oct 2022 10:27:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct  5 10:27:11 2022
Old-Return-Path: <christoph.boehmwalder@linbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,FOURLA,MURPHY_DRUGS_REL8,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 66D1E204FB
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Oct 2022 10:09:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.623 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-2.743, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4JXJxRr8SpPh for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Oct 2022 10:09:29 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linbit. - helo: .mail-ej1-x62c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5B554204F3
	for <nbd@other.debian.org>; Wed,  5 Oct 2022 10:09:26 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a2so14274586ejx.10
        for <nbd@other.debian.org>; Wed, 05 Oct 2022 03:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=oM5lINkSOhqEPn7T1LnWzFRQ0r/zY9T13e9BP04fEyI=;
        b=14U7AJwniruZFzbiY4kC6nsZlRvuSqb1QwTnO87x+fRvRhg52kqE3PLwic1cv6UI+b
         wxtaRyO+WZozOGf88hqNDIS0d8kGRHu94b0rcdjOrBTtNpMPKnxQUp9fyDFQVv1p4lwT
         9oAVJcqYseFceKxqgBWeZoSLo0DTN9Gz10LmFz2RpAA6luRa1gTkoumLHyuNtsjb23R3
         66037Fgcf54ctnyPbt6chWKdOLNMSKtWOPcxoIwbnX5WXyAom4hZa4oyF9nXf24bWT0P
         K9lw1zG3qgaRtbZiESDdnst2UoGyEh+WJg9WXPuCoOF4o8xgJN6xITBbcoTm7hcV1syU
         KUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=oM5lINkSOhqEPn7T1LnWzFRQ0r/zY9T13e9BP04fEyI=;
        b=WlipCkMZdtKarlR7lxySmHTpMup/w+KW0Ke2MhQcFdAlB1F25qZtT9jWdP1kOkH1hh
         0HtAS2BcoEpWT3TVSZmj87IasQU2JyItktxtvQhxNH7qVSL68AE+omA+vj7aXi05vBMk
         oj5smgcS9KJGirOokp+A3P//KGlrWEpNdTK9AcIJ62AogHivnYGsN45LJRbG2ys4HqJv
         TPjDOdTmQPRHZ6WhYbB943hfBE60JrEnqKY5dwRldFWtwqn2UKUTpQRO8OBdKyXJXz9q
         1JrXkv6fhfhVRuZXlk8u8r2CJYUclb2CuB5Diku2qNgPw+VLSGTTJNpfTPbwUZu9l2Us
         fNQQ==
X-Gm-Message-State: ACrzQf2hMKV3y23agUV/14boKpAH4SQQ4UAyG/LEcv4rrtzDx9SEv1Ay
	qhRbaHD+H15BSBsYh+q4BUWxKQ==
X-Google-Smtp-Source: AMsMyM6XbFaI9HeMTnZcx9bHunTFZSA7fhJuT5NL+agaUKW54kA1JC5km35OuPCP5GklKV/YoQTu8A==
X-Received: by 2002:a17:907:1c08:b0:782:a340:56d7 with SMTP id nc8-20020a1709071c0800b00782a34056d7mr22357872ejc.98.1664964563179;
        Wed, 05 Oct 2022 03:09:23 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at. [82.218.28.181])
        by smtp.gmail.com with ESMTPSA id r10-20020a1709061baa00b00782539a02absm8398012ejg.194.2022.10.05.03.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 03:09:22 -0700 (PDT)
Message-ID: <e23e94f8-13ad-4a10-62de-33e63a62831f@linbit.com>
Date: Wed, 5 Oct 2022 12:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH 05/18] drbd: use init disk helper
Content-Language: en-US
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: ogeert@linux-m68k.org, linux-block@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, axboe@kernel.dk, philipp.reisner@linbit.com,
 lars.ellenberg@linbit.com, efremov@linux.com, josef@toxicpanda.com,
 tim@cyberelk.net, haris.iqbal@ionos.com, jinpu.wang@ionos.com,
 richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
 mcgrof@kernel.org, hare@suse.de, damien.lemoal@opensource.wdc.com,
 johannes.thumshirn@wdc.com, bvanassche@acm.org, ming.lei@redhat.com,
 vincent.fu@samsung.com, shinichiro.kawasaki@wdc.com
References: <20221005050027.39591-1-kch@nvidia.com>
 <20221005050027.39591-6-kch@nvidia.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221005050027.39591-6-kch@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <os8wG73TcTB.A.pAC._vVPjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2231
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e23e94f8-13ad-4a10-62de-33e63a62831f@linbit.com
Resent-Date: Wed,  5 Oct 2022 10:27:11 +0000 (UTC)

Am 05.10.22 um 07:00 schrieb Chaitanya Kulkarni:
> Add and use the helper to initialize the common fields of struct gendisk
> such as major, first_minor, minors, disk_name, private_data, and ops.
> This initialization is spread all over the block drivers. This avoids
> code repetation of inialization code of gendisk in current block drivers
> and any future ones.
> 
> Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
> ---
>  drivers/block/drbd/drbd_main.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
> index f3e4db16fd07..58fae122de16 100644
> --- a/drivers/block/drbd/drbd_main.c
> +++ b/drivers/block/drbd/drbd_main.c
> @@ -2706,13 +2706,9 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
>  
>  	set_disk_ro(disk, true);
>  
> -	disk->major = DRBD_MAJOR;
> -	disk->first_minor = minor;
> -	disk->minors = 1;
> -	disk->fops = &drbd_ops;
>  	disk->flags |= GENHD_FL_NO_PART;
>  	sprintf(disk->disk_name, "drbd%d", minor);
> -	disk->private_data = device;
> +	init_disk(disk, DRBD_MAJOR, minor, 1, 0, device, &drbd_ops);
>  
>  	blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, disk->queue);
>  	blk_queue_write_cache(disk->queue, true, true);

This now does a set_capacity(..., 0), which it did not do before.
I'm guessing this does not have any side effects as the capacity should
already be initialized to 0? Do you know this for sure?

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage

