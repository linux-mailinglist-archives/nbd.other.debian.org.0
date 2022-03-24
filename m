Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D14D4E5FF3
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 09:09:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2A01F202E2; Thu, 24 Mar 2022 08:09:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 08:09:21 2022
Old-Return-Path: <BATV+3868aa8635b3ec16ad0d+6787+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AC566202C8
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 07:51:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.141 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BjTM7yVJSXFD for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 07:51:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4F7AA202C2
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=68Vr9ZZvn7QlZeObLr2LIfxyN5gniOKZYA3d9ipjL3Q=; b=pVOkQxsAa/GqbX+WMYuWpXUN60
	Nql2UDvVBt1ON2mTFf5YrKzammMYyJ1LTA0pCu3rztFT5S/9zbcSYO3/H+pls1s95HRLxaowSQdKX
	aVvDP/gxlIzLYAqLbHw8jdjNmDj3nwEMRXD7CRIQjk+frmLPKsbkpFUPBcdPZQB1Bhvut0VwmmfiB
	wCRuRnMw1Zlp3qm4W7/qEt15tuqrESOfENDdLtKzkQrw77iwLE6O5mG6xU6WLyf+0BDyulq2DlKYl
	pMcR0dYk4LwCk0Il76E97ijVRTGVX6BWkl3VIjpMXCdp1y4Tod+CJ02wL1bUfXxmXZcv+fTcRVv4l
	ZwvpMMYw==;
Received: from [2001:4bb8:19a:b822:f71:16c0:5841:924e] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXIFk-00FzUG-LB; Thu, 24 Mar 2022 07:51:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH 03/13] zram: cleanup zram_remove
Date: Thu, 24 Mar 2022 08:51:09 +0100
Message-Id: <20220324075119.1556334-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220324075119.1556334-1-hch@lst.de>
References: <20220324075119.1556334-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aTVxUmtG1eO.A.fpG.xcCPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1752
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324075119.1556334-4-hch@lst.de
Resent-Date: Thu, 24 Mar 2022 08:09:21 +0000 (UTC)

Remove the bdev variable and just use the gendisk pointed to by the
zram_device directly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/zram/zram_drv.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index fd83fad59beb1..863606f1722b1 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1987,19 +1987,18 @@ static int zram_add(void)
 
 static int zram_remove(struct zram *zram)
 {
-	struct block_device *bdev = zram->disk->part0;
 	bool claimed;
 
-	mutex_lock(&bdev->bd_disk->open_mutex);
-	if (bdev->bd_openers) {
-		mutex_unlock(&bdev->bd_disk->open_mutex);
+	mutex_lock(&zram->disk->open_mutex);
+	if (zram->disk->part0->bd_openers) {
+		mutex_unlock(&zram->disk->open_mutex);
 		return -EBUSY;
 	}
 
 	claimed = zram->claim;
 	if (!claimed)
 		zram->claim = true;
-	mutex_unlock(&bdev->bd_disk->open_mutex);
+	mutex_unlock(&zram->disk->open_mutex);
 
 	zram_debugfs_unregister(zram);
 
@@ -2011,7 +2010,7 @@ static int zram_remove(struct zram *zram)
 		;
 	} else {
 		/* Make sure all the pending I/O are finished */
-		sync_blockdev(bdev);
+		sync_blockdev(zram->disk->part0);
 		zram_reset_device(zram);
 	}
 
-- 
2.30.2

