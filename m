Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCD3778BFF
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 12:26:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 00D822063E; Fri, 11 Aug 2023 10:26:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 10:26:08 2023
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
	by bendel.debian.org (Postfix) with ESMTP id C55AC205DE
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:09:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id G8jAqPN8Sqo0 for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:09:12 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 55F002048C
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=sF7/TLAdvGX6cavT8VuEoUUpVOqcLET0XfQb1xeL0Nw=; b=UCL+x9QG32FS+rhJbyMhi+/7BI
	pwDlHyybaxOCwwWqEiFMPVBNHFZeJBqaAwqNejCegVzyecx6tc9ySNjKWcO4z9faDK62iUZdEAG92
	O0byl8R9U9DO/sDMANpqYnIOjofkj88tIwTlBiw5GOiz58QuvPsWSQaw4+K4EEER553egvEWGz6yj
	C5tYAvvdB/qekhXR9UmRdfHPWIZUTA/Y6zwP1PKTJ3GVc6U/3wIdpUMiUKzBK001ICAg5yJnDlp8v
	dS7G9KViqIPcJSoosia71E04M94EtuD+UgLsefFdXt07ze6NRePr4uaLkbHud4BpYeZGm6OT48+gn
	oYBYUFPw==;
Received: from [88.128.92.63] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP4n-00A5mu-2B;
	Fri, 11 Aug 2023 10:09:02 +0000
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
Subject: [PATCH 10/17] amiflop: don't call fsync_bdev in FDFMTBEG
Date: Fri, 11 Aug 2023 12:08:21 +0200
Message-Id: <20230811100828.1897174-11-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811100828.1897174-1-hch@lst.de>
References: <20230811100828.1897174-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vygFaPShzy.A.iz.Azg1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2605
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811100828.1897174-11-hch@lst.de
Resent-Date: Fri, 11 Aug 2023 10:26:09 +0000 (UTC)

FDFMTBEG is used by fdformat to calibrate before formatting a disk.
Neither the atari nor PC floppy driver sync data, which also seems
a bit pointless for a disk hat is about to get formatted.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/amiflop.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/amiflop.c b/drivers/block/amiflop.c
index e460c9799d9f35..2b98114a9fe092 100644
--- a/drivers/block/amiflop.c
+++ b/drivers/block/amiflop.c
@@ -1547,7 +1547,6 @@ static int fd_locked_ioctl(struct block_device *bdev, blk_mode_t mode,
 			rel_fdc();
 			return -EBUSY;
 		}
-		fsync_bdev(bdev);
 		if (fd_motor_on(drive) == 0) {
 			rel_fdc();
 			return -ENODEV;
-- 
2.39.2

