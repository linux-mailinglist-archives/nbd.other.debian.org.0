Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD4F2BA36C
	for <lists+nbd@lfdr.de>; Fri, 20 Nov 2020 08:36:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 285C920CFB; Fri, 20 Nov 2020 07:36:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov 20 07:36:44 2020
Old-Return-Path: <hare@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	FOURLA,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 62F5120CD6
	for <lists-other-nbd@bendel.debian.org>; Fri, 20 Nov 2020 07:20:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zWZfBOiRmWnZ for <lists-other-nbd@bendel.debian.org>;
	Fri, 20 Nov 2020 07:20:49 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "smtp2.suse.de", Issuer "Let's Encrypt Authority X3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DF39320CCD
	for <nbd@other.debian.org>; Fri, 20 Nov 2020 07:20:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 95218AC0C;
	Fri, 20 Nov 2020 07:20:47 +0000 (UTC)
Subject: Re: [PATCH 32/78] block: remove set_device_ro
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Josef Bacik <josef@toxicpanda.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
 Song Liu <song@kernel.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, dm-devel@redhat.com,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <20201116145809.410558-1-hch@lst.de>
 <20201116145809.410558-33-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <d1beca65-cd8e-57ff-e7d7-6347cb6344b4@suse.de>
Date: Fri, 20 Nov 2020 08:20:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-33-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AKNlulq4X6N.A.4bE.MI3tfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1074
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d1beca65-cd8e-57ff-e7d7-6347cb6344b4@suse.de
Resent-Date: Fri, 20 Nov 2020 07:36:44 +0000 (UTC)

On 11/16/20 3:57 PM, Christoph Hellwig wrote:
> Fold set_device_ro into its only remaining caller.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/genhd.c         | 7 -------
>   block/ioctl.c         | 2 +-
>   include/linux/genhd.h | 1 -
>   3 files changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/block/genhd.c b/block/genhd.c
> index 8c350fecfe8bfe..b0f0b0cac9aa7f 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -1843,13 +1843,6 @@ static void set_disk_ro_uevent(struct gendisk *gd, int ro)
>   	kobject_uevent_env(&disk_to_dev(gd)->kobj, KOBJ_CHANGE, envp);
>   }
>   
> -void set_device_ro(struct block_device *bdev, int flag)
> -{
> -	bdev->bd_part->policy = flag;
> -}
> -
> -EXPORT_SYMBOL(set_device_ro);
> -
>   void set_disk_ro(struct gendisk *disk, int flag)
>   {
>   	struct disk_part_iter piter;
> diff --git a/block/ioctl.c b/block/ioctl.c
> index 96cb4544736468..04255dc5f3bff3 100644
> --- a/block/ioctl.c
> +++ b/block/ioctl.c
> @@ -371,7 +371,7 @@ static int blkdev_roset(struct block_device *bdev, fmode_t mode,
>   		if (ret)
>   			return ret;
>   	}
> -	set_device_ro(bdev, n);
> +	bdev->bd_part->policy = n;
>   	return 0;
>   }
>   
> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index 4b22bfd9336e1a..8427ad8bef520d 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -304,7 +304,6 @@ extern void del_gendisk(struct gendisk *gp);
>   extern struct gendisk *get_gendisk(dev_t dev, int *partno);
>   extern struct block_device *bdget_disk(struct gendisk *disk, int partno);
>   
> -extern void set_device_ro(struct block_device *bdev, int flag);
>   extern void set_disk_ro(struct gendisk *disk, int flag);
>   
>   static inline int get_disk_ro(struct gendisk *disk)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

