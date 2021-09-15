Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC6A40C2BE
	for <lists+nbd@lfdr.de>; Wed, 15 Sep 2021 11:27:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0A02020776; Wed, 15 Sep 2021 09:27:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 15 09:27:55 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1815720763
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 Sep 2021 09:10:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.281 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8hwhWQnILp66 for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 Sep 2021 09:10:28 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 639C72078A
	for <nbd@other.debian.org>; Wed, 15 Sep 2021 09:10:28 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H8Z8B1nThzRCTW;
	Wed, 15 Sep 2021 17:06:18 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 15 Sep 2021 17:10:21 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Wed, 15
 Sep 2021 17:10:20 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <hch@infradead.org>,
	<ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v7 6/6] nbd: fix uaf in nbd_handle_reply()
Date: Wed, 15 Sep 2021 17:20:10 +0800
Message-ID: <20210915092010.2087371-7-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915092010.2087371-1-yukuai3@huawei.com>
References: <20210915092010.2087371-1-yukuai3@huawei.com>
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
Resent-Message-ID: <TGE90DY5CwI.A.bHE.bybQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1481
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210915092010.2087371-7-yukuai3@huawei.com
Resent-Date: Wed, 15 Sep 2021 09:27:56 +0000 (UTC)

There is a problem that nbd_handle_reply() might access freed request:

1) At first, a normal io is submitted and completed with scheduler:

internel_tag = blk_mq_get_tag -> get tag from sched_tags
 blk_mq_rq_ctx_init
  sched_tags->rq[internel_tag] = sched_tag->static_rq[internel_tag]
...
blk_mq_get_driver_tag
 __blk_mq_get_driver_tag -> get tag from tags
 tags->rq[tag] = sched_tag->static_rq[internel_tag]

So, both tags->rq[tag] and sched_tags->rq[internel_tag] are pointing
to the request: sched_tags->static_rq[internal_tag]. Even if the
io is finished.

2) nbd server send a reply with random tag directly:

recv_work
 nbd_handle_reply
  blk_mq_tag_to_rq(tags, tag)
   rq = tags->rq[tag]

3) if the sched_tags->static_rq is freed:

blk_mq_sched_free_requests
 blk_mq_free_rqs(q->tag_set, hctx->sched_tags, i)
  -> step 2) access rq before clearing rq mapping
  blk_mq_clear_rq_mapping(set, tags, hctx_idx);
  __free_pages() -> rq is freed here

4) Then, nbd continue to use the freed request in nbd_handle_reply

Fix the problem by get 'q_usage_counter' before blk_mq_tag_to_rq(),
thus request is ensured not to be freed because 'q_usage_counter' is
not zero.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/nbd.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 9a7bbf8ebe74..3e8b70b5d4f9 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -824,6 +824,7 @@ static void recv_work(struct work_struct *work)
 						     work);
 	struct nbd_device *nbd = args->nbd;
 	struct nbd_config *config = nbd->config;
+	struct request_queue *q = nbd->disk->queue;
 	struct nbd_sock *nsock;
 	struct nbd_cmd *cmd;
 	struct request *rq;
@@ -834,7 +835,24 @@ static void recv_work(struct work_struct *work)
 		if (nbd_read_reply(nbd, args->index, &reply))
 			break;
 
+		/*
+		 * Grab ref of q_usage_counter can prevent request being freed
+		 * during nbd_handle_reply(). If q_usage_counter is zero, then
+		 * no request is inflight, which means something is wrong since
+		 * we expect to find a request to complete here.
+		 */
+		if (!percpu_ref_tryget(&q->q_usage_counter)) {
+			dev_err(disk_to_dev(nbd->disk), "%s: no io inflight\n",
+				__func__);
+			break;
+		}
+
 		cmd = nbd_handle_reply(nbd, args->index, &reply);
+		/*
+		 * It's safe to drop ref before request completion, inflight
+		 * request will ensure q_usage_counter won't be zero.
+		 */
+		percpu_ref_put(&q->q_usage_counter);
 		if (IS_ERR(cmd))
 			break;
 
-- 
2.31.1

