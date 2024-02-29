Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E9D86CC35
	for <lists+nbd@lfdr.de>; Thu, 29 Feb 2024 15:57:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 54439209E5; Thu, 29 Feb 2024 14:57:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 29 14:57:53 2024
Old-Return-Path: <BATV+ba4d12e182ac9dd248a8+7494+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DF84520678
	for <lists-other-nbd@bendel.debian.org>; Thu, 29 Feb 2024 14:39:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.161 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xfESxrlurQCr for <lists-other-nbd@bendel.debian.org>;
	Thu, 29 Feb 2024 14:39:19 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A077D20688
	for <nbd@other.debian.org>; Thu, 29 Feb 2024 14:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=eB65jZCI4DOhsIeR75tX3uMn80Bbo9GI/LSxj/PB/hc=; b=Hz0RKqmHaQcPC1bWJZrMZ0IH9L
	jGz9W3302SATyFWmY9zDUymlrGRx2pjU+veA0ikAa4OeFRb3pw91WrEzaTr/XdXXApYOifmRcIxqH
	iadVD2ZiKk2xOvzLSj+JTTG/O/osBkPKWRCNRj5MK4ehWoYeFfbqj1AcvkPM3K5jhq5nQJ222kr5r
	BbQPpLuLD4/9wNBS4O4J41+wRkkLBrIV3YAoT12dwRnORB54LUJH/V7yP2cuN9XX8B0YG07MqFuA7
	kiC+UajH28x91CDk7+/Qrl2kczCBpQETGyapGOmFx8CKEXSV46tZSuEK7+sYTqeiU3cRWJOeC0d/z
	7Q985ZUQ==;
Received: from [216.9.110.7] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhZ0-0000000DtlP-1JXi;
	Thu, 29 Feb 2024 14:39:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH 3/3] nbd: use the atomic queue limits API in nbd_set_size
Date: Thu, 29 Feb 2024 06:38:46 -0800
Message-Id: <20240229143846.1047223-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240229143846.1047223-1-hch@lst.de>
References: <20240229143846.1047223-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tdJz8Fp1hVO.A.wlE.xtJ4lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2777
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240229143846.1047223-4-hch@lst.de
Resent-Date: Thu, 29 Feb 2024 14:57:53 +0000 (UTC)

Use queue_limits_start_update / queue_limits_commit_update to update
all the limits in one go and with proper sanity checking.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 22ee0ed9aa6db0..9d4ec9273bf954 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -319,6 +319,9 @@ static void nbd_mark_nsock_dead(struct nbd_device *nbd, struct nbd_sock *nsock,
 static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		loff_t blksize)
 {
+	struct queue_limits lim;
+	int error;
+
 	if (!blksize)
 		blksize = 1u << NBD_DEF_BLKSIZE_BITS;
 
@@ -334,12 +337,16 @@ static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 	if (!nbd->pid)
 		return 0;
 
+	lim = queue_limits_start_update(nbd->disk->queue);
 	if (nbd->config->flags & NBD_FLAG_SEND_TRIM)
-		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
+		lim.max_hw_discard_sectors = UINT_MAX;
 	else
-		blk_queue_max_discard_sectors(nbd->disk->queue, 0);
-	blk_queue_logical_block_size(nbd->disk->queue, blksize);
-	blk_queue_physical_block_size(nbd->disk->queue, blksize);
+		lim.max_hw_discard_sectors = 0;
+	lim.logical_block_size = blksize;
+	lim.physical_block_size = blksize;
+	error = queue_limits_commit_update(nbd->disk->queue, &lim);
+	if (error)
+		return error;
 
 	if (max_part)
 		set_bit(GD_NEED_PART_SCAN, &nbd->disk->state);
-- 
2.39.2

