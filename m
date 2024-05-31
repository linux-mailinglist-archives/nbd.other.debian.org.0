Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F738D5C4A
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 10:07:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A64CE20590; Fri, 31 May 2024 08:07:55 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 08:07:55 2024
Old-Return-Path: <BATV+4872a67a45e6d46d0c49+7586+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 613DE2055B
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 07:49:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.6 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
	RCVD_IN_DNSWL_MED=-2.3, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id u19oUe9ySdER for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 07:49:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C250C2054E
	for <nbd@other.debian.org>; Fri, 31 May 2024 07:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=rb1OF73CoqNaiVO8CqTHVc8xH4T7Xk6a2c9CxacCVxo=; b=ixc7sU02vm0CYaeNZLVqmJqr1F
	w3t3CHukX6Y/WrwEBPmir631IGBTKvdXkr3Gx7sPqVqokxqFFVlywpqEW1Ike10ParnnBt1UYNr5g
	oxfWZdjBwiqVCxtSkH5LykBrDs6zXobZzMgztC7hMbwDnMSYlJqmNgh8Q9kC05ZfeL1SBTCNAFVWE
	+8sLD6+qG9QyI/eL8OKGy0oMy9FUSqpJQy2NiOWqYRZmyBUvVUNO6Lvocvevg3GFFr1HQvo+FKyWO
	zjfg3D4GZ3IuWhl7HByairPmkUxGxODsK90DtnOBsC9OwFCM9RkfiY/ajKZ3KzidolhxQDvM0BqsD
	2Z40FzGQ==;
Received: from 2a02-8389-2341-5b80-5ba9-f4da-76fa-44a9.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:5ba9:f4da:76fa:44a9] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCx0c-00000009Xgz-3ZvO;
	Fri, 31 May 2024 07:49:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH 09/14] sd: factor out a sd_discard_mode helper
Date: Fri, 31 May 2024 09:48:04 +0200
Message-ID: <20240531074837.1648501-10-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <a1iHW9nMbnD.A.WkWJ.bVYWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2866
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240531074837.1648501-10-hch@lst.de
Resent-Date: Fri, 31 May 2024 08:07:55 +0000 (UTC)

Split the logic to pick the right discard mode into a little helper
to prepare for further changes.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/scsi/sd.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 0dbc6eb7a7cac3..39eddfac09ef8f 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3201,6 +3201,25 @@ static void sd_read_app_tag_own(struct scsi_disk *sdkp, unsigned char *buffer)
 	return;
 }
 
+static unsigned int sd_discard_mode(struct scsi_disk *sdkp)
+{
+	if (!sdkp->lbpvpd) {
+		/* LBP VPD page not provided */
+		if (sdkp->max_unmap_blocks)
+			return SD_LBP_UNMAP;
+		return SD_LBP_WS16;
+	}
+
+	/* LBP VPD page tells us what to use */
+	if (sdkp->lbpu && sdkp->max_unmap_blocks)
+		return SD_LBP_UNMAP;
+	if (sdkp->lbpws)
+		return SD_LBP_WS16;
+	if (sdkp->lbpws10)
+		return SD_LBP_WS10;
+	return SD_LBP_DISABLE;
+}
+
 /**
  * sd_read_block_limits - Query disk device for preferred I/O sizes.
  * @sdkp: disk to query
@@ -3239,23 +3258,7 @@ static void sd_read_block_limits(struct scsi_disk *sdkp)
 			sdkp->unmap_alignment =
 				get_unaligned_be32(&vpd->data[32]) & ~(1 << 31);
 
-		if (!sdkp->lbpvpd) { /* LBP VPD page not provided */
-
-			if (sdkp->max_unmap_blocks)
-				sd_config_discard(sdkp, SD_LBP_UNMAP);
-			else
-				sd_config_discard(sdkp, SD_LBP_WS16);
-
-		} else {	/* LBP VPD page tells us what to use */
-			if (sdkp->lbpu && sdkp->max_unmap_blocks)
-				sd_config_discard(sdkp, SD_LBP_UNMAP);
-			else if (sdkp->lbpws)
-				sd_config_discard(sdkp, SD_LBP_WS16);
-			else if (sdkp->lbpws10)
-				sd_config_discard(sdkp, SD_LBP_WS10);
-			else
-				sd_config_discard(sdkp, SD_LBP_DISABLE);
-		}
+		sd_config_discard(sdkp, sd_discard_mode(sdkp));
 	}
 
  out:
-- 
2.43.0

