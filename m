Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DC6856A3F
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 17:57:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2F01520714; Thu, 15 Feb 2024 16:57:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 16:57:14 2024
Old-Return-Path: <ulf.hansson@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 65A14206C1
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 16:41:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.89 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pSfTtAdVxUzd for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 16:41:20 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linaro. - helo: .mail-yw1-x1131.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 382FA20643
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 16:41:16 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6078c21505bso9911147b3.0
        for <nbd@other.debian.org>; Thu, 15 Feb 2024 08:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708015274; x=1708620074; darn=other.debian.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H4Op1mHkAoDc0mHLSW+FBWR2Je9xZ4vfS+3TMPGtYlI=;
        b=HLRNP5YaFYA5NFrJNw0EnRA25/avJAxdXX2CY7gnPeninYEpNCAjb86lQ3RdEo8Cgu
         zhvo0H5KSzZCOdj8CWsgwYbakjFx2LejMlR3M5KzUgW/L4fTyCAXQgtxpO0oMASHOD8d
         F4/7iRSwmACL5FweEwqU74bCx3iTzcW3WzN18tiz3w0ijPvq3PX4GelHjaFJ2HJTf4Rk
         netABfBM6+Uc3jdThFJLZY2Dl0pKQTByQhEmSZia0f6n2CFwQRTozlC5h1PiZ5vOXRBL
         q7WsmoReYgMeCtyYI5IVSYRDKPYIRN2ZkqqQjbm1HlS3Caha34pP6H3I/0W32ki6BFis
         Htuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708015274; x=1708620074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4Op1mHkAoDc0mHLSW+FBWR2Je9xZ4vfS+3TMPGtYlI=;
        b=I8LszkSPxDZV4Obuna/6a/NpM9Zlo2Tlf1bHINwqshCWOXXRsNYRMWtopAVZL0YnQ6
         0o64AaPDHqSJJl+JCXgRFKfJctMU+5/k4q/6/S5UpmJwAGcDNCIj4jrMbtONwkQuKQ+l
         OwWvXKozlM17F6itgCeiA4p5hrRKMkwrTXjr3l02IqH5tHEsHeshTXY5TLvLruDvfUr/
         B9UO+TruHdH3YWk18PILk0YnN0358PQfWs4oNfTBgqxESgUxSYEtDgk9JEhpWy7t8dvI
         9u6VQQr9vIU3Qtwa1j+Avy57qHt8JDJSJxp8Yu7Q5XByeOcxev9XV8rwJWlWHuGbfNf/
         BgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZn73YxgNenH4TLGIdNrM72SSgx2r/n8cAwqTS21pgTdUWgKB3IudjFyKzf/mM7bVBg1uALl2oxoD1DyG8oFs8XxeevA==
X-Gm-Message-State: AOJu0YwOhFKRLED0ZpEVlWf6HwG3fZyLPNAYSd1uC1/KLy065RxjrY49
	srlI19DK5J9klyY7c0Xe0Zx7ljXKTflBvoRHy702Xm7IQ0ZUNvQlGqWzEP4LJq7xhadQqMsaEw7
	00c3G8jCJr6LhXABlGjOBQ5RCLu9iq/qMTvukUg==
X-Google-Smtp-Source: AGHT+IFKk2OJo3wt7UAgLQt1W8r38i0clrc+x8E5AwuuzUAnApHg2BAocf9JmfWpH758YmJPnpp1To3HfbUpjO81kIA=
X-Received: by 2002:a81:8492:0:b0:607:abfe:e82b with SMTP id
 u140-20020a818492000000b00607abfee82bmr2204534ywf.49.1708015273570; Thu, 15
 Feb 2024 08:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de>
