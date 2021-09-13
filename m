Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A813408A77
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 13:42:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3C0E7203B0; Mon, 13 Sep 2021 11:42:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 11:42:43 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 03E3120371
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 11:26:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HSt-rJxDkd3P for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 11:26:52 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pl1-x636.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4693F20378
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 11:26:52 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id v2so1670237plp.8
        for <nbd@other.debian.org>; Mon, 13 Sep 2021 04:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gOUrEPU1RAiMUpJWgGMiqNI1+8Thp1guW0tyQ2fxpY0=;
        b=Fu0UAv941kwXqg7yLEK03aUgpBq6hiFPc7EKKRDLBj4nFifiTQux01wDhXFHLnAASH
         KvfEBpMRNGZSg92TMvQ0JJ7pkec2YT9uzVvEtzVlX0gdbRpUwVLcPA3VjXFqrIqoFIrY
         vo/xi7/UQon9bTWVVChQajJ0+o19hURSy+r/8EVRmwEf/iisdG/BoWWjwvwpkL48mkLR
         IxL/8E5wG6T3JK+cNUom86rwe6QA4hjWBzvxWlnt/8LlhVqhpBnsQRpLUNK0/OMnuofT
         nA2b6zl/uWMKHxvRJt/FqrigQumcUQJGnUlR+yUMfX7g6IELutlO+CYa9PZ6O6tc+YVw
         8LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gOUrEPU1RAiMUpJWgGMiqNI1+8Thp1guW0tyQ2fxpY0=;
        b=eITGLpAMEcwb/gmijCdzrWvD1mcS+AYNndAGsMWFsbZ1f8Bw8mWJ7rA2jNxGWH0sQQ
         j6UNHOYPoPlwY49MbmfvzgwmC52EglIKdFenlAqa2VNPy7uwsm0ZLWTu+45LHX5UdDnz
         09g+b322swqZhO5BNefpbU96cZGK327Elb0qPldl45RW00zEAZUmeN4DV8vfe417Tckj
         iAv3SdpGpwdx3bbwQcQ95ZysbUnTP/IoDREgDL6EXxa8rd3Zr3OAXezw/Gefy2GUEiFT
         2X+mAjCjWwq/v7IyNHQSjxHLzrBhDGF2fWWxPXS1f1i8lT5N2aVoM9n4dvS5HowoFmqr
         c1Jg==
X-Gm-Message-State: AOAM531jXJLMf1L4O/Uz+Bx/5WLqMxVD4JcSXXkFxJGiI8sbbfNtxqYH
	Et2UK2gUOpruL6oTZ3nJUkCh
X-Google-Smtp-Source: ABdhPJxHAvsQ1aTiYldZ0sJEF7Pb1x4vYPa8mF7ejOdqFR98gj6CjGFdFuwln1VsKk5qRY9Rq/467w==
X-Received: by 2002:a17:90a:182:: with SMTP id 2mr12601785pjc.107.1631532408657;
        Mon, 13 Sep 2021 04:26:48 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id j17sm1951180pfe.35.2021.09.13.04.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 04:26:48 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	josef@toxicpanda.com,
	hch@infradead.org
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: [PATCH 3/3] nbd: Use invalidate_gendisk() helper on disconnect
Date: Mon, 13 Sep 2021 19:25:57 +0800
Message-Id: <20210913112557.191-4-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913112557.191-1-xieyongji@bytedance.com>
References: <20210913112557.191-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dw1D9YffnqE.A.sBD.zkzPhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1437
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210913112557.191-4-xieyongji@bytedance.com
Resent-Date: Mon, 13 Sep 2021 11:42:43 +0000 (UTC)

When a nbd device encounters a writeback error, that error will
get propagated to the bd_inode's wb_err field. Then if this nbd
device's backend is disconnected and another is attached, we will
get back the previous writeback error on fsync, which is unexpected.

To fix it, let's use invalidate_gendisk() helper to invalidate the
disk on disconnect instead of just setting disk's capacity to zero.

Reported-by: Yi Xingchen <yixingchen@bytedance.com>
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/block/nbd.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5170a630778d..64ae087d8767 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -305,14 +305,6 @@ static void nbd_mark_nsock_dead(struct nbd_device *nbd, struct nbd_sock *nsock,
 	nsock->sent = 0;
 }
 
-static void nbd_size_clear(struct nbd_device *nbd)
-{
-	if (nbd->config->bytesize) {
-		set_capacity(nbd->disk, 0);
-		kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
-	}
-}
-
 static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		loff_t blksize)
 {
@@ -1232,7 +1224,9 @@ static void nbd_config_put(struct nbd_device *nbd)
 					&nbd->config_lock)) {
 		struct nbd_config *config = nbd->config;
 		nbd_dev_dbg_close(nbd);
-		nbd_size_clear(nbd);
+		invalidate_gendisk(nbd->disk);
+		if (nbd->config->bytesize)
+			kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
 		if (test_and_clear_bit(NBD_RT_HAS_PID_FILE,
 				       &config->runtime_flags))
 			device_remove_file(disk_to_dev(nbd->disk), &pid_attr);
-- 
2.11.0

