Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CC30FA08774
	for <lists+nbd@lfdr.de>; Fri, 10 Jan 2025 07:04:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B22DE205DD; Fri, 10 Jan 2025 06:04:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 10 06:04:30 2025
Old-Return-Path: <BATV+d77ff3599ace4b46004a+7810+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5B49D20630
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Jan 2025 05:47:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.051 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HXxAFZbV5vpK for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Jan 2025 05:47:48 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F04F1205EA
	for <nbd@other.debian.org>; Fri, 10 Jan 2025 05:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=XOwKKQcvaeqm5/EcreVGcBeygYwpt1R0Y193htmengg=; b=L6Wh1urlSCBdVsH+PI0WAGTBTX
	FqQRAofm/qMlGp3DqSY6jNi1rI3/UPhiR4R3TWLXT/QvFFUfkq8dyHsjVyit9gDaB2zpKqtV1PG0T
	F10D4AR8OZz9Mb0ciThMMlXVphQlPLmfOOXyrxjb0fV2wiUAW7nxTcfG0eHqZo+3besSj0dVNTXF4
	leUJwo9FlevxkIC5pv7NydIJ5YA2s4ADIuRc7s7bFoKgq2Hw+glwkOiy0bxpASf4fWAI7Cvmta4BD
	iFuCSkoRH8Fr1AYgDCkQxya2IOpJrA38c23PXpCOf4V+vmZC9ljpR8do38FCC+fC57reIu6BZR0Zb
	cS4BCA2w==;
Received: from 2a02-8389-2341-5b80-76c3-a3dc-14f6-94e8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:76c3:a3dc:14f6:94e8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7rz-0000000E4xM-49cZ;
	Fri, 10 Jan 2025 05:47:44 +0000
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
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [PATCH 06/11] block: fix queue freeze vs limits lock order in sysfs store methods
Date: Fri, 10 Jan 2025 06:47:14 +0100
Message-ID: <20250110054726.1499538-7-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110054726.1499538-1-hch@lst.de>
References: <20250110054726.1499538-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Zn8agyuKFtI.A.-uTB.uhLgnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3333
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250110054726.1499538-7-hch@lst.de
Resent-Date: Fri, 10 Jan 2025 06:04:30 +0000 (UTC)

queue_attr_store() always freezes a device queue before calling the
attribute store operation. For attributes that control queue limits, the
store operation will also lock the queue limits with a call to
queue_limits_start_update(). However, some drivers (e.g. SCSI sd) may
need to issue commands to a device to obtain limit values from the
hardware with the queue limits locked. This creates a potential ABBA
deadlock situation if a user attempts to modify a limit (thus freezing
the device queue) while the device driver starts a revalidation of the
device queue limits.

Avoid such deadlock by not freezing the queue before calling the
->store_limit() method in struct queue_sysfs_entry and instead use the
queue_limits_commit_update_frozen helper to freeze the queue after taking
the limits lock.

This also removes taking the sysfs lock for the store_limit method as
it doesn't protect anything here, but creates even more nesting.
Hopefully it will go away from the actual sysfs methods entirely soon.

(commit log adapted from a similar patch from  Damien Le Moal)

Fixes: ff956a3be95b ("block: use queue_limits_commit_update in queue_discard_max_store")
Fixes: 0327ca9d53bf ("block: use queue_limits_commit_update in queue_max_sectors_store")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 block/blk-sysfs.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index d2aa2177e4ba..e828be777206 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -694,22 +694,24 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
 	if (entry->load_module)
 		entry->load_module(disk, page, length);
 
-	mutex_lock(&q->sysfs_lock);
-	blk_mq_freeze_queue(q);
 	if (entry->store_limit) {
 		struct queue_limits lim = queue_limits_start_update(q);
 
 		res = entry->store_limit(disk, page, length, &lim);
 		if (res < 0) {
 			queue_limits_cancel_update(q);
-		} else {
-			res = queue_limits_commit_update(q, &lim);
-			if (!res)
-				res = length;
+			return res;
 		}
-	} else {
-		res = entry->store(disk, page, length);
+
+		res = queue_limits_commit_update_frozen(q, &lim);
+		if (res)
+			return res;
+		return length;
 	}
+
+	mutex_lock(&q->sysfs_lock);
+	blk_mq_freeze_queue(q);
+	res = entry->store(disk, page, length);
 	blk_mq_unfreeze_queue(q);
 	mutex_unlock(&q->sysfs_lock);
 	return res;
-- 
2.45.2

