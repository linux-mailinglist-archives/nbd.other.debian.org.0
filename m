Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA9E3E2D18
	for <lists+nbd@lfdr.de>; Fri,  6 Aug 2021 17:03:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D034320630; Fri,  6 Aug 2021 15:03:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug  6 15:03:08 2021
Old-Return-Path: <pkalever@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8911C205AD
	for <lists-other-nbd@bendel.debian.org>; Fri,  6 Aug 2021 14:45:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.355 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.474,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id leVb-mqjXVEr for <lists-other-nbd@bendel.debian.org>;
	Fri,  6 Aug 2021 14:45:24 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 585192058A
	for <nbd@other.debian.org>; Fri,  6 Aug 2021 14:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628261119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gSnu/aP1K8BTE584PRmDJjSK8aJMHAFLzkH76oZhIvE=;
	b=W8FXLf2hY+7QcYLAdjAC4mpSYr8JRYg57OifHjPyZ2b0+hj40sX12KPKPpoLXxergp0Q94
	5epLbjwR7phupg5V6MJ0/2UR3L94hLJSWXmbmGz8DjLn2B5Do0n4sNztW6+O0j7ePGXfzI
	9o5uJpumMAhbrWJoWvl4ET+hF30rgOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-nqPHld96Ndqnq_rJmeQIow-1; Fri, 06 Aug 2021 10:29:48 -0400
X-MC-Unique: nqPHld96Ndqnq_rJmeQIow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8950A87D543;
	Fri,  6 Aug 2021 14:29:46 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.40.192.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 899DB5D9D5;
	Fri,  6 Aug 2021 14:29:42 +0000 (UTC)
From: pkalever@redhat.com
To: linux-kernel@vger.kernel.org
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	josef@toxicpanda.com,
	axboe@kernel.dk,
	idryomov@redhat.com,
	xiubli@redhat.com,
	Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
Subject: [PATCH v1 1/2] block: cleanup: define default command timeout and use it
Date: Fri,  6 Aug 2021 19:59:13 +0530
Message-Id: <20210806142914.70556-2-pkalever@redhat.com>
In-Reply-To: <20210806142914.70556-1-pkalever@redhat.com>
References: <20210806142914.70556-1-pkalever@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vazpGQjr_LJ.A.FFF.s8UDhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1242
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210806142914.70556-2-pkalever@redhat.com
Resent-Date: Fri,  6 Aug 2021 15:03:08 +0000 (UTC)

From: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>

defined BLK_DEFAULT_CMD_TIMEOUT and reuse it everywhere else.

Signed-off-by: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
---
 block/blk-mq.c         | 2 +-
 drivers/block/nbd.c    | 2 +-
 include/linux/blkdev.h | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 2c4ac51e54eb..1cba91eca6ee 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3289,7 +3289,7 @@ int blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 		goto err_hctxs;
 
 	INIT_WORK(&q->timeout_work, blk_mq_timeout_work);
-	blk_queue_rq_timeout(q, set->timeout ? set->timeout : 30 * HZ);
+	blk_queue_rq_timeout(q, set->timeout ? set->timeout : BLK_DEFAULT_CMD_TIMEOUT);
 
 	q->tag_set = set;
 
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index c38317979f74..16a1a14b1fd1 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1376,7 +1376,7 @@ static void nbd_set_cmd_timeout(struct nbd_device *nbd, u64 timeout)
 	if (timeout)
 		blk_queue_rq_timeout(nbd->disk->queue, timeout * HZ);
 	else
-		blk_queue_rq_timeout(nbd->disk->queue, 30 * HZ);
+		blk_queue_rq_timeout(nbd->disk->queue, BLK_DEFAULT_CMD_TIMEOUT);
 }
 
 /* Must be called with config_lock held */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index d3afea47ade6..e50a9a5356d3 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -378,6 +378,8 @@ static inline int blkdev_zone_mgmt_ioctl(struct block_device *bdev,
 
 #endif /* CONFIG_BLK_DEV_ZONED */
 
+#define BLK_DEFAULT_CMD_TIMEOUT	(30*HZ) /* 30 seconds */
+
 struct request_queue {
 	struct request		*last_merge;
 	struct elevator_queue	*elevator;
-- 
2.31.1

