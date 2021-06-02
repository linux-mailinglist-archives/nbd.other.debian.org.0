Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC023983CE
	for <lists+nbd@lfdr.de>; Wed,  2 Jun 2021 10:06:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1A3D5206A3; Wed,  2 Jun 2021 08:06:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  2 08:06:10 2021
Old-Return-Path: <jinpu.wang@ionos.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5934F206C1
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Jun 2021 07:49:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.82 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QAMfKzefGlm6 for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Jun 2021 07:49:43 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .ionos. - helo: .mail-ed1-x52a.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A091B206BE
	for <nbd@other.debian.org>; Wed,  2 Jun 2021 07:49:40 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id b11so1785617edy.4
        for <nbd@other.debian.org>; Wed, 02 Jun 2021 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IviQGHXbohDYlY4Kaxm/cxlbY44V3tAurEYksJ8dtbE=;
        b=jCNYXrovW1sUHaOT/+lw4PCDhP0eyRFf+ELw7YXWBCDBnLin+ptT9Qqbj9mRkWWaUg
         wGBYm/DlmYSjFuDFdCiAFeYUhwBx3bN1zWIfEq4U/R6NzUaRvMrhsPRnKTgM5MVFJVxB
         CmVxljvKTCN3ZyT1LwzUVWKZgE4x9cRuQaj0TjoJvUnlN68E3Mt+4zAfSoenpZB5Ofxb
         0XLwmhqFLm1lOHsISGA/CxlwAihZibid3kenEAmMklVKKOHOy1nSq3KrSTTjFuaKWHai
         u516kaTGPG4uhGM5WuZ/+lvOuzezIo89jko54Ak3T4r5ol1iQsDze8x0V5mTappbPtSr
         aaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IviQGHXbohDYlY4Kaxm/cxlbY44V3tAurEYksJ8dtbE=;
        b=G+O8A/gOlN5Hk6ezLAaJv/qJZkqWrshDOKY/zRW5543GakNQa/gW705csw73Uhqb+M
         TJRH+5luuGqzW1Lb4aOO0e9CblTSDAPk79Bb9kIY/tO/msSCh5BGWdHm7cOBC9bdR5xd
         dWzjV7U1akitwAGo6vPvMZelTI7jLXnvzeV3KUWHdv5UvjzX3MzoOLtkKLzL3EGk0mpv
         on4zwmfnh+v8OkJKde0+QLP7S9UgO2bUWk4JjvivgN8p6V+jnkPDkoqkfjJfcatBB6U4
         VOI1jh0cl70p1M6VftOhusV6B5IS5I5pdwcn2GKx9uctProu3P88d+CDf1FOiu0HFPbf
         tkkg==
X-Gm-Message-State: AOAM533+Qcxh8iWc/fZNkVuozZnyqGikqyPu6rjGgSmrn2vcsjemhhal
	OtPb6kE+ogu+ALuAbvtBxCt82vng/pTrr7DcehKOyw==
X-Google-Smtp-Source: ABdhPJzRCVGimPnGT3qQlEAMsZsY3IxcZZF186UcWgTyI7ay8iWe4IlRIEG5WowCojeDoPju71hCmgBQ+xR7PgbbWL0=
X-Received: by 2002:aa7:c693:: with SMTP id n19mr33130385edq.35.1622620178044;
 Wed, 02 Jun 2021 00:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210602065345.355274-1-hch@lst.de> <20210602065345.355274-24-hch@lst.de>
In-Reply-To: <20210602065345.355274-24-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 2 Jun 2021 09:49:27 +0200
Message-ID: <CAMGffEn7aCmTOTsuzbSr=DwomFKfizkNhzsZnAONHBq1neW2Og@mail.gmail.com>
Subject: Re: [PATCH 23/30] rnbd: use blk_mq_alloc_disk and blk_cleanup_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Denis Efremov <efremov@linux.com>, Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>, 
	Geoff Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, 
	Alex Dubov <oakad@yahoo.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, 
	device-mapper development <dm-devel@redhat.com>, linux-block <linux-block@vger.kernel.org>, nbd@other.debian.org, 
	linuxppc-dev@lists.ozlabs.org, Ceph Development <ceph-devel@vger.kernel.org>, 
	virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <QsodGYRQfsG.A.im.yvztgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1195
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMGffEn7aCmTOTsuzbSr=DwomFKfizkNhzsZnAONHBq1neW2Og@mail.gmail.com
Resent-Date: Wed,  2 Jun 2021 08:06:10 +0000 (UTC)

