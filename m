Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA225978C
	for <lists+nbd@lfdr.de>; Tue,  1 Sep 2020 18:16:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CB46C20511; Tue,  1 Sep 2020 16:16:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  1 16:16:43 2020
Old-Return-Path: <BATV+00d723da4443b0556009+6218+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7C483204F3
	for <lists-other-nbd@bendel.debian.org>; Tue,  1 Sep 2020 15:58:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.921 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RF26Usz4CCwz for <lists-other-nbd@bendel.debian.org>;
	Tue,  1 Sep 2020 15:58:20 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 068D9204EA
	for <nbd@other.debian.org>; Tue,  1 Sep 2020 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YEpQxN/tPsUCQFZoeqkrzaPHhhl8x81h/vM0+OyoL28=; b=jH0wC/gLb4OEfKTPkMKn4/dwIB
	06OVZMsHWVv/8Ms5vHWtqbTepow87YxpfqdfzYvT8ngNVJWvmGyH+d3oWmigSSoF1/U8bWSw87zoj
	R7WHGvxsM+OYDjT8alV54CgTTC2LTLkX4FklDK0cOp6L2CfU3NF/Uz4QfqZrf3hrYjavcdH1O3IPt
	yWkaAefpWZnYievyIqsT0JwcH/F105z9MikBVHa3n2TqnYa/Rv7Ee1nknCwck4ProTZ8WWldT08x4
	ugsxov6xkqNTiwoKWr18ACNEGfX/ofsRGcs/7PECZtJcFhzLkuJXENLWc35VlThOG6sV0pnbdb9LA
	uMBE2png==;
Received: from [2001:4bb8:18c:45ba:2f95:e5:ca6b:9b4a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8fe-0004S0-Bi; Tue, 01 Sep 2020 15:58:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Josef Bacik <josef@toxicpanda.com>,
	Dan Williams <dan.j.williams@intel.com>,
	dm-devel@redhat.com,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-raid@vger.kernel.org,
	linux-nvdimm@lists.01.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 9/9] block: remove revalidate_disk()
Date: Tue,  1 Sep 2020 17:57:48 +0200
Message-Id: <20200901155748.2884-10-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901155748.2884-1-hch@lst.de>
References: <20200901155748.2884-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_j-vSTRVKjO.A.8FB.rPnTfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/971
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200901155748.2884-10-hch@lst.de
Resent-Date: Tue,  1 Sep 2020 16:16:43 +0000 (UTC)

Remove the now unused helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/md.h       |  2 +-
 fs/block_dev.c        | 19 -------------------
 include/linux/genhd.h |  1 -
 3 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/md/md.h b/drivers/md/md.h
index d9c4e6b7e9398d..f9e2ccdd22c478 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -397,7 +397,7 @@ struct mddev {
 	 * These locks are separate due to conflicting interactions
 	 * with bdev->bd_mutex.
 	 * Lock ordering is:
-	 *  reconfig_mutex -> bd_mutex : e.g. do_md_run -> revalidate_disk
+	 *  reconfig_mutex -> bd_mutex
 	 *  bd_mutex -> open_mutex:  e.g. __blkdev_get -> md_open
 	 */
 	struct mutex			open_mutex;
diff --git a/fs/block_dev.c b/fs/block_dev.c
index 85f013315d48b3..0771836d0220bd 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1339,25 +1339,6 @@ void revalidate_disk_size(struct gendisk *disk, bool verbose)
 }
 EXPORT_SYMBOL(revalidate_disk_size);
 
-/**
- * revalidate_disk - wrapper for lower-level driver's revalidate_disk call-back
- * @disk: struct gendisk to be revalidated
- *
- * This routine is a wrapper for lower-level driver's revalidate_disk
- * call-backs.  It is used to do common pre and post operations needed
- * for all revalidate_disk operations.
- */
-int revalidate_disk(struct gendisk *disk)
-{
-	int ret = 0;
-
-	if (disk->fops->revalidate_disk)
-		ret = disk->fops->revalidate_disk(disk);
-	revalidate_disk_size(disk, ret == 0);
-	return ret;
-}
-EXPORT_SYMBOL(revalidate_disk);
-
 /*
  * This routine checks whether a removable media has been changed,
  * and invalidates all buffer-cache-entries in that case. This
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index c340b392452ce6..2cdc41a3fb6a57 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -372,7 +372,6 @@ extern void blk_unregister_region(dev_t devt, unsigned long range);
 int register_blkdev(unsigned int major, const char *name);
 void unregister_blkdev(unsigned int major, const char *name);
 
-int revalidate_disk(struct gendisk *disk);
 void revalidate_disk_size(struct gendisk *disk, bool verbose);
 int check_disk_change(struct block_device *bdev);
 int __invalidate_device(struct block_device *bdev, bool kill_dirty);
-- 
2.28.0

