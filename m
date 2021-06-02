Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 94963398303
	for <lists+nbd@lfdr.de>; Wed,  2 Jun 2021 09:30:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6502A206E2; Wed,  2 Jun 2021 07:30:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  2 07:30:56 2021
Old-Return-Path: <BATV+e38fb55258da4e18a096+6492+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MONOTONE_WORDS_2_15,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 334FD20621
	for <lists-other-nbd@bendel.debian.org>; Wed,  2 Jun 2021 07:15:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.15 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MONOTONE_WORDS_2_15=1, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Tb2tR1drEXjv for <lists-other-nbd@bendel.debian.org>;
	Wed,  2 Jun 2021 07:15:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 76F0A2060A
	for <nbd@other.debian.org>; Wed,  2 Jun 2021 07:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=GNz/Hu0V5gogSB4co5eOK6xP1gnr1qh2/gA3KL3Dtxg=; b=BI35MypsV5ujI5j9LOM8ffKO3O
	PPR2xJ+smyVf1yBqrB22os7cElpqLd6BGSF+LAFux1FWghPPtYUh71lumcyGTaH+GySHaNY4TdhS/
	AV4vc/JIVMat63n8MdcbvA03bNT/GrAfqDiF7ptTNcphdfH4Gmp4s374edZksMq4302Y5G3rKEHTv
	zkjAvx0fvVtUm2B/6XY5TSPrkqQmnos5aAqRHBWaQFtoEeGLkMCCmRvVNoipNM5EQcjvqqNXgrxv+
	Uv5yjt1xCW0uwaWbb4vvYLNz6VSHAG5NmTU3avE4Jh6rqZRN77aCtw5TtcxU3fh9zr5QCwFWGydth
	c/21yB+g==;
Received: from shol69.static.otenet.gr ([83.235.170.67] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loKlB-0025F3-IY; Wed, 02 Jun 2021 06:53:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Tim Waugh <tim@cyberelk.net>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: simplify gendisk and request_queue allocation for blk-mq based drivers
Date: Wed,  2 Jun 2021 09:53:15 +0300
Message-Id: <20210602065345.355274-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8MTeKMM1jMP.A.FDH.wOztgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1175
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210602065345.355274-1-hch@lst.de
Resent-Date: Wed,  2 Jun 2021 07:30:56 +0000 (UTC)

Hi all,

this series is the scond part of cleaning up lifetimes and allocation of
the gendisk and request_queue structure.  It adds a new interface to
allocate the disk and queue together for blk based drivers, and uses that
in all drivers that do not have any caveats in their gendisk and
request_queue lifetime rules.

Diffstat:
 block/blk-mq.c                      |   91 +++++++++++++++-------------------
 block/blk.h                         |    1 
 block/elevator.c                    |    2 
 drivers/block/amiflop.c             |   16 +-----
 drivers/block/aoe/aoeblk.c          |   33 ++++--------
 drivers/block/aoe/aoedev.c          |    3 -
 drivers/block/ataflop.c             |   16 +-----
 drivers/block/floppy.c              |   20 +------
 drivers/block/loop.c                |   19 ++-----
 drivers/block/nbd.c                 |   53 +++++++------------
 drivers/block/null_blk/main.c       |   11 +---
 drivers/block/paride/pcd.c          |   19 +++----
 drivers/block/paride/pd.c           |   30 ++++-------
 drivers/block/paride/pf.c           |   18 ++----
 drivers/block/ps3disk.c             |   36 +++++--------
 drivers/block/rbd.c                 |   52 ++++++-------------
 drivers/block/rnbd/rnbd-clt.c       |   35 +++----------
 drivers/block/sunvdc.c              |   47 ++++-------------
 drivers/block/swim.c                |   34 +++++-------
 drivers/block/swim3.c               |   33 +++++-------
 drivers/block/sx8.c                 |   23 ++------
 drivers/block/virtio_blk.c          |   26 ++-------
 drivers/block/xen-blkfront.c        |   96 ++++++++++++++----------------------
 drivers/block/z2ram.c               |   15 +----
 drivers/cdrom/gdrom.c               |   45 +++++++---------
 drivers/md/dm-rq.c                  |    9 +--
 drivers/memstick/core/ms_block.c    |   25 +++------
 drivers/memstick/core/mspro_block.c |   26 ++++-----
 drivers/mtd/mtd_blkdevs.c           |   48 ++++++++----------
 drivers/mtd/ubi/block.c             |   68 ++++++++++---------------
 drivers/s390/block/scm_blk.c        |   21 ++-----
 include/linux/blk-mq.h              |   24 ++++++---
 include/linux/elevator.h            |    1 
 33 files changed, 386 insertions(+), 610 deletions(-)

