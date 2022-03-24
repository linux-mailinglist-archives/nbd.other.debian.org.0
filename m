Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 042B44E645F
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 14:48:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C8BD420374; Thu, 24 Mar 2022 13:48:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 13:48:19 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 3FC0B2036F
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 13:31:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.39 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kadiT_LBoty8 for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 13:31:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6CF912036E
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 13:31:39 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 34499210FD;
	Thu, 24 Mar 2022 13:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648128697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0Cr2mQ8cWcFJUA6V7ww5aJ6cyPtJwF77BTMIEivlo4=;
	b=Ebig25vDZgJtSK5nD8Kxt5HyjRsp/LWzUgUUsTboAj3lQ80t2L2SMPgL4qANETrBP0zkDN
	Efw7ObJAC3VdSxPm6+ah8QqIvoErieJfmAPZ1MYefHNTm8RHa2f1ZZ2bv+DraJsD/PUJgo
	eMSP0ESW9ODXlChKmCxUJ7e1k47ARtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648128697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0Cr2mQ8cWcFJUA6V7ww5aJ6cyPtJwF77BTMIEivlo4=;
	b=pAUBZy07TiJsA2ToO/paxJHMJNVNW8ewqLykuZZDfdj/XlAUPxH6QXLhEoJ9tw5GOYL/hJ
	q5hRZ3hstdHvciBg==
Received: from quack3.suse.cz (unknown [10.100.200.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 0BD52A3B83;
	Thu, 24 Mar 2022 13:31:37 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id AC068A0610; Thu, 24 Mar 2022 14:31:36 +0100 (CET)
Date: Thu, 24 Mar 2022 14:31:36 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 05/13] block: turn bdev->bd_openers into an atomic_t
Message-ID: <20220324133136.h6vimclhyhly7uyh@quack3.lan>
References: <20220324075119.1556334-1-hch@lst.de>
 <20220324075119.1556334-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324075119.1556334-6-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hHrIrUaOzuK.A.GSF.jaHPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1770
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324133136.h6vimclhyhly7uyh@quack3.lan
Resent-Date: Thu, 24 Mar 2022 13:48:19 +0000 (UTC)

On Thu 24-03-22 08:51:11, Christoph Hellwig wrote:
> All manipulation of bd_openers is under disk->open_mutex and will remain
> so for the foreseeable future.  But at least one place reads it without
> the lock (blkdev_get) and there are more to be added.  So make sure the
> compiler does not do turn the increments and decrements into non-atomic
> sequences by using an atomic_t.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

BTW I suspect that drivers/block/aoe/ could now use bd_openers instead of
its driver specific mirror of it (->nopen). But that's certainly a separate
cleanup for some other time.

								Honza

> ---
>  block/bdev.c              | 16 ++++++++--------
>  block/partitions/core.c   |  2 +-
>  include/linux/blk_types.h |  2 +-
>  include/linux/blkdev.h    |  2 +-
>  4 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/block/bdev.c b/block/bdev.c
> index 13de871fa8169..7bf88e591aaf3 100644
> --- a/block/bdev.c
> +++ b/block/bdev.c
> @@ -673,17 +673,17 @@ static int blkdev_get_whole(struct block_device *bdev, fmode_t mode)
>  		}
>  	}
>  
> -	if (!bdev->bd_openers)
> +	if (!atomic_read(&bdev->bd_openers))
>  		set_init_blocksize(bdev);
>  	if (test_bit(GD_NEED_PART_SCAN, &disk->state))
>  		bdev_disk_changed(disk, false);
> -	bdev->bd_openers++;
> +	atomic_inc(&bdev->bd_openers);
>  	return 0;
>  }
>  
>  static void blkdev_put_whole(struct block_device *bdev, fmode_t mode)
>  {
> -	if (!--bdev->bd_openers)
> +	if (atomic_dec_and_test(&bdev->bd_openers))
>  		blkdev_flush_mapping(bdev);
>  	if (bdev->bd_disk->fops->release)
>  		bdev->bd_disk->fops->release(bdev->bd_disk, mode);
> @@ -694,7 +694,7 @@ static int blkdev_get_part(struct block_device *part, fmode_t mode)
>  	struct gendisk *disk = part->bd_disk;
>  	int ret;
>  
> -	if (part->bd_openers)
> +	if (atomic_read(&part->bd_openers))
>  		goto done;
>  
>  	ret = blkdev_get_whole(bdev_whole(part), mode);
> @@ -708,7 +708,7 @@ static int blkdev_get_part(struct block_device *part, fmode_t mode)
>  	disk->open_partitions++;
>  	set_init_blocksize(part);
>  done:
> -	part->bd_openers++;
> +	atomic_inc(&part->bd_openers);
>  	return 0;
>  
>  out_blkdev_put:
> @@ -720,7 +720,7 @@ static void blkdev_put_part(struct block_device *part, fmode_t mode)
>  {
>  	struct block_device *whole = bdev_whole(part);
>  
> -	if (--part->bd_openers)
> +	if (!atomic_dec_and_test(&part->bd_openers))
>  		return;
>  	blkdev_flush_mapping(part);
>  	whole->bd_disk->open_partitions--;
> @@ -899,7 +899,7 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
>  	 * of the world and we want to avoid long (could be several minute)
>  	 * syncs while holding the mutex.
>  	 */
> -	if (bdev->bd_openers == 1)
> +	if (atomic_read(&bdev->bd_openers) == 1)
>  		sync_blockdev(bdev);
>  
>  	mutex_lock(&disk->open_mutex);
> @@ -1044,7 +1044,7 @@ void sync_bdevs(bool wait)
>  		bdev = I_BDEV(inode);
>  
>  		mutex_lock(&bdev->bd_disk->open_mutex);
> -		if (!bdev->bd_openers) {
> +		if (!atomic_read(&bdev->bd_openers)) {
>  			; /* skip */
>  		} else if (wait) {
>  			/*
> diff --git a/block/partitions/core.c b/block/partitions/core.c
> index 2ef8dfa1e5c85..373ed748dcf26 100644
> --- a/block/partitions/core.c
> +++ b/block/partitions/core.c
> @@ -486,7 +486,7 @@ int bdev_del_partition(struct gendisk *disk, int partno)
>  		goto out_unlock;
>  
>  	ret = -EBUSY;
> -	if (part->bd_openers)
> +	if (atomic_read(&part->bd_openers))
>  		goto out_unlock;
>  
>  	delete_partition(part);
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index 0c3563b45fe90..b1ced43ed0d3f 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -44,7 +44,7 @@ struct block_device {
>  	unsigned long		bd_stamp;
>  	bool			bd_read_only;	/* read-only policy */
>  	dev_t			bd_dev;
> -	int			bd_openers;
> +	atomic_t		bd_openers;
>  	struct inode *		bd_inode;	/* will die */
>  	struct super_block *	bd_super;
>  	void *			bd_claiming;
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 9824ebc9b4d31..6b7c5af1d01df 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -188,7 +188,7 @@ static inline bool disk_live(struct gendisk *disk)
>   */
>  static inline unsigned int disk_openers(struct gendisk *disk)
>  {
> -	return disk->part0->bd_openers;
> +	return atomic_read(&disk->part0->bd_openers);
>  }
>  
>  /*
> -- 
> 2.30.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

