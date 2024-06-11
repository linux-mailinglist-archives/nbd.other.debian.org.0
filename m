Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DC405903246
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2024 08:12:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C0A8520681; Tue, 11 Jun 2024 06:12:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 06:12:35 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F03282066A
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2024 05:57:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.511 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vWxSWHB6NRsT for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2024 05:57:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3AF212066C
	for <nbd@other.debian.org>; Tue, 11 Jun 2024 05:57:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CA4B3CE0B9B;
	Tue, 11 Jun 2024 05:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4CBC2BD10;
	Tue, 11 Jun 2024 05:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718085426;
	bh=xFN1h7CLNOVeSD1DVq7Y6t3Bb5KlL582IrHJpAfOI+I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fv21i4LDKBohOjAMc7pIwhaiiTsAlafv5K+jqxJasBRtlliGgCtTrXsT0H8yV5+9T
	 njwksi1EuST41csRG3Vqsp2L+QlP+t8YOn8e3W08JXRiXRq8hhVj8Dagc3+6nbt30R
	 F+mIQhqmSwNPdFOouK0TdZvzzsTWzz1Lqs4jPTNbQ0Jw2LrEoRIpZD54zKPNaLm1HA
	 t4c032+2B98Y3f+oLMEONdKDXJVupqzzbghc2EZK18tDOe6HzPnnhx/GWgADRWFlM4
	 oxYC9o2lrFo6wnGlsgbujf5T6gsAVdypUTxeMWDRMSrvLMxkDZnNQFg5hAvDm4J/fA
	 kYvXmValPXY/Q==
Message-ID: <dabc33cd-feb9-4263-8f6e-4d2ab3d71430@kernel.org>
Date: Tue, 11 Jun 2024 14:56:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/26] loop: regularize upgrading the lock size for direct
 I/O
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-6-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8d7HK7ajuaD.A.4Y2J.Tr-ZmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2926
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/dabc33cd-feb9-4263-8f6e-4d2ab3d71430@kernel.org
Resent-Date: Tue, 11 Jun 2024 06:12:35 +0000 (UTC)

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> The LOOP_CONFIGURE path automatically upgrades the block size to that
> of the underlying file for O_DIRECT file descriptors, but the
> LOOP_SET_BLOCK_SIZE path does not.  Fix this by lifting the code to
> pick the block size into common code.

s/lock/block in the commit title.

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/loop.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index c658282454af1b..4f6d8514d19bd6 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -975,10 +975,24 @@ loop_set_status_from_info(struct loop_device *lo,
>  	return 0;
>  }
>  
> +static unsigned short loop_default_blocksize(struct loop_device *lo,
> +		struct block_device *backing_bdev)
> +{
> +	/* In case of direct I/O, match underlying block size */
> +	if ((lo->lo_backing_file->f_flags & O_DIRECT) && backing_bdev)
> +		return bdev_logical_block_size(backing_bdev);
> +	return 512;

Nit: SECTOR_SIZE ?

> +}
> +
>  static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
>  {
> +	struct file *file = lo->lo_backing_file;
> +	struct inode *inode = file->f_mapping->host;
>  	struct queue_limits lim;
>  
> +	if (!bsize)
> +		bsize = loop_default_blocksize(lo, inode->i_sb->s_bdev);

If bsize is specified and there is a backing dev used with direct IO, should it
be checked that bsize is a multiple of bdev_logical_block_size(backing_bdev) ?

> +
>  	lim = queue_limits_start_update(lo->lo_queue);
>  	lim.logical_block_size = bsize;
>  	lim.physical_block_size = bsize;
> @@ -997,7 +1011,6 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
>  	int error;
>  	loff_t size;
>  	bool partscan;
> -	unsigned short bsize;
>  	bool is_loop;
>  
>  	if (!file)
> @@ -1076,15 +1089,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
>  	if (!(lo->lo_flags & LO_FLAGS_READ_ONLY) && file->f_op->fsync)
>  		blk_queue_write_cache(lo->lo_queue, true, false);
>  
> -	if (config->block_size)
> -		bsize = config->block_size;
> -	else if ((lo->lo_backing_file->f_flags & O_DIRECT) && inode->i_sb->s_bdev)
> -		/* In case of direct I/O, match underlying block size */
> -		bsize = bdev_logical_block_size(inode->i_sb->s_bdev);
> -	else
> -		bsize = 512;
> -
> -	error = loop_reconfigure_limits(lo, bsize);
> +	error = loop_reconfigure_limits(lo, config->block_size);
>  	if (WARN_ON_ONCE(error))
>  		goto out_unlock;
>  

-- 
Damien Le Moal
Western Digital Research

