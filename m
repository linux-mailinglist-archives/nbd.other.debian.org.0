Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE72D75E
	for <lists+nbd@lfdr.de>; Wed, 29 May 2019 10:09:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E65782054A; Wed, 29 May 2019 08:09:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 08:09:56 2019
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=4.0 tests=DIGITS_LETTERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C3BDB20319
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2019 08:09:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lg4Dyd6XULBD for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2019 08:09:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6B2F3202BB
	for <nbd@other.debian.org>; Wed, 29 May 2019 08:09:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE34A3087958;
	Wed, 29 May 2019 08:09:41 +0000 (UTC)
Received: from rhel3.localdomain (ovpn-12-18.pek2.redhat.com [10.72.12.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A22C36148C;
	Wed, 29 May 2019 08:09:38 +0000 (UTC)
From: xiubli@redhat.com
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	nbd@other.debian.org
Cc: mchristi@redhat.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	atumball@redhat.com,
	Xiubo Li <xiubli@redhat.com>
Subject: [RFC PATCH] nbd: set the default nbds_max to 0
Date: Wed, 29 May 2019 16:08:36 +0800
Message-Id: <20190529080836.13031-1-xiubli@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 29 May 2019 08:09:42 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <H2JQIY3yYeE.A.cBC.U5j7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/546
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190529080836.13031-1-xiubli@redhat.com
Resent-Date: Wed, 29 May 2019 08:09:56 +0000 (UTC)

From: Xiubo Li <xiubli@redhat.com>

There is one problem that when trying to check the nbd device
NBD_CMD_STATUS and at the same time insert the nbd.ko module,
we can randomly get some of the 16 /dev/nbd{0~15} are connected,
but they are not. This is because that the udev service in user
space will try to open /dev/nbd{0~15} devices to do some sanity
check when they are added in "__init nbd_init()" and then close
it asynchronousely.

Signed-off-by: Xiubo Li <xiubli@redhat.com>
---

Not sure whether this patch make sense here, coz this issue can be
avoided by setting the "nbds_max=0" when inserting the nbd.ko modules.



 drivers/block/nbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 4c1de1c..98be6ca 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -137,7 +137,7 @@ struct nbd_cmd {
 
 #define NBD_DEF_BLKSIZE 1024
 
-static unsigned int nbds_max = 16;
+static unsigned int nbds_max;
 static int max_part = 16;
 static struct workqueue_struct *recv_workqueue;
 static int part_shift;
@@ -2310,6 +2310,6 @@ static void __exit nbd_cleanup(void)
 MODULE_LICENSE("GPL");
 
 module_param(nbds_max, int, 0444);
-MODULE_PARM_DESC(nbds_max, "number of network block devices to initialize (default: 16)");
+MODULE_PARM_DESC(nbds_max, "number of network block devices to initialize (default: 0)");
 module_param(max_part, int, 0444);
 MODULE_PARM_DESC(max_part, "number of partitions per device (default: 16)");
-- 
1.8.3.1

