Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFEC778BFA
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 12:25:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D284F2063F; Fri, 11 Aug 2023 10:25:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 10:25:27 2023
Old-Return-Path: <BATV+10530082ca17b6f7899b+7292+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FUZZY_OFFERS,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E37F020631
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:09:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9ufxapOfWi4d for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:09:01 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E4F70205CD
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=J1DfUQkx1NNyyXVn86c6of42JBP1co1gWfvL2lWWijU=; b=yCMFxsqUkS8OiyVwDn9KEmfc7Z
	rFmoMcg8GMQPhofEhx9Enm+G5VFxPlImqTw38zlGAcBUDaOX7du9FynQJKS48kVT+H/4yTI7Fcvpw
	+EOdT0Rg5jhDAmGhxLkZ+Aya7VUX0ZicbvHFVPskzYM/AuWxsQnfkqQ3or878BKOi2vguqi8gGb7F
	rt6WieY+VVtZTtfxA/4t1vyqgnCKVfrPYHz9R6aOcedyEGbVzYLKE5D3+JZwNy0xUiByaW+ayrmb6
	mQ4IeDrjULIinCbVYeRvZw2usWFBmPsNVwDFC/AXNzWjF9TQnR07MCidWipacLPwbEEZgYTHYe60G
	r02dFoGA==;
Received: from [88.128.92.63] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP4d-00A5hH-03;
	Fri, 11 Aug 2023 10:08:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-s390@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 07/17] nbd: call blk_mark_disk_dead in nbd_clear_sock_ioctl
Date: Fri, 11 Aug 2023 12:08:18 +0200
Message-Id: <20230811100828.1897174-8-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811100828.1897174-1-hch@lst.de>
References: <20230811100828.1897174-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zcucZzO-qIN.A.0q.Xyg1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2602
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811100828.1897174-8-hch@lst.de
Resent-Date: Fri, 11 Aug 2023 10:25:27 +0000 (UTC)

nbd_clear_sock_ioctl kills the socket and with that the block
device.  Instead of just invalidating file system buffers,
mark the device as dead, which will also invalidate the buffers
as part of the proper shutdown sequence.  This also includes
invalidating partitions if there are any.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 8576d696c7a221..42e0159bb258fa 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1434,12 +1434,10 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd)
 	return ret;
 }
 
-static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
-				 struct block_device *bdev)
+static void nbd_clear_sock_ioctl(struct nbd_device *nbd)
 {
+	blk_mark_disk_dead(nbd->disk);
 	nbd_clear_sock(nbd);
-	__invalidate_device(bdev, true);
-	nbd_bdev_reset(nbd);
 	if (test_and_clear_bit(NBD_RT_HAS_CONFIG_REF,
 			       &nbd->config->runtime_flags))
 		nbd_config_put(nbd);
@@ -1465,7 +1463,7 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 	case NBD_DISCONNECT:
 		return nbd_disconnect(nbd);
 	case NBD_CLEAR_SOCK:
-		nbd_clear_sock_ioctl(nbd, bdev);
+		nbd_clear_sock_ioctl(nbd);
 		return 0;
 	case NBD_SET_SOCK:
 		return nbd_add_socket(nbd, arg, false);
-- 
2.39.2

