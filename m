Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A129B173171
	for <lists+nbd@lfdr.de>; Fri, 28 Feb 2020 07:57:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7128320955; Fri, 28 Feb 2020 06:57:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 28 06:57:20 2020
Old-Return-Path: <houpu.main@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9736E20935
	for <lists-other-nbd@bendel.debian.org>; Fri, 28 Feb 2020 06:41:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hRL4AI1g-nh6 for <lists-other-nbd@bendel.debian.org>;
	Fri, 28 Feb 2020 06:41:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 71AB52092F
	for <nbd@other.debian.org>; Fri, 28 Feb 2020 06:41:46 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id b185so1207945pfb.7
        for <nbd@other.debian.org>; Thu, 27 Feb 2020 22:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pFbk0CMR9rqR5wOc+dREyts4vK3zZIT7ZWJKDdvwNTY=;
        b=gZPYkslwR6asDMMBWHIX7RLiF4RNpOUvH7AlQJxRW3PzcH3EmzLvnaozjmdPWKJvpa
         QNYWLkPgoHtB+s/qPI8OEFoJXbjO9/PNHuGwXN2riE5ChlenSyLyH5mGabip6t6wze1+
         W9X8npnAJ2Zvk61dQnTvUOojp4zL4gOzSrbaBl4nNc0dkqueyJoGJaohSUx7b9DSN8eZ
         71i8ewY75UU0rSGE3FGovecrNqhPCId4Xx/Y39+jVUojnzqwiwiJriCncumyjvzpsVXG
         iUsGEiDTG0rtc/V2zasxESbntcxMdTCNKfofPfUeaL+rV0cX7iVnXnXywV9qXUlrMv0Y
         ZZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pFbk0CMR9rqR5wOc+dREyts4vK3zZIT7ZWJKDdvwNTY=;
        b=algUW9+ZNmJpw33n+1CBy0LYGojjgQ5U2toPViQF+DdIJ65FlyDEe8Ou+JOvCXmY3J
         ji8R7KZPEqKhNepVxXoTyuXy/KZ1xxGUdbyAS6RELGwpH2DQGLpb4Amsmg3FfG4/2As2
         ZFwELTBfQGLEZlm4Yxd78coZ/UXq77rSMrz16lNqSxnIE6+PVW6K9jxhotZqfVgECrnJ
         DVAR3PwdeDIDMDFpUDKX1QYO8D1QqvLLhRxoIWEKsxcsvAYPCVMpQrPCP43Ds8UfR5RO
         mHNHdGeqGLkTPb3L5zliUE6vuliRPdaEFlCwrrhnbTG6KPud1t5REhBP4U3lFNvnaTzo
         s0oA==
X-Gm-Message-State: APjAAAXXFynZ6TVtqcQ2HNyJtFWi/ORUh0JTOCcTvBF0SSLXPXxO8pM5
	Lb4PbSxhldg/b1HMtY6qlwA=
X-Google-Smtp-Source: APXvYqwsQnzf1RAv1/pL+rFWBHhjLmBX/RcAyHIovkt9vGDFx3S+hnVg5MsWf66qXgoWIQvcUp/9ow==
X-Received: by 2002:a63:f744:: with SMTP id f4mr3181104pgk.345.1582872103027;
        Thu, 27 Feb 2020 22:41:43 -0800 (PST)
Received: from debian.lc ([61.120.150.75])
        by smtp.gmail.com with ESMTPSA id w11sm9420707pfn.4.2020.02.27.22.41.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Feb 2020 22:41:42 -0800 (PST)
From: Hou Pu <houpu.main@gmail.com>
X-Google-Original-From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	mchristi@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH 1/2] nbd: enable replace socket if only one connection is configured
Date: Fri, 28 Feb 2020 01:40:29 -0500
Message-Id: <20200228064030.16780-2-houpu@bytedance.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200228064030.16780-1-houpu@bytedance.com>
References: <20200228064030.16780-1-houpu@bytedance.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kjRi8PuuOiH.A.XvC.QnLWeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/836
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200228064030.16780-2-houpu@bytedance.com
Resent-Date: Fri, 28 Feb 2020 06:57:20 +0000 (UTC)

Nbd server with multiple connections could be upgraded since
560bc4b (nbd: handle dead connections). But if only one conncection
is configured, after we take down nbd server, all inflight IO
would finally timeout and return error. We could requeue them
like what we do with multiple connections and wait for new socket
in submit path.

Signed-off-by: Hou Pu <houpu@bytedance.com>
---
 drivers/block/nbd.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 78181908f0df..83070714888b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -395,16 +395,19 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
 	}
 	config = nbd->config;
 
-	if (config->num_connections > 1) {
+	if (config->num_connections > 1 ||
+	    (config->num_connections == 1 && nbd->tag_set.timeout)) {
 		dev_err_ratelimited(nbd_to_dev(nbd),
 				    "Connection timed out, retrying (%d/%d alive)\n",
 				    atomic_read(&config->live_connections),
 				    config->num_connections);
 		/*
 		 * Hooray we have more connections, requeue this IO, the submit
-		 * path will put it on a real connection.
+		 * path will put it on a real connection. Or if only one
+		 * connection is configured, the submit path will wait util
+		 * a new connection is reconfigured or util dead timeout.
 		 */
-		if (config->socks && config->num_connections > 1) {
+		if (config->socks) {
 			if (cmd->index < config->num_connections) {
 				struct nbd_sock *nsock =
 					config->socks[cmd->index];
@@ -741,14 +744,12 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 				dev_err(disk_to_dev(nbd->disk), "Receive data failed (result %d)\n",
 					result);
 				/*
-				 * If we've disconnected or we only have 1
-				 * connection then we need to make sure we
+				 * If we've disconnected, we need to make sure we
 				 * complete this request, otherwise error out
 				 * and let the timeout stuff handle resubmitting
 				 * this request onto another connection.
 				 */
-				if (nbd_disconnected(config) ||
-				    config->num_connections <= 1) {
+				if (nbd_disconnected(config)) {
 					cmd->status = BLK_STS_IOERR;
 					goto out;
 				}
@@ -825,7 +826,7 @@ static int find_fallback(struct nbd_device *nbd, int index)
 
 	if (config->num_connections <= 1) {
 		dev_err_ratelimited(disk_to_dev(nbd->disk),
-				    "Attempted send on invalid socket\n");
+				    "Dead connection, failed to find a fallback\n");
 		return new_index;
 	}
 
-- 
2.11.0

