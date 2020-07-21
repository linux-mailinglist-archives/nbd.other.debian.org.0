Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7593B227F28
	for <lists+nbd@lfdr.de>; Tue, 21 Jul 2020 13:42:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5CD4420536; Tue, 21 Jul 2020 11:42:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul 21 11:42:09 2020
Old-Return-Path: <mlevitsk@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 80F9A203EF
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Jul 2020 11:24:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.821 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ClZv52mNcjaJ for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Jul 2020 11:24:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by bendel.debian.org (Postfix) with ESMTP id F1714203EE
	for <nbd@other.debian.org>; Tue, 21 Jul 2020 11:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595330650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a7FGaIHkD38JSVxPqaibb4DmZEBgCel4gb1OIq9hfcg=;
	b=W0NtuzS+dxbO45w4O4WLFq21a/kkLreQrmXwZdqvhvsl+WMId7D5PFqj1+r+OPLiPhhmE7
	48QwXlPGR9tstrr2kJcWJduWkqNb5oWcy+jmn73ldWltVIqnEx2wL/9b69mCU/l0aBqj6r
	1qihqcn9+RsCIHDdSpZ4W1G7FDFhZvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-ukSVL_ZBNG-8BMv4MWvP7A-1; Tue, 21 Jul 2020 06:53:12 -0400
X-MC-Unique: ukSVL_ZBNG-8BMv4MWvP7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26294100AA21;
	Tue, 21 Jul 2020 10:53:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.163])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCBC78730C;
	Tue, 21 Jul 2020 10:52:40 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Keith Busch <kbusch@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	linux-block@vger.kernel.org (open list:BLOCK LAYER),
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	linux-nvme@lists.infradead.org (open list:NVM EXPRESS DRIVER),
	linux-scsi@vger.kernel.org (open list:SCSI CDROM DRIVER),
	Tejun Heo <tj@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Jason Wang <jasowang@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Colin Ian King <colin.king@canonical.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Ajay Joshi <ajay.joshi@wdc.com>,
	Ming Lei <ming.lei@redhat.com>,
	linux-mmc@vger.kernel.org (open list:SONY MEMORYSTICK SUBSYSTEM),
	Christoph Hellwig <hch@lst.de>,
	Satya Tangirala <satyat@google.com>,
	nbd@other.debian.org (open list:NETWORK BLOCK DEVICE (NBD)),
	Hou Tao <houtao1@huawei.com>,
	Jens Axboe <axboe@fb.com>,
	virtualization@lists.linux-foundation.org (open list:VIRTIO CORE AND NET DRIVERS),
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Alex Dubov <oakad@yahoo.com>,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH 00/10] RFC: move logical block size checking to the block core
Date: Tue, 21 Jul 2020 13:52:29 +0300
Message-Id: <20200721105239.8270-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SA9ndLN_daP.A.g9H.RStFfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/920
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200721105239.8270-1-mlevitsk@redhat.com
Resent-Date: Tue, 21 Jul 2020 11:42:09 +0000 (UTC)

This patch series aims to move the logical block size checking to the=0D
block code.=0D
=0D
This was inspired by missing check for valid logical block size in=0D
virtio-blk which causes the kernel to crash in a weird way later on=0D
when it is invalid.=0D
=0D
I added blk_is_valid_logical_block_size which returns true iff the=0D
block size is one of supported sizes.=0D
=0D
I added this check to virtio-blk, and also converted  few block drivers=0D
that I am familiar with to use this interface instead of their=0D
own implementation.=0D
=0D
Best regards,=0D
	Maxim Levitsky=0D
=0D
Maxim Levitsky (10):=0D
  block: introduce blk_is_valid_logical_block_size=0D
  block: virtio-blk: check logical block size=0D
  block: loop: use blk_is_valid_logical_block_size=0D
  block: nbd: use blk_is_valid_logical_block_size=0D
  block: null: use blk_is_valid_logical_block_size=0D
  block: ms_block: use blk_is_valid_logical_block_size=0D
  block: mspro_blk: use blk_is_valid_logical_block_size=0D
  block: nvme: use blk_is_valid_logical_block_size=0D
  block: scsi: sd: use blk_is_valid_logical_block_size=0D
  block: scsi: sr: use blk_is_valid_logical_block_size=0D
=0D
 block/blk-settings.c                | 18 +++++++++++++++++=0D
 drivers/block/loop.c                | 23 +++++----------------=0D
 drivers/block/nbd.c                 | 12 ++---------=0D
 drivers/block/null_blk_main.c       |  6 +++---=0D
 drivers/block/virtio_blk.c          | 15 ++++++++++++--=0D
 drivers/memstick/core/ms_block.c    |  2 +-=0D
 drivers/memstick/core/mspro_block.c |  6 ++++++=0D
 drivers/nvme/host/core.c            | 17 ++++++++--------=0D
 drivers/scsi/sd.c                   |  5 +----=0D
 drivers/scsi/sr.c                   | 31 ++++++++++++-----------------=0D
 include/linux/blkdev.h              |  1 +=0D
 11 files changed, 71 insertions(+), 65 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

