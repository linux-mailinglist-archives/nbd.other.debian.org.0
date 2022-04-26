Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBA150FF07
	for <lists+nbd@lfdr.de>; Tue, 26 Apr 2022 15:28:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3209B203D3; Tue, 26 Apr 2022 13:28:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 26 13:28:13 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3B29820342
	for <lists-other-nbd@bendel.debian.org>; Tue, 26 Apr 2022 13:11:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.29 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7Bb5cMKgCPA1 for <lists-other-nbd@bendel.debian.org>;
	Tue, 26 Apr 2022 13:11:31 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6A948203C7
	for <nbd@other.debian.org>; Tue, 26 Apr 2022 13:11:31 +0000 (UTC)
Received: from kwepemi500017.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Knhd736g3zhYpY;
	Tue, 26 Apr 2022 20:53:15 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 kwepemi500017.china.huawei.com (7.221.188.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 20:53:32 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600009.china.huawei.com
 (7.193.23.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 26 Apr
 2022 20:53:31 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH -next 0/6] nbd: bugfix and cleanup patches
Date: Tue, 26 Apr 2022 21:07:40 +0800
Message-ID: <20220426130746.885140-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SFb5mgaG5UI.A.elE.tN_ZiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2054
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220426130746.885140-1-yukuai3@huawei.com
Resent-Date: Tue, 26 Apr 2022 13:28:13 +0000 (UTC)

path 1-2 fix races between nbd setup and module removal.
patch 3 fix io can't be completed in some error path.
patch 4 fix io hung when disconnecting failed.
patch 5 fix sysfs warning about duplicate creation.
patch 6 use pr_err to output error message.

Yu Kuai (5):
  nbd: call genl_unregister_family() first in nbd_cleanup()
  nbd: fix race between nbd_alloc_config() and module removal
  nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
  nbd: fix io hung while disconnecting device
  nbd: use pr_err to output error message

Zhang Wensheng (1):
  nbd: fix possible overflow on 'first_minor' in nbd_dev_add()

 drivers/block/nbd.c | 119 +++++++++++++++++++++++++++-----------------
 1 file changed, 74 insertions(+), 45 deletions(-)

-- 
2.31.1

