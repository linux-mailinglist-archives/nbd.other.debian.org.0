Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4899D4E6425
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 14:33:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A5BFA20379; Thu, 24 Mar 2022 13:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 13:33:09 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 82F5720367
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 13:15:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.39 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OCrDcaAZkJ0Z for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 13:15:50 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .suse. - helo: .smtp-out1.suse. - helo-domain: .suse.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8516A2035F
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 13:15:50 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 3E6BF210DC;
	Thu, 24 Mar 2022 13:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648127748; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUb3QM5quNjZzhk9pi8FXbHKm8Oez4fkcBfiqy2RXkY=;
	b=vXX5hIIcpacWDgh6jmNReSzi9ShGpQv2cfnfSUXxqM2upV6Nq/JrLmWWmoU9XoXqGgtDxu
	EpE4Kq35fn1+O3TD0BVrXNtLA3Q9kRE75BSKsshSPsNu55xiupDq17fZ/l8CRvHtjxV6sm
	WuNbVqu+BPMQrkcsFdQAJrmGQxMJCpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648127748;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IUb3QM5quNjZzhk9pi8FXbHKm8Oez4fkcBfiqy2RXkY=;
	b=J8Sqs+dMC0HJg0YHGW7vvcym64g2Gnqf4MBAMg4spx976X6zUMx2eI4rZJFEDoQ8V4Opqf
	q3QK+MzoVi4a0hAg==
Received: from quack3.suse.cz (unknown [10.100.200.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 2A290A3B99;
	Thu, 24 Mar 2022 13:15:48 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id CC153A0610; Thu, 24 Mar 2022 14:15:47 +0100 (CET)
Date: Thu, 24 Mar 2022 14:15:47 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 03/13] zram: cleanup zram_remove
Message-ID: <20220324131547.btqbrcf4ynlunhj4@quack3.lan>
References: <20220324075119.1556334-1-hch@lst.de>
 <20220324075119.1556334-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324075119.1556334-4-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mu0Ak5El6mP.A.unD.VMHPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1767
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324131547.btqbrcf4ynlunhj4@quack3.lan
Resent-Date: Thu, 24 Mar 2022 13:33:09 +0000 (UTC)

On Thu 24-03-22 08:51:09, Christoph Hellwig wrote:
> Remove the bdev variable and just use the gendisk pointed to by the
> zram_device directly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/zram/zram_drv.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index fd83fad59beb1..863606f1722b1 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -1987,19 +1987,18 @@ static int zram_add(void)
>  
>  static int zram_remove(struct zram *zram)
>  {
> -	struct block_device *bdev = zram->disk->part0;
>  	bool claimed;
>  
> -	mutex_lock(&bdev->bd_disk->open_mutex);
> -	if (bdev->bd_openers) {
> -		mutex_unlock(&bdev->bd_disk->open_mutex);
> +	mutex_lock(&zram->disk->open_mutex);
> +	if (zram->disk->part0->bd_openers) {
> +		mutex_unlock(&zram->disk->open_mutex);
>  		return -EBUSY;
>  	}
>  
>  	claimed = zram->claim;
>  	if (!claimed)
>  		zram->claim = true;
> -	mutex_unlock(&bdev->bd_disk->open_mutex);
> +	mutex_unlock(&zram->disk->open_mutex);
>  
>  	zram_debugfs_unregister(zram);
>  
> @@ -2011,7 +2010,7 @@ static int zram_remove(struct zram *zram)
>  		;
>  	} else {
>  		/* Make sure all the pending I/O are finished */
> -		sync_blockdev(bdev);
> +		sync_blockdev(zram->disk->part0);
>  		zram_reset_device(zram);
>  	}
>  
> -- 
> 2.30.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

