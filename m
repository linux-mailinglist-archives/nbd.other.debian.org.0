Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF3D157015
	for <lists+nbd@lfdr.de>; Mon, 10 Feb 2020 08:51:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 193F6204EA; Mon, 10 Feb 2020 07:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 10 07:51:10 2020
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D25DC204DC
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Feb 2020 07:34:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9xTfHPaWrVK5 for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Feb 2020 07:33:58 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL_SUBNET=-1.2 (check from: .huawei. - helo: .huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -4.7
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2842C204C2
	for <nbd@other.debian.org>; Mon, 10 Feb 2020 07:33:57 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 28D5B2F7CEFFAE2091B8;
	Mon, 10 Feb 2020 15:33:50 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Mon, 10 Feb 2020
 15:33:41 +0800
From: Sun Ke <sunke32@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <mchristi@redhat.com>,
	<sunke32@huawei.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
Subject: [v3] nbd: fix potential NULL pointer fault in nbd_genl_disconnect
Date: Mon, 10 Feb 2020 15:32:41 +0800
Message-ID: <20200210073241.41813-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <KO2TCTvUVoI.A.ZT.utQQeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/804
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200210073241.41813-1-sunke32@huawei.com
Resent-Date: Mon, 10 Feb 2020 07:51:10 +0000 (UTC)

Open /dev/nbdX first, the config_refs will be 1 and
the pointers in nbd_device are still null. Disconnect
/dev/nbdX, then reference a null recv_workq. The
protection by config_refs in nbd_genl_disconnect is useless.

To fix it, just add a check for a non null task_recv in
nbd_genl_disconnect.

Signed-off-by: Sun Ke <sunke32@huawei.com>
---
v1 -> v2:
Add an omitted mutex_unlock.

v2 -> v3:
Add nbd->config_lock, suggested by Josef.
---
 drivers/block/nbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b4607dd96185..870b3fd0c101 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2008,12 +2008,20 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
 		       index);
 		return -EINVAL;
 	}
+	mutex_lock(&nbd->config_lock);
 	if (!refcount_inc_not_zero(&nbd->refs)) {
+		mutex_unlock(&nbd->config_lock);
 		mutex_unlock(&nbd_index_mutex);
 		printk(KERN_ERR "nbd: device at index %d is going down\n",
 		       index);
 		return -EINVAL;
 	}
+	if (!nbd->recv_workq) {
+		mutex_unlock(&nbd->config_lock);
+		mutex_unlock(&nbd_index_mutex);
+		return -EINVAL;
+	}
+	mutex_unlock(&nbd->config_lock);
 	mutex_unlock(&nbd_index_mutex);
 	if (!refcount_inc_not_zero(&nbd->config_refs)) {
 		nbd_put(nbd);
-- 
2.17.2