In-Reply-To: <20240215070300.2200308-18-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Feb 2024 17:40:37 +0100
Message-ID: <CAPDyKFqPnC9jwWnoVz+UVJJ_SGYnB4CrB8jmJOSxCnT7AYQrKg@mail.gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>, 
	Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Q9S-gbGkSPG.A.XnB.qJkzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2745
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAPDyKFqPnC9jwWnoVz+UVJJ_SGYnB4CrB8jmJOSxCnT7AYQrKg@mail.gmail.com
Resent-Date: Thu, 15 Feb 2024 16:57:14 +0000 (UTC)

On Thu, 15 Feb 2024 at 08:04, Christoph Hellwig <hch@lst.de> wrote:
>
> Pass the queue limit set at initialization time directly to
> blk_mq_alloc_disk instead of updating it right after the allocation.
>
> This requires refactoring the code a bit so that what was mmc_setup_queue
> before also allocates the gendisk now and actually sets all limits.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks like $subject patch, patch11 and patch12  have already been
queued up as they are cooking linux-next. Normally I prefer to funnel
these via my mmc tree, to avoid potential conflicts (mostly for mmc,
where more active developments are ongoing).

Let's leave this as is for the moment, but if we encounter non-trivial
conflicts, I assume you can drop the patches from your tree?

Kind regards
Uffe




