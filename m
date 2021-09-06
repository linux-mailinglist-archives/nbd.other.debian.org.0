Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C573401F24
	for <lists+nbd@lfdr.de>; Mon,  6 Sep 2021 19:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CD8E6212E0; Mon,  6 Sep 2021 17:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep  6 17:27:09 2021
Old-Return-Path: <ulf.hansson@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8C6272128D
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Sep 2021 17:10:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.82 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mr4pjX1HzMOK for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Sep 2021 17:10:54 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linaro. - helo: .mail-lj1-x22c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 36F4A20863
	for <nbd@other.debian.org>; Mon,  6 Sep 2021 17:10:50 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id w4so12279562ljh.13
        for <nbd@other.debian.org>; Mon, 06 Sep 2021 10:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eBV6xJO0OJaH8jzRZsLqKsR9gePhFCKXaYbJlTL1SK0=;
        b=LFms5S3j0LvWEYimyPf3cb4Aisdn+Fk0RcpOrMN+ZdxUItBFt03MZgAJyCUWWC62gA
         xL6pVj/R4056hMSTJXWaAAW0XJxWY95ANL2inlfc7gjmf6BFW8UdEkjBN6OfL9igtewV
         2JgY9QMy4BbUAgVA1jm1THz+5T5uS585jDOW2nVtjNTStboUZCsKHDlx3pvPga5s2Aea
         dvtTuh0M4AIM0YiFHE2rv2jMoWzeXBDMGduAbcmjYKzTNfr7wM1AzhSBU6ieiQ9XTDvy
         XQyK9QeN2IRddAghms+zRMV1up63wzN38bLJRWblvnD5e2vOcie3vnIumG6eir16lfbi
         jm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eBV6xJO0OJaH8jzRZsLqKsR9gePhFCKXaYbJlTL1SK0=;
        b=KfMvnySAvFD4/74Aw2kml8CLJgdiBVH8EO5yh8OnRfKdv3ioxgnt0GI/RTqry3ii0L
         kdJ5YEdvCb9RGevmQ1iBOfGADp7h6k3bdjhtiTOGcuxsx1qfbHcvACod119XIO/yJQo9
         6L6J35tH1UBLxf1mo3JshDQbYAbs6eeEBbxpRvhMibfdyvbtKGJ2dJRHA8ZvkDwAnHCI
         sB/FqlwCxPwEiSHmyIM0eT5mS4Fyn2kMiX5PdxIrBIJ5knf8Y+SbAh/fWaFFPjSpwjeU
         /Oo6e2Grq46CAQvgi/C0NHIIj3hptaJN1Pv1Y4K9cSll3H06zjrV6RrJRScDAyMLk0pX
         L1eA==
X-Gm-Message-State: AOAM531PDpTtty6FbEbCk/nW+yP8wqkOXEEmCIz0gU7GYuWv9h0VoaJ4
	69Cd1gfLKVo9+5KdO+HXNRRX2nCCFAsc3IS0Of1tMw==
X-Google-Smtp-Source: ABdhPJxhSEFI8wMN4u5XHazx2hzbbCQEPxdsCfALNn+wlwsdQueMDsoHtriqduJghpS67u2M98pG6gst9sXWJqwHE5o=
X-Received: by 2002:a05:651c:1b3:: with SMTP id c19mr11757010ljn.16.1630948247165;
 Mon, 06 Sep 2021 10:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210830212538.148729-1-mcgrof@kernel.org> <20210830212538.148729-5-mcgrof@kernel.org>
In-Reply-To: <20210830212538.148729-5-mcgrof@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 6 Sep 2021 19:10:10 +0200
Message-ID: <CAPDyKFp9HTjQ_6c2tHuPhhixfcnFa8XQBrPO2PqoB113BszLJw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] mmc/core/block: add error handling support for add_disk()
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	"James E.J. Bottomley" <jejb@linux.ibm.com>, kbusch@kernel.org, sagi@grimberg.me, 
	Adrian Hunter <adrian.hunter@intel.com>, "Bean Huo (beanhuo)" <beanhuo@micron.com>, 
	Avri Altman <avri.altman@wdc.com>, Stephen Boyd <swboyd@chromium.org>, agk@redhat.com, 
	Mike Snitzer <snitzer@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@infradead.org>, Hannes Reinecke <hare@suse.de>, Bart Van Assche <bvanassche@acm.org>, 
	Ming Lei <ming.lei@redhat.com>, linux-scsi <linux-scsi@vger.kernel.org>, 
	linux-nvme@lists.infradead.org, linux-mmc <linux-mmc@vger.kernel.org>, 
	dm-devel@redhat.com, nbd@other.debian.org, 
	linux-block <linux-block@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pMeTmR8U1NG.A.8OG.t9kNhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1395
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAPDyKFp9HTjQ_6c2tHuPhhixfcnFa8XQBrPO2PqoB113BszLJw@mail.gmail.com
Resent-Date: Mon,  6 Sep 2021 17:27:09 +0000 (UTC)

On Mon, 30 Aug 2021 at 23:26, Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
>
> The caller only cleanups the disk if we pass on an allocated md
> but on error we return return ERR_PTR(ret), and so we must do all
> the unwinding ourselves.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Queued for v5.16 on the temporary devel branch, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/core/block.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index 6a15fdf6e5f2..9b2856aa6231 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -2453,9 +2453,14 @@ static struct mmc_blk_data *mmc_blk_alloc_req(struct mmc_card *card,
>         /* used in ->open, must be set before add_disk: */
>         if (area_type == MMC_BLK_DATA_AREA_MAIN)
>                 dev_set_drvdata(&card->dev, md);
> -       device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> +       ret = device_add_disk(md->parent, md->disk, mmc_disk_attr_groups);
> +       if (ret)
> +               goto err_cleanup_queue;
>         return md;
>
> + err_cleanup_queue:
> +       blk_cleanup_queue(md->disk->queue);
> +       blk_mq_free_tag_set(&md->queue.tag_set);
>   err_kfree:
>         kfree(md);
>   out:
> --
> 2.30.2
>

