Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B913F6008
	for <lists+nbd@lfdr.de>; Tue, 24 Aug 2021 16:18:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E5B9D206DC; Tue, 24 Aug 2021 14:18:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 24 14:18:20 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 71885205E9
	for <lists-other-nbd@bendel.debian.org>; Tue, 24 Aug 2021 14:02:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.28 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id M-hgBB04ysUS for <lists-other-nbd@bendel.debian.org>;
	Tue, 24 Aug 2021 14:02:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 10CBD20703
	for <nbd@other.debian.org>; Tue, 24 Aug 2021 14:02:14 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Gv9l529BRz1DD7t;
	Tue, 24 Aug 2021 22:01:37 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 22:02:09 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 24
 Aug 2021 22:02:08 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <axboe@kernel.dk>, <josef@toxicpanda.com>, <ming.lei@redhat.com>,
	<bvanassche@acm.org>
CC: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v3 3/5] nbd: don't handle response without a corresponding request message
Date: Tue, 24 Aug 2021 22:12:25 +0800
Message-ID: <20210824141227.808340-4-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824141227.808340-1-yukuai3@huawei.com>
References: <20210824141227.808340-1-yukuai3@huawei.com>
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
Resent-Message-ID: <mWYBA7kC68.A.oEG.s-PJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1319
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210824141227.808340-4-yukuai3@huawei.com
Resent-Date: Tue, 24 Aug 2021 14:18:20 +0000 (UTC)

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
  blk_mq_get_rq_by_tag
 blk_mq_complete_request
                          nbd_send_cmd

Thus add a new cmd flag 'NBD_CMD_INFLIGHT', it will be set in
nbd_send_cmd() and checked in nbd_read_stat().

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/nbd.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ca54a0736090..7b9e19675224 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -127,6 +127,11 @@ struct nbd_device {
 };
 
 #define NBD_CMD_REQUEUED	1
+/*
+ * This flag will be set if nbd_send_cmd() succeed, and will be checked in
+ * normal completion.
+ */
+#define NBD_CMD_INFLIGHT	2
 
 struct nbd_cmd {
 	struct nbd_device *nbd;
@@ -743,6 +748,12 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 	cmd = blk_mq_rq_to_pdu(req);
 
 	mutex_lock(&cmd->lock);
+	if (!test_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
+		dev_err(disk_to_dev(nbd->disk), "NBD_CMD_INFLIGHT is not set %d\n",
+			tag);
+		ret = -ENOENT;
+		goto out;
+	}
 	if (cmd->cmd_cookie != nbd_handle_to_cookie(handle)) {
 		dev_err(disk_to_dev(nbd->disk), "Double reply on req %p, cmd_cookie %u, handle cookie %u\n",
 			req, cmd->cmd_cookie, nbd_handle_to_cookie(handle));
@@ -980,6 +991,8 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
 	 * returns EAGAIN can be retried on a different socket.
 	 */
 	ret = nbd_send_cmd(nbd, cmd, index);
+	if (!ret)
+		set_bit(NBD_CMD_INFLIGHT, &cmd->flags);
 	if (ret == -EAGAIN) {
 		dev_err_ratelimited(disk_to_dev(nbd->disk),
 				    "Request send failed, requeueing\n");
-- 
2.31.1

