Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBA0444DF6
	for <lists+nbd@lfdr.de>; Thu,  4 Nov 2021 05:39:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 617432060F; Thu,  4 Nov 2021 04:39:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov  4 04:39:10 2021
Old-Return-Path: <wubo40@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3BCF320605
	for <lists-other-nbd@bendel.debian.org>; Thu,  4 Nov 2021 04:22:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.281 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eIev-mdSVHeC for <lists-other-nbd@bendel.debian.org>;
	Thu,  4 Nov 2021 04:22:11 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 1181 seconds by postgrey-1.36 at bendel; Thu, 04 Nov 2021 04:22:11 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9920B2059A
	for <nbd@other.debian.org>; Thu,  4 Nov 2021 04:22:11 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Hl94h1yzqzZckp;
	Thu,  4 Nov 2021 12:04:20 +0800 (CST)
Received: from dggpeml500019.china.huawei.com (7.185.36.137) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 4 Nov 2021 12:06:16 +0800
Received: from huawei.com (10.175.124.27) by dggpeml500019.china.huawei.com
 (7.185.36.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Thu, 4 Nov
 2021 12:06:16 +0800
From: Wu Bo <wubo40@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <linfeilong@huawei.com>, <wubo40@huawei.com>
Subject: [PATCH RESEND] nbd: code clean for nbd_genl_status()
Date: Thu, 4 Nov 2021 12:38:23 +0800
Message-ID: <1636000703-13217-1-git-send-email-wubo40@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500019.china.huawei.com (7.185.36.137)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jeZUf9yJGvJ.A.tWD.uP2ghB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1608
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1636000703-13217-1-git-send-email-wubo40@huawei.com
Resent-Date: Thu,  4 Nov 2021 04:39:10 +0000 (UTC)

A simple code clean for nbd_genl_status()

Signed-off-by: Wu Bo <wubo40@huawei.com>
---
 drivers/block/nbd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b47b2a8..175ea97 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2375,7 +2375,6 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
 	reply_head = genlmsg_put_reply(reply, info, &nbd_genl_family, 0,
 				       NBD_CMD_STATUS);
 	if (!reply_head) {
-		nlmsg_free(reply);
 		goto out;
 	}
 
@@ -2383,7 +2382,6 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
 	if (index == -1) {
 		ret = idr_for_each(&nbd_index_idr, &status_cb, reply);
 		if (ret) {
-			nlmsg_free(reply);
 			goto out;
 		}
 	} else {
@@ -2392,7 +2390,6 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
 		if (nbd) {
 			ret = populate_nbd_status(nbd, reply);
 			if (ret) {
-				nlmsg_free(reply);
 				goto out;
 			}
 		}
@@ -2401,6 +2398,8 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
 	genlmsg_end(reply, reply_head);
 	ret = genlmsg_reply(reply, info);
 out:
+	if (reply)
+		nlmsg_free(reply);
 	mutex_unlock(&nbd_index_mutex);
 	return ret;
 }
-- 
1.8.3.1

