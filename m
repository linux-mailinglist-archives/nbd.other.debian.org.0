Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1195D81F5E1
	for <lists+nbd@lfdr.de>; Thu, 28 Dec 2023 09:14:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EAD9921485; Thu, 28 Dec 2023 08:13:59 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 28 08:13:59 2023
Old-Return-Path: <BATV+36667fa86514323fa3d9+7431+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6CC6A21506
	for <lists-other-nbd@bendel.debian.org>; Thu, 28 Dec 2023 07:56:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.16 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aaINYHKewDnP for <lists-other-nbd@bendel.debian.org>;
	Thu, 28 Dec 2023 07:56:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5C27321507
	for <nbd@other.debian.org>; Thu, 28 Dec 2023 07:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=HkpcWKQTIPI7GkyZeehGy5v+hhspknRU+JppGoiJJYA=; b=jyfAgZsMcb6a2gLtPG5M0l55w/
	8qsgzUL7o1Z2AlXctu0haJvQ8KcAuoc3OwNfmpQ84a+dBEr/gsd1O+QQ4RPLye0xjLHhyqwAGjPu5
	fHvw4kEnc6/Di98VmcPv3Pt2CW9Hevz1S44EVBQvFQMdhHpojpjvlpprqCPdKPTKZ2qxMMHJvigF0
	RlWDlvB16ZVwsYiL9vmZnz5VMBFSZ3k7id14Oka+1MEY3f3bYMye33qG8IeJTHJK91MahyIbTtfa4
	OvdcgunJZdIqqCGwdxPVtyZReR9yL/zIGaYxTwWZODjFVO02kbLGAVwYv7wigd9Uwtv3FE/AIK9dJ
	jjoRUdXA==;
Received: from 213-147-167-209.nat.highway.webapn.at ([213.147.167.209] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rIlFo-00GN5Y-2d;
	Thu, 28 Dec 2023 07:56:33 +0000
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
Subject: [PATCH 8/9] bcache: use the default discard granularity
Date: Thu, 28 Dec 2023 07:55:44 +0000
Message-Id: <20231228075545.362768-9-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231228075545.362768-1-hch@lst.de>
References: <20231228075545.362768-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <F2TltY_RGOC.A.VIH.H5SjlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2697
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231228075545.362768-9-hch@lst.de
Resent-Date: Thu, 28 Dec 2023 08:13:59 +0000 (UTC)

The discard granularity now defaults to a single sector, so don't set
that value explicitly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/bcache/super.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index ecc1447f202a42..39ec95b8613f1f 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -954,7 +954,6 @@ static int bcache_device_init(struct bcache_device *d, unsigned int block_size,
 	q->limits.max_segment_size	= UINT_MAX;
 	q->limits.max_segments		= BIO_MAX_VECS;
 	blk_queue_max_discard_sectors(q, UINT_MAX);
-	q->limits.discard_granularity	= block_size;
 	q->limits.io_min		= block_size;
 	q->limits.logical_block_size	= block_size;
 	q->limits.physical_block_size	= block_size;
-- 
2.39.2

