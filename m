Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF729589
	for <lists+nbd@lfdr.de>; Fri, 24 May 2019 12:12:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A16AC20629; Fri, 24 May 2019 10:12:29 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 24 10:12:29 2019
Old-Return-Path: <yotta.liu@ucloud.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 409D0206F7
	for <lists-other-nbd@bendel.debian.org>; Fri, 24 May 2019 09:55:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LrQJT9RkLz56 for <lists-other-nbd@bendel.debian.org>;
	Fri, 24 May 2019 09:55:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from m9784.mail.qiye.163.com (m9784.mail.qiye.163.com [220.181.97.84])
	by bendel.debian.org (Postfix) with ESMTP id 126EF206FD
	for <nbd@other.debian.org>; Fri, 24 May 2019 09:55:44 +0000 (UTC)
Received: from kernel_test2.localdomain (unknown [120.132.1.243])
	by m9784.mail.qiye.163.com (Hmail) with ESMTPA id B6CFB415E9;
	Fri, 24 May 2019 17:48:02 +0800 (CST)
From: Yao Liu <yotta.liu@ucloud.cn>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] nbd: fix connection timed out error after reconnecting to server
Date: Fri, 24 May 2019 17:43:54 +0800
Message-Id: <1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn>
X-Mailer: git-send-email 1.8.3.1
X-HM-Spam-Status: e1kIGBQJHllBWUlVT0tMQkJCQkJJSExLTUpZV1koWUFJQjdXWS1ZQUlXWQ
	kOFx4IWUFZNTQpNjo3JCkuNz5ZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PS46Dio*Ezg1TSxWMTA*CEwe
	TSMwFA9VSlVKTk5DTUJKSUNIS0xLVTMWGhIXVQIUDw8aVRcSDjsOGBcUDh9VGBVFWVdZEgtZQVlK
	SUtVSkhJVUpVSU9IWVdZCAFZQU9ISEg3Bg++
X-HM-Tid: 0a6ae93d7ff12086kuqyb6cfb415e9
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rMGQASd6qFP.A.arB.NO85cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/516
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1558691036-16281-1-git-send-email-yotta.liu@ucloud.cn
Resent-Date: Fri, 24 May 2019 10:12:29 +0000 (UTC)

Some I/O requests that have been sent succussfully but have not yet been
replied won't be resubmitted after reconnecting because of server restart,
so we add a list to track them.

Signed-off-by: Yao Liu <yotta.liu@ucloud.cn>
---
 drivers/block/nbd.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 053958a..ca69d6e 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -113,6 +113,8 @@ struct nbd_device {
 	struct list_head list;
 	struct task_struct *task_recv;
 	struct task_struct *task_setup;
+	struct mutex outstanding_lock;
+	struct list_head outstanding_queue;
 };
 
 #define NBD_CMD_REQUEUED	1
@@ -125,6 +127,7 @@ struct nbd_cmd {
 	blk_status_t status;
 	unsigned long flags;
 	u32 cmd_cookie;
+	struct list_head outstanding_entry;
 };
 
 #if IS_ENABLED(CONFIG_DEBUG_FS)
@@ -619,6 +622,24 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
 	return 0;
 }
 
+static struct nbd_cmd *nbd_get_cmd(struct nbd_device *nbd,
+					struct nbd_cmd *xcmd)
+{
+	struct nbd_cmd *cmd, *tmp;
+
+	mutex_lock(&nbd->outstanding_lock);
+	list_for_each_entry_safe(cmd, tmp, &nbd->outstanding_queue, outstanding_entry) {
+		if (cmd != xcmd)
+			continue;
+		list_del_init(&cmd->outstanding_entry);
+		mutex_unlock(&nbd->outstanding_lock);
+		return cmd;
+	}
+	mutex_unlock(&nbd->outstanding_lock);
+
+	return ERR_PTR(-ENOENT);
+}
+
 /* NULL returned = something went wrong, inform userspace */
 static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 {
@@ -714,12 +735,30 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 				req, bvec.bv_len);
 		}
 	}
+	cmd = nbd_get_cmd(nbd, cmd);
+	if (IS_ERR(cmd)) {
+		dev_err(disk_to_dev(nbd->disk), "Unexpected reply (%d) %p which not in outstanding queue\n",
+			tag, req);
+		ret = -ENOENT;
+	}
 out:
 	trace_nbd_payload_received(req, handle);
 	mutex_unlock(&cmd->lock);
 	return ret ? ERR_PTR(ret) : cmd;
 }
 
+static void nbd_requeue_outstanding(struct nbd_device *nbd)
+{
+	struct nbd_cmd *cmd, *tmp;
+
+	mutex_lock(&nbd->outstanding_lock);
+	list_for_each_entry_safe(cmd, tmp, &nbd->outstanding_queue, outstanding_entry) {
+		nbd_requeue_cmd(cmd);
+		list_del_init(&cmd->outstanding_entry);
+	}
+	mutex_unlock(&nbd->outstanding_lock);
+}
+
 static void recv_work(struct work_struct *work)
 {
 	struct recv_thread_args *args = container_of(work,
@@ -742,6 +781,7 @@ static void recv_work(struct work_struct *work)
 
 		blk_mq_complete_request(blk_mq_rq_from_pdu(cmd));
 	}
+	nbd_requeue_outstanding(nbd);
 	atomic_dec(&config->recv_threads);
 	wake_up(&config->recv_wq);
 	nbd_config_put(nbd);
@@ -892,6 +932,10 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
 		nbd_mark_nsock_dead(nbd, nsock, 1);
 		nbd_requeue_cmd(cmd);
 		ret = 0;
+	} else if (ret == 0) {
+		mutex_lock(&nbd->outstanding_lock);
+		list_add_tail(&cmd->outstanding_entry, &nbd->outstanding_queue);
+		mutex_unlock(&nbd->outstanding_lock);
 	}
 out:
 	mutex_unlock(&nsock->tx_lock);
@@ -1615,6 +1659,8 @@ static int nbd_dev_add(int index)
 	refcount_set(&nbd->config_refs, 0);
 	refcount_set(&nbd->refs, 1);
 	INIT_LIST_HEAD(&nbd->list);
+	mutex_init(&nbd->outstanding_lock);
+	INIT_LIST_HEAD(&nbd->outstanding_queue);
 	disk->major = NBD_MAJOR;
 	disk->first_minor = index << part_shift;
 	disk->fops = &nbd_fops;
-- 
1.8.3.1

