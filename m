Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F28A6A1501
	for <lists+nbd@lfdr.de>; Fri, 24 Feb 2023 03:39:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6D43720ECA; Fri, 24 Feb 2023 02:39:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 24 02:39:11 2023
Old-Return-Path: <kuba@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI,WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D48B720EBD
	for <lists-other-nbd@bendel.debian.org>; Fri, 24 Feb 2023 02:23:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3KS-ps75u2LR for <lists-other-nbd@bendel.debian.org>;
	Fri, 24 Feb 2023 02:23:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 628 seconds by postgrey-1.36 at bendel; Fri, 24 Feb 2023 02:23:39 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C300720E63
	for <nbd@other.debian.org>; Fri, 24 Feb 2023 02:23:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F0FCDB81BA6;
	Fri, 24 Feb 2023 02:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B741C433D2;
	Fri, 24 Feb 2023 02:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677204786;
	bh=qGoYP20O9saJ3einB7QzEr3C54c5dcnleXGfLllaVrU=;
	h=From:To:Cc:Subject:Date:From;
	b=SBPio0wExy/6wYZjTyWsnwSgdKqEfQiDd0iF4YPb4zrXRa0HQ0Vmi8UYBgEwn2WzT
	 +Ssz9iVsErkQR+HYOWXAL5Grfnnzh4GW7tC//Qbb03mpbUVpwWNtD30LibIkcuvRKC
	 IBSv6M7qvPAD5k4l4WjL5WyCUZ9omsboblPusdY+/f+UL76fmcJN3wY68aGcvOyNSf
	 Wq6VQnxvumZ/w/C3LG13abgja+iyf+/tggVCPo3MnZeJL/9jscruZ9TVOrXGa9oh3P
	 JUomA65xvKT07MxbQnJC9TKTKIzi39zphqzGWXSduJytw8nsxbXRt36fof95ab5lMa
	 AX2B2WJmwuR4A==
From: Jakub Kicinski <kuba@kernel.org>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH -next 1/2] nbd: allow genl access outside init_net
Date: Thu, 23 Feb 2023 18:13:00 -0800
Message-Id: <20230224021301.1630703-1-kuba@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <e2DydGqYwKF.A.lSE.PNC-jB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2331
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230224021301.1630703-1-kuba@kernel.org
Resent-Date: Fri, 24 Feb 2023 02:39:11 +0000 (UTC)

NBD doesn't have much to do with networking, allow users outside
init_net to access the family.

Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 592cfa8b765a..53e4bb754fd9 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2325,6 +2325,7 @@ static struct genl_family nbd_genl_family __ro_after_init = {
 	.n_small_ops	= ARRAY_SIZE(nbd_connect_genl_ops),
 	.resv_start_op	= NBD_CMD_STATUS + 1,
 	.maxattr	= NBD_ATTR_MAX,
+	.netnsok	= 1,
 	.policy = nbd_attr_policy,
 	.mcgrps		= nbd_mcast_grps,
 	.n_mcgrps	= ARRAY_SIZE(nbd_mcast_grps),
-- 
2.39.2

