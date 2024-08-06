Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7660B949189
	for <lists+nbd@lfdr.de>; Tue,  6 Aug 2024 15:31:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5A62E205BD; Tue,  6 Aug 2024 13:31:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug  6 13:31:34 2024
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=4.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5C2D120547
	for <lists-other-nbd@bendel.debian.org>; Tue,  6 Aug 2024 13:31:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aJeLgV75v9oO for <lists-other-nbd@bendel.debian.org>;
	Tue,  6 Aug 2024 13:31:19 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 471FC2053D
	for <nbd@other.debian.org>; Tue,  6 Aug 2024 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Xcgcw/iQnRD6/Ii1rjeE6TECmbYw3NwUK+7/q09vO38=; b=d9IxhPodRH3LMsYIATXCjfU3CT
	DT8SPwh3xivwMv+k4bKHDIGVXBtpV+wSS/tJ1wvGBRhJjBXr3hOOHhVFKq8t5khsSaJsq1p3JUuch
	YLp8DLvA/k9fzq0rdRnQ2DrqSutWhF3aVPWl1fAzQ2OjOoBZYoZZT5kLg/6FOrYQq1ev9kerk4HeL
	WJ/6zP5yKx50qIvJcR9EkhoZs4ZXdUInxK0XZ55Z2auXdwfMfIOegOROEH6B7qc5jSXozIgWyDqs2
	d3t8gu21vq65+muvZziOTJd2toUC7MEzbNK62WFi0xHTA6uXDaxTCxF/X3PVr3rkjJKEsKbWFONPb
	HvsUYWhA==;
Received: from [196.251.239.242] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <wouter@grep.be>)
	id 1sbKHT-00HZHV-2C;
	Tue, 06 Aug 2024 15:31:15 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <wouter@grep.be>)
	id 1sbKHQ-000000017kw-0HfU;
	Tue, 06 Aug 2024 15:31:12 +0200
From: Wouter Verhelst <w@uter.be>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Wouter Verhelst <w@uter.be>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] nbd: correct the maximum value for discard sectors
Date: Tue,  6 Aug 2024 15:30:56 +0200
Message-ID: <20240806133058.268058-3-w@uter.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806133058.268058-1-w@uter.be>
References: <20240803130432.5952-1-w@uter.be>
 <20240806133058.268058-1-w@uter.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VMZ9eE1sOBD.A.eU6M.2WismB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3123
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240806133058.268058-3-w@uter.be
Resent-Date: Tue,  6 Aug 2024 13:31:34 +0000 (UTC)

The version of the NBD protocol implemented by the kernel driver
currently has a 32 bit field for length values. As the NBD protocol uses
bytes as a unit of length, length values larger than 2^32 bytes cannot
be expressed.

Update the max_hw_discard_sectors field to match that.

Signed-off-by: Wouter Verhelst <w@uter.be>
Fixes: 268283244c0f018dec8bf4a9c69ce50684561f46
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 20e9f9fdeaae..1457f0c8a4a4 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -339,7 +339,7 @@ static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 
 	lim = queue_limits_start_update(nbd->disk->queue);
 	if (nbd->config->flags & NBD_FLAG_SEND_TRIM)
-		lim.max_hw_discard_sectors = UINT_MAX;
+		lim.max_hw_discard_sectors = UINT_MAX / blksize;
 	else
 		lim.max_hw_discard_sectors = 0;
 	if (!(nbd->config->flags & NBD_FLAG_SEND_FLUSH)) {
-- 
2.43.0

