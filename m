Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD794149D4
	for <lists+nbd@lfdr.de>; Wed, 22 Sep 2021 14:54:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AB1DE20C8C; Wed, 22 Sep 2021 12:54:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 22 12:54:53 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D735320BD2
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Sep 2021 12:38:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WmHlU160VgKt for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Sep 2021 12:38:08 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pl1-x62a.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6AE7920BCB
	for <nbd@other.debian.org>; Wed, 22 Sep 2021 12:38:08 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id w11so1631604plz.13
        for <nbd@other.debian.org>; Wed, 22 Sep 2021 05:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kxSMi77DP/81jKfTEyWRr1K8Oy1BynKy6PZ+nkMR/NE=;
        b=i7Qu7NgdNZ6RLlYTl5HwdYyKLFUUokhle63auwvY/o9uWGH3zslNRAh4icmrRMioyo
         aYRTd3/apd9tN32dkNhTpPQMv2avl21JepItcO49BdXEhRYIghJzhhXqQrX7nrQI/jZr
         p012ZmpeS1swvfT7hG7T1ynlviTV5HtGW8bRUuOQf6OXB5KUkRYINKizcypSp8IVNJMF
         HOcTEjqyFAcC8MxzG/BBG1dGU6uVLff9ZzRkw38pj6H8qqDGTVzkVIxG7w8rDUs1c/5l
         y55oroHBOwS9WSEuSd8HS9icctgh7+5Y5yIXflC6lU2ao++zOaJ2lmdsJSZ0D8yeGaw6
         VyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kxSMi77DP/81jKfTEyWRr1K8Oy1BynKy6PZ+nkMR/NE=;
        b=DekmUF05KRQOI11i4BrEINClrbPqvxRlWRCEWs8rgf+5cFTrQ0fBaUNV7P9vVh5aS8
         X0zJh8Q1emtkSexL5Be+sXdKwW6UKZv0R1FztC4BKxXRPp1w5qpX8eZ9aZ2dYni6TvsN
         frL92Gu+lMqr2jZ8xvQiPyJnjxMaJdQLAFE2FwZnOi4Z1r5DZG1Rsl+J0zPr4FI+uPKk
         CYuEhbkrcl6+39EFsyyYewY24T9f8CcWVVPH9a6Lw33BlVye6kCXI8JUq2C4GH2DByBx
         L6y9ksh/Ie5PZQSvPkY63SSSvT/D/lHfqhbOZr4rAtS6w5rayExU3eR+8I0ItkcNMeXm
         n32A==
X-Gm-Message-State: AOAM533ZD4PTFVm4k3fvVC0k92pBS5lorhuxqDnNimSIWjl1+fqiC1GV
	PQprUy1aBgTl585FMbWR1sYT
X-Google-Smtp-Source: ABdhPJy+3Mex0kY5GqqwrN4uXAbiWworu3QHnc2a3ZRbxnAO3m2HSgYPhCM0u48o74Do/MXWFigPtQ==
X-Received: by 2002:a17:90a:62ca:: with SMTP id k10mr11053495pjs.38.1632314284894;
        Wed, 22 Sep 2021 05:38:04 -0700 (PDT)
Received: from localhost ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id 23sm2859018pfw.97.2021.09.22.05.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 05:38:04 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	josef@toxicpanda.com,
	hch@infradead.org
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: [PATCH v2 4/4] nbd: Use invalidate_disk() helper on disconnect
Date: Wed, 22 Sep 2021 20:37:11 +0800
Message-Id: <20210922123711.187-5-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922123711.187-1-xieyongji@bytedance.com>
References: <20210922123711.187-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bYG-o5aybaP.A.qY.deyShB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1523
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210922123711.187-5-xieyongji@bytedance.com
Resent-Date: Wed, 22 Sep 2021 12:54:53 +0000 (UTC)

When a nbd device encounters a writeback error, that error will
get propagated to the bd_inode's wb_err field. Then if this nbd
device's backend is disconnected and another is attached, we will
get back the previous writeback error on fsync, which is unexpected.

To fix it, let's use invalidate_disk() helper to invalidate the
disk on disconnect instead of just setting disk's capacity to zero.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/block/nbd.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5170a630778d..19f2e1247416 100644
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
+		invalidate_disk(nbd->disk);
+		if (nbd->config->bytesize)
+			kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
 		if (test_and_clear_bit(NBD_RT_HAS_PID_FILE,
 				       &config->runtime_flags))
 			device_remove_file(disk_to_dev(nbd->disk), &pid_attr);
-- 
2.11.0

