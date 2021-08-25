Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBEC3F7AFB
	for <lists+nbd@lfdr.de>; Wed, 25 Aug 2021 18:54:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3EF9E208DF; Wed, 25 Aug 2021 16:54:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 25 16:54:20 2021
Old-Return-Path: <BATV+524259e6bed01b826d00+6576+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B1FDA20569
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Aug 2021 16:37:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.03 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PjiTYeV3_5AU for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Aug 2021 16:37:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 369F2208A9
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 16:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=L7GOW6bbWREAk67/0GlhVh0s9lBsMWcRXP4c/xXKmhk=; b=pPdTc5u/lOtSDhP8WFaj68iz5s
	l7hOnLhRBSBqov99WazEWoW1OyQNWku9KcetGbFfg++q0QAhlDaSMV+ZB9cIFcchJjpFiQXa4FelZ
	ZjTPkRnCs/NWJISLJKawI2+QDBJOfpracYCntNU3Jtp4PXZRcqEuooaz2A9F5+SDXd7H5qia55e5u
	p0nng/KAxctWIpuPFoqBXa5VkK7KfHsWragzWLrSrmHc7tTsmXhggUbZYRGOU1GRvCykyKx4hy5JZ
	phQrHeUJl71S6Kyt7pcPtVvVeRTmzkHvtFB3tJF7+ByttqE2wHFg/hDHfLCKHbLUMdIdRNGa50TGS
	EidW9I5w==;
Received: from [2001:4bb8:193:fd10:a3f9:5689:21a4:711f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIvsJ-00CTq0-Oq; Wed, 25 Aug 2021 16:36:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Xiubo Li <xiubli@redhat.com>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Hillf Danton <hdanton@sina.com>
Subject: [PATCH 2/6] nbd: reset NBD to NULL when restarting in nbd_genl_connect
Date: Wed, 25 Aug 2021 18:31:04 +0200
Message-Id: <20210825163108.50713-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825163108.50713-1-hch@lst.de>
References: <20210825163108.50713-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FoGy8nQCdxF.A.DJF.8WnJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1331
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210825163108.50713-3-hch@lst.de
Resent-Date: Wed, 25 Aug 2021 16:54:20 +0000 (UTC)

When nbd_genl_connect restarts to wait for a disconnecting device, nbd
needs to be reset to NULL.  Do that by facoring out a helper to find
an unused device.

Fixes: 6177b56c96ff ("nbd: refactor device search and allocation in nbd_genl_connect")
Reported-by: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Reported-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 2c63372a31dd..69971a47c36f 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1785,6 +1785,20 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	return ERR_PTR(err);
 }
 
+static struct nbd_device *nbd_find_unused(void)
+{
+	struct nbd_device *nbd;
+	int id;
+
+	lockdep_assert_held(&nbd_index_mutex);
+
+	idr_for_each_entry(&nbd_index_idr, nbd, id)
+		if (!refcount_read(&nbd->config_refs))
+			return nbd;
+
+	return NULL;
+}
+
 /* Netlink interface. */
 static const struct nla_policy nbd_attr_policy[NBD_ATTR_MAX + 1] = {
 	[NBD_ATTR_INDEX]		=	{ .type = NLA_U32 },
@@ -1832,7 +1846,7 @@ static int nbd_genl_size_set(struct genl_info *info, struct nbd_device *nbd)
 static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 {
 	DECLARE_COMPLETION_ONSTACK(destroy_complete);
-	struct nbd_device *nbd = NULL;
+	struct nbd_device *nbd;
 	struct nbd_config *config;
 	int index = -1;
 	int ret;
@@ -1853,20 +1867,10 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 	}
 again:
 	mutex_lock(&nbd_index_mutex);
-	if (index == -1) {
-		struct nbd_device *tmp;
-		int id;
-
-		idr_for_each_entry(&nbd_index_idr, tmp, id) {
-			if (!refcount_read(&tmp->config_refs)) {
-				nbd = tmp;
-				break;
-			}
-		}
-	} else {
+	if (index == -1)
+		nbd = nbd_find_unused();
+	else
 		nbd = idr_find(&nbd_index_idr, index);
-	}
-
 	if (nbd) {
 		if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags) &&
 		    test_bit(NBD_DISCONNECT_REQUESTED, &nbd->flags)) {
-- 
2.30.2

