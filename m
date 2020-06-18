Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A62741FFD4C
	for <lists+nbd@lfdr.de>; Thu, 18 Jun 2020 23:18:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8E1EB203E9; Thu, 18 Jun 2020 21:18:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 18 21:18:25 2020
Old-Return-Path: <cascardo@canonical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C6218203E5
	for <lists-other-nbd@bendel.debian.org>; Thu, 18 Jun 2020 21:03:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.878 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fsKeMklvhwgE for <lists-other-nbd@bendel.debian.org>;
	Thu, 18 Jun 2020 21:03:03 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AC98E203DA
	for <nbd@other.debian.org>; Thu, 18 Jun 2020 21:03:03 +0000 (UTC)
Received: from [189.110.235.168] (helo=localhost.localdomain)
	by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <cascardo@canonical.com>)
	id 1jm1gZ-00073w-PC; Thu, 18 Jun 2020 21:03:00 +0000
From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	cascardo@canonical.com
Subject: [PATCH] nbd: allocate sufficient space for NBD_CMD_STATUS
Date: Thu, 18 Jun 2020 18:02:40 -0300
Message-Id: <20200618210240.157566-2-cascardo@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618210240.157566-1-cascardo@canonical.com>
References: <20200618210240.157566-1-cascardo@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qED3GK55ogK.A.NaB.ho96eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/902
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200618210240.157566-2-cascardo@canonical.com
Resent-Date: Thu, 18 Jun 2020 21:18:25 +0000 (UTC)

The nest attribute NBD_ATTR_DEVICE_LIST was not accounted for when
allocating the message, resulting in -EMSGSIZE.

As __alloc_skb aligns size requests to SMP_CACHE_BYTES and SLUB will end up
allocating more than requested, this can hardly be reproduced on most
setups.

However, I managed to test this on a 32-bit x86 with 15 entries, by loading
with nbds_max=15. It failed with -EMSGSIZE, while it worked with 14 or 16
entries.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
---
 drivers/block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 43cff01a5a67..19551d8ca355 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2265,6 +2265,7 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
 	msg_size = nla_total_size(nla_attr_size(sizeof(u32)) +
 				  nla_attr_size(sizeof(u8)));
 	msg_size *= (index == -1) ? nbd_total_devices : 1;
+	msg_size += nla_total_size(0); /* for NBD_ATTR_DEVICE_LIST */
 
 	reply = genlmsg_new(msg_size, GFP_KERNEL);
 	if (!reply)
-- 
2.25.1

