Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B213F7B00
	for <lists+nbd@lfdr.de>; Wed, 25 Aug 2021 18:57:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D9E02208E2; Wed, 25 Aug 2021 16:57:29 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 25 16:57:29 2021
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
	by bendel.debian.org (Postfix) with ESMTP id BFDF2208CF
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Aug 2021 16:40:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.03 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UFQqDciCJS9T for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Aug 2021 16:40:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B9238208CC
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 16:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HJY1+vaQAHzPlwSluEOdaLYpzyAqL2TCkEk9c36C1dA=; b=LhkdMk+nrIZyL4kn89F0fvwdkr
	BOer+/75eNECOFgk76gWMrjtFt2Wp/C8UpJS3febCh2JnqGzXIJ55j9r/YiPd/MX9Y+4RdNfNua5+
	zf2R195fdtcpXS2E+lJNtnFPgS+x8396z5WsjH00cnhG7vuhCOOlO/kkkAIfuQzrX9zb/sCXAr/nc
	KDIosvRf33wGRubD7S7DlUC7WnGi0CKgJ4se8r6xcA23XO0r977Ghidz11OpZzQIeVKh8/2hLm/W8
	3zPUG3HFxyaZNa1EZ15BdNSbFzisjlv3exl0NU3QcKu32YBes1XFjMSelfpG70ot4cOqXLYi9T1H3
	QvWPHP8w==;
Received: from [2001:4bb8:193:fd10:a3f9:5689:21a4:711f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIvuv-00CU4d-Mp; Wed, 25 Aug 2021 16:38:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Xiubo Li <xiubli@redhat.com>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH 4/6] nbd: set nbd->index before releasing nbd_index_mutex
Date: Wed, 25 Aug 2021 18:31:06 +0200
Message-Id: <20210825163108.50713-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825163108.50713-1-hch@lst.de>
References: <20210825163108.50713-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <c4tDXn5YE-B.A.YkF.5ZnJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1333
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210825163108.50713-5-hch@lst.de
Resent-Date: Wed, 25 Aug 2021 16:57:29 +0000 (UTC)

From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>

Set nbd->index before releasing nbd_index_mutex, as populate_nbd_status()
might access nbd->index as soon as nbd_index_mutex is released.

Fixes: 6e4df4c64881 ("nbd: reduce the nbd_index_mutex scope")
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
[hch: split from a larger patch]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index dfaa95df8d6c..042af761d3a4 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1724,10 +1724,10 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 		if (err >= 0)
 			index = err;
 	}
+	nbd->index = index;
 	mutex_unlock(&nbd_index_mutex);
 	if (err < 0)
 		goto out_free_tags;
-	nbd->index = index;
 
 	disk = blk_mq_alloc_disk(&nbd->tag_set, NULL);
 	if (IS_ERR(disk)) {
-- 
2.30.2

