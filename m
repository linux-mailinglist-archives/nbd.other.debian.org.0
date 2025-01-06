Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2826FA02402
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 12:12:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D0901206DB; Mon,  6 Jan 2025 11:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 11:12:09 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7ED72206DF
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 10:56:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.84 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CCrJveaTHMjH for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 10:56:19 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 58018206DB
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 10:56:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93513A4143E;
	Mon,  6 Jan 2025 10:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048D9C4CEE3;
	Mon,  6 Jan 2025 10:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736160976;
	bh=lQotIkeEUoFgFIz4s/eV75qL4Ulg6WK2/agu4lpDPDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G43Ua4hyG7KZ0Nb2KRkA+JEHIjWVPC06tyqi4g+CtLCOqw364rYjDUbGA/arXz8bG
	 elsevEYuVTQXiWDFkWwdAVoLx0GukEm8XSu7319rc2XyHNMuf4UpSKdkrIlXOVbjeh
	 0qSrHV1MigyqCJxIv4z1e7ZiG7XY5vTIpC5GspISFDr+xWsqS51Cl5Ji3eDtzYIiZa
	 /2Rtm9jMecdP1re8XIxKimmFuguUVRuZmre4lJgaODEt+YeH9iWJfUZDpbCVa9Fqt4
	 eN7uiprRf7/yJkO3VZNZJbxT5eBj1wprdlDfsRjNfDo00fw5wLqVblLEX7I5fHuGl8
	 M/DDCS+M+hFvw==
Message-ID: <1538d5e9-eb59-49a7-90c8-77a290f3a420@kernel.org>
Date: Mon, 6 Jan 2025 19:55:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] block: don't update BLK_FEAT_POLL in
 __blk_mq_update_nr_hw_queues
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, virtualization@lists.linux.dev,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <20250106100645.850445-1-hch@lst.de>
 <20250106100645.850445-6-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250106100645.850445-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <94_26T71Kx.A.wKVG.Jq7enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3222
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1538d5e9-eb59-49a7-90c8-77a290f3a420@kernel.org
Resent-Date: Mon,  6 Jan 2025 11:12:09 +0000 (UTC)

