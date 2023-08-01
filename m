Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA276A5B4
	for <lists+nbd@lfdr.de>; Tue,  1 Aug 2023 02:45:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7861820407; Tue,  1 Aug 2023 00:45:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug  1 00:45:13 2023
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 543E020395
	for <lists-other-nbd@bendel.debian.org>; Tue,  1 Aug 2023 00:28:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.979 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Bqygtl7hdsNr for <lists-other-nbd@bendel.debian.org>;
	Tue,  1 Aug 2023 00:28:03 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pl1-x633.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 75C01203FD
	for <nbd@other.debian.org>; Tue,  1 Aug 2023 00:28:02 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bb91c20602so6730465ad.0
        for <nbd@other.debian.org>; Mon, 31 Jul 2023 17:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1690849679; x=1691454479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NF/EZl9ssiFsilyYni0qa8S7le0pWtfJhEYQNYvUAjE=;
        b=PrAT7ua2gCGDJhhlzzFedFjOQ1rgS5iQPOz6SH/WQxrs18n2SgKhu8IFVp3TOh99A/
         wZD4PLISKHdZRXzRStEC4NAW38Lao4WhpC7U4Ox4YMfcugKDAv21KjtBqFf2u3j56g0l
         FBqZkDxqxH10HNmR5p8NnvuBabifIvb27GuzKe+8XoWi1MuQ5mtqWtRU061YHulMjOUt
         NzF6StfZ27iqeVy+6V4vlbFHJlqEhdMk4QJUtswPuAVwCC6b9/01XFUYtJgQbC/KyhYf
         yBzgyvvaaGh+6xGTi8CgUomxzR6wMgV35diqln94FsRlMN95Mem5RCjpqJZPgLnVU/sh
         mVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690849679; x=1691454479;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NF/EZl9ssiFsilyYni0qa8S7le0pWtfJhEYQNYvUAjE=;
        b=VI97DMuWpgj1pv8cWLRz3F+HvWsbfpiVHkCZS+IoHr09FaNX3ouZqqveyrMJ9pnBiG
         FTS/eCGyuYKgMeinBBZaCXLLiNf+5gwuGEW53rWHR6bNmUkwlKdO8Aqwg9m9F0Cq7Pbs
         Wq51Z6gntGt/NKTp9Fv24qXgbNFNENIZ/Q8TQvhBeb4T482zZNVOP24fcjV/UExP2hSY
         Q1ltk+I76nPOMugrmhcK9labfou7OYZFgJ5hRP9qbiGRF8ZM6yXBJavHOs5/CR93dk6O
         OuyUrg6hudMYb9haAeW4gVZb9ojE7h6tGLghNZDgQ3Cng9NSxRH18YKywO9g0bOf0NKM
         qFYw==
X-Gm-Message-State: ABy/qLZwd/Yg4cVL+a1Eqxs5vhYBbyZACR0UedGpLCRT3gsZHvRmI9qK
	2cyt2+75GRFVJQ0DcJ0i/vx1Dg==
X-Google-Smtp-Source: APBJJlH2P/5iANAMJoJKWLbhhq7n9F8dLn8jScovcsOH2t8Kn7FLvtHkglJN8cWwsKNDVrbHuwcEOw==
X-Received: by 2002:a17:902:db0f:b0:1b8:b0c4:2e3d with SMTP id m15-20020a170902db0f00b001b8b0c42e3dmr10066614plx.4.1690849679397;
        Mon, 31 Jul 2023 17:27:59 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id iw14-20020a170903044e00b001bb54abfc07sm9083987plb.252.2023.07.31.17.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 17:27:58 -0700 (PDT)
Message-ID: <1b67a9dd-c28a-661a-3a46-dab509d4c34e@kernel.dk>
Date: Mon, 31 Jul 2023 18:27:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] nbd: get config_lock before sock_shutdown
Content-Language: en-US
To: Zhong Jinghua <zhongjinghua@huaweicloud.com>, josef@toxicpanda.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com, yukuai3@huawei.com
References: <20230707062256.1271948-1-zhongjinghua@huaweicloud.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230707062256.1271948-1-zhongjinghua@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_HNiGKdW4GG.A.13B.ZWFykB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2585
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1b67a9dd-c28a-661a-3a46-dab509d4c34e@kernel.dk
Resent-Date: Tue,  1 Aug 2023 00:45:13 +0000 (UTC)

On 7/7/23 12:22?AM, Zhong Jinghua wrote:
> Config->socks in sock_shutdown may trigger a UAF problem.
> The reason is that sock_shutdown does not hold the config_lock,
> so that nbd_ioctl can release config->socks at this time.
> 
> T0: NBD_SET_SOCK
> T1: NBD_DO_IT
> 
> T0						T1
> 
> nbd_ioctl
>   mutex_lock(&nbd->config_lock)
>   // get lock
>   __nbd_ioctl
>     nbd_start_device_ioctl
>       nbd_start_device
>        mutex_unlock(&nbd->config_lock)
>          // relase lock
>          wait_event_interruptible
>          (kill, enter sock_shutdown)
>          sock_shutdown
> 					nbd_ioctl
> 					  mutex_lock(&nbd->config_lock)
> 					  // get lock
> 					  __nbd_ioctl
> 					    nbd_add_socket
> 					      krealloc
> 						kfree(p)
> 					        //config->socks is NULL
>            nbd_sock *nsock = config->socks // error
> 
> Fix it by moving config_lock up before sock_shutdown.
> 
> Signed-off-by: Zhong Jinghua <zhongjinghua@huaweicloud.com>
> ---
>  drivers/block/nbd.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index c410cf29fb0c..accbe99ebb7e 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1428,13 +1428,18 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd)
>  	mutex_unlock(&nbd->config_lock);
>  	ret = wait_event_interruptible(config->recv_wq,
>  					 atomic_read(&config->recv_threads) == 0);
> +
> +	/*
> +	 * recv_work in flush_workqueue will not get this lock, because nbd_open
> +	 * will hold nbd->config_refs
> +	 */
> +	mutex_lock(&nbd->config_lock);
>  	if (ret) {
>  		sock_shutdown(nbd);
>  		nbd_clear_que(nbd);
>  	}
>  
>  	flush_workqueue(nbd->recv_workq);
> -	mutex_lock(&nbd->config_lock);

Feels pretty iffy to hold config_lock over the flush. If anything off
recv_work() ever grabs it, we'd be stuck. Your comment assumes that the
only case this will currently happen is if we drop the last ref, or at
least that's the case that'd do it even if you don't mention it
explicitly.

Maybe this is all fine, but recv_work() should have a comment matching
this one, and this comment should be more descriptive as well.

-- 
Jens Axboe

