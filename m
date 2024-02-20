Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F285BC96
	for <lists+nbd@lfdr.de>; Tue, 20 Feb 2024 13:52:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BF32A20B9F; Tue, 20 Feb 2024 12:52:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 20 12:52:12 2024
Old-Return-Path: <idryomov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7721520B7B
	for <lists-other-nbd@bendel.debian.org>; Tue, 20 Feb 2024 11:20:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.891 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hRmj43qzCi6f for <lists-other-nbd@bendel.debian.org>;
	Tue, 20 Feb 2024 11:19:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BC08C206E7
	for <nbd@other.debian.org>; Tue, 20 Feb 2024 11:18:59 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3c132695f1bso4070478b6e.2
        for <nbd@other.debian.org>; Tue, 20 Feb 2024 03:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708427936; x=1709032736; darn=other.debian.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QnXxqyxgAOCE9B1gsdMTfmeu8SJJIbR4o3Oy9m1fJBo=;
        b=i5027TBUHid4C4HEeNwvhEsfB0rjN2i7D/9cD4ODTe0edbPGGuxwun5wCiuzPtuhkd
         FlyIM4+OSn9xr4X9hYRBE2ppWBBw9IaA14OYC+mIBSuwW+kPzGZcDxA0R4RoAJSOU/ht
         1SCwxUxPsyXY+gV7iW4wNUntmSDrhDg6IDeoAtFRFMS53syq79yp9rDyEiXHLVnnk5Jq
         3ffTg6yF06ig8acnwlNb1cGXT8x9p6HebTPQxDgK9fs3lXPvtvddUxHTQifIyy2ZbBQz
         FgHjjbdE2ns3b36hNEoxpkTDYHYTqWvnlPYeFqu7JXGywvuMkhwhDsTWWgv1CBaB7jOd
         omHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708427936; x=1709032736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnXxqyxgAOCE9B1gsdMTfmeu8SJJIbR4o3Oy9m1fJBo=;
        b=qs2VLIoXXNm2mXubYcjC9sjGcrmVZZ0k+suOFHQA2iwc6TxYmvlznwoWHL6UtPcnH+
         Chf6z4LTs0YGPqwvTDB4oUOfNMTlOO8IZoehYWXEeNmcCk29AR7Oyge1yYMMDn2fpktX
         F4XsCyYpSiWiU+a7XQiGoQqFQYafo/5McWzZHimvF967TUzcBijDuMAJyHPtfa2pBoQt
         nlFAnqJkEN7x5SLKmigz3kWt1vAtTeYaLTnOLakJBtzoZ6nnzbiT4YfP1Fn3gia7HY0y
         lu1j/kOgxzwBTEFg6uQ4uNneS5Gs6KglVIDlsOpu232gAqaIAe+LzfgVNVwOu97S3DCE
         0/6w==
X-Forwarded-Encrypted: i=1; AJvYcCXPlLzwvFPZYVEtA1nFdkwZd3PveQSctvSD/fwOUzRAKf3PMDpe5M6wGS1x1CDnaAOBBrp3jQoZ3Pm4zwxdPnGyJOLEmw==
X-Gm-Message-State: AOJu0Yxa0JZxIB6QEs0hoxXmPC5SjmWeI5dh3dJ5wjgvK9iiiPGh+/Tz
	/s6sv/JPT59WeMzJQd+pl+7ctajhmPvMImyd9gr4NSQ5wj5z2asy9mzzvCOHWu6UydEAO+1nvpe
	vff9DEbQl3jtIdWhvU5JtDd6hWWc=
X-Google-Smtp-Source: AGHT+IFqXfo9MqRRXkJHVGd1zP5btF8tonhuNN58hdV1sWRe6/06+YeQrZc/xVd+r5scxRDkntVJIrsGV3fU9rwHZzE=
X-Received: by 2002:a05:6808:201a:b0:3c1:5fa3:ab8 with SMTP id
 q26-20020a056808201a00b003c15fa30ab8mr4610653oiw.39.1708427936094; Tue, 20
 Feb 2024 03:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-8-hch@lst.de>
