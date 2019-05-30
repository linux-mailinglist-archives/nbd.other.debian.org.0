Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9C02F81E
	for <lists+nbd@lfdr.de>; Thu, 30 May 2019 09:54:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A985D20461; Thu, 30 May 2019 07:54:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 30 07:54:18 2019
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CAA2420463
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 May 2019 07:54:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LIzu8M21j0cG for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 May 2019 07:54:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 519A62043F
	for <nbd@other.debian.org>; Thu, 30 May 2019 07:54:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07D0730001DD;
	Thu, 30 May 2019 07:53:58 +0000 (UTC)
Received: from rhel3.localdomain (ovpn-12-96.pek2.redhat.com [10.72.12.96])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 378E75DD74;
	Thu, 30 May 2019 07:53:52 +0000 (UTC)
From: xiubli@redhat.com
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	nbd@other.debian.org
Cc: mchristi@redhat.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	atumball@redhat.com,
	Xiubo Li <xiubli@redhat.com>
Subject: [PATCH] nbd: no need to check all the connections one by one if all are dead
Date: Thu, 30 May 2019 15:53:25 +0800
Message-Id: <20190530075325.123109-1-xiubli@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 30 May 2019 07:53:58 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bP343mksF0M.A.meE.qw47cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/555
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190530075325.123109-1-xiubli@redhat.com
Resent-Date: Thu, 30 May 2019 07:54:18 +0000 (UTC)

From: Xiubo Li <xiubli@redhat.com>

If all connections are dead the live_connections should be already
set to 0. And set the nsock->fallback to -1 again if all connections
are dead.

Signed-off-by: Xiubo Li <xiubli@redhat.com>
---
 drivers/block/nbd.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 98be6ca..6da42aa 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -783,13 +783,16 @@ static int find_fallback(struct nbd_device *nbd, int index)
 		return new_index;
 	}
 
+	if (atomic_read(&config->live_connections) <= 0) {
+		dev_err_ratelimited(disk_to_dev(nbd->disk),
+				    "Dead connection, failed to find a fallback\n");
+		goto out;
+	}
+
 	if (fallback >= 0 && fallback < config->num_connections &&
-	    !config->socks[fallback]->dead)
+		!config->socks[fallback]->dead) {
 		return fallback;
-
-	if (nsock->fallback_index < 0 ||
-	    nsock->fallback_index >= config->num_connections ||
-	    config->socks[nsock->fallback_index]->dead) {
+	} else {
 		int i;
 		for (i = 0; i < config->num_connections; i++) {
 			if (i == index)
@@ -799,14 +802,10 @@ static int find_fallback(struct nbd_device *nbd, int index)
 				break;
 			}
 		}
-		nsock->fallback_index = new_index;
-		if (new_index < 0) {
-			dev_err_ratelimited(disk_to_dev(nbd->disk),
-					    "Dead connection, failed to find a fallback\n");
-			return new_index;
-		}
 	}
-	new_index = nsock->fallback_index;
+
+out:
+	nsock->fallback_index = new_index;
 	return new_index;
 }
 
-- 
1.8.3.1

