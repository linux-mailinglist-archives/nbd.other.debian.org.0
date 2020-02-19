Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 25331163D31
	for <lists+nbd@lfdr.de>; Wed, 19 Feb 2020 07:48:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EB4B420346; Wed, 19 Feb 2020 06:48:29 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 19 06:48:29 2020
Old-Return-Path: <houpu.main@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MURPHY_DRUGS_REL8
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D1EBF20336
	for <lists-other-nbd@bendel.debian.org>; Wed, 19 Feb 2020 06:32:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 51C5EqjX3qXx for <lists-other-nbd@bendel.debian.org>;
	Wed, 19 Feb 2020 06:32:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8EA5120174
	for <nbd@other.debian.org>; Wed, 19 Feb 2020 06:32:40 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id j17so2103965pjz.3
        for <nbd@other.debian.org>; Tue, 18 Feb 2020 22:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GIqVMX3DyGkECipnIGRvXSYBH0RbpyXbsUDROYd/soc=;
        b=a7WbM4KdSNIddESKcsNZA/pa1SEh8uKGW+0DOSOQKDQQvBIsFWtRt6ML9av02t03Eq
         /4Fj+J/ApTKTgcAUk/imL8mTrM5UA5TtnXwVMEmO2dAKY1Y6yBmCDhjsi7g7V71op0FI
         vT4ihN9kcHHNoKC0vSlp1NB+hPMfVg6rA6fj35xhzT5zG4wLl8IuRxUfjarmAw3XfXkX
         a7jFLfqoDUcSOtQxK2wfbP5GEUlrtGinwH2Cnuw/35P09rx2B8zsPlgb3VfUu0gQKp24
         XflBEHyi9qPNg0AxnAcOVOsCpwyfBwH/47mlFw3nDPWyHPJE81lGpT+CfG60D52h9Qvt
         Yc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GIqVMX3DyGkECipnIGRvXSYBH0RbpyXbsUDROYd/soc=;
        b=SB/fKdFt1iGxLxUsfjpCMmYMx6jBE9NtkcowFK5fE6EgtVxxRe9UjlS3Rofduvrk67
         qnHvJE4275DlD8DUM5CBKBkgzTNq7IM/ph3Oy+IsuyXPqf0JHvcqxGNOIRRz3STD3e8o
         H3rAeIeKWh+OYIcS7ornNzcahomJD+zH856ActTtMTi9/9IJ8zEuMRz32120nN0n+mRg
         u04qrk2ibwgAWFR0n4rRbAPa/F5vr3X2YdU77Hj2eO3VkEh0Obzlb0D+t3flZ6sH9hja
         GJLvEeaOYvcgWyJIYKWglge3aE01fInz//jpCm81CLOVNinjMOVBr/60Ie+oSQiq+tWo
         31EA==
X-Gm-Message-State: APjAAAWDvXy9nUCLMZnPcsKPoPowbgEqYmrBJ0svWgN81U7TzT//p78+
	AsZPKm3UgvtwSl5nvxmnWcI=
X-Google-Smtp-Source: APXvYqyg0oBKK7byB0Yhw0ShZPXiyOyIrdj6lzVTuW6ii1cE/rS1BMWyTZGiqKO2TVyQjKmoFAixHw==
X-Received: by 2002:a17:902:9890:: with SMTP id s16mr22405849plp.77.1582093957276;
        Tue, 18 Feb 2020 22:32:37 -0800 (PST)
Received: from debian.lc ([61.120.150.75])
        by smtp.gmail.com with ESMTPSA id e7sm1184487pfj.114.2020.02.18.22.32.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Feb 2020 22:32:36 -0800 (PST)
From: Hou Pu <houpu.main@gmail.com>
X-Google-Original-From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	mchristi@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH 2/2] nbd: requeue command if the soecket is changed
Date: Wed, 19 Feb 2020 01:31:07 -0500
Message-Id: <20200219063107.25550-3-houpu@bytedance.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200219063107.25550-1-houpu@bytedance.com>
References: <20200219063107.25550-1-houpu@bytedance.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lKql0630eeO.A.aKF.9oNTeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/830
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200219063107.25550-3-houpu@bytedance.com
Resent-Date: Wed, 19 Feb 2020 06:48:29 +0000 (UTC)

In commit 2da22da5734 (nbd: fix zero cmd timeout handling v2),
it is allowed to reset timer when it fires if tag_set.timeout
is set to zero. If the server is shutdown and a new socket
is reconfigured, the request should be requeued to be processed by
new server instead of waiting for response from the old one.

Signed-off-by: Hou Pu <houpu@bytedance.com>
---
 drivers/block/nbd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 8e348c9c49a4..7bbc5477066c 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -434,12 +434,22 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 		 * Userspace sets timeout=0 to disable socket disconnection,
 		 * so just warn and reset the timer.
 		 */
+		struct nbd_sock *nsock = config->socks[cmd->index];
 		cmd->retries++;
 		dev_info(nbd_to_dev(nbd), "Possible stuck request %p: control (%s@%llu,%uB). Runtime %u seconds\n",
 			req, nbdcmd_to_ascii(req_to_nbd_cmd_type(req)),
 			(unsigned long long)blk_rq_pos(req) << 9,
 			blk_rq_bytes(req), (req->timeout / HZ) * cmd->retries);
 
+		mutex_lock(&nsock->tx_lock);
+		if (cmd->cookie != nsock->cookie) {
+			nbd_requeue_cmd(cmd);
+			mutex_unlock(&nsock->tx_lock);
+			mutex_unlock(&cmd->lock);
+			nbd_config_put(nbd);
+			return BLK_EH_DONE;
+		}
+		mutex_unlock(&nsock->tx_lock);
 		mutex_unlock(&cmd->lock);
 		nbd_config_put(nbd);
 		return BLK_EH_RESET_TIMER;
-- 
2.11.0

