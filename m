Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F4A173175
	for <lists+nbd@lfdr.de>; Fri, 28 Feb 2020 07:57:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 623F62095C; Fri, 28 Feb 2020 06:57:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 28 06:57:32 2020
Old-Return-Path: <houpu.main@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CA9EC20935
	for <lists-other-nbd@bendel.debian.org>; Fri, 28 Feb 2020 06:41:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cCakpOtcqH23 for <lists-other-nbd@bendel.debian.org>;
	Fri, 28 Feb 2020 06:41:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5B05D2092F
	for <nbd@other.debian.org>; Fri, 28 Feb 2020 06:41:55 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id t3so1010997pgn.1
        for <nbd@other.debian.org>; Thu, 27 Feb 2020 22:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5KmJo4otYeRbLM4RlIKP+D2Bfkxr9xULCptchKBXIUM=;
        b=uJUpJU2rWeNJwtMz6AioU9zpMF13wgcox4BvS/V1cKATdtE7zwzDDpqEltKC1jqaQ/
         EORemM4Vmgysuppoqp1wrG4N18YJkMaO40ug/eEC27v02Q3uhgxPFqnkoWOr8Q0vHwyd
         zEgdsmEnGNKLyBAyBGxDzvaQia5/oqnCNYBpj5dJeL64h3qjpHyDbu2GnNFeBcFGfpJp
         zVWnBZCeiuu0Plo9jTgfMPpRFoWfeVwIIxW42MKYtbLXnn6p8deGPd9PRVDdVDp584Nk
         Mve1GGt1QLdR0iruuJCD6Dddp/3+ZDIznEHt8Mba+zcEACdItUnzI5rW+zg9vQVW83S9
         iKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5KmJo4otYeRbLM4RlIKP+D2Bfkxr9xULCptchKBXIUM=;
        b=fCL9LSwBVG+WqBOAhd85ZnEcKY/lNs05+d/Sa75IHHoIg2IUuwJUghpHmh8RSNLS+N
         FCgTSf/7YTMyr2PGMpPvCKp30vukTi6YijnPsgvIfYJFhatkRYseGAdr86cJpQ5PFOW3
         U0TeS8ZiLwpGtc332pTxIKN4Dp8cbvTbIvZr+nWvkgE0RoPAchMf0aiHCT+eNYkdsp34
         lF2d05kURs8pISO4BckagLUQieRW6j4uddDNo62S+trhthWSALDZoCiUKrU0iwsBSUZn
         2HNExCKjzRE3dCAVu6y181vsyHF6swhE4/nFi6Thtf/X+v7z7jLPQN/iDCSURdSZn/Cb
         42jA==
X-Gm-Message-State: APjAAAVzm9zBiqQfERIDZ/vIPjTdsBPofgOfsBbfbYEcVYh3Gm2Cd+0f
	j5pgvpSH24JlU8VhyfKpgEg=
X-Google-Smtp-Source: APXvYqxqaaA/D+F+sHB9CnvSpWA6fIxsl6KP/ZVAv4GTG2RHn/4KRJbNGZS8RFjBIC5OmWAbwTWd7g==
X-Received: by 2002:a63:aa09:: with SMTP id e9mr3147464pgf.354.1582872111928;
        Thu, 27 Feb 2020 22:41:51 -0800 (PST)
Received: from debian.lc ([61.120.150.75])
        by smtp.gmail.com with ESMTPSA id w11sm9420707pfn.4.2020.02.27.22.41.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Feb 2020 22:41:51 -0800 (PST)
From: Hou Pu <houpu.main@gmail.com>
X-Google-Original-From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	mchristi@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH 2/2] nbd: requeue command if the soecket is changed
Date: Fri, 28 Feb 2020 01:40:30 -0500
Message-Id: <20200228064030.16780-3-houpu@bytedance.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200228064030.16780-1-houpu@bytedance.com>
References: <20200228064030.16780-1-houpu@bytedance.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EGaz9MqrOhM.A.J7C.cnLWeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/837
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200228064030.16780-3-houpu@bytedance.com
Resent-Date: Fri, 28 Feb 2020 06:57:32 +0000 (UTC)

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
index 83070714888b..43cff01a5a67 100644
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

