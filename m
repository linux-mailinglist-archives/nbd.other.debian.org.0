Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 180093E9240
	for <lists+nbd@lfdr.de>; Wed, 11 Aug 2021 15:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DD52820330; Wed, 11 Aug 2021 13:09:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 11 13:09:08 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 166F12030F
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Aug 2021 12:51:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xNjUYW-HK_8n for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Aug 2021 12:51:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5EECC20304
	for <nbd@other.debian.org>; Wed, 11 Aug 2021 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gx6W6wlVWZJkJhCx8D92XleAgs9HpKjOXDw5OWXK6YQ=; b=ZxCQInjbAKr9x0+p+HJ4YIf6Tz
	30mHrkdvaQ4WlUVubHxw3nONpnoGnp6Go3wIwGXyZKVEdJbGVYTMyzh5IHjjpCn9/VBPYanQEAXqL
	wyIbRLJfX/LFDljQOHfLFsCnAbC11RqMbxq/tL6QrAS6CDsxLVKeHBIESnWeOp/kZjDnMIXWGsCtS
	3e57t/g4p9/mrvB6dNntjZYqzRbV3gtTSWq4CM6+mVA+aKdql55/cR5G01kFzYaViRWmGxs4De7PS
	4toyL98clKFutIjsQ+MkdxCXLkUVd0s7MHic7Ohf5uaMbnWmpGBq4/80BB740aladpghN9ALQjiXV
	Mq7JSUJQ==;
Received: from [2001:4bb8:184:6215:7ee3:d0e9:131a:82ff] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDng3-00DQBi-5d; Wed, 11 Aug 2021 12:50:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Tao <houtao1@huawei.com>
Subject: [PATCH 5/6] nbd: refactor device search and allocation in nbd_genl_connect
Date: Wed, 11 Aug 2021 14:44:27 +0200
Message-Id: <20210811124428.2368491-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811124428.2368491-1-hch@lst.de>
References: <20210811124428.2368491-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <knmSrdolkXP.A.ywF.0v8EhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1269
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210811124428.2368491-6-hch@lst.de
Resent-Date: Wed, 11 Aug 2021 13:09:08 +0000 (UTC)

Use idr_for_each_entry instead of the awkward callback to find an
existing device for the index == -1 case, and de-duplicate the device
allocation if no existing device was found.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 45 ++++++++++++++-------------------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 08161c73c9ed..0b46a608f879 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1765,18 +1765,6 @@ static struct nbd_device *nbd_dev_add(int index)
 	return ERR_PTR(err);
 }
 
-static int find_free_cb(int id, void *ptr, void *data)
-{
-	struct nbd_device *nbd = ptr;
-	struct nbd_device **found = data;
-
-	if (!refcount_read(&nbd->config_refs)) {
-		*found = nbd;
-		return 1;
-	}
-	return 0;
-}
-
 /* Netlink interface. */
 static const struct nla_policy nbd_attr_policy[NBD_ATTR_MAX + 1] = {
 	[NBD_ATTR_INDEX]		=	{ .type = NLA_U32 },
@@ -1846,31 +1834,26 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 again:
 	mutex_lock(&nbd_index_mutex);
 	if (index == -1) {
-		ret = idr_for_each(&nbd_index_idr, &find_free_cb, &nbd);
-		if (ret == 0) {
-			nbd = nbd_dev_add(-1);
-			if (IS_ERR(nbd)) {
-				mutex_unlock(&nbd_index_mutex);
-				printk(KERN_ERR "nbd: failed to add new device\n");
-				return PTR_ERR(nbd);
+		struct nbd_device *tmp;
+		int id;
+
+		idr_for_each_entry(&nbd_index_idr, tmp, id) {
+			if (!refcount_read(&tmp->config_refs)) {
+				nbd = tmp;
+				break;
 			}
 		}
 	} else {
 		nbd = idr_find(&nbd_index_idr, index);
-		if (!nbd) {
-			nbd = nbd_dev_add(index);
-			if (IS_ERR(nbd)) {
-				mutex_unlock(&nbd_index_mutex);
-				printk(KERN_ERR "nbd: failed to add new device\n");
-				return PTR_ERR(nbd);
-			}
-		}
 	}
+
 	if (!nbd) {
-		printk(KERN_ERR "nbd: couldn't find device at index %d\n",
-		       index);
-		mutex_unlock(&nbd_index_mutex);
-		return -EINVAL;
+		nbd = nbd_dev_add(index);
+		if (IS_ERR(nbd)) {
+			mutex_unlock(&nbd_index_mutex);
+			pr_err("nbd: failed to add new device\n");
+			return PTR_ERR(nbd);
+		}
 	}
 
 	if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags) &&
-- 
2.30.2

