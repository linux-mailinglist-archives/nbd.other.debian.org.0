Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C46E85CA4B
	for <lists+nbd@lfdr.de>; Tue, 20 Feb 2024 23:01:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EE26920BA5; Tue, 20 Feb 2024 22:01:50 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 20 22:01:50 2024
Old-Return-Path: <geert.uytterhoeven@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=CC_TOO_MANY,FOURLA,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FVGT_m_MULTI_ODD,
	HEADER_FROM_DIFFERENT_DOMAINS,LDO_WHITELIST,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7EC1E20B78
	for <lists-other-nbd@bendel.debian.org>; Tue, 20 Feb 2024 22:01:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.639 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FOURLA=0.1,
	FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
	FVGT_m_MULTI_ODD=0.02, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id D-pLUczisgPV for <lists-other-nbd@bendel.debian.org>;
	Tue, 20 Feb 2024 22:01:28 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-yb1-f181.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3844020B86
	for <nbd@other.debian.org>; Tue, 20 Feb 2024 22:01:24 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso5676738276.1
        for <nbd@other.debian.org>; Tue, 20 Feb 2024 14:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708466479; x=1709071279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7n1GqinQntZXgeHCD08v9Jnvi0xyQ8A5V17lOCMlhI=;
        b=oWL4tTfJFRtqqLn5ZTUGPG0iAscWaEO0WvVBv8aCT6P9OcYShpoVLCvKXkdHBdXL9i
         KmeXZNPanZUe8TtVdLcs5pe1gTsnhQ8sW25KWkdjy98CKOKG2uk9ZTjHl/awoOaCLWht
         sBC4BLAx7fVwpLuct0Nt9tlzQqh0kjoFMC6jOR6Jshl7t3G39Om6emDLwNIUci+8GJAg
         kcynsC5VEUxvXGyz1WTdD59oqy8UOFSQLJiAfcNv1So1AUpziaHX60DT6eBbTb4X3Vzi
         WDKB+eoOw3H97iZ4aW5GDRPMZskb8vPAvRKbcOA7CdKGNG0uRwPNKo+r72VWcLbDcu/b
         vPfg==
X-Forwarded-Encrypted: i=1; AJvYcCUCca3jxsgyN8SJ/siKbabrdguhmlWIGLjwHg9te48IuKBM8c7T/SU79ts8ntSTvPRI70UUW7usJqs1wvcJgEGxxwe8LA==
X-Gm-Message-State: AOJu0YzEXtxDcVDXo4aUSugi0ewSWrLjg0w2ayAbxQwZx+SIWB3SCpq9
	DRQKWUpbNjBEMR9F/ii75DpLoIk3Me7Wuo1znFwKSym22uzXZGJoxWTJYgv8O/c=
X-Google-Smtp-Source: AGHT+IHY4TTbfu/sN+QDRa6931ubxGoAqMy1Fs5/GBqhc+mMifQ9uAASPKgOpFRLryFPQBRiAnHv1Q==
X-Received: by 2002:a25:6b46:0:b0:dcc:f6e2:44d0 with SMTP id o6-20020a256b46000000b00dccf6e244d0mr16300428ybm.37.1708466479216;
        Tue, 20 Feb 2024 14:01:19 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id b5-20020a5b0785000000b00dcda3959006sm2067658ybq.33.2024.02.20.14.01.18
        for <nbd@other.debian.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 14:01:18 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60866ce76dfso11500967b3.2
        for <nbd@other.debian.org>; Tue, 20 Feb 2024 14:01:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVp+dtxl3T6XkgdjcxQsOB5e5kHVjiPDSjfH7rURTVoN94loRn1Mz6tymPAnTgthivK2FoLon2vuXcNCynUiDo41MYBnw==
X-Received: by 2002:a81:a102:0:b0:608:218b:549e with SMTP id
 y2-20020a81a102000000b00608218b549emr9679398ywg.11.1708466477756; Tue, 20 Feb
 2024 14:01:17 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de>
In-Reply-To: <20240215070300.2200308-18-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Feb 2024 23:01:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
Message-ID: <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>, 
	Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-4WwlHV4K9D.A.19E.OFS1lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2755
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com
Resent-Date: Tue, 20 Feb 2024 22:01:50 +0000 (UTC)

Hi Christoph,

