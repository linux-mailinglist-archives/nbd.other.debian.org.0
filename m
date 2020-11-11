Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 912162AEE8D
	for <lists+nbd@lfdr.de>; Wed, 11 Nov 2020 11:12:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 73C8D2033C; Wed, 11 Nov 2020 10:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Nov 11 10:12:09 2020
Old-Return-Path: <idryomov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C913A20356
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Nov 2020 09:55:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.821 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NRWGkrkt2T8r for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Nov 2020 09:55:48 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9DBC82033C
	for <nbd@other.debian.org>; Wed, 11 Nov 2020 09:55:48 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id g15so1420283ilc.9
        for <nbd@other.debian.org>; Wed, 11 Nov 2020 01:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qfEf7xRtwJh6vel7ndE10SMbjF6zTEFOWV8RA9xu3eI=;
        b=Flu0kG/G8H5tmdzF22ns+x1T3WixC4FBs0RbA9YeGx20Pw3IL573gomPOrRSgLhidi
         jxm4xXdraWCqe23Uz/lTRF5Gzul+neu0ZW5SRlL8rLtuRaQOMWWnKLr+e1J5E2f/IB4R
         iaO9iEipyz2F49FzVbspMmUTamyYBNigOi7Hq45S5vTkNhsbMM69J9bWbbawzfmKvyaE
         prBgh+sprAAWuhDKQzcpJRm9c4LoRmjW0z3OGufy4OEk4vgw7impUerADJ8+P1l4Evs/
         gUeZGg6Qzu0m4oCwYhIr6na+Ay9Hq4ATHKFwzo1XQC1pmqP6NOhCJ7ijtefRPRR/Tb4r
         FFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qfEf7xRtwJh6vel7ndE10SMbjF6zTEFOWV8RA9xu3eI=;
        b=bq4XtMgYOwCmRwyPHqFPBTL/iEZl2vENFJXa/wx27NNJyDKB1KvGKBJnkATqYRxoSH
         ducljwNjdvMPwNSqbhblOoUa6Inxw+eq88oCY9BR84wxCIoqKgvo0epDlgi4ShqYaubU
         QuYa5ICAJ/V3sh51F/TyFt6nYUvRGyE+hBce9fE16EzEv0QpPT0G8P1GIaspU0bYqmZ1
         qRypnP/W6MG+olB5kkX6i1i7/Y4xNqEzFVockSElM8fUPFBysdiPvoLKFC0ocCG0WxPL
         yeLlv9Vrx7VYiI11ba0EIJTI/6AwXJUEuw/Om3fRa+lFy+O17a1W0RS4cw0qNLft227e
         7+KQ==
X-Gm-Message-State: AOAM531gIwIyBg72sGOidEMQd71SE6fjjkGC5u6yMeEEOES0SPHvUO87
	Gi2vhhIiJVqTkWZ/USvILip9r5Rbay6WILK3q1M=
X-Google-Smtp-Source: ABdhPJy9ZPoku1YjH4P5V9sTrbXGNc0TDLR8E4ST1Mn4KA5kvu+HvwpbOUC5MO/5tCHlTeWvzQ658Y1GM8zrKYsupSY=
X-Received: by 2002:a92:1f43:: with SMTP id i64mr17516886ile.281.1605088545285;
 Wed, 11 Nov 2020 01:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20201111082658.3401686-1-hch@lst.de> <20201111082658.3401686-18-hch@lst.de>
In-Reply-To: <20201111082658.3401686-18-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 11 Nov 2020 10:55:45 +0100
Message-ID: <CAOi1vP-JjnNdAUqd9Gy6YdFgi8Ev4_Jt3zcB9DhAmdAvQhG7Eg@mail.gmail.com>
Subject: Re: [PATCH 17/24] rbd: use set_capacity_and_notify
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Josef Bacik <josef@toxicpanda.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com, 
	linux-block <linux-block@vger.kernel.org>, Lars Ellenberg <drbd-dev@lists.linbit.com>, 
	nbd@other.debian.org, Ceph Development <ceph-devel@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <M-eTN4IgTfK.A.QXD.5j7qfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1054
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAOi1vP-JjnNdAUqd9Gy6YdFgi8Ev4_Jt3zcB9DhAmdAvQhG7Eg@mail.gmail.com
Resent-Date: Wed, 11 Nov 2020 10:12:09 +0000 (UTC)

On Wed, Nov 11, 2020 at 9:27 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use set_capacity_and_notify to set the size of both the disk and block
> device.  This also gets the uevent notifications for the resize for free.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> ---
>  drivers/block/rbd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index f84128abade319..b7a194ffda55b4 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -4920,8 +4920,7 @@ static void rbd_dev_update_size(struct rbd_device *rbd_dev)
>             !test_bit(RBD_DEV_FLAG_REMOVING, &rbd_dev->flags)) {
>                 size = (sector_t)rbd_dev->mapping.size / SECTOR_SIZE;
>                 dout("setting size to %llu sectors", (unsigned long long)size);
> -               set_capacity(rbd_dev->disk, size);
> -               revalidate_disk_size(rbd_dev->disk, true);
> +               set_capacity_and_notify(rbd_dev->disk, size);
>         }
>  }
>
> --
> 2.28.0
>

Hi Christoph,

The Acked-by is wrong here.  I acked this patch (17/24, rbd), and Jack
acked the next one (18/24, rnbd).

Thanks,

                Ilya

