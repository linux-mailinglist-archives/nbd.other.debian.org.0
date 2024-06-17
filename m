Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4315290A5A1
	for <lists+nbd@lfdr.de>; Mon, 17 Jun 2024 08:26:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2650B21205; Mon, 17 Jun 2024 06:26:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 17 06:26:31 2024
Old-Return-Path: <BATV+625ba2f6da96caf54eae+7603+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A09CC2118C
	for <lists-other-nbd@bendel.debian.org>; Mon, 17 Jun 2024 06:07:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.061 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IFRLah9Y0vzp for <lists-other-nbd@bendel.debian.org>;
	Mon, 17 Jun 2024 06:07:12 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E0B0321188
	for <nbd@other.debian.org>; Mon, 17 Jun 2024 06:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=dPSH4Z18hgBewwqMgLsN2I7WWNT3sMh//IxSNM9UAJw=; b=K/Vv+hFa9Nyaj6c0dtkqikBt6w
	qq2YIoW9lbQTXNs1QZwCu3TJ0gdb1aTGMI/jJDciD0rCDzMo0YBbpIemac2/yg9z1vzk7PHL+Cu21
	hJaAxq4kQMhKmbucck4hfChvPCpVtcHay9f22jj0UEcEQfgYSC4Wqppdr6tM3ho8Qv3Y/Nav4AdiD
	/nqRXJ+/kKq1QJenk4YubPhiXsBeihmEBorMr5EfalN28KRiAoHA9Pc+NO5mqBR0ojItSGvxPwPlD
	FZsTI3i1oePhkKFKVmc7hq1+qX5E0tjVsVmdcjwIlRFF/eDyHTREetqP/tz+7XIOrhzRREm7pFrTG
	SNkrcFPg==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5W3-00000009JFp-161h;
	Mon, 17 Jun 2024 06:06:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: [PATCH 25/26] block: move the skip_tagset_quiesce flag to queue_limits
Date: Mon, 17 Jun 2024 08:04:52 +0200
Message-ID: <20240617060532.127975-26-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6ZH--iw-Ie.A.zjYD.Xc9bmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3038
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240617060532.127975-26-hch@lst.de
Resent-Date: Mon, 17 Jun 2024 06:26:31 +0000 (UTC)

Move the skip_tagset_quiesce flag into the queue_limits feature field so
that it can be set atomically with the queue frozen.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 block/blk-mq-debugfs.c   | 1 -
 drivers/nvme/host/core.c | 8 +++++---
 include/linux/blkdev.h   | 6 ++++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/block/blk-mq-debugfs.c b/block/blk-mq-debugfs.c
index 8b5a68861c119b..344f9e503bdb32 100644
--- a/block/blk-mq-debugfs.c
+++ b/block/blk-mq-debugfs.c
@@ -93,7 +93,6 @@ static const char *const blk_queue_flag_name[] = {
 	QUEUE_FLAG_NAME(RQ_ALLOC_TIME),
 	QUEUE_FLAG_NAME(HCTX_ACTIVE),
 	QUEUE_FLAG_NAME(SQ_SCHED),
-	QUEUE_FLAG_NAME(SKIP_TAGSET_QUIESCE),
 };
 #undef QUEUE_FLAG_NAME
 
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 31e752e8d632cd..bf410d10b12006 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -4489,13 +4489,15 @@ int nvme_alloc_io_tag_set(struct nvme_ctrl *ctrl, struct blk_mq_tag_set *set,
 		return ret;
 
 	if (ctrl->ops->flags & NVME_F_FABRICS) {
-		ctrl->connect_q = blk_mq_alloc_queue(set, NULL, NULL);
+		struct queue_limits lim = {
+			.features	= BLK_FEAT_SKIP_TAGSET_QUIESCE,
+		};
+
+		ctrl->connect_q = blk_mq_alloc_queue(set, &lim, NULL);
         	if (IS_ERR(ctrl->connect_q)) {
 			ret = PTR_ERR(ctrl->connect_q);
 			goto out_free_tag_set;
 		}
-		blk_queue_flag_set(QUEUE_FLAG_SKIP_TAGSET_QUIESCE,
-				   ctrl->connect_q);
 	}
 
 	ctrl->tagset = set;
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index ab0f7dfba556eb..2c433ebf6f2030 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -322,6 +322,9 @@ enum {
 
 	/* supports PCI(e) p2p requests */
 	BLK_FEAT_PCI_P2PDMA			= (1u << 12),
+
+	/* skip this queue in blk_mq_(un)quiesce_tagset */
+	BLK_FEAT_SKIP_TAGSET_QUIESCE		= (1u << 13),
 };
 
 /*
@@ -594,7 +597,6 @@ struct request_queue {
 #define QUEUE_FLAG_RQ_ALLOC_TIME 27	/* record rq->alloc_time_ns */
 #define QUEUE_FLAG_HCTX_ACTIVE	28	/* at least one blk-mq hctx is active */
 #define QUEUE_FLAG_SQ_SCHED     30	/* single queue style io dispatch */
-#define QUEUE_FLAG_SKIP_TAGSET_QUIESCE	31 /* quiesce_tagset skip the queue*/
 
 #define QUEUE_FLAG_MQ_DEFAULT	(1UL << QUEUE_FLAG_SAME_COMP)
 
@@ -629,7 +631,7 @@ bool blk_queue_flag_test_and_set(unsigned int flag, struct request_queue *q);
 #define blk_queue_registered(q)	test_bit(QUEUE_FLAG_REGISTERED, &(q)->queue_flags)
 #define blk_queue_sq_sched(q)	test_bit(QUEUE_FLAG_SQ_SCHED, &(q)->queue_flags)
 #define blk_queue_skip_tagset_quiesce(q) \
-	test_bit(QUEUE_FLAG_SKIP_TAGSET_QUIESCE, &(q)->queue_flags)
+	((q)->limits.features & BLK_FEAT_SKIP_TAGSET_QUIESCE)
 
 extern void blk_set_pm_only(struct request_queue *q);
 extern void blk_clear_pm_only(struct request_queue *q);
-- 
2.43.0

