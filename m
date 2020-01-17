Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 977FD140CA0
	for <lists+nbd@lfdr.de>; Fri, 17 Jan 2020 15:36:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7428B21912; Fri, 17 Jan 2020 14:36:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 17 14:36:09 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 643B22196E
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jan 2020 14:18:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2cgCUbWF44Y0 for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jan 2020 14:18:16 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf43.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 684522196B
	for <nbd@other.debian.org>; Fri, 17 Jan 2020 14:18:12 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id p2so10742878qvo.10
        for <nbd@other.debian.org>; Fri, 17 Jan 2020 06:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QZuEFUKjv//ibyKVev2kASTpvRJGWKtlTct99HsCngM=;
        b=eHsCIVZGsneURBSnnMRV2NrM9GAmfJxh+Z6wX5tGZ6yuKUHiDFGGeg9M5+wc7embk7
         vUUCBLrImj0GJ2uiMswlXW2SVZD+MnqK2SMD7exdwCQ9sJBPeUoIHFVitK3taC+w3mm7
         VkfQwarKOIjdASLiZ0k8jXwLqcD3xYmORlzx23HF3AIfx2Gq2Updp507eQ6xH5tsSkRe
         NC+04vKyBwJxxvo3QjZC8c9Z/38Df+LKZtQiAwgSVrFg7xoB9KcQaUScZb0g3+4cs3T/
         AKfNDgt/OQ0i3v8LT55qLwE9ZvPGA3UO8Z7CZBYKzFBlkklzWMQ43nNdVlO4fyADya30
         IlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QZuEFUKjv//ibyKVev2kASTpvRJGWKtlTct99HsCngM=;
        b=MtCKRN9eRRAWwVlAeRVRzvrFpYy6j3GRfQIAcFQeqRxt3OnT9ltVeFYTyWQqdS2YVU
         7HBaFCHwLd+d9jzaWuDBMgPQ9EDDcdfIJwS7B3HIl24ZUL26/X30z8V6vMsCCCf/SoKV
         n1PQmFf1HXc9TbAqGrYzRpEXkAVKGsQOAii8d33KckrysMKE4lrTkuNuTGp2VcGm+nKu
         S59nv0FL5RfWYoTIHT9JM09PGgRfUAHlUsYjhqiouulWrkTP60LpJtqsgwUgooVJ20u5
         hMjlJ9nYMp7DekAEG86YBFBPKMUEUIfv4rKVc4VrjX0ySSZ/itt8Cca+Wh7/kAYn9beL
         CCbw==
X-Gm-Message-State: APjAAAW98FiFdoSMqgE0KwKFznx+E7CJurbrwfmtmzaWh3P/tBfg1Xs/
	gLJ0vhd6uwZZUKpZXTFxonUgJg==
X-Google-Smtp-Source: APXvYqyVK4nL9OgB+euaXnwZw6RE6de018kfPkbe0U7aGHdH1reADSe2XSJ8P75DEADf92W/TOE82g==
X-Received: by 2002:a05:6214:1745:: with SMTP id dc5mr7651088qvb.230.1579270689133;
        Fri, 17 Jan 2020 06:18:09 -0800 (PST)
Received: from [192.168.1.106] ([107.15.81.208])
        by smtp.gmail.com with ESMTPSA id 206sm11803384qkf.132.2020.01.17.06.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2020 06:18:08 -0800 (PST)
Subject: Re: [PATCH] nbd: fix potential NULL pointer fault in connect and
 disconnect process
To: Sun Ke <sunke32@huawei.com>, axboe@kernel.dk
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20200117115005.37006-1-sunke32@huawei.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <875eaffb-d1e1-2d7e-09c9-81bab345e707@toxicpanda.com>
Date: Fri, 17 Jan 2020 09:18:07 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200117115005.37006-1-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <QK3xo2ysYpP.A.iWE.ZZcIeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/770
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/875eaffb-d1e1-2d7e-09c9-81bab345e707@toxicpanda.com
Resent-Date: Fri, 17 Jan 2020 14:36:09 +0000 (UTC)

On 1/17/20 6:50 AM, Sun Ke wrote:
> Connect and disconnect a nbd device repeatedly, will cause
> NULL pointer fault.
> 
> It will appear by the steps:
> 1. Connect the nbd device and disconnect it, but now nbd device
>     is not disconnected totally.
> 2. Connect the same nbd device again immediately, it will fail
>     in nbd_start_device with a EBUSY return value.
> 3. Wait a second to make sure the last config_refs is reduced
>     and run nbd_config_put to disconnect the nbd device totally.
> 4. Start another process to open the nbd_device, config_refs
>     will increase and at the same time disconnect it.
> 
> To fix it, add a NBD_HAS_STARTED flag. Set it in nbd_start_device_ioctl
> and nbd_genl_connect if nbd device is started successfully.
> Clear it in nbd_config_put. Test it in nbd_genl_disconnect and
> nbd_genl_reconfigure.

I don't doubt what you are seeing, but what exactly are we NULL pointer 
dereferencing?  I can't quite figure it out from the steps.

> 
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
>   drivers/block/nbd.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index b4607dd96185..ddd364e208ab 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -83,6 +83,7 @@ struct link_dead_args {
>   
>   #define NBD_DESTROY_ON_DISCONNECT	0
>   #define NBD_DISCONNECT_REQUESTED	1
> +#define NBD_HAS_STARTED				2
>   
>   struct nbd_config {
>   	u32 flags;
> @@ -1215,6 +1216,7 @@ static void nbd_config_put(struct nbd_device *nbd)
>   		nbd->disk->queue->limits.discard_alignment = 0;
>   		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
>   		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, nbd->disk->queue);
> +		clear_bit(NBD_HAS_STARTED, &nbd->flags);
>   
>   		mutex_unlock(&nbd->config_lock);
>   		nbd_put(nbd);
> @@ -1290,6 +1292,8 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *b
>   	ret = nbd_start_device(nbd);
>   	if (ret)
>   		return ret;
> +	else
> +		set_bit(NBD_HAS_STARTED, &nbd->flags);

The else is superfluous here.  Thanks,

Josef

