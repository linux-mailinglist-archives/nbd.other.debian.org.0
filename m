Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC5D4E6525
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 15:30:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 503A9202FC; Thu, 24 Mar 2022 14:30:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 14:30:25 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 21E4C20300
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 14:14:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.39 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1s55BJGMUgve for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 14:14:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5F2E0202CD
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 14:14:52 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 35B5A210FD;
	Thu, 24 Mar 2022 14:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648131290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1hh46SIU6WCp6LU+lFWy31l8wJLSF9FTZUdgQbcLuAQ=;
	b=Jb5YiQWqcBb4srKM1rkELddpWI/aAGRnqqoyiEYka4axTVEAdCUYWd5c4wJvYDl60Cjv8S
	/GrNCVjJ/GNtawlHXoXpiYGeaIihkQciZENl/NuBPB1btxQHAC09uc+Ku4Mq7pmfaV8cdD
	sTDNKBpV+kiGOvTrX9RgtAMPthvRpkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648131290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1hh46SIU6WCp6LU+lFWy31l8wJLSF9FTZUdgQbcLuAQ=;
	b=f2xvH32LzAOT4U95Pi4fMmMClfHwNPABI8HTLA1NyFGL86hOifao/rkKIJmnWKDb/65aNt
	DA71cgqzI+wdJkAQ==
Received: from quack3.suse.cz (unknown [10.100.200.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 02153A3BA2;
	Thu, 24 Mar 2022 14:14:50 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 12DC6A0610; Thu, 24 Mar 2022 15:14:49 +0100 (CET)
Date: Thu, 24 Mar 2022 15:14:49 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org,
	syzbot+6479585dfd4dedd3f7e1@syzkaller.appspotmail.com
Subject: Re: [PATCH 13/13] loop: don't destroy lo->workqueue in __loop_clr_fd
Message-ID: <20220324141449.fq3dxwd3sdqhriwy@quack3.lan>
References: <20220324075119.1556334-1-hch@lst.de>
 <20220324075119.1556334-14-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324075119.1556334-14-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GAhibKsO6QJ.A.10E.BCIPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1772
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324141449.fq3dxwd3sdqhriwy@quack3.lan
Resent-Date: Thu, 24 Mar 2022 14:30:25 +0000 (UTC)

On Thu 24-03-22 08:51:19, Christoph Hellwig wrote:
> There is no need to destroy the workqueue when clearing unbinding
> a loop device from a backing file.  Not doing so on the other hand
> avoid creating a complex lock dependency chain involving the global
> system_transition_mutex.
> 
> Based on a patch from Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>.
> 
> Reported-by: syzbot+6479585dfd4dedd3f7e1@syzkaller.appspotmail.com
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/loop.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index e1eb925d3f855..84613eb2fdd57 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -808,7 +808,6 @@ struct loop_worker {
>  };
>  
>  static void loop_workfn(struct work_struct *work);
> -static void loop_rootcg_workfn(struct work_struct *work);
>  
>  #ifdef CONFIG_BLK_CGROUP
>  static inline int queue_on_root_worker(struct cgroup_subsys_state *css)
> @@ -1043,20 +1042,19 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
>  	    !file->f_op->write_iter)
>  		lo->lo_flags |= LO_FLAGS_READ_ONLY;
>  
> -	lo->workqueue = alloc_workqueue("loop%d",
> -					WQ_UNBOUND | WQ_FREEZABLE,
> -					0,
> -					lo->lo_number);
>  	if (!lo->workqueue) {
> -		error = -ENOMEM;
> -		goto out_unlock;
> +		lo->workqueue = alloc_workqueue("loop%d",
> +						WQ_UNBOUND | WQ_FREEZABLE,
> +						0, lo->lo_number);
> +		if (!lo->workqueue) {
> +			error = -ENOMEM;
> +			goto out_unlock;
> +		}
>  	}
>  
>  	disk_force_media_change(lo->lo_disk, DISK_EVENT_MEDIA_CHANGE);
>  	set_disk_ro(lo->lo_disk, (lo->lo_flags & LO_FLAGS_READ_ONLY) != 0);
>  
> -	INIT_WORK(&lo->rootcg_work, loop_rootcg_workfn);
> -	INIT_LIST_HEAD(&lo->rootcg_cmd_list);
>  	lo->use_dio = lo->lo_flags & LO_FLAGS_DIRECT_IO;
>  	lo->lo_device = bdev;
>  	lo->lo_backing_file = file;
> @@ -1152,10 +1150,6 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
>  	if (!release)
>  		blk_mq_freeze_queue(lo->lo_queue);
>  
> -	destroy_workqueue(lo->workqueue);
> -	loop_free_idle_workers(lo, true);
> -	del_timer_sync(&lo->timer);
> -
>  	spin_lock_irq(&lo->lo_lock);
>  	filp = lo->lo_backing_file;
>  	lo->lo_backing_file = NULL;
> @@ -1749,6 +1743,10 @@ static void lo_free_disk(struct gendisk *disk)
>  {
>  	struct loop_device *lo = disk->private_data;
>  
> +	if (lo->workqueue)
> +		destroy_workqueue(lo->workqueue);
> +	loop_free_idle_workers(lo, true);
> +	del_timer_sync(&lo->timer);
>  	mutex_destroy(&lo->lo_mutex);
>  	kfree(lo);
>  }
> @@ -2012,6 +2010,8 @@ static int loop_add(int i)
>  	lo->lo_number		= i;
>  	spin_lock_init(&lo->lo_lock);
>  	spin_lock_init(&lo->lo_work_lock);
> +	INIT_WORK(&lo->rootcg_work, loop_rootcg_workfn);
> +	INIT_LIST_HEAD(&lo->rootcg_cmd_list);
>  	disk->major		= LOOP_MAJOR;
>  	disk->first_minor	= i << part_shift;
>  	disk->minors		= 1 << part_shift;
> -- 
> 2.30.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

