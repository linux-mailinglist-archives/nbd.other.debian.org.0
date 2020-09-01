Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FBD259787
	for <lists+nbd@lfdr.de>; Tue,  1 Sep 2020 18:16:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6E72A20538; Tue,  1 Sep 2020 16:16:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  1 16:16:02 2020
Old-Return-Path: <BATV+00d723da4443b0556009+6218+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id ACDFC2051E
	for <lists-other-nbd@bendel.debian.org>; Tue,  1 Sep 2020 15:58:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.921 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zebwCTpsixAr for <lists-other-nbd@bendel.debian.org>;
	Tue,  1 Sep 2020 15:58:10 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4B8EA20534
	for <nbd@other.debian.org>; Tue,  1 Sep 2020 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JssZ/9cfFlKY9nXiXN1eWHNYfq2IqPkVO48PJ0G1HVM=; b=TsLN4Ki5H6wDqMT7EkDDmICR5s
	2ikY9tR6e67GKJEqjuS9L66bSUIo+pu5PYEAc9ljO3uyf6oMcNiepE5rzwUxhjE+/vnTmCPgENmda
	C0OeAfERJgyA7K8KeFysVlBHyF0BPeIG7el80V9O61CNCYuSKhfujxSQgjXJOjMOSEy03HwmPQuPh
	RJCdiSoEUrRAJIJ7z0BaLS8JSw/BmFlWFm/qiMtciExAsNyJHCr7Vvb8RIEQV1UW0Wnk6ZMFBndz3
	+EuD/g9pjFt/AGKn2OUIwLAq2rE5vGf6lWordEqx3jg+9VI6y7EPXjBeepMY6Nus8DQ6cZOSE4OGn
	R3KU2Xqg==;
Received: from [2001:4bb8:18c:45ba:2f95:e5:ca6b:9b4a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8fR-0004Op-3n; Tue, 01 Sep 2020 15:57:53 +0000
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
Subject: [PATCH 2/9] block: don't clear bd_invalidated in check_disk_size_change
Date: Tue,  1 Sep 2020 17:57:41 +0200
Message-Id: <20200901155748.2884-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901155748.2884-1-hch@lst.de>
References: <20200901155748.2884-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9L711-W_zW.A.53.CPnTfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/967
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200901155748.2884-3-hch@lst.de
Resent-Date: Tue,  1 Sep 2020 16:16:02 +0000 (UTC)

bd_invalidated is set by check_disk_change or in add_disk to initiate a
partition scan.  Move it from check_disk_size_change which is called
from both revalidate_disk() and bdev_disk_changed() to only the latter,
as that is what is called from the block device open code (and nbd) to
deal with the bd_invalidated event.  revalidate_disk() on the other hand
is mostly used to propagate a size update from the gendisk to the block
device, which is entirely unrelated.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/block_dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 08158bb2e76c85..2760292045c082 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1302,7 +1302,6 @@ static void check_disk_size_change(struct gendisk *disk,
 		}
 		i_size_write(bdev->bd_inode, disk_size);
 	}
-	bdev->bd_invalidated = 0;
 	spin_unlock(&bdev->bd_size_lock);
 
 	if (bdev_size > disk_size) {
@@ -1391,6 +1390,8 @@ int bdev_disk_changed(struct block_device *bdev, bool invalidate)
 
 	lockdep_assert_held(&bdev->bd_mutex);
 
+	bdev->bd_invalidated = 0;
+
 rescan:
 	ret = blk_drop_partitions(bdev);
 	if (ret)
-- 
2.28.0

