Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7756E40C19B
	for <lists+nbd@lfdr.de>; Wed, 15 Sep 2021 10:22:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 462CF20779; Wed, 15 Sep 2021 08:22:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 15 08:22:15 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8324A20772
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 Sep 2021 08:05:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ytfMmIFbc1qJ for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 Sep 2021 08:05:51 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7AF4520778
	for <nbd@other.debian.org>; Wed, 15 Sep 2021 08:05:51 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H8Xjd46RxzYkHl;
	Wed, 15 Sep 2021 16:01:41 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 15 Sep 2021 16:05:47 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Wed, 15
 Sep 2021 16:05:47 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <axboe@kernel.dk>, <josef@toxicpanda.com>, <ming.lei@redhat.com>,
	<hch@infradead.org>
CC: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v6 5/6] nbd: partition nbd_read_stat() into nbd_read_reply() and nbd_handle_reply()
Date: Wed, 15 Sep 2021 16:15:36 +0800
Message-ID: <20210915081537.1684327-6-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915081537.1684327-1-yukuai3@huawei.com>
References: <20210915081537.1684327-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EfWx9LeBC-K.A.gVD.30aQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1471
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210915081537.1684327-6-yukuai3@huawei.com
Resent-Date: Wed, 15 Sep 2021 08:22:15 +0000 (UTC)

Prepare to fix uaf in nbd_read_stat(), no functional changes.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/nbd.c | 76 +++++++++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 31 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 22c91d8901f6..9a7bbf8ebe74 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -694,38 +694,45 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
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
-	if (result <= 0) {
-		if (!nbd_disconnected(config))
+	if (result < 0) {
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
@@ -768,9 +775,9 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
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
@@ -779,6 +786,7 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 	if (rq_data_dir(req) != WRITE) {
 		struct req_iterator iter;
 		struct bio_vec bvec;
+		struct iov_iter to;
 
 		rq_for_each_segment(bvec, req, iter) {
 			iov_iter_bvec(&to, READ, &bvec, 1, bvec.bv_len);
@@ -792,7 +800,7 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 				 * and let the timeout stuff handle resubmitting
 				 * this request onto another connection.
 				 */
-				if (nbd_disconnected(config)) {
+				if (nbd_disconnected(nbd->config)) {
 					cmd->status = BLK_STS_IOERR;
 					goto out;
 				}
@@ -816,24 +824,30 @@ static void recv_work(struct work_struct *work)
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

