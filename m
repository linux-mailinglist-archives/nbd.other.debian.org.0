Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8FC39838A
	for <lists+nbd@lfdr.de>; Wed,  2 Jun 2021 09:48:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C2476206E7; Wed,  2 Jun 2021 07:48:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  2 07:48:20 2021
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
	by bendel.debian.org (Postfix) with ESMTP id A48A8206E2
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Jun 2021 07:32:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.13 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JuapEWnM9MHy for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Jun 2021 07:32:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5B8E0206CD
	for <nbd@other.debian.org>; Wed,  2 Jun 2021 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=yxB3CToEvB1AGII3Fhuj66pLyS4oXdc/Ax4ufYJhDmU=; b=2Ev1PQ3iAXTcAu7Nm/w91IlhBi
	XlySTC28St0acrPx9XgYMlbiWgHgwnXpAO7fssa+3RO6s6w1gNt/L0bRJxPAncGQ3wVJ/bZBHhsGL
	uVoo++YnZjLmVwV7/fA+A/a3WTVeZ7Iox3GoTmd7i9BvdmfF+QzgThe8cp3OM151RtbpSjuGYv1qk
	Z49auwfLnjtdi4znRE+V/2lHNnnW9JmtU9bmCTyqdsOZLGP/YzUu+pzLr8O4OJgs++QcKu78dpSPH
	xBu4qqzNSfKG6LxxIT8EjfGs2NvFuwBi/8BGzrjd39Z06zSSm1tbNqLwSjr7IrytRt6ttKelR32cD
	obDFH8eg==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKmM-0025j3-HR; Wed, 02 Jun 2021 06:55:03 +0000
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
Subject: [PATCH 15/30] blk-mq: remove blk_mq_init_sq_queue
Date: Wed,  2 Jun 2021 09:53:30 +0300
Message-Id: <20210602065345.355274-16-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602065345.355274-1-hch@lst.de>
References: <20210602065345.355274-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Y6rY93orgvO.A.iSD.EfztgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1185
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210602065345.355274-16-hch@lst.de
Resent-Date: Wed,  2 Jun 2021 07:48:20 +0000 (UTC)

All users are gone now.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-mq.c         | 22 ----------------------
 include/linux/blk-mq.h |  4 ----
 2 files changed, 26 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 1e6036e6fd66..25e25177c2b1 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3156,28 +3156,6 @@ struct gendisk *__blk_mq_alloc_disk(struct blk_mq_tag_set *set, void *queuedata)
 }
 EXPORT_SYMBOL(__blk_mq_alloc_disk);
 
-/*
- * Helper for setting up a queue with mq ops, given queue depth, and
- * the passed in mq ops flags.
- */
-struct request_queue *blk_mq_init_sq_queue(struct blk_mq_tag_set *set,
-					   const struct blk_mq_ops *ops,
-					   unsigned int queue_depth,
-					   unsigned int set_flags)
-{
-	struct request_queue *q;
-	int ret;
-
-	ret = blk_mq_alloc_sq_tag_set(set, ops, queue_depth, set_flags);
-	if (ret)
-		return ERR_PTR(ret);
-	q = blk_mq_init_queue(set);
-	if (IS_ERR(q))
-		blk_mq_free_tag_set(set);
-	return q;
-}
-EXPORT_SYMBOL(blk_mq_init_sq_queue);
-
 static struct blk_mq_hw_ctx *blk_mq_alloc_and_init_hctx(
 		struct blk_mq_tag_set *set, struct request_queue *q,
 		int hctx_idx, int node)
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index f496c6c5b5d2..02a4aab0aeac 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -443,10 +443,6 @@ struct request_queue *blk_mq_init_queue_data(struct blk_mq_tag_set *set,
 		void *queuedata);
 int blk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
 		struct request_queue *q);
-struct request_queue *blk_mq_init_sq_queue(struct blk_mq_tag_set *set,
-						const struct blk_mq_ops *ops,
-						unsigned int queue_depth,
-						unsigned int set_flags);
 void blk_mq_unregister_dev(struct device *, struct request_queue *);
 
 int blk_mq_alloc_tag_set(struct blk_mq_tag_set *set);
-- 
2.30.2

