Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E07FF778BF4
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 12:24:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C88572063D; Fri, 11 Aug 2023 10:24:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 10:24:13 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 7F4E520639
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:08:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9TtOTGR1bkWZ for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:08:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 67693205CD
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=K/QBcOv4fTIU7nBesYdEWMXMlgsg7gJvNa3bCA3VzKs=; b=K2FtvqOc6v9BOz4kx+Q9nAQX35
	JA+FvvCyWF1N2GvLJ+tzYrLvjKzUxvBrw0YbLQK4cyDETzmkA8nS2pYTbU1l2LDHA1seMmpnhxYis
	YTGlfc/QmhyMJzSXTpMlFoJZxbLcohrsqte1tENFcJHDIdg/Eh8vxiqgyRCy65u6iSRu4I/8vsdh+
	UM28ssSRN4XuB2Z9kkibHdnWbS23rWBTtFmdjpz5b1exGl4liCAFQRwqSG3mQEYCE1RtbyhadZcI0
	sz0iQIkvuy1iVgGEABv0nHkoZk6vTKBqO441yl7JkYvaIcyHDPfvvYh2L5CvVqdFAzcJyEB5E1Zr3
	aAA80+RQ==;
Received: from [88.128.92.63] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP4R-00A5aJ-1t;
	Fri, 11 Aug 2023 10:08:40 +0000
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
Subject: [PATCH 03/17] btrfs: call btrfs_close_devices from ->kill_sb
Date: Fri, 11 Aug 2023 12:08:14 +0200
Message-Id: <20230811100828.1897174-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811100828.1897174-1-hch@lst.de>
References: <20230811100828.1897174-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xri3WlXGx7L.A.QP.Nxg1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2597
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811100828.1897174-4-hch@lst.de
Resent-Date: Fri, 11 Aug 2023 10:24:13 +0000 (UTC)

blkdev_put must not be called under sb->s_umount to avoid a lock order
reversal with disk->open_mutex once call backs from block devices to
the file system using the holder ops are supported.  Move the call
to btrfs_close_devices into btrfs_free_fs_info so that it is closed
from ->kill_sb (which is also called from the mount failure handling
path unlike ->put_super) as well as when an fs_info is freed because
an existing superblock already exists.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/disk-io.c | 4 ++--
 fs/btrfs/super.c   | 7 ++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index 7513388b0567be..3788b55638392e 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -1243,6 +1243,8 @@ static void free_global_roots(struct btrfs_fs_info *fs_info)
 
 void btrfs_free_fs_info(struct btrfs_fs_info *fs_info)
 {
+	if (fs_info->fs_devices)
+		btrfs_close_devices(fs_info->fs_devices);
 	percpu_counter_destroy(&fs_info->dirty_metadata_bytes);
 	percpu_counter_destroy(&fs_info->delalloc_bytes);
 	percpu_counter_destroy(&fs_info->ordered_bytes);
@@ -3554,7 +3556,6 @@ int __cold open_ctree(struct super_block *sb, struct btrfs_fs_devices *fs_device
 
 	iput(fs_info->btree_inode);
 fail:
-	btrfs_close_devices(fs_info->fs_devices);
 	ASSERT(ret < 0);
 	return ret;
 }
@@ -4408,7 +4409,6 @@ void __cold close_ctree(struct btrfs_fs_info *fs_info)
 #endif
 
 	btrfs_mapping_tree_free(&fs_info->mapping_tree);
-	btrfs_close_devices(fs_info->fs_devices);
 }
 
 void btrfs_mark_buffer_dirty(struct extent_buffer *buf)
diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index b318bddefd5236..2bbc041ac2e2c5 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -1494,7 +1494,7 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 
 	if (!(flags & SB_RDONLY) && fs_devices->rw_devices == 0) {
 		error = -EACCES;
-		goto error_close_devices;
+		goto error_fs_info;
 	}
 
 	bdev = fs_devices->latest_dev->bdev;
@@ -1502,11 +1502,10 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 		 fs_info);
 	if (IS_ERR(s)) {
 		error = PTR_ERR(s);
-		goto error_close_devices;
+		goto error_fs_info;
 	}
 
 	if (s->s_root) {
-		btrfs_close_devices(fs_devices);
 		btrfs_free_fs_info(fs_info);
 		if ((flags ^ s->s_flags) & SB_RDONLY)
 			error = -EBUSY;
@@ -1527,8 +1526,6 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 
 	return dget(s->s_root);
 
-error_close_devices:
-	btrfs_close_devices(fs_devices);
 error_fs_info:
 	btrfs_free_fs_info(fs_info);
 error_sec_opts:
-- 
2.39.2

