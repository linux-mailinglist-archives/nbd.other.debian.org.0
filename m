Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C375903143
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2024 07:36:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4A8F120580; Tue, 11 Jun 2024 05:36:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 05:36:21 2024
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
	by bendel.debian.org (Postfix) with ESMTP id 788F7205DE
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2024 05:20:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.061 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bSX0XNcw0M2i for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2024 05:19:59 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 653522057A
	for <nbd@other.debian.org>; Tue, 11 Jun 2024 05:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=lvXE5gTUk5P3TVKgX5q5Q8J1/DjEMwO75JeCg7ieY7s=; b=rUA9ZaXUx5MpyhS2j5LBHsyXxQ
	KbTuAJUR1haH+9S1m8G4GZVBD1g7bx2ayPONElMYjcxYJ0QDJPl5o5zOp4k78Qgw0XyFdjZCPo5wp
	vIgPX59oPcfHLDliRB8Y+Bi/vjpbtw2V1cwzkbepDA/QzMJIwAsmVAdMFC3UF8wgtmukkiprCLdOG
	RnSyiCv+Mvh3ga6qyL+ash+wP6WvC9+JDwisvTf85QvcZuGjp66L5kSvkUkgxcMfJHjnZZ91k2qO0
	ThG6qMn0y6iW42CQt05TqF0tEm3cI9aOk07AkgbKRZMt1CIdlg2QNDBGCgPEgHOzn7Iuc8T8ztdEX
	0c6zkTmg==;
Received: from 2a02-8389-2341-5b80-cdb4-8e7d-405d-6b77.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:cdb4:8e7d:405d:6b77] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGtux-00000007Qnu-0nLE;
	Tue, 11 Jun 2024 05:19:35 +0000
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
Subject: [PATCH 01/26] sd: fix sd_is_zoned
Date: Tue, 11 Jun 2024 07:19:01 +0200
Message-ID: <20240611051929.513387-2-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611051929.513387-1-hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LnroIPNW89K.A.lUTJ.VJ-ZmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2892
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240611051929.513387-2-hch@lst.de
Resent-Date: Tue, 11 Jun 2024 05:36:21 +0000 (UTC)

Since commit 7437bb73f087 ("block: remove support for the host aware zone
model"), only ZBC devices expose a zoned access model.  sd_is_zoned is
used to check for that and thus return false for host aware devices.

Fixes: 7437bb73f087 ("block: remove support for the host aware zone model")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/sd.h     | 7 ++++++-
 drivers/scsi/sd_zbc.c | 7 +------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/sd.h b/drivers/scsi/sd.h
index 726f1613f6cb56..65dff3c2108926 100644
--- a/drivers/scsi/sd.h
+++ b/drivers/scsi/sd.h
@@ -222,9 +222,14 @@ static inline sector_t sectors_to_logical(struct scsi_device *sdev, sector_t sec
 
 void sd_dif_config_host(struct scsi_disk *sdkp, struct queue_limits *lim);
 
+/*
+ * Check if we support a zoned model for this device.
+ *
+ * Note that host aware devices are treated as conventional by Linux.
+ */
 static inline int sd_is_zoned(struct scsi_disk *sdkp)
 {
-	return sdkp->zoned == 1 || sdkp->device->type == TYPE_ZBC;
+	return sdkp->device->type == TYPE_ZBC;
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index f685838d9ed214..422eaed8457227 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -598,13 +598,8 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, struct queue_limits *lim,
 	u32 zone_blocks = 0;
 	int ret;
 
-	if (!sd_is_zoned(sdkp)) {
-		/*
-		 * Device managed or normal SCSI disk, no special handling
-		 * required.
-		 */
+	if (!sd_is_zoned(sdkp))
 		return 0;
-	}
 
 	/* READ16/WRITE16/SYNC16 is mandatory for ZBC devices */
 	sdkp->device->use_16_for_rw = 1;
-- 
2.43.0

