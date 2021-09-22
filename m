Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A9B4149CE
	for <lists+nbd@lfdr.de>; Wed, 22 Sep 2021 14:54:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 655BE20C7B; Wed, 22 Sep 2021 12:54:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 22 12:54:32 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5CD0020BBE
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Sep 2021 12:38:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dj3Xr3SaWIJg for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Sep 2021 12:37:59 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pg1-x532.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 11F5C20BCB
	for <nbd@other.debian.org>; Wed, 22 Sep 2021 12:37:59 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id u18so2573655pgf.0
        for <nbd@other.debian.org>; Wed, 22 Sep 2021 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XXo90rCwKov3n8RI+9L+aOvAMX+z/2zpjog89bF1/nY=;
        b=JwrJmAECNV2t7VRi9uoLEnD/JVjKT4PR28LoO/bRruVMwlOHxUbTfbHj1YZ66qO8vK
         NGYwVqivM2etFriuk0ET8xVcVNONczJO2K6N8S+cGvamhW9UNAqK9ORaNxNx+wze7QAM
         5XOYWu9/f+8UmBUMGPWSzXx7fwPr1qF1GbFSGSx7b1dRqkJ/UJ8Z46hzxSMTX1/KnuZV
         GHyR9vIHtJNxfpUB8Xo+j0Gidj1xnaOYsfwjvJKkWDdEifOA58DjkTvxs1LP+znRLKbC
         5EN/z5cW6w/DIDEH9/NUfuWuW8OW7FH+i7zIPuolWTPEZ4oWBbclAERBYOJWRwd7oU+I
         4amg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XXo90rCwKov3n8RI+9L+aOvAMX+z/2zpjog89bF1/nY=;
        b=CR7uVMUnXTJjAZzw06MgerSUpR+XdsCAHcYiskJnHwDT4I/9S7Bibwj6iKnFpnm54z
         BCdsz7CVua5Ge54ohXfIdEjulwEhxz0ZFvLBNOlHLia+yoUaIXLjeZtOYdHdyo2sxf7v
         FrrKlVh75wAcqMvL0TYpTUfx5NdbcG9Jq+l3NYEN8p83PZbDgSJf/775vtq6QzGunBPD
         7M9vcIFua7oLudd2HjBEB4ssOkvkEoZPln5TZRIGsTK/k5TQjYoxzoU6GZnvMsTWJXCu
         1zeSLkE1Gr3D4o3c0B32MKR67m73S578yEVLB09wX2maaCHqwMlO4Fs7KZzz/f78YdQl
         Rw6Q==
X-Gm-Message-State: AOAM530S4UWbVWwnHJFWaXOXbAwEYuMkNJSc6jE6Y06IkWv8uLNL9ihS
	uWckWtSQ9RD1Ct8WJCl2zBjl
X-Google-Smtp-Source: ABdhPJyF/Cz6OiRZv3oI6P/rXSCH87qxUj4jr8nv+HKYRy0Lhyf1ZC8DmOQFf+VbzXM2zx/BVwKTOw==
X-Received: by 2002:a62:7b16:0:b0:443:56c4:33dc with SMTP id w22-20020a627b16000000b0044356c433dcmr31836416pfc.47.1632314275647;
        Wed, 22 Sep 2021 05:37:55 -0700 (PDT)
Received: from localhost ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id a27sm2397688pfk.192.2021.09.22.05.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 05:37:55 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	josef@toxicpanda.com,
	hch@infradead.org
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: [PATCH v2 2/4] loop: Use invalidate_disk() helper to invalidate gendisk
Date: Wed, 22 Sep 2021 20:37:09 +0800
Message-Id: <20210922123711.187-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922123711.187-1-xieyongji@bytedance.com>
References: <20210922123711.187-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vTUkE7kf51G.A.UU.IeyShB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1521
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210922123711.187-3-xieyongji@bytedance.com
Resent-Date: Wed, 22 Sep 2021 12:54:32 +0000 (UTC)

Use invalidate_disk() helper to simplify the code for gendisk
invalidation.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 7bf4686af774..eab6906326cc 100644
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
+	invalidate_disk(lo->lo_disk);
 	loop_sysfs_exit(lo);
 	if (bdev) {
 		/* let user-space know about this change */
-- 
2.11.0

