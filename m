Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA7857730
	for <lists+nbd@lfdr.de>; Fri, 16 Feb 2024 09:06:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E24C220B8F; Fri, 16 Feb 2024 08:06:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 16 08:06:12 2024
Old-Return-Path: <jinpu.wang@ionos.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 107C520B8A
	for <lists-other-nbd@bendel.debian.org>; Fri, 16 Feb 2024 07:49:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.89 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Qo5T68DBUZ0d for <lists-other-nbd@bendel.debian.org>;
	Fri, 16 Feb 2024 07:49:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .ionos. - helo: .mail-ed1-x530.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 37D9320B1D
	for <nbd@other.debian.org>; Fri, 16 Feb 2024 07:49:44 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-563e330351dso478774a12.0
        for <nbd@other.debian.org>; Thu, 15 Feb 2024 23:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1708069782; x=1708674582; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKtrR0GptUvN+scEUpBPwjTH5qrhKCgtCeXIuRBm1rE=;
        b=aMCFUbifnwQJp5wLNmWz7dw02V9vfZN3qdpA0E/XYsoEY9h1Xet72oUv6AGDLYfDUX
         k8kEKDhThiJlIScGbqMZLwgN7tBKVa6wxOmWISD2/nG9RXZhIZI7CCF3bUAJ/kFRWswK
         epTpk9wiGvxFhx4ptFV5XRZWbwYzJQcbsJskP5AAhzK2dKAeF2MQkKmPADDXaZnXJfLF
         kdziA8+d7sMOKshKZnpBiDyo6qUX95Y0O3d6DcrMx+fxX5A+SpChVyGG6ehufkQsR0+z
         xhMpKtIIvCEURwF6ID4o6xPd122htH4ugY4CBdqqNgZBblhk4HsRGQnw9zFYXgvd2d4j
         aw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708069782; x=1708674582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKtrR0GptUvN+scEUpBPwjTH5qrhKCgtCeXIuRBm1rE=;
        b=jWbeJrc4vVc1TAP+ab3VSdIOFLBNyizPS12Llxqkd3WB7XTuIqF4LKaLgWXLF5YgMq
         4a/8iwPO19n72yekDGoRr6M7rmq/xF49HGh4msKnqNDgNEXGnN9hLKZr2n7gBJ77yuZ9
         ar0cwvXS/lkQgKOfPM9jk/EzYmvO8hP5YZR/whc9w+UGlHa61jxeu1bryN/CH/fANamd
         /GyByGd6yZCkobUxahWPkOId80GT123ChpCM/M+SbOb4baYsp93si61H1KXVAztZDOBS
         KMiFipLoGtnat7JhL+dpEpKVNaWXdnsYlWLjfpO2fcMkxaZIYmKt7O7jgMM1SXQqtd78
         ptaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9OMVSMKlNKoDjRht+sEhTkaw4kgXYnNBrLrqdVPCN312D7tpg8+yCUVrSU+sNPpxMQS7/WKDPgY5EgX68DF157Pe0Gg==
X-Gm-Message-State: AOJu0YyQdp5uc4HdOjfH1YUA4f2C/teEiV8513XbYHBlSZFq7JgDCy8Q
	seyXG0kOJXjHneG11DTRvDUci/W2SKnDiwnhTYEHI9jzC635ojuIw5IQip4j+b03T7Bz/gMuJWZ
	ORmNccgz0vusz1KnIhlBdPp5ZkTp5ITbxPzJStQ==
X-Google-Smtp-Source: AGHT+IEz+DOqbldxdx8VWXCWP6/6fTdJY+pnjm4uq4NWwzDh2gUwnQ0y3y2rNodnC/dPtB2uhZ02GJwHr8oI/OyBPSQ=
X-Received: by 2002:a05:6402:3593:b0:563:fc1d:4568 with SMTP id
 y19-20020a056402359300b00563fc1d4568mr440920edc.10.1708069782007; Thu, 15 Feb
 2024 23:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-9-hch@lst.de>
In-Reply-To: <20240215070300.2200308-9-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Fri, 16 Feb 2024 08:49:30 +0100
Message-ID: <CAMGffE=cpyWvxWwdmhyxhgBr7zxvqHS2BQwx-zm2=cm3VjRFxQ@mail.gmail.com>
Subject: Re: [PATCH 08/17] rnbd-clt: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	Ilya Dryomov <idryomov@gmail.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Ming Lei <ming.lei@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, 
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Vineeth Vijayan <vneethv@linux.ibm.com>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5PokW8yg_3G.A.5BB.0dxzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2748
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMGffE=cpyWvxWwdmhyxhgBr7zxvqHS2BQwx-zm2=cm3VjRFxQ@mail.gmail.com
Resent-Date: Fri, 16 Feb 2024 08:06:12 +0000 (UTC)

