Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBD9536A24
	for <lists+nbd@lfdr.de>; Sat, 28 May 2022 04:15:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2345C2065D; Sat, 28 May 2022 02:15:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 28 02:15:33 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5C492205F0
	for <lists-other-nbd@bendel.debian.org>; Sat, 28 May 2022 01:59:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.29 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9hkS9_4ZEilA for <lists-other-nbd@bendel.debian.org>;
	Sat, 28 May 2022 01:59:13 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id EE0C520610
	for <nbd@other.debian.org>; Sat, 28 May 2022 01:59:12 +0000 (UTC)
Received: from kwepemi500022.china.huawei.com (unknown [172.30.72.56])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4L94bT2BJtzDqVJ;
	Sat, 28 May 2022 09:59:01 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 kwepemi500022.china.huawei.com (7.221.188.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 28 May 2022 09:59:07 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600009.china.huawei.com
 (7.193.23.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 28 May
 2022 09:59:07 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <ming.lei@redhat.com>,
	<yukuai3@huawei.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
Subject: [PATCH -next v4 3/6] nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
Date: Sat, 28 May 2022 10:12:32 +0800
Message-ID: <20220528021235.2120995-4-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220528021235.2120995-1-yukuai3@huawei.com>
References: <20220528021235.2120995-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7Vs-ABZWLUG.A.hpE.FXYkiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2104
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220528021235.2120995-4-yukuai3@huawei.com
Resent-Date: Sat, 28 May 2022 02:15:33 +0000 (UTC)

Otherwise io will hung because request will only be completed if the
cmd has the flag 'NBD_CMD_INFLIGHT'.

Fixes: 07175cb1baf4 ("nbd: make sure request completion won't concurrent")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/nbd.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 2ee1e376d5c4..a673a97b9b6b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -403,13 +403,14 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 	if (!mutex_trylock(&cmd->lock))
 		return BLK_EH_RESET_TIMER;
 
-	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
+	if (!test_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
 		mutex_unlock(&cmd->lock);
 		return BLK_EH_DONE;
 	}
 
 	if (!refcount_inc_not_zero(&nbd->config_refs)) {
 		cmd->status = BLK_STS_TIMEOUT;
+		__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
 		mutex_unlock(&cmd->lock);
 		goto done;
 	}
@@ -478,6 +479,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 	dev_err_ratelimited(nbd_to_dev(nbd), "Connection timed out\n");
 	set_bit(NBD_RT_TIMEDOUT, &config->runtime_flags);
 	cmd->status = BLK_STS_IOERR;
+	__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
 	mutex_unlock(&cmd->lock);
 	sock_shutdown(nbd);
 	nbd_config_put(nbd);
@@ -745,7 +747,7 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
 	cmd = blk_mq_rq_to_pdu(req);
 
 	mutex_lock(&cmd->lock);
-	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
+	if (!test_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
 		dev_err(disk_to_dev(nbd->disk), "Suspicious reply %d (status %u flags %lu)",
 			tag, cmd->status, cmd->flags);
 		ret = -ENOENT;
@@ -813,6 +815,10 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
 	}
 out:
 	trace_nbd_payload_received(req, handle);
+	if (!ret && likely(!blk_should_fake_timeout(req->q)))
+		__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
+	else if (!ret)
+		ret = -ENOENT;
 	mutex_unlock(&cmd->lock);
 	return ret ? ERR_PTR(ret) : cmd;
 }
@@ -854,8 +860,7 @@ static void recv_work(struct work_struct *work)
 		}
 
 		rq = blk_mq_rq_from_pdu(cmd);
-		if (likely(!blk_should_fake_timeout(rq->q)))
-			blk_mq_complete_request(rq);
+		blk_mq_complete_request(rq);
 		percpu_ref_put(&q->q_usage_counter);
 	}
 
-- 
2.31.1

