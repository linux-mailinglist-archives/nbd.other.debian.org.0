Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AC67E43465B
	for <lists+nbd@lfdr.de>; Wed, 20 Oct 2021 10:00:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 770D92028D; Wed, 20 Oct 2021 08:00:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 20 08:00:15 2021
Old-Return-Path: <yebin10@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 904E7202DF
	for <lists-other-nbd@bendel.debian.org>; Wed, 20 Oct 2021 07:44:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mIqyoKi-9IPU for <lists-other-nbd@bendel.debian.org>;
	Wed, 20 Oct 2021 07:44:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 1033 seconds by postgrey-1.36 at bendel; Wed, 20 Oct 2021 07:44:49 UTC
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E127D2037C
	for <nbd@other.debian.org>; Wed, 20 Oct 2021 07:44:49 +0000 (UTC)
Received: from dggeme754-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HZ2BG3Zykz90KB;
	Wed, 20 Oct 2021 15:22:30 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggeme754-chm.china.huawei.com
 (10.3.19.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Wed, 20
 Oct 2021 15:27:26 +0800
From: Ye Bin <yebin10@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>
CC: <linux-kernel@vger.kernel.org>, Ye Bin <yebin10@huawei.com>
Subject: [PATCH -next] nbd: Fix use-after-free in pid_show
Date: Wed, 20 Oct 2021 15:39:59 +0800
Message-ID: <20211020073959.2679255-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme754-chm.china.huawei.com (10.3.19.100)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Shv5eYs8Iv.A.YCD.Py8bhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1543
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211020073959.2679255-1-yebin10@huawei.com
Resent-Date: Wed, 20 Oct 2021 08:00:15 +0000 (UTC)

I got issue as follows:
[  263.886511] BUG: KASAN: use-after-free in pid_show+0x11f/0x13f
[  263.888359] Read of size 4 at addr ffff8880bf0648c0 by task cat/746
[  263.890479] CPU: 0 PID: 746 Comm: cat Not tainted 4.19.90-dirty #140
[  263.893162] Call Trace:
[  263.893509]  dump_stack+0x108/0x15f
[  263.893999]  print_address_description+0xa5/0x372
[  263.894641]  kasan_report.cold+0x236/0x2a8
[  263.895696]  __asan_report_load4_noabort+0x25/0x30
[  263.896365]  pid_show+0x11f/0x13f
[  263.897422]  dev_attr_show+0x48/0x90
[  263.898361]  sysfs_kf_seq_show+0x24d/0x4b0
[  263.899479]  kernfs_seq_show+0x14e/0x1b0
[  263.900029]  seq_read+0x43f/0x1150
[  263.900499]  kernfs_fop_read+0xc7/0x5a0
[  263.903764]  vfs_read+0x113/0x350
[  263.904231]  ksys_read+0x103/0x270
[  263.905230]  __x64_sys_read+0x77/0xc0
[  263.906284]  do_syscall_64+0x106/0x360
[  263.906797]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Reproduce this issue as follows:
1. nbd-server 8000 /tmp/disk
2. nbd-client localhost 8000 /dev/nbd1
3. cat /sys/block/nbd1/pid
Then trigger use-after-free in pid_show.

Reason is after do step '2', nbd-client progress is already exit. So
it's task_struct already freed.
To solve this issue, revert part of 6521d39a64b3's modify and remove
useless 'recv_task' member of nbd_device.

Fixes: 6521d39a64b3 ("nbd: Remove variable 'pid'")
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/block/nbd.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 0d064fab6186..0ee104fbb628 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -122,10 +122,10 @@ struct nbd_device {
 	struct work_struct remove_work;
 
 	struct list_head list;
-	struct task_struct *task_recv;
 	struct task_struct *task_setup;
 
 	unsigned long flags;
+	pid_t pid; /* pid of nbd-client, if attached */
 
 	char *backend;
 };
@@ -223,7 +223,7 @@ static ssize_t pid_show(struct device *dev,
 	struct gendisk *disk = dev_to_disk(dev);
 	struct nbd_device *nbd = (struct nbd_device *)disk->private_data;
 
-	return sprintf(buf, "%d\n", task_pid_nr(nbd->task_recv));
+	return sprintf(buf, "%d\n", nbd->pid);
 }
 
 static const struct device_attribute pid_attr = {
@@ -335,7 +335,7 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 	nbd->config->bytesize = bytesize;
 	nbd->config->blksize_bits = __ffs(blksize);
 
-	if (!nbd->task_recv)
+	if (!nbd->pid)
 		return 0;
 
 	if (nbd->config->flags & NBD_FLAG_SEND_TRIM) {
@@ -1300,7 +1300,7 @@ static void nbd_config_put(struct nbd_device *nbd)
 		if (test_and_clear_bit(NBD_RT_HAS_PID_FILE,
 				       &config->runtime_flags))
 			device_remove_file(disk_to_dev(nbd->disk), &pid_attr);
-		nbd->task_recv = NULL;
+		nbd->pid = 0;
 		if (test_and_clear_bit(NBD_RT_HAS_BACKEND_FILE,
 				       &config->runtime_flags)) {
 			device_remove_file(disk_to_dev(nbd->disk), &backend_attr);
@@ -1341,7 +1341,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 	int num_connections = config->num_connections;
 	int error = 0, i;
 
-	if (nbd->task_recv)
+	if (nbd->pid)
 		return -EBUSY;
 	if (!config->socks)
 		return -EINVAL;
@@ -1360,7 +1360,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 	}
 
 	blk_mq_update_nr_hw_queues(&nbd->tag_set, config->num_connections);
-	nbd->task_recv = current;
+	nbd->pid = task_pid_nr(current);
 
 	nbd_parse_flags(nbd);
 
@@ -1616,8 +1616,8 @@ static int nbd_dbg_tasks_show(struct seq_file *s, void *unused)
 {
 	struct nbd_device *nbd = s->private;
 
-	if (nbd->task_recv)
-		seq_printf(s, "recv: %d\n", task_pid_nr(nbd->task_recv));
+	if (nbd->pid)
+		seq_printf(s, "recv: %d\n", nbd->pid);
 
 	return 0;
 }
@@ -2198,7 +2198,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	mutex_lock(&nbd->config_lock);
 	config = nbd->config;
 	if (!test_bit(NBD_RT_BOUND, &config->runtime_flags) ||
-	    !nbd->task_recv) {
+	    !nbd->pid) {
 		dev_err(nbd_to_dev(nbd),
 			"not configured, cannot reconfigure\n");
 		ret = -EINVAL;
-- 
2.31.1

