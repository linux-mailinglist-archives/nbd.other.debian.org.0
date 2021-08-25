Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA513F7AFC
	for <lists+nbd@lfdr.de>; Wed, 25 Aug 2021 18:54:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E4281208D3; Wed, 25 Aug 2021 16:54:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 25 16:54:30 2021
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
	by bendel.debian.org (Postfix) with ESMTP id BE710208A9
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Aug 2021 16:39:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.13 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pnFSc983_Ueb for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Aug 2021 16:38:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 23DC020569
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 16:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5NUzJdZ8nyTj2xk0B6C7gNl/dOwK748pl1vnltIU4Yk=; b=Qk/gTodJyba3ciDKQ2E/HGX10r
	85nHTqsIEJAoioElIz0vQQrUKhJZcXoTHZhQd5bfSxRm9R+DvIIfd68iFYLo/elrQBu3IexVHQcKC
	ceEStCsPTjaKdIeL1c8S+NSOVCBohVMMMOQhAl3TGmbfFumylNAu7Mv8qlAmAsqipTYtkl+HGFldx
	xTD2hsESfaUIoFBRnBljS6WuaR55NIwykIGNFxqWgRauOTddN0zBKWXxN1TcJJ2ccHDecx2puHK/0
	OGnbErdS7udPMwvjzcFkJdi+h11ylecur6RnUQCyvLbMUGiz9I71sxGaOAbYHzVZdVAYT/64ldCsv
	3nSCuQlQ==;
Received: from [2001:4bb8:193:fd10:a3f9:5689:21a4:711f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIvtm-00CTxQ-5N; Wed, 25 Aug 2021 16:37:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Xiubo Li <xiubli@redhat.com>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH 3/6] nbd: prevent IDR lookups from finding partially initialized devices
Date: Wed, 25 Aug 2021 18:31:05 +0200
Message-Id: <20210825163108.50713-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825163108.50713-1-hch@lst.de>
References: <20210825163108.50713-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lrkXFDczGpN.A.WLF.GXnJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1332
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210825163108.50713-4-hch@lst.de
Resent-Date: Wed, 25 Aug 2021 16:54:30 +0000 (UTC)

From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>

Previously nbd_index_mutex was held during whole add/remove/lookup
operations in order to guarantee that partially initialized devices are
not reachable via idr_find() or idr_for_each(). But now that partially
initialized devices become reachable as soon as idr_alloc() succeeds,
we need to skip partially initialized devices. Since it seems that
all functions use refcount_inc_not_zero(&nbd->refs) in order to skip
destroying devices, update nbd->refs from zero to non-zero as the last
step of device initialization in order to also skip partially initialized
devices.

Fixes: 6e4df4c64881 ("nbd: reduce the nbd_index_mutex scope")
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
[hch: split from a larger patch, added comments]
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 69971a47c36f..dfaa95df8d6c 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1751,7 +1751,11 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 
 	mutex_init(&nbd->config_lock);
 	refcount_set(&nbd->config_refs, 0);
-	refcount_set(&nbd->refs, refs);
+	/*
+	 * Start out with a zero references to keep other threads from using
+	 * this device until it is fully initialized.
+	 */
+	refcount_set(&nbd->refs, 0);
 	INIT_LIST_HEAD(&nbd->list);
 	disk->major = NBD_MAJOR;
 
@@ -1770,6 +1774,11 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	disk->private_data = nbd;
 	sprintf(disk->disk_name, "nbd%d", index);
 	add_disk(disk);
+
+	/*
+	 * Now publish the device.
+	 */
+	refcount_set(&nbd->refs, refs);
 	nbd_total_devices++;
 	return nbd;
 
-- 
2.30.2

