Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9A9568844
	for <lists+nbd@lfdr.de>; Wed,  6 Jul 2022 14:27:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 32D1D2047D; Wed,  6 Jul 2022 12:27:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul  6 12:27:11 2022
Old-Return-Path: <john.garry@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	FOURLA,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,TO_TOO_MANY,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A316620479
	for <lists-other-nbd@bendel.debian.org>; Wed,  6 Jul 2022 12:11:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.409 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id g9I2-3Z-rrfj for <lists-other-nbd@bendel.debian.org>;
	Wed,  6 Jul 2022 12:11:00 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .frasgout.his.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 59A2220476
	for <nbd@other.debian.org>; Wed,  6 Jul 2022 12:10:58 +0000 (UTC)
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LdJJF2PH9z6GDCP;
	Wed,  6 Jul 2022 20:09:49 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 6 Jul 2022 14:10:54 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 6 Jul 2022 13:10:48 +0100
From: John Garry <john.garry@huawei.com>
To: <axboe@kernel.dk>, <damien.lemoal@opensource.wdc.com>,
	<bvanassche@acm.org>, <hch@lst.de>, <jejb@linux.ibm.com>,
	<martin.petersen@oracle.com>, <hare@suse.de>, <satishkh@cisco.com>,
	<sebaddel@cisco.com>, <kartilak@cisco.com>
CC: <linux-doc@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-nvme@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
	<mpi3mr-linuxdrv.pdl@broadcom.com>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <nbd@other.debian.org>, John Garry
	<john.garry@huawei.com>
Subject: [PATCH v3 0/6] blk-mq: Add a flag for reserved requests series
Date: Wed, 6 Jul 2022 20:03:48 +0800
Message-ID: <1657109034-206040-1-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8Aq9xSP8ZFE.A.-jB.f-XxiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2186
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1657109034-206040-1-git-send-email-john.garry@huawei.com
Resent-Date: Wed,  6 Jul 2022 12:27:11 +0000 (UTC)

Hi Jens,

Can you please consider this series? Thanks

---

In [0] I included "blk-mq: Add a flag for reserved requests" to identify
if a request is 'reserved' for special handling. Doing this is easier than
passing a 'reserved' arg to the blk_mq_ops callbacks. Indeed, only 1x
timeout implementation or blk-mq iter function actually uses the
'reserved' arg (or 3x if you count SCSI core and FNIC SCSI driver). So
this series drops the 'reserved' arg for these timeout and iter functions.
Christoph suggested that I try to upstream now.

Differences to v2:
- Rebase
- Apply more RB tags (thanks!)

Differences to v1:
- Use "scsi_timeout" as name for SCSI timeout function and update docs
- Add RB tags (thanks!)
- Split out patch to drop local variables for 'reserved', as requested by
  Bart

Based on following:
e55cf7981405 (block/for-5.20/block) blk-cgroup: factor out blkcg_free_all_cpd()

[0] https://lore.kernel.org/linux-scsi/1654770559-101375-1-git-send-email-john.garry@huawei.com/T/#m22aa9f89e55835edc2e650d43f7e3219a3a1a324

John Garry (6):
  scsi: core: Remove reserved request time-out handling
  blk-mq: Add a flag for reserved requests
  blk-mq: Drop blk_mq_ops.timeout 'reserved' arg
  scsi: fnic: Drop reserved request handling
  blk-mq: Drop 'reserved' arg of busy_tag_iter_fn
  blk-mq: Drop local variable for reserved tag

 Documentation/scsi/scsi_eh.rst          |  3 +--
 Documentation/scsi/scsi_mid_low_api.rst |  2 +-
 block/blk-mq-debugfs.c                  |  2 +-
 block/blk-mq-tag.c                      | 13 +++++--------
 block/blk-mq.c                          | 22 +++++++++++++---------
 block/bsg-lib.c                         |  2 +-
 drivers/block/mtip32xx/mtip32xx.c       |  9 ++++-----
 drivers/block/nbd.c                     |  5 ++---
 drivers/block/null_blk/main.c           |  2 +-
 drivers/infiniband/ulp/srp/ib_srp.c     |  3 +--
 drivers/mmc/core/queue.c                |  3 +--
 drivers/nvme/host/apple.c               |  3 +--
 drivers/nvme/host/core.c                |  2 +-
 drivers/nvme/host/fc.c                  |  6 ++----
 drivers/nvme/host/nvme.h                |  2 +-
 drivers/nvme/host/pci.c                 |  2 +-
 drivers/nvme/host/rdma.c                |  3 +--
 drivers/nvme/host/tcp.c                 |  3 +--
 drivers/s390/block/dasd.c               |  2 +-
 drivers/s390/block/dasd_int.h           |  2 +-
 drivers/scsi/aacraid/comminit.c         |  2 +-
 drivers/scsi/aacraid/linit.c            |  2 +-
 drivers/scsi/fnic/fnic_scsi.c           | 14 ++++----------
 drivers/scsi/hosts.c                    | 14 ++++++--------
 drivers/scsi/mpi3mr/mpi3mr_os.c         | 16 ++++------------
 drivers/scsi/scsi_error.c               |  6 +++---
 drivers/scsi/scsi_lib.c                 |  8 --------
 drivers/scsi/scsi_priv.h                |  2 +-
 include/linux/blk-mq.h                  | 10 ++++++++--
 include/scsi/scsi_host.h                |  2 +-
 30 files changed, 70 insertions(+), 97 deletions(-)

-- 
2.35.3