On Thu, Feb 15, 2024 at 8:03=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> Pass the limits rnbd-clt imposes directly to blk_mq_alloc_disk instead
> of setting them one at a time.
>
> While at it don't set an explicit number of discard segments, as 1 is
> the default (which most drivers rely on).
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
lgtm, thx!
Acked-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>  drivers/block/rnbd/rnbd-clt.c | 64 ++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.=
c
> index d51be4f2df61a3..b7ffe03c61606d 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -1329,43 +1329,6 @@ static void rnbd_init_mq_hw_queues(struct rnbd_clt=
_dev *dev)
>         }
>  }
>
> -static void setup_request_queue(struct rnbd_clt_dev *dev,
> -                               struct rnbd_msg_open_rsp *rsp)
> -{
> -       blk_queue_logical_block_size(dev->queue,
> -                                    le16_to_cpu(rsp->logical_block_size)=
);
> -       blk_queue_physical_block_size(dev->queue,
> -                                     le16_to_cpu(rsp->physical_block_siz=
e));
> -       blk_queue_max_hw_sectors(dev->queue,
> -                                dev->sess->max_io_size / SECTOR_SIZE);
> -
> -       /*
> -        * we don't support discards to "discontiguous" segments
> -        * in on request
> -        */
> -       blk_queue_max_discard_segments(dev->queue, 1);
> -
> -       blk_queue_max_discard_sectors(dev->queue,
> -                                     le32_to_cpu(rsp->max_discard_sector=
s));
> -       dev->queue->limits.discard_granularity =3D
> -                                       le32_to_cpu(rsp->discard_granular=
ity);
> -       dev->queue->limits.discard_alignment =3D
> -                                       le32_to_cpu(rsp->discard_alignmen=
t);
> -       if (le16_to_cpu(rsp->secure_discard))
> -               blk_queue_max_secure_erase_sectors(dev->queue,
> -                                       le32_to_cpu(rsp->max_discard_sect=
ors));
> -       blk_queue_flag_set(QUEUE_FLAG_SAME_COMP, dev->queue);
> -       blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, dev->queue);
> -       blk_queue_max_segments(dev->queue, dev->sess->max_segments);
> -       blk_queue_io_opt(dev->queue, dev->sess->max_io_size);
> -       blk_queue_virt_boundary(dev->queue, SZ_4K - 1);
> -       blk_queue_write_cache(dev->queue,
> -                             !!(rsp->cache_policy & RNBD_WRITEBACK),
> -                             !!(rsp->cache_policy & RNBD_FUA));
> -       blk_queue_max_write_zeroes_sectors(dev->queue,
> -                                          le32_to_cpu(rsp->max_write_zer=
oes_sectors));
> -}
> -
>  static int rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev,
>                                    struct rnbd_msg_open_rsp *rsp, int idx=
)
>  {
> @@ -1403,18 +1366,41 @@ static int rnbd_clt_setup_gen_disk(struct rnbd_cl=
t_dev *dev,
>  static int rnbd_client_setup_device(struct rnbd_clt_dev *dev,
>                                     struct rnbd_msg_open_rsp *rsp)
>  {
> +       struct queue_limits lim =3D {
> +               .logical_block_size     =3D le16_to_cpu(rsp->logical_bloc=
k_size),
> +               .physical_block_size    =3D le16_to_cpu(rsp->physical_blo=
ck_size),
> +               .io_opt                 =3D dev->sess->max_io_size,
> +               .max_hw_sectors         =3D dev->sess->max_io_size / SECT=
OR_SIZE,
> +               .max_hw_discard_sectors =3D le32_to_cpu(rsp->max_discard_=
sectors),
> +               .discard_granularity    =3D le32_to_cpu(rsp->discard_gran=
ularity),
> +               .discard_alignment      =3D le32_to_cpu(rsp->discard_alig=
nment),
> +               .max_segments           =3D dev->sess->max_segments,
> +               .virt_boundary_mask     =3D SZ_4K - 1,
> +               .max_write_zeroes_sectors =3D
> +                       le32_to_cpu(rsp->max_write_zeroes_sectors),
> +       };
>         int idx =3D dev->clt_device_id;
>
>         dev->size =3D le64_to_cpu(rsp->nsectors) *
>                         le16_to_cpu(rsp->logical_block_size);
>
> -       dev->gd =3D blk_mq_alloc_disk(&dev->sess->tag_set, NULL, dev);
> +       if (rsp->secure_discard) {
> +               lim.max_secure_erase_sectors =3D
> +                       le32_to_cpu(rsp->max_discard_sectors);
> +       }
> +
> +       dev->gd =3D blk_mq_alloc_disk(&dev->sess->tag_set, &lim, dev);
>         if (IS_ERR(dev->gd))
>                 return PTR_ERR(dev->gd);
>         dev->queue =3D dev->gd->queue;
>         rnbd_init_mq_hw_queues(dev);
>
> -       setup_request_queue(dev, rsp);
> +       blk_queue_flag_set(QUEUE_FLAG_SAME_COMP, dev->queue);
> +       blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, dev->queue);
> +       blk_queue_write_cache(dev->queue,
> +                             !!(rsp->cache_policy & RNBD_WRITEBACK),
> +                             !!(rsp->cache_policy & RNBD_FUA));
> +
>         return rnbd_clt_setup_gen_disk(dev, rsp, idx);
>  }
>
> --
> 2.39.2
>

