Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF703F7AFA
	for <lists+nbd@lfdr.de>; Wed, 25 Aug 2021 18:54:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9A342208CC; Wed, 25 Aug 2021 16:54:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 25 16:54:09 2021
Old-Return-Path: <BATV+524259e6bed01b826d00+6576+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2C2E820885
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Aug 2021 16:36:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.13 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7Y1AyS3K_XYq for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Aug 2021 16:36:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 766382069E
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 16:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ocFxBn/XAj3qFajqqWfv+beTwyzY2/I4pXg8QJ/kqm4=; b=IPwVsg8wwA3RiMz5RmY1NB9Sde
	o+NQKD0LUwyAXUAZDIxAXfj4rrUAIfmSIUawjHKinkKVBY6bb0ervPQASXzxEHnF6mgD2X3xdM3W5
	y7MVgnJ3jheIcbc/eq9slS6lM/++NzmHPaxIu7KH2MMSUecOGgKWeDC+udURA5O/3PgKV7Nh2FSJi
	PpLETllUf9Y/X7xFIqQyN+zA8JYs6QEe6BfxnuZ7X5uPtFsueuT/YaVsrxFVGURqa8yLRP+LjL4Nt
	gu4JzMVR/n/m/GjLSYgFmOmBlGi8Xh+oSCvF3dbHVOVZGggsG+mmrxfHhtyBxlwbKT086q2gkQ2Yg
	nBezQS8Q==;
Received: from [2001:4bb8:193:fd10:a3f9:5689:21a4:711f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIvqm-00CThz-B9; Wed, 25 Aug 2021 16:34:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Xiubo Li <xiubli@redhat.com>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH 1/6] nbd: add missing locking to the nbd_dev_add error path
Date: Wed, 25 Aug 2021 18:31:03 +0200
Message-Id: <20210825163108.50713-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825163108.50713-1-hch@lst.de>
References: <20210825163108.50713-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EaJ-INZ7HxG.A.VGF.xWnJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1330
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210825163108.50713-2-hch@lst.de
Resent-Date: Wed, 25 Aug 2021 16:54:09 +0000 (UTC)

From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>

idr_remove needs external synchronization.

Fixes: 6e4df4c64881 ("nbd: reduce the nbd_index_mutex scope")
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
[hch: split from a larger patch]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index c5e2b4cd697f..2c63372a31dd 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1774,7 +1774,9 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	return nbd;
 
 out_free_idr:
+	mutex_lock(&nbd_index_mutex);
 	idr_remove(&nbd_index_idr, index);
+	mutex_unlock(&nbd_index_mutex);
 out_free_tags:
 	blk_mq_free_tag_set(&nbd->tag_set);
 out_free_nbd:
-- 
2.30.2

