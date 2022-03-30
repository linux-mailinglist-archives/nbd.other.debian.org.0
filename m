Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F140D4EBA4A
	for <lists+nbd@lfdr.de>; Wed, 30 Mar 2022 07:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AB4DF21543; Wed, 30 Mar 2022 05:45:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 30 05:45:10 2022
Old-Return-Path: <BATV+ea9b0106c62401bc49c3+6793+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 97D1D21542
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Mar 2022 05:29:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.141 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8x13UR01jLIN for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Mar 2022 05:29:41 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id BF5462153F
	for <nbd@other.debian.org>; Wed, 30 Mar 2022 05:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=vVUxEXGeE/RLZMR3d5tslbUH4dPXsuMDdYT090T28t8=; b=zuETnPQOIQSi55vjCuqzmX04uP
	ZYEbQbSe0IVARWl8XdETEN0T2mh6p6Vou3r8fJDwzqCK/LAW2ZKJMLEQgQeKh2m8NZV3SsJsmgtRP
	fUDQfk1iqimpV6XcSHR8jjt2yyQZfwkkgUA3MgvPB6483avlLACS3lO8G9V533taXrEHOkzN3KmZ2
	n5390wM175sScorseyfEbg+8yc2ra4JSUYBIrxWElqsD3fXX1Fwp+Vie9AX8LDaOZqZ4wuHDxD7oK
	NH9w7/loxhSuuB31RO6lxyuXglfX9BJvHyGLsp2yNDH3sePG8UDOLdnG3lMkGn7mH7ruHXbWAwN/Y
	jxvcUz1Q==;
Received: from 213-225-15-62.nat.highway.a1.net ([213.225.15.62] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZQtY-00EL9z-BE; Wed, 30 Mar 2022 05:29:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	Matteo Croce <mcroce@microsoft.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH 01/15] nbd: use the correct block_device in nbd_bdev_reset
Date: Wed, 30 Mar 2022 07:29:03 +0200
Message-Id: <20220330052917.2566582-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220330052917.2566582-1-hch@lst.de>
References: <20220330052917.2566582-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <thqMAEbSCaM.A.Cj.m5-QiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1823
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220330052917.2566582-2-hch@lst.de
Resent-Date: Wed, 30 Mar 2022 05:45:10 +0000 (UTC)

The bdev parameter to ->ioctl contains the block device that the ioctl
is called on, which can be the partition.  But the openers check in
nbd_bdev_reset really needs to check use the whole device, so switch to
using that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 drivers/block/nbd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5a1f98494dddf..2f29da41fbc80 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1217,11 +1217,11 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 	return -ENOSPC;
 }
 
-static void nbd_bdev_reset(struct block_device *bdev)
+static void nbd_bdev_reset(struct nbd_device *nbd)
 {
-	if (bdev->bd_openers > 1)
+	if (nbd->disk->part0->bd_openers > 1)
 		return;
-	set_capacity(bdev->bd_disk, 0);
+	set_capacity(nbd->disk, 0);
 }
 
 static void nbd_parse_flags(struct nbd_device *nbd)
@@ -1389,7 +1389,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 	return nbd_set_size(nbd, config->bytesize, nbd_blksize(config));
 }
 
-static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *bdev)
+static int nbd_start_device_ioctl(struct nbd_device *nbd)
 {
 	struct nbd_config *config = nbd->config;
 	int ret;
@@ -1408,7 +1408,7 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *b
 	flush_workqueue(nbd->recv_workq);
 
 	mutex_lock(&nbd->config_lock);
-	nbd_bdev_reset(bdev);
+	nbd_bdev_reset(nbd);
 	/* user requested, ignore socket errors */
 	if (test_bit(NBD_RT_DISCONNECT_REQUESTED, &config->runtime_flags))
 		ret = 0;
@@ -1422,7 +1422,7 @@ static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
 {
 	sock_shutdown(nbd);
 	__invalidate_device(bdev, true);
-	nbd_bdev_reset(bdev);
+	nbd_bdev_reset(nbd);
 	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
 			       &nbd->config->runtime_flags))
 		nbd_config_put(nbd);
@@ -1468,7 +1468,7 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 		config->flags = arg;
 		return 0;
 	case NBD_DO_IT:
-		return nbd_start_device_ioctl(nbd, bdev);
+		return nbd_start_device_ioctl(nbd);
 	case NBD_CLEAR_QUE:
 		/*
 		 * This is for compatibility only.  The queue is always cleared
-- 
2.30.2

