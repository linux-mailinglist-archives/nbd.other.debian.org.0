Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDD027DF15
	for <lists+nbd@lfdr.de>; Wed, 30 Sep 2020 05:42:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7682020399; Wed, 30 Sep 2020 03:42:29 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 30 03:42:29 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 390D9203A3
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Sep 2020 03:24:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8PhhFBLuVpY9 for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Sep 2020 03:24:24 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pf1-x442.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 02C0D203A1
	for <nbd@other.debian.org>; Wed, 30 Sep 2020 03:24:23 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id z19so188423pfn.8
        for <nbd@other.debian.org>; Tue, 29 Sep 2020 20:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6My0Z+fWlbEWCjwe75rZEWMn1qf7MfXmAiVkbDm86Ao=;
        b=iJm2dhvt5V1TJ8YNZv3BqDSfAm8v3C9qRUyHnODYrFUPyGDM3c+YB8vUc1Ckzo1EJh
         qr9Sub6bUW0h7SO2IuvlwSgBnWwZeq6V+ak47Z/RmNErDBUbxx7u2sk4ecZHUzCuH43M
         RcL8/htsxThtWatfcFFS0+8yqCyyUqr6mhZ40SaTMogAnjyamSJzyHqixCiX0WIZ399P
         0pW5xNPJXg9017EHQAzUH53tKVXvzmuY0aKLen1XAxPmA+ETxhXlEPXTMUBqQLOUkEOj
         a4d71/BqdOMKaoKQHrwkDJtxKjuMrl6KfS7tEaQ5EibWu3yVxh7Pb0pTGfesyG9PRvcR
         U7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6My0Z+fWlbEWCjwe75rZEWMn1qf7MfXmAiVkbDm86Ao=;
        b=i2J5vjj0mYe5ujD6EmFrBMEcCnocbJUpuHYCQyF7UCRiD7uQom97Lg3V2NidCzxXpL
         pwAuyQGMfv1xE2iU8vdqXTBVC4twX2e14kdVx/L9ZV0abl0XmRySgXPMrOcnPem9/LIv
         YKkz9SulXMSJfVAOn+bkhJtdxoFTk8A7R5GJeFYTS5RwtyyytMoGzZyerHyXods9w4MZ
         S8AkSucDErSpr5K6F42LfMkn+xguSheLzx2he7ak60VC9buUri7NAzPxo2XCTi+LKwm+
         dbK6M+QCEKS4DfkO3kATHoTFOLJau815+22iLSPWZGXMzkXF5q+aUuy3nBS4TkFkMeDU
         8Uwg==
X-Gm-Message-State: AOAM531FMG85wx9vqpC2DiD6oavUGO4RfccuIrHyx5Q7E59k7kDyuNJx
	7bdkfN2yfRfaxw1RrD1ApRM3qA==
X-Google-Smtp-Source: ABdhPJxDr9iPj4HinYZB+pxSlJHHYS/JVW/ShH8imjNF+0TR7HjIqXe5jMWJZpzhwFRfLYQ81tX//Q==
X-Received: by 2002:aa7:9f99:0:b029:13e:d13d:a134 with SMTP id z25-20020aa79f990000b029013ed13da134mr763143pfr.28.1601436260526;
        Tue, 29 Sep 2020 20:24:20 -0700 (PDT)
Received: from box.bytedance.net ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id w195sm226105pff.74.2020.09.29.20.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 20:24:20 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH v3 2/2] nbd: introduce a client flag to do zero timeout handling
Date: Wed, 30 Sep 2020 11:23:50 +0800
Message-Id: <20200930032350.3936-3-houpu@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930032350.3936-1-houpu@bytedance.com>
References: <20200930032350.3936-1-houpu@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JLsAvp18JXF.A.AF.l6_cfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1008
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200930032350.3936-3-houpu@bytedance.com
Resent-Date: Wed, 30 Sep 2020 03:42:29 +0000 (UTC)

Introduce a dedicated client flag NBD_RT_WAIT_ON_TIMEOUT to reset
timer in nbd_xmit_timer instead of depending on tag_set.timeout == 0.
So that the timeout value could be configured by the user to
whatever they like instead of the default 30s. A smaller timeout
value allow us to detect if a new socket is reconfigured in a
shorter time. Thus the io could be requeued more quickly.

