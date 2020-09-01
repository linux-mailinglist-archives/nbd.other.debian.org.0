Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E33A25974F
	for <lists+nbd@lfdr.de>; Tue,  1 Sep 2020 18:15:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5ECE42051F; Tue,  1 Sep 2020 16:15:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  1 16:15:20 2020
Old-Return-Path: <BATV+00d723da4443b0556009+6218+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C56A42051F
	for <lists-other-nbd@bendel.debian.org>; Tue,  1 Sep 2020 15:58:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.921 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ry1SeNp7mf3v for <lists-other-nbd@bendel.debian.org>;
	Tue,  1 Sep 2020 15:58:07 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C1297204EA
	for <nbd@other.debian.org>; Tue,  1 Sep 2020 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JwoxFn1DL9AgOwWsToHdZ13/MHJxRG0CnbCzjhSpNDE=; b=b9sm9foZ2KknJ4znljpLx2tUxn
	oHaDHjiuyz2grgulygPpo/Qt19o7EEhlKBaFQaye8aVAHlUOdgjRbIwQiMFNOILeJK413BVET1RBr
	NFu4/Mlx40CLQIMWWTQ+H2/QZeN4oP3V9c18i7Zj/x0HMX+2Pz0AusBSB9/N2trHMtImLm7AIgVcw
	sRURjlZOujAIrW1S9ej6ASWNNxjKaSL0+d1g6HOJ6p6m0vY4ZUkTZuPXR5rF+FzGcCaoCQakWXoUF
	ZC+KtpVnczDr9Kk+XrKuWXSyKhqAWMOBdsnSXK12OmCmbaGCHAAlmwQZqGcYiUe3ywrUitxTV3IJy
	eOb7kBaQ==;
Received: from [2001:4bb8:18c:45ba:2f95:e5:ca6b:9b4a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8fV-0004PE-1e; Tue, 01 Sep 2020 15:57:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Josef Bacik <josef@toxicpanda.com>,
	Dan Williams <dan.j.williams@intel.com>,
	dm-devel@redhat.com,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-raid@vger.kernel.org,
	linux-nvdimm@lists.01.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 4/9] block: add a new revalidate_disk_size helper
Date: Tue,  1 Sep 2020 17:57:43 +0200
Message-Id: <20200901155748.2884-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901155748.2884-1-hch@lst.de>
References: <20200901155748.2884-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gfLsn0XwD0H.A.8v.YOnTfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/964
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200901155748.2884-5-hch@lst.de
Resent-Date: Tue,  1 Sep 2020 16:15:20 +0000 (UTC)

revalidate_disk is a relative awkward helper for driver use, as it first
calls an optional driver method and then updates the block device size,
while most callers either don't need the method call at all, or want to
keep state between the caller and the called method.

Add a revalidate_disk_size helper that just performs the update of the
block device size from the gendisk one, and switch all drivers that do
not implement ->revalidate_disk to use the new helper instead of
revalidate_disk()

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rbd.c           |  2 +-
 drivers/block/rnbd/rnbd-clt.c | 10 ++-------
 drivers/block/virtio_blk.c    |  2 +-
 drivers/block/zram/zram_drv.c |  4 ++--
 drivers/md/dm-raid.c          |  2 +-
 drivers/md/md-cluster.c       |  6 ++---
 drivers/md/md-linear.c        |  2 +-
 drivers/md/md.c               | 10 ++++-----
 fs/block_dev.c                | 42 ++++++++++++++++++++++++-----------
 include/linux/genhd.h         |  1 +
 10 files changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 01153903969321..5d3923c0997ce0 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -4921,7 +4921,7 @@ static void rbd_dev_update_size(struct rbd_device *rbd_dev)
 		size = (sector_t)rbd_dev->mapping.size / SECTOR_SIZE;
 		dout("setting size to %llu sectors", (unsigned long long)size);
 		set_capacity(rbd_dev->disk, size);
-		revalidate_disk(rbd_dev->disk);
+		revalidate_disk_size(rbd_dev->disk, true);
 	}
 }
 
diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
index cc6a4e2587aec2..157538fc8be515 100644
--- a/drivers/block/rnbd/rnbd-clt.c
+++ b/drivers/block/rnbd/rnbd-clt.c
@@ -102,18 +102,12 @@ static int rnbd_clt_set_dev_attr(struct rnbd_clt_dev *dev,
 static int rnbd_clt_change_capacity(struct rnbd_clt_dev *dev,
 				    size_t new_nsectors)
 {
-	int err = 0;
-
 	rnbd_clt_info(dev, "Device size changed from %zu to %zu sectors\n",
 		       dev->nsectors, new_nsectors);
 	dev->nsectors = new_nsectors;
 	set_capacity(dev->gd, dev->nsectors);
-	err = revalidate_disk(dev->gd);
-	if (err)
-		rnbd_clt_err(dev,
-			      "Failed to change device size from %zu to %zu, err: %d\n",
-			      dev->nsectors, new_nsectors, err);
-	return err;
+	revalidate_disk_size(dev->gd, true);
+	return 0;
 }
 
 static int process_msg_open_rsp(struct rnbd_clt_dev *dev,
diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
index ca63a41059d68e..a314b9382442b6 100644
--- a/drivers/block/virtio_blk.c
+++ b/drivers/block/virtio_blk.c
@@ -598,7 +598,7 @@ static void virtblk_update_cache_mode(struct virtio_device *vdev)
 	struct virtio_blk *vblk = vdev->priv;
 
 	blk_queue_write_cache(vblk->disk->queue, writeback, false);
-	revalidate_disk(vblk->disk);
+	revalidate_disk_size(vblk->disk, true);
 }
 
 static const char *const virtblk_cache_types[] = {
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 9100ac36670afc..a356275605b104 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1739,7 +1739,7 @@ static ssize_t disksize_store(struct device *dev,
 	zram->disksize = disksize;
 	set_capacity(zram->disk, zram->disksize >> SECTOR_SHIFT);
 
-	revalidate_disk(zram->disk);
+	revalidate_disk_size(zram->disk, true);
 	up_write(&zram->init_lock);
 
 	return len;
@@ -1786,7 +1786,7 @@ static ssize_t reset_store(struct device *dev,
 	/* Make sure all the pending I/O are finished */
 	fsync_bdev(bdev);
 	zram_reset_device(zram);
-	revalidate_disk(zram->disk);
+	revalidate_disk_size(zram->disk, true);
 	bdput(bdev);
 
 	mutex_lock(&bdev->bd_mutex);
diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 8d2b835d7a108c..56b723d012ac15 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -701,7 +701,7 @@ static void rs_set_capacity(struct raid_set *rs)
 	struct gendisk *gendisk = dm_disk(dm_table_get_md(rs->ti->table));
 
 	set_capacity(gendisk, rs->md.array_sectors);
-	revalidate_disk(gendisk);
+	revalidate_disk_size(gendisk, true);
 }
 
 /*
diff --git a/drivers/md/md-cluster.c b/drivers/md/md-cluster.c
index d50737ec403946..0580b51a156a1c 100644
--- a/drivers/md/md-cluster.c
+++ b/drivers/md/md-cluster.c
@@ -582,7 +582,7 @@ static int process_recvd_msg(struct mddev *mddev, struct cluster_msg *msg)
 		break;
 	case CHANGE_CAPACITY:
 		set_capacity(mddev->gendisk, mddev->array_sectors);
-		revalidate_disk(mddev->gendisk);
+		revalidate_disk_size(mddev->gendisk, true);
 		break;
 	case RESYNCING:
 		set_bit(MD_RESYNCING_REMOTE, &mddev->recovery);
@@ -1296,12 +1296,12 @@ static void update_size(struct mddev *mddev, sector_t old_dev_sectors)
 			pr_err("%s:%d: failed to send CHANGE_CAPACITY msg\n",
 			       __func__, __LINE__);
 		set_capacity(mddev->gendisk, mddev->array_sectors);
-		revalidate_disk(mddev->gendisk);
+		revalidate_disk_size(mddev->gendisk, true);
 	} else {
 		/* revert to previous sectors */
 		ret = mddev->pers->resize(mddev, old_dev_sectors);
 		if (!ret)
-			revalidate_disk(mddev->gendisk);
+			revalidate_disk_size(mddev->gendisk, true);
 		ret = __sendmsg(cinfo, &cmsg);
 		if (ret)
 			pr_err("%s:%d: failed to send METADATA_UPDATED msg\n",
diff --git a/drivers/md/md-linear.c b/drivers/md/md-linear.c
index c2ae9125c4c381..5ab22069b5be9c 100644
--- a/drivers/md/md-linear.c
+++ b/drivers/md/md-linear.c
@@ -202,7 +202,7 @@ static int linear_add(struct mddev *mddev, struct md_rdev *rdev)
 	md_set_array_sectors(mddev, linear_size(mddev, 0, 0));
 	set_capacity(mddev->gendisk, mddev->array_sectors);
 	mddev_resume(mddev);
-	revalidate_disk(mddev->gendisk);
+	revalidate_disk_size(mddev->gendisk, true);
 	kfree_rcu(oldconf, rcu);
 	return 0;
 }
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 60727820702300..9562ef598ae1f4 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5358,7 +5358,7 @@ array_size_store(struct mddev *mddev, const char *buf, size_t len)
 		mddev->array_sectors = sectors;
 		if (mddev->pers) {
 			set_capacity(mddev->gendisk, mddev->array_sectors);
-			revalidate_disk(mddev->gendisk);
+			revalidate_disk_size(mddev->gendisk, true);
 		}
 	}
 	mddev_unlock(mddev);
@@ -6109,7 +6109,7 @@ int do_md_run(struct mddev *mddev)
 	md_wakeup_thread(mddev->sync_thread); /* possibly kick off a reshape */
 
 	set_capacity(mddev->gendisk, mddev->array_sectors);
-	revalidate_disk(mddev->gendisk);
+	revalidate_disk_size(mddev->gendisk, true);
 	clear_bit(MD_NOT_READY, &mddev->flags);
 	mddev->changed = 1;
 	kobject_uevent(&disk_to_dev(mddev->gendisk)->kobj, KOBJ_CHANGE);
@@ -6427,7 +6427,7 @@ static int do_md_stop(struct mddev *mddev, int mode,
 		set_capacity(disk, 0);
 		mutex_unlock(&mddev->open_mutex);
 		mddev->changed = 1;
-		revalidate_disk(disk);
+		revalidate_disk_size(disk, true);
 
 		if (mddev->ro)
 			mddev->ro = 0;
@@ -7259,7 +7259,7 @@ static int update_size(struct mddev *mddev, sector_t num_sectors)
 			md_cluster_ops->update_size(mddev, old_dev_sectors);
 		else if (mddev->queue) {
 			set_capacity(mddev->gendisk, mddev->array_sectors);
-			revalidate_disk(mddev->gendisk);
+			revalidate_disk_size(mddev->gendisk, true);
 		}
 	}
 	return rv;
@@ -9018,7 +9018,7 @@ void md_do_sync(struct md_thread *thread)
 		mddev_unlock(mddev);
 		if (!mddev_is_clustered(mddev)) {
 			set_capacity(mddev->gendisk, mddev->array_sectors);
-			revalidate_disk(mddev->gendisk);
+			revalidate_disk_size(mddev->gendisk, true);
 		}
 	}
 
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 0207623769715d..85f013315d48b3 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1311,6 +1311,34 @@ static void check_disk_size_change(struct gendisk *disk,
 	}
 }
 
