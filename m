Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD1E4149D2
	for <lists+nbd@lfdr.de>; Wed, 22 Sep 2021 14:54:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 12DB920C89; Wed, 22 Sep 2021 12:54:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 22 12:54:43 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2638520BD2
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Sep 2021 12:38:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id we_PAQ-Im3tL for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Sep 2021 12:38:05 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pf1-x42e.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id F1CF420BCB
	for <nbd@other.debian.org>; Wed, 22 Sep 2021 12:38:04 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id s16so2665406pfk.0
        for <nbd@other.debian.org>; Wed, 22 Sep 2021 05:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nthaXLO1pUhxWAYzWmco/CUDncYPG0iIDRSeW2wjCys=;
        b=Bv9JrIKc99jr4kID589LR62frfgMjCf7yTda/VnS3vnki/zl7mPBUcbKaqoe19L8Ex
         E8QPyk4Bv+BJy47Z6X9tZ9Js/zSN6jlGtgtZ9pTAnY5AWc0UeLrtpoibs7YekMDY7cNu
         OylIULU6ZaFHBi4Lfn6k/Szy4sVCO5SlHeOegFdRnKoZiODvryVVLBppI/fc00yKB2PI
         B827cZqqR4nTHJ08uNKnQdyCPy8fGfpEJFwKFqIjC19u4zTKjldR7m0hAMxjOSVfdDyh
         CWcGdH30f+Fi7jqtemjvYSQugo9DCkviNSQiNyMWKQjsCgPyfEfpfBCfYONEo0SSs4gw
         Ljbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nthaXLO1pUhxWAYzWmco/CUDncYPG0iIDRSeW2wjCys=;
        b=EKHlpJk/9/3PdwPKC1caisNy7226Q5uA/0IKP4CpkQD/h7t27eetM0mNHLFzmQvYp7
         bR6U39O7wBvwQyhXg8pdSBSYkmlR2MvSPH9Z6vRXpceJ9dgqtWogTc00fEqQIs8cPMKv
         ehY1ymmYQNyBYMlcuraiIhIQ4BOuZ+b6Gc1IiIeiz7zlsuSRntQbFkPDqRypHjq79kpt
         MkhvhOIUU69AFsMyHC25ZpFmPiPpEd2rMC+BY6sNwg6XPyReG7RRO7da8bxRQhDe8Mgm
         OWzZc3lETrmp7w3zG2Lrc7OwtRrn76x6G2TnU8uQv8FfNamPB55g7OEXNxwxYQeTsIIO
         dydA==
X-Gm-Message-State: AOAM532fZxdqKQrY9irtM7yin9mDpjIePlgwEcT+FbDIvRTIsc+xwYkg
	di3E4A2RE7qaIlU5iTPht92T
X-Google-Smtp-Source: ABdhPJxywywpVzFTIQSCfO7YtvabvDBtkA5BSFrMFfPv8nJh+DNNVDsMrLYdcoJNAdiBv74yp/IHEg==
X-Received: by 2002:aa7:950e:0:b0:444:b01a:9dd1 with SMTP id b14-20020aa7950e000000b00444b01a9dd1mr28612740pfp.72.1632314279151;
        Wed, 22 Sep 2021 05:37:59 -0700 (PDT)
Received: from localhost ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id h9sm6135932pjg.9.2021.09.22.05.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 05:37:58 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	josef@toxicpanda.com,
	hch@infradead.org
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: [PATCH v2 3/4] loop: Remove the unnecessary bdev checks and unused bdev variable
Date: Wed, 22 Sep 2021 20:37:10 +0800
Message-Id: <20210922123711.187-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922123711.187-1-xieyongji@bytedance.com>
References: <20210922123711.187-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mT-TJ6QO8DF.A.gW.TeyShB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1522
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210922123711.187-4-xieyongji@bytedance.com
Resent-Date: Wed, 22 Sep 2021 12:54:43 +0000 (UTC)

The lo->lo_device can't be null if the lo->lo_backing_file is set.
So let's remove the unnecessary bdev checks and the entire bdev
variable in __loop_clr_fd() since the lo->lo_backing_file is already
checked before.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/block/loop.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index eab6906326cc..980b538c008a 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1329,7 +1329,6 @@ static int __loop_clr_fd(struct loop_device *lo, bool release)
 {
 	struct file *filp = NULL;
 	gfp_t gfp = lo->old_gfp_mask;
-	struct block_device *bdev = lo->lo_device;
 	int err = 0;
 	bool partscan = false;
 	int lo_number;
@@ -1397,16 +1396,14 @@ static int __loop_clr_fd(struct loop_device *lo, bool release)
 	blk_queue_io_min(lo->lo_queue, 512);
 	invalidate_disk(lo->lo_disk);
 	loop_sysfs_exit(lo);
-	if (bdev) {
-		/* let user-space know about this change */
-		kobject_uevent(&disk_to_dev(bdev->bd_disk)->kobj, KOBJ_CHANGE);
-	}
+	/* let user-space know about this change */
+	kobject_uevent(&disk_to_dev(lo->lo_disk)->kobj, KOBJ_CHANGE);
 	mapping_set_gfp_mask(filp->f_mapping, gfp);
 	/* This is safe: open() is still holding a reference. */
 	module_put(THIS_MODULE);
 	blk_mq_unfreeze_queue(lo->lo_queue);
 
-	partscan = lo->lo_flags & LO_FLAGS_PARTSCAN && bdev;
+	partscan = lo->lo_flags & LO_FLAGS_PARTSCAN;
 	lo_number = lo->lo_number;
 	disk_force_media_change(lo->lo_disk, DISK_EVENT_MEDIA_CHANGE);
 out_unlock:
-- 
2.11.0

