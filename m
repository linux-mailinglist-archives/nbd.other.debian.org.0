Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 35697855B80
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:21:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 236BE20941; Thu, 15 Feb 2024 07:21:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:21:40 2024
Old-Return-Path: <BATV+a252b21bd4a653ddb6e6+7480+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 159CC2063B
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:03:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WNKjE4vesmjq for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:03:31 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F0BD520C21
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ZigXghdw7FPPNjYPfgXfrl3xig0YzK0yTKopqAeqWSw=; b=HA7jzaYaYdXjkmYnaBpxilg6Ki
	11yS23O2NB33310yE7yq2DHhRzyVjlMvJzFaQfcKWMY8mYkc8fWZkQ9/He7H5SxX7lSUMxsDuYwLa
	Qa8VCCsWOZ4/f5VC8FR778/M60GJQe1w4dh2wulK2VYPkAwxr5ACuIUBiFh0i+TSzfK3AIW2x10g9
	hjQrIYwxwPO7GnCt5A9PLNbuS6KJ2zqhNtJehnxzKkW9qMxUapBapJD7BVxhHtfw/NUduY/mUAg3g
	ifUGS26f+7+G1THUMvGQrXDnxhCn1Ik48tvcQ8FPqJv3UV210Hwl8178ABpMxSPO8mPW2oT+tFON2
	loq7cLQg==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVm2-0000000FANr-02ZR;
	Thu, 15 Feb 2024 07:03:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Ming Lei <ming.lei@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH 01/17] ubd: pass queue_limits to blk_mq_alloc_disk
Date: Thu, 15 Feb 2024 08:02:44 +0100
Message-Id: <20240215070300.2200308-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215070300.2200308-1-hch@lst.de>
References: <20240215070300.2200308-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dZp37fZZG7C.A.st.EubzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2729
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-2-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:21:40 +0000 (UTC)

Pass the few limits ubd imposes directly to blk_mq_alloc_disk instead
of setting them one at a time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/um/drivers/ubd_kern.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index 25f1b18ce7d4e9..48e11f073551b4 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -881,6 +881,10 @@ static const struct blk_mq_ops ubd_mq_ops = {
 static int ubd_add(int n, char **error_out)
 {
 	struct ubd *ubd_dev = &ubd_devs[n];
+	struct queue_limits lim = {
+		.max_segments		= MAX_SG,
+		.seg_boundary_mask	= PAGE_SIZE - 1,
+	};
 	struct gendisk *disk;
 	int err = 0;
 
@@ -906,7 +910,7 @@ static int ubd_add(int n, char **error_out)
 	if (err)
 		goto out;
 
-	disk = blk_mq_alloc_disk(&ubd_dev->tag_set, NULL, ubd_dev);
+	disk = blk_mq_alloc_disk(&ubd_dev->tag_set, &lim, ubd_dev);
 	if (IS_ERR(disk)) {
 		err = PTR_ERR(disk);
 		goto out_cleanup_tags;
@@ -914,8 +918,6 @@ static int ubd_add(int n, char **error_out)
 	ubd_dev->queue = disk->queue;
 
 	blk_queue_write_cache(ubd_dev->queue, true, false);
-	blk_queue_max_segments(ubd_dev->queue, MAX_SG);
-	blk_queue_segment_boundary(ubd_dev->queue, PAGE_SIZE - 1);
 	err = ubd_disk_register(UBD_MAJOR, ubd_dev->size, n, disk);
 	if (err)
 		goto out_cleanup_disk;
-- 
2.39.2

