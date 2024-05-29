Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F10A38D2C55
	for <lists+nbd@lfdr.de>; Wed, 29 May 2024 07:21:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D789C204A2; Wed, 29 May 2024 05:21:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 05:21:31 2024
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
	by bendel.debian.org (Postfix) with ESMTP id 85DC320495
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2024 05:05:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zYQMQhshtrwo for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2024 05:05:33 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9921420494
	for <nbd@other.debian.org>; Wed, 29 May 2024 05:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=YGmOwuIW0DehI4KXZwtqg3QuYxifQjapgz3/0XZe+RA=; b=KhFS/hxRb8UpO9uvnt4jA68rPG
	xVySn1pHD4jIRemyRbCCEdqXZl0xtjnDLGWGYQO/VqtIGw3kO7PMotHaHvYeF3y7+zrWI6JoWm7Pu
	K36zrJ5O9E7hHC8jFyqb0xPEFI8urWGQgmpxKmKvuJcI1lc4KbirfQgyMqZqdMiNOH0Qn6YwwfkIE
	fgfo+VGAtqPz4gTfBDOjANwyIRtH8WAho9J73pWTOMMk8H6xVuduHp7xwShRKISMLaacYAKT5bsRv
	hrsO1G72IRV/pFLruJ2/ijU+K3F58b+tzy0n/xqUnJBi8VNnAK04O7UkNZ4e+JaGUDKq6/ezYTnGO
	RPYgZo2w==;
Received: from 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCBV8-00000002pZH-1Swh;
	Wed, 29 May 2024 05:05:26 +0000
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
Subject: [PATCH 06/12] sd: simplify the disable case in sd_config_discard
Date: Wed, 29 May 2024 07:04:08 +0200
Message-ID: <20240529050507.1392041-7-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529050507.1392041-1-hch@lst.de>
References: <20240529050507.1392041-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <z5nTfpToVdJ.A.cgfN.btrVmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2816
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240529050507.1392041-7-hch@lst.de
Resent-Date: Wed, 29 May 2024 05:21:31 +0000 (UTC)

Fall through to the main call to blk_queue_max_discard_sectors given that
max_blocks has been initialized to zero above instead of duplicating the
call.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/sd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 09ffe9d826aeac..437743e3a0d37d 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -844,8 +844,7 @@ static void sd_config_discard(struct scsi_disk *sdkp, unsigned int mode)
 
 	case SD_LBP_FULL:
 	case SD_LBP_DISABLE:
-		blk_queue_max_discard_sectors(q, 0);
-		return;
+		break;
 
 	case SD_LBP_UNMAP:
 		max_blocks = min_not_zero(sdkp->max_unmap_blocks,
-- 
2.43.0

