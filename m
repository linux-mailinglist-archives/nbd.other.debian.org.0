Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 208E5778C05
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 12:26:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 04C742063F; Fri, 11 Aug 2023 10:26:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 10:26:35 2023
Old-Return-Path: <BATV+10530082ca17b6f7899b+7292+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 745D0205CD
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:09:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7U4XZ91KkHHA for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:09:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E93472048C
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=XS+CdlPa8tKa487hp4Qha77KSBNKRcJ6rt1gq/j585k=; b=y6q/GXfKNrc73CmPgU/0v1vaSD
	SgeQHi6ZEDzl4EF/bA0PYph5ooOTx19V22p8u0lTU84Qnt5NuMAcM6YjznaBMV174hVHA4hQg7pvS
	GHJz+iVCNNxrK1ELvgpjMTWO7ukfMaMmfSt+ABJ5kI8KP3zABhHMV4zpj9lNfhC1Hgh+x3yHH3Vet
	0F9ZWA/AKMM3KO77xZeTiszWznPsWQFQZ8sIobkGxhNMwlwOZB5QaJe9+UAjHlcXuw1lhztJDbWGn
	BhkcIlhZanc68c/eFzRo5+TlVzk+CdHgc8yK4+Fw8onNsG5QR6iq7LD1Ij9KZCUDUy70FxtE5hj6i
	Ii5UDasg==;
Received: from [88.128.92.63] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP4q-00A5o2-2G;
	Fri, 11 Aug 2023 10:09:05 +0000
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
Subject: [PATCH 11/17] dasd: also call __invalidate_device when setting the device offline
Date: Fri, 11 Aug 2023 12:08:22 +0200
Message-Id: <20230811100828.1897174-12-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811100828.1897174-1-hch@lst.de>
References: <20230811100828.1897174-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SWhVJBkHwKI.A.s4.bzg1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2607
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811100828.1897174-12-hch@lst.de
Resent-Date: Fri, 11 Aug 2023 10:26:36 +0000 (UTC)

Don't just write out the data, but also invalidate all caches when setting
the device offline.  Stop canceling the offlining when writeback fails
as there is no way to recover from that anyway.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/s390/block/dasd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/s390/block/dasd.c b/drivers/s390/block/dasd.c
index edcbf77852c31f..675b38ad00dc9e 100644
--- a/drivers/s390/block/dasd.c
+++ b/drivers/s390/block/dasd.c
@@ -3627,9 +3627,8 @@ int dasd_generic_set_offline(struct ccw_device *cdev)
 		 * empty
 		 */
 		if (device->block) {
-			rc = fsync_bdev(device->block->bdev);
-			if (rc != 0)
-				goto interrupted;
+			fsync_bdev(device->block->bdev);
+			__invalidate_device(device->block->bdev, true);
 		}
 		dasd_schedule_device_bh(device);
 		rc = wait_event_interruptible(shutdown_waitq,
-- 
2.39.2

