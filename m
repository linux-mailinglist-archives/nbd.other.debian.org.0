Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C118D2C52
	for <lists+nbd@lfdr.de>; Wed, 29 May 2024 07:21:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D4AE92049C; Wed, 29 May 2024 05:21:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 05:21:20 2024
Old-Return-Path: <BATV+c55c297d46ee5715703b+7584+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 684FE204A2
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2024 05:05:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Cw1mgc6mAhsI for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2024 05:05:33 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D5E4820495
	for <nbd@other.debian.org>; Wed, 29 May 2024 05:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=TFSwqKWMmudUxPiHaYQymKxOAPLlhLvIfGoe7lZ0Qm8=; b=rkKRbg5+hgq4FGzAhQuNxXCeww
	mYQ8LVxno936/Ke445SPr6vK77vH49ODPijMtTeGT6y17DO9VfLcNXcbJC5f4YwikvZ/giTD5aSWr
	2/AHxlrhMzrmMO9T4Siy0wWkSgBb4UwcUKe9nErCSp2M0KBoTzzxuF7KCfENr2yMCRDFL5eOvmh5m
	DeI3cPeP2Ved5/finWngzKaglnh7GYz6CIk2ozhCEb5yygEKOZrT2sr+DGXVaF5ohZ5wPEa/h0W27
	kIoeJXcGLgBclxYAHBILjIeu4JHHgDvp6JkiOgDF6dY2FxeqMeWGRaO5M9Fa1XPikTiqcIhm1oz/O
	/sPDQu3w==;
Received: from 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCBV5-00000002pXT-2RwQ;
	Wed, 29 May 2024 05:05:24 +0000
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
	linux-scsi@vger.kernel.org
Subject: [PATCH 05/12] sd: add a sd_disable_write_same helper
Date: Wed, 29 May 2024 07:04:07 +0200
Message-ID: <20240529050507.1392041-6-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vU65qT8Ec_G.A.epdN.QtrVmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2815
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240529050507.1392041-6-hch@lst.de
Resent-Date: Wed, 29 May 2024 05:21:20 +0000 (UTC)

Add helper to disable WRITE SAME when it is not supported and use it
instead of sd_config_write_same in the I/O completion handler.  This
avoids touching more fields than required in the I/O completion handler
and  prepares for converting sd to use the atomic queue limits API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/sd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index a8838381823254..09ffe9d826aeac 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1004,6 +1004,13 @@ static blk_status_t sd_setup_write_zeroes_cmnd(struct scsi_cmnd *cmd)
 	return sd_setup_write_same10_cmnd(cmd, false);
 }
 
+static void sd_disable_write_same(struct scsi_disk *sdkp)
+{
+	sdkp->device->no_write_same = 1;
+	sdkp->max_ws_blocks = 0;
+	blk_queue_max_write_zeroes_sectors(sdkp->disk->queue, 0);
+}
+
 static void sd_config_write_same(struct scsi_disk *sdkp)
 {
 	struct request_queue *q = sdkp->disk->queue;
@@ -2258,8 +2265,7 @@ static int sd_done(struct scsi_cmnd *SCpnt)
 				if (SCpnt->cmnd[1] & 8) { /* UNMAP */
 					sd_disable_discard(sdkp);
 				} else {
-					sdkp->device->no_write_same = 1;
-					sd_config_write_same(sdkp);
+					sd_disable_write_same(sdkp);
 					req->rq_flags |= RQF_QUIET;
 				}
 				break;
-- 
2.43.0

