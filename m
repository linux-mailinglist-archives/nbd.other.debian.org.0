Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8264E6524
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 15:30:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8590F202D8; Thu, 24 Mar 2022 14:30:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 14:30:10 2022
Old-Return-Path: <jack@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_INVALID,
	DKIM_SIGNED,FOURLA,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,
	REMOVEDOT,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5986B20300
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 14:13:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.39 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	REMOVEDOT=3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id EUAbsIKZtAkD for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 14:13:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 934CB202CD
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 14:13:24 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 641B321100;
	Thu, 24 Mar 2022 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648131202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7rkE/+nY7ru0dtCC89r13OI5pvbT9r9MW6yL1fexYQ=;
	b=aMr3TNnedd+Zv2KfBUyvxwif/twUM+SsOkIpJm8ckm6dFpKcydId1GwavNOyiiOgzVv/ax
	3rKVs02rxFqzsk8qynqLZwL/ndL37A7P1Gn876Z9n/TBMgAnBmJb51wKkKrsWbgG/cqaap
	UEsKAulAeti0oJf2mohKPEYe8FELRgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648131202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7rkE/+nY7ru0dtCC89r13OI5pvbT9r9MW6yL1fexYQ=;
	b=Nj5lniwDpHRb/bWld6GgZASe90s328FgoSbEtkxDkPqbDlCr1WlqEZ+oHrsz4f2Xu0UIw6
	pOZ98ROalT1V5OCg==
