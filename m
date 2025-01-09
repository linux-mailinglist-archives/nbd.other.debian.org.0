Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAE4A06E11
	for <lists+nbd@lfdr.de>; Thu,  9 Jan 2025 07:15:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 64AAD205BC; Thu,  9 Jan 2025 06:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan  9 06:15:10 2025
Old-Return-Path: <BATV+2e5c2b0d924108c2b4cb+7809+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E2907205BC
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Jan 2025 05:58:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.151 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jwjw8J9f8Y7s for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Jan 2025 05:58:26 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D29B5205AF
	for <nbd@other.debian.org>; Thu,  9 Jan 2025 05:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KxgWbJ7auoeAcx9YDYY5C3D0yCCFueGV+Dc+AQNWEfo=; b=u7aGKCDscnLquDhY1zN+kFVTU/
	6kuaDmH8x13cDM1DsPEDN7bZh3Ljds2r+scYLUpyOljV82E3F4FP9svElfACBv5yhFK1SahxEs3uX
	VJdlCFXcsYk99SQcr6x2YJL7RCtnkSzZJ7llxN9kTnS4TwOLP5uiCHMMVl1Dn1YAWR/nnfVK89uhn
	NtXN5OYiIDGxEVPwaY9Y3FoibOxIHmbxqN0XrzaBvTLAoEHIyT5zXXvlJe7ve+DHG379d3Zodgmxt
	Cp3jJT8CqDmzWNYddObJjcBy8sE1v2Nb70+yTiSsoP3QLGN2VuqC/mPEw1pKjJdUCy5efauYTJtw2
	33vtZ4CA==;
Received: from 2a02-8389-2341-5b80-ddeb-cdec-70b9-e2f0.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:ddeb:cdec:70b9:e2f0] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tVlYg-0000000ArCL-0Co3;
	Thu, 09 Jan 2025 05:58:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	nbd@other.debian.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [PATCH 01/11] block: fix docs for freezing of queue limits updates
Date: Thu,  9 Jan 2025 06:57:22 +0100
Message-ID: <20250109055810.1402918-2-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250109055810.1402918-1-hch@lst.de>
References: <20250109055810.1402918-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <KVQts1NEyIN.A.b5gN.ul2fnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3304
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250109055810.1402918-2-hch@lst.de
Resent-Date: Thu,  9 Jan 2025 06:15:10 +0000 (UTC)

queue_limits_commit_update is the function that needs to operate on a
frozen queue, not queue_limits_start_update.  Update the kerneldoc
comments to reflect that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 block/blk-settings.c   | 3 ++-
 include/linux/blkdev.h | 3 +--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 8f09e33f41f6..89d8366fd43c 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -413,7 +413,8 @@ int blk_set_default_limits(struct queue_limits *lim)
  * @lim:	limits to apply
  *
  * Apply the limits in @lim that were obtained from queue_limits_start_update()
- * and updated by the caller to @q.
+ * and updated by the caller to @q.  The caller must have frozen the queue or
+ * ensure that there are no outstanding I/Os by other means.
  *
  * Returns 0 if successful, else a negative error code.
  */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 5d40af2ef971..e781d4e6f92d 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -944,8 +944,7 @@ static inline unsigned int blk_boundary_sectors_left(sector_t offset,
  * the caller can modify.  The caller must call queue_limits_commit_update()
  * to finish the update.
  *
- * Context: process context.  The caller must have frozen the queue or ensured
- * that there is outstanding I/O by other means.
+ * Context: process context.
  */
 static inline struct queue_limits
 queue_limits_start_update(struct request_queue *q)
-- 
2.45.2

