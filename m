Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EF155BF93
	for <lists+nbd@lfdr.de>; Tue, 28 Jun 2022 10:45:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4A47C20526; Tue, 28 Jun 2022 08:45:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 28 08:45:11 2022
Old-Return-Path: <john.garry@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	FOURLA,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7C53720521
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 Jun 2022 08:27:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.408 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 80sMpL4glVw4 for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 Jun 2022 08:27:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .frasgout.his.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D19282051F
	for <nbd@other.debian.org>; Tue, 28 Jun 2022 08:27:40 +0000 (UTC)
Received: from fraeml707-chm.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LXHkl0stbz6GDGM;
	Tue, 28 Jun 2022 16:26:55 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml707-chm.china.huawei.com (10.206.15.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 28 Jun 2022 10:27:37 +0200
Received: from [10.126.174.22] (10.126.174.22) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 28 Jun 2022 09:27:36 +0100
Message-ID: <b530d4ac-2d7b-0989-c5da-6b6351a0a68f@huawei.com>
Date: Tue, 28 Jun 2022 09:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 0/6] blk-mq: Add a flag for reserved requests series
To: <axboe@kernel.dk>
CC: <linux-doc@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-nvme@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
	<mpi3mr-linuxdrv.pdl@broadcom.com>, <linux-block@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <nbd@other.debian.org>,
	<damien.lemoal@opensource.wdc.com>, <jejb@linux.ibm.com>, <hch@lst.de>,
	<martin.petersen@oracle.com>, <kartilak@cisco.com>, <bvanassche@acm.org>,
	<satishkh@cisco.com>, <hare@suse.de>, <sebaddel@cisco.com>
References: <1655810143-67784-1-git-send-email-john.garry@huawei.com>
From: John Garry <john.garry@huawei.com>
In-Reply-To: <1655810143-67784-1-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.174.22]
X-ClientProxiedBy: lhreml726-chm.china.huawei.com (10.201.108.77) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fuW1Cw9OejO.A.3XG.X-ruiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2182
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b530d4ac-2d7b-0989-c5da-6b6351a0a68f@huawei.com
Resent-Date: Tue, 28 Jun 2022 08:45:11 +0000 (UTC)

On 21/06/2022 12:15, John Garry wrote:

Hi Jens,

about this series, would you be ok to pick this up for merging? Do you 
find the changes acceptable?

Thanks,
John

> In [0] I included "blk-mq: Add a flag for reserved requests" to identify
> if a request is 'reserved' for special handling. Doing this is easier than
> passing a 'reserved' arg to the blk_mq_ops callbacks. Indeed, only 1x
> timeout implementation or blk-mq iter function actually uses the
> 'reserved' arg (or 3x if you count SCSI core and FNIC SCSI driver). So
> this series drops the 'reserved' arg for these timeout and iter functions.
> Christoph suggested that I try to upstream now.
> 
> Differences to v1:
> - Use "scsi_timeout" as name for SCSI timeout function and update docs
> - Add RB tags (thanks!)
> - Split out patch to drop local variables for 'reserved', as requested by
>    Bart
> 
> Based on following:
> 6dbcddf6e76b (block/for-5.20/block) block: bfq: Fix kernel-doc headers
> 
> [0] https://lore.kernel.org/linux-scsi/1654770559-101375-1-git-send-email-john.garry@huawei.com/T/#m22aa9f89e55835edc2e650d43f7e3219a3a1a324
> 
> John Garry (6):
>    scsi: core: Remove reserved request time-out handling
>    blk-mq: Add a flag for reserved requests
>    blk-mq: Drop blk_mq_ops.timeout 'reserved' arg
>    scsi: fnic: Drop reserved request handling
>    blk-mq: Drop 'reserved' arg of busy_tag_iter_fn
>    blk-mq: Drop local variable for reserved tag
> 
>   Documentation/scsi/scsi_eh.rst          |  3 +--
>   Documentation/scsi/scsi_mid_low_api.rst |  2 +-
>   block/blk-mq-debugfs.c                  |  2 +-
>   block/blk-mq-tag.c                      | 13 +++++--------
>   block/blk-mq.c                          | 22 +++++++++++++---------
>   block/bsg-lib.c                         |  2 +-
>   drivers/block/mtip32xx/mtip32xx.c       | 11 +++++------
>   drivers/block/nbd.c                     |  5 ++---
>   drivers/block/null_blk/main.c           |  2 +-
>   drivers/infiniband/ulp/srp/ib_srp.c     |  3 +--
>   drivers/mmc/core/queue.c                |  3 +--
>   drivers/nvme/host/apple.c               |  3 +--
>   drivers/nvme/host/core.c                |  2 +-
>   drivers/nvme/host/fc.c                  |  6 ++----
>   drivers/nvme/host/nvme.h                |  2 +-
>   drivers/nvme/host/pci.c                 |  2 +-
>   drivers/nvme/host/rdma.c                |  3 +--
>   drivers/nvme/host/tcp.c                 |  3 +--
>   drivers/s390/block/dasd.c               |  2 +-
>   drivers/s390/block/dasd_int.h           |  2 +-
>   drivers/scsi/aacraid/comminit.c         |  2 +-
>   drivers/scsi/aacraid/linit.c            |  2 +-
>   drivers/scsi/fnic/fnic_scsi.c           | 14 ++++----------
>   drivers/scsi/hosts.c                    | 14 ++++++--------
>   drivers/scsi/mpi3mr/mpi3mr_os.c         | 16 ++++------------
>   drivers/scsi/scsi_error.c               |  6 +++---
>   drivers/scsi/scsi_lib.c                 |  8 --------
>   drivers/scsi/scsi_priv.h                |  2 +-
>   include/linux/blk-mq.h                  | 10 ++++++++--
>   include/scsi/scsi_host.h                |  2 +-
>   30 files changed, 71 insertions(+), 98 deletions(-)
> 

