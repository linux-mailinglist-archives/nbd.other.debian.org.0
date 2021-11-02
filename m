Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 936AB44255D
	for <lists+nbd@lfdr.de>; Tue,  2 Nov 2021 02:57:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7B2CA2041D; Tue,  2 Nov 2021 01:57:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  2 01:57:21 2021
Old-Return-Path: <yebin10@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8A51520411
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Nov 2021 01:40:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.281 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XOkwOW8nh2kd for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Nov 2021 01:39:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AD7C9203EC
	for <nbd@other.debian.org>; Tue,  2 Nov 2021 01:39:56 +0000 (UTC)
Received: from dggeme754-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HjssS0jHYzbhVn;
	Tue,  2 Nov 2021 09:35:08 +0800 (CST)
Received: from huawei.com (10.175.127.227) by dggeme754-chm.china.huawei.com
 (10.3.19.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.15; Tue, 2
 Nov 2021 09:39:50 +0800
From: Ye Bin <yebin10@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>
CC: <linux-kernel@vger.kernel.org>, Ye Bin <yebin10@huawei.com>
Subject: [PATCH -next v4 0/4] Fix hungtask when nbd_config_put and sanity check for first_minor
Date: Tue, 2 Nov 2021 09:52:33 +0800
Message-ID: <20211102015237.2309763-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.31.1
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
Resent-Message-ID: <8tMndKD-ZlO.A.zCE.BsJghB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1601
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211102015237.2309763-1-yebin10@huawei.com
Resent-Date: Tue,  2 Nov 2021 01:57:21 +0000 (UTC)

This patchset include two patchsets as follows:
1. Fix hungtask when nbd_config_put
https://patchwork.kernel.org/project/linux-block/list/?series=573381
2. nbd: fix sanity check for first_minor
https://lore.kernel.org/linux-block/20211021122936.758221-1-yukuai3@huawei.com/

I have consulted with Yu Kuai, and his modification has also been confirmed by him.

Ye Bin (2):
  nbd: Fix incorrect error handle when first_minor is illegal in
    nbd_dev_add
  nbd: Fix hungtask when nbd_config_put

Yu Kuai (2):
  nbd: fix max value for 'first_minor'
  nbd: fix possible overflow for 'first_minor' in nbd_dev_add()

 drivers/block/nbd.c | 42 +++++++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

-- 
2.31.1

