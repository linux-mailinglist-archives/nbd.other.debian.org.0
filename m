Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1714E86CC32
	for <lists+nbd@lfdr.de>; Thu, 29 Feb 2024 15:57:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C5BFE20706; Thu, 29 Feb 2024 14:57:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 29 14:57:11 2024
Old-Return-Path: <BATV+ba4d12e182ac9dd248a8+7494+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 951822069B
	for <lists-other-nbd@bendel.debian.org>; Thu, 29 Feb 2024 14:39:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.061 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zVWdimwOdNLJ for <lists-other-nbd@bendel.debian.org>;
	Thu, 29 Feb 2024 14:39:18 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 21E042066C
	for <nbd@other.debian.org>; Thu, 29 Feb 2024 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3d3wiWZ4gh1IydUuJ2k1At36hB0TiDUfLbBdK9F+NZ0=; b=xr5lFHR7tOU5dhc+DH1jc7FFGW
	iS0cp+D2T6m7l980piwU3CBetRvNnlpAc01/GGPRf7/eni+OLG4Rp2ydjY7kVa8nPaFHC5gamdR6Z
	YpJ8kYboKda0jJgPnnXrtJEfLcz/l7SYKAHQ2AdoTzih/OcwAv5mKTrMn2epFW1F1ne3iO83zE4Me
	3LO/jk1m4l5GoP/TYRkdGFohbiSl6Co+gbdm2jwX6BPfy1IyT6RnsuqrBXg/DDC2nN2VaoRNn6JJn
	gI37V0F1JolwUzIaH685+ZPMutCaq824EsWJsIkbcWkBOYOoTSoTOtzeEzw0vHABM0W2TTgRMCytK
	0yGBrGBA==;
Received: from [216.9.110.7] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhYy-0000000Dtkt-2EQU;
	Thu, 29 Feb 2024 14:39:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH 1/3] nbd: don't clear discard_sectors in nbd_config_put
Date: Thu, 29 Feb 2024 06:38:44 -0800
Message-Id: <20240229143846.1047223-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240229143846.1047223-1-hch@lst.de>
References: <20240229143846.1047223-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <k_T0ydYJ6II.A.kYE.HtJ4lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2774
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240229143846.1047223-2-hch@lst.de
Resent-Date: Thu, 29 Feb 2024 14:57:11 +0000 (UTC)

nbd_config_put currently clears discard_sectors when unusing a device.
This is pretty odd behavior and different from the sector size
configuration which is simply left in places and then reconfigured when
nbd_set_size is as part of configuring the device.  Change nbd_set_size
to clear discard_sectors if discard is not supported so that all the
queue limits changes are handled in one place.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 9ee9587375fac3..384750d5259fb8 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -336,6 +336,8 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 
 	if (nbd->config->flags & NBD_FLAG_SEND_TRIM)
 		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
+	else
+		blk_queue_max_discard_sectors(nbd->disk->queue, 0);
 	blk_queue_logical_block_size(nbd->disk->queue, blksize);
 	blk_queue_physical_block_size(nbd->disk->queue, blksize);
 
@@ -1351,7 +1353,6 @@ static void nbd_config_put(struct nbd_device *nbd)
 		nbd->config = NULL;
 
 		nbd->tag_set.timeout = 0;
-		blk_queue_max_discard_sectors(nbd->disk->queue, 0);
 
 		mutex_unlock(&nbd->config_lock);
 		nbd_put(nbd);
-- 
2.39.2

