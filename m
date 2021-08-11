Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8423E9233
	for <lists+nbd@lfdr.de>; Wed, 11 Aug 2021 15:06:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 41A0E20326; Wed, 11 Aug 2021 13:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 11 13:06:09 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 5F2F82030F
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Aug 2021 12:50:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DiT2QKEXJkuA for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Aug 2021 12:50:13 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A297620313
	for <nbd@other.debian.org>; Wed, 11 Aug 2021 12:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3mjdZMlNYqnRKE0+IaFRdNsseXkfPbPjC5ghDv9vByM=; b=WiFSG1BYq4TIKneYknmEF9YLLu
	zqFg5SdkKfxOZMNr6bgpWL9Jhsvtbysz6gbxuBBalCujhf/SN5aFT9XVH26K1IzOY5KlHwfYwM8pb
	b0mPFyTaVID3DfzN7Nf2tXXfBXi6k1+Lb+7LBFooK22IoinaYdJHd7BaadwqRKkHfolQ/+jDWK6Bh
	Jo1HgCN4/j0ob2Eu9hzOzu3ErFR9vumxfUVmSVnUMCQjFX7Kth5Rt8EG6OxnrHMjLyWGJ0uTOPsGc
	nMLRSK1zOgcgCYLo2CnZT7A2KLeiOpHZqdb8OCrQsVweVLvj8echmDpwbtIIgyScahZy5XbKGfWy7
	i3eOmnrw==;
Received: from [2001:4bb8:184:6215:7ee3:d0e9:131a:82ff] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDneb-00DQ2A-4D; Wed, 11 Aug 2021 12:48:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Tao <houtao1@huawei.com>
Subject: [PATCH 4/6] nbd: return the allocated nbd_device from nbd_dev_add
Date: Wed, 11 Aug 2021 14:44:26 +0200
Message-Id: <20210811124428.2368491-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811124428.2368491-1-hch@lst.de>
References: <20210811124428.2368491-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZUy3YcTWsQF.A.2ZD.Bt8EhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1268
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210811124428.2368491-5-hch@lst.de
Resent-Date: Wed, 11 Aug 2021 13:06:09 +0000 (UTC)

Return the device we just allocated instead of doing an extra search for
it in the caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index de8b23af2486..08161c73c9ed 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1681,7 +1681,7 @@ static const struct blk_mq_ops nbd_mq_ops = {
 	.timeout	= nbd_xmit_timeout,
 };
 
-static int nbd_dev_add(int index)
+static struct nbd_device *nbd_dev_add(int index)
 {
 	struct nbd_device *nbd;
 	struct gendisk *disk;
@@ -1753,7 +1753,7 @@ static int nbd_dev_add(int index)
 	sprintf(disk->disk_name, "nbd%d", index);
 	add_disk(disk);
 	nbd_total_devices++;
-	return index;
+	return nbd;
 
 out_free_idr:
 	idr_remove(&nbd_index_idr, index);
@@ -1762,7 +1762,7 @@ static int nbd_dev_add(int index)
 out_free_nbd:
 	kfree(nbd);
 out:
-	return err;
+	return ERR_PTR(err);
 }
 
 static int find_free_cb(int id, void *ptr, void *data)
@@ -1848,25 +1848,22 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 	if (index == -1) {
 		ret = idr_for_each(&nbd_index_idr, &find_free_cb, &nbd);
 		if (ret == 0) {
-			int new_index;
-			new_index = nbd_dev_add(-1);
-			if (new_index < 0) {
+			nbd = nbd_dev_add(-1);
+			if (IS_ERR(nbd)) {
 				mutex_unlock(&nbd_index_mutex);
 				printk(KERN_ERR "nbd: failed to add new device\n");
-				return new_index;
+				return PTR_ERR(nbd);
 			}
-			nbd = idr_find(&nbd_index_idr, new_index);
 		}
 	} else {
 		nbd = idr_find(&nbd_index_idr, index);
 		if (!nbd) {
-			ret = nbd_dev_add(index);
-			if (ret < 0) {
+			nbd = nbd_dev_add(index);
+			if (IS_ERR(nbd)) {
 				mutex_unlock(&nbd_index_mutex);
 				printk(KERN_ERR "nbd: failed to add new device\n");
-				return ret;
+				return PTR_ERR(nbd);
 			}
-			nbd = idr_find(&nbd_index_idr, index);
 		}
 	}
 	if (!nbd) {
-- 
2.30.2

