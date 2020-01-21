Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B931143DA2
	for <lists+nbd@lfdr.de>; Tue, 21 Jan 2020 14:06:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 08679204BD; Tue, 21 Jan 2020 13:06:38 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan 21 13:06:38 2020
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F2871203E1
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Jan 2020 12:49:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.26 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FVGT_m_MULTI_ODD=0.02,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xDwyH5Zjw9J3 for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Jan 2020 12:49:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3C3FC20490
	for <nbd@other.debian.org>; Tue, 21 Jan 2020 12:49:32 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 14596C7C8A9241831D23;
	Tue, 21 Jan 2020 20:49:27 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 21 Jan 2020
 20:49:16 +0800
From: Sun Ke <sunke32@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <sunke32@huawei.com>,
	<mchristi@redhat.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] nbd: add a flush_workqueue in nbd_start_device
Date: Tue, 21 Jan 2020 20:48:13 +0800
Message-ID: <20200121124813.13332-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UEEk9i7wkfC.A._yG.ddvJeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/776
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200121124813.13332-1-sunke32@huawei.com
Resent-Date: Tue, 21 Jan 2020 13:06:38 +0000 (UTC)

When kzalloc fail, may cause trying to destroy the
workqueue from inside the workqueue.

If num_connections is m (2 < m), and NO.1 ~ NO.n
(1 < n < m) kzalloc are successful. The NO.(n + 1)
failed. Then, nbd_start_device will return ENOMEM
to nbd_start_device_ioctl, and nbd_start_device_ioctl
will return immediately without running flush_workqueue.
However, we still have n recv threads. If nbd_release
run first, recv threads may have to drop the last
config_refs and try to destroy the workqueue from
inside the workqueue.

To fix it, add a flush_workqueue in nbd_start_device.

Fixes: e9e006f5fcf2 ("nbd: fix max number of supported devs")
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 drivers/block/nbd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b4607dd96185..dd1f8c2c6169 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1264,7 +1264,12 @@ static int nbd_start_device(struct nbd_device *nbd)
 
 		args = kzalloc(sizeof(*args), GFP_KERNEL);
 		if (!args) {
-			sock_shutdown(nbd);
+			if (i == 0)
+				sock_shutdown(nbd);
+			else {
+				sock_shutdown(nbd);
+				flush_workqueue(nbd->recv_workq);
+			}
 			return -ENOMEM;
 		}
 		sk_set_memalloc(config->socks[i]->sock->sk);
-- 
2.17.2