In multiple sockets configuration, the user could also disable
dropping the socket in timeout by setting this flag.

The tag_set.timeout == 0 setting still works like before.

Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Hou Pu <houpu@bytedance.com>
---
 drivers/block/nbd.c      | 27 ++++++++++++++++++++++-----
 include/uapi/linux/nbd.h |  4 ++++
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 538e9dcf5bf2..2d32e31b7b96 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -80,6 +80,7 @@ struct link_dead_args {
 #define NBD_RT_BOUND			5
 #define NBD_RT_DESTROY_ON_DISCONNECT	6
 #define NBD_RT_DISCONNECT_ON_CLOSE	7
+#define NBD_RT_WAIT_ON_TIMEOUT		8
 
 #define NBD_DESTROY_ON_DISCONNECT	0
 #define NBD_DISCONNECT_REQUESTED	1
@@ -378,6 +379,16 @@ static u32 req_to_nbd_cmd_type(struct request *req)
 	}
 }
 
+static inline bool wait_on_timeout(struct nbd_device *nbd,
+				   struct nbd_config *config)
+{
+	if (test_bit(NBD_RT_WAIT_ON_TIMEOUT, &config->runtime_flags) ||
+	    (config->num_connections == 1 && nbd->tag_set.timeout == 0))
+		return true;
+	else
+		return false;
+}
+
 static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 						 bool reserved)
 {
@@ -400,8 +411,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 	    nbd->tag_set.timeout)
 		goto error_out;
 
-	if (config->num_connections > 1 ||
-	    (config->num_connections == 1 && nbd->tag_set.timeout)) {
+	if (!wait_on_timeout(nbd, config)) {
 		dev_err_ratelimited(nbd_to_dev(nbd),
 				    "Connection timed out, retrying (%d/%d alive)\n",
 				    atomic_read(&config->live_connections),
@@ -432,9 +442,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 			nbd_config_put(nbd);
 			return BLK_EH_DONE;
 		}
-	}
-
-	if (!nbd->tag_set.timeout) {
+	} else {
 		/*
 		 * Userspace sets timeout=0 to disable socket disconnection,
 		 * so just warn and reset the timer.
@@ -1956,6 +1964,9 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 			set_bit(NBD_RT_DISCONNECT_ON_CLOSE,
 				&config->runtime_flags);
 		}
+		if (flags & NBD_CFLAG_WAIT_ON_TIMEOUT)
+			set_bit(NBD_RT_WAIT_ON_TIMEOUT,
+				&config->runtime_flags);
 	}
 
 	if (info->attrs[NBD_ATTR_SOCKETS]) {
@@ -2139,6 +2150,12 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 			clear_bit(NBD_RT_DISCONNECT_ON_CLOSE,
 					&config->runtime_flags);
 		}
+		if (flags & NBD_CFLAG_WAIT_ON_TIMEOUT)
+			set_bit(NBD_RT_WAIT_ON_TIMEOUT,
+				&config->runtime_flags);
+		else
+			clear_bit(NBD_RT_WAIT_ON_TIMEOUT,
+				  &config->runtime_flags);
 	}
 
 	if (info->attrs[NBD_ATTR_SOCKETS]) {
diff --git a/include/uapi/linux/nbd.h b/include/uapi/linux/nbd.h
index 20d6cc91435d..cc3abfb92de5 100644
--- a/include/uapi/linux/nbd.h
+++ b/include/uapi/linux/nbd.h
@@ -56,6 +56,10 @@ enum {
 #define NBD_CFLAG_DISCONNECT_ON_CLOSE (1 << 1) /* disconnect the nbd device on
 						*  close by last opener.
 						*/
+#define NBD_CFLAG_WAIT_ON_TIMEOUT (1 << 2) /* do not fallback to other sockets
+					    * in io timeout, instead just reset
+					    * timer and wait.
+					    */
 
 /* userspace doesn't need the nbd_device structure */
 
-- 
2.11.0

