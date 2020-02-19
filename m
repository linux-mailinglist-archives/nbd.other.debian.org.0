Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DB25D163D30
	for <lists+nbd@lfdr.de>; Wed, 19 Feb 2020 07:48:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AD0122016C; Wed, 19 Feb 2020 06:48:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 19 06:48:19 2020
Old-Return-Path: <houpu.main@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3AEB020174
	for <lists-other-nbd@bendel.debian.org>; Wed, 19 Feb 2020 06:32:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wvI3mRZ2ufAv for <lists-other-nbd@bendel.debian.org>;
	Wed, 19 Feb 2020 06:32:34 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pl1-x643.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0F3F420336
	for <nbd@other.debian.org>; Wed, 19 Feb 2020 06:32:33 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id g6so9141142plt.2
        for <nbd@other.debian.org>; Tue, 18 Feb 2020 22:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=apLZtF887Y+fbvHxJ4v5hcColYznZeKPq3aGWXCXGR4=;
        b=jFZ0AiuW5zeZdzlyX5WOh0W4tLv5fN4Rv/IeKDA/cwTqg58u1Es66GYbdIWX0qa34x
         jalI/LWAsLni7+8pcZsZ1tM9+GSxiA5gUu15B+zrg08bSHXwB1sf8nxDD8QXakDPBY2k
         oKE7lXWuJWQWij7JKvQxBwBowvg3E14wzCBZ6EFbdcK0Ch5717tjf3CJNWO/wewUMjDw
         jRLDzEDAV8IrKN5jWOzH6Fs6OjdFfWI3Kc2sWBIK287Ej9ABlWUG34GRZwbgrWfgbV67
         TKdqY1VqwDtvgQW86b+yYGXKvl9Hkw7wyvZ9PaIAwj5smhy+5tLRa5VAUsSmv1Bb7XR5
         EO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=apLZtF887Y+fbvHxJ4v5hcColYznZeKPq3aGWXCXGR4=;
        b=tBJM/jfSHJaEthFdmb2EzlD+CYag8xlwkl85JHAJve4XTepJxdhhq3h8q8lidcEL/X
         qHrjBEpW5TcsjrjEeZl6wGV6EfcOkdjpSzalUopPOrsVMVLYUAWu17ku6S+db3fFirWW
         vEYlDJYrAVJtMPQJ3p10xuyxwagUyWFi43f1TvX8pYI5/McDU81CWagmiiCIS9NH1tR2
         cfPp4+q0e6phB0yD7dNU/QOQ2AcxPNS3GIxvfeo3HZ/VzdZAwrCSasXg6UtJF/1fQwTX
         zISPPixZNxu/5lncg7JciyQ2h4MmQP0KKEQTzzJSoLyQKMQx3g5brfp8eabpDd77CjJN
         9bvg==
X-Gm-Message-State: APjAAAW191Yno8kZWE4kwrWySVu+IL6jB+2eMjM8QEwEdyHp/8E4pKZs
	4mIq9+DrP5N4PhZLYrt9RCE=
X-Google-Smtp-Source: APXvYqy/In4gi1EBsHZbSbUcRTtXKEp5X5nBPGyvvmvnrI9T4YO+kMVJhkVs7cCC3yfxQOhW8u79Zg==
X-Received: by 2002:a17:902:7004:: with SMTP id y4mr24683618plk.263.1582093950554;
        Tue, 18 Feb 2020 22:32:30 -0800 (PST)
Received: from debian.lc ([61.120.150.75])
        by smtp.gmail.com with ESMTPSA id e7sm1184487pfj.114.2020.02.18.22.32.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Feb 2020 22:32:30 -0800 (PST)
From: Hou Pu <houpu.main@gmail.com>
X-Google-Original-From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	mchristi@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH 1/2] nbd: enable replace socket if only one connection is configured
Date: Wed, 19 Feb 2020 01:31:06 -0500
Message-Id: <20200219063107.25550-2-houpu@bytedance.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200219063107.25550-1-houpu@bytedance.com>
References: <20200219063107.25550-1-houpu@bytedance.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RwbPu-dgR2O.A.2EF.zoNTeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/829
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200219063107.25550-2-houpu@bytedance.com
Resent-Date: Wed, 19 Feb 2020 06:48:19 +0000 (UTC)

Nbd server with multiple connections could be upgraded since
560bc4b (nbd: handle dead connections). But if only one conncection
is configured, after we take down nbd server, all inflight IO
would finally timeout and return error. We could requeue them
like what we do with multiple connections and wait for new socket
in submit path.

Signed-off-by: Hou Pu <houpu@bytedance.com>
---
 drivers/block/nbd.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 78181908f0df..8e348c9c49a4 100644
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
@@ -747,8 +750,7 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 				 * and let the timeout stuff handle resubmitting
 				 * this request onto another connection.
 				 */
-				if (nbd_disconnected(config) ||
-				    config->num_connections <= 1) {
+				if (nbd_disconnected(config)) {
 					cmd->status = BLK_STS_IOERR;
 					goto out;
 				}
@@ -825,7 +827,7 @@ static int find_fallback(struct nbd_device *nbd, int index)
 
 	if (config->num_connections <= 1) {
 		dev_err_ratelimited(disk_to_dev(nbd->disk),
-				    "Attempted send on invalid socket\n");
+				    "Dead connection, failed to find a fallback\n");
 		return new_index;
 	}
 
-- 
2.11.0

