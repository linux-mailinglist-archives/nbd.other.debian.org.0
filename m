Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E3470671E
	for <lists+nbd@lfdr.de>; Wed, 17 May 2023 13:48:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BE5DA2049F; Wed, 17 May 2023 11:48:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 17 11:48:11 2023
Old-Return-Path: <linux@weissschuh.net>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CCBD62041F
	for <lists-other-nbd@bendel.debian.org>; Wed, 17 May 2023 11:30:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.19 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id he3ezEdlot_c for <lists-other-nbd@bendel.debian.org>;
	Wed, 17 May 2023 11:30:14 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 96FE020493
	for <nbd@other.debian.org>; Wed, 17 May 2023 11:30:14 +0000 (UTC)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1684323010;
	bh=tX5B9YR0enKjdo8Rk63Z+5SJMwlE6xq8HQ4kgSM4ylU=;
	h=From:Date:Subject:To:Cc:From;
	b=hJwrVwFQukiU4UMcCJrA5lzxgA8pOX1JdgG5wrs409bquq+cCFhPJaPpOvhUTKiQ6
	 gAmlRrXeNYLhk4wqqunpw/JNawwyVx+jcl/Yr4AVbIxITF+R7cH4NEwCBko8caCqns
	 db6bMl9bj0XldY4OxYVYl+8dWzQMV/35+rpLtAZE=
Date: Wed, 17 May 2023 13:30:05 +0200
Subject: [PATCH v2] nbd: automatically load module on genl access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230223-b4-nbd-genl-v2-1-64585d9ce4b9@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIALy6ZGQC/zWNQQrCMBBFr1KydkoyqTW48h7iIkmnTSBOJWm1U
 Hp3g+DyfXjv76JQjlTEtdlFpncsceYKeGqED5YngjhUFihRS0QNrgN2A0zECbS9dN722vSmF9V
 wthC4bNmH6vCaUh1fmca4/S7uj8pjnp+whEz2H0allJRn7LRpURkDClLkdbt9KJZSfFhDy7SI4
 /gC2AiDba8AAAA=
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, Wouter Verhelst <w@uter.be>, 
 "Richard W.M. Jones" <rjones@redhat.com>, 
 Josh Triplett <josh@joshtriplett.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684323007; l=1278;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=tX5B9YR0enKjdo8Rk63Z+5SJMwlE6xq8HQ4kgSM4ylU=;
 b=RTZfwn/ytq5xcFdHDR6ZfgqLHr4gAH0UxLUokOjS5rbCOF9JIRK0Cd8dGjOiYbvJOZYg2yayr
 kkMaoHJCcGmBEw2CS2M5jS/gbBTUajZjw3sB464zeEyofqm7L9U3Cjv
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zMnrBmK-hdE.A.naG.77LZkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2467
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230223-b4-nbd-genl-v2-1-64585d9ce4b9@weissschuh.net
Resent-Date: Wed, 17 May 2023 11:48:11 +0000 (UTC)

Instead of forcing the user to manually load the module do it
automatically.

For example this avoids the following error when using nbd-client:

$ nbd-client localhost 10809 /dev/nbd0
...
Error: Couldn't resolve the nbd netlink family, make sure the nbd module is loaded and your nbd driver supports the netlink interface.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Expand Cc list to get some reviews
- Add concrete commit example to commit message
- Link to v1: https://lore.kernel.org/lkml/20221110052438.2188-1-linux@weissschuh.net/
---
 drivers/block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 65ecde3e2a5b..8632dbacd2ef 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2335,6 +2335,7 @@ static struct genl_family nbd_genl_family __ro_after_init = {
 	.mcgrps		= nbd_mcast_grps,
 	.n_mcgrps	= ARRAY_SIZE(nbd_mcast_grps),
 };
+MODULE_ALIAS_GENL_FAMILY(NBD_GENL_FAMILY_NAME);
 
 static int populate_nbd_status(struct nbd_device *nbd, struct sk_buff *reply)
 {

---
base-commit: f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
change-id: 20230223-b4-nbd-genl-3a74ca638686

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

