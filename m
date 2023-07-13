Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 38531752B3B
	for <lists+nbd@lfdr.de>; Thu, 13 Jul 2023 21:54:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1F7A620B8D; Thu, 13 Jul 2023 19:54:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 13 19:54:17 2023
Old-Return-Path: <linux@weissschuh.net>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	DIGITS_LETTERS,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8CE1E20B70
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jul 2023 19:36:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.19 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, BAYES_00=-2, DIGITS_LETTERS=1,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	T_SCC_BODY_TEXT_LINE=-0.01, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LZqrG4-l_eU9 for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jul 2023 19:36:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 404 seconds by postgrey-1.36 at bendel; Thu, 13 Jul 2023 19:36:32 UTC
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DE4B520AD2
	for <nbd@other.debian.org>; Thu, 13 Jul 2023 19:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1689276584;
	bh=Xho1RRU1A/ibhnVnCa6aEvzSgVmvXCiwnrryRlLF1wc=;
	h=From:Date:Subject:To:Cc:From;
	b=WLHmHuCAc9Bxhf82Qu5ylY+J6JNyIeCoo5z4Bn/bkvsjG5ZFBWa2A2zXmM1C87Rwo
	 pX94ZmRRb8TKu98r0SDwx/Xzm5J3VTTVsMM0H5nvUeXecUX6+907xd9nU4iogCUZX4
	 9Qg/tH+uXTjymkIeryuGu5wlwNQP8+fDyjsFpbpM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 13 Jul 2023 21:29:35 +0200
Subject: [PATCH v3] nbd: automatically load module on genl access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230713-b4-nbd-genl-v3-1-226cbddba04b@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAJ5QsGQC/22OQQ6CMBREr2K69hv6W7C48h6GRVu+tAkW0wJiC
 He3mrgxLt8k82ZWlih6Suy0W1mk2Sc/hAxiv2PW6dAR+DYzwwJFgSjASAimhY5CD0IfpdWVUJW
 qWG4YnQhM1MG63AlT3+fwHunql8/Epcl8jcMNRhdJf8XIOS+KEqVQB+RKAYfeh2k5P8inlKyb3
 CHQ+F5wPo1DfH7uzvhW/n82Y5ZUslRlW1uSpv51Ndu2vQAOXMeQ/QAAAA==
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689276583; l=1914;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Xho1RRU1A/ibhnVnCa6aEvzSgVmvXCiwnrryRlLF1wc=;
 b=YSMNsgom1VNydhyc2/0PBTrm3KK9NElllnflH0x4429UnzwKvfEyztkNwQjdzm4Li+nhO0IvI
 KKKVR2imMcwCqsNjhBAEBOZSHDWNXgqyG3IX4zLXWcQEi+KN3cdxCW8
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <woJBvGhZIrB.A.9nB.pZFskB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2569
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230713-b4-nbd-genl-v3-1-226cbddba04b@weissschuh.net
Resent-Date: Thu, 13 Jul 2023 19:54:17 +0000 (UTC)

Add a module alias to nbd.ko that allows the generic netlink core to
automatically load the module when netlink messages for nbd are
received.

This frees the user from manually having to load the module before using
nbd functionality via netlink.
If the system policy allows it this can even be used to load the nbd
module from containers which would otherwise not have access to the
necessary module files to do a normal "modprobe nbd".

For example this avoids the following error when using nbd-client:

$ nbd-client localhost 10809 /dev/nbd0
...
Error: Couldn't resolve the nbd netlink family, make sure the nbd module is loaded and your nbd driver supports the netlink interface.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Resend to gain some reviews
- Expand commit message
- Drop additional reviewers again
- Cc Christoph as reviewer, as he recently reviewed NBD stuff
- Link to v2: https://lore.kernel.org/r/20230223-b4-nbd-genl-v2-1-64585d9ce4b9@weissschuh.net

Changes in v2:
- Expand Cc list to get some reviews
- Add concrete commit example to commit message
- Link to v1: https://lore.kernel.org/lkml/20221110052438.2188-1-linux@weissschuh.net/
---
 drivers/block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 8576d696c7a2..a346dbd73543 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2336,6 +2336,7 @@ static struct genl_family nbd_genl_family __ro_after_init = {
 	.mcgrps		= nbd_mcast_grps,
 	.n_mcgrps	= ARRAY_SIZE(nbd_mcast_grps),
 };
+MODULE_ALIAS_GENL_FAMILY(NBD_GENL_FAMILY_NAME);
 
 static int populate_nbd_status(struct nbd_device *nbd, struct sk_buff *reply)
 {

---
base-commit: eb26cbb1a754ccde5d4d74527dad5ba051808fad
change-id: 20230223-b4-nbd-genl-3a74ca638686

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