+/**
+ * revalidate_disk_size - checks for disk size change and adjusts bdev size.
+ * @disk: struct gendisk to check
+ * @verbose: if %true log a message about a size change if there is any
+ *
+ * This routine checks to see if the bdev size does not match the disk size
+ * and adjusts it if it differs. When shrinking the bdev size, its all caches
+ * are freed.
+ */
+void revalidate_disk_size(struct gendisk *disk, bool verbose)
+{
+	struct block_device *bdev;
+
+	/*
+	 * Hidden disks don't have associated bdev so there's no point in
+	 * revalidating them.
+	 */
+	if (disk->flags & GENHD_FL_HIDDEN)
+		return;
+
+	bdev = bdget_disk(disk, 0);
+	if (bdev) {
+		check_disk_size_change(disk, bdev, verbose);
+		bdput(bdev);
+	}
+}
+EXPORT_SYMBOL(revalidate_disk_size);
+
 /**
  * revalidate_disk - wrapper for lower-level driver's revalidate_disk call-back
  * @disk: struct gendisk to be revalidated
@@ -1325,19 +1353,7 @@ int revalidate_disk(struct gendisk *disk)
 
 	if (disk->fops->revalidate_disk)
 		ret = disk->fops->revalidate_disk(disk);
-
-	/*
-	 * Hidden disks don't have associated bdev so there's no point in
-	 * revalidating it.
-	 */
-	if (!(disk->flags & GENHD_FL_HIDDEN)) {
-		struct block_device *bdev = bdget_disk(disk, 0);
-
-		if (bdev) {
-			check_disk_size_change(disk, bdev, ret == 0);
-			bdput(bdev);
-		}
-	}
+	revalidate_disk_size(disk, ret == 0);
 	return ret;
 }
 EXPORT_SYMBOL(revalidate_disk);
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 39025dc0397c04..8e9c9d3a493fae 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -373,6 +373,7 @@ int register_blkdev(unsigned int major, const char *name);
 void unregister_blkdev(unsigned int major, const char *name);
 
 int revalidate_disk(struct gendisk *disk);
+void revalidate_disk_size(struct gendisk *disk, bool verbose);
 int check_disk_change(struct block_device *bdev);
 int __invalidate_device(struct block_device *bdev, bool kill_dirty);
 void bd_set_nr_sectors(struct block_device *bdev, sector_t sectors);
-- 
2.28.0

