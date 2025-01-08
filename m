Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C18A0573D
	for <lists+nbd@lfdr.de>; Wed,  8 Jan 2025 10:44:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 15C25206F6; Wed,  8 Jan 2025 09:44:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  8 09:44:10 2025
Old-Return-Path: <BATV+9e166f3f48dee24ac321+7808+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5392320651
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jan 2025 09:26:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.151 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id h-B7zctPUChS for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jan 2025 09:26:08 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DDFB5206D4
	for <nbd@other.debian.org>; Wed,  8 Jan 2025 09:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=l/31ESR3+qEAHHMxPuf7j9P2G6uDf3ZUExmKKhtWzmA=; b=1tEf1x7/XO8v/25JUi9W59yd8c
	YHpYnpE1lAZONHiLmbW9QE/vRt60M/+Gl0Bl4QMTrQniCQkzE9pl3Xj1Bh6deDn5UcRJ0PvXPUxX0
	aIDqTvEcljLJ8lqQkAyQGVUiUZVqkc8VxAGxoNNCbdifMpKvMyJPB0U15a6e0GHALwUitznxemd9j
	Hn5j/NC6QuAUy34lEcNfcJJDC42UHkAV4oJ1EOhnKluzpRU5+PTyuei17Wutf8WbX3ZRhwnwj6T1Z
	pSkDdimlHJDGUswLYEkDg3CG+Ivnpkw3fVM2H8r/adAu6Igypq3z67ZHuZEiatYAFCnPJ7LWuBldP
	tAfxtNFQ==;
Received: from 2a02-8389-2341-5b80-e44b-b36a-6403-8f06.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:e44b:b36a:6403:8f06] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSKB-00000007lwB-274R;
	Wed, 08 Jan 2025 09:26:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	nbd@other.debian.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: [PATCH 10/10] loop: fix queue freeze vs limits lock order
Date: Wed,  8 Jan 2025 10:25:07 +0100
Message-ID: <20250108092520.1325324-11-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250108092520.1325324-1-hch@lst.de>
References: <20250108092520.1325324-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zwOZQKKjVIN.A.Wg9N.pjkfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3280
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250108092520.1325324-11-hch@lst.de
Resent-Date: Wed,  8 Jan 2025 09:44:10 +0000 (UTC)

Match the locking order used by the core block code by only freezing
the queue after taking the limits lock using the
queue_limits_commit_update_frozen helper and document the callers that
do not freeze the queue at all.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 560d6d5879d6..15e486baa223 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -311,6 +311,13 @@ static void loop_clear_limits(struct loop_device *lo, int mode)
 		lim.discard_granularity = 0;
 	}
 
+	/*
+	 * XXX: this updates the queue limits without freezing the queue, which
+	 * is against the locking protocol and dangerous.  But we can't just
+	 * freeze the queue as we're inside the ->queue_rq method here.  So this
+	 * should move out into a workqueue unless we get the file operations to
+	 * advertise if they support specific fallocate operations.
+	 */
 	queue_limits_commit_update(lo->lo_queue, &lim);
 }
 
@@ -1091,6 +1098,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 
 	lim = queue_limits_start_update(lo->lo_queue);
 	loop_update_limits(lo, &lim, config->block_size);
+	/* No need to freeze the queue as the device isn't bound yet. */
 	error = queue_limits_commit_update(lo->lo_queue, &lim);
 	if (error)
 		goto out_unlock;
@@ -1151,7 +1159,12 @@ static void __loop_clr_fd(struct loop_device *lo)
 	lo->lo_sizelimit = 0;
 	memset(lo->lo_file_name, 0, LO_NAME_SIZE);
 
-	/* reset the block size to the default */
+	/*
+	 * Reset the block size to the default.
+	 *
+	 * No queue freezing needed because this is called from the final
+	 * ->release call only, so there can't be any outstanding I/O.
+	 */
 	lim = queue_limits_start_update(lo->lo_queue);
 	lim.logical_block_size = SECTOR_SIZE;
 	lim.physical_block_size = SECTOR_SIZE;
@@ -1471,9 +1484,10 @@ static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
 	sync_blockdev(lo->lo_device);
 	invalidate_bdev(lo->lo_device);
 
-	blk_mq_freeze_queue(lo->lo_queue);
 	lim = queue_limits_start_update(lo->lo_queue);
 	loop_update_limits(lo, &lim, arg);
+
+	blk_mq_freeze_queue(lo->lo_queue);
 	err = queue_limits_commit_update(lo->lo_queue, &lim);
 	loop_update_dio(lo);
 	blk_mq_unfreeze_queue(lo->lo_queue);
-- 
2.45.2

