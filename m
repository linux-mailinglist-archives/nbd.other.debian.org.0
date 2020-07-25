Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E4ADF22D402
	for <lists+nbd@lfdr.de>; Sat, 25 Jul 2020 05:00:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 984E9204AF; Sat, 25 Jul 2020 03:00:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jul 25 03:00:10 2020
Old-Return-Path: <liheng40@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B191020465
	for <lists-other-nbd@bendel.debian.org>; Sat, 25 Jul 2020 02:42:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.278 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9P70gEYTF63F for <lists-other-nbd@bendel.debian.org>;
	Sat, 25 Jul 2020 02:42:13 +0000 (UTC)
X-policyd-weight: using cached result; rate: -2.2
X-Greylist: delayed 942 seconds by postgrey-1.36 at bendel; Sat, 25 Jul 2020 02:42:13 UTC
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2339F2036F
	for <nbd@other.debian.org>; Sat, 25 Jul 2020 02:42:12 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 6A873FF51C619BC27CBE;
	Sat, 25 Jul 2020 10:26:24 +0800 (CST)
Received: from huawei.com (10.175.104.57) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Sat, 25 Jul 2020
 10:26:20 +0800
From: Li Heng <liheng40@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] nbd: add missed destroy_workqueue when nbd_start_device fails
Date: Sat, 25 Jul 2020 10:27:50 +0800
Message-ID: <1595644070-26293-1-git-send-email-liheng40@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Kqumf4OWYoI.A.RXG.6A6GfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/923
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1595644070-26293-1-git-send-email-liheng40@huawei.com
Resent-Date: Sat, 25 Jul 2020 03:00:10 +0000 (UTC)

destroy_workqueue() should be called to destroy ndev->tx_wq
when nbd_start_device init resources fails.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Li Heng <liheng40@huawei.com>
---
 drivers/block/nbd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index ce7e9f22..45e0a9f4 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -4,7 +4,7 @@
  *
  * Note that you can not swap over this thing, yet. Seems to work but
  * deadlocks sometimes - you can not swap over TCP in general.
- * 
+ *
  * Copyright 1997-2000, 2008 Pavel Machek <pavel@ucw.cz>
  * Parts copyright 2001 Steven Whitehouse <steve@chygwyn.com>
  *
@@ -1270,6 +1270,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 	error = device_create_file(disk_to_dev(nbd->disk), &pid_attr);
 	if (error) {
 		dev_err(disk_to_dev(nbd->disk), "device_create_file failed!\n");
+		destroy_workqueue(nbd->recv_workq);
 		return error;
 	}
 	set_bit(NBD_RT_HAS_PID_FILE, &config->runtime_flags);
@@ -1291,6 +1292,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 			 */
 			if (i)
 				flush_workqueue(nbd->recv_workq);
+			destroy_workqueue(nbd->recv_workq);
 			return -ENOMEM;
 		}
 		sk_set_memalloc(config->socks[i]->sock->sk);
-- 
2.7.4

