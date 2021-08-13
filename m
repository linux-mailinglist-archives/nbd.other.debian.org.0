Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A5C3EB298
	for <lists+nbd@lfdr.de>; Fri, 13 Aug 2021 10:27:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 24B1D2041C; Fri, 13 Aug 2021 08:27:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 13 08:27:13 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E8A3320418
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Aug 2021 08:11:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Q3-bjtCjp36f for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Aug 2021 08:10:56 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pl1-x62f.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E708420406
	for <nbd@other.debian.org>; Fri, 13 Aug 2021 08:10:53 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d17so10846411plr.12
        for <nbd@other.debian.org>; Fri, 13 Aug 2021 01:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JqAwpQO8X7n0Y17FIjHDN+UGwZ5lc+0aIYD45P4Rl4g=;
        b=l8/qcIze3UJ/k/jiJb2vHoa8CtAObJsq3orL2ts+8ZZH11WygZ3VKtV4S3zXMVAQtg
         EUNX5F6AtaSlV0F2zXUnl64GzbdG+LG+MBHD6Ly7OkTO61r6ArgZZkZIpreVscpSFbRZ
         ZYYGDxJFTS7yyb3dCBmJJR3z/Z3uBSwA7NsFwiyLM9SdPsK2BZhDJ9a6Mj99acrsZmdj
         gbO6GxF/mixJbOzwMs6j6Utf+CsoHCnaWqEAXzzbPAHptvDqYTU+v4SFX7hwQx3dAxDo
         48fH23LDthKUFdoDgc3dIlvggqFkMTf6rKFZ1Lbbu5wI85XZY9TnWVbhPMEg/+JwQW6d
         L1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JqAwpQO8X7n0Y17FIjHDN+UGwZ5lc+0aIYD45P4Rl4g=;
        b=iaFmPppJwItFZ7yGetrMxbDJyMvsn+gf1H2d7i+iwd+ngueMUhWm1vIeM13eJB9YQu
         VtEDBcL81GY/V+zyY6oFBMWzBSw4nSD1wszzK1lBkGJNEUoBgbIUS2GVTfKv4LOAcN4J
         7zJSG+kbRPuCjQCI9ZKBqucimxN6cbv/bO7iSr+M/vTtdN8Ctdd/XAeTAqiMmKaHAqK8
         nGe4Uo94eHcCaMuuE7wyCDFyZT4ObGfOdDkAaCGc78Sf48gfiNulJrBxfxVtmnO5BNnA
         wISPF9ehXa810mhm4vvZiwKnUyPN/ro8gWfoEAPZjl/+x+daGFJIQ+865Z4wWpg/PQWL
         VEgg==
X-Gm-Message-State: AOAM530+fr3yt8GwirAiX3HvKlcYN8Rl0RIyqjTNMwcW1SsQKw8jAjpz
	NLwEPib11LQ3GLYunmViTV8r
X-Google-Smtp-Source: ABdhPJwI8wUVL//spsdg0J/QOM84H++McIr0oJRvfmnTg8JmS3gHPpnvCN+5uY3Ok8roqBq0Y7JaFA==
X-Received: by 2002:a17:90a:f696:: with SMTP id cl22mr1501205pjb.124.1628842249694;
        Fri, 13 Aug 2021 01:10:49 -0700 (PDT)
Received: from localhost ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id x13sm1127205pjh.30.2021.08.13.01.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 01:10:49 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: jiangyadong@bytedance.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH] nbd: Aovid double completion of a request
Date: Fri, 13 Aug 2021 16:10:33 +0800
Message-Id: <20210813081033.142-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4VogWObyNlN.A.EvE.hziFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1280
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210813081033.142-1-xieyongji@bytedance.com
Resent-Date: Fri, 13 Aug 2021 08:27:13 +0000 (UTC)

There is a race between iterating over requests in
nbd_clear_que() and completing requests in recv_work(),
which can lead to double completion of a request.

To fix it, flush the recv worker before iterating over
the requests and don't abort the completed request
while iterating.

Fixes: 96d97e17828f ("nbd: clear_sock on netlink disconnect")
Reported-by: Jiang Yadong <jiangyadong@bytedance.com>
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/block/nbd.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index c38317979f74..19f5d5a8b16a 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -818,6 +818,10 @@ static bool nbd_clear_req(struct request *req, void *data, bool reserved)
 {
 	struct nbd_cmd *cmd = blk_mq_rq_to_pdu(req);
 
+	/* don't abort one completed request */
+	if (blk_mq_request_completed(req))
+		return true;
+
 	mutex_lock(&cmd->lock);
 	cmd->status = BLK_STS_IOERR;
 	mutex_unlock(&cmd->lock);
@@ -2004,15 +2008,19 @@ static void nbd_disconnect_and_put(struct nbd_device *nbd)
 {
 	mutex_lock(&nbd->config_lock);
 	nbd_disconnect(nbd);
-	nbd_clear_sock(nbd);
-	mutex_unlock(&nbd->config_lock);
+	sock_shutdown(nbd);
 	/*
 	 * Make sure recv thread has finished, so it does not drop the last
 	 * config ref and try to destroy the workqueue from inside the work
-	 * queue.
+	 * queue. And this also ensure that we can safely call nbd_clear_que()
+	 * to cancel the inflight I/Os.
 	 */
 	if (nbd->recv_workq)
 		flush_workqueue(nbd->recv_workq);
+	nbd_clear_que(nbd);
+	nbd->task_setup = NULL;
+	mutex_unlock(&nbd->config_lock);
+
 	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
 			       &nbd->config->runtime_flags))
 		nbd_config_put(nbd);
-- 
2.11.0

