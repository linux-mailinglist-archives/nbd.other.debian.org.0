Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EDC1E9CC3
	for <lists+nbd@lfdr.de>; Mon,  1 Jun 2020 06:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 43F2E2034D; Mon,  1 Jun 2020 04:45:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun  1 04:45:10 2020
Old-Return-Path: <dongli.zhang@oracle.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0815B20402
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Jun 2020 04:28:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.481 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001, UNPARSEABLE_RELAY=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GzNgA--bZzlV for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Jun 2020 04:28:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "userp2130.oracle.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3382C203FC
	for <nbd@other.debian.org>; Mon,  1 Jun 2020 04:28:31 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0511IC0j057545;
	Mon, 1 Jun 2020 01:24:02 GMT
Old-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=td7ltNIq9vnxMbVKRde7yqiRKFmy/LqJyJcn1ndS+kU=;
 b=n8Ab3XgMlCN6B4OyOhMv0j4wIs84quvD88iDTc41qoZAEA+OGw1EXKMZQlGkHDuagdTr
 ETY3B5q5eB/WpSHJ7q7zBTtrthHVRYz4Oq/S7249Uxpps9ctVtEzJN4FfXoKoabSCSu1
 cXRSS9RKUdkcggyFCmeQUweYO+Vq7v7tBm9D/eYG0ZcLsjoruAVA7SKmYuaMionHFzo5
 demGW9a+0wublKjJ0oFAL6F9V9osMaRj0+QHEjyMuQ2wZKxR2opUt1igKmvM8dO2wGXd
 cZDfi458VXWIqd/2WYgSpxkjmR5SEYN1FHlvWGMUbSArDOFb6qPvDFKmuZg4cN0JPCP8 Bg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 31bewqmbsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 01 Jun 2020 01:24:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0511HsR8042839;
	Mon, 1 Jun 2020 01:24:01 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 31c18qq0mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Jun 2020 01:24:01 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0511NufU003986;
	Mon, 1 Jun 2020 01:23:58 GMT
Received: from localhost.localdomain (/10.211.9.80)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sun, 31 May 2020 18:23:56 -0700
From: Dongli Zhang <dongli.zhang@oracle.com>
To: nbd@other.debian.org, linux-block@vger.kernel.org
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] nbd: remove unused 'NBD_MAGIC'
Date: Sun, 31 May 2020 18:16:02 -0700
Message-Id: <20200601011602.29381-3-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200601011602.29381-1-dongli.zhang@oracle.com>
References: <20200601011602.29381-1-dongli.zhang@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9638 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=8 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006010008
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9638 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=8 impostorscore=0 cotscore=-2147483648
 lowpriorityscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006010008
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eWPHuJDnlzE.A.APB.WfI1eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/893
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200601011602.29381-3-dongli.zhang@oracle.com
Resent-Date: Mon,  1 Jun 2020 04:45:10 +0000 (UTC)

Remove 'NBD_MAGIC' as it is not used since commit 5ea8d10802ec ("nbd:
separate out the config information").

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 drivers/block/nbd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 74c1363702f5..83435ce141a8 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -141,8 +141,6 @@ static struct dentry *nbd_dbg_dir;
 
 #define nbd_name(nbd) ((nbd)->disk->disk_name)
 
-#define NBD_MAGIC 0x68797548
-
 #define NBD_DEF_BLKSIZE 1024
 
 static unsigned int nbds_max = 16;
-- 
2.17.1

