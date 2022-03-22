Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B17F34E3A7A
	for <lists+nbd@lfdr.de>; Tue, 22 Mar 2022 09:24:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 72005203A8; Tue, 22 Mar 2022 08:24:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 22 08:24:10 2022
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 92EBA2044A
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Mar 2022 08:07:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.99 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qdf3FguGkJbk for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Mar 2022 08:07:33 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pg1-x52c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 35B8B202A3
	for <nbd@other.debian.org>; Tue, 22 Mar 2022 08:07:29 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id o13so12075340pgc.12
        for <nbd@other.debian.org>; Tue, 22 Mar 2022 01:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HCeG+e3i+kXW9AfySwSJpDg7ddb/m+jr34UFwVRHhds=;
        b=tzNF8shRcdEElNv8CUpbtIR8J5Ve65fWjOhm2gwoKzZc+TPUpSwzhjFM/Lq7d4+VPw
         7/2r36VgjEstcRi1yF6eQINGiqt/V55Fv81++rEv9yl4uDOf6yKR8lqyoQzHo1Lrr2ox
         Zcv5bD2Q0twSiZZtnlWHDlmI2qdtHWa4ze/GNBHsmsJQ0QpHnOMHnJwAA++XKA5LxCxl
         4cJcJKp0AVir7a+kamNfJRWTNnlH+N++DnFDkxEQqVopDxj6lgiitl8bgbJNAIIoCYjG
         fn+vdoup2Ki9ep1+XoJBN2GPFnnSCbVugJW78GnnD11L216cj5NG4wlj+mZ1+5kMc8DX
         27XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HCeG+e3i+kXW9AfySwSJpDg7ddb/m+jr34UFwVRHhds=;
        b=ApnIzp1JmnaXIt0mxep8rBVjy0r0waoLQFH2JU9jLiyoIWm6OiRUij1dX411SKKr3z
         YKJIpXqOicO0ghp74GbjNqDCN63fr2wNjmWuAhwraNwYBQJM1VL+LKl3X34AiinIMDAU
         iyaxB0Cj1lVHsVmzOfZs3HZnl5I4JTgq6snoYtIBmVak1SMftGnGoxk/E+tCxy9wUxoV
         sI4SEWMLfTcVxAgl4cYQ+6gu88Bf3FT96xlHtG8q6jXppvZ462kVBA5ppoWpdYpsfunI
         RHSkuj+BXmyHX1hCO7EGvRLV7KePKr0BLlOPRGaMgh7vzJYXPLtCEtv5rAX4QkRdNDy2
         2TSw==
X-Gm-Message-State: AOAM5321d6HUDSVZv/wi9sXrLdF3VHPikDd7xNntXW2nZYcwe57izDFO
	aS6Gt9Usnmu7bXTk69H/8qw1FqY0h7P0
X-Google-Smtp-Source: ABdhPJx7mcdP4faDjZ/NqyNvWtQ6EcoJ90TX7jmxYq6YyRVe3dGGpYo87cXoINNCwHOcL6tssWctXg==
X-Received: by 2002:a62:d0c1:0:b0:4fa:81f5:b9d4 with SMTP id p184-20020a62d0c1000000b004fa81f5b9d4mr15136194pfg.49.1647936445586;
        Tue, 22 Mar 2022 01:07:25 -0700 (PDT)
Received: from localhost ([139.177.225.235])
        by smtp.gmail.com with ESMTPSA id e12-20020a056a001a8c00b004fab88d7de8sm1901149pfv.132.2022.03.22.01.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 01:07:25 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	zero.xu@bytedance.com
Subject: [PATCH] nbd: Fix hung on disconnect request if socket is closed before
Date: Tue, 22 Mar 2022 16:06:39 +0800
Message-Id: <20220322080639.142-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <e5DMCZwDsmG.A.EzG.qeYOiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1741
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220322080639.142-1-xieyongji@bytedance.com
Resent-Date: Tue, 22 Mar 2022 08:24:10 +0000 (UTC)

When userspace closes the socket before sending a disconnect
request, the following I/O requests will be blocked in
wait_for_reconnect() until dead timeout. This will cause the
following disconnect request also hung on blk_mq_quiesce_queue().
That means we have no way to disconnect a nbd device if there
are some I/O requests waiting for reconnecting until dead timeout.
It's not expected. So let's wake up the thread waiting for
reconnecting directly when a disconnect request is sent.

Reported-by: Xu Jianhai <zero.xu@bytedance.com>
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/block/nbd.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5a1f98494ddd..284557041336 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -947,11 +947,15 @@ static int wait_for_reconnect(struct nbd_device *nbd)
 	struct nbd_config *config = nbd->config;
 	if (!config->dead_conn_timeout)
 		return 0;
-	if (test_bit(NBD_RT_DISCONNECTED, &config->runtime_flags))
+
+	if (!wait_event_timeout(config->conn_wait,
+				test_bit(NBD_RT_DISCONNECTED,
+					 &config->runtime_flags) ||
+				atomic_read(&config->live_connections) > 0,
+				config->dead_conn_timeout))
 		return 0;
-	return wait_event_timeout(config->conn_wait,
-				  atomic_read(&config->live_connections) > 0,
-				  config->dead_conn_timeout) > 0;
+
+	return !test_bit(NBD_RT_DISCONNECTED, &config->runtime_flags);
 }
 
 static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
@@ -2082,6 +2086,7 @@ static void nbd_disconnect_and_put(struct nbd_device *nbd)
 	mutex_lock(&nbd->config_lock);
 	nbd_disconnect(nbd);
 	sock_shutdown(nbd);
+	wake_up(&nbd->config->conn_wait);
 	/*
 	 * Make sure recv thread has finished, we can safely call nbd_clear_que()
 	 * to cancel the inflight I/Os.
-- 
2.20.1

