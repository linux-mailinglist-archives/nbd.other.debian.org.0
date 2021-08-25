Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCDA3F7B01
	for <lists+nbd@lfdr.de>; Wed, 25 Aug 2021 18:57:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C3065208D2; Wed, 25 Aug 2021 16:57:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 25 16:57:42 2021
Old-Return-Path: <BATV+524259e6bed01b826d00+6576+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,PHONENUMBER,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7F61F205B3
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Aug 2021 16:42:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.53 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	PHONENUMBER=1.5, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yTf8iJIlWPE9 for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Aug 2021 16:42:10 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 26224205B0
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 16:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=F65aCye5Zgky/rqbGwTTs59TxsS7/7gjLFX7TO/jgO0=; b=BIWOjr2orzbRJ5VeY0OHQHosSF
	Dk0KW5zKfKpsuaBW5O43pihR/Bhb/hHbD0s5JPn8CjZnrB8wiatgJyWT23HNrza09ZAB7/UZ80tm8
	IFMOhyDwrR/Wa3ChmqiXMhE5EO5+a2o1wkqqNSj+hfuGakjfV1La5RujRZKuVGApNKSDTJa04J8ZF
	FGPR95t+PgEMsXHlzsNTWRxMKLv//p8BQuzKJJYBnkbUbUmeITTHdgKIDxG78x2eeNc0Vfq6ij8S7
	wprjxXiTQKz9Aot4O5tAZO/au559jDI1jF+N5u9tbjz363L45h3WUenEJfsl9YvcSS7c826ilIvGo
	D+gXqMOA==;
Received: from [2001:4bb8:193:fd10:a3f9:5689:21a4:711f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIvwo-00CUDF-3t; Wed, 25 Aug 2021 16:40:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Xiubo Li <xiubli@redhat.com>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: [PATCH 5/6] nbd: only return usable devices from nbd_find_unused
Date: Wed, 25 Aug 2021 18:31:07 +0200
Message-Id: <20210825163108.50713-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825163108.50713-1-hch@lst.de>
References: <20210825163108.50713-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xHHV1xYRQLM.A.VpF.GanJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1334
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210825163108.50713-6-hch@lst.de
Resent-Date: Wed, 25 Aug 2021 16:57:42 +0000 (UTC)

Device marked as NBD_DESTROY_ON_DISCONNECT can and should be skipped
given that they won't survive the disconnect.  So skip them and try
to grab a reference directly and just continue if the the devices
is being torn down or created and thus has a zero refcount.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 042af761d3a4..5c03f3eb3129 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1794,16 +1794,20 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	return ERR_PTR(err);
 }
 
-static struct nbd_device *nbd_find_unused(void)
+static struct nbd_device *nbd_find_get_unused(void)
 {
 	struct nbd_device *nbd;
 	int id;
 
 	lockdep_assert_held(&nbd_index_mutex);
 
-	idr_for_each_entry(&nbd_index_idr, nbd, id)
-		if (!refcount_read(&nbd->config_refs))
+	idr_for_each_entry(&nbd_index_idr, nbd, id) {
+		if (refcount_read(&nbd->config_refs) ||
+		    test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags))
+			continue;
+		if (refcount_inc_not_zero(&nbd->refs))
 			return nbd;
+	}
 
 	return NULL;
 }
@@ -1877,10 +1881,10 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 again:
 	mutex_lock(&nbd_index_mutex);
 	if (index == -1)
-		nbd = nbd_find_unused();
+		nbd = nbd_find_get_unused();
 	else
 		nbd = idr_find(&nbd_index_idr, index);
-	if (nbd) {
+	if (nbd && index != -1) {
 		if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags) &&
 		    test_bit(NBD_DISCONNECT_REQUESTED, &nbd->flags)) {
 			nbd->destroy_complete = &destroy_complete;
@@ -1893,8 +1897,6 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 
 		if (!refcount_inc_not_zero(&nbd->refs)) {
 			mutex_unlock(&nbd_index_mutex);
-			if (index == -1)
-				goto again;
 			pr_err("nbd: device at index %d is going down\n",
 				index);
 			return -EINVAL;
-- 
2.30.2