On Wed, Jun 2, 2021 at 8:55 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
> request_queue allocation.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rnbd/rnbd-clt.c | 35 ++++++++---------------------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
> index c604a402cd5c..f4fa45d24c0b 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -1353,18 +1353,6 @@ static void rnbd_init_mq_hw_queues(struct rnbd_clt_dev *dev)
>         }
>  }
>
> -static int setup_mq_dev(struct rnbd_clt_dev *dev)
> -{
> -       dev->queue = blk_mq_init_queue(&dev->sess->tag_set);
> -       if (IS_ERR(dev->queue)) {
> -               rnbd_clt_err(dev, "Initializing multiqueue queue failed, err: %ld\n",
> -                             PTR_ERR(dev->queue));
> -               return PTR_ERR(dev->queue);
> -       }
> -       rnbd_init_mq_hw_queues(dev);
> -       return 0;
> -}
> -
>  static void setup_request_queue(struct rnbd_clt_dev *dev)
>  {
>         blk_queue_logical_block_size(dev->queue, dev->logical_block_size);
> @@ -1393,13 +1381,13 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
>         blk_queue_io_opt(dev->queue, dev->sess->max_io_size);
>         blk_queue_virt_boundary(dev->queue, SZ_4K - 1);
>         blk_queue_write_cache(dev->queue, dev->wc, dev->fua);
> -       dev->queue->queuedata = dev;
>  }
>
>  static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
>  {
>         dev->gd->major          = rnbd_client_major;
>         dev->gd->first_minor    = idx << RNBD_PART_BITS;
> +       dev->gd->minors         = 1 << RNBD_PART_BITS;
>         dev->gd->fops           = &rnbd_client_ops;
>         dev->gd->queue          = dev->queue;
>         dev->gd->private_data   = dev;
> @@ -1426,24 +1414,18 @@ static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
>
>  static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
>  {
> -       int err, idx = dev->clt_device_id;
> +       int idx = dev->clt_device_id;
>
>         dev->size = dev->nsectors * dev->logical_block_size;
>
> -       err = setup_mq_dev(dev);
> -       if (err)
> -               return err;
> +       dev->gd = blk_mq_alloc_disk(&dev->sess->tag_set, dev);
> +       if (IS_ERR(dev->gd))
> +               return PTR_ERR(dev->gd);
> +       dev->queue = dev->gd->queue;
> +       rnbd_init_mq_hw_queues(dev);
>
>         setup_request_queue(dev);
> -
> -       dev->gd = alloc_disk_node(1 << RNBD_PART_BITS,  NUMA_NO_NODE);
> -       if (!dev->gd) {
> -               blk_cleanup_queue(dev->queue);
> -               return -ENOMEM;
> -       }
> -
>         rnbd_clt_setup_gen_disk(dev, idx);
> -
>         return 0;
>  }
>
> @@ -1650,8 +1632,7 @@ struct rnbd_clt_dev *rnbd_clt_map_device(const char *sessname,
>  static void destroy_gen_disk(struct rnbd_clt_dev *dev)
>  {
>         del_gendisk(dev->gd);
> -       blk_cleanup_queue(dev->queue);
> -       put_disk(dev->gd);
> +       blk_cleanup_disk(dev->gd);
>  }
>
>  static void destroy_sysfs(struct rnbd_clt_dev *dev,
> --
> 2.30.2

Looks good to me, thx!
Reviewed-by: Jack Wang <jinpu.wang@ionos.com>
>

