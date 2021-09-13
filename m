Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B0B408A76
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 13:42:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6E739203AE; Mon, 13 Sep 2021 11:42:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 11:42:32 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 710862037F
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 11:26:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vLSnrWFx9tLS for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 11:26:48 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pf1-x431.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5A2D820371
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 11:26:48 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id f65so8485659pfb.10
        for <nbd@other.debian.org>; Mon, 13 Sep 2021 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1/kYiCngMmxbFqJfXYoBIgm/p1vV2D8hrclHTCgo/m8=;
        b=QuBFqYGy7IEUmyoFMQ1sO0EakRIH0Y2lHGy18G80MfBSvOYS4cSa7EexTgD2dfm6F2
         FeHzg0Za52o6hULCGLQERMg5NTTpt1qtRjcMUM1DOX8KwoHhV34OqzfO1/hNVuf3mg/+
         ejCj3Ce4VhMQ86TfD04rG5yTmzUFIP9LeIeQBYmw+EiTxOZEXLGp2Ic+ShIt23Nejd6H
         fowKACDl2JsZ0F+WZV5WvnqeDDpQQ0CY3U0x/b72j70h1pVLhAXIhCrx5QvQ06Su/269
         we7Nj08kTZTw3ALd8j01pBOF1bQos7M5LdkzFfW3Y9iDSwl+d/K2J6wwqpGYKA6evnG5
         IW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1/kYiCngMmxbFqJfXYoBIgm/p1vV2D8hrclHTCgo/m8=;
        b=74gdJ8brMcqs6wYbJRGRD8dY3y5gP9eBXsxpj5UXtzQHfv0vmQADEp1q2fMMkD4S5c
         OhKn+H+A2j1w2HtIoGGfgzOo5Pqa6k2fR2vr125pKMqEfjc/nA6jz2HYAd8hFn5YrqFh
         0r1BdyzoNkFS/sGTt0B78WiTXtRklNsNloYbxNEkSyy7KBVEb9VnVp7RW49RNcfZ/YQy
         1k3Lv1vFnldVHJa1iq+WMV93Q8ar4rFiTmKymEK/Db0QlnKygyz9eq1t5j/G8Yiq7UJk
         VV0Euc7RLI0yhLrTVzWtaD8EEP2AhlZLpescL9VJ5NFC5A0M1CDPQKdDXC5nT04VhUUZ
         A+VQ==
X-Gm-Message-State: AOAM532Df9gEINUL9aotbBrKv3dRhSfDSZ4H0kGvB9rAiySgT0pUrZ6B
	TmChfCY3HWW0dj4clMM659wtjdo5dmuYudE=
X-Google-Smtp-Source: ABdhPJxBmRuoWPM0P6hXnnjYsJBWQk+F5kUG8mCFzn5NPFkr1v2Gtzitpmo8UW1caPBq+6sPyFozjw==
X-Received: by 2002:a63:4464:: with SMTP id t36mr10819238pgk.4.1631532404899;
        Mon, 13 Sep 2021 04:26:44 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id p13sm6575373pjo.9.2021.09.13.04.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 04:26:44 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	josef@toxicpanda.com,
	hch@infradead.org
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: [PATCH 2/3] loop: Use invalidate_gendisk() helper to invalidate gendisk
Date: Mon, 13 Sep 2021 19:25:56 +0800
Message-Id: <20210913112557.191-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913112557.191-1-xieyongji@bytedance.com>
References: <20210913112557.191-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XO7S2PgGo3P.A.B_C.okzPhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1436
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210913112557.191-3-xieyongji@bytedance.com
Resent-Date: Mon, 13 Sep 2021 11:42:32 +0000 (UTC)

Use invalidate_gendisk() helper to simplify the code for gendisk
invalidation.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/block/loop.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 7bf4686af774..ddcf0428cdf9 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1395,11 +1395,7 @@ static int __loop_clr_fd(struct loop_device *lo, bool release)
 	blk_queue_logical_block_size(lo->lo_queue, 512);
 	blk_queue_physical_block_size(lo->lo_queue, 512);
 	blk_queue_io_min(lo->lo_queue, 512);
-	if (bdev) {
-		invalidate_bdev(bdev);
-		bdev->bd_inode->i_mapping->wb_err = 0;
-	}
-	set_capacity(lo->lo_disk, 0);
+	invalidate_gendisk(lo->lo_disk);
 	loop_sysfs_exit(lo);
 	if (bdev) {
 		/* let user-space know about this change */
-- 
2.11.0

