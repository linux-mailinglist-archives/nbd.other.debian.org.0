Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 755164413C8
	for <lists+nbd@lfdr.de>; Mon,  1 Nov 2021 07:33:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5DC4020307; Mon,  1 Nov 2021 06:33:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov  1 06:33:35 2021
Old-Return-Path: <yebin10@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,PHONENUMBER,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EDC04202F3
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Nov 2021 06:17:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.781 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	PHONENUMBER=1.5, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mECTHU4syLaT for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Nov 2021 06:17:25 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7430F202C2
	for <nbd@other.debian.org>; Mon,  1 Nov 2021 06:17:24 +0000 (UTC)
Received: from dggeme754-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HjN9M2nQyz90d6;
	Mon,  1 Nov 2021 14:17:11 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggeme754-chm.china.huawei.com
 (10.3.19.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Mon, 1
 Nov 2021 14:17:08 +0800
From: Ye Bin <yebin10@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>
CC: <linux-kernel@vger.kernel.org>, Ye Bin <yebin10@huawei.com>
Subject: [PATCH -next v3 1/2] nbd: Fix incorrect error handle when first_minor big than '0xff' in nbd_dev_add
Date: Mon, 1 Nov 2021 14:29:55 +0800
Message-ID: <20211101062956.791573-2-yebin10@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101062956.791573-1-yebin10@huawei.com>
References: <20211101062956.791573-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeme754-chm.china.huawei.com (10.3.19.100)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LIc1uuDs_BM.A.uaG._o4fhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1595
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211101062956.791573-2-yebin10@huawei.com
Resent-Date: Mon,  1 Nov 2021 06:33:35 +0000 (UTC)

If first_minor big than '0xff' goto out_free_idr label, this will miss
cleanup disk.

Fixes: b1a811633f73 ("block: nbd: add sanity check for first_minor")
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b47b2a87ae8f..096883ab9b76 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1809,7 +1809,7 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	disk->first_minor = index << part_shift;
 	if (disk->first_minor > 0xff) {
 		err = -EINVAL;
-		goto out_free_idr;
+		goto out_err_disk;
 	}
 
 	disk->minors = 1 << part_shift;
-- 
2.31.1

