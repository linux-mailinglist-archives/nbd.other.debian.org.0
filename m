Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B32484E637C
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 13:42:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9534D20361; Thu, 24 Mar 2022 12:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 12:42:09 2022
Old-Return-Path: <jack@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3CC0D20339
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 12:26:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.39 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id G0XFZlf1b1y3 for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 12:26:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 327 seconds by postgrey-1.36 at bendel; Thu, 24 Mar 2022 12:26:15 UTC
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C817820336
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 12:26:15 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id A36461F745;
	Thu, 24 Mar 2022 12:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648124445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ru7twObJmkEeqX5kufO5l0DfRgeiRYwOwFdgSaymrM4=;
	b=YKfOAqryvTvf2cb0T6bddOnaL8IuSAiRiuq4uLh7fByzw4TfD8ZnOlQXK1ai2vCBJTQnl5
	9cWyBf5V81iIR4PCFupA6RtnH86UPGcIVNhhiIth1TSKVDQw8w1lDfSkJjhzX1kp039FBG
	f5NiJrd/7u4+MhFo3kv8EXgQ6rszUR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648124445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ru7twObJmkEeqX5kufO5l0DfRgeiRYwOwFdgSaymrM4=;
	b=/7iwgfzxeB+5RF0lBjBDfbJ05jzoKJs7CCsAPVis2qoFRDYYpC6BOFOuUp3E3MmSfkteo3
	HvPEJ/UHsGzSvGCg==
Received: from quack3.suse.cz (unknown [10.100.200.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 827FDA3B87;
	Thu, 24 Mar 2022 12:20:45 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 35498A0610; Thu, 24 Mar 2022 13:20:41 +0100 (CET)
Date: Thu, 24 Mar 2022 13:20:41 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 01/13] nbd: use the correct block_device in nbd_ioctl
Message-ID: <20220324122041.itc55zladc5sax5p@quack3.lan>
References: <20220324075119.1556334-1-hch@lst.de>
 <20220324075119.1556334-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324075119.1556334-2-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xKikLT7-E5P.A.eoG.hcGPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1765
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324122041.itc55zladc5sax5p@quack3.lan
Resent-Date: Thu, 24 Mar 2022 12:42:09 +0000 (UTC)

On Thu 24-03-22 08:51:07, Christoph Hellwig wrote:
> The bdev parameter to ->ioctl contains the block device that the ioctl
> is called on, which can be the partition.  But the code in nbd_ioctl
> that uses it really wants the whole device for things like the bd_openers
> check.  Switch to not pass the bdev along and always use nbd->disk->part0
> instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/nbd.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 5a1f98494dddf..795f65a5c9661 100644
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
> @@ -1417,12 +1417,11 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *b
>  	return ret;
>  }
>  
> -static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
> -				 struct block_device *bdev)
> +static void nbd_clear_sock_ioctl(struct nbd_device *nbd)
>  {
>  	sock_shutdown(nbd);
> -	__invalidate_device(bdev, true);
> -	nbd_bdev_reset(bdev);
> +	__invalidate_device(nbd->disk->part0, true);
> +	nbd_bdev_reset(nbd);
>  	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
>  			       &nbd->config->runtime_flags))
>  		nbd_config_put(nbd);
> @@ -1448,7 +1447,7 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
>  	case NBD_DISCONNECT:
>  		return nbd_disconnect(nbd);
>  	case NBD_CLEAR_SOCK:
> -		nbd_clear_sock_ioctl(nbd, bdev);
> +		nbd_clear_sock_ioctl(nbd);
>  		return 0;
>  	case NBD_SET_SOCK:
>  		return nbd_add_socket(nbd, arg, false);
> @@ -1468,7 +1467,7 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
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

