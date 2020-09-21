Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E18272211
	for <lists+nbd@lfdr.de>; Mon, 21 Sep 2020 13:15:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 93B52202FE; Mon, 21 Sep 2020 11:15:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 21 11:15:41 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6A1F2202CF
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Sep 2020 10:57:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9KlZnkWHi2zT for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Sep 2020 10:57:50 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pg1-x544.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3BC522029E
	for <nbd@other.debian.org>; Mon, 21 Sep 2020 10:57:50 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id l191so8693433pgd.5
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 03:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/xfvcdsom/q5CUNFRcCmgVmkzsyJDy2Xd2OuyVyhn8=;
        b=uqDVLCYQdF1Ohh6ZxVL4Mu7FFkm44LXZf6/pkHn6s6e2ym9Li56WYMHqTel7GwRF0B
         zgFyXa2swPoJOeFy30PK+tG741ycyZ/nwWVzLDFfwj0m119f08t5xXyxqZTf7Wwu5u+y
         lenY0/uPwqWOYpUigNwuLtglCwjhUOe6GGr/1r2KEo6rr5Bg4ECnfE2WoEOaaoOrflIi
         BpbdYfOq6/WXXwLEtHiawcH66+iEPIwiUOd9YvS5WVF6UEUjWNq0Ww1Y7bjnOpak49Lc
         GL0Eb5aaU+ImmSN2V5VHrZ07K+JFo1JSfz+nDh74x1y2z2Ry3BT2SpXVxSY2jDW3EEM5
         0C3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/xfvcdsom/q5CUNFRcCmgVmkzsyJDy2Xd2OuyVyhn8=;
        b=DwH6RJt/yXrbp9t4E0Tu8J8KalTc7grgyyRljpSYLaao4wTqQaLIEUtdl+0QG6qcnI
         30y9/sAo40wGyszxJOmgLJ2v1z4NUoEftW6PsSkVyEYKbWjdBB3HFN5MOzHWOO9ocl/4
         mePvF1RZ95E+MaqjwjmdC890NQhSv8Ckp2lV1lUKe3XXaxzAyzmqNFJOfI6NsgR39spj
         ThBK39p4E7uo21bWlvB1nAYP2qwotLsoJ+z3lzSW8I3++Cpu12WFb3kt8V86yO9y4Dwl
         hIO8AaEk2+b6QZMXSizJYhIELo3bkdik3Dr9MxPTl5kEyTgt7mqVhTXeLKNr+0s36Xfx
         gtLQ==
X-Gm-Message-State: AOAM533Ae4SHqvaOeojJsuWnO3/aLv6s1O9SXYYEzKmIkOjqSqRvowXL
	3PoFlTJxTF61tA9QV1dSJyiILg==
X-Google-Smtp-Source: ABdhPJwk3qxw881cWJf/l4dmF0k0V+qLlV4v6C5M4UEKY+xiqhQbULAd/YIQrRtCDUEyIfyq8hJDeA==
X-Received: by 2002:a17:902:ba98:b029:d1:e598:3ff2 with SMTP id k24-20020a170902ba98b02900d1e5983ff2mr26553974pls.44.1600685866739;
        Mon, 21 Sep 2020 03:57:46 -0700 (PDT)
Received: from box.bytedance.net ([61.120.150.73])
        by smtp.gmail.com with ESMTPSA id x62sm2792533pfx.20.2020.09.21.03.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 03:57:46 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: mchristi@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH 3/3] nbd: introduce a client flag to do zero timeout handling
Date: Mon, 21 Sep 2020 18:57:18 +0800
Message-Id: <20200921105718.29006-4-houpu@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921105718.29006-1-houpu@bytedance.com>
References: <20200921105718.29006-1-houpu@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7L_8GlZvgVE.A.hu.dtIafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/992
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200921105718.29006-4-houpu@bytedance.com
Resent-Date: Mon, 21 Sep 2020 11:15:41 +0000 (UTC)

Introduce a dedicated client flag NBD_RT_WAIT_ON_TIMEOUT to reset
timer in nbd_xmit_timer instead of depending on tag_set.timeout == 0.
So that the timeout value could be configured by the user to
whatever they like instead of the default 30s. A smaller timeout
value allow us to detect if a new socket is reconfigured in a
shorter time. Thus the io could be requeued more quickly.

The tag_set.timeout == 0 setting still works like before.

Signed-off-by: Hou Pu <houpu@bytedance.com>
---
 drivers/block/nbd.c      | 25 ++++++++++++++++++++++++-
 include/uapi/linux/nbd.h |  4 ++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 4c0bbb981cbc..1d7a9de7bdcc 100644
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
+	    nbd->tag_set.timeout == 0)
+		return true;
+	else
+		return false;
+}
+
 static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 						 bool reserved)
 {
@@ -400,7 +411,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 	    nbd->tag_set.timeout)
 		goto error_out;
 
-	if (nbd->tag_set.timeout) {
+	if (!wait_on_timeout(nbd, config)) {
 		dev_err_ratelimited(nbd_to_dev(nbd),
 				    "Connection timed out, retrying (%d/%d alive)\n",
 				    atomic_read(&config->live_connections),
@@ -1953,6 +1964,10 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 			set_bit(NBD_RT_DISCONNECT_ON_CLOSE,
 				&config->runtime_flags);
 		}
+		if (flags & NBD_CFLAG_WAIT_ON_TIMEOUT) {
+			set_bit(NBD_RT_WAIT_ON_TIMEOUT,
+				&config->runtime_flags);
+		}
 	}
 
 	if (info->attrs[NBD_ATTR_SOCKETS]) {
@@ -2136,6 +2151,14 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 			clear_bit(NBD_RT_DISCONNECT_ON_CLOSE,
 					&config->runtime_flags);
 		}
+		if (flags & NBD_CFLAG_WAIT_ON_TIMEOUT) {
+			set_bit(NBD_RT_WAIT_ON_TIMEOUT,
+				&config->runtime_flags);
+		} else {
+			clear_bit(NBD_RT_WAIT_ON_TIMEOUT,
+				  &config->runtime_flags);
+		}
+
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

