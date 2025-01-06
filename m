Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 919B2A023EB
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 12:06:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 760D5206F2; Mon,  6 Jan 2025 11:06:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 11:06:31 2025
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D6692206BF
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 10:49:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.84 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Yv863TITwiiQ for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 10:49:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id BD91E20669
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 10:49:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C2BFDA413F1;
	Mon,  6 Jan 2025 10:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386FBC4CED2;
	Mon,  6 Jan 2025 10:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736159989;
	bh=yxjR/msICYPQyNZp7VDsz8GJNakeVo6N3uxmzscuuTY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UVVmQ8ZK+ThglmGt6ZKcBZ8e3Syi47x1JsCOXZmKrmzeT8NL8LNSml09e4pLj8f0q
	 pHDd+4P6vumMFzMhsTDORIlbRMMJ4rjGHC76Vml3Sk/7tYcG2Vn/vWhAiJXJl5EGmT
	 iyD26odNze8G9REiz4+4dDmA0loqA7KflPCNGYVjESgmfSAO28o9ClZPouZNzagXE5
	 /g46KRsdgZckZ3u0NMMDyFJVMHNIWnwLC73TJUunDcfVDBw0ZMMOYc8KNjO85mCbr1
	 lNDjWjuppATfLW58GzGKlE3+/LYQDLzYckJvXDH1dKkCcJuDAIw1BPoAibDflN/A+1
	 urF5oZuX6khnQ==
Message-ID: <89e35fd6-830c-46b7-a0c3-284bc120d424@kernel.org>
Date: Mon, 6 Jan 2025 19:39:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] block: fix docs for freezing of queue limits
 updates
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Nilay Shroff <nilay@linux.ibm.com>,
 linux-block@vger.kernel.org, linux-nvme@lists.infradead.org,
 nbd@other.debian.org, virtualization@lists.linux.dev,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
References: <20250106100645.850445-1-hch@lst.de>
 <20250106100645.850445-2-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250106100645.850445-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Xiy1ZhMgrmO.A.BWUG.3k7enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3221
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/89e35fd6-830c-46b7-a0c3-284bc120d424@kernel.org
Resent-Date: Mon,  6 Jan 2025 11:06:31 +0000 (UTC)

On 1/6/25 7:06 PM, Christoph Hellwig wrote:
> queue_limits_commit_update is the function that needs to operate on a
> frozen queue, not queue_limits_start_update.  Update the kerneldoc
> comments to reflect that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-settings.c   | 3 ++-
>  include/linux/blkdev.h | 3 +--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 8f09e33f41f6..4187c3e8a07f 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -413,7 +413,8 @@ int blk_set_default_limits(struct queue_limits *lim)
>   * @lim:	limits to apply
>   *
>   * Apply the limits in @lim that were obtained from queue_limits_start_update()
> - * and updated by the caller to @q.
> + * and updated by the caller to @q.  The caller must have frozen the queue or
> + * ensured that there is outstanding I/O by other means.

...ensure that there are no outstanding I/Os by other means.

>   *
>   * Returns 0 if successful, else a negative error code.
>   */
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 5d40af2ef971..e781d4e6f92d 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -944,8 +944,7 @@ static inline unsigned int blk_boundary_sectors_left(sector_t offset,
>   * the caller can modify.  The caller must call queue_limits_commit_update()
>   * to finish the update.
>   *
> - * Context: process context.  The caller must have frozen the queue or ensured
> - * that there is outstanding I/O by other means.
> + * Context: process context.
>   */
>  static inline struct queue_limits
>  queue_limits_start_update(struct request_queue *q)


-- 
Damien Le Moal
Western Digital Research

