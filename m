Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4414EBCBD
	for <lists+nbd@lfdr.de>; Wed, 30 Mar 2022 10:30:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B3A18215C8; Wed, 30 Mar 2022 08:30:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 30 08:30:10 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 894CD215AC
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Mar 2022 08:14:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.39 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8OBFIUtS_hkT for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Mar 2022 08:14:09 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3000E215A7
	for <nbd@other.debian.org>; Wed, 30 Mar 2022 08:14:09 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id A8DAA1F37B;
	Wed, 30 Mar 2022 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648628046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e3DMJp9nphLsLvcjfDMvgaqnLJ4znnl+dEDdp+bNsQY=;
	b=IsF5tLAEYxuxjPV4WX8DDBeyosJeRLngcBo/Xd6RfiKLHvgMAVeuG9QMoD60OGxm3yUWsw
	5Rde+vp2XSE22g8i1i+i6xexxlR5SxfAi/50i/G/9bk6rHBDKqIITgEmUxgWOE+BGZIR8z
	qrIX+xFJNN9kBMeM4OBy759GxNSeCWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648628046;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e3DMJp9nphLsLvcjfDMvgaqnLJ4znnl+dEDdp+bNsQY=;
	b=hSlg0azAyUWECtOw0xb4wYpOdD4fOyMDcqkVU3GYt31BhIBditXYw8XPJrOnkHzuGWVw5w
	/FliLDE+SkN4G2Aw==
