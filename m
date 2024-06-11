Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F1C90314F
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2024 07:37:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CD5232060A; Tue, 11 Jun 2024 05:37:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 05:37:18 2024
Old-Return-Path: <BATV+2fedbe304aabaf399917+7597+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DB3102057A
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2024 05:20:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.061 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LlRbwHRNP5S9 for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2024 05:20:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F21452056A
	for <nbd@other.debian.org>; Tue, 11 Jun 2024 05:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ssio61bxvyjbVvX4GR2JkhWcuVQT+rCdDVvaw5rJLVc=; b=EJfeUdDKwEweKUiqH+eMopsdVZ
	x0gPUHB6qGWFYwZZXoBfv6LI+X2dpdCL1TKhBlBBGZmhekTG11CsY1Tp8gFm1z77BgnAggRFyPHtv
	/dS9x1QJgeNzRrx5rQgmApC3kW21NnhiRIEaqoJzqGn3bNpz/08IyT53p4q+cqbxaW2iE/+UsRzno
	ybACNAR9eGBjFjHk1OhTQhWhdG1r7xhSZGewPFQ+tjMcJUiDtfg4DFIXSmxBMyXPF8Somg+Z608jF
	modWNKz1rFqGQflCfEdrX2jtnU5vYnXih6AoW/RLdg3bhHrcGssn0BCXi6xxJfpGEC4cpZmmzl8lq
	/NJxmiHw==;
Received: from 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtvC-00000007QuL-20ql;
	Tue, 11 Jun 2024 05:19:51 +0000
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
	linux-block@vger.kernel.org
Subject: [PATCH 06/26] loop: also use the default block size from an underlying block device
Date: Tue, 11 Jun 2024 07:19:06 +0200
Message-ID: <20240611051929.513387-7-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <I8nVGdgTiZB.A.KhTJ.OK-ZmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2897
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240611051929.513387-7-hch@lst.de
Resent-Date: Tue, 11 Jun 2024 05:37:18 +0000 (UTC)

Fix the code in loop_reconfigure_limits to pick a default block size for
O_DIRECT file descriptors to also work when the loop device sits on top
of a block device and not just on a regular file on a block device based
file system.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 4f6d8514d19bd6..d7cf6bbbfb1b86 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -988,10 +988,16 @@ static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
 {
 	struct file *file = lo->lo_backing_file;
 	struct inode *inode = file->f_mapping->host;
+	struct block_device *backing_bdev = NULL;
 	struct queue_limits lim;
 
+	if (S_ISBLK(inode->i_mode))
+		backing_bdev = I_BDEV(inode);
+	else if (inode->i_sb->s_bdev)
+		backing_bdev = inode->i_sb->s_bdev;
+
 	if (!bsize)
-		bsize = loop_default_blocksize(lo, inode->i_sb->s_bdev);
+		bsize = loop_default_blocksize(lo, backing_bdev);
 
 	lim = queue_limits_start_update(lo->lo_queue);
 	lim.logical_block_size = bsize;
-- 
2.43.0

