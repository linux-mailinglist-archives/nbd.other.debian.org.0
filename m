Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE32AC2CC
	for <lists+nbd@lfdr.de>; Mon,  9 Nov 2020 18:48:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7AFF02018F; Mon,  9 Nov 2020 17:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov  9 17:48:09 2020
Old-Return-Path: <BATV+96f5c5aaaf363e754cf8+6287+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D6FDB2016D
	for <lists-other-nbd@bendel.debian.org>; Mon,  9 Nov 2020 17:31:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.83 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5qQRtZsHlLlO for <lists-other-nbd@bendel.debian.org>;
	Mon,  9 Nov 2020 17:31:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1014220169
	for <nbd@other.debian.org>; Mon,  9 Nov 2020 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QXTsp1tlKAI6ByHHFT44pQ9qFbymesTDA4cZ1owCOag=; b=Pu4M0Lfg7btzDIdiEBLzZHHgG5
	0bEcun9hWz6zQS0rddvf3V42lTnfO6XKX6SRMmscdkzPrdBLe3TJP4eTxC+7XoIq/x8WbJ4ewrFJy
	WG/+2+55/vKoa6xTttYBNA+VkBFq5A/R2lQ9ac7KlaD94c/noLBykOnXF02SOoDj8P+BJVeIdg5Ft
	pWvKnV1oQ2aJ/Bn0CGw3/f+skAv8FODPd3BVTs254IKR0qv9q6J6EvKgXzHjw42VZMPnu5H4YGW1w
	lAmLajOIq7fhjpxAL9KJknc4piaLgu2M5COXtXUxyi1ZHxeeth1sj1EmzO6JVL3rudCxQE9FJLxUN
	gTR2OmlQ==;
Received: from [2001:4bb8:180:6600:e0a4:2604:c520:8624] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcB0N-00056p-Og; Mon, 09 Nov 2020 17:31:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: josef@toxicpanda.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH] nbd: fix a block_device refcount leak in nbd_release
Date: Mon,  9 Nov 2020 18:30:59 +0100
Message-Id: <20201109173059.2500429-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AhHNMPYUVeF.A.rYH.ZDYqfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1048
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201109173059.2500429-1-hch@lst.de
Resent-Date: Mon,  9 Nov 2020 17:48:09 +0000 (UTC)

bdget_disk needs to be paired with bdput to not leak a reference
on the block device inode.

Fixes: 08ba91ee6e2c ("nbd: Add the nbd NBD_DISCONNECT_ON_CLOSE config flag.")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index a6f51934391edb..45b0423ef2c53d 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1493,6 +1493,7 @@ static void nbd_release(struct gendisk *disk, fmode_t mode)
 	if (test_bit(NBD_RT_DISCONNECT_ON_CLOSE, &nbd->config->runtime_flags) &&
 			bdev->bd_openers == 0)
 		nbd_disconnect_and_put(nbd);
+	bdput(bdev);
 
 	nbd_config_put(nbd);
 	nbd_put(nbd);
-- 
2.28.0

