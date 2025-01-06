Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 863FBA02409
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 12:15:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 62823206DB; Mon,  6 Jan 2025 11:15:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 11:15:09 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LONGWORD,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AE5E5206DB
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 10:57:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.84 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LONGWORD=2,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ktNYRUmCpTsV for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 10:57:08 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3910B206EC
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 10:57:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 786D5A414C2;
	Mon,  6 Jan 2025 10:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0C0C4CED2;
	Mon,  6 Jan 2025 10:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736161025;
	bh=SkMUfmNVGEp3GjfSVk+aiLBPqi5Z67vJEkjjxoSltas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cISyFrpkYGIZ0xA4St+nzsQX5WDm6sxgzc+wrYGzjNRhxzimHSKnXZq7QclrbhXwE
	 FMuSeYPq4VMNFQ7rTnYN6sVKskXxXNMPEnDz+MWEroT8P7g2ErJMDekoSvkpc3nFXZ
	 5PK4udGG6H0GLESXC7yq3otBOs9IpW6aeFQWgQAQMnCAXlDMMHHPCr4YEmtkfIa3ZQ
	 /JXAGWghe1vOf1WEhdk5RBuC3C3B5g9gRyotBgWfX7BgMVx0iOJ2LO3M/msXmkddpO
	 RFIJ2fj2GpwyrNB+AYk5NpAAB30BYxbFalF0knbSvf+R1QEifx+9XfEabAUwbtQQIY
	 9K9KfWRS8gdGQ==
Message-ID: <07353499-b62d-488a-9575-12de5d9b6f2e@kernel.org>
Date: Mon, 6 Jan 2025 19:56:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] virtio_blk: use queue_limits_commit_update_frozen
 in cache_type_store
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, virtualization@lists.linux.dev,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <20250106100645.850445-1-hch@lst.de>
 <20250106100645.850445-7-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250106100645.850445-7-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <APnva6ty-4I.A.qjVG.9s7enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3223
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/07353499-b62d-488a-9575-12de5d9b6f2e@kernel.org
Resent-Date: Mon,  6 Jan 2025 11:15:09 +0000 (UTC)

On 1/6/25 7:06 PM, Christoph Hellwig wrote:
> So far cache_type_store didn't freeze the queue, fix that by using the
> queue_limits_commit_update_frozen helper.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This should be squashed in patch 2, no ?

> ---
>  drivers/block/virtio_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 0a987f195630..bbaa26b523b8 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -1105,7 +1105,7 @@ cache_type_store(struct device *dev, struct device_attribute *attr,
>  		lim.features |= BLK_FEAT_WRITE_CACHE;
>  	else
>  		lim.features &= ~BLK_FEAT_WRITE_CACHE;
> -	i = queue_limits_commit_update(disk->queue, &lim);
> +	i = queue_limits_commit_update_frozen(disk->queue, &lim);
>  	if (i)
>  		return i;
>  	return count;


-- 
Damien Le Moal
Western Digital Research

