Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F52BA5A5
	for <lists+nbd@lfdr.de>; Fri, 20 Nov 2020 10:15:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0625B20D50; Fri, 20 Nov 2020 09:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov 20 09:15:09 2020
Old-Return-Path: <hare@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=CC_TOO_MANY,FOURLA,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4A71820D3C
	for <lists-other-nbd@bendel.debian.org>; Fri, 20 Nov 2020 08:58:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7Nc-6HZOT6Ac for <lists-other-nbd@bendel.debian.org>;
	Fri, 20 Nov 2020 08:58:45 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "smtp2.suse.de", Issuer "Let's Encrypt Authority X3" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id ECA0D20D3B
	for <nbd@other.debian.org>; Fri, 20 Nov 2020 08:58:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5CAD1AC23;
	Fri, 20 Nov 2020 08:58:42 +0000 (UTC)
Subject: Re: [PATCH 74/78] block: merge struct block_device and struct
 hd_struct
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
 <20201116145809.410558-75-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <f6e6b948-44c8-50f0-beea-921eb3a268dd@suse.de>
Date: Fri, 20 Nov 2020 09:58:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-75-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yoIUm0WMY0M.A.HhF.dk4tfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1097
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f6e6b948-44c8-50f0-beea-921eb3a268dd@suse.de
Resent-Date: Fri, 20 Nov 2020 09:15:10 +0000 (UTC)

On 11/16/20 3:58 PM, Christoph Hellwig wrote:
> Instead of having two structures that represent each block device with
> different lift time rules merged them into a single one.  This also
> greatly simplifies the reference counting rules, as we can use the inode
> reference count as the main reference count for the new struct
> block_device, with the device model reference front ending it for device
> model interaction.  The percpu refcount in struct hd_struct is entirely
> gone given that struct block_device must be opened and thus valid for
> the duration of the I/O.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   block/bio.c                        |   6 +-
>   block/blk-cgroup.c                 |   9 +-
>   block/blk-core.c                   |  85 +++++-----
>   block/blk-flush.c                  |   2 +-
>   block/blk-lib.c                    |   2 +-
>   block/blk-merge.c                  |   6 +-
>   block/blk-mq.c                     |  11 +-
>   block/blk-mq.h                     |   5 +-
>   block/blk.h                        |  38 ++---
>   block/genhd.c                      | 242 +++++++++++------------------
>   block/ioctl.c                      |   4 +-
>   block/partitions/core.c            | 221 +++++++-------------------
>   drivers/block/drbd/drbd_receiver.c |   2 +-
>   drivers/block/drbd/drbd_worker.c   |   2 +-
>   drivers/block/zram/zram_drv.c      |   2 +-
>   drivers/md/bcache/request.c        |   4 +-
>   drivers/md/dm.c                    |   8 +-
>   drivers/md/md.c                    |   4 +-
>   drivers/nvme/target/admin-cmd.c    |  20 +--
>   drivers/s390/block/dasd.c          |   8 +-
>   fs/block_dev.c                     |  68 +++-----
>   fs/ext4/super.c                    |  18 +--
>   fs/ext4/sysfs.c                    |  10 +-
>   fs/f2fs/checkpoint.c               |   5 +-
>   fs/f2fs/f2fs.h                     |   2 +-
>   fs/f2fs/super.c                    |   6 +-
>   fs/f2fs/sysfs.c                    |   9 --
>   include/linux/blk_types.h          |  23 ++-
>   include/linux/blkdev.h             |  13 +-
>   include/linux/genhd.h              |  67 ++------
>   include/linux/part_stat.h          |  17 +-
>   init/do_mounts.c                   |  20 +--
>   kernel/trace/blktrace.c            |  54 ++-----
>   33 files changed, 351 insertions(+), 642 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                Kernel Storage Architect
hare@suse.de                              +49 911 74053 688
SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), Geschäftsführer: Felix Imendörffer