Received: from quack3.suse.cz (unknown [10.100.200.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 29BB1A3B93;
	Thu, 24 Mar 2022 14:13:22 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 76641A0610; Thu, 24 Mar 2022 15:13:21 +0100 (CET)
Date: Thu, 24 Mar 2022 15:13:21 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 12/13] loop: remove lo_refcount and avoid lo_mutex in
 ->open / ->release
Message-ID: <20220324141321.pqesnshaswwk3svk@quack3.lan>
References: <20220324075119.1556334-1-hch@lst.de>
 <20220324075119.1556334-13-hch@lst.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="umwtnzhqcn5ic4i7"
Content-Disposition: inline
In-Reply-To: <20220324075119.1556334-13-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IkZOvrTP6sH.A.4vE.yBIPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1771
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324141321.pqesnshaswwk3svk@quack3.lan
Resent-Date: Thu, 24 Mar 2022 14:30:10 +0000 (UTC)


--umwtnzhqcn5ic4i7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu 24-03-22 08:51:18, Christoph Hellwig wrote:
> lo_refcount counts how many openers a loop device has, but that count
> is already provided by the block layer in the bd_openers field of the
> whole-disk block_device.  Remove lo_refcount and allow opens to
> succeed even on devices beeing deleted - now that ->free_disk is
> implemented we can handle that race gracefull and all I/O on it will
> just fail. Similarly there is a small race window now where
> loop_control_remove does not synchronize the delete vs the remove
> due do bd_openers not being under lo_mutex protection, but we can
> handle that just as gracefully.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good but I still think we need something like attached preparatory
patch to not regress e.g. filesystem probing triggered by udev events. What
do you think?

Otherwise feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/loop.c | 37 +++++++------------------------------
>  drivers/block/loop.h |  1 -
>  2 files changed, 7 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index b3170e8cdbe95..e1eb925d3f855 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -1244,7 +1244,7 @@ static int loop_clr_fd(struct loop_device *lo)
>  	 * <dev>/do something like mkfs/losetup -d <dev> causing the losetup -d
>  	 * command to fail with EBUSY.
>  	 */
> -	if (atomic_read(&lo->lo_refcnt) > 1) {
> +	if (disk_openers(lo->lo_disk) > 1) {
>  		lo->lo_flags |= LO_FLAGS_AUTOCLEAR;
>  		mutex_unlock(&lo->lo_mutex);
>  		return 0;
> @@ -1724,33 +1724,15 @@ static int lo_compat_ioctl(struct block_device *bdev, fmode_t mode,
>  }
>  #endif
>  
> -static int lo_open(struct block_device *bdev, fmode_t mode)
> -{
> -	struct loop_device *lo = bdev->bd_disk->private_data;
> -	int err;
> -
> -	err = mutex_lock_killable(&lo->lo_mutex);
> -	if (err)
> -		return err;
> -	if (lo->lo_state == Lo_deleting)
> -		err = -ENXIO;
> -	else
> -		atomic_inc(&lo->lo_refcnt);
> -	mutex_unlock(&lo->lo_mutex);
> -	return err;
> -}
> -
>  static void lo_release(struct gendisk *disk, fmode_t mode)
>  {
>  	struct loop_device *lo = disk->private_data;
>  
> -	mutex_lock(&lo->lo_mutex);
> -	if (atomic_dec_return(&lo->lo_refcnt))
> -		goto out_unlock;
> +	if (disk_openers(disk) > 0)
> +		return;
>  
> -	if (lo->lo_flags & LO_FLAGS_AUTOCLEAR) {
> -		if (lo->lo_state != Lo_bound)
> -			goto out_unlock;
> +	mutex_lock(&lo->lo_mutex);
> +	if (lo->lo_state == Lo_bound && (lo->lo_flags & LO_FLAGS_AUTOCLEAR)) {
>  		lo->lo_state = Lo_rundown;
>  		mutex_unlock(&lo->lo_mutex);
>  		/*
> @@ -1760,8 +1742,6 @@ static void lo_release(struct gendisk *disk, fmode_t mode)
>  		__loop_clr_fd(lo, true);
>  		return;
>  	}
> -
> -out_unlock:
>  	mutex_unlock(&lo->lo_mutex);
>  }
>  
> @@ -1775,7 +1755,6 @@ static void lo_free_disk(struct gendisk *disk)
>  
>  static const struct block_device_operations lo_fops = {
>  	.owner =	THIS_MODULE,
> -	.open =		lo_open,
>  	.release =	lo_release,
>  	.ioctl =	lo_ioctl,
>  #ifdef CONFIG_COMPAT
> @@ -2029,7 +2008,6 @@ static int loop_add(int i)
>  	 */
>  	if (!part_shift)
>  		disk->flags |= GENHD_FL_NO_PART;
> -	atomic_set(&lo->lo_refcnt, 0);
>  	mutex_init(&lo->lo_mutex);
>  	lo->lo_number		= i;
>  	spin_lock_init(&lo->lo_lock);
> @@ -2119,13 +2097,12 @@ static int loop_control_remove(int idx)
>  	ret = mutex_lock_killable(&lo->lo_mutex);
>  	if (ret)
>  		goto mark_visible;
> -	if (lo->lo_state != Lo_unbound ||
> -	    atomic_read(&lo->lo_refcnt) > 0) {
> +	if (lo->lo_state != Lo_unbound || disk_openers(lo->lo_disk) > 0) {
>  		mutex_unlock(&lo->lo_mutex);
>  		ret = -EBUSY;
>  		goto mark_visible;
>  	}
> -	/* Mark this loop device no longer open()-able. */
> +	/* Mark this loop device as no more bound, but not quite unbound yet */
>  	lo->lo_state = Lo_deleting;
>  	mutex_unlock(&lo->lo_mutex);
>  
> diff --git a/drivers/block/loop.h b/drivers/block/loop.h
> index 082d4b6bfc6a6..449d562738c52 100644
> --- a/drivers/block/loop.h
> +++ b/drivers/block/loop.h
> @@ -28,7 +28,6 @@ struct loop_func_table;
>  
>  struct loop_device {
>  	int		lo_number;
> -	atomic_t	lo_refcnt;
>  	loff_t		lo_offset;
>  	loff_t		lo_sizelimit;
>  	int		lo_flags;
> -- 
> 2.30.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

--umwtnzhqcn5ic4i7
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-loop-Send-udev-change-event-after-device-is-ready-fo.patch"

>From 663c2a1d0781a5fa34665a3e8544c5543f5aa70f Mon Sep 17 00:00:00 2001
From: Jan Kara <jack@suse.cz>
Date: Thu, 24 Mar 2022 14:58:05 +0100
Subject: [PATCH] loop: Send udev change event after device is ready for IO

Currently, udev change event is generated for a loop device before the
device is ready for IO. Due to serialization on lo->lo_mutex in
lo_open() this does not matter because anybody is able to open the
device and do IO only after the configuration is finished. However this
synchronization in lo_open() is going away so make sure userspace
reacting to the change event will see the new device state by generating
the event only when the device is setup.

Signed-off-by: Jan Kara <jack@suse.cz>
---
 drivers/block/loop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 3e636a75c83a..e401afc3e6dc 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -608,6 +608,8 @@ static int loop_change_fd(struct loop_device *lo, struct block_device *bdev,
 	loop_update_dio(lo);
 	blk_mq_unfreeze_queue(lo->lo_queue);
 	partscan = lo->lo_flags & LO_FLAGS_PARTSCAN;
+	/* Notify userspace about device change when it is ready for IO */
+	disk_force_media_change(lo->lo_disk, DISK_EVENT_MEDIA_CHANGE);
 	loop_global_unlock(lo, is_loop);
 
 	/*
@@ -1020,7 +1022,6 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 		goto out_unlock;
 	}
 
-	disk_force_media_change(lo->lo_disk, DISK_EVENT_MEDIA_CHANGE);
 	set_disk_ro(lo->lo_disk, (lo->lo_flags & LO_FLAGS_READ_ONLY) != 0);
 
 	INIT_WORK(&lo->rootcg_work, loop_rootcg_workfn);
@@ -1068,6 +1069,7 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	if (partscan)
 		lo->lo_disk->flags &= ~GENHD_FL_NO_PART;
 
+	disk_force_media_change(lo->lo_disk, DISK_EVENT_MEDIA_CHANGE);
 	loop_global_unlock(lo, is_loop);
 	if (partscan)
 		loop_reread_partitions(lo);
-- 
2.34.1


--umwtnzhqcn5ic4i7--

