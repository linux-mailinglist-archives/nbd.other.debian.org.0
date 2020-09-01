Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B55725978A
	for <lists+nbd@lfdr.de>; Tue,  1 Sep 2020 18:16:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0695120536; Tue,  1 Sep 2020 16:16:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  1 16:16:23 2020
Old-Return-Path: <BATV+00d723da4443b0556009+6218+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EE0C0204EA
	for <lists-other-nbd@bendel.debian.org>; Tue,  1 Sep 2020 15:58:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.921 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id O2cnO5GxweKs for <lists-other-nbd@bendel.debian.org>;
	Tue,  1 Sep 2020 15:58:12 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 86FAB20535
	for <nbd@other.debian.org>; Tue,  1 Sep 2020 15:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YMlFrJEyBw+GGxYkmnybpKhHqx0sfDNv5s7PaPhHxwU=; b=Gd9YLKEUh+L4SFkaUhbHG3M8dD
	CML4P2q8lRLBgi2V/zqNZbsMdET9SOcLwrXiQhlC89FsEOhv4JJUVlczC5tz1NVFJGPZUGNw0mpN5
	qzMVcmbfdKTrImeYfVqLp70KKyuHY1d2ubXJy5DbmFDTX/vqy+og9g1EbJ/6WSVHl1eU8SSA2z/HI
	ytc8BoebmRFkeg1tryurIuFiGvIV6ETH0Mg6xVt+XrjRDBbOJe+pEs56+koko8zHmKVzoDwGo8HoE
	qpYFiFPkZtW/ERm5Tm+y4EKezU04PHf7JUWHAb6eJCibEvzWG7ZWLoJFdHCtl/sk7HYfM9oltIJYO
	AW3zTaqw==;
Received: from [2001:4bb8:18c:45ba:2f95:e5:ca6b:9b4a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8fZ-0004Qh-74; Tue, 01 Sep 2020 15:58:01 +0000
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
Subject: [PATCH 6/9] nvme: opencode revalidate_disk in nvme_validate_ns
Date: Tue,  1 Sep 2020 17:57:45 +0200
Message-Id: <20200901155748.2884-7-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901155748.2884-1-hch@lst.de>
References: <20200901155748.2884-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8JlLgMHlY3H.A._7.WPnTfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/969
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200901155748.2884-7-hch@lst.de
Resent-Date: Tue,  1 Sep 2020 16:16:23 +0000 (UTC)

Keep control in the NVMe driver instead of going through an indirect
call back into ->revalidate_disk.  Also reorder the function a bit to be
easier to follow with the additional code.

And now that we have removed all callers of revalidate_disk() in the nvme
code, ->revalidate_disk is only called from the open code when first
opening the device.  Which is of course totally pointless as we have
a valid size since the initial scan, and will get an updated view
through the asynchronous notifiation everytime the size changes.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/core.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index bc18523774b4be..9428e7deb68b09 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2323,7 +2323,6 @@ static const struct block_device_operations nvme_fops = {
 	.open		= nvme_open,
 	.release	= nvme_release,
 	.getgeo		= nvme_getgeo,
-	.revalidate_disk= nvme_revalidate_disk,
 	.report_zones	= nvme_report_zones,
 	.pr_ops		= &nvme_pr_ops,
 };
@@ -4020,14 +4019,19 @@ static void nvme_ns_remove_by_nsid(struct nvme_ctrl *ctrl, u32 nsid)
 static void nvme_validate_ns(struct nvme_ctrl *ctrl, unsigned nsid)
 {
 	struct nvme_ns *ns;
+	int ret;
 
 	ns = nvme_find_get_ns(ctrl, nsid);
-	if (ns) {
-		if (revalidate_disk(ns->disk))
-			nvme_ns_remove(ns);
-		nvme_put_ns(ns);
-	} else
+	if (!ns) {
 		nvme_alloc_ns(ctrl, nsid);
+		return;
+	}
+
+	ret = nvme_revalidate_disk(ns->disk);
+	revalidate_disk_size(ns->disk, ret == 0);
+	if (ret)
+		nvme_ns_remove(ns);
+	nvme_put_ns(ns);
 }
 
 static void nvme_remove_invalid_namespaces(struct nvme_ctrl *ctrl,
-- 
2.28.0