On Thu, Feb 15, 2024 at 9:16=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
> Pass the queue limit set at initialization time directly to
> blk_mq_alloc_disk instead of updating it right after the allocation.
>
> This requires refactoring the code a bit so that what was mmc_setup_queue
> before also allocates the gendisk now and actually sets all limits.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for your patch, which is now commit 616f876617927732 ("mmc: pass
queue_limits to blk_mq_alloc_disk") in block/for-next.

I have bisected the following failure on White-Hawk (also seen on
other R-Car Gen3/4 systems) to this commit:

    renesas_sdhi_internal_dmac ee140000.mmc: mmc0 base at
0x00000000ee140000, max clock rate 200 MHz
    mmc0: new HS400 MMC card at address 0001
    ------------[ cut here ]------------
    WARNING: CPU: 1 PID: 20 at block/blk-settings.c:202
blk_validate_limits+0x12c/0x1e0
    Modules linked in:
    CPU: 1 PID: 20 Comm: kworker/1:0 Not tainted
6.8.0-rc3-white-hawk-00084-g616f87661792 #223
    Hardware name: Renesas White Hawk CPU and Breakout boards based on
r8a779g0 (DT)
    Workqueue: events_freezable mmc_rescan
    pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
    pc : blk_validate_limits+0x12c/0x1e0
    lr : blk_set_default_limits+0x14/0x1c
    sp : ffffffc0829336f0
    x29: ffffffc0829336f0 x28: 0000000000000000 x27: 0000000000000000
    Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: attached
PHY driver (mii_bus:phy_addr=3De6800000.ethernet-ffffffff:00, irq=3D30)
    x26: ffffff8443afd808 x25: ffffffc0825bd000 x24: ffffffc082933878
    x23: 00000000ffffffff x22: ffffffc08147b258 x21: ffffff8443ab0c10
    x20: 000000000000001a x19: ffffff8443b00000 x18: 0000000043789380
    x17: ffffffc0806b2ea8 x16: ffffffc0803ab8b4 x15: ffffffc0803ab444
    x14: ffffffc08039c26c x13: ffffffc080506854 x12: ffffffc080506700
    x11: ffffffc08050669c x10: ffffffc080506478 x9 : ffffffc0803ad1a0
    x8 : ffffff8443019120 x7 : ffffffc0803ad1a0 x6 : 0000000000000000
    x5 : 0000000000000000 x4 : 0000000000000a00 x3 : 0000000000000fff
    x2 : 0000000000000200 x1 : 0000000000010000 x0 : ffffffc082933878
    Call trace:
     blk_validate_limits+0x12c/0x1e0
     blk_alloc_queue+0x7c/0x244
     blk_mq_alloc_queue+0x4c/0xac
     __blk_mq_alloc_disk+0x1c/0xc0
     mmc_alloc_disk+0x134/0x2b4
     mmc_init_queue+0x114/0x12c
     mmc_blk_alloc_req+0xf0/0x34c
     mmc_blk_probe+0x230/0x5b8
     mmc_bus_probe+0x18/0x20
     really_probe+0x138/0x270
     __driver_probe_device+0xec/0x104
     driver_probe_device+0x4c/0xf8
     __device_attach_driver+0xa8/0xc8
     bus_for_each_drv+0xa4/0xc8
     __device_attach+0xe4/0x144
     device_initial_probe+0x10/0x18
     bus_probe_device+0x38/0xa0
     device_add+0x520/0x654
     mmc_add_card+0x12c/0x28c
     mmc_attach_mmc+0xb8/0x154
     mmc_rescan+0x208/0x250
     process_scheduled_works+0x2b8/0x41c
     worker_thread+0x1cc/0x24c
     kthread+0xd8/0xe8
     ret_from_fork+0x10/0x20
    irq event stamp: 434
    hardirqs last  enabled at (433): [<ffffffc0808e0ac0>]
_raw_spin_unlock_irq+0x2c/0x40
    hardirqs last disabled at (434): [<ffffffc0808dae28>] __schedule+0x1cc/=
0x84c
    softirqs last  enabled at (192): [<ffffffc080010300>]
__do_softirq+0x1ac/0x360
    softirqs last disabled at (185): [<ffffffc08001550c>]
____do_softirq+0xc/0x14
    ---[ end trace 0000000000000000 ]---
    mmcblk: probe of mmc0:0001 failed with error -22

Reverting this commit fixes the issue.

> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -174,8 +174,8 @@ static struct scatterlist *mmc_alloc_sg(unsigned shor=
t sg_len, gfp_t gfp)
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
> @@ -183,15 +183,17 @@ static void mmc_queue_setup_discard(struct request_=
queue *q,
>         if (!max_discard)
>                 return;
>
> -       blk_queue_max_discard_sectors(q, max_discard);
> -       q->limits.discard_granularity =3D card->pref_erase << 9;
> -       /* granularity must not be greater than max. discard */
> -       if (card->pref_erase > max_discard)
> -               q->limits.discard_granularity =3D SECTOR_SIZE;
> +       lim->max_hw_discard_sectors =3D max_discard;
>         if (mmc_can_secure_erase_trim(card))
> -               blk_queue_max_secure_erase_sectors(q, max_discard);
> +               lim->max_secure_erase_sectors =3D max_discard;
>         if (mmc_can_trim(card) && card->erased_byte =3D=3D 0)
> -               blk_queue_max_write_zeroes_sectors(q, max_discard);
> +               lim->max_write_zeroes_sectors =3D max_discard;
> +
> +       /* granularity must not be greater than max. discard */
> +       if (card->pref_erase > max_discard)
> +               lim->discard_granularity =3D SECTOR_SIZE;
> +       else
> +               lim->discard_granularity =3D card->pref_erase << 9;
>  }
>
>  static unsigned short mmc_get_max_segments(struct mmc_host *host)
> @@ -341,40 +343,53 @@ static const struct blk_mq_ops mmc_mq_ops =3D {
>         .timeout        =3D mmc_mq_timed_out,
>  };
>
> -static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
> +static struct gendisk *mmc_alloc_disk(struct mmc_queue *mq,
> +               struct mmc_card *card)
>  {
>         struct mmc_host *host =3D card->host;
> -       unsigned block_size =3D 512;
> +       struct queue_limits lim =3D { };
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
> -               block_size =3D card->ext_csd.data_sector_size;
> -               WARN_ON(block_size !=3D 512 && block_size !=3D 4096);
> -       }
> +               lim.bounce =3D BLK_BOUNCE_HIGH;
> +
> +       lim.max_hw_sectors =3D min(host->max_blk_count, host->max_req_siz=
e / 512);
> +
> +       if (mmc_card_mmc(card) && card->ext_csd.data_sector_size)
> +               lim.logical_block_size =3D card->ext_csd.data_sector_size=
;
> +       else
> +               lim.logical_block_size =3D 512;
> +
> +       WARN_ON_ONCE(lim.logical_block_size !=3D 512 &&
> +                    lim.logical_block_size !=3D 4096);
>
> -       blk_queue_logical_block_size(mq->queue, block_size);
>         /*
> -        * After blk_queue_can_use_dma_map_merging() was called with succ=
eed,
> -        * since it calls blk_queue_virt_boundary(), the mmc should not c=
all
> -        * both blk_queue_max_segment_size().
> +        * Setting a virt_boundary implicity sets a max_segment_size, so =
try
> +        * to set the hardware one here.
>          */
> -       if (!host->can_dma_map_merge)
> -               blk_queue_max_segment_size(mq->queue,
> -                       round_down(host->max_seg_size, block_size));
> +       if (host->can_dma_map_merge) {
> +               lim.virt_boundary_mask =3D dma_get_merge_boundary(mmc_dev=
(host));
> +               lim.max_segments =3D MMC_DMA_MAP_MERGE_SEGMENTS;
> +       } else {
> +               lim.max_segment_size =3D
> +                       round_down(host->max_seg_size, lim.logical_block_=
size);
> +               lim.max_segments =3D host->max_segs;
> +       }
> +
> +       disk =3D blk_mq_alloc_disk(&mq->tag_set, &lim, mq);
> +       if (IS_ERR(disk))
> +               return disk;
> +       mq->queue =3D disk->queue;
> +
> +       if (mmc_host_is_spi(host) && host->use_spi_crc)
> +               blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, mq->queue);
> +       blk_queue_rq_timeout(mq->queue, 60 * HZ);
> +
> +       blk_queue_flag_set(QUEUE_FLAG_NONROT, mq->queue);
> +       blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
>
>         dma_set_max_seg_size(mmc_dev(host), queue_max_segment_size(mq->qu=
eue));
>
> @@ -386,6 +401,7 @@ static void mmc_setup_queue(struct mmc_queue *mq, str=
uct mmc_card *card)
>         init_waitqueue_head(&mq->wait);
>
>         mmc_crypto_setup_queue(mq->queue, host);
> +       return disk;
>  }
>
>  static inline bool mmc_merge_capable(struct mmc_host *host)
> @@ -447,18 +463,9 @@ struct gendisk *mmc_init_queue(struct mmc_queue *mq,=
 struct mmc_card *card)
>                 return ERR_PTR(ret);
>
>
> -       disk =3D blk_mq_alloc_disk(&mq->tag_set, NULL, mq);
> -       if (IS_ERR(disk)) {
> +       disk =3D mmc_alloc_disk(mq, card);
> +       if (IS_ERR(disk))
>                 blk_mq_free_tag_set(&mq->tag_set);
> -               return disk;
> -       }
> -       mq->queue =3D disk->queue;
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
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

