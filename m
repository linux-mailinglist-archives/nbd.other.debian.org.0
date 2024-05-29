Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABC18D2C60
	for <lists+nbd@lfdr.de>; Wed, 29 May 2024 07:22:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 60F36204B8; Wed, 29 May 2024 05:22:05 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 05:22:05 2024
Old-Return-Path: <BATV+c55c297d46ee5715703b+7584+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 581512049C
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2024 05:05:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id D0UOScc0ExLW for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2024 05:05:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7DAC220494
	for <nbd@other.debian.org>; Wed, 29 May 2024 05:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=FxMZ/TuFQWi8ppJCXfgMd7wJRUIIOyQbd6+WyEUQ+N4=; b=sP8WPUo5vAWKUtYTFsHH8zz4lY
	DJJMR33fYr4eAsLHFTZ8Z9howNp0W6fwZ2fiNjcxUBC3ODEyO2i6vzUcK33pr0IzzNeqbE0OGj1ST
	5S7X+/6iNra2QHh6wsNSXPnXFeKcQpoKWDT2h0ez391hq4EcHyXFSepiXhTUC3N2xV1AZcowiOldm
	4EXlw2b1iSu+BV1NPRisPBN1MDDygrM+eCbEpyBDZ0QTDVC2nwgktvILS31bY5S++5+So+r6x+Kgv
	BwpsZkqpUIOpxNp0XUC+iXoyBN5nUfj9Zb4EGtzt7UNxwaRV/VE3oyhLo7REgxmsgSTIrs8QWAfko
	q33GTzcg==;
Received: from 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCBVE-00000002pch-0ecf;
	Wed, 29 May 2024 05:05:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 08/12] sd: cleanup zoned queue limits initialization
Date: Wed, 29 May 2024 07:04:10 +0200
Message-ID: <20240529050507.1392041-9-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RLKF7lzOyDI.A.u0gN.9trVmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2819
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240529050507.1392041-9-hch@lst.de
Resent-Date: Wed, 29 May 2024 05:22:05 +0000 (UTC)

Consolidate setting zone-related queue limits in sd_zbc_read_zones
instead of splitting them between sd_zbc_revalidate_zones and
sd_zbc_read_zones, and move the early_zone_information initialization
in sd_zbc_read_zones above setting up the queue limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/sd_zbc.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 806036e48abeda..1c24c844e8d178 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -565,12 +565,6 @@ int sd_zbc_revalidate_zones(struct scsi_disk *sdkp)
 	sdkp->zone_info.zone_blocks = zone_blocks;
 	sdkp->zone_info.nr_zones = nr_zones;
 
-	blk_queue_chunk_sectors(q,
-			logical_to_sectors(sdkp->device, zone_blocks));
-
-	/* Enable block layer zone append emulation */
-	blk_queue_max_zone_append_sectors(q, 0);
-
 	flags = memalloc_noio_save();
 	ret = blk_revalidate_disk_zones(disk);
 	memalloc_noio_restore(flags);
@@ -625,6 +619,10 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, u8 buf[SD_BUF_SIZE])
 	if (ret != 0)
 		goto err;
 
+	nr_zones = round_up(sdkp->capacity, zone_blocks) >> ilog2(zone_blocks);
+	sdkp->early_zone_info.nr_zones = nr_zones;
+	sdkp->early_zone_info.zone_blocks = zone_blocks;
+
 	/* The drive satisfies the kernel restrictions: set it up */
 	blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, q);
 	if (sdkp->zones_max_open == U32_MAX)
@@ -632,10 +630,10 @@ int sd_zbc_read_zones(struct scsi_disk *sdkp, u8 buf[SD_BUF_SIZE])
 	else
 		disk_set_max_open_zones(disk, sdkp->zones_max_open);
 	disk_set_max_active_zones(disk, 0);
-	nr_zones = round_up(sdkp->capacity, zone_blocks) >> ilog2(zone_blocks);
-
-	sdkp->early_zone_info.nr_zones = nr_zones;
-	sdkp->early_zone_info.zone_blocks = zone_blocks;
+	blk_queue_chunk_sectors(q,
+			logical_to_sectors(sdkp->device, zone_blocks));
+	/* Enable block layer zone append emulation */
+	blk_queue_max_zone_append_sectors(q, 0);
 
 	return 0;
 
-- 
2.43.0

