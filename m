Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B33C402A6B
	for <lists+nbd@lfdr.de>; Tue,  7 Sep 2021 16:09:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C933220881; Tue,  7 Sep 2021 14:09:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  7 14:09:19 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B4CAD2094F
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Sep 2021 13:52:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.261 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FVGT_m_MULTI_ODD=0.02,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qU4Hz03nn2I0 for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Sep 2021 13:52:09 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E09C620AA2
	for <nbd@other.debian.org>; Tue,  7 Sep 2021 13:52:08 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H3mmy1tpvzQyMT;
	Tue,  7 Sep 2021 21:48:02 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 21:52:02 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Tue, 7 Sep
 2021 21:52:01 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <axboe@kernel.dk>, <josef@toxicpanda.com>, <ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v4 4/6] nbd: make sure request completion won't concurrent
Date: Tue, 7 Sep 2021 22:01:52 +0800
Message-ID: <20210907140154.2134091-5-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907140154.2134091-1-yukuai3@huawei.com>
References: <20210907140154.2134091-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_5qCejJJqGC.A.miD.PK3NhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1401
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210907140154.2134091-5-yukuai3@huawei.com
Resent-Date: Tue,  7 Sep 2021 14:09:19 +0000 (UTC)

commit cddce0116058 ("nbd: Aovid double completion of a request")
try to fix that nbd_clear_que() and recv_work() can complete a
request concurrently. However, the problem still exists:

t1                    t2                     t3

nbd_disconnect_and_put
 flush_workqueue
                      recv_work
                       blk_mq_complete_request
                        blk_mq_complete_request_remote -> this is true
                         WRITE_ONCE(rq->state, MQ_RQ_COMPLETE)
                          blk_mq_raise_softirq
                                             blk_done_softirq
                                              blk_complete_reqs
                                               nbd_complete_rq
                                                blk_mq_end_request
                                                 blk_mq_free_request
                                                  WRITE_ONCE(rq->state, MQ_RQ_IDLE)
  nbd_clear_que
   blk_mq_tagset_busy_iter
    nbd_clear_req
                                                   __blk_mq_free_request
                                                    blk_mq_put_tag
     blk_mq_complete_request -> complete again

There are three places where request can be completed in nbd:
recv_work(), nbd_clear_que() and nbd_xmit_timeout(). Since they
all hold cmd->lock before completing the request, it's easy to
avoid the problem by setting and checking a cmd flag.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/nbd.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 521a8d913741..6e22e80a5488 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -406,7 +406,11 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 	if (!mutex_trylock(&cmd->lock))
 		return BLK_EH_RESET_TIMER;
 
-	__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
+	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
+		mutex_unlock(&cmd->lock);
+		return BLK_EH_DONE;
+	}
+
 	if (!refcount_inc_not_zero(&nbd->config_refs)) {
 		cmd->status = BLK_STS_TIMEOUT;
 		mutex_unlock(&cmd->lock);
@@ -846,7 +850,10 @@ static bool nbd_clear_req(struct request *req, void *data, bool reserved)
 
 	mutex_lock(&cmd->lock);
 	cmd->status = BLK_STS_IOERR;
-	__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
+	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
+		mutex_unlock(&cmd->lock);
+		return true;
+	}
 	mutex_unlock(&cmd->lock);
 
 	blk_mq_complete_request(req);
-- 
2.31.1

