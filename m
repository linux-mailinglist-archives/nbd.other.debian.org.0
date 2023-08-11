Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B29778C06
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 12:26:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6648020642; Fri, 11 Aug 2023 10:26:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 10:26:49 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 37CCD205CD
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:09:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id v7Y4nicmCBZt for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:09:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 061E32048C
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Y0aq5oBkHJsvXg0ECqI6wIhwCUIqs6QSxIJwZB5Tg0o=; b=FjkKB5xIPgNLh//E/xqOQFA45R
	VSP+UeoBUaF9btYuhIjqqy0u83JMqFCgg2weFALy38TtLThLceZzvbP2t1wBtMyf+55MYxNQ8Eveb
	AwIwn3qFWLzfz1VCe4o3ExmAAqa/gCJXcK2iawdvzkOzL6+sj9fCAgBnQD2KMMOakDHVl8WlKE5n4
	KhykANnyuCdYsCm/vVwFGpBxVvS0hBxd6gSfLKBj2S7UCxjoiJoJHJDO3t7lYe7SEhgS8mpQ/HW2k
	UUQ7EeGntgFYboYtc1SGDh4rcpg9343vfuLbK4jJQtSTD0mWNyfKSD59b14AYGOcMBMmiV5pe6Ps/
	34ePRnBw==;
Received: from [88.128.92.63] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP4t-00A5p2-20;
	Fri, 11 Aug 2023 10:09:08 +0000
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
Subject: [PATCH 12/17] block: drop the "busy inodes on changed media" log message
Date: Fri, 11 Aug 2023 12:08:23 +0200
Message-Id: <20230811100828.1897174-13-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811100828.1897174-1-hch@lst.de>
References: <20230811100828.1897174-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HVzJfZkJ__J.A.u9.pzg1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2608
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811100828.1897174-13-hch@lst.de
Resent-Date: Fri, 11 Aug 2023 10:26:49 +0000 (UTC)

This message isn't exactly helpful, and file systems already print way more
useful messages when shut down while active.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/disk-events.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/block/disk-events.c b/block/disk-events.c
index 6189b819b2352e..6b858d3504772c 100644
--- a/block/disk-events.c
+++ b/block/disk-events.c
@@ -281,9 +281,7 @@ bool disk_check_media_change(struct gendisk *disk)
 	if (!(events & DISK_EVENT_MEDIA_CHANGE))
 		return false;
 
-	if (__invalidate_device(disk->part0, true))
-		pr_warn("VFS: busy inodes on changed media %s\n",
-			disk->disk_name);
+	__invalidate_device(disk->part0, true);
 	set_bit(GD_NEED_PART_SCAN, &disk->state);
 	return true;
 }
@@ -302,9 +300,7 @@ void disk_force_media_change(struct gendisk *disk)
 {
 	disk_event_uevent(disk, DISK_EVENT_MEDIA_CHANGE);
 	inc_diskseq(disk);
-	if (__invalidate_device(disk->part0, true))
-		pr_warn("VFS: busy inodes on changed media %s\n",
-			disk->disk_name);
+	__invalidate_device(disk->part0, true);
 	set_bit(GD_NEED_PART_SCAN, &disk->state);
 }
 EXPORT_SYMBOL_GPL(disk_force_media_change);
-- 
2.39.2

