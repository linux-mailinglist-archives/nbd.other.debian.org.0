Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 185232AB1A9
	for <lists+nbd@lfdr.de>; Mon,  9 Nov 2020 08:12:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DA628201C4; Mon,  9 Nov 2020 07:12:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov  9 07:12:08 2020
Old-Return-Path: <jinpu.wang@cloud.ionos.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2050E201C0
	for <lists-other-nbd@bendel.debian.org>; Mon,  9 Nov 2020 06:56:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.92 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eTHWMd_9lmjq for <lists-other-nbd@bendel.debian.org>;
	Mon,  9 Nov 2020 06:56:49 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .ionos. - helo: .mail-ed1-x544.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AE877201B1
	for <nbd@other.debian.org>; Mon,  9 Nov 2020 06:56:46 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id q3so7527585edr.12
        for <nbd@other.debian.org>; Sun, 08 Nov 2020 22:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lhEWojdnEETMpoDmZaKWZITR453k36pmv/sfAr6vN/Q=;
        b=OlOP6e+hTTnzcMIwdaF/T/hnfIBf/9oJMDqvqjYzplHIQ4xMgH25+911Ixq0B3+K58
         5Dj/JmHZRD8Yi8zqOu+1rKF07XS2mrjA0Wv9PMukIV3uX40Qn/weu/uMdAMCHG7RU935
         A8pgkbko6hNqb1nFuLU3A3PiBPYVj8XjATb55mVvvHvMOvvFHanlnCDmyhaMxkXN6DKS
         Bf5AgcB50gTwwmoZvVJaG5dtCbnwCB8M7N5x+uhcjSrbjJF9nKnn2cuHHSz7I/a4akR/
         xE89AMdrexbc31NBbIF2vvHpBBUezGpS6XdWxnMo7c/NgKk9nHTIb/0D5wlGo0gz8gEr
         D1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lhEWojdnEETMpoDmZaKWZITR453k36pmv/sfAr6vN/Q=;
        b=Zq+1nrewVcZTiIX86TGOHeV224RQEVmPqy57p4ljq7E9H0dJEeXDL0Ivv4leXbCxn9
         6LaIHMAOBNiiYVoFvy/MguEwWYDFXwwLaEJ10/sMgvEKnyG9YU6EiPby+P5VsT2OXqBo
         fi/u1tpYBmjzQl9mLw9wbqXT62S66K6yGeWEcz1L07XJJRYusJxcKuUpA5ab3jWFiaPy
         a2BjyblX/Onzqtj8ns1OzoBP99LmrXUeHwZ+M6tSdbOX4LYij+klEx2CRtZH+Gicui+L
         B37G855DcFayg6CNLr3uQHjoTYkYAW/2rUfMJLSG7cw2Hu6KAgQuzV8YW3R0S2BcoXK9
         J9jA==
X-Gm-Message-State: AOAM530q9GRE9vSj++3yqf+5ygPYoHJnzf2D/Wo5Exvbbx/yjb3KV3/D
	sJN/W/X9HMZKpnu0Fg1lMqH7FY3zYYgV8tqzC73s1A==
X-Google-Smtp-Source: ABdhPJy5lMTAmAT8/Ewb7MyKs6V0kAUlIo1q9lM6dl2oB700nsAVEi6e4At1FesCFzDNwPnUu593st+zxY/BthW2KiM=
X-Received: by 2002:a50:fc89:: with SMTP id f9mr14573990edq.89.1604905003672;
 Sun, 08 Nov 2020 22:56:43 -0800 (PST)
MIME-Version: 1.0
References: <20201106190337.1973127-1-hch@lst.de> <20201106190337.1973127-19-hch@lst.de>
In-Reply-To: <20201106190337.1973127-19-hch@lst.de>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Mon, 9 Nov 2020 07:56:32 +0100
Message-ID: <CAMGffEnRgesKniK_X5b2nAoiQ_i6xqL4gnCw7dJxapkD-6Dvwg@mail.gmail.com>
Subject: Re: [PATCH 18/24] rnbd: use set_capacity_and_notify
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	device-mapper development <dm-devel@redhat.com>, linux-block@vger.kernel.org, 
	drbd-dev@lists.linbit.com, nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-raid <linux-raid@vger.kernel.org>, 
	linux-nvme@lists.infradead.org, 
	Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dwN8fgmIR5D.A.ddB.IvOqfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1042
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMGffEnRgesKniK_X5b2nAoiQ_i6xqL4gnCw7dJxapkD-6Dvwg@mail.gmail.com
Resent-Date: Mon,  9 Nov 2020 07:12:08 +0000 (UTC)

On Fri, Nov 6, 2020 at 8:04 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Use set_capacity_and_notify to set the size of both the disk and block
> device.  This also gets the uevent notifications for the resize for free.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Thanks, Christoph!
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> ---
>  drivers/block/rnbd/rnbd-clt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
> index 8b2411ccbda97c..bb13d7dd195a08 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -100,8 +100,7 @@ static int rnbd_clt_change_capacity(struct rnbd_clt_dev *dev,
>         rnbd_clt_info(dev, "Device size changed from %zu to %zu sectors\n",
>                        dev->nsectors, new_nsectors);
>         dev->nsectors = new_nsectors;
> -       set_capacity(dev->gd, dev->nsectors);
> -       revalidate_disk_size(dev->gd, true);
> +       set_capacity_and_notify(dev->gd, dev->nsectors);
>         return 0;
>  }
>
> --
> 2.28.0
>

