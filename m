Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 782843BBA82
	for <lists+nbd@lfdr.de>; Mon,  5 Jul 2021 11:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5BA9520220; Mon,  5 Jul 2021 09:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul  5 09:51:10 2021
Old-Return-Path: <wangqing@vivo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=4.0 tests=DIGITS_LETTERS,DKIM_INVALID,
	DKIM_SIGNED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	TO_TOO_MANY autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D797720205
	for <lists-other-nbd@bendel.debian.org>; Mon,  5 Jul 2021 09:34:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.219 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_INVALID=0.1,
	DKIM_SIGNED=0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VRUOxrYeVAtI for <lists-other-nbd@bendel.debian.org>;
	Mon,  5 Jul 2021 09:34:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
X-Greylist: delayed 473 seconds by postgrey-1.36 at bendel; Mon, 05 Jul 2021 09:34:05 UTC
Received: from mail-m17639.qiye.163.com (mail-m17639.qiye.163.com [59.111.176.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 60EBE201E0
	for <nbd@other.debian.org>; Mon,  5 Jul 2021 09:34:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
	b=Z6H+7hA3o20CEwBP/O/hdFZVeJf50Q6E569FxTNQqZh9Rev+kxHRD9/hWIbZG2rD27Mv6TD24+VdKEeJ1xHVfLVStFIW/kVVlaog6F9kpfUsg38z2Ig/dzxhO9pNuETywyZHe7B4ADeR2x8ekraIu85mA++djy667Wh9MZXKKak=;
	s=default; c=relaxed/relaxed; d=vivo.com; v=1;
	bh=AiGdhOxKK5jbqL2QYbvZgZZtHQzK5itW0Kp8ooht490=;
	h=date:mime-version:subject:message-id:from;
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.232])
	by mail-m17639.qiye.163.com (Hmail) with ESMTPA id AB2DE380510;
	Mon,  5 Jul 2021 17:26:01 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Cc: Wang Qing <wangqing@vivo.com>,
	Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Subject: [PATCH] block: nbd: fix order of cleaning up the queue and freeing the tagset
Date: Mon,  5 Jul 2021 17:25:43 +0800
Message-Id: <1625477143-18716-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
	oVCBIfWUFZQkgaGVZNGB8fS0xCT0NOQktVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
	hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ohg6Lgw5Fj9OHBkrKAoDDhUW
	ExwKFBNVSlVKTUlOT0xMSk1JSE9IVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
	SU5KVUxPVUlISVlXWQgBWUFKQ0lLNwY+
X-HM-Tid: 0a7a75fd23ebd994kuwsab2de380510
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <73gXzsD1L0D.A.0-F.OYt4gB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1217
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1625477143-18716-1-git-send-email-wangqing@vivo.com
Resent-Date: Mon,  5 Jul 2021 09:51:10 +0000 (UTC)

Must release the queue before freeing the tagset.

Fixes: 1c99502fae35 ("loop: use blk_mq_alloc_disk and blk_cleanup_disk")
Reported-and-tested-by: syzbot+9ca43ff47167c0ee3466@syzkaller.appspotmail.com
Signed-off-by: Wang Qing <wangqing@vivo.com>
Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b7d6637..c383179
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -239,8 +239,8 @@ static void nbd_dev_remove(struct nbd_device *nbd)
 
 	if (disk) {
 		del_gendisk(disk);
-		blk_mq_free_tag_set(&nbd->tag_set);
 		blk_cleanup_disk(disk);
+		blk_mq_free_tag_set(&nbd->tag_set);
 	}
 
 	/*
-- 
2.7.4

