Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 26740271E7E
	for <lists+nbd@lfdr.de>; Mon, 21 Sep 2020 11:03:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 080A32091B; Mon, 21 Sep 2020 09:03:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 21 09:03:20 2020
Old-Return-Path: <sergei.shtylyov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	FREEMAIL_FROM,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1AC0520901
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Sep 2020 08:45:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.209 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.13,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qOYY_qjz9qRD for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Sep 2020 08:45:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A85CD208FE
	for <nbd@other.debian.org>; Mon, 21 Sep 2020 08:45:55 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id c2so10353896ljj.12
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 01:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CZmaZ187zMFdVdjh+DfPERuCP3WU0wLxzZIFDgqpQhQ=;
        b=UWXytXWmkq8pXmYqB0sXkFrf5u7O8zADyv3pKBcOd43273LrLEK/6dwQie7xrTzsFY
         om+1pH6WEDJNAT2FC5RZEXob/KRC6BhuELwRQTtlvWyS36FiytI4T13PRHgaPvhqTOmm
         JnxMoCogivVva8Xm2cqsnuYpJ5d7lJj6ft92HDVD4p/9uEForZYyO+gdHPYZMAUq++Qq
         M1rqpVX3Vnj2KoBKnqSQr5mA55K3Ux9Svkrgvl7128w9LytJpLCirpoWpIfX+fiWXgLN
         hfRQHGkBqoDrOX6dl6WzzpJsP4xUBo+tICCmmkS34li8nJVViMd6ZQnNGiU/epbwh+QT
         3mDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CZmaZ187zMFdVdjh+DfPERuCP3WU0wLxzZIFDgqpQhQ=;
        b=BHxvud9D7m3j7eVNcCf8FSvm4vE0jID9yye1Ufj3qS8fkmJid2Wq8Rf67H0YqQQ9FQ
         +C4Lwn9uH39q2jjan2GwSn4ODPTCU7HoC2PXsf2RbYuKlLg6vBnGDsfFm9n+5Jou7YRS
         /tVU69YrSTxv0WcAxJ8rcLmOS0CdRxrKlltGwKLtnY/0ib5TsapXBafzQW6UdVQd5Fv7
         ACVPCI6D3kjMfLegsZFyvXVrNTyh8Gnq/e6mSWN7/FfkwcARMBu5kLeUGdbHcFGUhEXw
         aP9BzYWiTsQppIGHB44TgHcQ4U7n2nOuQm+D4De6ctTf6gyjT8WOxWtyYc2AdmnLXhTX
         YUIw==
X-Gm-Message-State: AOAM531PhLaPLT2VY6P9tMC/OKSx2SfEB25Ze0x1+FTciVUHRVPsSvCc
	+z0V5dn2RYG1L9MXnrqI4XA=
X-Google-Smtp-Source: ABdhPJx5mav1W62IiUmXTaMhqLWi6f2dGUFFf8sbUeC0z4e5MZ82zAxsAmryelg6X6Izw+2IGouZSQ==
X-Received: by 2002:a2e:2c0e:: with SMTP id s14mr15080290ljs.174.1600677953001;
        Mon, 21 Sep 2020 01:45:53 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:485b:5520:1d32:5ffa:5dce:483f? ([2a00:1fa0:485b:5520:1d32:5ffa:5dce:483f])
        by smtp.gmail.com with ESMTPSA id u14sm2551614lji.83.2020.09.21.01.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 01:45:52 -0700 (PDT)
Subject: Re: [PATCH 08/14] dasd: cleanup dasd_scan_partitions
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Josef Bacik <josef@toxicpanda.com>, Minchan Kim <minchan@kernel.org>,
 Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, nbd@other.debian.org,
 linux-ide@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-pm@vger.kernel.org, linux-mm@kvack.org, linux-block@vger.kernel.org
References: <20200921071958.307589-1-hch@lst.de>
 <20200921071958.307589-9-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <28f7f012-2787-2959-394e-cda480786ea9@gmail.com>
Date: Mon, 21 Sep 2020 11:45:46 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921071958.307589-9-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OaQrRl--_4P.A.rNF.XxGafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/988
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/28f7f012-2787-2959-394e-cda480786ea9@gmail.com
Resent-Date: Mon, 21 Sep 2020 09:03:20 +0000 (UTC)

Hello!

On 21.09.2020 10:19, Christoph Hellwig wrote:

> Use blkdev_get_by_dev instead of bdget_disk + blkdev_get.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/s390/block/dasd_genhd.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/s390/block/dasd_genhd.c b/drivers/s390/block/dasd_genhd.c
> index af5b0ecb8f8923..a9698fba9b76ce 100644
> --- a/drivers/s390/block/dasd_genhd.c
> +++ b/drivers/s390/block/dasd_genhd.c
> @@ -101,18 +101,11 @@ int dasd_scan_partitions(struct dasd_block *block)
>   	struct block_device *bdev;
>   	int rc;
>   
> -	bdev = bdget_disk(block->gdp, 0);
> -	if (!bdev) {
> -		DBF_DEV_EVENT(DBF_ERR, block->base, "%s",
> -			      "scan partitions error, bdget returned NULL");
> -		return -ENODEV;
> -	}
> -
> -	rc = blkdev_get(bdev, FMODE_READ, NULL);
> -	if (rc < 0) {
> +	bdev = blkdev_get_by_dev(disk_devt(block->gdp), FMODE_READ, NULL);
> +	if (IS_ERR(bdev)) {
>   		DBF_DEV_EVENT(DBF_ERR, block->base,
> -			      "scan partitions error, blkdev_get returned %d",
> -			      rc);
> +			      "scan partitions error, blkdev_get returned %ld",

    blkdev_get_by_dev() now?

> +			      PTR_ERR(bdev));
>   		return -ENODEV;
>   	}
>   

MBR, Sergei

