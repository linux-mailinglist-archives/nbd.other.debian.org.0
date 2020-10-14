Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A78128D8F2
	for <lists+nbd@lfdr.de>; Wed, 14 Oct 2020 05:18:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6B78420834; Wed, 14 Oct 2020 03:18:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 14 03:18:28 2020
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3056220830
	for <lists-other-nbd@bendel.debian.org>; Wed, 14 Oct 2020 03:18:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.378 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.2,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id X6kOwGTEgvoC for <lists-other-nbd@bendel.debian.org>;
	Wed, 14 Oct 2020 03:18:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 59CD020834
	for <nbd@other.debian.org>; Wed, 14 Oct 2020 03:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602645490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=EHiTeL5M4ChyyQvTM24QJ3ZdvVQg+RJ4DomUC+fe9jU=;
	b=Ok4Ifvu8Dtmzmf78VF5lalC7IOlJLpPYIeWOE0NGrRvwVxvgviGo3IacRolSl0ojcfmiW7
	OHlSSI7MHi+i52siTlEsrbrpqrYpcjVWMHv3ZnxazIv2DiZM/SeC61JQsEwzxWXaseYsGV
	gBO8ZiukUdG2605/4f42aV7BZvADdFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-yETc-PgbNcqyr3qPfzFppA-1; Tue, 13 Oct 2020 22:46:19 -0400
X-MC-Unique: yETc-PgbNcqyr3qPfzFppA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4148218C35A8;
	Wed, 14 Oct 2020 02:46:17 +0000 (UTC)
Received: from lxbceph1.gsslab.pek2.redhat.com (vm37-120.gsslab.pek2.redhat.com [10.72.37.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 676C760C07;
	Wed, 14 Oct 2020 02:46:15 +0000 (UTC)
From: xiubli@redhat.com
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Xiubo Li <xiubli@redhat.com>
Subject: [PATCH] nbd: make the config put is called before the notifying the waiter
Date: Tue, 13 Oct 2020 22:45:14 -0400
Message-Id: <20201014024514.112822-1-xiubli@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kn4lX2Ie1IF.A.ep.E4mhfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1014
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201014024514.112822-1-xiubli@redhat.com
Resent-Date: Wed, 14 Oct 2020 03:18:28 +0000 (UTC)

From: Xiubo Li <xiubli@redhat.com>

There has one race case for ceph's rbd-nbd tool. When do mapping
it may fail with EBUSY from ioctl(nbd, NBD_DO_IT), but actually
the nbd device has already unmaped.

It dues to if just after the wake_up(), the recv_work() is scheduled
out and defers calling the nbd_config_put(), though the map process
has exited the "nbd->recv_task" is not cleared.

Signed-off-by: Xiubo Li <xiubli@redhat.com>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index edf8b632e3d2..f46e26c9d9b3 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -801,9 +801,9 @@ static void recv_work(struct work_struct *work)
 		if (likely(!blk_should_fake_timeout(rq->q)))
 			blk_mq_complete_request(rq);
 	}
+	nbd_config_put(nbd);
 	atomic_dec(&config->recv_threads);
 	wake_up(&config->recv_wq);
-	nbd_config_put(nbd);
 	kfree(args);
 }
 
-- 
2.18.4

