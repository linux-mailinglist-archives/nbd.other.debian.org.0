Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A35D1E9D0F
	for <lists+nbd@lfdr.de>; Mon,  1 Jun 2020 07:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 064782043E; Mon,  1 Jun 2020 05:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun  1 05:18:08 2020
Old-Return-Path: <dongli.zhang@oracle.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9DAA520430
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Jun 2020 05:01:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.481 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001, UNPARSEABLE_RELAY=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cLoQ3ZXnmUHP for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Jun 2020 05:01:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 13069 seconds by postgrey-1.36 at bendel; Mon, 01 Jun 2020 05:01:55 UTC
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "aserp2120.oracle.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A80D420425
	for <nbd@other.debian.org>; Mon,  1 Jun 2020 05:01:55 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0511GinO029800;
	Mon, 1 Jun 2020 01:24:00 GMT
Old-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=soZUl3/aG71B/k1/PkbJ+p5RT1UVgYuZaKnNxUhQBZQ=;
 b=cLUts0ESlycTaC43qJFEbYb8aatoCeqGpMO5URaI1Pj0xj2YblgyKW2pyn2M/npwP5Z8
 i2ctIYHGlfBzcTrCVKqFuA7d8E9uOA+FnRUI9icQwAGIAWedi1o188gUAz8pJR6YflRR
 ytCwN5cfFLfD8p7bllUq9mftkuROx2JXlb4/Bs901p4buqd/L8NMrOfbxiRVU4Uuvz2H
 PuG1cae4Guh56jxJhNZje2EviJ1ga5kQZ2AScRYy65ZaiKJd2SlQlIaPQRzKvF0WMk3y
 WkdZKqn5ugZ3dKsWgYCu3TCf7WcyNGg89QkzkQRTXjdPo06VTjfcWyBRHsb/yce8d1Ta jg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 31bfekv95q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 01 Jun 2020 01:24:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0511HwGX053015;
	Mon, 1 Jun 2020 01:23:59 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3020.oracle.com with ESMTP id 31c25h5dmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Jun 2020 01:23:59 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0511NuSp001716;
	Mon, 1 Jun 2020 01:23:58 GMT
Received: from localhost.localdomain (/10.211.9.80)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sun, 31 May 2020 18:23:56 -0700
From: Dongli Zhang <dongli.zhang@oracle.com>
To: nbd@other.debian.org, linux-block@vger.kernel.org
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] nbd: append module param and description following corresponding variables
Date: Sun, 31 May 2020 18:16:01 -0700
Message-Id: <20200601011602.29381-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200601011602.29381-1-dongli.zhang@oracle.com>
References: <20200601011602.29381-1-dongli.zhang@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9638 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=8 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006010008
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9638 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=8
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1011
 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006010008
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nB8G1tRu2jJ.A.P0C.Q-I1eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/894
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200601011602.29381-2-dongli.zhang@oracle.com
Resent-Date: Mon,  1 Jun 2020 05:18:09 +0000 (UTC)

A lot of drivers append the module parameter and its description following
the corresponding variables (e.g., 'g_submit_queues' in null or
'admin_timeout' in nvme).

This patch would do the same for 'nbds_max' and 'max_part' in nbd driver.
This makes it much more friendly to cscope when reading the code.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 drivers/block/nbd.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 43cff01a5a67..74c1363702f5 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -146,7 +146,13 @@ static struct dentry *nbd_dbg_dir;
 #define NBD_DEF_BLKSIZE 1024
 
 static unsigned int nbds_max = 16;
+module_param(nbds_max, int, 0444);
+MODULE_PARM_DESC(nbds_max, "number of network block devices to initialize (default: 16)");
+
 static int max_part = 16;
+module_param(max_part, int, 0444);
+MODULE_PARM_DESC(max_part, "number of partitions per device (default: 16)");
+
 static int part_shift;
 
 static int nbd_dev_dbg_init(struct nbd_device *nbd);
@@ -2444,8 +2450,3 @@ module_exit(nbd_cleanup);
 
 MODULE_DESCRIPTION("Network Block Device");
 MODULE_LICENSE("GPL");
-
-module_param(nbds_max, int, 0444);
-MODULE_PARM_DESC(nbds_max, "number of network block devices to initialize (default: 16)");
-module_param(max_part, int, 0444);
-MODULE_PARM_DESC(max_part, "number of partitions per device (default: 16)");
-- 
2.17.1

