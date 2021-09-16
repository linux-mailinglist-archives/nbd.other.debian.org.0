Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF4840D673
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 11:43:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CF07F20893; Thu, 16 Sep 2021 09:43:04 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 09:43:04 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4D1EB208C7
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 09:24:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.281 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Cxz0Sn9W2lox for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 09:24:09 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1B55F208C1
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 09:24:09 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H9BPV1Fy7zRC9y;
	Thu, 16 Sep 2021 17:19:58 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Thu, 16 Sep 2021 17:24:02 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Thu, 16
 Sep 2021 17:24:01 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <ming.lei@redhat.com>,
	<hch@infradead.org>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [patch v8 1/7] nbd: don't handle response without a corresponding request message
Date: Thu, 16 Sep 2021 17:33:44 +0800
Message-ID: <20210916093350.1410403-2-yukuai3@huawei.com>
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
Resent-Message-ID: <Mg7gzBB74hL.A.sg.oGxQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1500
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210916093350.1410403-2-yukuai3@huawei.com
Resent-Date: Thu, 16 Sep 2021 09:43:04 +0000 (UTC)

While handling a response message from server, nbd_read_stat() will
try to get request by tag, and then complete the request. However,
this is problematic if nbd haven't sent a corresponding request
message:

t1                      t2
                        submit_bio
                         nbd_queue_rq
                          blk_mq_start_request
recv_work
 nbd_read_stat
  blk_mq_tag_to_rq
 blk_mq_complete_request
                          nbd_send_cmd

Thus add a new cmd flag 'NBD_CMD_INFLIGHT', it will be set in
nbd_send_cmd() and checked in nbd_read_stat().

Noted that this patch can't fix that blk_mq_tag_to_rq() might
return a freed request, and this will be fixed in following
patches.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/block/nbd.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5170a630778d..23ded569e8d3 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -126,6 +126,12 @@ struct nbd_device {
 };
 
 #define NBD_CMD_REQUEUED	1
+/*
+ * This flag will be set if nbd_queue_rq() succeed, and will be checked and
+ * cleared in completion. Both setting and clearing of the flag are protected
+ * by cmd->lock.
+ */
+#define NBD_CMD_INFLIGHT	2
 
 struct nbd_cmd {
 	struct nbd_device *nbd;
@@ -400,6 +406,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 	if (!mutex_trylock(&cmd->lock))
 		return BLK_EH_RESET_TIMER;
 
+	__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
 	if (!refcount_inc_not_zero(&nbd->config_refs)) {
 		cmd->status = BLK_STS_TIMEOUT;
 		mutex_unlock(&cmd->lock);
@@ -729,6 +736,12 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 	cmd = blk_mq_rq_to_pdu(req);
 
 	mutex_lock(&cmd->lock);
+	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
+		dev_err(disk_to_dev(nbd->disk), "Suspicious reply %d (status %u flags %lu)",
+			tag, cmd->status, cmd->flags);
+		ret = -ENOENT;
+		goto out;
+	}
 	if (cmd->cmd_cookie != nbd_handle_to_cookie(handle)) {
 		dev_err(disk_to_dev(nbd->disk), "Double reply on req %p, cmd_cookie %u, handle cookie %u\n",
 			req, cmd->cmd_cookie, nbd_handle_to_cookie(handle));
@@ -828,6 +841,7 @@ static bool nbd_clear_req(struct request *req, void *data, bool reserved)
 		return true;
 
 	mutex_lock(&cmd->lock);
+	__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
 	cmd->status = BLK_STS_IOERR;
 	mutex_unlock(&cmd->lock);
 
@@ -964,7 +978,13 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
 	 * returns EAGAIN can be retried on a different socket.
 	 */
 	ret = nbd_send_cmd(nbd, cmd, index);
-	if (ret == -EAGAIN) {
+	/*
+	 * Access to this flag is protected by cmd->lock, thus it's safe to set
+	 * the flag after nbd_send_cmd() succeed to send request to server.
+	 */
+	if (!ret)
+		__set_bit(NBD_CMD_INFLIGHT, &cmd->flags);
+	else if (ret == -EAGAIN) {
 		dev_err_ratelimited(disk_to_dev(nbd->disk),
 				    "Request send failed, requeueing\n");
 		nbd_mark_nsock_dead(nbd, nsock, 1);
-- 
2.31.1

