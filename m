Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CC26986CC34
	for <lists+nbd@lfdr.de>; Thu, 29 Feb 2024 15:57:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B15312093B; Thu, 29 Feb 2024 14:57:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 29 14:57:39 2024
Old-Return-Path: <BATV+ba4d12e182ac9dd248a8+7494+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 31C1520673
	for <lists-other-nbd@bendel.debian.org>; Thu, 29 Feb 2024 14:39:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.161 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pkgUZOAbXaKB for <lists-other-nbd@bendel.debian.org>;
	Thu, 29 Feb 2024 14:39:18 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D8D8120678
	for <nbd@other.debian.org>; Thu, 29 Feb 2024 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=QJzXdMVMj/zE5xp/XtEAbR9lvP5zyixzjCOJuZCm9tw=; b=obrk09l8xvSV6j+flbBYIB7XlT
	i4xB9MHcbN8j4lLUXt1LR/34QC3KaQJsLTrLTI1DivYjtouc+mKFNNh5qXvmCGt/d+nnXRNs8wJCr
	9R+V0D8RluGAbT5JY0vgA8LgTnJ62orH4N+xjqbYWXiiMyQtuUar47pS7QTD4vg3DaWMMlQbBHarO
	4b8lzctbvqz8LVUFeBVpFgAYvFp2e61Q9Wk8tUkJ3BUrz/hXCoadNsgqlI7xp/M2cKezGaw9poJ33
	fqka59rEGKAZuyC298Elw64k2zBzM+wbBPa+QN9aOBM1bj0uGrlZoV8mAgK1cMkpFZivY59anmwFT
	1LlORHPw==;
Received: from [216.9.110.7] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhYz-0000000Dtl9-1IUO;
	Thu, 29 Feb 2024 14:39:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH 2/3] nbd: freeze the queue for queue limits updates
Date: Thu, 29 Feb 2024 06:38:45 -0800
Message-Id: <20240229143846.1047223-3-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240229143846.1047223-1-hch@lst.de>
References: <20240229143846.1047223-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <t5-tgTSm17C.A.FiE.jtJ4lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2776
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240229143846.1047223-3-hch@lst.de
Resent-Date: Thu, 29 Feb 2024 14:57:39 +0000 (UTC)

nbd currently updates the logical and physical block sizes as well
as the discard_sectors on a live queue.  Freeze the queue first to
make sure there are not commands in flight that can see torn or
inconsistent limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 384750d5259fb8..22ee0ed9aa6db0 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -316,7 +316,7 @@ static void nbd_mark_nsock_dead(struct nbd_device *nbd, struct nbd_sock *nsock,
 	nsock->sent = 0;
 }
 
-static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
+static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		loff_t blksize)
 {
 	if (!blksize)
@@ -348,6 +348,18 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 	return 0;
 }
 
+static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
+		loff_t blksize)
+{
+	int error;
+
+	blk_mq_freeze_queue(nbd->disk->queue);
+	error = __nbd_set_size(nbd, bytesize, blksize);
+	blk_mq_unfreeze_queue(nbd->disk->queue);
+
+	return error;
+}
+
 static void nbd_complete_rq(struct request *req)
 {
 	struct nbd_cmd *cmd = blk_mq_rq_to_pdu(req);
-- 
2.39.2

