Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9190EA023E9
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 12:06:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 449E2206D8; Mon,  6 Jan 2025 11:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 11:06:09 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4D0BA206BF
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 10:49:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.84 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ERU3yrds_H7b for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 10:49:04 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 526 seconds by postgrey-1.36 at bendel; Mon, 06 Jan 2025 10:49:04 UTC
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 49A3620669
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 10:49:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86662A41440;
	Mon,  6 Jan 2025 10:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC793C4CED2;
	Mon,  6 Jan 2025 10:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736160541;
	bh=rHrPFkcMDrKJSX1xGQ4HM/tkZ2yYSiqYA/+NEKz7qyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pXFO8k8sCJfIXYk7LOUU+Dw+pR+yMrkhiW9riaNycbKdwZh53hG3nMH9f1xJ0XDED
	 ZhYHpJxmNfzNNVtDbc/HcF7q15uFl0V78mT6nvYfRmVhMg+hP5GynxKZrHYy4bcVsD
	 8esHUCvdTxSGIqJvNhuxZ6kB1fPwtpOgs2UMN+mvZu8v5+1Nk7K7YAIw4HwwYrkG0c
	 8ujCJDaahyrvbNN+31z53KqzYWCeiVwJ+RLrzySD3ROFIYRf2EJi2avidGqjjTi9g6
	 6w4u0oGNcGup7r1x5dJZOlmEBtZpn2A7qu4sy0fT507ztw6D9Gz2AE7JH1K6GnPP2n
	 UVrjxgt1PgHDg==
Message-ID: <ddc8d362-2cfe-4267-a900-7ea419b15b01@kernel.org>
Date: Mon, 6 Jan 2025 19:48:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] block: use queue_limits_commit_update in
 queue_attr_store
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, virtualization@lists.linux.dev,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <20250106100645.850445-1-hch@lst.de>
 <20250106100645.850445-5-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250106100645.850445-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qTvrSPWWPqN.A.DRUG.hk7enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3219
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ddc8d362-2cfe-4267-a900-7ea419b15b01@kernel.org
Resent-Date: Mon,  6 Jan 2025 11:06:09 +0000 (UTC)

On 1/6/25 7:06 PM, Christoph Hellwig wrote:
> Use queue_limits_commit_update to apply a consistent freeze vs limits
> lock order in queue_attr_store.  Also remove taking the sysfs lock
> as it doesn't protect anything here.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Oops. OK. so please disregard my comments on patch 3. This is all fixed here.
May be sqash this patch with patch 3 ?

> ---
>  block/blk-sysfs.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
> index 8d69315e986d..3bac27fcd635 100644
> --- a/block/blk-sysfs.c
> +++ b/block/blk-sysfs.c
> @@ -687,22 +687,24 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
>  	if (entry->load_module)
>  		entry->load_module(disk, page, length);
>  
> -	mutex_lock(&q->sysfs_lock);
> -	blk_mq_freeze_queue(q);
>  	if (entry->store_limit) {
>  		struct queue_limits lim = queue_limits_start_update(q);
>  
>  		res = entry->store_limit(disk, page, length, &lim);
>  		if (res < 0) {
>  			queue_limits_cancel_update(q);
> -		} else {
> -			res = queue_limits_commit_update(q, &lim);
> -			if (!res)
> -				res = length;
> +			return res;
>  		}
> -	} else {
> -		res = entry->store(disk, page, length);
> +
> +		res = queue_limits_commit_update_frozen(q, &lim);
> +		if (res)
> +			return res;
> +		return length;
>  	}
> +
> +	mutex_lock(&q->sysfs_lock);
> +	blk_mq_freeze_queue(q);
> +	res = entry->store(disk, page, length);
>  	blk_mq_unfreeze_queue(q);
>  	mutex_unlock(&q->sysfs_lock);
>  	return res;


-- 
Damien Le Moal
Western Digital Research

