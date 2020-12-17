Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E81E42DCE10
	for <lists+nbd@lfdr.de>; Thu, 17 Dec 2020 10:07:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C633A2086E; Thu, 17 Dec 2020 09:07:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 17 09:07:17 2020
Old-Return-Path: <josh@joshtriplett.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=4.0 tests=DIGITS_LETTERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_RP_RNBL,
	SARE_MSGID_LONG40 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1196E209B6
	for <lists-other-nbd@bendel.debian.org>; Thu, 17 Dec 2020 09:07:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.033 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_RP_RNBL=1.31, SARE_MSGID_LONG40=0.637]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jxpdVybZyYme for <lists-other-nbd@bendel.debian.org>;
	Thu, 17 Dec 2020 09:07:05 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .joshtriplett. - helo: .mslow2.mail.gandi. - helo-domain: .gandi.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A3649209B1
	for <nbd@other.debian.org>; Thu, 17 Dec 2020 09:07:05 +0000 (UTC)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
	by mslow2.mail.gandi.net (Postfix) with ESMTP id C75433B5633
	for <nbd@other.debian.org>; Thu, 17 Dec 2020 08:59:15 +0000 (UTC)
Received: from localhost (50-39-163-217.bvtn.or.frontiernet.net [50.39.163.217])
	(Authenticated sender: josh@joshtriplett.org)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7B417240010;
	Thu, 17 Dec 2020 08:58:49 +0000 (UTC)
Date: Thu, 17 Dec 2020 00:58:47 -0800
From: Josh Triplett <josh@joshtriplett.org>
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nbd: Respect max_part for all partition scans
Message-ID: <86d03378210ddac44eb07ebb78c9b0f32c56fe96.1608195087.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gZ5s_xJKZ5B.A.OfF.F_x2fB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1101
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/86d03378210ddac44eb07ebb78c9b0f32c56fe96.1608195087.git.josh@joshtriplett.org
Resent-Date: Thu, 17 Dec 2020 09:07:17 +0000 (UTC)

The creation path of the NBD device respects max_part and only scans for
partitions if max_part is not 0. However, some other code paths ignore
max_part, and unconditionally scan for partitions. Add a check for
max_part on each partition scan.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---

Caught this when reading recent NBD patches, which tweaked the
nbd_set_size path.

It doesn't seem worth factoring these two lines into a function,
especially since the callers obtain the disk structure in different
ways.

 drivers/block/nbd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 92f84ed0ba9e..6727358e147d 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -318,7 +318,8 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 	blk_queue_logical_block_size(nbd->disk->queue, blksize);
 	blk_queue_physical_block_size(nbd->disk->queue, blksize);
 
-	set_bit(GD_NEED_PART_SCAN, &nbd->disk->state);
+	if (max_part)
+		set_bit(GD_NEED_PART_SCAN, &nbd->disk->state);
 	if (!set_capacity_and_notify(nbd->disk, bytesize >> 9))
 		kobject_uevent(&nbd_to_dev(nbd)->kobj, KOBJ_CHANGE);
 	return 0;
@@ -1476,9 +1477,11 @@ static int nbd_open(struct block_device *bdev, fmode_t mode)
 		refcount_set(&nbd->config_refs, 1);
 		refcount_inc(&nbd->refs);
 		mutex_unlock(&nbd->config_lock);
-		set_bit(GD_NEED_PART_SCAN, &bdev->bd_disk->state);
+		if (max_part)
+			set_bit(GD_NEED_PART_SCAN, &bdev->bd_disk->state);
 	} else if (nbd_disconnected(nbd->config)) {
-		set_bit(GD_NEED_PART_SCAN, &bdev->bd_disk->state);
+		if (max_part)
+			set_bit(GD_NEED_PART_SCAN, &bdev->bd_disk->state);
 	}
 out:
 	mutex_unlock(&nbd_index_mutex);
-- 
2.29.2

