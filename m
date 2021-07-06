Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 646F83BC571
	for <lists+nbd@lfdr.de>; Tue,  6 Jul 2021 06:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4F0EF2041A; Tue,  6 Jul 2021 04:27:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul  6 04:27:10 2021
Old-Return-Path: <guoqing.jiang@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 38B4120415
	for <lists-other-nbd@bendel.debian.org>; Tue,  6 Jul 2021 04:09:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ua3Z8y24jx9L for <lists-other-nbd@bendel.debian.org>;
	Tue,  6 Jul 2021 04:09:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 480 seconds by postgrey-1.36 at bendel; Tue, 06 Jul 2021 04:09:18 UTC
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3C03120414
	for <nbd@other.debian.org>; Tue,  6 Jul 2021 04:09:18 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1625544051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZoKs/OhR46IWQP8VjL/YQEhdZZw2ZLWUoBMJggDRK3c=;
	b=UW0Nz+EU8l/VxKP/zB03WheGmRgd2Tzf8F5QbZGuHqgdoKjP+qBoKr7t7FY625gSSWt0CP
	zNDjXWuLRw/MaO2SPBzgUJtUcNyhN6AVOzxWfXyL67ukUVK9kvW73Tiz9BPZTIbI3QVuUI
	iDea9Ks+OGovtKz8rRbo5xfITZj636A=
From: Guoqing Jiang <guoqing.jiang@linux.dev>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	hch@lst.de,
	chaitanya.kulkarni@wdc.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH V2] nbd: fix order of cleaning up the queue and freeing the tagset
Date: Tue,  6 Jul 2021 12:00:16 +0800
Message-Id: <20210706040016.1360412-1-guoqing.jiang@linux.dev>
In-Reply-To: <1625477143-18716-1-git-send-email-wangqing@vivo.com>
References: <1625477143-18716-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: guoqing.jiang@linux.dev
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WRg5qeqx0eK.A.7v.eu94gB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1219
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210706040016.1360412-1-guoqing.jiang@linux.dev
Resent-Date: Tue,  6 Jul 2021 04:27:10 +0000 (UTC)

From: Wang Qing <wangqing@vivo.com>

We must release the queue before freeing the tagset.

Fixes: 4af5f2e03013 ("nbd: use blk_mq_alloc_disk and blk_cleanup_disk")
Reported-and-tested-by: syzbot+9ca43ff47167c0ee3466@syzkaller.appspotmail.com
Signed-off-by: Wang Qing <wangqing@vivo.com>
Signed-off-by: Guoqing Jiang <jiangguoqing@kylinos.cn>
---
V2 changes: Correct the fixes tag and mail address.

 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b7d663736d35..c38317979f74 100644
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
2.25.1

