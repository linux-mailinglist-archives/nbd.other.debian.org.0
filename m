Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 725A1A0383B
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 07:55:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 58F59206DB; Tue,  7 Jan 2025 06:55:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 06:55:32 2025
Old-Return-Path: <BATV+ca79fa4415f544dfc9f5+7807+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5424E20598
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 06:31:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.151 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id o4URwMBPBRHV for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 06:31:47 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5ACF72060F
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 06:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=a8AkwchBZAjJWtrY4RK7VKovX+Wf21I567Bat+cuJTY=; b=aeMnUBD/8o4mvdTJ00kxg3CPq3
	l6SQRlA1VspG9tc+XKh3piZjFvxwACqm2lrjCspqEPKfky79zlAYUbI5RrznlZ11m3ctkxbIyA/gF
	puREtODgxWCGeYNL7qDY6dsBELstwZkSq38Trvxg874HpikFXVjYaKS3GQwByoVbxaAzFYfSfj0/k
	X8cqGpYcXcq/M5oJSi+emsvhBrj/Hatya/CQWT9CN0xV4hYXQw6JsUxrbg08OJX1N667IcAX5JavG
	4yX6OM6r89gvyH1vLYq2uvYjTDJDAtr8z7TjO5tCEimhoGelmr05UIbTt8rxnd7+jUW7f6Yp45GGJ
	dEx9+oww==;
Received: from 2a02-8389-2341-5b80-d467-d75d-35bf-0eb6.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d467:d75d:35bf:eb6] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tV37s-00000003dyf-2phg;
	Tue, 07 Jan 2025 06:31:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	nbd@other.debian.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: [PATCH 6/8] nvme: fix queue freeze vs limits lock order
Date: Tue,  7 Jan 2025 07:30:38 +0100
Message-ID: <20250107063120.1011593-7-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107063120.1011593-1-hch@lst.de>
References: <20250107063120.1011593-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7m-VB3oeWbD.A.d41E.k_MfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3242
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250107063120.1011593-7-hch@lst.de
Resent-Date: Tue,  7 Jan 2025 06:55:32 +0000 (UTC)

Match the locking order used by the core block code by only freezing
the queue after taking the limits lock.

Unlike most queue updates this does not use the
queue_limits_commit_update_frozen helper as the nvme driver want the
queue frozen for more than just the limits update.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index c2250ddef5a2..1ccf17f6ea7f 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2128,9 +2128,10 @@ static int nvme_update_ns_info_generic(struct nvme_ns *ns,
 	struct queue_limits lim;
 	int ret;
 
-	blk_mq_freeze_queue(ns->disk->queue);
 	lim = queue_limits_start_update(ns->disk->queue);
 	nvme_set_ctrl_limits(ns->ctrl, &lim);
+
+	blk_mq_freeze_queue(ns->disk->queue);
 	ret = queue_limits_commit_update(ns->disk->queue, &lim);
 	set_disk_ro(ns->disk, nvme_ns_is_readonly(ns, info));
 	blk_mq_unfreeze_queue(ns->disk->queue);
@@ -2177,12 +2178,12 @@ static int nvme_update_ns_info_block(struct nvme_ns *ns,
 			goto out;
 	}
 
+	lim = queue_limits_start_update(ns->disk->queue);
+
 	blk_mq_freeze_queue(ns->disk->queue);
 	ns->head->lba_shift = id->lbaf[lbaf].ds;
 	ns->head->nuse = le64_to_cpu(id->nuse);
 	capacity = nvme_lba_to_sect(ns->head, le64_to_cpu(id->nsze));
-
-	lim = queue_limits_start_update(ns->disk->queue);
 	nvme_set_ctrl_limits(ns->ctrl, &lim);
 	nvme_configure_metadata(ns->ctrl, ns->head, id, nvm, info);
 	nvme_set_chunk_sectors(ns, id, &lim);
@@ -2285,6 +2286,7 @@ static int nvme_update_ns_info(struct nvme_ns *ns, struct nvme_ns_info *info)
 		struct queue_limits *ns_lim = &ns->disk->queue->limits;
 		struct queue_limits lim;
 
+		lim = queue_limits_start_update(ns->head->disk->queue);
 		blk_mq_freeze_queue(ns->head->disk->queue);
 		/*
 		 * queue_limits mixes values that are the hardware limitations
@@ -2301,7 +2303,6 @@ static int nvme_update_ns_info(struct nvme_ns *ns, struct nvme_ns_info *info)
 		 * the splitting limits in to make sure we still obey possibly
 		 * lower limitations of other controllers.
 		 */
-		lim = queue_limits_start_update(ns->head->disk->queue);
 		lim.logical_block_size = ns_lim->logical_block_size;
 		lim.physical_block_size = ns_lim->physical_block_size;
 		lim.io_min = ns_lim->io_min;
-- 
2.45.2

