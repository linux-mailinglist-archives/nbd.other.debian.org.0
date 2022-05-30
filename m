Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F01DA537E63
	for <lists+nbd@lfdr.de>; Mon, 30 May 2022 16:06:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 94D3A201E6; Mon, 30 May 2022 14:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 30 14:06:09 2022
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 316D020398
	for <lists-other-nbd@bendel.debian.org>; Mon, 30 May 2022 13:49:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12.991 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.801,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id R9mZN3dXh-EQ for <lists-other-nbd@bendel.debian.org>;
	Mon, 30 May 2022 13:49:03 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 1126 seconds by postgrey-1.36 at bendel; Mon, 30 May 2022 13:49:03 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D674E20392
	for <nbd@other.debian.org>; Mon, 30 May 2022 13:49:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1A080B80DB8;
	Mon, 30 May 2022 13:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF80FC3411C;
	Mon, 30 May 2022 13:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653918539;
	bh=Tda2yIK/e/Kan92RH1YHYbg3Uneascketgw7j/W6VgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MX0euYwhwkShw3pc0PsOJz6iJlghB8gfNZgIGvHsyRtWGgVJxSS1xX7AVsnGi9E9i
	 mMi1gGgQ1Ekr2S0hobeM6C7GvUG05vPLy81GbHLIwz9w1KiLSUI6ptQgkPzbn1XMZG
	 99vZNquxTLQRTTWjz2XWq0MTLA2FjDDt597BmNZTBoRJINWAq9elptNNtmTjKbiEv6
	 NkqOFWAWLynN7OUMvHUTEdk7v6jgQYa6ARLBFC676VipZ5Bus8Nt+B9VezQjaKtXmy
	 YPCvT84ttk/IGO6bQc0ZP8ThLGfXNVz4yG5AnvXynjFoSKYzv6yV1GwNw0EcT6aveN
	 EkMR7u34Fku8A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xie Yongji <xieyongji@bytedance.com>,
	Xu Jianhai <zero.xu@bytedance.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 5.4 47/55] nbd: Fix hung on disconnect request if socket is closed before
Date: Mon, 30 May 2022 09:46:53 -0400
Message-Id: <20220530134701.1935933-47-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530134701.1935933-1-sashal@kernel.org>
References: <20220530134701.1935933-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zoLjArHI_RD.A.uCG.R9MliB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2114
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220530134701.1935933-47-sashal@kernel.org
Resent-Date: Mon, 30 May 2022 14:06:09 +0000 (UTC)

From: Xie Yongji <xieyongji@bytedance.com>

[ Upstream commit 491bf8f236fdeec698fa6744993f1ecf3fafd1a5 ]

When userspace closes the socket before sending a disconnect
request, the following I/O requests will be blocked in
wait_for_reconnect() until dead timeout. This will cause the
following disconnect request also hung on blk_mq_quiesce_queue().
That means we have no way to disconnect a nbd device if there
are some I/O requests waiting for reconnecting until dead timeout.
It's not expected. So let's wake up the thread waiting for
reconnecting directly when a disconnect request is sent.

Reported-by: Xu Jianhai <zero.xu@bytedance.com>
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Link: https://lore.kernel.org/r/20220322080639.142-1-xieyongji@bytedance.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 25e81b1a59a5..510e75435c43 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -865,11 +865,15 @@ static int wait_for_reconnect(struct nbd_device *nbd)
 	struct nbd_config *config = nbd->config;
 	if (!config->dead_conn_timeout)
 		return 0;
-	if (test_bit(NBD_RT_DISCONNECTED, &config->runtime_flags))
+
+	if (!wait_event_timeout(config->conn_wait,
+				test_bit(NBD_RT_DISCONNECTED,
+					 &config->runtime_flags) ||
+				atomic_read(&config->live_connections) > 0,
+				config->dead_conn_timeout))
 		return 0;
-	return wait_event_timeout(config->conn_wait,
-				  atomic_read(&config->live_connections) > 0,
-				  config->dead_conn_timeout) > 0;
+
+	return !test_bit(NBD_RT_DISCONNECTED, &config->runtime_flags);
 }
 
 static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
@@ -2014,6 +2018,7 @@ static void nbd_disconnect_and_put(struct nbd_device *nbd)
 	mutex_lock(&nbd->config_lock);
 	nbd_disconnect(nbd);
 	sock_shutdown(nbd);
+	wake_up(&nbd->config->conn_wait);
 	/*
 	 * Make sure recv thread has finished, so it does not drop the last
 	 * config ref and try to destroy the workqueue from inside the work
-- 
2.35.1

