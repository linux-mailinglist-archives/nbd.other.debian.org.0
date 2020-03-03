Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF24177837
	for <lists+nbd@lfdr.de>; Tue,  3 Mar 2020 15:06:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1E62E20399; Tue,  3 Mar 2020 14:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  3 14:06:09 2020
Old-Return-Path: <yuyufen@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EE97520398
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Mar 2020 13:49:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.28 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tFemtKwv6VLz for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Mar 2020 13:49:09 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
X-Greylist: delayed 1863 seconds by postgrey-1.36 at bendel; Tue, 03 Mar 2020 13:49:08 UTC
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CBDC42030C
	for <nbd@other.debian.org>; Tue,  3 Mar 2020 13:49:08 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id C1AF3BA7D2722142F272;
	Tue,  3 Mar 2020 21:01:49 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Mar 2020
 21:01:44 +0800
From: Yufen Yu <yuyufen@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>
Subject: [PATCH] nbd: make starting request more reasonable
Date: Tue, 3 Mar 2020 21:08:43 +0800
Message-ID: <20200303130843.12065-1-yuyufen@huawei.com>
X-Mailer: git-send-email 2.16.2.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <h5rW57Q1zHO.A.y4B.RRmXeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/839
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200303130843.12065-1-yuyufen@huawei.com
Resent-Date: Tue,  3 Mar 2020 14:06:09 +0000 (UTC)

Our test robot reported a warning for refcount_dec trying to decrease
value '0'. The reason is that blk_mq_dispatch_rq_list() try to complete
the failed request from nbd driver, while the request have finished in
nbd timeout handle function. The race as following:

CPU1                             CPU2

//req->ref = 1
blk_mq_dispatch_rq_list
nbd_queue_rq
  nbd_handle_cmd
    blk_mq_start_request
                                 blk_mq_check_expired
                                   //req->ref = 2
                                   blk_mq_rq_timed_out
                                     nbd_xmit_timeout
                                       blk_mq_complete_request
                                         //req->ref = 1
                                         refcount_dec_and_test(&req->ref)

                                   refcount_dec_and_test(&req->ref)
                                   //req->ref = 0
                                     __blk_mq_free_request(req)
  ret = BLK_STS_IOERR
blk_mq_end_request
// req->ref = 0, req have been free
refcount_dec_and_test(&rq->ref)

In fact, the bug also have been reported by syzbot:
  https://lkml.org/lkml/2018/12/5/1308

Since the request have been freed by timeout handle, it can be reused
by others. Then, blk_mq_end_request() may get the re-initialized request
and free it, which is unexpected.

To fix the problem, we move blk_mq_start_request() down until the driver
will handle the request actully. If .queue_rq return something error in
preparation phase, timeout handle may don't need. Thus, moving start
request down may be more reasonable. Then, nbd_queue_rq() will not return
BLK_STS_IOERR after starting request.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 drivers/block/nbd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 78181908f0df..5256e9d02a03 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -541,6 +541,8 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
 		return -EIO;
 	}
 
+	blk_mq_start_request(req);
+
 	if (req->cmd_flags & REQ_FUA)
 		nbd_cmd_flags |= NBD_CMD_FLAG_FUA;
 
@@ -879,7 +881,6 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
 	if (!refcount_inc_not_zero(&nbd->config_refs)) {
 		dev_err_ratelimited(disk_to_dev(nbd->disk),
 				    "Socks array is empty\n");
-		blk_mq_start_request(req);
 		return -EINVAL;
 	}
 	config = nbd->config;
@@ -888,7 +889,6 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
 		dev_err_ratelimited(disk_to_dev(nbd->disk),
 				    "Attempted send on invalid socket\n");
 		nbd_config_put(nbd);
-		blk_mq_start_request(req);
 		return -EINVAL;
 	}
 	cmd->status = BLK_STS_OK;
@@ -912,7 +912,6 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
 			 */
 			sock_shutdown(nbd);
 			nbd_config_put(nbd);
-			blk_mq_start_request(req);
 			return -EIO;
 		}
 		goto again;
@@ -923,7 +922,6 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
 	 * here so that it gets put _after_ the request that is already on the
 	 * dispatch list.
 	 */
-	blk_mq_start_request(req);
 	if (unlikely(nsock->pending && nsock->pending != req)) {
 		nbd_requeue_cmd(cmd);
 		ret = 0;
-- 
2.16.2.dirty

