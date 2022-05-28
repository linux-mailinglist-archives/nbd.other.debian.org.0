Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 85306536A27
	for <lists+nbd@lfdr.de>; Sat, 28 May 2022 04:16:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 614912065D; Sat, 28 May 2022 02:16:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 28 02:16:06 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5340A205F0
	for <lists-other-nbd@bendel.debian.org>; Sat, 28 May 2022 01:59:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.29 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HkH6_QL7mdE4 for <lists-other-nbd@bendel.debian.org>;
	Sat, 28 May 2022 01:59:14 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga08-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 52D7520620
	for <nbd@other.debian.org>; Sat, 28 May 2022 01:59:12 +0000 (UTC)
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4L94Yl6WH3z1JCBP;
	Sat, 28 May 2022 09:57:31 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 kwepemi500024.china.huawei.com (7.221.188.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 28 May 2022 09:59:05 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600009.china.huawei.com
 (7.193.23.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 28 May
 2022 09:59:04 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <ming.lei@redhat.com>,
	<yukuai3@huawei.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
Subject: [PATCH -next v4 0/6] nbd: bugfix and cleanup patches
Date: Sat, 28 May 2022 10:12:29 +0800
Message-ID: <20220528021235.2120995-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3a34ToOKN1O.A.-vE.mXYkiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2107
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220528021235.2120995-1-yukuai3@huawei.com
Resent-Date: Sat, 28 May 2022 02:16:06 +0000 (UTC)

Changes in v4
 - in patch 3, return from nbd_handle_reply() with flag cleared if
 request is ready to complete.
 - add reviewed-by tag for patch 1-2, 4-6.
Changes in v3:
 - rewrap to 80 columns where possible in patch 6
Changes in v2:
 - in patch 3, instead of clear and then reset the flag if rq is not
 completed, test first and clear if rq is going to complete.

path 1-2 fix races between nbd setup and module removal.
patch 3 fix io can't be completed in some error path.
patch 4 fix io hung when disconnecting failed.
patch 5 fix sysfs warning about duplicate creation.
patch 6 use pr_err to output error message.

Previous versions:
v1: https://lore.kernel.org/all/20220426130746.885140-1-yukuai3@huawei.com/
v2: https://lore.kernel.org/all/20220518122618.1702997-1-yukuai3@huawei.com/
v3: https://lore.kernel.org/all/20220521073749.3146892-1-yukuai3@huawei.com/

Yu Kuai (5):
  nbd: call genl_unregister_family() first in nbd_cleanup()
  nbd: fix race between nbd_alloc_config() and module removal
  nbd: don't clear 'NBD_CMD_INFLIGHT' flag if request is not completed
  nbd: fix io hung while disconnecting device
  nbd: use pr_err to output error message

Zhang Wensheng (1):
  nbd: fix possible overflow on 'first_minor' in nbd_dev_add()

 drivers/block/nbd.c | 109 +++++++++++++++++++++++++-------------------
 1 file changed, 63 insertions(+), 46 deletions(-)

-- 
2.31.1

