Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D4E39A509
	for <lists+nbd@lfdr.de>; Thu,  3 Jun 2021 17:54:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1289A2058A; Thu,  3 Jun 2021 15:54:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  3 15:54:20 2021
Old-Return-Path: <ulf.hansson@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4AEF020532
	for <lists-other-nbd@bendel.debian.org>; Thu,  3 Jun 2021 15:37:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.92 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IBb8_qQBt3PN for <lists-other-nbd@bendel.debian.org>;
	Thu,  3 Jun 2021 15:37:25 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linaro. - helo: .mail-vs1-xe29.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BF65620585
	for <nbd@other.debian.org>; Thu,  3 Jun 2021 15:37:22 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id z15so3208940vsn.13
        for <nbd@other.debian.org>; Thu, 03 Jun 2021 08:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+W0QahdA5jm5lLp4qGqziVkevJrOYYIsAeli4hbSoMY=;
        b=Sczm7Uhat9CAttKCKONsBvTvpdWX5VANaO58Cd0mJFcJ+A28Gj9YspGmhSWIpVtNS9
         gufvY+CGT5FXDIQfjOQ4ExwQIrmSjUqzpGxTG/ZkK/nXRMIOjYsW6gd0+0ljDlvbLbq6
         AyHgMcG1V7VrDrAancwHixbwlfPPPcOtQ/Us++pps4NpXbaz33l8+avCCapAkCFya/10
         FcaqevmvQJz8RurkVjboQlMdJ4KLmCFgJ9aWml7eHxoV4e7eWIKwWiCmbJjrhvsDE5K2
         PLLnqagHSU8ORkIhfE1C9Sx6ZNkln7FGogf+yyT7tKXsIRL7oAHDTXDC0cZ4GcZV2dc7
         4ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+W0QahdA5jm5lLp4qGqziVkevJrOYYIsAeli4hbSoMY=;
        b=o86bF6VoH3Xl4MXOJfHcbDc0Xin9aH0uZG3+55AoYFF4pGli+s1/of1CdMcIKzLlUD
         T2JaRRfOPxYvlMC+Ft1ttu1p/w9STAibVEGDSz6s5qAtOycC2k+ucs/6+OfgoU87TEXT
         AXSnFqvvydv+ZfBkQeVbOtWjhz6FK+Eb1QAszTo5c4M14z/GlDYlz2+BfkabgBvDZ9u4
         44rYoY7VgG7EBnf07UV95S4KPpefUtWKUr6fpzN6ccq2qf2DYXrQxl4JTomiHGYcXGfV
         dG5hpv53h0YMjMqq+t7WqwX28F9nppgwD/hDblKy7WS0i/sT5zP5C0msK4wwvugjkUC3
         +HJQ==
X-Gm-Message-State: AOAM531CJZ6CYBOjAFgrvLHt8cLyOf9PAZt2JA78kF/EIhXjDIk5EPs8
	bNXaPUNLyXw038cYVZgxE2dLMYj0A5zHFsJeqARsBA==
X-Google-Smtp-Source: ABdhPJzM3LSrPJI4FkB0laodTTeEei+m50SowhpqaGtsNgUdvieHcvbYUQloJUD/a79xzNmd816023E4d1PORKHhPJg=
X-Received: by 2002:a05:6102:3023:: with SMTP id v3mr756919vsa.19.1622734639015;
 Thu, 03 Jun 2021 08:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210602065345.355274-1-hch@lst.de> <20210602065345.355274-8-hch@lst.de>
In-Reply-To: <20210602065345.355274-8-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jun 2021 17:36:42 +0200
Message-ID: <CAPDyKFoJssCnHv5tmG4vJJ9m0Zj5HkMEVYvnsjamvyemusZaUg@mail.gmail.com>
Subject: Re: [PATCH 07/30] ms_block: use blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Denis Efremov <efremov@linux.com>, Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>, 
	Geoff Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, 
	Alex Dubov <oakad@yahoo.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com, 
	linux-block <linux-block@vger.kernel.org>, nbd@other.debian.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, ceph-devel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
	linux-mmc <linux-mmc@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0UKPO79qPJB.A.8hH.ssPugB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1207
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAPDyKFoJssCnHv5tmG4vJJ9m0Zj5HkMEVYvnsjamvyemusZaUg@mail.gmail.com
Resent-Date: Thu,  3 Jun 2021 15:54:20 +0000 (UTC)

On Wed, 2 Jun 2021 at 08:54, Christoph Hellwig <hch@lst.de> wrote:
>
> Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
> allocation.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/memstick/core/ms_block.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
> index 0bacf4268f83..dac258d12aca 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -2110,21 +2110,17 @@ static int msb_init_disk(struct memstick_dev *card)
>         if (msb->disk_id  < 0)
>                 return msb->disk_id;
>
> -       msb->disk = alloc_disk(0);
> -       if (!msb->disk) {
> -               rc = -ENOMEM;
> +       rc = blk_mq_alloc_sq_tag_set(&msb->tag_set, &msb_mq_ops, 2,
> +                                    BLK_MQ_F_SHOULD_MERGE);
> +       if (rc)
>                 goto out_release_id;
> -       }
>
> -       msb->queue = blk_mq_init_sq_queue(&msb->tag_set, &msb_mq_ops, 2,
> -                                               BLK_MQ_F_SHOULD_MERGE);
> -       if (IS_ERR(msb->queue)) {
> -               rc = PTR_ERR(msb->queue);
> -               msb->queue = NULL;
> -               goto out_put_disk;
> +       msb->disk = blk_mq_alloc_disk(&msb->tag_set, card);
> +       if (IS_ERR(msb->disk)) {
> +               rc = PTR_ERR(msb->disk);
> +               goto out_free_tag_set;
>         }
> -
> -       msb->queue->queuedata = card;
> +       msb->queue = msb->disk->queue;
>
>         blk_queue_max_hw_sectors(msb->queue, MS_BLOCK_MAX_PAGES);
>         blk_queue_max_segments(msb->queue, MS_BLOCK_MAX_SEGS);
> @@ -2135,7 +2131,6 @@ static int msb_init_disk(struct memstick_dev *card)
>         sprintf(msb->disk->disk_name, "msblk%d", msb->disk_id);
>         msb->disk->fops = &msb_bdops;
>         msb->disk->private_data = msb;
> -       msb->disk->queue = msb->queue;
>
>         capacity = msb->pages_in_block * msb->logical_block_count;
>         capacity *= (msb->page_size / 512);
> @@ -2155,8 +2150,8 @@ static int msb_init_disk(struct memstick_dev *card)
>         dbg("Disk added");
>         return 0;
>
> -out_put_disk:
> -       put_disk(msb->disk);
> +out_free_tag_set:
> +       blk_mq_free_tag_set(&msb->tag_set);
>  out_release_id:
>         mutex_lock(&msb_disk_lock);
>         idr_remove(&msb_disk_idr, msb->disk_id);
> --
> 2.30.2
>

