Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB03AEB343
	for <lists+nbd@lfdr.de>; Fri, 27 Jun 2025 11:48:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7D15B205C9; Fri, 27 Jun 2025 09:48:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 27 09:48:11 2025
Old-Return-Path: <yukuai1@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7F7AF20545
	for <lists-other-nbd@bendel.debian.org>; Fri, 27 Jun 2025 09:30:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.297 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zFviiP42FgWf for <lists-other-nbd@bendel.debian.org>;
	Fri, 27 Jun 2025 09:30:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3F9662053F
	for <nbd@other.debian.org>; Fri, 27 Jun 2025 09:30:46 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bT9Jz3fY7zYQvMm
	for <nbd@other.debian.org>; Fri, 27 Jun 2025 17:30:43 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 63DEC1A0FCE
	for <nbd@other.debian.org>; Fri, 27 Jun 2025 17:30:42 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP4 (Coremail) with SMTP id gCh0CgAXe1+_ZF5oHZM5Qw--.46522S4;
	Fri, 27 Jun 2025 17:30:41 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	ming.lei@redhat.com,
	hch@infradead.org,
	nilay@linux.ibm.com,
	hare@suse.de
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com,
	johnny.chenyi@huawei.com
Subject: [PATCH] nbd: fix false lockdep deadlock warning
Date: Fri, 27 Jun 2025 17:23:48 +0800
Message-Id: <20250627092348.1527323-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAXe1+_ZF5oHZM5Qw--.46522S4
X-Coremail-Antispam: 1UD129KBjvJXoWxCw4kZr1fZry8GFyrGFWkCrg_yoWrWFWfpF
	4UCFWDGrWUAa1xuF4UA3srWF1Yk3s7Ka4xGry7Ja4Ykr97Ar9avrykK3WSvr4UtrZ7JFs8
	JayYgF4Ska18JrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vb_EthkYdxB.A.7iXC.bjmXoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3394
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250627092348.1527323-1-yukuai1@huaweicloud.com
Resent-Date: Fri, 27 Jun 2025 09:48:11 +0000 (UTC)

From: Yu Kuai <yukuai3@huawei.com>

The deadlock is reported because there are circular dependency:

t1: disk->open_mutex -> nbd->config_lock

 blkdev_release
  bdev_release
   //lock disk->open_mutex)
   blkdev_put_whole
    nbd_release
     nbd_config_put
        refcount_dec_and_mutex_lock
        //lock nbd->config_lock

t2: nbd->config_lock -> set->update_nr_hwq_lock

 nbd_genl_connect
  //lock nbd->config_lock
  nbd_start_device
   blk_mq_update_nr_hw_queues
   //lock set->update_nr_hwq_lock

t3: set->update_nr_hwq_lock -> disk->open_mutex

 nbd_dev_remove_work
  nbd_dev_remove
   del_gendisk
    down_read(&set->update_nr_hwq_lock);
    __del_gendisk
    mutex_lock(&disk->open_mutex);

This is false warning because t1 and t2 should be synchronized by
nbd->refs, and t1 is still holding the reference while t2 is triggered
when the reference is decreased to 0. However the lock order is broken.

Fix the problem by breaking the dependency from t2, by calling
blk_mq_update_nr_hw_queues() outside of nbd internal config_lock, since
now other context can concurrent with nbd_start_device(), also make sure
they will still return -EBUSY, the difference is that they will not wait
for nbd_start_device() to be done.

Fixes: 98e68f67020c ("block: prevent adding/deleting disk during updating nr_hw_queues")
Reported-by: syzbot+2bcecf3c38cb3e8fdc8d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6855034f.a00a0220.137b3.0031.GAE@google.com/
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/nbd.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 7bdc7eb808ea..d43e8e73aeb3 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1457,10 +1457,13 @@ static void nbd_config_put(struct nbd_device *nbd)
 	}
 }
 
-static int nbd_start_device(struct nbd_device *nbd)
+static int nbd_start_device(struct nbd_device *nbd, bool netlink)
+	__releases(&nbd->config_lock)
+	__acquires(&nbd->config_lock)
 {
 	struct nbd_config *config = nbd->config;
 	int num_connections = config->num_connections;
+	struct task_struct *old;
 	int error = 0, i;
 
 	if (nbd->pid)
@@ -1473,8 +1476,21 @@ static int nbd_start_device(struct nbd_device *nbd)
 		return -EINVAL;
 	}
 
-	blk_mq_update_nr_hw_queues(&nbd->tag_set, config->num_connections);
+	/*
+	 * synchronize with concurrent nbd_start_device() and
+	 * nbd_add_socket()
+	 */
 	nbd->pid = task_pid_nr(current);
+	if (!netlink) {
+		old = nbd->task_setup;
+		nbd->task_setup = current;
+	}
+
+	mutex_unlock(&nbd->config_lock);
+	blk_mq_update_nr_hw_queues(&nbd->tag_set, config->num_connections);
+	mutex_lock(&nbd->config_lock);
+	if (!netlink)
+		nbd->task_setup = old;
 
 	nbd_parse_flags(nbd);
 
@@ -1524,7 +1540,7 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd)
 	struct nbd_config *config = nbd->config;
 	int ret;
 
-	ret = nbd_start_device(nbd);
+	ret = nbd_start_device(nbd, false);
 	if (ret)
 		return ret;
 
@@ -1995,7 +2011,7 @@ static struct nbd_device *nbd_find_get_unused(void)
 	lockdep_assert_held(&nbd_index_mutex);
 
 	idr_for_each_entry(&nbd_index_idr, nbd, id) {
-		if (refcount_read(&nbd->config_refs) ||
+		if (refcount_read(&nbd->config_refs) || nbd->pid ||
 		    test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags))
 			continue;
 		if (refcount_inc_not_zero(&nbd->refs))
@@ -2109,7 +2125,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	mutex_lock(&nbd->config_lock);
-	if (refcount_read(&nbd->config_refs)) {
+	if (refcount_read(&nbd->config_refs) || nbd->pid) {
 		mutex_unlock(&nbd->config_lock);
 		nbd_put(nbd);
 		if (index == -1)
@@ -2198,7 +2214,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 				goto out;
 		}
 	}
-	ret = nbd_start_device(nbd);
+	ret = nbd_start_device(nbd, true);
 	if (ret)
 		goto out;
 	if (info->attrs[NBD_ATTR_BACKEND_IDENTIFIER]) {
-- 
2.39.2

