Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1390193C7A5
	for <lists+nbd@lfdr.de>; Thu, 25 Jul 2024 19:28:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C783B20CBA; Thu, 25 Jul 2024 17:28:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 25 17:28:11 2024
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 69B4120C90
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 Jul 2024 17:28:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id s866uzb0SGSI for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 Jul 2024 17:27:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 2362 seconds by postgrey-1.36 at bendel; Thu, 25 Jul 2024 17:27:56 UTC
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8C0E020C94
	for <nbd@other.debian.org>; Thu, 25 Jul 2024 17:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bYMsa0EfB+GNYJVPoJ4Xm4fN7+npU33jjsrAMpuBdNE=; b=RxgMcDiWstD5hscgD2SgTjjIjc
	rQnufE60L4dbwjTveCNvx0DAaA5HLu13n+xNYlsUulQxsewCzqygo6YJ/lr3EWEluphNSIP5IW9Fo
	L9CeDUh4ZgUoC9oOqy4Mm5DLdi9qHfLRQhLtYnVQ8uhZOv2ghqcR4G3I+WsUqpT1NDXH1N62Ttylx
	YQqQFxEFuPgibseD8j0cHwjFwcbKqKwuN8WZBl2FeMcx+Re8hiaG/SwTKUI+fEVWkRZdvfVF8VyxU
	qFhtA465YqNkoez7d7nT0tUae4JYQOaX4cEuUhfhCg/54L9tHwYJWT4EdJaiac0e6UZNse4GaJSbV
	iRZfXhFg==;
Received: from [102.39.153.168] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <wouter@grep.be>)
	id 1sX1dm-004ZKR-2B;
	Thu, 25 Jul 2024 18:48:30 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <wouter@grep.be>)
	id 1sX1bT-00000005MAZ-1rhp;
	Thu, 25 Jul 2024 18:46:07 +0200
From: Wouter Verhelst <w@uter.be>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Wouter Verhelst <w@uter.be>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nbd: add support for rotational devices
Date: Thu, 25 Jul 2024 18:45:36 +0200
Message-ID: <20240725164536.1275851-1-w@uter.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PbO1FckuBo.A.cp6D.rsoomB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3104
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240725164536.1275851-1-w@uter.be
Resent-Date: Thu, 25 Jul 2024 17:28:11 +0000 (UTC)

The NBD protocol defines the flag NBD_FLAG_ROTATIONAL to flag that the
export in use should be treated as a rotational device.

Add support for that flag to the kernel driver.

Signed-off-by: Wouter Verhelst <w@uter.be>
---
 drivers/block/nbd.c      | 3 +++
 include/uapi/linux/nbd.h | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 41a90150b501..5b1811b1ba5f 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -350,6 +350,9 @@ static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		lim.features |= BLK_FEAT_WRITE_CACHE;
 		lim.features &= ~BLK_FEAT_FUA;
 	}
+	if (nbd->config->flags & NBD_FLAG_ROTATIONAL)
+		lim.features |= BLK_FEAT_ROTATIONAL;
+
 	lim.logical_block_size = blksize;
 	lim.physical_block_size = blksize;
 	error = queue_limits_commit_update(nbd->disk->queue, &lim);
diff --git a/include/uapi/linux/nbd.h b/include/uapi/linux/nbd.h
index 80ce0ef43afd..d75215f2c675 100644
--- a/include/uapi/linux/nbd.h
+++ b/include/uapi/linux/nbd.h
@@ -51,8 +51,9 @@ enum {
 #define NBD_FLAG_READ_ONLY	(1 << 1) /* device is read-only */
 #define NBD_FLAG_SEND_FLUSH	(1 << 2) /* can flush writeback cache */
 #define NBD_FLAG_SEND_FUA	(1 << 3) /* send FUA (forced unit access) */
-/* there is a gap here to match userspace */
+#define NBD_FLAG_ROTATIONAL	(1 << 4) /* device is rotational */
 #define NBD_FLAG_SEND_TRIM	(1 << 5) /* send trim/discard */
+/* there is a gap here to match userspace */
 #define NBD_FLAG_CAN_MULTI_CONN	(1 << 8)	/* Server supports multiple connections per export. */
 
 /* values for cmd flags in the upper 16 bits of request type */
-- 
2.43.0

