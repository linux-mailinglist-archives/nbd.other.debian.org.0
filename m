Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2ED4413C5
	for <lists+nbd@lfdr.de>; Mon,  1 Nov 2021 07:33:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AB55F20307; Mon,  1 Nov 2021 06:33:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov  1 06:33:13 2021
Old-Return-Path: <yebin10@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,PHONENUMBER,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CE62D202E3
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Nov 2021 06:17:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.661 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 18mIcLIX3TqJ for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Nov 2021 06:17:25 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7424720150
	for <nbd@other.debian.org>; Mon,  1 Nov 2021 06:17:24 +0000 (UTC)
Received: from dggeme754-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HjN9M36dkz90g3;
	Mon,  1 Nov 2021 14:17:11 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggeme754-chm.china.huawei.com
 (10.3.19.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Mon, 1
 Nov 2021 14:17:09 +0800
From: Ye Bin <yebin10@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>
CC: <linux-kernel@vger.kernel.org>, Ye Bin <yebin10@huawei.com>
Subject: [PATCH -next v3 2/2] nbd: Fix hungtask when nbd_config_put
Date: Mon, 1 Nov 2021 14:29:56 +0800
Message-ID: <20211101062956.791573-3-yebin10@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101062956.791573-1-yebin10@huawei.com>
References: <20211101062956.791573-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeme754-chm.china.huawei.com (10.3.19.100)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SLeN8VTjxbL.A.5VG.po4fhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1593
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211101062956.791573-3-yebin10@huawei.com
Resent-Date: Mon,  1 Nov 2021 06:33:13 +0000 (UTC)

I got follow issue:
[  247.381177] INFO: task kworker/u10:0:47 blocked for more than 120 seconds.
[  247.382644]       Not tainted 4.19.90-dirty #140
[  247.383502] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  247.385027] Call Trace:
[  247.388384]  schedule+0xb8/0x3c0
[  247.388966]  schedule_timeout+0x2b4/0x380
[  247.392815]  wait_for_completion+0x367/0x510
[  247.397713]  flush_workqueue+0x32b/0x1340
[  247.402700]  drain_workqueue+0xda/0x3c0
[  247.403442]  destroy_workqueue+0x7b/0x690
[  247.405014]  nbd_config_put.cold+0x2f9/0x5b6
[  247.405823]  recv_work+0x1fd/0x2b0
[  247.406485]  process_one_work+0x70b/0x1610
[  247.407262]  worker_thread+0x5a9/0x1060
[  247.408699]  kthread+0x35e/0x430
[  247.410918]  ret_from_fork+0x1f/0x30

We can reproduce issue as follows:
1. Inject memory fault in nbd_start_device
-1244,10 +1248,18 @@ static int nbd_start_device(struct nbd_device *nbd)
        nbd_dev_dbg_init(nbd);
        for (i = 0; i < num_connections; i++) {
                struct recv_thread_args *args;
-
-               args = kzalloc(sizeof(*args), GFP_KERNEL);
+
+               if (i == 1) {
+                       args = NULL;
+                       printk("%s: inject malloc error\n", __func__);
+               }
+               else
+                       args = kzalloc(sizeof(*args), GFP_KERNEL);
2. Inject delay in recv_work
-757,6 +760,8 @@ static void recv_work(struct work_struct *work)

                blk_mq_complete_request(blk_mq_rq_from_pdu(cmd));
        }
+       printk("%s: comm=%s pid=%d\n", __func__, current->comm, current->pid);
+       mdelay(5 * 1000);
        nbd_config_put(nbd);
        atomic_dec(&config->recv_threads);
        wake_up(&config->recv_wq);
3. Create nbd server
nbd-server 8000 /tmp/disk
4. Create nbd client
nbd-client localhost 8000 /dev/nbd1
Then will trigger above issue.

