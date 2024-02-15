Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6470A855B87
	for <lists+nbd@lfdr.de>; Thu, 15 Feb 2024 08:22:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 473F420947; Thu, 15 Feb 2024 07:22:07 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 15 07:22:07 2024
Old-Return-Path: <BATV+a252b21bd4a653ddb6e6+7480+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2FCA32064B
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Feb 2024 07:03:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.16 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KSi0WTQBMyLv for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Feb 2024 07:03:31 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DF3C320C20
	for <nbd@other.debian.org>; Thu, 15 Feb 2024 07:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=K2FgxI/Q5z39NeiH1eGPpjIbdu8553gMMeg+3F7f/g0=; b=XY72oYnL7yvCvK8xeQhtM8J9nH
	GQ115g5bBxrJPMyB0kUAzpWVesmy/dAZHeFVEqkkVzviYdmEXVdln4vL7iZAyXAnMNSBAG2Ona+nB
	ST3R9rDYwtkhlC/pNHvAyoa005k0tzhnlyb8v0ct42hSvgJ8PJyUJBa86eQ/vP3ipmXU8k60ydOor
	FwM+vuChUf0fPpJ6dD1uhGK2VxiPc/U+IE7HiNpxbyWQKJavy2q2EoOo89EySCCYHotcNESZMslD4
	PXcLVqhsnGgsShRW9HD4JMmDgWbJ0wlRD6egcjphmvGFg8Le812rGfhT345Z22C+NXJCjoj3pACXc
	5h7l5ICg==;
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raVlz-0000000FANl-1akg;
	Thu, 15 Feb 2024 07:03:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Ming Lei <ming.lei@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: pass queue_limits to blk_mq_alloc_disk for simple drivers
Date: Thu, 15 Feb 2024 08:02:43 +0100
Message-Id: <20240215070300.2200308-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mdlLfXsKa7J.A.I3.fubzlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2731
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240215070300.2200308-1-hch@lst.de
Resent-Date: Thu, 15 Feb 2024 07:22:07 +0000 (UTC)

Hi Jens,

this series converts all "simple" blk-mq drivers that don't have complex
internal layering or other oddities to pass the queue_limits to
blk_mq_alloc_disk.  None of these drivers updates the limits at runtime.


Diffstat:
 arch/um/drivers/ubd_kern.c          |    8 +-
 drivers/block/aoe/aoeblk.c          |   15 ++---
 drivers/block/floppy.c              |    6 +-
 drivers/block/mtip32xx/mtip32xx.c   |   13 ++--
 drivers/block/nbd.c                 |   13 ++--
 drivers/block/ps3disk.c             |   17 +++---
 drivers/block/rbd.c                 |   29 +++++-----
 drivers/block/rnbd/rnbd-clt.c       |   64 +++++++++--------------
 drivers/block/sunvdc.c              |   18 +++---
 drivers/block/ublk_drv.c            |   90 +++++++++++++++------------------
 drivers/cdrom/gdrom.c               |   14 ++---
 drivers/memstick/core/ms_block.c    |   14 ++---
 drivers/memstick/core/mspro_block.c |   15 ++---
 drivers/mmc/core/queue.c            |   97 +++++++++++++++++++-----------------
 drivers/mtd/mtd_blkdevs.c           |   12 ++--
 drivers/mtd/ubi/block.c             |    6 +-
 drivers/s390/block/scm_blk.c        |   17 +++---
 17 files changed, 222 insertions(+), 226 deletions(-)

