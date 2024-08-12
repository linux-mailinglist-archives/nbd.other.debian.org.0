Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2413594EF6D
	for <lists+nbd@lfdr.de>; Mon, 12 Aug 2024 16:21:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E55622057F; Mon, 12 Aug 2024 14:21:51 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 12 14:21:51 2024
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=4.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,LDOSUBSCRIBER,LDO_WHITELIST,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 62A002056C
	for <lists-other-nbd@bendel.debian.org>; Mon, 12 Aug 2024 14:21:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DF9os8D6WSmk for <lists-other-nbd@bendel.debian.org>;
	Mon, 12 Aug 2024 14:21:40 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 035C120567
	for <nbd@other.debian.org>; Mon, 12 Aug 2024 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UfNjOcnK0rNibgV49Da6IoKbw+3WWkpzfO/rH4LGQ2U=; b=ozuxj6QP1tspTE3TBAu18U913q
	AIntpY3wB0RxJJ6TK2UHI8gWC+TiWayDwqRmi6o9x0e7ZLtRIRM6EckASCCezzKJt1usuB7H9Hpml
	x3gAkojbdIE6xK28Z7Dyn5kfdqkFIl2AFjnZStooQjDW2HIi5V80ShWXqDknbKxTbHL9s572i4pRU
	UbvNdlX3b129LyaaBRtGurYTUcf1LtJ53oriiM1NoPrjyJ76HEVRZc+lXKu3VXCNoSOnNUhwRAx68
	f1LnqJiNXDPkJPrhrO+dQeEn9T+3qu4q/mjHp3RYufcEs0Mwuz0WK2DdsSoizVfjowgKiA/QrUUhQ
	zpTe/vkA==;
Received: from [196.210.96.185] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <wouter@grep.be>)
	id 1sdVvS-009n08-13;
	Mon, 12 Aug 2024 16:21:34 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <wouter@grep.be>)
	id 1sdVBo-00000000VH7-1PHN;
	Mon, 12 Aug 2024 15:34:24 +0200
From: Wouter Verhelst <w@uter.be>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Wouter Verhelst <w@uter.be>,
	Eric Blake <eblake@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	Eric Blake <eblake@redhat.Com>
Subject: [PATCH v4 3/3] nbd: correct the maximum value for discard sectors
Date: Mon, 12 Aug 2024 15:20:42 +0200
Message-ID: <20240812133032.115134-8-w@uter.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812133032.115134-1-w@uter.be>
References: <20240812133032.115134-1-w@uter.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Sal0HzbCuWL.A.6PzC._phumB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3137
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240812133032.115134-8-w@uter.be
Resent-Date: Mon, 12 Aug 2024 14:21:51 +0000 (UTC)

The version of the NBD protocol implemented by the kernel driver
currently has a 32 bit field for length values. As the NBD protocol uses
bytes as a unit of length, length values larger than 2^32 bytes cannot
be expressed.

Update the max_hw_discard_sectors field to match that.

Signed-off-by: Wouter Verhelst <w@uter.be>
Fixes: 268283244c0f ("nbd: use the atomic queue limits API in nbd_set_size")
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Cc: Eric Blake <eblake@redhat.Com>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index fdcf0bbedf3b..235ab5f59608 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -339,7 +339,7 @@ static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 
 	lim = queue_limits_start_update(nbd->disk->queue);
 	if (nbd->config->flags & NBD_FLAG_SEND_TRIM)
-		lim.max_hw_discard_sectors = UINT_MAX;
+		lim.max_hw_discard_sectors = UINT_MAX >> SECTOR_SHIFT;
 	else
 		lim.max_hw_discard_sectors = 0;
 	if (!(nbd->config->flags & NBD_FLAG_SEND_FLUSH)) {
-- 
2.43.0

