Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF962022B2
	for <lists+nbd@lfdr.de>; Sat, 20 Jun 2020 10:57:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 06EA020411; Sat, 20 Jun 2020 08:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jun 20 08:57:09 2020
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
	by bendel.debian.org (Postfix) with ESMTP id DB0E520356
	for <lists-other-nbd@bendel.debian.org>; Sat, 20 Jun 2020 08:41:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.278 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dus4Uxp-siuo for <lists-other-nbd@bendel.debian.org>;
	Sat, 20 Jun 2020 08:41:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_NE_HELO=0.5 (check from: .huawei. - helo: .huawei. - helo-domain: .huawei.)  CL_HOSTNAME_MATCHES_FROM(DOMAIN)=-1.2; rate: -2.2
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 729B720301
	for <nbd@other.debian.org>; Sat, 20 Jun 2020 08:41:21 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 71E1C5320015253F93A7;
	Sat, 20 Jun 2020 16:41:15 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sat, 20 Jun 2020
 16:41:05 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <navid.emamdoost@gmail.com>,
	<linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
CC: <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH v2] nbd: Fix memory leak in nbd_add_socket
Date: Sat, 20 Jun 2020 16:48:09 +0800
Message-ID: <20200620084809.126398-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <p8wHK96rIgC.A.oRE.k9c7eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/903
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200620084809.126398-1-zhengbin13@huawei.com
Resent-Date: Sat, 20 Jun 2020 08:57:09 +0000 (UTC)

If we add first socket to nbd, config->socks is malloced but
num_connections does not update(nsock's allocation fail), the memory
is leaked. Cause in later nbd_config_put(), will only free config->socks
when num_connections is not 0.

Let nsock's allocation first to avoid this.

Fixes: 03bf73c315ed ("nbd: prevent memory leak")
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---

v1->v2: modify comments

 drivers/block/nbd.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 43cff01a5a67..3e7709317b17 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1037,21 +1037,22 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 		return -EBUSY;
 	}

+	nsock = kzalloc(sizeof(struct nbd_sock), GFP_KERNEL);
+	if (!nsock) {
+		sockfd_put(sock);
+		return -ENOMEM;
+	}
+
 	socks = krealloc(config->socks, (config->num_connections + 1) *
 			 sizeof(struct nbd_sock *), GFP_KERNEL);
 	if (!socks) {
 		sockfd_put(sock);
+		kfree(nsock);
 		return -ENOMEM;
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
--
2.26.0.106.g9fadedd

