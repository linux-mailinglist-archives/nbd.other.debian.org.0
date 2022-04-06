Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 456E64F5614
	for <lists+nbd@lfdr.de>; Wed,  6 Apr 2022 08:22:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2DBC120546; Wed,  6 Apr 2022 06:22:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr  6 06:22:06 2022
Old-Return-Path: <BATV+4210fbe0094d03a681f9+6800+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9B7602051F
	for <lists-other-nbd@bendel.debian.org>; Wed,  6 Apr 2022 06:05:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.141 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JHFUzNP_sVf0 for <lists-other-nbd@bendel.debian.org>;
	Wed,  6 Apr 2022 06:05:47 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6B2ED20522
	for <nbd@other.debian.org>; Wed,  6 Apr 2022 06:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=cTLTfYr7duFMbl13zCRXcRUBgEmH7Snqn+WlWdpEWNo=; b=ZV/CVrUb4qbpXBUImFAvqmY7OC
	YR/KmNB2+lAjq+EqA8oBYfyehyx3Nq+YwtV4TxCIA5A8L2WVXtNlev4guWoUuadGmFOwtgMiNwq9i
	yqX5G6E2+zNceTQVJtjM3l08MHhteYnLHXffM4/jtc5yfz/GeuE8HPUJ4reOje5U615tM7p768ryF
	Y/h9+5h+K+8NlHUqGExK7MtGefB5aNgyMmSmLlNaZTgeiyQAt5+xaIpSgQ/+zSSJmDjA+IoRmYh1L
	IwncIh14NoCZ6DbOmIaikx8OL30Ru/YZRUBoYvofpcHUxFXkbbQXdd7v+XeVl55WVE6NwYrNNaEln
	SKW/g4CA==;
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbynT-003usA-Kd; Wed, 06 Apr 2022 06:05:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com,
	linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org,
	ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com,
	linux-mm@kvack.org
Subject: [PATCH 05/27] drbd: use bdev based limit helpers in drbd_send_sizes
Date: Wed,  6 Apr 2022 08:04:54 +0200
Message-Id: <20220406060516.409838-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DCf32meCqAL.A.kkF.OGTTiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1858
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220406060516.409838-6-hch@lst.de
Resent-Date: Wed,  6 Apr 2022 06:22:06 +0000 (UTC)

Use the bdev based limits helpers where they exist.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_main.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 74b1b2424efff..d20d84ee7a88e 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -924,7 +924,9 @@ int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enu
 
 	memset(p, 0, packet_size);
 	if (get_ldev_if_state(device, D_NEGOTIATING)) {
-		struct request_queue *q = bdev_get_queue(device->ldev->backing_bdev);
+		struct block_device *bdev = device->ldev->backing_bdev;
+		struct request_queue *q = bdev_get_queue(bdev);
+
 		d_size = drbd_get_max_capacity(device->ldev);
 		rcu_read_lock();
 		u_size = rcu_dereference(device->ldev->disk_conf)->disk_size;
@@ -933,16 +935,15 @@ int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enu
 		max_bio_size = queue_max_hw_sectors(q) << 9;
 		max_bio_size = min(max_bio_size, DRBD_MAX_BIO_SIZE);
 		p->qlim->physical_block_size =
-			cpu_to_be32(queue_physical_block_size(q));
+			cpu_to_be32(bdev_physical_block_size(bdev));
 		p->qlim->logical_block_size =
-			cpu_to_be32(queue_logical_block_size(q));
+			cpu_to_be32(bdev_logical_block_size(bdev));
 		p->qlim->alignment_offset =
 			cpu_to_be32(queue_alignment_offset(q));
-		p->qlim->io_min = cpu_to_be32(queue_io_min(q));
-		p->qlim->io_opt = cpu_to_be32(queue_io_opt(q));
+		p->qlim->io_min = cpu_to_be32(bdev_io_min(bdev));
+		p->qlim->io_opt = cpu_to_be32(bdev_io_opt(bdev));
 		p->qlim->discard_enabled = blk_queue_discard(q);
-		p->qlim->write_same_capable =
-			!!q->limits.max_write_same_sectors;
+		p->qlim->write_same_capable = 0;
 		put_ldev(device);
 	} else {
 		struct request_queue *q = device->rq_queue;
-- 
2.30.2

