Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C8250FF0D
	for <lists+nbd@lfdr.de>; Tue, 26 Apr 2022 15:28:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4ADCD203D5; Tue, 26 Apr 2022 13:28:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 26 13:28:39 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4C17E20342
	for <lists-other-nbd@bendel.debian.org>; Tue, 26 Apr 2022 13:11:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.29 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CUKngHYMpocf for <lists-other-nbd@bendel.debian.org>;
	Tue, 26 Apr 2022 13:11:31 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 557FF203C1
	for <nbd@other.debian.org>; Tue, 26 Apr 2022 13:11:31 +0000 (UTC)
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Knhd943FzzhYmX;
	Tue, 26 Apr 2022 20:53:17 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 kwepemi500013.china.huawei.com (7.221.188.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 20:53:34 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600009.china.huawei.com
 (7.193.23.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 26 Apr
 2022 20:53:33 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH -next 3/6] nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
Date: Tue, 26 Apr 2022 21:07:43 +0800
Message-ID: <20220426130746.885140-4-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220426130746.885140-1-yukuai3@huawei.com>
References: <20220426130746.885140-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kvYWQkn5-iO.A.StE.HO_ZiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2056
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220426130746.885140-4-yukuai3@huawei.com
Resent-Date: Tue, 26 Apr 2022 13:28:39 +0000 (UTC)

Otherwise io will hung because request will only be completed if the
cmd has the flag 'NBD_CMD_INFLIGHT'.

Fixes: 07175cb1baf4 ("nbd: make sure request completion won't concurrent")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/nbd.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index c0a787cb5153..4829868706af 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -429,6 +429,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 		 * a new connection is reconfigured or util dead timeout.
 		 */
 		if (config->socks) {
+			__set_bit(NBD_CMD_INFLIGHT, &cmd->flags);
 			if (cmd->index < config->num_connections) {
 				struct nbd_sock *nsock =
 					config->socks[cmd->index];
@@ -456,6 +457,8 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 		 * so just warn and reset the timer.
 		 */
 		struct nbd_sock *nsock = config->socks[cmd->index];
+
+		__set_bit(NBD_CMD_INFLIGHT, &cmd->flags);
 		cmd->retries++;
 		dev_info(nbd_to_dev(nbd), "Possible stuck request %p: control (%s@%llu,%uB). Runtime %u seconds\n",
 			req, nbdcmd_to_ascii(req_to_nbd_cmd_type(req)),
@@ -756,31 +759,31 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
 		dev_err(disk_to_dev(nbd->disk), "Unexpected reply %d from different sock %d (expected %d)",
 			tag, index, cmd->index);
 		ret = -ENOENT;
-		goto out;
+		goto out_reset_inflight;
 	}
 	if (cmd->cmd_cookie != nbd_handle_to_cookie(handle)) {
 		dev_err(disk_to_dev(nbd->disk), "Double reply on req %p, cmd_cookie %u, handle cookie %u\n",
 			req, cmd->cmd_cookie, nbd_handle_to_cookie(handle));
 		ret = -ENOENT;
-		goto out;
+		goto out_reset_inflight;
 	}
 	if (cmd->status != BLK_STS_OK) {
 		dev_err(disk_to_dev(nbd->disk), "Command already handled %p\n",
 			req);
 		ret = -ENOENT;
-		goto out;
+		goto out_reset_inflight;
 	}
 	if (test_bit(NBD_CMD_REQUEUED, &cmd->flags)) {
 		dev_err(disk_to_dev(nbd->disk), "Raced with timeout on req %p\n",
 			req);
 		ret = -ENOENT;
-		goto out;
+		goto out_reset_inflight;
 	}
 	if (ntohl(reply->error)) {
 		dev_err(disk_to_dev(nbd->disk), "Other side returned error (%d)\n",
 			ntohl(reply->error));
 		cmd->status = BLK_STS_IOERR;
-		goto out;
+		goto out_reset_inflight;
 	}
 
 	dev_dbg(nbd_to_dev(nbd), "request %p: got reply\n", req);
@@ -803,15 +806,22 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
 				 */
 				if (nbd_disconnected(nbd->config)) {
 					cmd->status = BLK_STS_IOERR;
-					goto out;
+					goto out_reset_inflight;
 				}
 				ret = -EIO;
-				goto out;
+				goto out_reset_inflight;
 			}
 			dev_dbg(nbd_to_dev(nbd), "request %p: got %d bytes data\n",
 				req, bvec.bv_len);
 		}
 	}
+out_reset_inflight:
+	if (ret)
+		/*
+		 * Caller will not complete the request, thus set the flag so
+		 * that it can be completed from other context.
+		 */
+		__set_bit(NBD_CMD_INFLIGHT, &cmd->flags);
 out:
 	trace_nbd_payload_received(req, handle);
 	mutex_unlock(&cmd->lock);
@@ -857,6 +867,9 @@ static void recv_work(struct work_struct *work)
 		rq = blk_mq_rq_from_pdu(cmd);
 		if (likely(!blk_should_fake_timeout(rq->q)))
 			blk_mq_complete_request(rq);
+		else
+			/* Timeout rely on this flag to complete request. */
+			__test_and_set_bit(NBD_CMD_INFLIGHT, &cmd->flags);
 		percpu_ref_put(&q->q_usage_counter);
 	}
 
-- 
2.31.1

