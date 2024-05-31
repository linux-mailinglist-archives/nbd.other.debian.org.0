Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8605D8D5C38
	for <lists+nbd@lfdr.de>; Fri, 31 May 2024 10:06:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5672D204A3; Fri, 31 May 2024 08:06:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 31 08:06:36 2024
Old-Return-Path: <BATV+4872a67a45e6d46d0c49+7586+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5DCB92055B
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 May 2024 07:49:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.4 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Qm-nk0db4bLn for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 May 2024 07:49:00 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 691402054E
	for <nbd@other.debian.org>; Fri, 31 May 2024 07:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=0q2p+u53R9YY1ujQIkkIYHdGljvaoYfmRjVYZa1pGUw=; b=NQeQhA2UOUYImH9TH8f84PjtdO
	ObERM3qoC8ul3CKlxRBe0dwRdXaSSfDKIuJPDJKIXddbCk4DuIEOabi0xeClPM4iSB5KZs7KRVBke
	QXuG41cYK3YbO5bkABYuBrfzr2b20SayGqug5sRun1euqWYw8yIMYgwVe7df1qO/MfVZyOgF1Y4jH
	8S8LuTfmFWj0aSfI2cvZCNBbal2QtT+CQ6/gS37bIRRARF26B6AGUCKpsAA2d+30Zq8U6sLyU8dBv
	Bk3tXLY8MqgLz5OO3tA8AK0iTNwDc6TpStdHEqtPrSKHpQTid5SoU4/Ug1OFPywaZgXzR2J5gCky/
	tKVHxQ0Q==;
Received: from 2a02-8389-2341-5b80-5ba9-f4da-76fa-44a9.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:5ba9:f4da:76fa:44a9] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCx0N-00000009XXW-22Ka;
	Fri, 31 May 2024 07:48:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH 03/14] rbd: increase io_opt again
Date: Fri, 31 May 2024 09:47:58 +0200
Message-ID: <20240531074837.1648501-4-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240531074837.1648501-1-hch@lst.de>
References: <20240531074837.1648501-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rZU3Pctw1SF.A.aIWJ.MUYWmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2859
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240531074837.1648501-4-hch@lst.de
Resent-Date: Fri, 31 May 2024 08:06:36 +0000 (UTC)

Commit 16d80c54ad42 ("rbd: set io_min, io_opt and discard_granularity to
alloc_size") lowered the io_opt size for rbd from objset_bytes which is
4MB for typical setup to alloc_size which is typically 64KB.

The commit mostly talks about discard behavior and does mention io_min
in passing.  Reducing io_opt means reducing the readahead size, which
seems counter-intuitive given that rbd currently abuses the user
max_sectors setting to actually increase the I/O size.  Switch back
to the old setting to allow larger reads (the readahead size despite it's
name actually limits the size of any buffered read) and to prepare
for using io_opt in the max_sectors calculation and getting drivers out
of the business of overriding the max_user_sectors value.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index 26ff5cd2bf0abc..46dc487ccc17eb 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -4955,8 +4955,8 @@ static int rbd_init_disk(struct rbd_device *rbd_dev)
 	struct queue_limits lim = {
 		.max_hw_sectors		= objset_bytes >> SECTOR_SHIFT,
 		.max_user_sectors	= objset_bytes >> SECTOR_SHIFT,
+		.io_opt			= objset_bytes,
 		.io_min			= rbd_dev->opts->alloc_size,
-		.io_opt			= rbd_dev->opts->alloc_size,
 		.max_segments		= USHRT_MAX,
 		.max_segment_size	= UINT_MAX,
 	};
-- 
2.43.0

