Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AB82B4E6E72
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 07:58:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9124520458; Fri, 25 Mar 2022 06:58:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 06:58:52 2022
Old-Return-Path: <BATV+8af3a5752749cd19e826+6788+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FVGT_m_MULTI_ODD,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7D273202E2
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 06:40:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.121 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Hny1FaA0BIcw for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 06:40:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 289BD2029C
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 06:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=WVzkkbrxtQ7e/ZumjaGTdVP8sQaRQ+9gjayHQfTr2lE=; b=otGWFn+bbfMs4Q/U2GJAEN+wlV
	rKbNJs5E+Z7y4+RN/fU8Gt9hha+6zpefEy3QzsNqs2n5s4ziXQntybetYHd3oj7CdMR7Xn/nsVxoI
	vE7dzEe/U/2euPaoKvgvOW0moU9Upk7uhPdb4sAxAFxuXuPSHyGdBw9LIaOVMw1zfPRznXDtPq3zC
	Fy2gH2SqkDn2BOZJqQy+M95TNxOqfi1ktl6j9nYakUR2wqyoa76jeUvXYzAtiwBXh9CZLuUBpQoas
	vqRsK0Ah/5sRKUtVE2MobeHL4C5S09PXmYXHsrK+qTt9uu/WgrWHau6vXRRh0v9HS8h4v/jwbpUZb
	qMAnJm2g==;
Received: from 089144194144.atnat0003.highway.a1.net ([89.144.194.144] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXdcI-001HPl-Ik; Fri, 25 Mar 2022 06:40:11 +0000
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
Subject: [PATCH 10/14] loop: only freeze the queue in __loop_clr_fd when needed
Date: Fri, 25 Mar 2022 07:39:25 +0100
Message-Id: <20220325063929.1773899-11-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325063929.1773899-1-hch@lst.de>
References: <20220325063929.1773899-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hzZ5YC4CjlH.A.g7H.sgWPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1792
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220325063929.1773899-11-hch@lst.de
Resent-Date: Fri, 25 Mar 2022 06:58:52 +0000 (UTC)

->release is only called after all outstanding I/O has completed, so only
freeze the queue when clearing the backing file of a live loop device.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Tested-by: Darrick J. Wong <djwong@kernel.org>
---
 drivers/block/loop.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index c57acbcf9be6a..a5dd259958ee2 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1144,8 +1144,13 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
 	if (test_bit(QUEUE_FLAG_WC, &lo->lo_queue->queue_flags))
 		blk_queue_write_cache(lo->lo_queue, false, false);
 
-	/* freeze request queue during the transition */
-	blk_mq_freeze_queue(lo->lo_queue);
+	/*
+	 * Freeze the request queue when unbinding on a live file descriptor and
+	 * thus an open device.  When called from ->release we are guaranteed
+	 * that there is no I/O in progress already.
+	 */
+	if (!release)
+		blk_mq_freeze_queue(lo->lo_queue);
 
 	destroy_workqueue(lo->workqueue);
 	loop_free_idle_workers(lo, true);
@@ -1170,7 +1175,8 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
 	mapping_set_gfp_mask(filp->f_mapping, gfp);
 	/* This is safe: open() is still holding a reference. */
 	module_put(THIS_MODULE);
-	blk_mq_unfreeze_queue(lo->lo_queue);
+	if (!release)
+		blk_mq_unfreeze_queue(lo->lo_queue);
 
 	disk_force_media_change(lo->lo_disk, DISK_EVENT_MEDIA_CHANGE);
 
-- 
2.30.2