Reason is when add delay in recv_work, lead to release the last reference
of 'nbd->config_refs'. nbd_config_put will call flush_workqueue to make
all work finish. Obviously, it will lead to deadloop.
To solve this issue, according to Josef's suggestion move 'recv_work'
init from start device to nbd_dev_add, then destroy 'recv_work'when
nbd device teardown.

Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/block/nbd.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 096883ab9b76..7a8d1b71e038 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -260,7 +260,7 @@ static void nbd_dev_remove(struct nbd_device *nbd)
 	mutex_lock(&nbd_index_mutex);
 	idr_remove(&nbd_index_idr, nbd->index);
 	mutex_unlock(&nbd_index_mutex);
-
+	destroy_workqueue(nbd->recv_workq);
 	kfree(nbd);
 }
 
@@ -1314,10 +1314,6 @@ static void nbd_config_put(struct nbd_device *nbd)
 		kfree(nbd->config);
 		nbd->config = NULL;
 
-		if (nbd->recv_workq)
-			destroy_workqueue(nbd->recv_workq);
-		nbd->recv_workq = NULL;
-
 		nbd->tag_set.timeout = 0;
 		nbd->disk->queue->limits.discard_granularity = 0;
 		nbd->disk->queue->limits.discard_alignment = 0;
@@ -1346,14 +1342,6 @@ static int nbd_start_device(struct nbd_device *nbd)
 		return -EINVAL;
 	}
 
-	nbd->recv_workq = alloc_workqueue("knbd%d-recv",
-					  WQ_MEM_RECLAIM | WQ_HIGHPRI |
-					  WQ_UNBOUND, 0, nbd->index);
-	if (!nbd->recv_workq) {
-		dev_err(disk_to_dev(nbd->disk), "Could not allocate knbd recv work queue.\n");
-		return -ENOMEM;
-	}
-
 	blk_mq_update_nr_hw_queues(&nbd->tag_set, config->num_connections);
 	nbd->pid = task_pid_nr(current);
 
@@ -1779,6 +1767,15 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	}
 	nbd->disk = disk;
 
+	nbd->recv_workq = alloc_workqueue("nbd%d-recv",
+					  WQ_MEM_RECLAIM | WQ_HIGHPRI |
+					  WQ_UNBOUND, 0, nbd->index);
+	if (!nbd->recv_workq) {
+		dev_err(disk_to_dev(nbd->disk), "Could not allocate knbd recv work queue.\n");
+		err = -ENOMEM;
+		goto out_err_disk;
+	}
+
 	/*
 	 * Tell the block layer that we are not a rotational device
 	 */
@@ -1809,7 +1806,7 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	disk->first_minor = index << part_shift;
 	if (disk->first_minor > 0xff) {
 		err = -EINVAL;
-		goto out_err_disk;
+		goto out_free_work;
 	}
 
 	disk->minors = 1 << part_shift;
@@ -1818,7 +1815,7 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	sprintf(disk->disk_name, "nbd%d", index);
 	err = add_disk(disk);
 	if (err)
-		goto out_err_disk;
+		goto out_free_work;
 
 	/*
 	 * Now publish the device.
@@ -1827,6 +1824,8 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	nbd_total_devices++;
 	return nbd;
 
+out_free_work:
+	destroy_workqueue(nbd->recv_workq);
 out_err_disk:
 	blk_cleanup_disk(disk);
 out_free_idr:
@@ -2082,13 +2081,10 @@ static void nbd_disconnect_and_put(struct nbd_device *nbd)
 	nbd_disconnect(nbd);
 	sock_shutdown(nbd);
 	/*
-	 * Make sure recv thread has finished, so it does not drop the last
-	 * config ref and try to destroy the workqueue from inside the work
-	 * queue. And this also ensure that we can safely call nbd_clear_que()
+	 * Make sure recv thread has finished, we can safely call nbd_clear_que()
 	 * to cancel the inflight I/Os.
 	 */
-	if (nbd->recv_workq)
-		flush_workqueue(nbd->recv_workq);
+	flush_workqueue(nbd->recv_workq);
 	nbd_clear_que(nbd);
 	nbd->task_setup = NULL;
 	mutex_unlock(&nbd->config_lock);
-- 
2.31.1

