Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 021B94EBA54
	for <lists+nbd@lfdr.de>; Wed, 30 Mar 2022 07:46:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DDF1521544; Wed, 30 Mar 2022 05:46:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 30 05:46:16 2022
Old-Return-Path: <BATV+ea9b0106c62401bc49c3+6793+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 23AC720143
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Mar 2022 05:30:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.021 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qBceMXacgrlD for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Mar 2022 05:29:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id ACC8C2153F
	for <nbd@other.debian.org>; Wed, 30 Mar 2022 05:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+0HbPJjWfGH6HaeEAUn+tiYZ9JAkOg+BbFjO6OQm2hc=; b=0aw4p/PwtgSwpv8RhYhMLRXLrg
	CYxlnDdVo4Vp8jkSA1BqXBiSdyaitlEXuPaKMMvqor0daQfAy1ivBWR0m9nNFtjregVIGwABblVQ0
	p3zrRz0H3dXT4Pz+w3e5BB3CAFI5Tx2oJXMyR1Uzw9oa250gxN32wfwSRmg5hwOTJ01XZcO2v+DA1
	G9duIfZIbF8K2TTtd6reVQd1Bufn+LTKu/kSoViEpSx4JMCktHc5tunfVJIzMFk7OM7euYV3KdjF8
	AP7A+z3d81EcxzckEM2sMhAJ5Kq8ZsCffVMlatP3g37RSsSQsYus9JxK6B1ZmWWICsBcaWidqlIuO
	NS7gLuwA==;
Received: from 213-225-15-62.nat.highway.a1.net ([213.225.15.62] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZQtr-00ELIk-Tb; Wed, 30 Mar 2022 05:29:44 +0000
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
Subject: [PATCH 06/15] loop: de-duplicate the idle worker freeing code
Date: Wed, 30 Mar 2022 07:29:08 +0200
Message-Id: <20220330052917.2566582-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220330052917.2566582-1-hch@lst.de>
References: <20220330052917.2566582-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_vSCUVgxXIO.A.Rz.o6-QiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1829
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220330052917.2566582-7-hch@lst.de
Resent-Date: Wed, 30 Mar 2022 05:46:16 +0000 (UTC)

Use a common helper for both timer based and uncoditional freeing of idle
workers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Tested-by: Darrick J. Wong <djwong@kernel.org>
---
 drivers/block/loop.c | 73 +++++++++++++++++++++-----------------------
 1 file changed, 35 insertions(+), 38 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 3e636a75c83a8..762f0a18295d7 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -809,7 +809,6 @@ struct loop_worker {
 
 static void loop_workfn(struct work_struct *work);
 static void loop_rootcg_workfn(struct work_struct *work);
-static void loop_free_idle_workers(struct timer_list *timer);
 
 #ifdef CONFIG_BLK_CGROUP
 static inline int queue_on_root_worker(struct cgroup_subsys_state *css)
@@ -893,6 +892,39 @@ static void loop_queue_work(struct loop_device *lo, struct loop_cmd *cmd)
 	spin_unlock_irq(&lo->lo_work_lock);
 }
 
+static void loop_set_timer(struct loop_device *lo)
+{
+	timer_reduce(&lo->timer, jiffies + LOOP_IDLE_WORKER_TIMEOUT);
+}
+
+static void loop_free_idle_workers(struct loop_device *lo, bool delete_all)
+{
+	struct loop_worker *pos, *worker;
+
+	spin_lock_irq(&lo->lo_work_lock);
+	list_for_each_entry_safe(worker, pos, &lo->idle_worker_list,
+				idle_list) {
+		if (!delete_all &&
+		    time_is_after_jiffies(worker->last_ran_at +
+					  LOOP_IDLE_WORKER_TIMEOUT))
+			break;
+		list_del(&worker->idle_list);
+		rb_erase(&worker->rb_node, &lo->worker_tree);
+		css_put(worker->blkcg_css);
+		kfree(worker);
+	}
+	if (!list_empty(&lo->idle_worker_list))
+		loop_set_timer(lo);
+	spin_unlock_irq(&lo->lo_work_lock);
+}
+
+static void loop_free_idle_workers_timer(struct timer_list *timer)
+{
+	struct loop_device *lo = container_of(timer, struct loop_device, timer);
+
+	return loop_free_idle_workers(lo, false);
+}
+
 static void loop_update_rotational(struct loop_device *lo)
 {
 	struct file *file = lo->lo_backing_file;
@@ -1027,7 +1059,7 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 	INIT_LIST_HEAD(&lo->rootcg_cmd_list);
 	INIT_LIST_HEAD(&lo->idle_worker_list);
 	lo->worker_tree = RB_ROOT;
-	timer_setup(&lo->timer, loop_free_idle_workers,
+	timer_setup(&lo->timer, loop_free_idle_workers_timer,
 		TIMER_DEFERRABLE);
 	lo->use_dio = lo->lo_flags & LO_FLAGS_DIRECT_IO;
 	lo->lo_device = bdev;
@@ -1091,7 +1123,6 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
 {
 	struct file *filp;
 	gfp_t gfp = lo->old_gfp_mask;
-	struct loop_worker *pos, *worker;
 
 	/*
 	 * Flush loop_configure() and loop_change_fd(). It is acceptable for
@@ -1121,15 +1152,7 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
 	blk_mq_freeze_queue(lo->lo_queue);
 
 	destroy_workqueue(lo->workqueue);
-	spin_lock_irq(&lo->lo_work_lock);
-	list_for_each_entry_safe(worker, pos, &lo->idle_worker_list,
-				idle_list) {
-		list_del(&worker->idle_list);
-		rb_erase(&worker->rb_node, &lo->worker_tree);
-		css_put(worker->blkcg_css);
-		kfree(worker);
-	}
-	spin_unlock_irq(&lo->lo_work_lock);
+	loop_free_idle_workers(lo, true);
 	del_timer_sync(&lo->timer);
 
 	spin_lock_irq(&lo->lo_lock);
@@ -1887,11 +1910,6 @@ static void loop_handle_cmd(struct loop_cmd *cmd)
 	}
 }
 
-static void loop_set_timer(struct loop_device *lo)
-{
-	timer_reduce(&lo->timer, jiffies + LOOP_IDLE_WORKER_TIMEOUT);
-}
-
 static void loop_process_work(struct loop_worker *worker,
 			struct list_head *cmd_list, struct loop_device *lo)
 {
@@ -1940,27 +1958,6 @@ static void loop_rootcg_workfn(struct work_struct *work)
 	loop_process_work(NULL, &lo->rootcg_cmd_list, lo);
 }
 
-static void loop_free_idle_workers(struct timer_list *timer)
-{
-	struct loop_device *lo = container_of(timer, struct loop_device, timer);
-	struct loop_worker *pos, *worker;
-
-	spin_lock_irq(&lo->lo_work_lock);
-	list_for_each_entry_safe(worker, pos, &lo->idle_worker_list,
-				idle_list) {
-		if (time_is_after_jiffies(worker->last_ran_at +
-						LOOP_IDLE_WORKER_TIMEOUT))
-			break;
-		list_del(&worker->idle_list);
-		rb_erase(&worker->rb_node, &lo->worker_tree);
-		css_put(worker->blkcg_css);
-		kfree(worker);
-	}
-	if (!list_empty(&lo->idle_worker_list))
-		loop_set_timer(lo);
-	spin_unlock_irq(&lo->lo_work_lock);
-}
-
 static const struct blk_mq_ops loop_mq_ops = {
 	.queue_rq       = loop_queue_rq,
 	.complete	= lo_complete_rq,
-- 
2.30.2

