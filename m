Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2CE54F6C6
	for <lists+nbd@lfdr.de>; Fri, 17 Jun 2022 13:36:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5E8B62060E; Fri, 17 Jun 2022 11:36:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 17 11:36:10 2022
Old-Return-Path: <john.garry@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,TO_TOO_MANY,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3578B205F9
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jun 2022 11:20:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.591 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id M4G5MMLJXnm7 for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jun 2022 11:20:17 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 1119 seconds by postgrey-1.36 at bendel; Fri, 17 Jun 2022 11:20:17 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A4D06205F4
	for <nbd@other.debian.org>; Fri, 17 Jun 2022 11:20:17 +0000 (UTC)
Received: from fraeml709-chm.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LPbhN2m9Xz689Q8;
	Fri, 17 Jun 2022 19:01:40 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml709-chm.china.huawei.com (10.206.15.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 13:01:51 +0200
Received: from localhost.localdomain (10.69.192.58) by
 lhreml724-chm.china.huawei.com (10.201.108.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 17 Jun 2022 12:01:47 +0100
From: John Garry <john.garry@huawei.com>
To: <axboe@kernel.dk>, <damien.lemoal@opensource.wdc.com>,
	<bvanassche@acm.org>, <hch@lst.de>, <jejb@linux.ibm.com>,
	<martin.petersen@oracle.com>, <hare@suse.de>, <satishkh@cisco.com>,
	<sebaddel@cisco.com>, <kartilak@cisco.com>
CC: <linux-rdma@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-nvme@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <mpi3mr-linuxdrv.pdl@broadcom.com>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, John Garry <john.garry@huawei.com>
Subject: [PATCH 4/5] scsi: fnic: Drop reserved request handling
Date: Fri, 17 Jun 2022 18:55:19 +0800
Message-ID: <1655463320-241202-5-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1655463320-241202-1-git-send-email-john.garry@huawei.com>
References: <1655463320-241202-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Yj16nbs-4XJ.A.uIH.qcGriB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2147
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1655463320-241202-5-git-send-email-john.garry@huawei.com
Resent-Date: Fri, 17 Jun 2022 11:36:10 +0000 (UTC)

The SCSI core code does not support reserved requests, so drop the
handling in fnic_pending_aborts_iter().

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/scsi/fnic/fnic_scsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/fnic/fnic_scsi.c b/drivers/scsi/fnic/fnic_scsi.c
index 3d64877bda8d..e7b7f6d73429 100644
--- a/drivers/scsi/fnic/fnic_scsi.c
+++ b/drivers/scsi/fnic/fnic_scsi.c
@@ -2019,8 +2019,6 @@ static bool fnic_pending_aborts_iter(struct scsi_cmnd *sc,
 
 	if (sc == iter_data->lr_sc || sc->device != lun_dev)
 		return true;
-	if (reserved)
-		return true;
 
 	io_lock = fnic_io_lock_tag(fnic, abt_tag);
 	spin_lock_irqsave(io_lock, flags);
-- 
2.35.3

