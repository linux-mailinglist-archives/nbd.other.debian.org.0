Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA3381F5DA
	for <lists+nbd@lfdr.de>; Thu, 28 Dec 2023 09:12:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3E30321430; Thu, 28 Dec 2023 08:12:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 28 08:12:25 2023
Old-Return-Path: <BATV+36667fa86514323fa3d9+7431+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 64DF221507
	for <lists-other-nbd@bendel.debian.org>; Thu, 28 Dec 2023 07:56:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.16 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qiwEkuXdIKry for <lists-other-nbd@bendel.debian.org>;
	Thu, 28 Dec 2023 07:56:21 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B889D21510
	for <nbd@other.debian.org>; Thu, 28 Dec 2023 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=wsinjDSCV+Rjfc71EDyifigolrdpbzFtrjrUVZw9+FQ=; b=nDIXnjOkHVtMU9aFr1prtKvnZz
	Ki8PpxdH9FY7DbT8gAv6++ktPz9xu0rCdal8U5fn+UG7t34xCTQgYv+ZK1+pgSQqkpVObB+7sIrJY
	4jUWJeigc10tLbt+X8pGHLB0I7of/v3GXZzYvO9SHHsToGvRewQGujunI9x651xVV4kf/ut0cMaQh
	kh1AzFVNER65pYGhmGy5HfZzqJ7f4sLyCVskEooCS8ufrumusn13x60eZwwe8nw4HCGl9Ze9xJZA6
	dmWMKjcehTNQtVJ2nA3y54TrhwdMBvwH42LDCsp3hnWBbY8iGTcWMTWloh1iNQU3FlG9LEBcMEtzP
	Mk1ErNdw==;
Received: from 213-147-167-209.nat.highway.webapn.at ([213.147.167.209] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rIlF9-00GMqU-1S;
	Thu, 28 Dec 2023 07:55:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Coly Li <colyli@suse.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: provide a sane discard_granularity default
Date: Thu, 28 Dec 2023 07:55:36 +0000
Message-Id: <20231228075545.362768-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <C3tg92EyEKL.A.DqG.p3SjlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2690
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231228075545.362768-1-hch@lst.de
Resent-Date: Thu, 28 Dec 2023 08:12:25 +0000 (UTC)

Hi Jens,

this series defaults the discard_granularity to the sector size as
that is a very logical default for devices that have no further
restrictions.  This removes the need for trivial drivers to set
a discard granularity and cleans up the interface.

Diffstat:
 arch/um/drivers/ubd_kern.c    |    1 -
 block/blk-merge.c             |    6 +-----
 block/blk-settings.c          |    5 ++++-
 drivers/block/nbd.c           |    6 +-----
 drivers/block/null_blk/main.c |    1 -
 drivers/block/zram/zram_drv.c |    1 -
 drivers/md/bcache/super.c     |    1 -
 drivers/mtd/mtd_blkdevs.c     |    4 +---
 8 files changed, 7 insertions(+), 18 deletions(-)

