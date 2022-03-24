Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC154E643F
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 14:42:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5648A20373; Thu, 24 Mar 2022 13:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 13:42:09 2022
Old-Return-Path: <jack@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,
	PHONENUMBER,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E26C02036E
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 13:24:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.89 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cejatIw0CFwl for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 13:24:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2FBE62036D
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 13:24:45 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 0EE6A2129B;
	Thu, 24 Mar 2022 13:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648128283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PCXzEhY4GrdGOJj6LkNB5lbicvXRMhJaAguRALYPKWA=;
	b=u5ehJoQWQq1yrgfO5FuzgXmXUleRMNT51D41a3JDAkkRz83QsHD3Z6E54w9zlzUw1XWx2Y
	2EJ+7FUKZKjkLcTICm1EMyClhIn6qLdwIRij684u3ARf8sIGweSXGdrDQjbzsgJ98eTbSm
	0R5HZr41cBLqHGeTLPhF2tUaY/BU/J4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648128283;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PCXzEhY4GrdGOJj6LkNB5lbicvXRMhJaAguRALYPKWA=;
	b=0ej5Pr6kpsYGtWiPKLP5rDIcke/IP03QPL/yIRQtK8HRPlQbYWBudJIH65pHrFceofL8Ef
	pO0zC3zHOVLL2PAg==
Received: from quack3.suse.cz (unknown [10.100.200.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id EE97DA3B88;
	Thu, 24 Mar 2022 13:24:42 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id A8F97A0610; Thu, 24 Mar 2022 14:24:42 +0100 (CET)
Date: Thu, 24 Mar 2022 14:24:42 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 04/13] block: add a disk_openers helper
Message-ID: <20220324132442.xrwtiielft4rexgf@quack3.lan>
References: <20220324075119.1556334-1-hch@lst.de>
 <20220324075119.1556334-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324075119.1556334-5-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Dp0oitlyomE.A.1pE.xUHPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1769
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324132442.xrwtiielft4rexgf@quack3.lan
Resent-Date: Thu, 24 Mar 2022 13:42:09 +0000 (UTC)

On Thu 24-03-22 08:51:10, Christoph Hellwig wrote:
> Add a helper that returns the openers for a given gendisk to avoid having
> drivers poke into disk->part0 to get at this information in a somewhat
> cumbersome way.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/nbd.c           |  4 ++--
>  drivers/block/zram/zram_drv.c |  4 ++--
>  include/linux/blkdev.h        | 15 +++++++++++++++
>  3 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 795f65a5c9661..93af7587d5ed6 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1219,7 +1219,7 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
>  
>  static void nbd_bdev_reset(struct nbd_device *nbd)
>  {
> -	if (nbd->disk->part0->bd_openers > 1)
> +	if (disk_openers(nbd->disk) > 1)
>  		return;
>  	set_capacity(nbd->disk, 0);
>  }
> @@ -1578,7 +1578,7 @@ static void nbd_release(struct gendisk *disk, fmode_t mode)
>  	struct nbd_device *nbd = disk->private_data;
>  
>  	if (test_bit(NBD_RT_DISCONNECT_ON_CLOSE, &nbd->config->runtime_flags) &&
> -			disk->part0->bd_openers == 0)
> +			disk_openers(disk) == 0)
>  		nbd_disconnect_and_put(nbd);
>  
>  	nbd_config_put(nbd);
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index 863606f1722b1..2362385f782a9 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -1800,7 +1800,7 @@ static ssize_t reset_store(struct device *dev,
>  
>  	mutex_lock(&disk->open_mutex);
>  	/* Do not reset an active device or claimed device */
> -	if (disk->part0->bd_openers || zram->claim) {
> +	if (disk_openers(disk) || zram->claim) {
>  		mutex_unlock(&disk->open_mutex);
>  		return -EBUSY;
>  	}
> @@ -1990,7 +1990,7 @@ static int zram_remove(struct zram *zram)
>  	bool claimed;
>  
>  	mutex_lock(&zram->disk->open_mutex);
> -	if (zram->disk->part0->bd_openers) {
> +	if (disk_openers(zram->disk)) {
>  		mutex_unlock(&zram->disk->open_mutex);
>  		return -EBUSY;
>  	}
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index eb27312a1b8f3..9824ebc9b4d31 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -176,6 +176,21 @@ static inline bool disk_live(struct gendisk *disk)
>  	return !inode_unhashed(disk->part0->bd_inode);
>  }
>  
> +/**
> + * disk_openers - returns how many openers are there for a disk
> + * @disk: disk to check
> + *
> + * This returns the number of openers for a disk.  Note that this value is only
> + * stable if disk->open_mutex is held.
> + *
> + * Note: Due to a quirk in the block layer open code, each open partition is
> + * only counted once even if there are multiple openers.
> + */
> +static inline unsigned int disk_openers(struct gendisk *disk)
> +{
> +	return disk->part0->bd_openers;
> +}
> +
>  /*
>   * The gendisk is refcounted by the part0 block_device, and the bd_device
>   * therein is also used for device model presentation in sysfs.
> -- 
> 2.30.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

