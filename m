Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1C13E3E30
	for <lists+nbd@lfdr.de>; Mon,  9 Aug 2021 05:15:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BDC31203C4; Mon,  9 Aug 2021 03:15:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug  9 03:15:09 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E8E1C203C4
	for <lists-other-nbd@bendel.debian.org>; Mon,  9 Aug 2021 02:58:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.281 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vgQJzg6JJgOJ for <lists-other-nbd@bendel.debian.org>;
	Mon,  9 Aug 2021 02:58:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3C1C0203C1
	for <nbd@other.debian.org>; Mon,  9 Aug 2021 02:58:49 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Gjgfz2dd7zcmGX;
	Mon,  9 Aug 2021 10:55:07 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 9 Aug 2021 10:58:44 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 9 Aug
 2021 10:58:44 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <axboe@kernel.dk>, <josef@toxicpanda.com>, <bvanassche@acm.org>,
	<ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH v2 0/2] fix request uaf in nbd_read_stat()
Date: Mon, 9 Aug 2021 11:09:25 +0800
Message-ID: <20210809030927.1946162-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <og3PlNUM7XL.A.1TG.92JEhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1252
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210809030927.1946162-1-yukuai3@huawei.com
Resent-Date: Mon,  9 Aug 2021 03:15:09 +0000 (UTC)

This patchset fix request uaf in nbd, other drivers might have the
same problem. Will fix them later if this patchset is accepted.

Changes in v2:
 - as Bart suggested, add a new helper function for drivers to get
 request by tag.

Yu Kuai (2):
  blk-mq: add a new interface to get request by tag
  nbd: convert to use blk_mq_get_rq_by_tag()

 block/blk-mq-tag.c     | 33 +++++++++++++++++++++++++++++++++
 block/blk-mq.c         |  1 +
 block/blk-mq.h         |  1 -
 drivers/block/nbd.c    | 11 ++++++-----
 include/linux/blk-mq.h |  3 +++
 5 files changed, 43 insertions(+), 6 deletions(-)

-- 
2.31.1

