Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D627A4E639F
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 13:48:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9094620367; Thu, 24 Mar 2022 12:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 12:48:09 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 1630C20332
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 12:31:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.39 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id P5ehnOQyCFAk for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 12:31:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4E00C2031C
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 12:31:15 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 847DD1F38D;
	Thu, 24 Mar 2022 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1648124509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/SgrAHhNM52Kgw80tCE7Vvrlpci9B4/FExqlYShfv74=;
	b=tPqUlztaenx6IkGCpH/rFRC/GxCowwU4IkJW2ahmRpb3GJRAXbqtJSs9++VdCQ/D8Ab9QJ
	ibr4hN6i5tDy/IGAmnlIRarQUSBhhcfwNiEXEwihqAPRP9oFPtrUo3R40ERQIIQWCcxNMa
	HFKA+8BCjxgoHSeXfLxx48ywYxcBYHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1648124509;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/SgrAHhNM52Kgw80tCE7Vvrlpci9B4/FExqlYShfv74=;
	b=7SDTKz8XUD2tyk7TC3Njzh6FUR8ryyS8NzPh8NRo0grA3NQXem/NLUMmqwH5H/vTmETzKY
	7R3dmWsCADtIQrBQ==
Received: from quack3.suse.cz (unknown [10.100.200.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 73A75A3B9E;
	Thu, 24 Mar 2022 12:21:49 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 23655A0610; Thu, 24 Mar 2022 13:21:49 +0100 (CET)
Date: Thu, 24 Mar 2022 13:21:49 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH 02/13] zram: cleanup reset_store
Message-ID: <20220324122149.iu63vrljelo6jq2x@quack3.lan>
References: <20220324075119.1556334-1-hch@lst.de>
 <20220324075119.1556334-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324075119.1556334-3-hch@lst.de>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YCskDJqZoGD.A.rVH.JiGPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1766
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324122149.iu63vrljelo6jq2x@quack3.lan
Resent-Date: Thu, 24 Mar 2022 12:48:09 +0000 (UTC)

On Thu 24-03-22 08:51:08, Christoph Hellwig wrote:
> Use a local variable for the gendisk instead of the part0 block_device,
> as the gendisk is what this function actually operates on.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  drivers/block/zram/zram_drv.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index e9474b02012de..fd83fad59beb1 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -1786,7 +1786,7 @@ static ssize_t reset_store(struct device *dev,
>  	int ret;
>  	unsigned short do_reset;
>  	struct zram *zram;
> -	struct block_device *bdev;
> +	struct gendisk *disk;
>  
>  	ret = kstrtou16(buf, 10, &do_reset);
>  	if (ret)
> @@ -1796,26 +1796,26 @@ static ssize_t reset_store(struct device *dev,
>  		return -EINVAL;
>  
>  	zram = dev_to_zram(dev);
> -	bdev = zram->disk->part0;
> +	disk = zram->disk;
>  
> -	mutex_lock(&bdev->bd_disk->open_mutex);
> +	mutex_lock(&disk->open_mutex);
>  	/* Do not reset an active device or claimed device */
> -	if (bdev->bd_openers || zram->claim) {
> -		mutex_unlock(&bdev->bd_disk->open_mutex);
> +	if (disk->part0->bd_openers || zram->claim) {
> +		mutex_unlock(&disk->open_mutex);
>  		return -EBUSY;
>  	}
>  
>  	/* From now on, anyone can't open /dev/zram[0-9] */
>  	zram->claim = true;
> -	mutex_unlock(&bdev->bd_disk->open_mutex);
> +	mutex_unlock(&disk->open_mutex);
>  
>  	/* Make sure all the pending I/O are finished */
> -	sync_blockdev(bdev);
> +	sync_blockdev(disk->part0);
>  	zram_reset_device(zram);
>  
> -	mutex_lock(&bdev->bd_disk->open_mutex);
> +	mutex_lock(&disk->open_mutex);
>  	zram->claim = false;
> -	mutex_unlock(&bdev->bd_disk->open_mutex);
> +	mutex_unlock(&disk->open_mutex);
>  
>  	return len;
>  }
> -- 
> 2.30.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

