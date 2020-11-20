Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F522BA424
	for <lists+nbd@lfdr.de>; Fri, 20 Nov 2020 09:00:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6B7AB20D1A; Fri, 20 Nov 2020 08:00:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov 20 08:00:14 2020
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
	by bendel.debian.org (Postfix) with ESMTP id E235120C3D
	for <lists-other-nbd@bendel.debian.org>; Fri, 20 Nov 2020 07:43:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id sHGuIh8KVIKo for <lists-other-nbd@bendel.debian.org>;
	Fri, 20 Nov 2020 07:43:05 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "smtp2.suse.de", Issuer "Let's Encrypt Authority X3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4EBA120CF8
	for <nbd@other.debian.org>; Fri, 20 Nov 2020 07:43:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E6A77AB3D;
	Fri, 20 Nov 2020 07:43:02 +0000 (UTC)
Subject: Re: [PATCH 65/78] dm: remove the block_device reference in struct
 mapped_device
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
 <20201116145809.410558-66-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <310bff8b-dbda-609a-a392-619733b86bd1@suse.de>
Date: Fri, 20 Nov 2020 08:43:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-66-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <v1Ozn-zKioP.A.BwD.Oe3tfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1088
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/310bff8b-dbda-609a-a392-619733b86bd1@suse.de
Resent-Date: Fri, 20 Nov 2020 08:00:14 +0000 (UTC)

On 11/16/20 3:57 PM, Christoph Hellwig wrote:
> Get rid of the long-lasting struct block_device reference in
> struct mapped_device.  The only remaining user is the freeze code,
> where we can trivially look up the block device at freeze time
> and release the reference at thaw time.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/md/dm-core.h |  2 --
>   drivers/md/dm.c      | 22 +++++++++++-----------
>   2 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
> index d522093cb39dda..b1b400ed76fe90 100644
> --- a/drivers/md/dm-core.h
> +++ b/drivers/md/dm-core.h
> @@ -107,8 +107,6 @@ struct mapped_device {
>   	/* kobject and completion */
>   	struct dm_kobject_holder kobj_holder;
>   
> -	struct block_device *bdev;
> -
>   	struct dm_stats stats;
>   
>   	/* for blk-mq request-based DM support */
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 6d7eb72d41f9ea..c789ffea2badde 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1744,11 +1744,6 @@ static void cleanup_mapped_device(struct mapped_device *md)
>   
>   	cleanup_srcu_struct(&md->io_barrier);
>   
> -	if (md->bdev) {
> -		bdput(md->bdev);
> -		md->bdev = NULL;
> -	}
> -
>   	mutex_destroy(&md->suspend_lock);
>   	mutex_destroy(&md->type_lock);
>   	mutex_destroy(&md->table_devices_lock);
> @@ -1840,10 +1835,6 @@ static struct mapped_device *alloc_dev(int minor)
>   	if (!md->wq)
>   		goto bad;
>   
> -	md->bdev = bdget_disk(md->disk, 0);
> -	if (!md->bdev)
> -		goto bad;
> -
>   	dm_stats_init(&md->stats);
>   
>   	/* Populate the mapping, nobody knows we exist yet */
> @@ -2384,12 +2375,17 @@ struct dm_table *dm_swap_table(struct mapped_device *md, struct dm_table *table)
>    */
>   static int lock_fs(struct mapped_device *md)
>   {
> +	struct block_device *bdev;
>   	int r;
>   
>   	WARN_ON(md->frozen_sb);
>   
> -	md->frozen_sb = freeze_bdev(md->bdev);
> +	bdev = bdget_disk(md->disk, 0);
> +	if (!bdev)
> +		return -ENOMEM;
> +	md->frozen_sb = freeze_bdev(bdev);
>   	if (IS_ERR(md->frozen_sb)) {
> +		bdput(bdev);
>   		r = PTR_ERR(md->frozen_sb);
>   		md->frozen_sb = NULL;
>   		return r;
> @@ -2402,10 +2398,14 @@ static int lock_fs(struct mapped_device *md)
>   
>   static void unlock_fs(struct mapped_device *md)
>   {
> +	struct block_device *bdev;
> +
>   	if (!test_bit(DMF_FROZEN, &md->flags))
>   		return;
>   
> -	thaw_bdev(md->bdev, md->frozen_sb);
> +	bdev = md->frozen_sb->s_bdev;
> +	thaw_bdev(bdev, md->frozen_sb);
> +	bdput(bdev);
>   	md->frozen_sb = NULL;
>   	clear_bit(DMF_FROZEN, &md->flags);
>   }
> 
Yay. Just what I need for the blk-interposer code, where the ->bdev
pointer is really getting in the way.

Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

