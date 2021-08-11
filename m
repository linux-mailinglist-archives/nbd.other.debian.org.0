Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADEC3E9241
	for <lists+nbd@lfdr.de>; Wed, 11 Aug 2021 15:09:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 20E3520339; Wed, 11 Aug 2021 13:09:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 11 13:09:20 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 02A0F20181
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Aug 2021 12:52:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Mv5heZaG2BEY for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Aug 2021 12:52:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4573620304
	for <nbd@other.debian.org>; Wed, 11 Aug 2021 12:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=n0dB52Aydkl+RoqMFSS9U7kndtUkJfdL8iYMrIjWdtI=; b=N05l9onf+bOe7sJhBVqbZM0Jrz
	RQoy13CasuMiH1Reg/xqTfIFz45BVPX2dQhLRIMpaglglght6CV1PdPE+dY9iNO59uYH0IVghkyIc
	K+SASb6ULSE6TmNiVcPNjMW789xZ35qbcmw5nXD+oedYx4jrPWOOdAjeDGZxVAzEwenc9OKZziHvD
	mUddRdW6mIDepp1elyA/nlZ+oxbsfqNwzsxrgJZcWPLVIo0MFxMASFWhPudsTRt00X2k3c2HEOJYm
	G6YK5NERtthDhvPOAfBfuqxsKbbpF9r+xuwJRIPhPENY3uvaL8S+sRdWnw/A9SrKmKZBlz1Ufbsz8
	wzNzVRzw==;
Received: from [2001:4bb8:184:6215:7ee3:d0e9:131a:82ff] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDnhZ-00DQLa-OL; Wed, 11 Aug 2021 12:51:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Tao <houtao1@huawei.com>
Subject: [PATCH 6/6] nbd: reduce the nbd_index_mutex scope
Date: Wed, 11 Aug 2021 14:44:28 +0200
Message-Id: <20210811124428.2368491-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811124428.2368491-1-hch@lst.de>
References: <20210811124428.2368491-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <l7S2jwPrElE.A.Y3F.Aw8EhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1270
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210811124428.2368491-7-hch@lst.de
Resent-Date: Wed, 11 Aug 2021 13:09:20 +0000 (UTC)

nbd_index_mutex is currently held over add_disk and inside ->open, which
leads to lock order reversals.  Refactor the device creation code path
so that nbd_dev_add is called without nbd_index_mutex lock held and
only takes it for the IDR insertation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 55 +++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 0b46a608f879..4054cc33fc1e 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1681,7 +1681,7 @@ static const struct blk_mq_ops nbd_mq_ops = {
 	.timeout	= nbd_xmit_timeout,
 };
 
-static struct nbd_device *nbd_dev_add(int index)
+static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 {
 	struct nbd_device *nbd;
 	struct gendisk *disk;
@@ -1707,6 +1707,7 @@ static struct nbd_device *nbd_dev_add(int index)
 	if (err)
 		goto out_free_nbd;
 
+	mutex_lock(&nbd_index_mutex);
 	if (index >= 0) {
 		err = idr_alloc(&nbd_index_idr, nbd, index, index + 1,
 				GFP_KERNEL);
@@ -1717,6 +1718,7 @@ static struct nbd_device *nbd_dev_add(int index)
 		if (err >= 0)
 			index = err;
 	}
+	mutex_unlock(&nbd_index_mutex);
 	if (err < 0)
 		goto out_free_tags;
 	nbd->index = index;
@@ -1743,7 +1745,7 @@ static struct nbd_device *nbd_dev_add(int index)
 
 	mutex_init(&nbd->config_lock);
 	refcount_set(&nbd->config_refs, 0);
-	refcount_set(&nbd->refs, 1);
+	refcount_set(&nbd->refs, refs);
 	INIT_LIST_HEAD(&nbd->list);
 	disk->major = NBD_MAJOR;
 	disk->first_minor = index << part_shift;
@@ -1847,34 +1849,35 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 		nbd = idr_find(&nbd_index_idr, index);
 	}
 
-	if (!nbd) {
-		nbd = nbd_dev_add(index);
-		if (IS_ERR(nbd)) {
+	if (nbd) {
+		if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags) &&
+		    test_bit(NBD_DISCONNECT_REQUESTED, &nbd->flags)) {
+			nbd->destroy_complete = &destroy_complete;
 			mutex_unlock(&nbd_index_mutex);
-			pr_err("nbd: failed to add new device\n");
-			return PTR_ERR(nbd);
+
+			/* wait until the nbd device is completely destroyed */
+			wait_for_completion(&destroy_complete);
+			goto again;
 		}
-	}
 
-	if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags) &&
-	    test_bit(NBD_DISCONNECT_REQUESTED, &nbd->flags)) {
-		nbd->destroy_complete = &destroy_complete;
+		if (!refcount_inc_not_zero(&nbd->refs)) {
+			mutex_unlock(&nbd_index_mutex);
+			if (index == -1)
+				goto again;
+			pr_err("nbd: device at index %d is going down\n",
+		       		index);
+			return -EINVAL;
+		}
 		mutex_unlock(&nbd_index_mutex);
-
-		/* Wait untill the the nbd stuff is totally destroyed */
-		wait_for_completion(&destroy_complete);
-		goto again;
-	}
-
-	if (!refcount_inc_not_zero(&nbd->refs)) {
+	} else {
 		mutex_unlock(&nbd_index_mutex);
-		if (index == -1)
-			goto again;
-		printk(KERN_ERR "nbd: device at index %d is going down\n",
-		       index);
-		return -EINVAL;
+
+		nbd = nbd_dev_add(index, 2);
+		if (IS_ERR(nbd)) {
+			pr_err("nbd: failed to add new device\n");
+			return PTR_ERR(nbd);
+		}
 	}
-	mutex_unlock(&nbd_index_mutex);
 
 	mutex_lock(&nbd->config_lock);
 	if (refcount_read(&nbd->config_refs)) {
@@ -2430,10 +2433,8 @@ static int __init nbd_init(void)
 	}
 	nbd_dbg_init();
 
-	mutex_lock(&nbd_index_mutex);
 	for (i = 0; i < nbds_max; i++)
-		nbd_dev_add(i);
-	mutex_unlock(&nbd_index_mutex);
+		nbd_dev_add(i, 1);
 	return 0;
 }
 
-- 
2.30.2

