Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9CB778C11
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 12:28:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B3C5E20641; Fri, 11 Aug 2023 10:28:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 10:28:12 2023
Old-Return-Path: <BATV+10530082ca17b6f7899b+7292+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	CC_TOO_MANY,DIGITS_LETTERS,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8AB4B2048C
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:09:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.869 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, BAYES_00=-2, CC_TOO_MANY=3,
	DIGITS_LETTERS=1, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id D1_eABlZxI6a for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:09:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CE67B205CD
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=TfXf3rA/PGmh51lRw9XZCTKP64O/GfZ4zbLGJbB3SHI=; b=MNGF7jGfwxDH36Qic3Fz1xl09l
	GmgK5zJuj3hVSNHhedykMUuZSoP5/NOMHSjgzzZbc/q87WJKW4TQEU1te8Ja+pUBnNkvgDLQXP6Dm
	wVT7B6DnAN39z1QOUst8ysCKadJ4AIxRloZbpCKZosjSYZp/yOy9XcdJE6BCB8la+DkR4M+tVfWQt
	1VU98T2wUocyuCNOM/6EUJYZMRRvHejA9zEZxxY+k1FfSwfuO2YKjdaG/h8I1j21BJLakfqLBJTew
	lEnypaUD2w3NshOUPzTBxRXs/dKY0lHyTMTLAyTcJd2WQEMAE2nMywgmpJXDJ1H5CR0qQzltoLuzS
	YsoZ5aqQ==;
Received: from [88.128.92.63] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP58-00A5v0-0n;
	Fri, 11 Aug 2023 10:09:22 +0000
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
Subject: [PATCH 17/17] fs: simplify invalidate_inodes
Date: Fri, 11 Aug 2023 12:08:28 +0200
Message-Id: <20230811100828.1897174-18-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811100828.1897174-1-hch@lst.de>
References: <20230811100828.1897174-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <051UVwPTkoO.A.FQB.80g1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2614
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811100828.1897174-18-hch@lst.de
Resent-Date: Fri, 11 Aug 2023 10:28:12 +0000 (UTC)

kill_dirty has always been true for a long time, so hard code it and
remove the unused return value.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/inode.c    | 16 ++--------------
 fs/internal.h |  2 +-
 fs/super.c    |  2 +-
 3 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/fs/inode.c b/fs/inode.c
index 8fefb69e1f84a9..fd67ca46415d50 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -754,14 +754,10 @@ EXPORT_SYMBOL_GPL(evict_inodes);
  * @sb:		superblock to operate on
  * @kill_dirty: flag to guide handling of dirty inodes
  *
- * Attempts to free all inodes for a given superblock.  If there were any
- * busy inodes return a non-zero value, else zero.
- * If @kill_dirty is set, discard dirty inodes too, otherwise treat
- * them as busy.
+ * Attempts to free all inodes (including dirty inodes) for a given superblock.
  */
-int invalidate_inodes(struct super_block *sb, bool kill_dirty)
+void invalidate_inodes(struct super_block *sb)
 {
-	int busy = 0;
 	struct inode *inode, *next;
 	LIST_HEAD(dispose);
 
@@ -773,14 +769,8 @@ int invalidate_inodes(struct super_block *sb, bool kill_dirty)
 			spin_unlock(&inode->i_lock);
 			continue;
 		}
-		if (inode->i_state & I_DIRTY_ALL && !kill_dirty) {
-			spin_unlock(&inode->i_lock);
-			busy = 1;
-			continue;
-		}
 		if (atomic_read(&inode->i_count)) {
 			spin_unlock(&inode->i_lock);
-			busy = 1;
 			continue;
 		}
 
@@ -798,8 +788,6 @@ int invalidate_inodes(struct super_block *sb, bool kill_dirty)
 	spin_unlock(&sb->s_inode_list_lock);
 
 	dispose_list(&dispose);
-
-	return busy;
 }
 
 /*
diff --git a/fs/internal.h b/fs/internal.h
index f7a3dc11102647..b94290f61714a0 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -201,7 +201,7 @@ void lock_two_inodes(struct inode *inode1, struct inode *inode2,
  * fs-writeback.c
  */
 extern long get_nr_dirty_inodes(void);
-extern int invalidate_inodes(struct super_block *, bool);
+void invalidate_inodes(struct super_block *sb);
 
 /*
  * dcache.c
diff --git a/fs/super.c b/fs/super.c
index d3d27ff009d5f6..500c5308f2c8a0 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1204,7 +1204,7 @@ static void fs_bdev_mark_dead(struct block_device *bdev, bool surprise)
 	if (!surprise)
 		sync_filesystem(sb);
 	shrink_dcache_sb(sb);
-	invalidate_inodes(sb, true);
+	invalidate_inodes(sb);
 	if (sb->s_op->shutdown)
 		sb->s_op->shutdown(sb);
 
-- 
2.39.2

