Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CFF3DC68F
	for <lists+nbd@lfdr.de>; Sat, 31 Jul 2021 17:15:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 59A5520482; Sat, 31 Jul 2021 15:15:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jul 31 15:15:09 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4D3D4203DC
	for <lists-other-nbd@bendel.debian.org>; Sat, 31 Jul 2021 14:57:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Z0Pb1GMK89jH for <lists-other-nbd@bendel.debian.org>;
	Sat, 31 Jul 2021 14:57:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pl1-x629.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 88B9920404
	for <nbd@other.debian.org>; Sat, 31 Jul 2021 14:57:51 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id e21so14579709pla.5
        for <nbd@other.debian.org>; Sat, 31 Jul 2021 07:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cZF9Y6I+Qx6Gr1wByV30zO6gwQTmqMIjVaDGJsLh6xY=;
        b=BPCE/iJCz7ZZdNq+YWfPBsJCVbK2LhY4aLwn2ORBLnmHW4Yeuex9V06v9M06CixNSg
         nbPXP9LzzmsmWNN+tNuwAhjcrLuQD3F3kRf5uszwAkSjsTcBk1w1Iajjkq05Ng+6GLNK
         UkskUAmaxmIwvbzElih3EmkDWdDLN3mSQ958h9GpDPB98rOAd21WYoCsOJLHYgJvCdkY
         4zvEBMPjY8H7EfC23M2+B9Ke4I21lPkpsE27qhLeoh5vN/oH6XCSarOHOsE94Z+tMdio
         vbH/VHY4ZY7SRm9dnctPnl/6T3FiWZhFtE7roXuM82WDxxj6G5jql9Pd4FI2TbUsR9LO
         ShXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cZF9Y6I+Qx6Gr1wByV30zO6gwQTmqMIjVaDGJsLh6xY=;
        b=kXKRjIOyNpgM6B+QB3zhVps+m9MZgOHgnDNSDmWNVLUREWpB6tr9EKKVU8JDM4Z7i9
         1qTpY4weZJmdUHiiug1ijVM6A4ziSKFnW99IMEcf38gnr/UOLiMIVCjVm9Xk1QlIaZYw
         W1QXPJmBIilGIltzGG0OjZpDqvIfiwVaTcq9K17HtwZowDfUtpMjPEi7at5ukvyAhwkk
         gVkeUmCWq0lYxL5E5D70ilwDN4JisbD17zFFNFC+511VDNQe+UECjh+Z7scI58P3wygQ
         CTXNyjfNIrYvFDOSZvYuA1O1ZH1Agq5LzaM2iYeTm3QmYwAZJQ/8seIymLgt9BcXXZX+
         COYQ==
X-Gm-Message-State: AOAM532dhy59oJeKO/rLE2smFfy3GkNcftBNy1xsSji7Eiwl6e0SS0EZ
	9dz/8K/4O7Hva6pmejp5TypnTw==
X-Google-Smtp-Source: ABdhPJyzU/6tGM56mhUxjGi31EMHcEd077Dj2ChDGqQDnO9RWpBxWW15XvR1Z01nBGYLn0FBmRv99g==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id d18mr8775350pjw.102.1627743467767;
        Sat, 31 Jul 2021 07:57:47 -0700 (PDT)
Received: from [192.168.1.116] ([198.8.77.61])
        by smtp.gmail.com with ESMTPSA id s31sm6998392pgm.27.2021.07.31.07.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jul 2021 07:57:47 -0700 (PDT)
Subject: Re: [PATCH -next] nbd: add the check to prevent overflow in
 __nbd_ioctl()
To: Baokun Li <libaokun1@huawei.com>, josef@toxicpanda.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
Cc: patchwork@huawei.com, Hulk Robot <hulkci@huawei.com>
References: <20210731014854.3953274-1-libaokun1@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <b2582b8f-7cb8-f936-2d78-4d8b5feb0c12@kernel.dk>
Date: Sat, 31 Jul 2021 08:57:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210731014854.3953274-1-libaokun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kONqzIG4nhK.A.ARG.9jWBhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1231
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b2582b8f-7cb8-f936-2d78-4d8b5feb0c12@kernel.dk
Resent-Date: Sat, 31 Jul 2021 15:15:09 +0000 (UTC)

On 7/30/21 7:48 PM, Baokun Li wrote:
> If user specify a large enough value of NBD blocks option, it may trigger
> signed integer overflow which may lead to nbd->config->bytesize becomes a
> large or small value, zero in particular.
> 
> UBSAN: Undefined behaviour in drivers/block/nbd.c:325:31
> signed integer overflow:
> 1024 * 4611686155866341414 cannot be represented in type 'long long int'
> [...]
> Call trace:
> [...]
>  handle_overflow+0x188/0x1dc lib/ubsan.c:192
>  __ubsan_handle_mul_overflow+0x34/0x44 lib/ubsan.c:213
>  nbd_size_set drivers/block/nbd.c:325 [inline]
>  __nbd_ioctl drivers/block/nbd.c:1342 [inline]
>  nbd_ioctl+0x998/0xa10 drivers/block/nbd.c:1395
>  __blkdev_driver_ioctl block/ioctl.c:311 [inline]
> [...]
> 
> Although it is not a big deal, still silence the UBSAN by limit
> the input value.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
>  drivers/block/nbd.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index c38317979f74..7c838bf8cc31 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1398,6 +1398,8 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
>  	case NBD_SET_SIZE:
>  		return nbd_set_size(nbd, arg, config->blksize);
>  	case NBD_SET_SIZE_BLOCKS:
> +		if (arg && (LLONG_MAX / arg <= config->blksize))
> +			return -EINVAL;

Use check_mul_overflow() instead?

-- 
Jens Axboe

