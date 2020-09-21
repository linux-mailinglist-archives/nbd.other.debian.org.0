Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FCB272208
	for <lists+nbd@lfdr.de>; Mon, 21 Sep 2020 13:15:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BFA7C202FE; Mon, 21 Sep 2020 11:15:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 21 11:15:20 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D75B92029F
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Sep 2020 10:57:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xO0CJaodWjvI for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Sep 2020 10:57:39 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pf1-x441.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 85DF9202B7
	for <nbd@other.debian.org>; Mon, 21 Sep 2020 10:57:39 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id o20so8915992pfp.11
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 03:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nQ1pzbZrgzJJQpMDYQTBcOdTlRrGz+dy3qDGLfhCAfw=;
        b=dvinSlht/xTwKBw4s0KvbDkqLUHzosRMqfsm+WjozkbupmcThFf8lZ0VthOnskuC58
         5E+9l3m4568A4Gfy8emNp1jXKRZLzkydnMlbQWmfgCxl6FtgIW7kAitgpWTSjjU38nYr
         eOLCpSuf3c8CcQJ4XHfSEFtvfQwRTmQaMrg2SlN0kyALE72BjlfRsw5aEMn+zp9RWOzR
         mZnAjzIBRRhW2rZb0DJAdFgoDFLnilRHrNMoaI3mXBDW8VY7FXmI+1wmXXVaO7INbHgS
         mnXitdoNVh2rjhd9n1RIvb3cThZQ2u+qp0IEzdjiZ2cUT/w+xnZZlP874OQqLlvqv029
         wqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nQ1pzbZrgzJJQpMDYQTBcOdTlRrGz+dy3qDGLfhCAfw=;
        b=F07k6L32VYLHF3M19Rdgp5UeBWrVIcNio4Qu+44GvjUKi6CgqIjxh6wt3WPQm9L5ua
         F3CmpJx3ZbYmU8L3qp9AS6c7vRhBK5wiIsB73B+yqi7E5D6/7RwgCERArSCpC/SISGG7
         ukHaNANMkGjTkQUUYwS9L3T9StGSb3zHEzBqVbBlESG/VFhKkmU9lH6QIBWcT0WnBbOz
         Gz0Ork428cRgQoNHvh2RdVoomsoIv4VCSs+obkLrEZegQkHMa1EcjTvFhg1lvKzWkPOE
         yHyV1cvcJQ3oV4RqwvmiIwodqjBaosIwm6OGBQ5SAxsTuTw/Sl3LkasHVepU9UNOhDsj
         IfrA==
X-Gm-Message-State: AOAM530gXLUwx1vsSxXYnlwEdz+YrY4Q3CS8532o8mgZhnHJb8AP6ujc
	EmXTHBmox7Z8g0HFNpIee0c1tA==
X-Google-Smtp-Source: ABdhPJxlvlSQ9dGrlkhKk5ujWZXT/32fv2UlF4rF9hLObyIKyrM5ywK2vvscU2bBidBZYC4NUc5rgg==
X-Received: by 2002:a63:2209:: with SMTP id i9mr31842480pgi.130.1600685856136;
        Mon, 21 Sep 2020 03:57:36 -0700 (PDT)
Received: from box.bytedance.net ([61.120.150.73])
        by smtp.gmail.com with ESMTPSA id x62sm2792533pfx.20.2020.09.21.03.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 03:57:35 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: mchristi@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH 1/3] nbd: return -ETIMEDOUT when NBD_DO_IT ioctl returns
Date: Mon, 21 Sep 2020 18:57:16 +0800
Message-Id: <20200921105718.29006-2-houpu@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921105718.29006-1-houpu@bytedance.com>
References: <20200921105718.29006-1-houpu@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pRb2Q-QdkmG.A.Rp.ItIafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/990
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200921105718.29006-2-houpu@bytedance.com
Resent-Date: Mon, 21 Sep 2020 11:15:20 +0000 (UTC)

We used to return -ETIMEDOUT if io timeout happened. But since
commit d970958b2d24 ("nbd: enable replace socket if only one
connection is configured"), user space would not get -ETIMEDOUT.
This commit fixes this. Only return -ETIMEDOUT if only one socket
is configured by ioctl and the user specified a non-zero timeout
value.

Signed-off-by: Hou Pu <houpu@bytedance.com>
---
 drivers/block/nbd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ce7e9f223b20..538e9dcf5bf2 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -395,6 +395,11 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 	}
 	config = nbd->config;
 
+	if (!test_bit(NBD_RT_BOUND, &config->runtime_flags) &&
+	    config->num_connections == 1 &&
+	    nbd->tag_set.timeout)
+		goto error_out;
+
 	if (config->num_connections > 1 ||
 	    (config->num_connections == 1 && nbd->tag_set.timeout)) {
 		dev_err_ratelimited(nbd_to_dev(nbd),
@@ -455,6 +460,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 		return BLK_EH_RESET_TIMER;
 	}
 
+error_out:
 	dev_err_ratelimited(nbd_to_dev(nbd), "Connection timed out\n");
 	set_bit(NBD_RT_TIMEDOUT, &config->runtime_flags);
 	cmd->status = BLK_STS_IOERR;
-- 
2.11.0

