Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F29A540D672
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 11:42:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C1845208C0; Thu, 16 Sep 2021 09:42:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 09:42:53 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 49159208BD
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 09:24:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id X9aPf8NKut3m for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 09:24:09 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 28575208C5
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 09:24:09 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H9BP56dPVz8skL;
	Thu, 16 Sep 2021 17:19:37 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Thu, 16 Sep 2021 17:24:05 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Thu, 16
 Sep 2021 17:24:04 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <ming.lei@redhat.com>,
	<hch@infradead.org>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [patch v8 6/7] nbd: partition nbd_read_stat() into nbd_read_reply() and nbd_handle_reply()
Date: Thu, 16 Sep 2021 17:33:49 +0800
Message-ID: <20210916093350.1410403-7-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916093350.1410403-1-yukuai3@huawei.com>
References: <20210916093350.1410403-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wO1dRfht7EL.A.ac.dGxQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1499
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210916093350.1410403-7-yukuai3@huawei.com
Resent-Date: Thu, 16 Sep 2021 09:42:53 +0000 (UTC)

Prepare to fix uaf in nbd_read_stat(), no functional changes.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/nbd.c | 74 +++++++++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 30 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 7f9e030e41ce..69dc5eac9ad3 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -695,38 +695,45 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
 	return 0;
 }
 
-/* NULL returned = something went wrong, inform userspace */
-static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
+static int nbd_read_reply(struct nbd_device *nbd, int index,
+			  struct nbd_reply *reply)
 {
-	struct nbd_config *config = nbd->config;
-	int result;
-	struct nbd_reply reply;
-	struct nbd_cmd *cmd;
-	struct request *req = NULL;
-	u64 handle;
-	u16 hwq;
-	u32 tag;
-	struct kvec iov = {.iov_base = &reply, .iov_len = sizeof(reply)};
+	struct kvec iov = {.iov_base = reply, .iov_len = sizeof(*reply)};
 	struct iov_iter to;
-	int ret = 0;
+	int result;
 
-	reply.magic = 0;
-	iov_iter_kvec(&to, READ, &iov, 1, sizeof(reply));
+	reply->magic = 0;
+	iov_iter_kvec(&to, READ, &iov, 1, sizeof(*reply));
 	result = sock_xmit(nbd, index, 0, &to, MSG_WAITALL, NULL);
 	if (result < 0) {
-		if (!nbd_disconnected(config))
+		if (!nbd_disconnected(nbd->config))
 			dev_err(disk_to_dev(nbd->disk),
 				"Receive control failed (result %d)\n", result);
-		return ERR_PTR(result);
+		return result;
 	}
 
-	if (ntohl(reply.magic) != NBD_REPLY_MAGIC) {
+	if (ntohl(reply->magic) != NBD_REPLY_MAGIC) {
 		dev_err(disk_to_dev(nbd->disk), "Wrong magic (0x%lx)\n",
-				(unsigned long)ntohl(reply.magic));
-		return ERR_PTR(-EPROTO);
+				(unsigned long)ntohl(reply->magic));
+		return -EPROTO;
 	}
 
-	memcpy(&handle, reply.handle, sizeof(handle));
+	return 0;
+}
+
+/* NULL returned = something went wrong, inform userspace */
+static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
+					struct nbd_reply *reply)
+{
+	int result;
+	struct nbd_cmd *cmd;
+	struct request *req = NULL;
+	u64 handle;
+	u16 hwq;
+	u32 tag;
+	int ret = 0;
+
+	memcpy(&handle, reply->handle, sizeof(handle));
 	tag = nbd_handle_to_tag(handle);
 	hwq = blk_mq_unique_tag_to_hwq(tag);
 	if (hwq < nbd->tag_set.nr_hw_queues)
@@ -769,9 +776,9 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 		ret = -ENOENT;
 		goto out;
 	}
-	if (ntohl(reply.error)) {
+	if (ntohl(reply->error)) {
 		dev_err(disk_to_dev(nbd->disk), "Other side returned error (%d)\n",
-			ntohl(reply.error));
+			ntohl(reply->error));
 		cmd->status = BLK_STS_IOERR;
 		goto out;
 	}
@@ -780,6 +787,7 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 	if (rq_data_dir(req) != WRITE) {
 		struct req_iterator iter;
 		struct bio_vec bvec;
+		struct iov_iter to;
 
 		rq_for_each_segment(bvec, req, iter) {
 			iov_iter_bvec(&to, READ, &bvec, 1, bvec.bv_len);
@@ -793,7 +801,7 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 				 * and let the timeout stuff handle resubmitting
 				 * this request onto another connection.
 				 */
-				if (nbd_disconnected(config)) {
+				if (nbd_disconnected(nbd->config)) {
 					cmd->status = BLK_STS_IOERR;
 					goto out;
 				}
@@ -817,24 +825,30 @@ static void recv_work(struct work_struct *work)
 						     work);
 	struct nbd_device *nbd = args->nbd;
 	struct nbd_config *config = nbd->config;
+	struct nbd_sock *nsock;
 	struct nbd_cmd *cmd;
 	struct request *rq;
 
 	while (1) {
-		cmd = nbd_read_stat(nbd, args->index);
-		if (IS_ERR(cmd)) {
-			struct nbd_sock *nsock = config->socks[args->index];
+		struct nbd_reply reply;
 
-			mutex_lock(&nsock->tx_lock);
-			nbd_mark_nsock_dead(nbd, nsock, 1);
-			mutex_unlock(&nsock->tx_lock);
+		if (nbd_read_reply(nbd, args->index, &reply))
+			break;
+
+		cmd = nbd_handle_reply(nbd, args->index, &reply);
+		if (IS_ERR(cmd))
 			break;
-		}
 
 		rq = blk_mq_rq_from_pdu(cmd);
 		if (likely(!blk_should_fake_timeout(rq->q)))
 			blk_mq_complete_request(rq);
 	}
+
+	nsock = config->socks[args->index];
+	mutex_lock(&nsock->tx_lock);
+	nbd_mark_nsock_dead(nbd, nsock, 1);
+	mutex_unlock(&nsock->tx_lock);
+
 	nbd_config_put(nbd);
 	atomic_dec(&config->recv_threads);
 	wake_up(&config->recv_wq);
-- 
2.31.1

