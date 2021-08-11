Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 865F13E9223
	for <lists+nbd@lfdr.de>; Wed, 11 Aug 2021 15:03:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 55F6320346; Wed, 11 Aug 2021 13:03:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 11 13:03:43 2021
Old-Return-Path: <BATV+fa63ca7dd370ca608068+6562+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3E65C20313
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Aug 2021 12:47:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bW3ss3sWsMdp for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Aug 2021 12:47:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 96BFF2030F
	for <nbd@other.debian.org>; Wed, 11 Aug 2021 12:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=vQt95oM61eET5+kiBSYsNWnQOETYhTTnfEu/uTorkMY=; b=OvHqIM0gRAzf74CsVeifrGLaHS
	+JvjgT3giFqrlh2AP24d5zhFC53a3r5RqOQkGQAaJMFxwsDB8+y+YzorbtGAa0BkPWPrThfaJWdBg
	Zw0wvh5fP9/0F726kuQMgYhzdI9LtF6MhI6AK/19eFvu2wYa+enlKiHBpfuSlNhL72JpIeiHCfAxk
	bV53up7LDi+cMqe4StCq3YTpa7VbaXDtzeD9FFTw/6zeNeGNJiqNiH2QQjMtNF8RzIX7fVgCcR+tj
	5YSSQJOhupBIVU8O3s86gx1V8KPro/6Cc7PC4wOjlqkofs4n0ZfPXhduiucCjQEA0NB7mcSOXwzBL
	rdm/OgZw==;
Received: from [2001:4bb8:184:6215:7ee3:d0e9:131a:82ff] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDncc-00DPlf-7z; Wed, 11 Aug 2021 12:46:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Tao <houtao1@huawei.com>
Subject: [PATCH 2/6] nbd: refactor device removal
Date: Wed, 11 Aug 2021 14:44:24 +0200
Message-Id: <20210811124428.2368491-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811124428.2368491-1-hch@lst.de>
References: <20210811124428.2368491-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <G6_rHmsEO8C.A.-DF.vq8EhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1266
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210811124428.2368491-3-hch@lst.de
Resent-Date: Wed, 11 Aug 2021 13:03:43 +0000 (UTC)

Share common code for the synchronous and workqueue based device removal,
and remove the pointless use of refcount_dec_and_mutex_lock.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 9a7c9a425ab0..6caf26b84a5b 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -259,48 +259,37 @@ static void nbd_notify_destroy_completion(struct nbd_device *nbd)
 		complete(nbd->destroy_complete);
 }
 
-static void nbd_dev_remove_work(struct work_struct *work)
+static void nbd_dev_remove(struct nbd_device *nbd)
 {
-	struct nbd_device *nbd =
-		container_of(work, struct nbd_device, remove_work);
-
 	nbd_del_disk(nbd);
 
-	mutex_lock(&nbd_index_mutex);
 	/*
-	 * Remove from idr after del_gendisk() completes,
-	 * so if the same id is reused, the following
-	 * add_disk() will succeed.
+	 * Remove from idr after del_gendisk() completes, so if the same ID is
+	 * reused, the following add_disk() will succeed.
 	 */
+	mutex_lock(&nbd_index_mutex);
 	idr_remove(&nbd_index_idr, nbd->index);
-
 	nbd_notify_destroy_completion(nbd);
 	mutex_unlock(&nbd_index_mutex);
 
 	kfree(nbd);
 }
 
-static void nbd_dev_remove(struct nbd_device *nbd)
+static void nbd_dev_remove_work(struct work_struct *work)
 {
-	/* Call del_gendisk() asynchrounously to prevent deadlock */
-	if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags)) {
-		queue_work(nbd_del_wq, &nbd->remove_work);
-		return;
-	}
-
-	nbd_del_disk(nbd);
-	idr_remove(&nbd_index_idr, nbd->index);
-	nbd_notify_destroy_completion(nbd);
-	kfree(nbd);
+	nbd_dev_remove(container_of(work, struct nbd_device, remove_work));
 }
 
 static void nbd_put(struct nbd_device *nbd)
 {
-	if (refcount_dec_and_mutex_lock(&nbd->refs,
-					&nbd_index_mutex)) {
+	if (!refcount_dec_and_test(&nbd->refs))
+		return;
+
+	/* Call del_gendisk() asynchrounously to prevent deadlock */
+	if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags))
+		queue_work(nbd_del_wq, &nbd->remove_work);
+	else
 		nbd_dev_remove(nbd);
-		mutex_unlock(&nbd_index_mutex);
-	}
 }
 
 static int nbd_disconnected(struct nbd_config *config)
-- 
2.30.2

