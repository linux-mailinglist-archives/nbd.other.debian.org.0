Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 154A7402ACC
	for <lists+nbd@lfdr.de>; Tue,  7 Sep 2021 16:30:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1D9EB2083F; Tue,  7 Sep 2021 14:30:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  7 14:30:10 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D0BAE20A3C
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Sep 2021 14:12:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.281 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9AF0f13q3rIH for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Sep 2021 14:12:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2C7EA20A16
	for <nbd@other.debian.org>; Tue,  7 Sep 2021 14:12:43 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4H3ms05rp7z8sss;
	Tue,  7 Sep 2021 21:51:32 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 7 Sep 2021 21:52:01 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Tue, 7 Sep
 2021 21:52:01 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <axboe@kernel.dk>, <josef@toxicpanda.com>, <ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v4 2/6] nbd: convert to use blk_mq_find_and_get_req()
Date: Tue, 7 Sep 2021 22:01:50 +0800
Message-ID: <20210907140154.2134091-3-yukuai3@huawei.com>
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
Resent-Message-ID: <fJvtgC8AGEN.A.bYG.yd3NhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1405
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210907140154.2134091-3-yukuai3@huawei.com
Resent-Date: Tue,  7 Sep 2021 14:30:10 +0000 (UTC)

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
freed. However, there are still some problems if the request is
started, and this will be fixed in next patch.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/nbd.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5170a630778d..920da390635c 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -718,12 +718,13 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
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
@@ -785,6 +786,9 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 out:
 	trace_nbd_payload_received(req, handle);
 	mutex_unlock(&cmd->lock);
+put_req:
+	if (req)
+		blk_mq_put_rq_ref(req);
 	return ret ? ERR_PTR(ret) : cmd;
 }
 
-- 
2.31.1

