Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3112035B9
	for <lists+nbd@lfdr.de>; Mon, 22 Jun 2020 13:30:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A2F812055B; Mon, 22 Jun 2020 11:30:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 22 11:30:13 2020
Old-Return-Path: <zhengbin13@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,TO_TOO_MANY autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0B47620515
	for <lists-other-nbd@bendel.debian.org>; Mon, 22 Jun 2020 11:13:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.278 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wcA6sqBEHEgY for <lists-other-nbd@bendel.debian.org>;
	Mon, 22 Jun 2020 11:13:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CB049203D4
	for <nbd@other.debian.org>; Mon, 22 Jun 2020 11:13:10 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id CB557B8189E77C3B414F;
	Mon, 22 Jun 2020 19:13:05 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 22 Jun 2020
 19:12:56 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <Markus.Elfring@web.de>, <josef@toxicpanda.com>, <axboe@kernel.dk>,
	<navid.emamdoost@gmail.com>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>, <linux-kernel@vger.kernel.org>
CC: <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH v3] nbd: Fix memory leak in nbd_add_socket
Date: Mon, 22 Jun 2020 19:20:01 +0800
Message-ID: <20200622112001.105047-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9CmZlQ2ZazB.A.dPF.FZJ8eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/907
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200622112001.105047-1-zhengbin13@huawei.com
Resent-Date: Mon, 22 Jun 2020 11:30:13 +0000 (UTC)

When adding first socket to nbd, if nsock's allocation failed, the data
structure member "config->socks" was reallocated, but the data structure
member "config->num_connections" was not updated. A memory leak will occur
then because the function "nbd_config_put" will free "config->socks" only
when "config->num_connections" is not zero.

Fixes: 03bf73c315ed ("nbd: prevent memory leak")
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---

v1->v2: improve change description
v2->v3: fix some code style issues, improve change description, thanks to
        Markus for the review.

 drivers/block/nbd.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 43cff01a5a67..ce7e9f223b20 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1033,25 +1033,26 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	     test_bit(NBD_RT_BOUND, &config->runtime_flags))) {
 		dev_err(disk_to_dev(nbd->disk),
 			"Device being setup by another task");
-		sockfd_put(sock);
-		return -EBUSY;
+		err = -EBUSY;
+		goto put_socket;
+	}
+
+	nsock = kzalloc(sizeof(*nsock), GFP_KERNEL);
+	if (!nsock) {
+		err = -ENOMEM;
+		goto put_socket;
 	}

 	socks = krealloc(config->socks, (config->num_connections + 1) *
 			 sizeof(struct nbd_sock *), GFP_KERNEL);
 	if (!socks) {
-		sockfd_put(sock);
-		return -ENOMEM;
+		kfree(nsock);
+		err = -ENOMEM;
+		goto put_socket;
 	}

 	config->socks = socks;

-	nsock = kzalloc(sizeof(struct nbd_sock), GFP_KERNEL);
-	if (!nsock) {
-		sockfd_put(sock);
-		return -ENOMEM;
-	}
-
 	nsock->fallback_index = -1;
 	nsock->dead = false;
 	mutex_init(&nsock->tx_lock);
@@ -1063,6 +1064,10 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	atomic_inc(&config->live_connections);

 	return 0;
+
+put_socket:
+	sockfd_put(sock);
+	return err;
 }

 static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
--
2.26.0.106.g9fadedd

