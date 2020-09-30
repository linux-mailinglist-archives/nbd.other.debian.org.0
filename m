Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3218B27DF14
	for <lists+nbd@lfdr.de>; Wed, 30 Sep 2020 05:42:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1BDAF20379; Wed, 30 Sep 2020 03:42:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 30 03:42:19 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A0B85203A3
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Sep 2020 03:24:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rxWjvle4HlP4 for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Sep 2020 03:24:19 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pf1-x441.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id F2166203A1
	for <nbd@other.debian.org>; Wed, 30 Sep 2020 03:24:18 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id z19so188259pfn.8
        for <nbd@other.debian.org>; Tue, 29 Sep 2020 20:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9wLhhzcNS0P7UTjgkUlOAA40Hjt+i5A3fNAKc5EV9IU=;
        b=bMreQqfcbkAaFUufvshrQLLdhWLR8aHn8fvuFYB7ItTx9MFBCrHnqETUQscEeDZguQ
         VuKESavl8M+a6gJYh8tta2nekBBvaBKjyEPOh+3emBsSDbZrql3HxhvqvC5dj7egPnJ4
         IjlE0Ijj7EEPJwTeZ2ZN6Q2MU9z5mk5P3fITEb9tuQ1BrFK4VvP4Plu2veA6iAloOspC
         /B/xlFo4ems6RjgmXF989iyaFbNxB6fIdsIRe2JUew8KSAodmCKXH+L0aCPZJU9Tuu1w
         oWx9qmOKJZB+caqOiOItnuZWzcMt7vOS3hPorX93YScwzw1vwdydvoJ9FIfB/UVRJUe5
         doxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9wLhhzcNS0P7UTjgkUlOAA40Hjt+i5A3fNAKc5EV9IU=;
        b=kMz5xurAsdoin2dNIg7+IWcv+2lHPTBT3PZP8R0l2wD3q1jvYeo2YoY5EVmpQSgDet
         OmPTxFSLA5ZY/vTk6K15mJ475UQdCfkM4bN1PS6xS03hTzmleMYwhGYEyOocK8qgqeBM
         ERj5nidNIH4az01He7/07ZYNcaPJK40D+SfNIJM2jL77oje3VcYfqENy8EvgJNt+APiJ
         V05PLBdDPSO05Jp/axrzT2daW2Aen0XLKJqU8cqSke4kzIIRATrZie9pLr2mwbP2zlAz
         ibYRxr23JBb31QuwzQvpceh/qCba2BYxn91zxEzW0CfCl+FVExRJUsdc4I3+5fX0v6vU
         lFFg==
X-Gm-Message-State: AOAM531vDGUyUyzSCpSxaXW+4DZR5szw7nGXmwKON/d8yjFQIb5EkVis
	2tNQyzE1ZoHAPsjmmky3M2ZCmA==
X-Google-Smtp-Source: ABdhPJx71yNZKQA9Fyjo7oc8K5qPHFlVHthykn+5x0JlCt42+167tBVty2nNOdZR3pJW9FCXTKRBXg==
X-Received: by 2002:a65:4c8e:: with SMTP id m14mr539963pgt.129.1601436255395;
        Tue, 29 Sep 2020 20:24:15 -0700 (PDT)
Received: from box.bytedance.net ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id w195sm226105pff.74.2020.09.29.20.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 20:24:14 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH v3 1/2] nbd: return -ETIMEDOUT when NBD_DO_IT ioctl returns
Date: Wed, 30 Sep 2020 11:23:49 +0800
Message-Id: <20200930032350.3936-2-houpu@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930032350.3936-1-houpu@bytedance.com>
References: <20200930032350.3936-1-houpu@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FKeAnQRC-aI.A.D-H.b6_cfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1007
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200930032350.3936-2-houpu@bytedance.com
Resent-Date: Wed, 30 Sep 2020 03:42:19 +0000 (UTC)

We used to return -ETIMEDOUT if io timeout happened. But since
commit d970958b2d24 ("nbd: enable replace socket if only one
connection is configured"), user space would not get -ETIMEDOUT.
This commit fixes this. Only return -ETIMEDOUT if only one socket
is configured by ioctl and the user specified a non-zero timeout
value.

Reviewed-by: Josef Bacik <josef@toxicpanda.com>
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

