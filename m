Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4B450EB4E
	for <lists+nbd@lfdr.de>; Mon, 25 Apr 2022 23:33:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4781D2030F; Mon, 25 Apr 2022 21:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 25 21:33:09 2022
Old-Return-Path: <song@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E3C292024C
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Apr 2022 21:17:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.765 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1,
	DKIMWL_WL_HIGH=-0.575, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2jItt4_XW4-7 for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Apr 2022 21:17:53 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 532 seconds by postgrey-1.36 at bendel; Mon, 25 Apr 2022 21:17:53 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3F0592023E
	for <nbd@other.debian.org>; Mon, 25 Apr 2022 21:17:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C75E6140B
	for <nbd@other.debian.org>; Mon, 25 Apr 2022 21:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA1EC385BD
	for <nbd@other.debian.org>; Mon, 25 Apr 2022 21:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650920910;
	bh=yN2FFsgqiwWmpQIWXC94b82E2wpYjQTq/CU/u3g3cjE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pdKHj+9jtFEKRxbFIKbp6BN5W0SKHdhPUGdQDXd7Xqx9vi4EpkMV1Y4FokX/IkPYa
	 fcHGk/4On2XWYf3uADhfEsr+7LxnZ49Mj82N7KMHrZLd/dwLJ08US+RaehkUasA6/k
	 ULzEmN8W11D5KZ+Cm4S93JoYXPgu2ne6zBKyDbG+PP7TNy6nKJUI/Prlkq4aTHvM+N
	 eDTgN5VZZLATieGxC8vMqcHVTHdQIL63mmQQGdiCPeBj+cARAR4cnGnqJ35UI9ZFbn
	 uSL8Ys/PCGOp1a6uCJDJdZhN6mhZ0J51T+/xZ6Bj+aFJUo7nkxoRQiwNXWKGnT6ByK
	 ZiFdXEcFhWfZg==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2f7bb893309so82512697b3.12
        for <nbd@other.debian.org>; Mon, 25 Apr 2022 14:08:30 -0700 (PDT)
X-Gm-Message-State: AOAM531EePGaxCJPvUbQVUZz5OfdJIpexUajqQIrJw30z8Ze/c+eZuaB
	bmZ2b6toL7ZEX1YT9/biBtnFoJpgnDLJifLE9ng=
X-Google-Smtp-Source: ABdhPJxgUnh58spmwdi5KGXzmrzAEx/WM60nf6Oi6YSWPgwfZEJsfaGjWIDBRUKlPyettQyT9R0PC00gVw9kzJ9ffYQ=
X-Received: by 2002:a0d:e343:0:b0:2f7:cefb:577b with SMTP id
 m64-20020a0de343000000b002f7cefb577bmr9909411ywe.472.1650920909604; Mon, 25
 Apr 2022 14:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220418045314.360785-1-hch@lst.de> <20220418045314.360785-7-hch@lst.de>
In-Reply-To: <20220418045314.360785-7-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Mon, 25 Apr 2022 14:08:18 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7fpiAqAf+U491dTH4mWORZQCxfyT6zWQwN=4r5WJ429Q@mail.gmail.com>
Message-ID: <CAPhsuW7fpiAqAf+U491dTH4mWORZQCxfyT6zWQwN=4r5WJ429Q@mail.gmail.com>
Subject: Re: [PATCH 06/11] raid5: don't set the discard_alignment queue limit
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Johannes Berg <johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Mike Snitzer <snitzer@kernel.org>, Stefan Haberland <sth@linux.ibm.com>, 
	Jan Hoeppner <hoeppner@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
	nbd@other.debian.org, virtualization@lists.linux-foundation.org, 
	xen-devel@lists.xenproject.org, linux-raid <linux-raid@vger.kernel.org>, 
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org, 
	dm-devel@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8ufavrt2xGI.A.T1F.VOxZiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2047
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAPhsuW7fpiAqAf+U491dTH4mWORZQCxfyT6zWQwN=4r5WJ429Q@mail.gmail.com
Resent-Date: Mon, 25 Apr 2022 21:33:09 +0000 (UTC)

On Sun, Apr 17, 2022 at 9:53 PM Christoph Hellwig <hch@lst.de> wrote:
>
> The discard_alignment queue limit is named a bit misleading means the
> offset into the block device at which the discard granularity starts.
> Setting it to the discard granularity as done by raid5 is mostly
> harmless but also useless.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

> ---
>  drivers/md/raid5.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> index 59f91e392a2ae..39b0afdf40d0a 100644
> --- a/drivers/md/raid5.c
> +++ b/drivers/md/raid5.c
> @@ -7749,7 +7749,6 @@ static int raid5_run(struct mddev *mddev)
>                  */
>                 stripe = stripe * PAGE_SIZE;
>                 stripe = roundup_pow_of_two(stripe);
> -               mddev->queue->limits.discard_alignment = stripe;
>                 mddev->queue->limits.discard_granularity = stripe;
>
>                 blk_queue_max_write_zeroes_sectors(mddev->queue, 0);
> --
> 2.30.2
>

