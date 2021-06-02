Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD8139839C
	for <lists+nbd@lfdr.de>; Wed,  2 Jun 2021 09:51:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 65EB8206CD; Wed,  2 Jun 2021 07:51:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  2 07:51:20 2021
Old-Return-Path: <BATV+e38fb55258da4e18a096+6492+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DD096206E2
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Jun 2021 07:35:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.13 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KstMcj4heyC2 for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Jun 2021 07:35:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 033E6206CD
	for <nbd@other.debian.org>; Wed,  2 Jun 2021 07:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Yi0gWgny8DlRPvb2CPLj2qpffFrZ3FaoaK+2w2W5Ero=; b=Ht4009yUCSzO+7+WkZSpPv8/pg
	DF4TuO/V/1LnprDJA3jlEhqFaXKBH7nFqyPlLMER9C4xGoA29+zO97djThq/H5WGD+qvf9L+NXUS+
	NF+wjIhh/npg/q4yZwzJ2XU8Rh/TBSfn+u/dM7E/U9YdPLNk9qDr3C//ieS4lZI5LRisQPRidcs0K
	1KxMYlyEV+r/yTnMeO4E9D5sjO0i2VDyXsAV0BqYgFAku1jAbz09LqX7rvILnxpnxFg/tBckuBSOC
	E+KSpkcLJ/UGUgdvZ89eU6BxLq+pC8HlqDRtF4O6vNTYENtcydGYMepxD+bizsH8Il7O6KAzLt54A
	NMGPi+1w==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKlS-0025JJ-Ew; Wed, 02 Jun 2021 06:54:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Tim Waugh <tim@cyberelk.net>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 03/30] blk-mq: add the blk_mq_alloc_disk APIs
Date: Wed,  2 Jun 2021 09:53:18 +0300
Message-Id: <20210602065345.355274-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aClLFy0LhkH.A.2tD.4hztgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1190
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210602065345.355274-4-hch@lst.de
Resent-Date: Wed,  2 Jun 2021 07:51:20 +0000 (UTC)

Add a new API to allocate a gendisk including the request_queue for use
with blk-mq based drivers.  This is to avoid boilerplate code in drivers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq.c         | 19 +++++++++++++++++++
 include/linux/blk-mq.h | 12 ++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 6112741e1ff9..1e6036e6fd66 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3137,6 +3137,25 @@ struct request_queue *blk_mq_init_queue(struct blk_mq_tag_set *set)
 }
 EXPORT_SYMBOL(blk_mq_init_queue);
 
+struct gendisk *__blk_mq_alloc_disk(struct blk_mq_tag_set *set, void *queuedata)
+{
+	struct request_queue *q;
+	struct gendisk *disk;
+
+	q = blk_mq_init_queue_data(set, queuedata);
+	if (IS_ERR(q))
+		return ERR_CAST(q);
+
+	disk = __alloc_disk_node(0, set->numa_node);
+	if (!disk) {
+		blk_cleanup_queue(q);
+		return ERR_PTR(-ENOMEM);
+	}
+	disk->queue = q;
+	return disk;
+}
+EXPORT_SYMBOL(__blk_mq_alloc_disk);
+
 /*
  * Helper for setting up a queue with mq ops, given queue depth, and
  * the passed in mq ops flags.
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 73750b2838d2..f496c6c5b5d2 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -426,6 +426,18 @@ enum {
 	((policy & ((1 << BLK_MQ_F_ALLOC_POLICY_BITS) - 1)) \
 		<< BLK_MQ_F_ALLOC_POLICY_START_BIT)
 
+#define blk_mq_alloc_disk(set, queuedata)				\
+({									\
+	static struct lock_class_key __key;				\
+	struct gendisk *__disk = __blk_mq_alloc_disk(set, queuedata);	\
+									\
+	if (__disk)							\
+		lockdep_init_map(&__disk->lockdep_map,			\
+			"(bio completion)", &__key, 0);			\
+	__disk;								\
+})
+struct gendisk *__blk_mq_alloc_disk(struct blk_mq_tag_set *set,
+		void *queuedata);
 struct request_queue *blk_mq_init_queue(struct blk_mq_tag_set *);
 struct request_queue *blk_mq_init_queue_data(struct blk_mq_tag_set *set,
 		void *queuedata);
-- 
2.30.2

