Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 007D1270A62
	for <lists+nbd@lfdr.de>; Sat, 19 Sep 2020 05:24:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DAAEE207D5; Sat, 19 Sep 2020 03:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Sep 19 03:24:09 2020
Old-Return-Path: <miaoqinglang@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DB691207AB
	for <lists-other-nbd@bendel.debian.org>; Sat, 19 Sep 2020 03:08:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.278 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id p65IClP-NsPn for <lists-other-nbd@bendel.debian.org>;
	Sat, 19 Sep 2020 03:08:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -2.2
X-Greylist: delayed 973 seconds by postgrey-1.36 at bendel; Sat, 19 Sep 2020 03:08:00 UTC
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0B70520791
	for <nbd@other.debian.org>; Sat, 19 Sep 2020 03:07:59 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 7A5A1C4FFCAAF84C8CDA;
	Sat, 19 Sep 2020 10:51:36 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Sat, 19 Sep 2020 10:51:28 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, Qinglang Miao <miaoqinglang@huawei.com>
Subject: [PATCH -next v2] nbd: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Sat, 19 Sep 2020 10:52:00 +0800
Message-ID: <20200919025200.17399-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5L1FLmh0WzF.A.rM.ZnXZfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/983
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200919025200.17399-1-miaoqinglang@huawei.com
Resent-Date: Sat, 19 Sep 2020 03:24:09 +0000 (UTC)

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
v2: based on linux-next(20200917), and can be applied to
    mainline cleanly now.

 drivers/block/nbd.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 15eed210f..ab1242a34 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1543,17 +1543,7 @@ static int nbd_dbg_tasks_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int nbd_dbg_tasks_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, nbd_dbg_tasks_show, inode->i_private);
-}
-
-static const struct file_operations nbd_dbg_tasks_ops = {
-	.open = nbd_dbg_tasks_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(nbd_dbg_tasks);
 
 static int nbd_dbg_flags_show(struct seq_file *s, void *unused)
 {
@@ -1578,17 +1568,7 @@ static int nbd_dbg_flags_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int nbd_dbg_flags_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, nbd_dbg_flags_show, inode->i_private);
-}
-
-static const struct file_operations nbd_dbg_flags_ops = {
-	.open = nbd_dbg_flags_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(nbd_dbg_flags);
 
 static int nbd_dev_dbg_init(struct nbd_device *nbd)
 {
@@ -1606,11 +1586,11 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
 	}
 	config->dbg_dir = dir;
 
-	debugfs_create_file("tasks", 0444, dir, nbd, &nbd_dbg_tasks_ops);
+	debugfs_create_file("tasks", 0444, dir, nbd, &nbd_dbg_tasks_fops);
 	debugfs_create_u64("size_bytes", 0444, dir, &config->bytesize);
 	debugfs_create_u32("timeout", 0444, dir, &nbd->tag_set.timeout);
 	debugfs_create_u64("blocksize", 0444, dir, &config->blksize);
-	debugfs_create_file("flags", 0444, dir, nbd, &nbd_dbg_flags_ops);
+	debugfs_create_file("flags", 0444, dir, nbd, &nbd_dbg_flags_fops);
 
 	return 0;
 }
-- 
2.23.0

