Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBFB90343C
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2024 09:48:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 29FDF20530; Tue, 11 Jun 2024 07:48:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 07:48:10 2024
Old-Return-Path: <dlemoal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B39B620636
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2024 07:30:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.511 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hCddmen8DhBm for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2024 07:30:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 785B72062C
	for <nbd@other.debian.org>; Tue, 11 Jun 2024 07:30:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E9A560D2B;
	Tue, 11 Jun 2024 07:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC6CC2BD10;
	Tue, 11 Jun 2024 07:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718091045;
	bh=mXwlDhzGw5x2p2Nr8gAFPISP2nDIAfZIJOaFJyvJXOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VCI1eDgXTsePnpt155uEye/3wYDicIPNZJ3+S2Hq2BKZNkLNvV5I0fT+JdCzdUnSb
	 yuXJ7xiSHP9TiSA6PVPXt+qO9Dn4e1NQaWtG0WZKRDKr7qk2obBVABl9+DPiAto15R
	 ZY06Qeaqugg7VSWPCcJ0qkt9/u4FV8hF/W3PG2hU6Xg27Ev50hNdLuTn4EcUBYyJ8n
	 S+KRGHhRfCxLhpogZoDRTutfmrs5hXd1HvW8FhrlCCZSHQ5haYJkZbrzON8/BzrfEH
	 kcYMtKu/xYq8uguhHsXhgHJwfT/OivpjDtyI/mVqW6dF9WSlmB2m2KaCIH1Th4AQTt
	 8udJurnL3fqPA==
Message-ID: <fdfc024a-368a-4495-8b85-b5ab7741f6d4@kernel.org>
Date: Tue, 11 Jun 2024 16:30:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/26] xen-blkfront: don't disable cache flushes when they
 fail
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
 <20240611051929.513387-11-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-11-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <k-bhZoRwlWH.A._ReN.6EAamB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2935
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/fdfc024a-368a-4495-8b85-b5ab7741f6d4@kernel.org
Resent-Date: Tue, 11 Jun 2024 07:48:10 +0000 (UTC)

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> blkfront always had a robust negotiation protocol for detecting a write
> cache.  Stop simply disabling cache flushes when they fail as that is
> a grave error.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good to me but maybe mention that removal of xlvbd_flush() as well ?
And it feels like the "stop disabling cache flushes when they fail" part should
be a fix patch sent separately...

Anyway, for both parts, feel free to add:

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

> ---
>  drivers/block/xen-blkfront.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 9b4ec3e4908cce..9794ac2d3299d1 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -982,18 +982,6 @@ static const char *flush_info(struct blkfront_info *info)
>  		return "barrier or flush: disabled;";
>  }
>  
> -static void xlvbd_flush(struct blkfront_info *info)
> -{
> -	blk_queue_write_cache(info->rq, info->feature_flush ? true : false,
> -			      info->feature_fua ? true : false);
> -	pr_info("blkfront: %s: %s %s %s %s %s %s %s\n",
> -		info->gd->disk_name, flush_info(info),
> -		"persistent grants:", info->feature_persistent ?
> -		"enabled;" : "disabled;", "indirect descriptors:",
> -		info->max_indirect_segments ? "enabled;" : "disabled;",
> -		"bounce buffer:", info->bounce ? "enabled" : "disabled;");
> -}
> -
>  static int xen_translate_vdev(int vdevice, int *minor, unsigned int *offset)
>  {
>  	int major;
> @@ -1162,7 +1150,15 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
>  	info->sector_size = sector_size;
>  	info->physical_sector_size = physical_sector_size;
>  
> -	xlvbd_flush(info);
> +	blk_queue_write_cache(info->rq, info->feature_flush ? true : false,
> +			      info->feature_fua ? true : false);
> +
> +	pr_info("blkfront: %s: %s %s %s %s %s %s %s\n",
> +		info->gd->disk_name, flush_info(info),
> +		"persistent grants:", info->feature_persistent ?
> +		"enabled;" : "disabled;", "indirect descriptors:",
> +		info->max_indirect_segments ? "enabled;" : "disabled;",
> +		"bounce buffer:", info->bounce ? "enabled" : "disabled;");
>  
>  	if (info->vdisk_info & VDISK_READONLY)
>  		set_disk_ro(gd, 1);
> @@ -1622,13 +1618,6 @@ static irqreturn_t blkif_interrupt(int irq, void *dev_id)
>  				       info->gd->disk_name, op_name(bret.operation));
>  				blkif_req(req)->error = BLK_STS_NOTSUPP;
>  			}
> -			if (unlikely(blkif_req(req)->error)) {
> -				if (blkif_req(req)->error == BLK_STS_NOTSUPP)
> -					blkif_req(req)->error = BLK_STS_OK;
> -				info->feature_fua = 0;
> -				info->feature_flush = 0;
> -				xlvbd_flush(info);
> -			}
>  			fallthrough;
>  		case BLKIF_OP_READ:
>  		case BLKIF_OP_WRITE:

-- 
Damien Le Moal
Western Digital Research

