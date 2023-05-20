Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D0570AA88
	for <lists+nbd@lfdr.de>; Sat, 20 May 2023 20:39:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1E2C5204A5; Sat, 20 May 2023 18:39:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 20 18:39:53 2023
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,GMAIL,
	LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 772352048C
	for <lists-other-nbd@bendel.debian.org>; Sat, 20 May 2023 18:24:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.551 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, GMAIL=1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hBo1Fdo3svTj for <lists-other-nbd@bendel.debian.org>;
	Sat, 20 May 2023 18:24:13 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AB98D20447
	for <nbd@other.debian.org>; Sat, 20 May 2023 18:24:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8006660A24;
	Sat, 20 May 2023 18:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132D0C433D2;
	Sat, 20 May 2023 18:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684607048;
	bh=uqeMKbUWEZLVKRiEYY5Fm2A3dW4g8dNMtC9yu+37mfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g5Wkx5nlRImR/MAvWpqo8GeobX961iZFN/aGuMzlqIpZx4+djtbZGnKZxC6dJbF+r
	 Jyt5mL4EhjXLsmy/6D4h88RKUB307Bi/I62/896rBh12BMpbtun4DM42FKIFXd5s5A
	 ljZOKClQoIvbQDr+3Mad4MPFHkGApenomoeXQd4/Yt6QV31N/DRi3v2FqQcjRm5+Bo
	 gK2Ywg+DWbpUaije1o5EoIeuR21Lset3qfiXXJN6NzLg21CPY3YWL70xeNuAJj/sF/
	 K5Meyo0Rm8XJDumfHzle2CCHsnJJmzzz9f5GunA1KRyieyud7nnIW1MKECmjgutPAJ
	 7wV3ydTT/kFzA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 5.4 5/5] nbd: Fix debugfs_create_dir error checking
Date: Sat, 20 May 2023 14:23:47 -0400
Message-Id: <20230520182352.856378-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520182352.856378-1-sashal@kernel.org>
References: <20230520182352.856378-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ru-y5LL1EV.A.bMB.5PRakB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2475
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230520182352.856378-5-sashal@kernel.org
Resent-Date: Sat, 20 May 2023 18:39:53 +0000 (UTC)

From: Ivan Orlov <ivan.orlov0322@gmail.com>

[ Upstream commit 4913cfcf014c95f0437db2df1734472fd3e15098 ]

The debugfs_create_dir function returns ERR_PTR in case of error, and the
only correct way to check if an error occurred is 'IS_ERR' inline function.
This patch will replace the null-comparison with IS_ERR.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
Link: https://lore.kernel.org/r/20230512130533.98709-1-ivan.orlov0322@gmail.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 610dc6a36a9de..218aa7e419700 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1609,7 +1609,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
 		return -EIO;
 
 	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
-	if (!dir) {
+	if (IS_ERR(dir)) {
 		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
 			nbd_name(nbd));
 		return -EIO;
@@ -1635,7 +1635,7 @@ static int nbd_dbg_init(void)
 	struct dentry *dbg_dir;
 
 	dbg_dir = debugfs_create_dir("nbd", NULL);
-	if (!dbg_dir)
+	if (IS_ERR(dbg_dir))
 		return -EIO;
 
 	nbd_dbg_dir = dbg_dir;
-- 
2.39.2

