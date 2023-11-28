Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C17EC7FC7F6
	for <lists+nbd@lfdr.de>; Tue, 28 Nov 2023 22:33:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A4A0520C36; Tue, 28 Nov 2023 21:33:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 28 21:33:28 2023
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDO_WHITELIST,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A677820BDA
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 Nov 2023 21:15:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.468 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.058, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id visgA05A94xT for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 Nov 2023 21:15:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C1E5220BCE
	for <nbd@other.debian.org>; Tue, 28 Nov 2023 21:15:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 89FF2B8356D;
	Tue, 28 Nov 2023 21:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE937C433CA;
	Tue, 28 Nov 2023 21:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205600;
	bh=+NrWQrBv8ISFQLjQerhL7DQug0d51ngGgWX5u9WiijA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WSKflLYxHlRUNA2MsgA+j90bkaSaa32qeKna4lC1tJS/NfYEudEewS7tbGzxcCrQg
	 o1YvnvfuV9+0J36Cpx1UyJPwkFNmROR34Jx1IpvX2IIzorP/0vVxE84gKhntlbQyCo
	 MMSM3ghFGRbF+bUmyOwAsJEQTWUaitENSpNSprZRa3muuEcYM0OLeOq+nm5qJBj3Mr
	 vJMazJPvuq72SKirnWMuxmfOFZAXSHmNY5fad1k+tqyO4VkHoDNboHkhb6dYda/6D4
	 dM+AprJhFF8iidfWEGlX5u0p1qHofugu3R9OeJU8/esbdNmKB3n2W/+fn2CPlmIWTY
	 fR/unBANiE5gw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Li Nan <linan122@huawei.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 6.6 13/40] nbd: fix null-ptr-dereference while accessing 'nbd->config'
Date: Tue, 28 Nov 2023 16:05:19 -0500
Message-ID: <20231128210615.875085-13-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210615.875085-1-sashal@kernel.org>
References: <20231128210615.875085-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.3
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <il9QlBWDowH.A.C1D.oylZlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2680
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231128210615.875085-13-sashal@kernel.org
Resent-Date: Tue, 28 Nov 2023 21:33:28 +0000 (UTC)

From: Li Nan <linan122@huawei.com>

[ Upstream commit c2da049f419417808466c529999170f5c3ef7d3d ]

Memory reordering may occur in nbd_genl_connect(), causing config_refs
to be set to 1 while nbd->config is still empty. Opening nbd at this
time will cause null-ptr-dereference.

   T1                      T2
   nbd_open
    nbd_get_config_unlocked
                 	   nbd_genl_connect
                 	    nbd_alloc_and_init_config
                 	     //memory reordered
                  	     refcount_set(&nbd->config_refs, 1)  // 2
     nbd->config
      ->null point
			     nbd->config = config  // 1

Fix it by adding smp barrier to guarantee the execution sequence.

Signed-off-by: Li Nan <linan122@huawei.com>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Link: https://lore.kernel.org/r/20231116162316.1740402-4-linan666@huaweicloud.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index daaf8805e876c..3f03cb3dc33cc 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -397,8 +397,16 @@ static u32 req_to_nbd_cmd_type(struct request *req)
 
 static struct nbd_config *nbd_get_config_unlocked(struct nbd_device *nbd)
 {
-	if (refcount_inc_not_zero(&nbd->config_refs))
+	if (refcount_inc_not_zero(&nbd->config_refs)) {
+		/*
+		 * Add smp_mb__after_atomic to ensure that reading nbd->config_refs
+		 * and reading nbd->config is ordered. The pair is the barrier in
+		 * nbd_alloc_and_init_config(), avoid nbd->config_refs is set
+		 * before nbd->config.
+		 */
+		smp_mb__after_atomic();
 		return nbd->config;
+	}
 
 	return NULL;
 }
@@ -1559,7 +1567,15 @@ static int nbd_alloc_and_init_config(struct nbd_device *nbd)
 	init_waitqueue_head(&config->conn_wait);
 	config->blksize_bits = NBD_DEF_BLKSIZE_BITS;
 	atomic_set(&config->live_connections, 0);
+
 	nbd->config = config;
+	/*
+	 * Order refcount_set(&nbd->config_refs, 1) and nbd->config assignment,
+	 * its pair is the barrier in nbd_get_config_unlocked().
+	 * So nbd_get_config_unlocked() won't see nbd->config as null after
+	 * refcount_inc_not_zero() succeed.
+	 */
+	smp_mb__before_atomic();
 	refcount_set(&nbd->config_refs, 1);
 
 	return 0;
-- 
2.42.0

