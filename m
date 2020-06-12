Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3341F75FA
	for <lists+nbd@lfdr.de>; Fri, 12 Jun 2020 11:30:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BD5C22054D; Fri, 12 Jun 2020 09:30:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 12 09:30:08 2020
Old-Return-Path: <zhengbin13@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A9C91205A3
	for <lists-other-nbd@bendel.debian.org>; Fri, 12 Jun 2020 09:14:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.278 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JudVPe1Rg3Kc for <lists-other-nbd@bendel.debian.org>;
	Fri, 12 Jun 2020 09:14:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
X-Greylist: delayed 993 seconds by postgrey-1.36 at bendel; Fri, 12 Jun 2020 09:14:18 UTC
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 495E12059F
	for <nbd@other.debian.org>; Fri, 12 Jun 2020 09:14:17 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 7EA043C61EFE8A206547;
	Fri, 12 Jun 2020 16:57:39 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Fri, 12 Jun 2020
 16:57:32 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>
CC: <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH] nbd: Fix memory leak in nbd_add_socket
Date: Fri, 12 Jun 2020 17:04:37 +0800
Message-ID: <20200612090437.77977-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <dot1KqwC1cB.A.cxH.gs04eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/899
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200612090437.77977-1-zhengbin13@huawei.com
Resent-Date: Fri, 12 Jun 2020 09:30:08 +0000 (UTC)

nbd_add_socket
  socks = krealloc(num_connections+1) -->if num_connections is 0, alloc 1
  nsock = kzalloc                     -->If fail, will return

nbd_config_put
  if (config->num_connections)        -->0, not free
    kfree(config->socks)

Thus memleak happens, this patch fixes that.

Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
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