Received: from quack3.suse.cz (unknown [10.163.28.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 7C58EA3B8A;
	Wed, 30 Mar 2022 08:14:06 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id A2D5EA0610; Wed, 30 Mar 2022 10:14:00 +0200 (CEST)
Date: Wed, 30 Mar 2022 10:14:00 +0200
From: Jan Kara <jack@suse.cz>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, Matteo Croce <mcroce@microsoft.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
Subject: Re: [PATCH 15/14] loop: avoid loop_validate_mutex/lo_mutex in
 ->release
Message-ID: <20220330081400.womvc72fqnj6i44t@quack3.lan>
References: <20220325063929.1773899-1-hch@lst.de>
 <fda9e2b7-d1db-e00c-98aa-e8ff555b88eb@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fda9e2b7-d1db-e00c-98aa-e8ff555b88eb@I-love.SAKURA.ne.jp>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xVHY2LilWhL.A.InG.SUBRiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1840
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220330081400.womvc72fqnj6i44t@quack3.lan
Resent-Date: Wed, 30 Mar 2022 08:30:10 +0000 (UTC)

On Wed 30-03-22 00:36:49, Tetsuo Handa wrote:
> Since ->release is called with disk->open_mutex held, and __loop_clr_fd()
>  from lo_release() is called via ->release when disk_openers() == 0, we are
> guaranteed that "struct file" which will be passed to loop_validate_file()
> via fget() cannot be the loop device __loop_clr_fd(lo, true) will clear.
> Thus, there is no need to hold loop_validate_mutex from __loop_clr_fd()
> if release == true.
> 
> When I made commit 3ce6e1f662a91097 ("loop: reintroduce global lock for
> safe loop_validate_file() traversal"), I wrote "It is acceptable for
> loop_validate_file() to succeed, for actual clear operation has not started
> yet.". But now I came to feel why it is acceptable to succeed.
> 
> It seems that the loop driver was added in Linux 1.3.68, and
> 
>   if (lo->lo_refcnt > 1)
>     return -EBUSY;
> 
> check in loop_clr_fd() was there from the beginning. The intent of this
> check was unclear. But now I think that current
> 
>   disk_openers(lo->lo_disk) > 1
> 
> form is there for three reasons.
> 
> (1) Avoid I/O errors when some process which opens and reads from this
>     loop device in response to uevent notification (e.g. systemd-udevd),
>     as described in commit a1ecac3b0656a682 ("loop: Make explicit loop
>     device destruction lazy"). This opener is short-lived because it is
>     likely that the file descriptor used by that process is closed soon.
> 
> (2) Avoid I/O errors caused by underlying layer of stacked loop devices
>     (i.e. ioctl(some_loop_fd, LOOP_SET_FD, other_loop_fd)) being suddenly
>     disappeared. This opener is long-lived because this reference is
>     associated with not a file descriptor but lo->lo_backing_file.
> 
> (3) Avoid I/O errors caused by underlying layer of mounted loop device
>     (i.e. mount(some_loop_device, some_mount_point)) being suddenly
>     disappeared. This opener is long-lived because this reference is
>     associated with not a file descriptor but mount.
> 
> While race in (1) might be acceptable, (2) and (3) should be checked
> racelessly. That is, make sure that __loop_clr_fd() will not run if
> loop_validate_file() succeeds, by doing refcount check with global lock
> held when explicit loop device destruction is requested.
> 
> As a result of no longer waiting for lo->lo_mutex after setting Lo_rundown,
> we can remove pointless BUG_ON(lo->lo_state != Lo_rundown) check.
> 
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Yeah, the patch makes sense to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/loop.c | 38 +++++++++++++-------------------------
>  1 file changed, 13 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 2506193a4fd1..6b813c592159 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -1135,27 +1135,6 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
>  	struct file *filp;
>  	gfp_t gfp = lo->old_gfp_mask;
>  
> -	/*
> -	 * Flush loop_configure() and loop_change_fd(). It is acceptable for
> -	 * loop_validate_file() to succeed, for actual clear operation has not
> -	 * started yet.
> -	 */
> -	mutex_lock(&loop_validate_mutex);
> -	mutex_unlock(&loop_validate_mutex);
> -	/*
> -	 * loop_validate_file() now fails because l->lo_state != Lo_bound
> -	 * became visible.
> -	 */
> -
> -	/*
> -	 * Since this function is called upon "ioctl(LOOP_CLR_FD)" xor "close()
> -	 * after ioctl(LOOP_CLR_FD)", it is a sign of something going wrong if
> -	 * lo->lo_state has changed while waiting for lo->lo_mutex.
> -	 */
> -	mutex_lock(&lo->lo_mutex);
> -	BUG_ON(lo->lo_state != Lo_rundown);
> -	mutex_unlock(&lo->lo_mutex);
> -
>  	if (test_bit(QUEUE_FLAG_WC, &lo->lo_queue->queue_flags))
>  		blk_queue_write_cache(lo->lo_queue, false, false);
>  
> @@ -1238,11 +1217,20 @@ static int loop_clr_fd(struct loop_device *lo)
>  {
>  	int err;
>  
> -	err = mutex_lock_killable(&lo->lo_mutex);
> +	/*
> +	 * Since lo_ioctl() is called without locks held, it is possible that
> +	 * loop_configure()/loop_change_fd() and loop_clr_fd() run in parallel.
> +	 *
> +	 * Therefore, use global lock when setting Lo_rundown state in order to
> +	 * make sure that loop_validate_file() will fail if the "struct file"
> +	 * which loop_configure()/loop_change_fd() found via fget() was this
> +	 * loop device.
> +	 */
> +	err = loop_global_lock_killable(lo, true);
>  	if (err)
>  		return err;
>  	if (lo->lo_state != Lo_bound) {
> -		mutex_unlock(&lo->lo_mutex);
> +		loop_global_unlock(lo, true);
>  		return -ENXIO;
>  	}
>  	/*
> @@ -1257,11 +1245,11 @@ static int loop_clr_fd(struct loop_device *lo)
>  	 */
>  	if (disk_openers(lo->lo_disk) > 1) {
>  		lo->lo_flags |= LO_FLAGS_AUTOCLEAR;
> -		mutex_unlock(&lo->lo_mutex);
> +		loop_global_unlock(lo, true);
>  		return 0;
>  	}
>  	lo->lo_state = Lo_rundown;
> -	mutex_unlock(&lo->lo_mutex);
> +	loop_global_unlock(lo, true);
>  
>  	__loop_clr_fd(lo, false);
>  	return 0;
> -- 
> 2.32.0
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

