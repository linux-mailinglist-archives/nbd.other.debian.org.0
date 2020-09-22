Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EA8273967
	for <lists+nbd@lfdr.de>; Tue, 22 Sep 2020 05:51:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7156C20413; Tue, 22 Sep 2020 03:51:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 22 03:51:30 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7C6D820410
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Sep 2020 03:35:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kteIlAglKMPv for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Sep 2020 03:35:20 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pf1-x444.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 484D8203E2
	for <nbd@other.debian.org>; Tue, 22 Sep 2020 03:35:19 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id z19so11167661pfn.8
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 20:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=URq/xhP9+fAfE1goafcar9I+Snu4Kh15c5GaXKmgMX0=;
        b=QyobmZ6y/WZK9DKhHrqjYkY7TxUeEvUTW/Wdbpp+CdU/igbpd3c6YEn715Exl1ZLXL
         0X4G1B9bAntz87g9YLBEvA7/UnSnLafOxGJLI6pgItnoYjx2Jz/OD9j3RjbztyHMrKF6
         ae+0IVjz0w8SkMq+XGoZm6v4IeF/YYHAhCJFZY4lp1tssGaO8b2JV7NgVEKFzRNlBMPP
         e+HzTIxf9oOP03VMhF8lSlMT/vSBaCwYuruTostMD6Fu4aCB54zJKVZLrFb4Cw7yApRS
         k4ueXYDFI1DWBXmv7YDew6Yjht83aQkop9tLR5vzcW6wz0b33cU1gyeZRrDKmheSsKTl
         0Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=URq/xhP9+fAfE1goafcar9I+Snu4Kh15c5GaXKmgMX0=;
        b=I0FpA3407jw4YQipJImNMzzK0D4wNiqhoLvG6qVBUXcHyBcyrNOkU7IvqLFKiXAY6w
         UglHjXAF5o22au0nwZznxdp36Lz8A+FEq1wyzJjCRbUtRe5SZxxoX/YepRTgmQ2xyQ9n
         3LgKsuBVVdupa78CSWKE3KVsVSny1ff31Vrwo+cNoSYgOzdIKCu8LazWYp6kSIDrzvjS
         BMjNM4eeDoIiydrilV15y0FsDl6QXf4L/vKPvzcjmJIFpmOcCQ2SgKrFTNGoH1KIc1im
         op5D4HjfL6NclBdddeOr4oyCwN4qmKbg7U7FZK7kQ6HpsMSQTdRleH89GI7uxvPz7r08
         mKSw==
X-Gm-Message-State: AOAM533jbdM7QV2L8TB0oLnX208rctYcvoNpmrooVvJ5wj8nVRYGjE1L
	VCD2/QQpAHqxBKNttEpjDTABEw==
X-Google-Smtp-Source: ABdhPJyAkdf0DsTCkYk9SBqH6P0qqTA0k5xGM1xE1IgtyvbIPAYbOyFHYIAuLvMPAFN1zdaQAU+huA==
X-Received: by 2002:aa7:961b:0:b029:13e:d13d:a140 with SMTP id q27-20020aa7961b0000b029013ed13da140mr2423868pfg.40.1600745716484;
        Mon, 21 Sep 2020 20:35:16 -0700 (PDT)
Received: from box.bytedance.net ([61.120.150.73])
        by smtp.gmail.com with ESMTPSA id mp3sm714859pjb.33.2020.09.21.20.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 20:35:15 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: mchristi@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH v2 2/2] nbd: introduce a client flag to do zero timeout handling
Date: Tue, 22 Sep 2020 11:34:57 +0800
Message-Id: <20200922033457.46227-3-houpu@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200922033457.46227-1-houpu@bytedance.com>
References: <20200922033457.46227-1-houpu@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <H6y1M6TAQdJ.A.gn.CTXafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1001
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200922033457.46227-3-houpu@bytedance.com
Resent-Date: Tue, 22 Sep 2020 03:51:30 +0000 (UTC)

Introduce a dedicated client flag NBD_RT_WAIT_ON_TIMEOUT to reset
timer in nbd_xmit_timer instead of depending on tag_set.timeout == 0.
So that the timeout value could be configured by the user to
whatever they like instead of the default 30s. A smaller timeout
value allow us to detect if a new socket is reconfigured in a
shorter time. Thus the io could be requeued more quickly.

In multiple sockets configuration, the user could also disable
dropping the socket in timeout by setting this flag.

The tag_set.timeout == 0 setting still works like before.

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

