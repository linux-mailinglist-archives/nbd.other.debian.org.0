Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7992354F6CA
	for <lists+nbd@lfdr.de>; Fri, 17 Jun 2022 13:36:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5DB5420601; Fri, 17 Jun 2022 11:36:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 17 11:36:44 2022
Old-Return-Path: <john.garry@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,TO_TOO_MANY,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3FA48205F6
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jun 2022 11:21:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.591 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mmp__7-hTScg for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jun 2022 11:21:04 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 13248205F4
	for <nbd@other.debian.org>; Fri, 17 Jun 2022 11:21:04 +0000 (UTC)
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LPbc14wRDz687hH;
	Fri, 17 Jun 2022 18:57:53 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 13:01:38 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 12:01:34 +0100
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
Subject: [PATCH 1/5] scsi: core: Remove reserved request time-out handling
Date: Fri, 17 Jun 2022 18:55:16 +0800
Message-ID: <1655463320-241202-2-git-send-email-john.garry@huawei.com>
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
Resent-Message-ID: <V8b2Ozdfs_.A.WTH.MdGriB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2150
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1655463320-241202-2-git-send-email-john.garry@huawei.com
Resent-Date: Fri, 17 Jun 2022 11:36:44 +0000 (UTC)

The SCSI code does not currently support reserved commands. As such,
requests which time-out would never be reserved, and scsi_timeout()
'reserved' arg should never be set.

Remove handling for reserved requests and drop wrapper scsi_timeout() as
it now just calls scsi_times_out() always.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/scsi/scsi_error.c |  3 ++-
 drivers/scsi/scsi_lib.c   | 12 ++----------
 drivers/scsi/scsi_priv.h  |  3 ++-
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/scsi/scsi_error.c b/drivers/scsi/scsi_error.c
index 49ef864df581..80cd6835ac70 100644
--- a/drivers/scsi/scsi_error.c
+++ b/drivers/scsi/scsi_error.c
@@ -318,6 +318,7 @@ void scsi_eh_scmd_add(struct scsi_cmnd *scmd)
 /**
  * scsi_times_out - Timeout function for normal scsi commands.
  * @req:	request that is timing out.
+ * @reserved:	whether the request is a reserved request.
  *
  * Notes:
  *     We do not need to lock this.  There is the potential for a race
@@ -325,7 +326,7 @@ void scsi_eh_scmd_add(struct scsi_cmnd *scmd)
  *     normal completion function determines that the timer has already
  *     fired, then it mustn't do anything.
  */
-enum blk_eh_timer_return scsi_times_out(struct request *req)
+enum blk_eh_timer_return scsi_times_out(struct request *req, bool reserved)
 {
 	struct scsi_cmnd *scmd = blk_mq_rq_to_pdu(req);
 	enum blk_eh_timer_return rtn = BLK_EH_DONE;
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 6ffc9e4258a8..d635831165d5 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -1790,14 +1790,6 @@ static blk_status_t scsi_queue_rq(struct blk_mq_hw_ctx *hctx,
 	return ret;
 }
 
-static enum blk_eh_timer_return scsi_timeout(struct request *req,
-		bool reserved)
-{
-	if (reserved)
-		return BLK_EH_RESET_TIMER;
-	return scsi_times_out(req);
-}
-
 static int scsi_mq_init_request(struct blk_mq_tag_set *set, struct request *rq,
 				unsigned int hctx_idx, unsigned int numa_node)
 {
@@ -1912,7 +1904,7 @@ static const struct blk_mq_ops scsi_mq_ops_no_commit = {
 	.put_budget	= scsi_mq_put_budget,
 	.queue_rq	= scsi_queue_rq,
 	.complete	= scsi_complete,
-	.timeout	= scsi_timeout,
+	.timeout	= scsi_times_out,
 #ifdef CONFIG_BLK_DEBUG_FS
 	.show_rq	= scsi_show_rq,
 #endif
@@ -1941,7 +1933,7 @@ static const struct blk_mq_ops scsi_mq_ops = {
 	.queue_rq	= scsi_queue_rq,
 	.commit_rqs	= scsi_commit_rqs,
 	.complete	= scsi_complete,
-	.timeout	= scsi_timeout,
+	.timeout	= scsi_times_out,
 #ifdef CONFIG_BLK_DEBUG_FS
 	.show_rq	= scsi_show_rq,
 #endif
diff --git a/drivers/scsi/scsi_priv.h b/drivers/scsi/scsi_priv.h
index 5c4786310a31..8966f20b7d55 100644
--- a/drivers/scsi/scsi_priv.h
+++ b/drivers/scsi/scsi_priv.h
@@ -72,7 +72,8 @@ extern void scsi_exit_devinfo(void);
 
 /* scsi_error.c */
 extern void scmd_eh_abort_handler(struct work_struct *work);
-extern enum blk_eh_timer_return scsi_times_out(struct request *req);
+extern enum blk_eh_timer_return scsi_times_out(struct request *req,
+					       bool reserved);
 extern int scsi_error_handler(void *host);
 extern enum scsi_disposition scsi_decide_disposition(struct scsi_cmnd *cmd);
 extern void scsi_eh_wakeup(struct Scsi_Host *shost);
-- 
2.35.3

