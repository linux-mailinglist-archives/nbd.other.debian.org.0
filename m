Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4869527220B
	for <lists+nbd@lfdr.de>; Mon, 21 Sep 2020 13:15:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 31AB220303; Mon, 21 Sep 2020 11:15:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 21 11:15:31 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 20DB62029E
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Sep 2020 10:57:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id z1f5b5Z_-vpn for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Sep 2020 10:57:45 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pj1-x1043.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B2B0C202B7
	for <nbd@other.debian.org>; Mon, 21 Sep 2020 10:57:45 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id mm21so7254243pjb.4
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 03:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VV3gcZz9qKuPs84N2Es2cgBs4xeGVyPPTTCXAIYm92E=;
        b=p/tFl1wJaUv7yfJ87eFifY1+yrVg2gZlLqsFiDG8DDpzFiW7e5fqWgNZlNl3B9JKIR
         oSMzggHh8atAmbdRDvqqO7FnjHHYui8oVKoVxSucemnbfibay6KrSxnVDU2EkXkEGW4Y
         erB3UWjtDfpzD9Zz+IWCIiEcguahPxD/h//nZbQraP7eAkSJhlh/HM7FeSs/xERHv7eP
         lf2YZ1droNtH2qzvC0cIp0RrH0F1T1HRcuZ+slaTToT5BSNnJXJl4/qPv7EH1fB9oS9t
         5wdtn8yUNFLmP7oeD+MQqdMPjVxBb4fShfseXwiekAyu8vGHXU3aNAdY+c1xKiJIk61o
         NssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VV3gcZz9qKuPs84N2Es2cgBs4xeGVyPPTTCXAIYm92E=;
        b=Tc0Wt+yLfuPo9ljKJn4vmpMmNh7F0J2D6Wgen9/wEDrL97UZGC7Vj7+mGQmSjFqLL+
         E5gcr43HFIgFgAN6Qf51zlN7bEvZNQGapgW1wrFwCkFFVLhEF2LQ1XJzUTAbH5tOf8mz
         R0vYlaAuKYT30W4yoITXllhEqWFc5kutnqU7HRg2FNGbZLnxCiOJe84fAoBNWvUcApfr
         vi0obPsCDzfjDTNdH18vXj/G/jlo2x2AiGVSgBEX225Z+6+yLiAzIpst1t9QAMJM58gz
         Nrhs0hWsh63YM9dgQp/5AXDaVTyxU6x421rJjEkbjqT4/espuNWpF8/PVQn/n9ZzH7uX
         jPcw==
X-Gm-Message-State: AOAM5303ViWgyt05/qi3yaeHL7zYd9MgXZ3gjQEyXBLC27EQat5lNGO7
	l9uHNU24/r/mFvcgz1lQC6FdqA==
X-Google-Smtp-Source: ABdhPJzDa8+tXiz85jqOT8FmjdYgP5pxuExLAwtOnDXeUK1RcH7HAQy0YNMXUInmpRpdmhT+wvTQbA==
X-Received: by 2002:a17:90b:8a:: with SMTP id bb10mr24508143pjb.108.1600685862352;
        Mon, 21 Sep 2020 03:57:42 -0700 (PDT)
Received: from box.bytedance.net ([61.120.150.73])
        by smtp.gmail.com with ESMTPSA id x62sm2792533pfx.20.2020.09.21.03.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 03:57:41 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: mchristi@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH 2/3] nbd: unify behavior in timeout no matter how many sockets is configured
Date: Mon, 21 Sep 2020 18:57:17 +0800
Message-Id: <20200921105718.29006-3-houpu@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921105718.29006-1-houpu@bytedance.com>
References: <20200921105718.29006-1-houpu@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-3BUv0jMCb.A.ir.TtIafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/991
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200921105718.29006-3-houpu@bytedance.com
Resent-Date: Mon, 21 Sep 2020 11:15:31 +0000 (UTC)

When an nbd device is configured with multiple sockets, the request
is requeued to an active socket in xmit_timeout, the original socket
is closed if not.

Some time, the backend nbd server hang, thus all sockets will be
dropped and the nbd device is not usable. It would be better to have an
option to wait for more time (just reset timer in nbd_xmit_timeout).
Like what we do if we only have one socket. This patch allows it.

Signed-off-by: Hou Pu <houpu@bytedance.com>
---
 drivers/block/nbd.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 538e9dcf5bf2..4c0bbb981cbc 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -400,8 +400,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 	    nbd->tag_set.timeout)
 		goto error_out;
 
-	if (config->num_connections > 1 ||
-	    (config->num_connections == 1 && nbd->tag_set.timeout)) {
+	if (nbd->tag_set.timeout) {
 		dev_err_ratelimited(nbd_to_dev(nbd),
 				    "Connection timed out, retrying (%d/%d alive)\n",
 				    atomic_read(&config->live_connections),
@@ -432,9 +431,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
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
-- 
2.11.0

