Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0774E6005
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 09:11:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 92625202A9; Thu, 24 Mar 2022 08:11:37 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 08:11:37 2022
Old-Return-Path: <BATV+3868aa8635b3ec16ad0d+6787+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 140CF202C8
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 07:52:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.041 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id No78yOWk0NZb for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 07:52:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A7239202C2
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=oyyCwh90cGXNXwAPCoxdzjzz3NJgcKmcraEfIe/JKo0=; b=VYwSdCSI1iDAV3N53cUMm5tUFj
	4v0XP2IxDpo6H0wFUnKYnuLIIRNDEp4qReHmKIKG7wQKDDwjpEiv0KaLACcQ82ytXHRcuFUrYd85C
	+pOooOTRd8EIUtAjIVUB5RrtWoDc2IPDUnajidML5yHVRB5Lidr8ia98gOm1JRt2GjuslOCRPOFuv
	sOAr4tf3knvxOrGvL0BPNSZs3gYej0cU8wtzjFbkfeBGYVds6Ckghc6YCD84ayEDwLWdusFelPLco
	EYZmL7W0UUXJhXc5fUYskYFv0AzWMqWCxsmIMqOAZwyq9rORBkbAeOuZ6xcBLgz0tuGooTAZRI0Ed
	krEIOeZA==;
Received: from [2001:4bb8:19a:b822:f71:16c0:5841:924e] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXIGA-00FzdJ-AF; Thu, 24 Mar 2022 07:51:54 +0000
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
	nbd@other.debian.org,
	syzbot+6479585dfd4dedd3f7e1@syzkaller.appspotmail.com
Subject: [PATCH 13/13] loop: don't destroy lo->workqueue in __loop_clr_fd
Date: Thu, 24 Mar 2022 08:51:19 +0100
Message-Id: <20220324075119.1556334-14-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220324075119.1556334-1-hch@lst.de>
References: <20220324075119.1556334-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RNEM6qmFG-P.A.9TH.5eCPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1764
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220324075119.1556334-14-hch@lst.de
Resent-Date: Thu, 24 Mar 2022 08:11:37 +0000 (UTC)

There is no need to destroy the workqueue when clearing unbinding
a loop device from a backing file.  Not doing so on the other hand
avoid creating a complex lock dependency chain involving the global
system_transition_mutex.

Based on a patch from Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>.

Reported-by: syzbot+6479585dfd4dedd3f7e1@syzkaller.appspotmail.com
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index e1eb925d3f855..84613eb2fdd57 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -808,7 +808,6 @@ struct loop_worker {
 };
 
 static void loop_workfn(struct work_struct *work);
-static void loop_rootcg_workfn(struct work_struct *work);
 
 #ifdef CONFIG_BLK_CGROUP
 static inline int queue_on_root_worker(struct cgroup_subsys_state *css)
@@ -1043,20 +1042,19 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
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
@@ -1152,10 +1150,6 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
 	if (!release)
 		blk_mq_freeze_queue(lo->lo_queue);
 
-	destroy_workqueue(lo->workqueue);
-	loop_free_idle_workers(lo, true);
-	del_timer_sync(&lo->timer);
-
 	spin_lock_irq(&lo->lo_lock);
 	filp = lo->lo_backing_file;
 	lo->lo_backing_file = NULL;
@@ -1749,6 +1743,10 @@ static void lo_free_disk(struct gendisk *disk)
 {
 	struct loop_device *lo = disk->private_data;
 
+	if (lo->workqueue)
+		destroy_workqueue(lo->workqueue);
+	loop_free_idle_workers(lo, true);
+	del_timer_sync(&lo->timer);
 	mutex_destroy(&lo->lo_mutex);
 	kfree(lo);
 }
@@ -2012,6 +2010,8 @@ static int loop_add(int i)
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