In-Reply-To: <20240215070300.2200308-8-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Tue, 20 Feb 2024 12:18:44 +0100
Message-ID: <CAOi1vP9K=YYrtuCGF5B41He8D5q2zSmiCHjHezo0Dgu1gKH4+w@mail.gmail.com>
Subject: Re: [PATCH 07/17] rbd: pass queue_limits to blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>, 
	Josef Bacik <josef@toxicpanda.com>, Geoff Levand <geoff@infradead.org>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, 
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
Resent-Message-ID: <Np3w_v3794C.A.6pD.8BK1lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2753
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAOi1vP9K=YYrtuCGF5B41He8D5q2zSmiCHjHezo0Dgu1gKH4+w@mail.gmail.com
Resent-Date: Tue, 20 Feb 2024 12:52:12 +0000 (UTC)

On Thu, Feb 15, 2024 at 8:03=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> Pass the limits rbd imposes directly to blk_mq_alloc_disk instead
> of setting them one at a time.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rbd.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index 6b4f1898a722a3..26ff5cd2bf0abc 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -4952,6 +4952,14 @@ static int rbd_init_disk(struct rbd_device *rbd_de=
v)
>         struct request_queue *q;
>         unsigned int objset_bytes =3D
>             rbd_dev->layout.object_size * rbd_dev->layout.stripe_count;
> +       struct queue_limits lim =3D {
> +               .max_hw_sectors         =3D objset_bytes >> SECTOR_SHIFT,
> +               .max_user_sectors       =3D objset_bytes >> SECTOR_SHIFT,
> +               .io_min                 =3D rbd_dev->opts->alloc_size,
> +               .io_opt                 =3D rbd_dev->opts->alloc_size,
> +               .max_segments           =3D USHRT_MAX,
> +               .max_segment_size       =3D UINT_MAX,
> +       };
>         int err;
>
>         memset(&rbd_dev->tag_set, 0, sizeof(rbd_dev->tag_set));
> @@ -4966,7 +4974,13 @@ static int rbd_init_disk(struct rbd_device *rbd_de=
v)
>         if (err)
>                 return err;
>
> -       disk =3D blk_mq_alloc_disk(&rbd_dev->tag_set, NULL, rbd_dev);
> +       if (rbd_dev->opts->trim) {
> +               lim.discard_granularity =3D rbd_dev->opts->alloc_size;
> +               lim.max_hw_discard_sectors =3D objset_bytes >> SECTOR_SHI=
FT;
> +               lim.max_write_zeroes_sectors =3D objset_bytes >> SECTOR_S=
HIFT;
> +       }
> +
> +       disk =3D blk_mq_alloc_disk(&rbd_dev->tag_set, &lim, rbd_dev);
>         if (IS_ERR(disk)) {
>                 err =3D PTR_ERR(disk);
>                 goto out_tag_set;
> @@ -4987,19 +5001,6 @@ static int rbd_init_disk(struct rbd_device *rbd_de=
v)
>         blk_queue_flag_set(QUEUE_FLAG_NONROT, q);
>         /* QUEUE_FLAG_ADD_RANDOM is off by default for blk-mq */
>
> -       blk_queue_max_hw_sectors(q, objset_bytes >> SECTOR_SHIFT);
> -       q->limits.max_sectors =3D queue_max_hw_sectors(q);
> -       blk_queue_max_segments(q, USHRT_MAX);
> -       blk_queue_max_segment_size(q, UINT_MAX);
> -       blk_queue_io_min(q, rbd_dev->opts->alloc_size);
> -       blk_queue_io_opt(q, rbd_dev->opts->alloc_size);
> -
> -       if (rbd_dev->opts->trim) {
> -               q->limits.discard_granularity =3D rbd_dev->opts->alloc_si=
ze;
> -               blk_queue_max_discard_sectors(q, objset_bytes >> SECTOR_S=
HIFT);
> -               blk_queue_max_write_zeroes_sectors(q, objset_bytes >> SEC=
TOR_SHIFT);
> -       }
> -
>         if (!ceph_test_opt(rbd_dev->rbd_client->client, NOCRC))
>                 blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, q);
>
> --
> 2.39.2
>

Acked-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

