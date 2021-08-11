Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0416D3E922A
	for <lists+nbd@lfdr.de>; Wed, 11 Aug 2021 15:04:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B056F20330; Wed, 11 Aug 2021 13:04:29 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 11 13:04:29 2021
Old-Return-Path: <BATV+fa63ca7dd370ca608068+6562+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8DD4120304
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Aug 2021 12:48:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.031 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bGAGVE2C6X4a for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Aug 2021 12:48:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 47F5C2030F
	for <nbd@other.debian.org>; Wed, 11 Aug 2021 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=q/VvVJUMkdBIfrc0PPP11iXE8LXtzuS50Q4GKM+wD9c=; b=itbuFHCdi3odw54JKxJKEMfdu6
	8sl5XDmB34Tj82npYwE6YJwOlhIKDDMMP7k5qXOGnNRqhAgWGlFHq0r61Ez4CXC5yw6avg83AeYnU
	OZUK7rgQ9hfqGe6v+mDBL6ha8PkxyfMgy1BoudsR6XNFVCGHjbL1Qb5sRwdR7JQFd1iM8Nn2L/eV3
	9UgBc6FbdefRfAdKKyOl5YtNkkPJGuAhVzBC8DyR9W3s3/YUz6sBKB3hClJMRPk6mx18uS8JVIgB3
	fKo5pmEDK6wPmTeCDNtDxoKgbjXcqGqoZMG1nJU7OHjaxCHKojPsLhnn5Ib4VUiEEA8k1QDWfczrj
	A/bT2T6g==;
Received: from [2001:4bb8:184:6215:7ee3:d0e9:131a:82ff] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDndQ-00DPwU-H3; Wed, 11 Aug 2021 12:47:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Tao <houtao1@huawei.com>
Subject: [PATCH 3/6] nbd: remove nbd_del_disk
Date: Wed, 11 Aug 2021 14:44:25 +0200
Message-Id: <20210811124428.2368491-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811124428.2368491-1-hch@lst.de>
References: <20210811124428.2368491-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3QE14GomNiL.A.LGG.dr8EhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1267
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210811124428.2368491-4-hch@lst.de
Resent-Date: Wed, 11 Aug 2021 13:04:29 +0000 (UTC)

Fold nbd_del_disk and remove the pointless NULL check on ->disk given
that it is always set for a successfully allocated nbd_device structure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 6caf26b84a5b..de8b23af2486 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -235,17 +235,6 @@ static const struct device_attribute backend_attr = {
 	.show = backend_show,
 };
 
-static void nbd_del_disk(struct nbd_device *nbd)
-{
-	struct gendisk *disk = nbd->disk;
-
-	if (disk) {
-		del_gendisk(disk);
-		blk_cleanup_disk(disk);
-		blk_mq_free_tag_set(&nbd->tag_set);
-	}
-}
-
 /*
  * Place this in the last just before the nbd is freed to
  * make sure that the disk and the related kobject are also
@@ -261,7 +250,11 @@ static void nbd_notify_destroy_completion(struct nbd_device *nbd)
 
 static void nbd_dev_remove(struct nbd_device *nbd)
 {
-	nbd_del_disk(nbd);
+	struct gendisk *disk = nbd->disk;
+
+	del_gendisk(disk);
+	blk_cleanup_disk(disk);
+	blk_mq_free_tag_set(&nbd->tag_set);
 
 	/*
 	 * Remove from idr after del_gendisk() completes, so if the same ID is
-- 
2.30.2

