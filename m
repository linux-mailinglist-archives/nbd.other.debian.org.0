Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4E5063BD
	for <lists+nbd@lfdr.de>; Tue, 19 Apr 2022 07:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 319C12035D; Tue, 19 Apr 2022 05:09:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 19 05:09:09 2022
Old-Return-Path: <jinpu.wang@ionos.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 52708202FC
	for <lists-other-nbd@bendel.debian.org>; Tue, 19 Apr 2022 04:51:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.81 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CvoieVVRwJ6t for <lists-other-nbd@bendel.debian.org>;
	Tue, 19 Apr 2022 04:51:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .ionos. - helo: .mail-lf1-x12e.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 386C720312
	for <nbd@other.debian.org>; Tue, 19 Apr 2022 04:51:49 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g19so13498859lfv.2
        for <nbd@other.debian.org>; Mon, 18 Apr 2022 21:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BI9yKDogyA9J1nIp2A5DqA5VrUzX8xmulCW+rbuq8PY=;
        b=SJ+jl8otuJP8V2SgmRrkKx5N5mzchzJWNs3wHGu/KEMaBtHJMlOSyPwEwTYRCJOsK0
         +ub417XW+OB47SmEbjExHhWdvjVWNP6f4maHx7wpcQ/meMLPTDZio2MhC3cJJ+CFcG7A
         WyaAXMErjpaI/XL4ZkxN4ZoByVo51Plmy8MlzTn6CKA4kPvTL6QPTM/FElDnmxz/4bAo
         dNPevLcXfcZa94Hc/QRZN/ahpyGhXVxqtHvMswx1d+ioXM8CH8EB0Ocsp4CDYa7mfCxx
         3EMIYtoYuS9+fNRK0znetQsYbQBpHaSNFwuzb6Pw3NmrbbAzHjf8OVLAsic0niCU/6Hj
         1cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BI9yKDogyA9J1nIp2A5DqA5VrUzX8xmulCW+rbuq8PY=;
        b=EyL2Kg5Ggt4rxrSFY2bqdpKOfyUTPZ8yiKWB1lttMBxfHBSRU4Q8XsuPXznADAAX8j
         RcQIXaBlRVYCzwWms5gblMbmVpUHSBupXGuZGbkeORErZyIdemPD+l+9eOeCmHAD9n0b
         TFqWyoV2LOPvTADJjWVgy2YNpILhwLyCGHWd0BWUKbgj6acn2MtsuOuIhJ6U07e/gzkV
         +rAJ+sQ6PSkM6N7HCjaKKqmQxwj2Wmfs/g653zrdN3/+M3tpd1y7TxgLOUHGjaJoBPxI
         CtZLuc3cz6/sJhmBjka1039HRNyHAwbt1VdX0sl6mEYvsWwzmeF0+K5DbEVoHoySur8c
         rczw==
X-Gm-Message-State: AOAM530iNtJroTknGNz/VLrvi3uEyPaUuvT4aXUhixj8zLj2mggO7mjh
	GoxeaJrUiY+/6/QhgJjDbOIXH8g7WgLRx3IcUUWYzA==
X-Google-Smtp-Source: ABdhPJyLR4ZusRr2xSa6FgTHa9kgMMN14+gTuhXJUl7advlAotvmYnqJxqDiVIivr0X1ZGDx839mhVaChBp2powMkIg=
X-Received: by 2002:a05:6512:10c5:b0:471:a703:bca4 with SMTP id
 k5-20020a05651210c500b00471a703bca4mr1289967lfg.581.1650343907228; Mon, 18
 Apr 2022 21:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220418045314.360785-1-hch@lst.de> <20220418045314.360785-11-hch@lst.de>
In-Reply-To: <20220418045314.360785-11-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Tue, 19 Apr 2022 06:51:12 +0200
Message-ID: <CAMGffEnxwHE_QgN2OS93BHe6U+XdYc_R5OmSROmF5F-HXK_E4A@mail.gmail.com>
Subject: Re: [PATCH 10/11] rnbd-srv: use bdev_discard_alignment
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Johannes Berg <johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Mike Snitzer <snitzer@kernel.org>, Song Liu <song@kernel.org>, 
	Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-um@lists.infradead.org, 
	linux-block@vger.kernel.org, nbd@other.debian.org, 
	virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-s390@vger.kernel.org, dm-devel@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rXhtxnpXYfN.A.b4D.1PkXiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2041
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMGffEnxwHE_QgN2OS93BHe6U+XdYc_R5OmSROmF5F-HXK_E4A@mail.gmail.com
Resent-Date: Tue, 19 Apr 2022 05:09:09 +0000 (UTC)

On Mon, Apr 18, 2022 at 6:53 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use bdev_discard_alignment to calculate the correct discard alignment
> offset even for partitions instead of just looking at the queue limit.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Thx!
Acked-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>  drivers/block/rnbd/rnbd-srv-dev.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
> index d080a0de59225..4309e52524691 100644
> --- a/drivers/block/rnbd/rnbd-srv-dev.h
> +++ b/drivers/block/rnbd/rnbd-srv-dev.h
> @@ -59,7 +59,7 @@ static inline int rnbd_dev_get_discard_granularity(const struct rnbd_dev *dev)
>
>  static inline int rnbd_dev_get_discard_alignment(const struct rnbd_dev *dev)
>  {
> -       return bdev_get_queue(dev->bdev)->limits.discard_alignment;
> +       return bdev_discard_alignment(dev->bdev);
>  }
>
>  #endif /* RNBD_SRV_DEV_H */
> --
> 2.30.2
>

