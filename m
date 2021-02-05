Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BC331058E
	for <lists+nbd@lfdr.de>; Fri,  5 Feb 2021 08:12:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3B3CF20517; Fri,  5 Feb 2021 07:12:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb  5 07:12:20 2021
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 72268207BA
	for <lists-other-nbd@bendel.debian.org>; Fri,  5 Feb 2021 06:56:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.178 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4oNeGanIc1oj for <lists-other-nbd@bendel.debian.org>;
	Fri,  5 Feb 2021 06:55:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 59580207B0
	for <nbd@other.debian.org>; Fri,  5 Feb 2021 06:55:56 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DX5k92kpVzlGnx;
	Fri,  5 Feb 2021 14:54:09 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.498.0; Fri, 5 Feb 2021
 14:55:40 +0800
From: Sun Ke <sunke32@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <Markus.Elfring@web.de>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <sunke32@huawei.com>
Subject: [PATCH v5 0/2] fix a NULL pointer bug and simplify the code
Date: Fri, 5 Feb 2021 01:56:48 -0500
Message-ID: <20210205065650.2357457-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Od5g8daEjvL.A.nCG.U_OHgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1124
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210205065650.2357457-1-sunke32@huawei.com
Resent-Date: Fri,  5 Feb 2021 07:12:20 +0000 (UTC)

v5: Adjust the title and add “Suggested-by”.
v4: Share exception handling code for if branches and 
	move put_nbd adjustment to a separate patch.
v3: Do not use unlock and add put_nbd.
v2: Use jump target unlock.

Sun Ke (2):
  nbd: Fix NULL pointer in flush_workqueue
  nbd: share nbd_put and return by goto put_nbd

 drivers/block/nbd.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

-- 
2.25.4

