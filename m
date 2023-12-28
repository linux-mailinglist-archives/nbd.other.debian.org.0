Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F17281F5DC
	for <lists+nbd@lfdr.de>; Thu, 28 Dec 2023 09:12:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 045B121430; Thu, 28 Dec 2023 08:12:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 28 08:12:51 2023
Old-Return-Path: <BATV+36667fa86514323fa3d9+7431+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2866D21510
	for <lists-other-nbd@bendel.debian.org>; Thu, 28 Dec 2023 07:56:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.06 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KVlIWQX_Nflq for <lists-other-nbd@bendel.debian.org>;
	Thu, 28 Dec 2023 07:56:21 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B51D921506
	for <nbd@other.debian.org>; Thu, 28 Dec 2023 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=yBEmKZVlehpTfMsqJcs5UrNKZT7aMOCpSurlpZlFZsk=; b=sIUUno5s3ItA0BiHZh1mp4seJb
	FmI2ePJmNtv2r8PSBvIL1KHUuJ42E75ZE/2/Q6/Nl826tMfpbyNEyRYkVRgpVmATvwdObOknGKjM/
	/RBJZIFMyY+sk39NISUwuPsK7yRXnlMH+l+u5sh+cMQbvZcs9Q52YKHlVRnP5Xp43mLkGlqdgjGok
	b6CpuM6P/HEdvcBMV4aW0D0oA7uJ3Lb/wDPdirDwTXJ3gWYTDzNQjyIoOin+FUQ3KwsQZKJfJP1Ut
	CSGvByXXdI230c4HlDDykOLsTLoTzUs/orkn1slOE6iCVlBipVBwuPuO/3sxYlBU5AH0qNoEI9UE9
	9EDTx7vg==;
Received: from 213-147-167-209.nat.highway.webapn.at ([213.147.167.209] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rIlFE-00GMqW-1v;
	Thu, 28 Dec 2023 07:55:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Coly Li <colyli@suse.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/9] block: remove two comments in bio_split_discard
Date: Thu, 28 Dec 2023 07:55:37 +0000
Message-Id: <20231228075545.362768-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231228075545.362768-1-hch@lst.de>
References: <20231228075545.362768-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JViahx5gREP.A.DwG.D4SjlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2692
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231228075545.362768-2-hch@lst.de
Resent-Date: Thu, 28 Dec 2023 08:12:52 +0000 (UTC)

A zero discard_granularity is not treated the same as a single-block one,
and not having any segments after taking alignment is perfectly fine
and does not need a warning.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-merge.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/block/blk-merge.c b/block/blk-merge.c
index 65e75efa9bd366..2d470cf2173e29 100644
--- a/block/blk-merge.c
+++ b/block/blk-merge.c
@@ -115,17 +115,13 @@ static struct bio *bio_split_discard(struct bio *bio,
 
 	*nsegs = 1;
 
-	/* Zero-sector (unknown) and one-sector granularities are the same.  */
 	granularity = max(lim->discard_granularity >> 9, 1U);
 
 	max_discard_sectors =
 		min(lim->max_discard_sectors, bio_allowed_max_sectors(lim));
 	max_discard_sectors -= max_discard_sectors % granularity;
-
-	if (unlikely(!max_discard_sectors)) {
-		/* XXX: warn */
+	if (unlikely(!max_discard_sectors))
 		return NULL;
-	}
 
 	if (bio_sectors(bio) <= max_discard_sectors)
 		return NULL;
-- 
2.39.2

