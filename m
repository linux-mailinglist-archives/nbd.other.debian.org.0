Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED4437BC13
	for <lists+nbd@lfdr.de>; Wed, 12 May 2021 13:54:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4BD342036D; Wed, 12 May 2021 11:54:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 12 11:54:20 2021
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A64432034E
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 May 2021 11:36:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.278 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YUQC9FYggMYf for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 May 2021 11:36:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A2F3E2035C
	for <nbd@other.debian.org>; Wed, 12 May 2021 11:36:14 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FgCN96dqwz1BLVZ;
	Wed, 12 May 2021 19:33:29 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Wed, 12 May 2021
 19:35:59 +0800
From: Sun Ke <sunke32@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <Markus.Elfring@web.de>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <sunke32@huawei.com>
Subject: [PATCH 2/2] nbd: share nbd_put and return by goto put_nbd
Date: Wed, 12 May 2021 19:43:31 +0800
Message-ID: <20210512114331.1233964-3-sunke32@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210512114331.1233964-1-sunke32@huawei.com>
References: <20210512114331.1233964-1-sunke32@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bxPEmKfcLfF.A.Z_F.sH8mgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1155
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210512114331.1233964-3-sunke32@huawei.com
Resent-Date: Wed, 12 May 2021 11:54:20 +0000 (UTC)

Replace the following two statements by the statement “goto put_nbd;”

	nbd_put(nbd);
	return 0;

Signed-off-by: Sun Ke <sunke32@huawei.com>
Suggested-by: Markus Elfring <Markus.Elfring@web.de>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/nbd.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 974da561b8e5..45d2c28c8fc8 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2015,12 +2015,11 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
 		return -EINVAL;
 	}
 	mutex_unlock(&nbd_index_mutex);
-	if (!refcount_inc_not_zero(&nbd->config_refs)) {
-		nbd_put(nbd);
-		return 0;
-	}
+	if (!refcount_inc_not_zero(&nbd->config_refs))
+		goto put_nbd;
 	nbd_disconnect_and_put(nbd);
 	nbd_config_put(nbd);
+put_nbd:
 	nbd_put(nbd);
 	return 0;
 }
-- 
2.25.4

