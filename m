Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C95F654F6C9
	for <lists+nbd@lfdr.de>; Fri, 17 Jun 2022 13:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9A3A620446; Fri, 17 Jun 2022 11:36:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 17 11:36:33 2022
Old-Return-Path: <john.garry@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,TO_TOO_MANY,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8923E205F2
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jun 2022 11:20:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.691 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id AH651n0O3qAI for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jun 2022 11:20:17 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A57CD205F6
	for <nbd@other.debian.org>; Fri, 17 Jun 2022 11:20:17 +0000 (UTC)
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LPbhC6ZMMz689NN;
	Fri, 17 Jun 2022 19:01:31 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 13:01:43 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 12:01:38 +0100
From: John Garry <john.garry@huawei.com>
To: <axboe@kernel.dk>, <damien.lemoal@opensource.wdc.com>,
	<bvanassche@acm.org>, <hch@lst.de>, <jejb@linux.ibm.com>,
	<martin.petersen@oracle.com>, <hare@suse.de>, <satishkh@cisco.com>,
	<sebaddel@cisco.com>, <kartilak@cisco.com>
CC: <linux-rdma@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-nvme@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <mpi3mr-linuxdrv.pdl@broadcom.com>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, John Garry <john.garry@huawei.com>
Subject: [PATCH 2/5] blk-mq: Add a flag for reserved requests
Date: Fri, 17 Jun 2022 18:55:17 +0800
Message-ID: <1655463320-241202-3-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1655463320-241202-1-git-send-email-john.garry@huawei.com>
References: <1655463320-241202-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FjlRXvnDfhE.A.NRH.BdGriB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2149
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1655463320-241202-3-git-send-email-john.garry@huawei.com
Resent-Date: Fri, 17 Jun 2022 11:36:33 +0000 (UTC)

Add a flag for reserved requests so that drivers may know this for any
special handling.

Signed-off-by: John Garry <john.garry@huawei.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 block/blk-mq.c         | 6 ++++++
 include/linux/blk-mq.h | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 7a5558bbc7f6..15e66416de60 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -474,6 +474,9 @@ static struct request *__blk_mq_alloc_requests(struct blk_mq_alloc_data *data)
 	if (!(data->rq_flags & RQF_ELV))
 		blk_mq_tag_busy(data->hctx);
 
+	if (data->flags & BLK_MQ_REQ_RESERVED)
+		data->rq_flags |= RQF_RESV;
+
 	/*
 	 * Try batched alloc if we want more than 1 tag.
 	 */
@@ -586,6 +589,9 @@ struct request *blk_mq_alloc_request_hctx(struct request_queue *q,
 	else
 		data.rq_flags |= RQF_ELV;
 
+	if (flags & BLK_MQ_REQ_RESERVED)
+		data.rq_flags |= RQF_RESV;
+
 	ret = -EWOULDBLOCK;
 	tag = blk_mq_get_tag(&data);
 	if (tag == BLK_MQ_NO_TAG)
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index e2d9daf7e8dd..6d81fe10e850 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -57,6 +57,7 @@ typedef __u32 __bitwise req_flags_t;
 #define RQF_TIMED_OUT		((__force req_flags_t)(1 << 21))
 /* queue has elevator attached */
 #define RQF_ELV			((__force req_flags_t)(1 << 22))
+#define RQF_RESV			((__force req_flags_t)(1 << 23))
 
 /* flags that prevent us from merging requests: */
 #define RQF_NOMERGE_FLAGS \
@@ -823,6 +824,11 @@ static inline bool blk_mq_need_time_stamp(struct request *rq)
 	return (rq->rq_flags & (RQF_IO_STAT | RQF_STATS | RQF_ELV));
 }
 
+static inline bool blk_mq_is_reserved_rq(struct request *rq)
+{
+	return rq->rq_flags & RQF_RESV;
+}
+
 /*
  * Batched completions only work when there is no I/O error and no special
  * ->end_io handler.
-- 
2.35.3