On 1/6/25 7:06 PM, Christoph Hellwig wrote:
> When __blk_mq_update_nr_hw_queues changes the number of tag sets, it
> might have to disable poll queues.  Currently it does so by adjusting
> the BLK_FEAT_POLL, which is a bit against the intent of features that
> describe hardware / driver capabilities, but more importantly causes
> nasty lock order problems with the broadly held freeze when updating the
> number of hardware queues and the limits lock.  Fix this by leaving
> BLK_FEAT_POLL alone, and instead check for the number of sets and poll
> queues in the bio submission and poll handler.  While this adds extra
> work to the fast path, the variables are in cache lines used by these
> operations anyway, so it should be cheap enough.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-core.c | 14 +++++++++++---
>  block/blk-mq.c   | 19 +------------------
>  block/blk-mq.h   |  6 ++++++
>  3 files changed, 18 insertions(+), 21 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 666efe8fa202..483c14a50d9f 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -753,6 +753,15 @@ static blk_status_t blk_validate_atomic_write_op_size(struct request_queue *q,
>  	return BLK_STS_OK;
>  }
>  
> +static bool bdev_can_poll(struct block_device *bdev)
> +{
> +	struct request_queue *q = bdev_get_queue(bdev);
> +
> +	if (queue_is_mq(q))
> +		return blk_mq_can_poll(q->tag_set);
> +	return q->limits.features & BLK_FEAT_POLL;
> +}
> +
>  /**
>   * submit_bio_noacct - re-submit a bio to the block device layer for I/O
>   * @bio:  The bio describing the location in memory and on the device.
> @@ -805,8 +814,7 @@ void submit_bio_noacct(struct bio *bio)
>  		}
>  	}
>  
> -	if (!(q->limits.features & BLK_FEAT_POLL) &&
> -			(bio->bi_opf & REQ_POLLED)) {
> +	if ((bio->bi_opf & REQ_POLLED) && !bdev_can_poll(bdev)) {
>  		bio_clear_polled(bio);
>  		goto not_supported;
>  	}
> @@ -935,7 +943,7 @@ int bio_poll(struct bio *bio, struct io_comp_batch *iob, unsigned int flags)
>  		return 0;
>  
>  	q = bdev_get_queue(bdev);
> -	if (cookie == BLK_QC_T_NONE || !(q->limits.features & BLK_FEAT_POLL))
> +	if (cookie == BLK_QC_T_NONE || !bdev_can_poll(bdev))
>  		return 0;
>  
>  	blk_flush_plug(current->plug, false);
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index 17f10683d640..0a7f059735fa 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -4321,12 +4321,6 @@ void blk_mq_release(struct request_queue *q)
>  	blk_mq_sysfs_deinit(q);
>  }
>  
> -static bool blk_mq_can_poll(struct blk_mq_tag_set *set)
> -{
> -	return set->nr_maps > HCTX_TYPE_POLL &&
> -		set->map[HCTX_TYPE_POLL].nr_queues;
> -}
> -
>  struct request_queue *blk_mq_alloc_queue(struct blk_mq_tag_set *set,
>  		struct queue_limits *lim, void *queuedata)
>  {
> @@ -4336,9 +4330,7 @@ struct request_queue *blk_mq_alloc_queue(struct blk_mq_tag_set *set,
>  
>  	if (!lim)
>  		lim = &default_lim;
> -	lim->features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT;
> -	if (blk_mq_can_poll(set))
> -		lim->features |= BLK_FEAT_POLL;
> +	lim->features |= BLK_FEAT_IO_STAT | BLK_FEAT_NOWAIT | BLK_FEAT_POLL;

Why set BLK_FEAT_POLL unconditionally ? This is changing the current default
for many devices, no ?

>  
>  	q = blk_alloc_queue(lim, set->numa_node);
>  	if (IS_ERR(q))
> @@ -5025,8 +5017,6 @@ static void __blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set,
>  fallback:
>  	blk_mq_update_queue_map(set);
>  	list_for_each_entry(q, &set->tag_list, tag_set_list) {
> -		struct queue_limits lim;
> -
>  		blk_mq_realloc_hw_ctxs(set, q);
>  
>  		if (q->nr_hw_queues != set->nr_hw_queues) {
> @@ -5040,13 +5030,6 @@ static void __blk_mq_update_nr_hw_queues(struct blk_mq_tag_set *set,
>  			set->nr_hw_queues = prev_nr_hw_queues;
>  			goto fallback;
>  		}
> -		lim = queue_limits_start_update(q);
> -		if (blk_mq_can_poll(set))
> -			lim.features |= BLK_FEAT_POLL;
> -		else
> -			lim.features &= ~BLK_FEAT_POLL;
> -		if (queue_limits_commit_update(q, &lim) < 0)
> -			pr_warn("updating the poll flag failed\n");
>  		blk_mq_map_swqueue(q);
>  	}
>  
> diff --git a/block/blk-mq.h b/block/blk-mq.h
> index 89a20fffa4b1..ecd7bd7ec609 100644
> --- a/block/blk-mq.h
> +++ b/block/blk-mq.h
> @@ -111,6 +111,12 @@ static inline struct blk_mq_hw_ctx *blk_mq_map_queue(struct request_queue *q,
>  	return ctx->hctxs[blk_mq_get_hctx_type(opf)];
>  }
>  
> +static inline bool blk_mq_can_poll(struct blk_mq_tag_set *set)
> +{
> +	return set->nr_maps > HCTX_TYPE_POLL &&
> +		set->map[HCTX_TYPE_POLL].nr_queues;
> +}
> +
>  /*
>   * sysfs helpers
>   */


-- 
Damien Le Moal
Western Digital Research

