Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B254058E6
	for <lists+nbd@lfdr.de>; Thu,  9 Sep 2021 16:22:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 64D2E206A3; Thu,  9 Sep 2021 14:22:04 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  9 14:22:04 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E646D20767
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Sep 2021 14:03:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.281 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id COldeeVtOr4g for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Sep 2021 14:03:04 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E34142077D
	for <nbd@other.debian.org>; Thu,  9 Sep 2021 14:03:01 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H510D6k95zVrKv;
	Thu,  9 Sep 2021 22:02:04 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 22:02:58 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Thu, 9 Sep
 2021 22:02:57 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <axboe@kernel.dk>, <josef@toxicpanda.com>, <ming.lei@redhat.com>,
	<hch@infradead.org>
CC: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v5 5/6] nbd: convert to use blk_mq_find_and_get_req()
Date: Thu, 9 Sep 2021 22:12:55 +0800
Message-ID: <20210909141256.2606682-6-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210909141256.2606682-1-yukuai3@huawei.com>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_qKIHQ05LpG.A.puD.MihOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1429
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210909141256.2606682-6-yukuai3@huawei.com
Resent-Date: Thu,  9 Sep 2021 14:22:04 +0000 (UTC)

blk_mq_tag_to_rq() can only ensure to return valid request in
following situation:

1) client send request message to server first
submit_bio
...
 blk_mq_get_tag
 ...
 blk_mq_get_driver_tag
 ...
 nbd_queue_rq
  nbd_handle_cmd
   nbd_send_cmd

2) client receive respond message from server
recv_work
 nbd_read_stat
  blk_mq_tag_to_rq

If step 1) is missing, blk_mq_tag_to_rq() will return a stale
request, which might be freed. Thus convert to use
blk_mq_find_and_get_req() to make sure the returned request is not
freed.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/nbd.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 6d8cbf8be231..d298e2b9e6ee 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -729,12 +729,13 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 	tag = nbd_handle_to_tag(handle);
 	hwq = blk_mq_unique_tag_to_hwq(tag);
 	if (hwq < nbd->tag_set.nr_hw_queues)
-		req = blk_mq_tag_to_rq(nbd->tag_set.tags[hwq],
-				       blk_mq_unique_tag_to_tag(tag));
+		req = blk_mq_find_and_get_req(nbd->tag_set.tags[hwq],
+					      blk_mq_unique_tag_to_tag(tag));
 	if (!req || !blk_mq_request_started(req)) {
 		dev_err(disk_to_dev(nbd->disk), "Unexpected reply (%d) %p\n",
 			tag, req);
-		return ERR_PTR(-ENOENT);
+		ret = -ENOENT;
+		goto put_req;
 	}
 	trace_nbd_header_received(req, handle);
 	cmd = blk_mq_rq_to_pdu(req);
@@ -806,6 +807,14 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 out:
 	trace_nbd_payload_received(req, handle);
 	mutex_unlock(&cmd->lock);
+put_req:
+	/*
+	 * It's safe to drop refcnt here because request completion won't
+	 * concurent, thus if nbd_read_stat() successd, the request refcnt
+	 * won't drop to zero here.
+	 */
+	if (req)
+		blk_mq_put_rq_ref(req);
 	return ret ? ERR_PTR(ret) : cmd;
 }
 
-- 
2.31.1

