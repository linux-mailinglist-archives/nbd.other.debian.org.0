Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 022554EBA63
	for <lists+nbd@lfdr.de>; Wed, 30 Mar 2022 07:47:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DC9D1214AF; Wed, 30 Mar 2022 05:47:57 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 30 05:47:57 2022
Old-Return-Path: <BATV+ea9b0106c62401bc49c3+6793+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4FE6020143
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Mar 2022 05:30:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.041 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id F_0CdcyBLHaa for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Mar 2022 05:30:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F1F1F21540
	for <nbd@other.debian.org>; Wed, 30 Mar 2022 05:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=vne9DaZ7l4j639/VhyPOqxTKU1RzC8myBXHWZt+qd58=; b=owsrgivACdd475OEmP2H78LCzg
	z8dn+DUBTdnpyfos32n/QXBRiod3mRtS8F2N5dhriXtEsgRKOHEHjbN9AeMhcklIxcKWRR5/FW8Ji
	r8ujThrK/LARp0CfVFKIX7Lo6VKD8xbAP5cLjmEqmF+hXOVNo7XwjFBT7dzICQirRFPPYJSaAwFJM
	Wn2GXfVZeeSMtaxmKHWnfMj9Hhxawa+u4q1igpJdvXtrhyWbj/LhvAwjx+g6ebaO3FQTWf6/CnlA6
	5Y6USsTL6vsual1l5d9Vmznjf1q4jEjMu47qyZJ0kLO9QgkWadksYS6I2WI0gfLIt6iMH/T3Sno0J
	pmzfZThg==;
Received: from 213-225-15-62.nat.highway.a1.net ([213.225.15.62] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZQuP-00ELWb-P5; Wed, 30 Mar 2022 05:30:18 +0000
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
	nbd@other.debian.org,
	syzbot+6479585dfd4dedd3f7e1@syzkaller.appspotmail.com
Subject: [PATCH 15/15] loop: don't destroy lo->workqueue in __loop_clr_fd
Date: Wed, 30 Mar 2022 07:29:17 +0200
Message-Id: <20220330052917.2566582-16-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220330052917.2566582-1-hch@lst.de>
References: <20220330052917.2566582-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Gym7GQO6o6O.A.wJB.N8-QiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1838
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220330052917.2566582-16-hch@lst.de
Resent-Date: Wed, 30 Mar 2022 05:47:57 +0000 (UTC)

There is no need to destroy the workqueue when clearing unbinding
a loop device from a backing file.  Not doing so on the other hand
avoid creating a complex lock dependency chain involving the global
system_transition_mutex.

Based on a patch from Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>.

Reported-by: syzbot+6479585dfd4dedd3f7e1@syzkaller.appspotmail.com
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Tested-by: syzbot+6479585dfd4dedd3f7e1@syzkaller.appspotmail.com
---
 drivers/block/loop.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index ca7103807d34a..8ff62c15f269b 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -817,7 +817,6 @@ struct loop_worker {
 };
 
 static void loop_workfn(struct work_struct *work);
-static void loop_rootcg_workfn(struct work_struct *work);
 
 #ifdef CONFIG_BLK_CGROUP
 static inline int queue_on_root_worker(struct cgroup_subsys_state *css)
@@ -1055,20 +1054,19 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	    !file->f_op->write_iter)
 		lo->lo_flags |= LO_FLAGS_READ_ONLY;
 
-	lo->workqueue = alloc_workqueue("loop%d",
-					WQ_UNBOUND | WQ_FREEZABLE,
-					0,
-					lo->lo_number);
 	if (!lo->workqueue) {
-		error = -ENOMEM;
-		goto out_unlock;
+		lo->workqueue = alloc_workqueue("loop%d",
+						WQ_UNBOUND | WQ_FREEZABLE,
+						0, lo->lo_number);
+		if (!lo->workqueue) {
+			error = -ENOMEM;
+			goto out_unlock;
+		}
 	}
 
 	disk_force_media_change(lo->lo_disk, DISK_EVENT_MEDIA_CHANGE);
 	set_disk_ro(lo->lo_disk, (lo->lo_flags & LO_FLAGS_READ_ONLY) != 0);
 
-	INIT_WORK(&lo->rootcg_work, loop_rootcg_workfn);
-	INIT_LIST_HEAD(&lo->rootcg_cmd_list);
 	lo->use_dio = lo->lo_flags & LO_FLAGS_DIRECT_IO;
 	lo->lo_device = bdev;
 	lo->lo_backing_file = file;
@@ -1148,10 +1146,6 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
 	if (!release)
 		blk_mq_freeze_queue(lo->lo_queue);
 
-	destroy_workqueue(lo->workqueue);
-	loop_free_idle_workers(lo, true);
-	del_timer_sync(&lo->timer);
-
 	spin_lock_irq(&lo->lo_lock);
 	filp = lo->lo_backing_file;
 	lo->lo_backing_file = NULL;
@@ -1754,6 +1748,10 @@ static void lo_free_disk(struct gendisk *disk)
 {
 	struct loop_device *lo = disk->private_data;
 
+	if (lo->workqueue)
+		destroy_workqueue(lo->workqueue);
+	loop_free_idle_workers(lo, true);
+	del_timer_sync(&lo->timer);
 	mutex_destroy(&lo->lo_mutex);
 	kfree(lo);
 }
@@ -2017,6 +2015,8 @@ static int loop_add(int i)
 	lo->lo_number		= i;
 	spin_lock_init(&lo->lo_lock);
 	spin_lock_init(&lo->lo_work_lock);
+	INIT_WORK(&lo->rootcg_work, loop_rootcg_workfn);
+	INIT_LIST_HEAD(&lo->rootcg_cmd_list);
 	disk->major		= LOOP_MAJOR;
 	disk->first_minor	= i << part_shift;
 	disk->minors		= 1 << part_shift;
-- 
2.30.2

