Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C75273966
	for <lists+nbd@lfdr.de>; Tue, 22 Sep 2020 05:51:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CCC4720415; Tue, 22 Sep 2020 03:51:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 22 03:51:19 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2DFD420410
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Sep 2020 03:35:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eW0Aj9obaCeE for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Sep 2020 03:35:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C7762203E2
	for <nbd@other.debian.org>; Tue, 22 Sep 2020 03:35:15 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id w7so11187876pfi.4
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 20:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9wLhhzcNS0P7UTjgkUlOAA40Hjt+i5A3fNAKc5EV9IU=;
        b=sxhWSarwoCyNbCnN9Wsb7ZIsqOkyXrw5ITBC797khUx7oHmbhvT/mQBcF35Vw/ZwE7
         wbX73TxH1qYXOUtc4zaWYHfh9KOl+513K6md8E7dwrQUEZrzp66MAQzrLGx52Hc8S1UQ
         V4G5CwflbhdWRHLEENkpHg0IkRSulryc6FNoEglASIh50rw+Xh3dtk4Uj/N26Q+FQOCH
         8cC/lFRLjqEF1J5HweRpKl28q2gvdREh6JqdTXuVwd5kgu7/X82SXzROIRD+IUw5O/TN
         a9mmv6d9YkZ1Q0SLoIh5sJbmWXQNEGQkGq/MMz1OMJihNTKMxzOIUwbRag8mNTdCiG/C
         om8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9wLhhzcNS0P7UTjgkUlOAA40Hjt+i5A3fNAKc5EV9IU=;
        b=n5Mg8l985AFkdV3eosE7504TWCWpIGZfa3ffrgSxcWk+EwCl8SlFI3BpUbUNhZfKtk
         hMcC6JyAmMj4P38j9DvR76ucVW8Khq8hYZDgtY2M9Cr7IHVSm5LtAUleAJrCNnYVWfYy
         zN61aC7mjQXwV/ZOp+qMihnlmwwog7nsZtSeN8oeYCmLMkKtfI+ecUPGBmQEGHFaK9fn
         +jdfAMdux2/+oO7Wdwr1ttJvKT8YWqom/IEzWTJL5MuY1LFs9a/whmaFeXbt7yeNkD1x
         T5SfVMbhGYX91fxvzSDuH0ZMttq8bJ70/XRHKYNRlaKrU4TCGA8ax6OkcjkcXBFJ89dE
         1ifQ==
X-Gm-Message-State: AOAM533orvjQrUFmibDWzUAxQ9z3Ey8qKmBqWZmK5F+XwFuSSHiPDXXC
	byUPjq+E0vjrCgPzvHmazj71cA==
X-Google-Smtp-Source: ABdhPJxf/JOJUbigEKnDT/59OY8WC2Ho7Y+15oVK2BX3j5LinFq0BzKxJGIramXoBTy+i4muz337pQ==
X-Received: by 2002:a63:fe57:: with SMTP id x23mr1948009pgj.309.1600745712439;
        Mon, 21 Sep 2020 20:35:12 -0700 (PDT)
Received: from box.bytedance.net ([61.120.150.73])
        by smtp.gmail.com with ESMTPSA id mp3sm714859pjb.33.2020.09.21.20.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 20:35:11 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: mchristi@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH v2 1/2] nbd: return -ETIMEDOUT when NBD_DO_IT ioctl returns
Date: Tue, 22 Sep 2020 11:34:56 +0800
Message-Id: <20200922033457.46227-2-houpu@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200922033457.46227-1-houpu@bytedance.com>
References: <20200922033457.46227-1-houpu@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OoTUcm3NsJJ.A.Sl.3SXafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1000
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200922033457.46227-2-houpu@bytedance.com
Resent-Date: Tue, 22 Sep 2020 03:51:19 +0000 (UTC)

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

