Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 34785778C0F
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 12:27:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1A6BA20642; Fri, 11 Aug 2023 10:27:59 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 10:27:59 2023
Old-Return-Path: <BATV+10530082ca17b6f7899b+7292+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	CC_TOO_MANY,DIGITS_LETTERS,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FOURLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 277ED2048C
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:09:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.969 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, BAYES_00=-2, CC_TOO_MANY=3,
	DIGITS_LETTERS=1, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tmZE9D2wv9DL for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:09:28 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 99A2020613
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=FTSIEgUybviHzlYdK9QZpWvtnyUm2/Yw6t7t+195RbU=; b=DHgQwyDJFKuZfEj0aczO0zgWUA
	IxGXygEcWVaJT3P4880ccMLLdVQ9HYI3u6Stmh3O0R05FG4olVGK6AQXnq6lJqu0vMpQdG3SXG33k
	kwFmJcooSX0d23Dy7shGkCujG1i2A/QM2D3vp2PG5NCQO+jP8Vpa7vLkF3Q6XXzdPZIBTX8oz6fmp
	OTWTZvr1hY9zyoAeOQ9NgyEKN5pTi7NSq6+DWVl4Z8Imc7Z9TekL0XUR74wfnqiUHBO6m9MKge8Pb
	+6lUymIPqXX+P0/3w+PQbJOCEeJiERGTyw6HvepoFvhefKyjxB39D3KG6+fbSgBWgob/64MMV/Ynh
	59OmrZsw==;
Received: from [88.128.92.63] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP55-00A5tR-15;
	Fri, 11 Aug 2023 10:09:19 +0000
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
Subject: [PATCH 16/17] fs: remove get_super
Date: Fri, 11 Aug 2023 12:08:27 +0200
Message-Id: <20230811100828.1897174-17-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811100828.1897174-1-hch@lst.de>
References: <20230811100828.1897174-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DzWf7xqSQWC.A.pNB.v0g1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2613
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811100828.1897174-17-hch@lst.de
Resent-Date: Fri, 11 Aug 2023 10:27:59 +0000 (UTC)

get_super is unused now, remove it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/super.c         | 37 -------------------------------------
 include/linux/fs.h |  1 -
 2 files changed, 38 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index 714dbae58b5e8e..d3d27ff009d5f6 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -808,43 +808,6 @@ void iterate_supers_type(struct file_system_type *type,
 
 EXPORT_SYMBOL(iterate_supers_type);
 
-/**
- * get_super - get the superblock of a device
- * @bdev: device to get the superblock for
- *
- * Scans the superblock list and finds the superblock of the file system
- * mounted on the device given. %NULL is returned if no match is found.
- */
-struct super_block *get_super(struct block_device *bdev)
-{
-	struct super_block *sb;
-
-	if (!bdev)
-		return NULL;
-
-	spin_lock(&sb_lock);
-rescan:
-	list_for_each_entry(sb, &super_blocks, s_list) {
-		if (hlist_unhashed(&sb->s_instances))
-			continue;
-		if (sb->s_bdev == bdev) {
-			sb->s_count++;
-			spin_unlock(&sb_lock);
-			down_read(&sb->s_umount);
-			/* still alive? */
-			if (sb->s_root && (sb->s_flags & SB_BORN))
-				return sb;
-			up_read(&sb->s_umount);
-			/* nope, got unmounted */
-			spin_lock(&sb_lock);
-			__put_super(sb);
-			goto rescan;
-		}
-	}
-	spin_unlock(&sb_lock);
-	return NULL;
-}
-
 /**
  * get_active_super - get an active reference to the superblock of a device
  * @bdev: device to get the superblock for
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 6867512907d6e5..14b5777a24a0b2 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2913,7 +2913,6 @@ extern int vfs_readlink(struct dentry *, char __user *, int);
 extern struct file_system_type *get_filesystem(struct file_system_type *fs);
 extern void put_filesystem(struct file_system_type *fs);
 extern struct file_system_type *get_fs_type(const char *name);
-extern struct super_block *get_super(struct block_device *);
 extern struct super_block *get_active_super(struct block_device *bdev);
 extern void drop_super(struct super_block *sb);
 extern void drop_super_exclusive(struct super_block *sb);
-- 
2.39.2

