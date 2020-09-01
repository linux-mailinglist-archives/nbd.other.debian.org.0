Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369B259761
	for <lists+nbd@lfdr.de>; Tue,  1 Sep 2020 18:15:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F190E20538; Tue,  1 Sep 2020 16:15:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  1 16:15:40 2020
Old-Return-Path: <BATV+00d723da4443b0556009+6218+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B72A3204F3
	for <lists-other-nbd@bendel.debian.org>; Tue,  1 Sep 2020 15:58:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.921 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
	MURPHY_DRUGS_REL8=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 63mI0pmF8tqt for <lists-other-nbd@bendel.debian.org>;
	Tue,  1 Sep 2020 15:58:09 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6C0EA2051E
	for <nbd@other.debian.org>; Tue,  1 Sep 2020 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=M79so1AwUwPIRouROFaNCg3KdKArTwMSMNd8wl3xC9I=; b=Fo1o7u6IVr6vurOMarEGQIw99y
	WHqyrdok/75XjmzAvs98wm2mZXYI8eGfVJCJLikO8fuOJu/9j6XvoFdlr1RTa038r8DDcHMqAU7lY
	mmSZLC/smn0SnolNwwxdyrpDJlJoZhG0K7MVmnl8ewTBrEYNYAPRaMnE4rjqCK7VlkM7JqAlUWyDU
	YkH9TJZ6yJEEibyeqV37+FBh0RkQQ6BwwzwRxyMvkU7/sD29/P1lImVmElLT8cbRAFklBxMxACP/P
	9Ptq9IU2Xfcl9fIpw/yp4N3MdH0FKE600v4IAuPUo366M4kD36FMV0WaYWth1qfPOYnF35tgpEEiP
	sE6GqZdg==;
Received: from [2001:4bb8:18c:45ba:2f95:e5:ca6b:9b4a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8fN-0004OS-MU; Tue, 01 Sep 2020 15:57:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Josef Bacik <josef@toxicpanda.com>,
	Dan Williams <dan.j.williams@intel.com>,
	dm-devel@redhat.com,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-raid@vger.kernel.org,
	linux-nvdimm@lists.01.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: remove revalidate_disk()
Date: Tue,  1 Sep 2020 17:57:39 +0200
Message-Id: <20200901155748.2884-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xO4MfGibMR.A.M0.sOnTfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/966
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200901155748.2884-1-hch@lst.de
Resent-Date: Tue,  1 Sep 2020 16:15:40 +0000 (UTC)

Hi Jens,

this series removes the revalidate_disk() function, which has been a
really odd duck in the last years.  The prime reason why most people
use it is because it propagates a size change from the gendisk to
the block_device structure.  But it also calls into the rather ill
defined ->revalidate_disk method which is rather useless for the
callers.  So this adds a new helper to just propagate the size, and
cleans up all kinds of mess around this area.  Follow on patches
will eventuall kill of ->revalidate_disk entirely, but ther are a lot
more patches needed for that.

Diffstat:
 Documentation/filesystems/locking.rst |    3 --
 block/genhd.c                         |    9 ++----
 drivers/block/nbd.c                   |    8 ++---
 drivers/block/rbd.c                   |    2 -
 drivers/block/rnbd/rnbd-clt.c         |   10 +------
 drivers/block/virtio_blk.c            |    2 -
 drivers/block/zram/zram_drv.c         |    4 +-
 drivers/md/dm-raid.c                  |    2 -
 drivers/md/md-cluster.c               |    6 ++--
 drivers/md/md-linear.c                |    2 -
 drivers/md/md.c                       |   10 +++----
 drivers/md/md.h                       |    2 -
 drivers/nvdimm/blk.c                  |    3 --
 drivers/nvdimm/btt.c                  |    3 --
 drivers/nvdimm/bus.c                  |    9 ++----
 drivers/nvdimm/nd.h                   |    2 -
 drivers/nvdimm/pmem.c                 |    3 --
 drivers/nvme/host/core.c              |   16 +++++++----
 drivers/scsi/sd.c                     |    6 ++--
 fs/block_dev.c                        |   46 ++++++++++++++++------------------
 include/linux/blk_types.h             |    4 ++
 include/linux/genhd.h                 |    6 ++--
 22 files changed, 74 insertions(+), 84 deletions(-)

