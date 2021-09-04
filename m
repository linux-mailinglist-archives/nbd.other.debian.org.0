Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5F400B56
	for <lists+nbd@lfdr.de>; Sat,  4 Sep 2021 14:30:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 497BF20D89; Sat,  4 Sep 2021 12:30:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Sep  4 12:30:33 2021
Old-Return-Path: <houtao1@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B2BFA20D39
	for <lists-other-nbd@bendel.debian.org>; Sat,  4 Sep 2021 12:12:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.281 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id zDvhW7B4y4_N for <lists-other-nbd@bendel.debian.org>;
	Sat,  4 Sep 2021 12:12:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 848F220453
	for <nbd@other.debian.org>; Sat,  4 Sep 2021 12:12:40 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H1tnJ1R4BzWrHT;
	Sat,  4 Sep 2021 20:11:48 +0800 (CST)
Received: from dggpeml500025.china.huawei.com (7.185.36.35) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 4 Sep 2021 20:12:34 +0800
Received: from huawei.com (10.175.124.27) by dggpeml500025.china.huawei.com
 (7.185.36.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 4 Sep 2021
 20:12:34 +0800
From: Hou Tao <houtao1@huawei.com>
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>
CC: <nbd@other.debian.org>, <hch@lst.de>, <houtao1@huawei.com>
Subject: [PATCH v2 0/3] fix races between nbd setup and module removal
Date: Sat, 4 Sep 2021 20:25:16 +0800
Message-ID: <20210904122519.1963983-1-houtao1@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8GAcRYR57yM.A.3aD.pb2MhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1376
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210904122519.1963983-1-houtao1@huawei.com
Resent-Date: Sat,  4 Sep 2021 12:30:33 +0000 (UTC)

Hi,

The patch series aims to fix the races between nbd setup and module
removal which may lead to oops. Patch #1 is just replacing
printk(KERN_ERR "nbd: ...") by pr_err("...") which makes it easier
to add error message in patch #3. Patch #2 serializes the concurrently
calling of nbd_genl_connect() and nbd_cleanup(), and patch #3 fixes race
between nbd_alloc_config() and nbd_cleanup().

Any comments are welcome.

Regards,
Tao

ChangeLog:
v2:
  * add a new patch "use pr_err to output error message"
  * add the missing error message in patch 3.

v1: https://www.spinics.net/lists/linux-block/msg72995.html

Hou Tao (3):
  nbd: use pr_err to output error message
  nbd: call genl_unregister_family() first in nbd_cleanup()
  nbd: fix race between nbd_alloc_config() and module removal

 drivers/block/nbd.c | 70 ++++++++++++++++++++++++++++-----------------
 1 file changed, 44 insertions(+), 26 deletions(-)

-- 
2.29.2

