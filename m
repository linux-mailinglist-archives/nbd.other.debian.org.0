Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AE90D4E7070
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 11:06:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 64474204F8; Fri, 25 Mar 2022 10:06:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 10:06:10 2022
Old-Return-Path: <jack@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B625E203D3
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 09:48:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.39 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0hzqmtxxjw_0 for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 09:48:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4B17520390
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 09:48:23 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 19DC5210DD;
	Fri, 25 Mar 2022 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648201701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2B5Ovp/AGoJP4vtJyXeHGTqSIm8bneVtY69YT9VYJtc=;
	b=hvI9NTZhfLPV/w92szaggCScpef2X2LqZu1ipID9LXgoFs32SDUw/GcBPokirvzxQhHM7d
	qSd3ZohC0wm9MzT5jSKQVA8Plfj+YrgtFWT9GkBgPrO5+pHQgQZNygXMPsH8Dxy/d4dSr3
	6N2+DKha9Zgux6jVIAvZPpPw/f9MXJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648201701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2B5Ovp/AGoJP4vtJyXeHGTqSIm8bneVtY69YT9VYJtc=;
	b=yHTPU0lYzShxBJAnTtcm5pM8bwSG3lVwNPqiYZBIdHF2XgHu4ir5b5nT6GH7ABvn9jXuUd
	X2x96Syk5KJfk0Dg==
Received: from quack3.suse.cz (unknown [10.100.200.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id EF907A3B88;
	Fri, 25 Mar 2022 09:48:20 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 63245A0610; Fri, 25 Mar 2022 10:48:20 +0100 (CET)
Date: Fri, 25 Mar 2022 10:48:20 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, Matteo Croce <mcroce@microsoft.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org
Subject: Re: [PATCH 01/14] nbd: use the correct block_device in nbd_bdev_reset
Message-ID: <20220325094820.jxyqgjxdx7ulgmo2@quack3.lan>
References: <20220325063929.1773899-1-hch@lst.de>
 <20220325063929.1773899-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325063929.1773899-2-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <m5XY0PFs__M.A.5AG.SQZPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1799
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220325094820.jxyqgjxdx7ulgmo2@quack3.lan
Resent-Date: Fri, 25 Mar 2022 10:06:10 +0000 (UTC)

On Fri 25-03-22 07:39:16, Christoph Hellwig wrote:
> The bdev parameter to ->ioctl contains the block device that the ioctl
> is called on, which can be the partition.  But the openers check in
> nbd_bdev_reset really needs to check use the whole device, so switch to
> using that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/nbd.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 5a1f98494dddf..2f29da41fbc80 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1217,11 +1217,11 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
>  	return -ENOSPC;
>  }
>  
> -static void nbd_bdev_reset(struct block_device *bdev)
> +static void nbd_bdev_reset(struct nbd_device *nbd)
>  {
> -	if (bdev->bd_openers > 1)
> +	if (nbd->disk->part0->bd_openers > 1)
>  		return;
> -	set_capacity(bdev->bd_disk, 0);
> +	set_capacity(nbd->disk, 0);
>  }
>  
>  static void nbd_parse_flags(struct nbd_device *nbd)
> @@ -1389,7 +1389,7 @@ static int nbd_start_device(struct nbd_device *nbd)
>  	return nbd_set_size(nbd, config->bytesize, nbd_blksize(config));
>  }
>  
> -static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *bdev)
> +static int nbd_start_device_ioctl(struct nbd_device *nbd)
>  {
>  	struct nbd_config *config = nbd->config;
>  	int ret;
> @@ -1408,7 +1408,7 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *b
>  	flush_workqueue(nbd->recv_workq);
>  
>  	mutex_lock(&nbd->config_lock);
> -	nbd_bdev_reset(bdev);
> +	nbd_bdev_reset(nbd);
>  	/* user requested, ignore socket errors */
>  	if (test_bit(NBD_RT_DISCONNECT_REQUESTED, &config->runtime_flags))
>  		ret = 0;
> @@ -1422,7 +1422,7 @@ static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
>  {
>  	sock_shutdown(nbd);
>  	__invalidate_device(bdev, true);
> -	nbd_bdev_reset(bdev);
> +	nbd_bdev_reset(nbd);
>  	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
>  			       &nbd->config->runtime_flags))
>  		nbd_config_put(nbd);
> @@ -1468,7 +1468,7 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
>  		config->flags = arg;
>  		return 0;
>  	case NBD_DO_IT:
> -		return nbd_start_device_ioctl(nbd, bdev);
> +		return nbd_start_device_ioctl(nbd);
>  	case NBD_CLEAR_QUE:
>  		/*
>  		 * This is for compatibility only.  The queue is always cleared
> -- 
> 2.30.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

