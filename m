Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AB79469D5
	for <lists+nbd@lfdr.de>; Sat,  3 Aug 2024 15:06:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BF6F120630; Sat,  3 Aug 2024 13:06:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug  3 13:06:02 2024
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 299E6205F8
	for <lists-other-nbd@bendel.debian.org>; Sat,  3 Aug 2024 13:05:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id awvNidR4aD-b for <lists-other-nbd@bendel.debian.org>;
	Sat,  3 Aug 2024 13:05:47 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6847F205F5
	for <nbd@other.debian.org>; Sat,  3 Aug 2024 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=eBj9IYCg6lGcdagpC23O36zks5evVy6gXh/QwlwAkJk=; b=qy/RpLCnpmVWP0OJYGhxrgi6d0
	lJwbFwM0KO0ExHB4MvZHFhqzFSADQMqXRabAfr4BOAFQHQyT2uH/Cq38VvtgAS9CBpmxNmHnY3/E2
	iDd6wrXkAdUbr2BI5fghHGt6K9UuiKQLppkeCfxsGZ6EwebGuEVRSt2fJeJW2zelKG8trVRHkD2Zy
	7/f8mNhdZYYr0x2XeQa13dJiO2wmCFtY5wYT0IJf4lvPXeIBTNc3n/DK++io8/NiGLwmo71IubzvL
	6ihpisxCkUNLqoewXvXQZuyY1q83DRH90CZNDiTLDsv9sYud7Swf1i1WUxFhkc/tWGjnw1omsYLLh
	+HsImlow==;
Received: from [102.39.154.62] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <wouter@grep.be>)
	id 1saES8-00Cb0A-1r;
	Sat, 03 Aug 2024 15:05:44 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <wouter@grep.be>)
	id 1saES0-000000001ZX-48zt;
	Sat, 03 Aug 2024 15:05:36 +0200
From: Wouter Verhelst <w@uter.be>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Wouter Verhelst <w@uter.be>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] nbd: nbd_bg_flags_show: add NBD_FLAG_ROTATIONAL
Date: Sat,  3 Aug 2024 15:04:31 +0200
Message-ID: <20240803130432.5952-2-w@uter.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240803130432.5952-1-w@uter.be>
References: <20240803130432.5952-1-w@uter.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Jz2rHxSxhCE.A.2mk.6sirmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3117
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240803130432.5952-2-w@uter.be
Resent-Date: Sat,  3 Aug 2024 13:06:02 +0000 (UTC)

Also handle NBD_FLAG_ROTATIONAL in our debug helper function

Signed-off-by: Wouter Verhelst <w@uter.be>
---
 drivers/block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 215e7ea9a3c3..f65df8a1602d 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1714,6 +1714,8 @@ static int nbd_dbg_flags_show(struct seq_file *s, void *unused)
 		seq_puts(s, "NBD_FLAG_SEND_TRIM\n");
 	if (flags & NBD_FLAG_SEND_WRITE_ZEROES)
 		seq_puts(s, "NBD_FLAG_SEND_WRITE_ZEROES\n");
+	if (flags & NBD_FLAG_ROTATIONAL)
+		seq_puts(s, "NBD_FLAG_ROTATIONAL\n");
 
 	return 0;
 }
-- 
2.43.0

