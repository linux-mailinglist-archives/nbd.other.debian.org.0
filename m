Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F6A778BF7
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 12:25:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3BD7720615; Fri, 11 Aug 2023 10:25:00 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 10:25:00 2023
Old-Return-Path: <BATV+10530082ca17b6f7899b+7292+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=4.0 tests=ATTENDEES_DBSPAM_BODY7,
	CC_TOO_MANY,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FOURLA,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BC16F2063C
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:09:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.051 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY7=1, BAYES_00=-2, CC_TOO_MANY=3,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id No6Ei2HcKlXL for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:08:52 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id EC30820613
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=hcbvw/RfBq8JHr30xw9G1Ra3s1wKjT/PtsrPUt7GxO0=; b=lu2+QOoKycflUw3sVvBPND/Cj+
	XTbtxhvdxSyGd5ObrfLgXyuf/MlGn3ic0Qeo3NkdDwkW0THLSAQ70FV9T9f7YlkbHYP4MCZBFz5n0
	LJrhRWNiAMuS6BRWdZHHKc5kvZ19+oSA3ubIyV1NgGhs4yy2lQDw2rXNQSJaonRC/dXJHLmY0ZAPa
	Cz3D/MCTrgZY+3NHmytpoiir3/bEV47uqe5Sp0fFYjsWXp6K/C/CIAZZnz2oIz+eVtJ+eleP+gvk/
	c1QD0c1cBmOfoGQPBXwN/zqxR67IkgXLVZYAj+cOMmuh4oTvvCSmRZ9GQGltc3k3csGhK5qdPUxnq
	9MblYUNA==;
Received: from [88.128.92.63] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP4I-00A5Xm-25;
	Fri, 11 Aug 2023 10:08:31 +0000
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
Subject: remove get_super
Date: Fri, 11 Aug 2023 12:08:11 +0200
Message-Id: <20230811100828.1897174-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <e5ObF00cpNK.A.hj.8xg1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2600
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811100828.1897174-1-hch@lst.de
Resent-Date: Fri, 11 Aug 2023 10:25:00 +0000 (UTC)

Hi all,

this series against the VFS vfs.super branch finishes off the work to remove
get_super and move (almost) all upcalls to use the holder ops.

The first part is the missing btrfs bits so that all file systems use the
super_block as holder.

The second part is various block driver cleanups so that we use proper
interfaces instead of raw calls to __invalidate_device and fsync_bdev.

The last part than replaces __invalidate_device and fsync_bdev with upcalls
to the file system through the holder ops, and finally removes get_super.

It leaves user_get_super and get_active_super around.  The former is not
used for upcalls in the traditional sense, but for legacy UAPI that for
some weird reason take a dev_t argument (ustat) or a block device path
(quotactl).  get_active_super is only used for calling into the file system
on freeze and should get a similar treatment, but given that Darrick has
changes to that code queued up already this will be handled in the next
merge window.

A git tree is available here:

    git://git.infradead.org/users/hch/misc.git remove-get_super

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/remove-get_super

Diffstat:
 block/bdev.c              |   61 ++++++++++++++++++++-------------------------
 block/disk-events.c       |   23 ++++-------------
 block/genhd.c             |   45 +++++++++++++++++----------------
 block/ioctl.c             |    9 +++++-
 block/partitions/core.c   |    5 ---
 drivers/block/amiflop.c   |    1 
 drivers/block/floppy.c    |    2 -
 drivers/block/loop.c      |    6 ++--
 drivers/block/nbd.c       |    8 ++---
 drivers/s390/block/dasd.c |    7 +----
 fs/btrfs/disk-io.c        |    4 +-
 fs/btrfs/super.c          |   59 ++++++++++++++++++++++---------------------
 fs/btrfs/volumes.c        |   58 ++++++++++++++++++++++---------------------
 fs/btrfs/volumes.h        |    8 +++--
 fs/inode.c                |   16 +----------
 fs/internal.h             |    2 -
 fs/super.c                |   62 +++++++++++++++-------------------------------
 include/linux/blkdev.h    |   13 +++++----
 include/linux/fs.h        |    1 
 19 files changed, 175 insertions(+), 215 deletions(-)

