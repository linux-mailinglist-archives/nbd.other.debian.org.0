Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F6237BC12
	for <lists+nbd@lfdr.de>; Wed, 12 May 2021 13:54:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 765B42035E; Wed, 12 May 2021 11:54:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 12 11:54:09 2021
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D0A9F20368
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 May 2021 11:36:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.178 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YQ1WZhJgHmKV for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 May 2021 11:36:12 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 74A172034E
	for <nbd@other.debian.org>; Wed, 12 May 2021 11:36:12 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FgCNd5qHHzmVcB;
	Wed, 12 May 2021 19:33:53 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Wed, 12 May 2021
 19:35:58 +0800
From: Sun Ke <sunke32@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <Markus.Elfring@web.de>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <sunke32@huawei.com>
Subject: [PATCH 0/2] fix a NULL pointer bug and simplify the code
Date: Wed, 12 May 2021 19:43:29 +0800
Message-ID: <20210512114331.1233964-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <84cc9FvroLB.A._7F.hH8mgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1154
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210512114331.1233964-1-sunke32@huawei.com
Resent-Date: Wed, 12 May 2021 11:54:09 +0000 (UTC)

fix a NULL pointer bug and simplify the code

They should have been applied for 5.12, something was wrong.
So, send them again. 

Sun Ke (2):
  nbd: Fix NULL pointer in flush_workqueue
  nbd: share nbd_put and return by goto put_nbd

 drivers/block/nbd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.4

