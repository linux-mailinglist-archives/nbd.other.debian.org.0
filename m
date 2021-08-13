Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB893EB944
	for <lists+nbd@lfdr.de>; Fri, 13 Aug 2021 17:30:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B6C6A20423; Fri, 13 Aug 2021 15:30:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 13 15:30:10 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6E54F20415
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Aug 2021 15:13:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RM0IUpgO5gu2 for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Aug 2021 15:13:47 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pj1-x1029.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 23F38203FF
	for <nbd@other.debian.org>; Fri, 13 Aug 2021 15:13:45 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so21096181pjr.1
        for <nbd@other.debian.org>; Fri, 13 Aug 2021 08:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JqAwpQO8X7n0Y17FIjHDN+UGwZ5lc+0aIYD45P4Rl4g=;
        b=RW/1s1tEObM+aMj+uE+Htb/efFrSyNxAfeOBq1Vz2YvsOEIuCSgCTIeHifrQ0TFo7I
         jp8U/OyohQYoOF0HPKXQFLCk8DmhQEW5zPjSUTgXU9Wxqrx6p/Sv0nXj2hO0AqTt+bG4
         v3ubYArUpAXueL1tFkjJ/gSKDXlbyROw7FyoGSdYr0skyehKyV5XfFoc1No91evpRKVa
         RzlJsNAlqyzrmH8sLBlMQluE5MpFZeg+Z3PFcANII9aXia4za05B+G2fxWXF/xB2r8J+
         TT1RVgGLyly6PlM+e2EqRMgICIdE342LsMa3GZz1I6YRMn8mJvgqN8T0Mw2bUWZb9fTy
         hQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JqAwpQO8X7n0Y17FIjHDN+UGwZ5lc+0aIYD45P4Rl4g=;
        b=DSMvlBz7eFcPVQl8EwVQv6HaYXvsD2XRMi91qeuL5WLpPEdseZsbMHKyllz0Ryzl3e
         +lxcalOLc9+DJSofoiD96VGUSZ1kzxnGvNBXMID06698PoSc+y6J6+jB+ri0qQB6az9F
         z1iFfjiBlEV1I/9k8t5TsA3RRnw1waqqr0dqc544huwpo6ptTJSuS5HffuQEpaB2RcJ0
         B88CJ7p1fP1Lxj5zA0p8BYb3rKe/WBoaYmjbVH5N8PxyPmUPjXh48Xx1fxMmLgdPkldn
         Sp7pkVfhKqs4Y5KZwwSoDmhMu88yZVvNfTXhJunxE0kcRV74NQOP5QIoeqvF4QtEoXHc
         hP6w==
X-Gm-Message-State: AOAM5304jbTzAmbbIzlSxoJ/oVVJGhKUXnxWXoKL2Biz0qzVajwGgZoO
	JfKM1/k3n8sjl1rRzX7yWw6a
X-Google-Smtp-Source: ABdhPJwGooV4r6z+dWtH6qviTbcKfA1byzCmqr/9V/NKLRQP0hZs1bL1Nd0Cd71kAtKUqRsPBAFa2Q==
X-Received: by 2002:a05:6a00:1481:b029:3e0:4537:a1d9 with SMTP id v1-20020a056a001481b02903e04537a1d9mr2870848pfu.36.1628867621984;
        Fri, 13 Aug 2021 08:13:41 -0700 (PDT)
Received: from localhost ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id y23sm2892615pfb.130.2021.08.13.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 08:13:41 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: jiangyadong@bytedance.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH RESEND] nbd: Aovid double completion of a request
Date: Fri, 13 Aug 2021 23:13:30 +0800
Message-Id: <20210813151330.96-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-lzZnM0eEwO.A.A2F.CApFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1283
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210813151330.96-1-xieyongji@bytedance.com
Resent-Date: Fri, 13 Aug 2021 15:30:10 +0000 (UTC)

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

