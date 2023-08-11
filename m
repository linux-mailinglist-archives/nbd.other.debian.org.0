Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F18E778BFD
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 12:25:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8359A2063E; Fri, 11 Aug 2023 10:25:55 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 10:25:55 2023
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
	by bendel.debian.org (Postfix) with ESMTP id F104020613
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:09:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gpKoDkyETqzL for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:08:58 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E655520578
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=/3mbalPz9mWKW7oe8+rjeqpDnnAIwNVoPvEAXzlOmEA=; b=Kf0RESes2SiwxcuhMUwkC1tu/v
	j57mzaPUQPBQ7b7q/sMXcM1MGS5/6YmCDQb61sx4euJkFn2+q0Xoo3oMoMsHwS5hvZmscyu8MmZrR
	/xHy/ii6KMuk/xo0tgVYh4xLy5Q95qX65RiajMsGHI3FnoIx92eqnLXLR11rYFf54jSV/J4hnjUZC
	/PoNo3rx7uOSrIBL+rG8hOmVbE5w6SOVONf4lGLv45WAGDA0dSOvWZBVU0NsM09bD1Jo1myLaf47k
	1HGTBLAhzumDV20VF//EZRTKnEY3dLY9gBVYtm5b04D0B2bRjyIMZL6GdE41RQKWbD9/jMwMCKq0g
	WWJcEvwA==;
Received: from [88.128.92.63] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP4a-00A5fP-0Y;
	Fri, 11 Aug 2023 10:08:48 +0000
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
Subject: [PATCH 06/17] btrfs: use the super_block as holder when mounting file systems
Date: Fri, 11 Aug 2023 12:08:17 +0200
Message-Id: <20230811100828.1897174-7-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811100828.1897174-1-hch@lst.de>
References: <20230811100828.1897174-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <G3ByngRXUzN.A.bx.zyg1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2604
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811100828.1897174-7-hch@lst.de
Resent-Date: Fri, 11 Aug 2023 10:25:55 +0000 (UTC)

The file system type is not a very useful holder as it doesn't allow us
to go back to the actual file system instance.  Pass the super_block
instead which is useful when passed back to the file system driver.

This matches what is done for all other block device based file systems.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/super.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index 1079a0f541790d..0f7c402fb40349 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -69,8 +69,6 @@ static const struct super_operations btrfs_super_ops;
  * requested by subvol=/path. That way the callchain is straightforward and we
  * don't have to play tricks with the mount options and recursive calls to
  * btrfs_mount.
- *
- * The new btrfs_root_fs_type also servers as a tag for the bdev_holder.
  */
 static struct file_system_type btrfs_fs_type;
 static struct file_system_type btrfs_root_fs_type;
@@ -1503,8 +1501,7 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 		struct btrfs_fs_devices *fs_devices = fs_info->fs_devices;
 
 		mutex_lock(&uuid_mutex);
-		error = btrfs_open_devices(fs_devices, sb_open_mode(flags),
-					   fs_type);
+		error = btrfs_open_devices(fs_devices, sb_open_mode(flags), s);
 		mutex_unlock(&uuid_mutex);
 		if (error)
 			goto error_deactivate;
@@ -1518,7 +1515,7 @@ static struct dentry *btrfs_mount_root(struct file_system_type *fs_type,
 			 fs_devices->latest_dev->bdev);
 		shrinker_debugfs_rename(&s->s_shrink, "sb-%s:%s", fs_type->name,
 					s->s_id);
-		btrfs_sb(s)->bdev_holder = fs_type;
+		btrfs_sb(s)->bdev_holder = s;
 		error = btrfs_fill_super(s, fs_devices, data);
 	}
 	if (!error)
-- 
2.39.2

