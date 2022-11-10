Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB82623B7C
	for <lists+nbd@lfdr.de>; Thu, 10 Nov 2022 06:51:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6CAD9203DA; Thu, 10 Nov 2022 05:51:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov 10 05:51:12 2022
Old-Return-Path: <linux@weissschuh.net>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BDAA7203AD
	for <lists-other-nbd@bendel.debian.org>; Thu, 10 Nov 2022 05:33:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oQpWASX-7f3a for <lists-other-nbd@bendel.debian.org>;
	Thu, 10 Nov 2022 05:33:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 504 seconds by postgrey-1.36 at bendel; Thu, 10 Nov 2022 05:33:46 UTC
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 98D3F2027E
	for <nbd@other.debian.org>; Thu, 10 Nov 2022 05:33:46 +0000 (UTC)
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1668057892;
	bh=SIhRYzH//kwaIhdzxST5+Pe24phe7wR7IiS7fLDVIpw=;
	h=From:To:Cc:Subject:Date:From;
	b=EeFpj9ulPKz3ANUzNLdzFGp0I0wnfEyPM0MMNAaFFz/+nWhods7DWc9sKzj8tPZCI
	 2+j4VswE9Abb621YrWji9yDudR+qwgbNRDdM/ZL2k8Hg+cdrUZnz15yODHCmkbtHQs
	 AH3ueKjuGAVWaMaexKLAnNhPeprXY9QeN9yWLz4I=
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nbd: automatically load module on genl access
Date: Thu, 10 Nov 2022 06:24:38 +0100
Message-Id: <20221110052438.2188-1-linux@weissschuh.net>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1668057875; l=727; i=linux@weissschuh.net; s=20211113; h=from:subject; bh=SIhRYzH//kwaIhdzxST5+Pe24phe7wR7IiS7fLDVIpw=; b=TamtngLw5uGYaOiLQpg88P6iUzWfM1ZrfLyQNTSb9ffqCXcn6aghwLYi7eM0GXA0YO6yiR2sr1Hs UqDN2rPwBKx/saBBKi9xXSwr5k8/LNpPVAGDlsq5M6JV4imnTuxh
X-Developer-Key: i=linux@weissschuh.net; a=ed25519; pk=9LP6KM4vD/8CwHW7nouRBhWLyQLcK1MkP6aTZbzUlj4=
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0q7QJueDIsN.A.eNE.QFJbjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2246
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221110052438.2188-1-linux@weissschuh.net
Resent-Date: Thu, 10 Nov 2022 05:51:12 +0000 (UTC)

Instead of forcing the user to manually load the module do it
automatically.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5cffd96ef2d7..1c38a7ea9531 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2328,6 +2328,7 @@ static struct genl_family nbd_genl_family __ro_after_init = {
 	.mcgrps		= nbd_mcast_grps,
 	.n_mcgrps	= ARRAY_SIZE(nbd_mcast_grps),
 };
+MODULE_ALIAS_GENL_FAMILY(NBD_GENL_FAMILY_NAME);
 
 static int populate_nbd_status(struct nbd_device *nbd, struct sk_buff *reply)
 {

base-commit: f67dd6ce0723ad013395f20a3f79d8a437d3f455
-- 
2.38.1

