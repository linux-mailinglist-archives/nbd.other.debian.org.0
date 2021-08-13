Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3AC3EB9CE
	for <lists+nbd@lfdr.de>; Fri, 13 Aug 2021 18:09:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8D8A420433; Fri, 13 Aug 2021 16:09:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 13 16:09:30 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6B5282041F
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Aug 2021 15:54:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uxtR_9wyCgHw for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Aug 2021 15:53:54 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf2d.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0BDA720418
	for <nbd@other.debian.org>; Fri, 13 Aug 2021 15:53:53 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id db14so5437582qvb.10
        for <nbd@other.debian.org>; Fri, 13 Aug 2021 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CwihxQvLtJhhIw8oFBGmVElpiNeOrquat4Xu9F0jAOg=;
        b=UobTjhUsdatqGjnwoy+XW7bcjQSD/T9CvT2bXzZDpMrL2ktB4pTVorEnfKGLiRVdsd
         SaCfPQUapfOVtf/dnRmTOERUsFeylckFCTl+VqV+5VK9Jk1l5lUG8GC3BbBtEvOGembA
         kCJ7V2LGik3JBVB5ag0re4REBTCXwxQpA6QyEy4WncXKDBkKjtXaIuMcE9/kNug6sx5O
         o2vYbmZZBOEW8v0h5xcAO45+OPC8p4EDjc17/i3oqbbgC583wR+6AtFLGKJJ4anAlcJY
         r4Ovg9Tg0l+YDPYnACSdAvADw1B1vrJYG/7WPco/q7rLwaVrVuCFB3Kk/drhiwO5SOZH
         CmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CwihxQvLtJhhIw8oFBGmVElpiNeOrquat4Xu9F0jAOg=;
        b=QP7UTbaY9a81BcWIJOJjA4XeHKADJIxM/K5jAa90R37bgKBmH6giXtmbzqT8gw2efg
         LfLZnF6MYVJ+yRkNFkeE2xMHkI1HstIudYU//vC/IRBUC1LU79iA1VbYschWeBqAiFZ3
         uptwat5MjFT3ot3FFElF7D7edZ5MFTovwSHKTa5p35QYrQtL4EoRgi1/tsMlVPCgCtQL
         nr2LKAs7lRAshZpHnnBp7zuXvqvtYNl1TUl4wA+182ne7SKaxv+gaTWay5Auz9QG+b6M
         hO/frOpW20u362xL+bhLwNbxQSxZDWdiKfKC6A5nq8za8gm6AqR+M5LS0mKkNeENyu3F
         44+g==
X-Gm-Message-State: AOAM532hnutbmhGg4K29TlkhEVRnvDWr18U3485I+ZiZ1m2v0zIczURb
	BpOopVpifnmNX2XGcIRSkzSYWg==
X-Google-Smtp-Source: ABdhPJyYmLSrD3vLL1+cF8UUwaEG2k11P+wOic5kAZmLdn06ptIPRaFjlYyvsipkypN3if7BppYm7A==
X-Received: by 2002:a0c:ef84:: with SMTP id w4mr3256725qvr.34.1628870030094;
        Fri, 13 Aug 2021 08:53:50 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id q26sm1141166qki.120.2021.08.13.08.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 08:53:49 -0700 (PDT)
Subject: Re: [PATCH -next v3] nbd: add the check to prevent overflow in
 __nbd_ioctl()
To: Baokun Li <libaokun1@huawei.com>, axboe@kernel.dk,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
Cc: patchwork@huawei.com, yukuai3@huawei.com, Hulk Robot <hulkci@huawei.com>
References: <20210804021212.990223-1-libaokun1@huawei.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <49104529-74e4-27ed-945f-75e04c1b5968@toxicpanda.com>
Date: Fri, 13 Aug 2021 11:53:48 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210804021212.990223-1-libaokun1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uYU1XUq90vI.A.OZD.6kpFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1286
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/49104529-74e4-27ed-945f-75e04c1b5968@toxicpanda.com
Resent-Date: Fri, 13 Aug 2021 16:09:30 +0000 (UTC)

On 8/3/21 10:12 PM, Baokun Li wrote:
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
>   handle_overflow+0x188/0x1dc lib/ubsan.c:192
>   __ubsan_handle_mul_overflow+0x34/0x44 lib/ubsan.c:213
>   nbd_size_set drivers/block/nbd.c:325 [inline]
>   __nbd_ioctl drivers/block/nbd.c:1342 [inline]
>   nbd_ioctl+0x998/0xa10 drivers/block/nbd.c:1395
>   __blkdev_driver_ioctl block/ioctl.c:311 [inline]
> [...]
> 
> Although it is not a big deal, still silence the UBSAN by limit
> the input value.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
> V1->V2:
> 	Use check_mul_overflow().
> V2->V3:
> 	The check_mul_overflow function requires the same input parameter type.
> 
>   drivers/block/nbd.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index c38317979f74..5a42b838d26c 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1384,6 +1384,7 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
>   		       unsigned int cmd, unsigned long arg)
>   {
>   	struct nbd_config *config = nbd->config;
> +	loff_t bytesize;
>   
>   	switch (cmd) {
>   	case NBD_DISCONNECT:
> @@ -1398,8 +1399,11 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
>   	case NBD_SET_SIZE:
>   		return nbd_set_size(nbd, arg, config->blksize);
>   	case NBD_SET_SIZE_BLOCKS:
> -		return nbd_set_size(nbd, arg * config->blksize,
> -				    config->blksize);
> +		if (unlikely(check_mul_overflow((loff_t)arg,
> +						config->blksize,
> +						&bytesize)))
> +			return -EINVAL;
> +		return nbd_set_size(nbd, bytesize, config->blksize);

The unlikely isn't needed here, just makes it harder to read the thing, drop it 
and then you can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

