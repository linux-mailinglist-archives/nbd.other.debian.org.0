Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 281EA4FC3A0
	for <lists+nbd@lfdr.de>; Mon, 11 Apr 2022 19:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DE206203E0; Mon, 11 Apr 2022 17:45:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 11 17:45:09 2022
Old-Return-Path: <dsterba@suse.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C9DB7203D7
	for <lists-other-nbd@bendel.debian.org>; Mon, 11 Apr 2022 17:28:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.49 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SQxus5D1ITlX for <lists-other-nbd@bendel.debian.org>;
	Mon, 11 Apr 2022 17:28:29 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 07106203D6
	for <nbd@other.debian.org>; Mon, 11 Apr 2022 17:28:28 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id ABD701F7AD;
	Mon, 11 Apr 2022 17:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1649698106;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0RiNf7uoJjg1rRFObzVZQSCMAd1nof/h0vLpUgMcwvY=;
	b=tfXHkMaj5kpUcLtvBYnwRGxDxcXmodIyKTVNxARm8whPlAkOVHL3pBXy48YlCR99uput93
	ek64inXcfBYSt9NuV9MWohA/Liu5eXfW+58ujnwevThluScwhFajBAp+/PR+hCYJW8ogrY
	iu/7/TOOXGQ1NMcWDFWaoeOCSwaX7H0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1649698106;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0RiNf7uoJjg1rRFObzVZQSCMAd1nof/h0vLpUgMcwvY=;
	b=y/QeT70zXSjm5PP3weiVBlhCkwkEL69tQO+HTTi+7j+oI3RtiZJDs5egZuujl2LcaWZ24F
	apjvnh1HQMyDZeAA==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
	by relay2.suse.de (Postfix) with ESMTP id 775CCA3B82;
	Mon, 11 Apr 2022 17:28:26 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id 0F66CDA7F7; Mon, 11 Apr 2022 19:24:22 +0200 (CEST)
Date: Mon, 11 Apr 2022 19:24:21 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Coly Li <colyli@suse.de>
Subject: Re: [PATCH 24/27] block: remove QUEUE_FLAG_DISCARD
Message-ID: <20220411172421.GU15609@twin.jikos.cz>
Reply-To: dsterba@suse.cz
Mail-Followup-To: dsterba@suse.cz, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Coly Li <colyli@suse.de>
References: <20220409045043.23593-1-hch@lst.de>
 <20220409045043.23593-25-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220409045043.23593-25-hch@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5e4SGLZaNWM.A.nzE.lkGViB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1969
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220411172421.GU15609@twin.jikos.cz
Resent-Date: Mon, 11 Apr 2022 17:45:09 +0000 (UTC)

On Sat, Apr 09, 2022 at 06:50:40AM +0200, Christoph Hellwig wrote:
> Just use a non-zero max_discard_sectors as an indicator for discard
> support, similar to what is done for write zeroes.
> 
> The only places where needs special attention is the RAID5 driver,
> which must clear discard support for security reasons by default,
> even if the default stacking rules would allow for it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com> [btrfs]
> Acked-by: Coly Li <colyli@suse.de> [bcache]
> ---
>  arch/um/drivers/ubd_kern.c          |  2 --
>  block/blk-core.c                    |  2 +-
>  block/blk-lib.c                     |  2 +-
>  block/blk-mq-debugfs.c              |  1 -
>  block/ioctl.c                       |  3 +--
>  drivers/block/drbd/drbd_main.c      |  2 +-
>  drivers/block/drbd/drbd_nl.c        | 19 ++-----------------
>  drivers/block/drbd/drbd_receiver.c  |  3 +--
>  drivers/block/loop.c                | 11 +++--------
>  drivers/block/nbd.c                 |  5 +----
>  drivers/block/null_blk/main.c       |  1 -
>  drivers/block/rbd.c                 |  1 -
>  drivers/block/rnbd/rnbd-clt.c       |  2 --
>  drivers/block/rnbd/rnbd-srv-dev.h   |  3 ---
>  drivers/block/virtio_blk.c          |  2 --
>  drivers/block/xen-blkback/xenbus.c  |  2 +-
>  drivers/block/xen-blkfront.c        |  2 --
>  drivers/block/zram/zram_drv.c       |  1 -
>  drivers/md/bcache/request.c         |  4 ++--
>  drivers/md/bcache/super.c           |  3 +--
>  drivers/md/bcache/sysfs.c           |  2 +-
>  drivers/md/dm-cache-target.c        |  9 +--------
>  drivers/md/dm-clone-target.c        |  9 +--------
>  drivers/md/dm-log-writes.c          |  3 +--
>  drivers/md/dm-raid.c                |  9 ++-------
>  drivers/md/dm-table.c               |  9 ++-------
>  drivers/md/dm-thin.c                | 11 +----------
>  drivers/md/dm.c                     |  3 +--
>  drivers/md/md-linear.c              | 11 +----------
>  drivers/md/raid0.c                  |  7 -------
>  drivers/md/raid1.c                  | 16 +---------------
>  drivers/md/raid10.c                 | 18 ++----------------
>  drivers/md/raid5-cache.c            |  2 +-
>  drivers/md/raid5.c                  | 12 ++++--------
>  drivers/mmc/core/queue.c            |  1 -
>  drivers/mtd/mtd_blkdevs.c           |  1 -
>  drivers/nvme/host/core.c            |  6 ++----
>  drivers/s390/block/dasd_fba.c       |  1 -
>  drivers/scsi/sd.c                   |  2 --
>  drivers/target/target_core_device.c |  2 +-

For

>  fs/btrfs/extent-tree.c              |  4 ++--
>  fs/btrfs/ioctl.c                    |  2 +-

Acked-by: David Sterba <dsterba@suse.com>

