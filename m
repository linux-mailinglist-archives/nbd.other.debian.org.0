Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A598D2CAF
	for <lists+nbd@lfdr.de>; Wed, 29 May 2024 07:42:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 96E00204E7; Wed, 29 May 2024 05:42:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 29 05:42:32 2024
Old-Return-Path: <BATV+c55c297d46ee5715703b+7584+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A2E5F20470
	for <lists-other-nbd@bendel.debian.org>; Wed, 29 May 2024 05:25:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=1,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Fw740bYKh9Ip for <lists-other-nbd@bendel.debian.org>;
	Wed, 29 May 2024 05:25:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0D12F2042E
	for <nbd@other.debian.org>; Wed, 29 May 2024 05:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=TkLi7QJRJk+eDm0XKX9y4O+chg+2e2GHQobCf0qIp3Q=; b=j6TH1jV+bD9SRCoTjPn2/w5mPx
	Sn9ZORQd/0Vc8GCHMbe57GctL2xLaw94IPMXbiJcX95T1JOMiz6/rTaTDfBNMHzt2nFlgKG30WzoF
	dIAc0Wxprcex1TUAE9kVEamco0ms0NAnDTyHDmkwxAjOMGcnTzwA/qjowsfaaOxk+Q7ohP80n6DFh
	v0tR+RqojdE8wkTeuKbpKCEu64xWSJW+O63gy+h/ERmksEVT5Z+j3VJtipRNQyIKdFcIPJifoT7Lc
	JNKkuNwua/4XXVb82UFUzCKKgQOn1LTgSY21EVqNBDHbXJZj6E9u2XVKVoPDNoZ/0QiJ/ZgSUMdps
	IHDNZnvQ==;
Received: from 2a02-8389-2341-5b80-7775-b725-99f7-3344.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:7775:b725:99f7:3344] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCBUs-00000002pSJ-2CVr;
	Wed, 29 May 2024 05:05:11 +0000
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
Subject: convert the SCSI ULDs to the atomic queue limits API
Date: Wed, 29 May 2024 07:04:02 +0200
Message-ID: <20240529050507.1392041-1-hch@lst.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UOPs6Yvvso.A.WsvN.IBsVmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2826
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240529050507.1392041-1-hch@lst.de
Resent-Date: Wed, 29 May 2024 05:42:32 +0000 (UTC)

Hi all,

this series converts the SCSI upper level drivers to the atomic queue
limits API.

The first patch is a bug fix for ubd that later patches depend on and
might be worth picking up for 6.10.

The second patch changes the max_sectors calculation to take the optimal
I/O size into account so that sd, nbd and rbd don't have to mess with
the user max_sector value.  I'd love to see a careful review from the
nbd and rbd maintainers for this one!

The following patches clean up a few lose ends in the sd driver, and
then convert sd and sr to the atomic queue limits API.  The final
patches remove the now unused block APIs, and convert a few to be
specific to their now more narrow use case.

The patches are against Jens' block-6.10 tree.  Due to the amount of
block layer changes in here, and other that will depend on it, it
would be good if this could eventually be merged through the block
tree, or at least a shared branch between the SCSI and block trees.

Diffstat:
 arch/um/drivers/ubd_kern.c   |   10 +
 block/blk-settings.c         |  238 +------------------------------------------
 drivers/block/nbd.c          |    2 
 drivers/block/rbd.c          |    1 
 drivers/block/xen-blkfront.c |    4 
 drivers/scsi/sd.c            |  218 ++++++++++++++++++++-------------------
 drivers/scsi/sd.h            |    6 -
 drivers/scsi/sd_zbc.c        |   27 ++--
 drivers/scsi/sr.c            |   42 ++++---
 include/linux/blkdev.h       |   40 +++----
 10 files changed, 196 insertions(+), 392 deletions(-)

