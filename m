Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBA3778C0E
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 12:27:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 80F552063F; Fri, 11 Aug 2023 10:27:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 10:27:45 2023
Old-Return-Path: <BATV+10530082ca17b6f7899b+7292+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6A9AF205CD
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:09:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6k7DMSl-pP3W for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:09:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 74556205DE
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9yuZPRRL/ewc+JozXfI5eRa3tyH81wiISTS4rS7GMcU=; b=2/Wahet/Y/OHfF09ISjohM82rq
	GjyGfQpYQdVF5upjim+IxKYqzit/TZaED5StXGuAeRHLHO7ILQ4YTOIDaLu6kOZDbVULgJKI65xCK
	BK7rk2gnpvb9QhrBS+PpwqhbFryAFJgMuHvRmat8AeQkLiCnegfVFW0TfPWhd0nGxbXycXSCWIBwj
	k6dofYme8Jorw+PVoEH4pffGm8vb7Ej3bdeLLV8IKFBqyiT5NJINWeWirzH/4VVJMqEneceCJufMM
	yUypVCK6aLvP7xayAGW8PXP5i0Dsv2abDaHYq54XuqOVFc0zRf3WZtaERA3y0rq6Kt103tMChpzNF
	YUvN4U7w==;
Received: from [88.128.92.63] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP52-00A5sO-1J;
	Fri, 11 Aug 2023 10:09:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-s390@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 15/17] block: call into the file system for ioctl BLKFLSBUF
Date: Fri, 11 Aug 2023 12:08:26 +0200
Message-Id: <20230811100828.1897174-16-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811100828.1897174-1-hch@lst.de>
References: <20230811100828.1897174-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <llozlhRevFK.A.XLB.h0g1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2612
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811100828.1897174-16-hch@lst.de
Resent-Date: Fri, 11 Aug 2023 10:27:45 +0000 (UTC)

BLKFLSBUF is a historic ioctl that is called on a file handle to a
block device and syncs either the file system mounted on that block
device if there is one, or otherwise the just the data on the block
device.

Replace the get_super based syncing with a holder operation to remove
the last usage of get_super, and to also support syncing the file system
if the block device is not the main block device stored in s_dev.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bdev.c           | 16 ----------------
 block/ioctl.c          |  9 ++++++++-
 fs/super.c             | 13 +++++++++++++
 include/linux/blkdev.h |  7 +++++--
 4 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index 658d5dd62cac0a..2a035be7f3ee90 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -206,22 +206,6 @@ int sync_blockdev_range(struct block_device *bdev, loff_t lstart, loff_t lend)
 }
 EXPORT_SYMBOL(sync_blockdev_range);
 
-/*
- * Write out and wait upon all dirty data associated with this
- * device.   Filesystem data as well as the underlying block
- * device.  Takes the superblock lock.
- */
-int fsync_bdev(struct block_device *bdev)
-{
-	struct super_block *sb = get_super(bdev);
-	if (sb) {
-		int res = sync_filesystem(sb);
-		drop_super(sb);
-		return res;
-	}
-	return sync_blockdev(bdev);
-}
-
 /**
  * freeze_bdev - lock a filesystem and force it into a consistent state
  * @bdev:	blockdevice to lock
diff --git a/block/ioctl.c b/block/ioctl.c
index 3be11941fb2ddc..648670ddb164a0 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -364,7 +364,14 @@ static int blkdev_flushbuf(struct block_device *bdev, unsigned cmd,
 {
 	if (!capable(CAP_SYS_ADMIN))
 		return -EACCES;
-	fsync_bdev(bdev);
+
+	mutex_lock(&bdev->bd_holder_lock);
+	if (bdev->bd_holder_ops && bdev->bd_holder_ops->sync)
+		bdev->bd_holder_ops->sync(bdev);
+	else
+		sync_blockdev(bdev);
+	mutex_unlock(&bdev->bd_holder_lock);
+
 	invalidate_bdev(bdev);
 	return 0;
 }
diff --git a/fs/super.c b/fs/super.c
index 94d41040584f7b..714dbae58b5e8e 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1248,8 +1248,21 @@ static void fs_bdev_mark_dead(struct block_device *bdev, bool surprise)
 	up_read(&sb->s_umount);
 }
 
+static void fs_bdev_sync(struct block_device *bdev)
+{
+	struct super_block *sb = bdev->bd_holder;
+
+	lockdep_assert_held(&bdev->bd_holder_lock);
+
+	if (!lock_active_super(sb))
+		return;
+	sync_filesystem(sb);
+	up_read(&sb->s_umount);
+}
+ 
 const struct blk_holder_ops fs_holder_ops = {
 	.mark_dead		= fs_bdev_mark_dead,
+	.sync			= fs_bdev_sync,
 };
 EXPORT_SYMBOL_GPL(fs_holder_ops);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index cdd03c612d3957..fa462d48ee9640 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1462,6 +1462,11 @@ void blkdev_show(struct seq_file *seqf, off_t offset);
 
 struct blk_holder_ops {
 	void (*mark_dead)(struct block_device *bdev, bool surprise);
+
+	/*
+	 * Sync the file system mounted on the block device.
+	 */
+	void (*sync)(struct block_device *bdev);
 };
 
 extern const struct blk_holder_ops fs_holder_ops;
@@ -1524,8 +1529,6 @@ static inline int early_lookup_bdev(const char *pathname, dev_t *dev)
 }
 #endif /* CONFIG_BLOCK */
 
-int fsync_bdev(struct block_device *bdev);
-
 int freeze_bdev(struct block_device *bdev);
 int thaw_bdev(struct block_device *bdev);
 
-- 
2.39.2

