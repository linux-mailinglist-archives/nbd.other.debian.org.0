Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8D281F5D9
	for <lists+nbd@lfdr.de>; Thu, 28 Dec 2023 09:12:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DEEB8214F8; Thu, 28 Dec 2023 08:12:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 28 08:12:11 2023
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
	by bendel.debian.org (Postfix) with ESMTP id EE6FE21525
	for <lists-other-nbd@bendel.debian.org>; Thu, 28 Dec 2023 07:56:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.16 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8-qSBgJCe6v8 for <lists-other-nbd@bendel.debian.org>;
	Thu, 28 Dec 2023 07:56:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8E58F21517
	for <nbd@other.debian.org>; Thu, 28 Dec 2023 07:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=q/HlW27opIlbbmmp83fWxmA7/2zguajj/Xv/HUI85Ao=; b=q0Q0ryNe8UapoNJP1iv256wXB7
	AKKH1RzReJIql5mHIaDlcciH6hppE8XQzYd0b7I9z9ta6uVqPGlp7jeJje6FZefhf6n8UwS54/DRk
	k7hRoAcxq6Nt2j4xT8CddN59KcRFFFbh+xwES6UEc08OPH78AWblWsWmGodSQ14+JMhc2IfAWfXdL
	/Yjk7FaIeZMs5pDIXvEpaOPq/Z1MhrYNAqtc0NlPsba4XM77DfklCf/8S0ujSbPlHhFzb971QjDAz
	CUnxm5D0UuGnR68fNPqhoFYG0jx9nOiqQ5/uzRnGS4gdEk5n6YtCfPh+uCGHDEigqL9s1axdxKMXB
	TXlGzQIQ==;
Received: from 213-147-167-209.nat.highway.webapn.at ([213.147.167.209] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rIlFP-00GMsI-1M;
	Thu, 28 Dec 2023 07:56:08 +0000
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
Subject: [PATCH 3/9] block: default the discard granularity to sector size
Date: Thu, 28 Dec 2023 07:55:39 +0000
Message-Id: <20231228075545.362768-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231228075545.362768-1-hch@lst.de>
References: <20231228075545.362768-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mDUtX4cjBaI.A.omG.b3SjlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2689
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231228075545.362768-4-hch@lst.de
Resent-Date: Thu, 28 Dec 2023 08:12:11 +0000 (UTC)

Current the discard granularity defaults to 0 and must be initialized by
any driver that wants to support discard.  Default to the sector size
instead, which is the smallest possible value, and a very useful default.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index ba6e0e97118c08..d993d20dab3c6d 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -48,7 +48,7 @@ void blk_set_default_limits(struct queue_limits *lim)
 	lim->max_discard_sectors = 0;
 	lim->max_hw_discard_sectors = 0;
 	lim->max_secure_erase_sectors = 0;
-	lim->discard_granularity = 0;
+	lim->discard_granularity = 512;
 	lim->discard_alignment = 0;
 	lim->discard_misaligned = 0;
 	lim->logical_block_size = lim->physical_block_size = lim->io_min = 512;
@@ -309,6 +309,9 @@ void blk_queue_logical_block_size(struct request_queue *q, unsigned int size)
 
 	limits->logical_block_size = size;
 
+	if (limits->discard_granularity < limits->logical_block_size)
+		limits->discard_granularity = limits->logical_block_size;
+
 	if (limits->physical_block_size < size)
 		limits->physical_block_size = size;
 
-- 
2.39.2