> ---
>  drivers/mmc/core/queue.c | 97 +++++++++++++++++++++-------------------
>  1 file changed, 52 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> index 67ad186d132a69..2ae60d208cdf1e 100644
> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -174,8 +174,8 @@ static struct scatterlist *mmc_alloc_sg(unsigned short sg_len, gfp_t gfp)
>         return sg;
>  }
>
> -static void mmc_queue_setup_discard(struct request_queue *q,
> -                                   struct mmc_card *card)
> +static void mmc_queue_setup_discard(struct mmc_card *card,
> +               struct queue_limits *lim)
>  {
>         unsigned max_discard;
>
> @@ -183,15 +183,17 @@ static void mmc_queue_setup_discard(struct request_queue *q,
>         if (!max_discard)
>                 return;
>
> -       blk_queue_max_discard_sectors(q, max_discard);
> -       q->limits.discard_granularity = card->pref_erase << 9;
> -       /* granularity must not be greater than max. discard */
> -       if (card->pref_erase > max_discard)
> -               q->limits.discard_granularity = SECTOR_SIZE;
> +       lim->max_hw_discard_sectors = max_discard;
>         if (mmc_can_secure_erase_trim(card))
> -               blk_queue_max_secure_erase_sectors(q, max_discard);
> +               lim->max_secure_erase_sectors = max_discard;
>         if (mmc_can_trim(card) && card->erased_byte == 0)
> -               blk_queue_max_write_zeroes_sectors(q, max_discard);
> +               lim->max_write_zeroes_sectors = max_discard;
> +
> +       /* granularity must not be greater than max. discard */
> +       if (card->pref_erase > max_discard)
> +               lim->discard_granularity = SECTOR_SIZE;
> +       else
> +               lim->discard_granularity = card->pref_erase << 9;
>  }
>
>  static unsigned short mmc_get_max_segments(struct mmc_host *host)
> @@ -341,40 +343,53 @@ static const struct blk_mq_ops mmc_mq_ops = {
>         .timeout        = mmc_mq_timed_out,
>  };
>
> -static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
> +static struct gendisk *mmc_alloc_disk(struct mmc_queue *mq,
> +               struct mmc_card *card)
>  {
>         struct mmc_host *host = card->host;
> -       unsigned block_size = 512;
> +       struct queue_limits lim = { };
> +       struct gendisk *disk;
>
> -       blk_queue_flag_set(QUEUE_FLAG_NONROT, mq->queue);
> -       blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
>         if (mmc_can_erase(card))
> -               mmc_queue_setup_discard(mq->queue, card);
> +               mmc_queue_setup_discard(card, &lim);
>
>         if (!mmc_dev(host)->dma_mask || !*mmc_dev(host)->dma_mask)
> -               blk_queue_bounce_limit(mq->queue, BLK_BOUNCE_HIGH);
> -       blk_queue_max_hw_sectors(mq->queue,
> -               min(host->max_blk_count, host->max_req_size / 512));
> -       if (host->can_dma_map_merge)
> -               WARN(!blk_queue_can_use_dma_map_merging(mq->queue,
> -                                                       mmc_dev(host)),
> -                    "merging was advertised but not possible");
> -       blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));
> -
> -       if (mmc_card_mmc(card) && card->ext_csd.data_sector_size) {
> -               block_size = card->ext_csd.data_sector_size;
> -               WARN_ON(block_size != 512 && block_size != 4096);
> -       }
> +               lim.bounce = BLK_BOUNCE_HIGH;
> +
> +       lim.max_hw_sectors = min(host->max_blk_count, host->max_req_size / 512);
> +
> +       if (mmc_card_mmc(card) && card->ext_csd.data_sector_size)
> +               lim.logical_block_size = card->ext_csd.data_sector_size;
> +       else
> +               lim.logical_block_size = 512;
> +
> +       WARN_ON_ONCE(lim.logical_block_size != 512 &&
> +                    lim.logical_block_size != 4096);
>
> -       blk_queue_logical_block_size(mq->queue, block_size);
>         /*
> -        * After blk_queue_can_use_dma_map_merging() was called with succeed,
> -        * since it calls blk_queue_virt_boundary(), the mmc should not call
> -        * both blk_queue_max_segment_size().
> +        * Setting a virt_boundary implicity sets a max_segment_size, so try
> +        * to set the hardware one here.
>          */
> -       if (!host->can_dma_map_merge)
> -               blk_queue_max_segment_size(mq->queue,
> -                       round_down(host->max_seg_size, block_size));
> +       if (host->can_dma_map_merge) {
> +               lim.virt_boundary_mask = dma_get_merge_boundary(mmc_dev(host));
> +               lim.max_segments = MMC_DMA_MAP_MERGE_SEGMENTS;
> +       } else {
> +               lim.max_segment_size =
> +                       round_down(host->max_seg_size, lim.logical_block_size);
> +               lim.max_segments = host->max_segs;
> +       }
> +
> +       disk = blk_mq_alloc_disk(&mq->tag_set, &lim, mq);
> +       if (IS_ERR(disk))
> +               return disk;
> +       mq->queue = disk->queue;
> +
> +       if (mmc_host_is_spi(host) && host->use_spi_crc)
> +               blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, mq->queue);
> +       blk_queue_rq_timeout(mq->queue, 60 * HZ);
> +
> +       blk_queue_flag_set(QUEUE_FLAG_NONROT, mq->queue);
> +       blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
>
>         dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->queue));
>
> @@ -386,6 +401,7 @@ static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
>         init_waitqueue_head(&mq->wait);
>
>         mmc_crypto_setup_queue(mq->queue, host);
> +       return disk;
>  }
>
>  static inline bool mmc_merge_capable(struct mmc_host *host)
> @@ -447,18 +463,9 @@ struct gendisk *mmc_init_queue(struct mmc_queue *mq, struct mmc_card *card)
>                 return ERR_PTR(ret);
>
>
> -       disk = blk_mq_alloc_disk(&mq->tag_set, NULL, mq);
> -       if (IS_ERR(disk)) {
> +       disk = mmc_alloc_disk(mq, card);
> +       if (IS_ERR(disk))
>                 blk_mq_free_tag_set(&mq->tag_set);
> -               return disk;
> -       }
> -       mq->queue = disk->queue;
> -
> -       if (mmc_host_is_spi(host) && host->use_spi_crc)
> -               blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, mq->queue);
> -       blk_queue_rq_timeout(mq->queue, 60 * HZ);
> -
> -       mmc_setup_queue(mq, card);
>         return disk;
>  }
>
> --
> 2.39.2
>

