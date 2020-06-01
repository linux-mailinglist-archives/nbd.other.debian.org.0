Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 186421E9BF3
	for <lists+nbd@lfdr.de>; Mon,  1 Jun 2020 05:06:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D157E203D8; Mon,  1 Jun 2020 03:06:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun  1 03:06:16 2020
Old-Return-Path: <dongli.zhang@oracle.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6744C20301
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Jun 2020 02:50:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.481 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001, UNPARSEABLE_RELAY=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tSjtxhLDwB23 for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Jun 2020 02:50:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 5154 seconds by postgrey-1.36 at bendel; Mon, 01 Jun 2020 02:50:00 UTC
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "userp2130.oracle.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9CCAD2038E
	for <nbd@other.debian.org>; Mon,  1 Jun 2020 02:50:00 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0511HouB057042;
	Mon, 1 Jun 2020 01:24:00 GMT
Old-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=df8qxLo7s+iLAVcbs65NCApHg9ADlNh/I0GX/uRW+eI=;
 b=pY5x/RXVVNt/3US/CmrlZMKV/GkgG9W4bqW4XZMpyT14AitvkkbNWiN5KAkdHDj/NY6z
 EeEHCGHoRiHQYzrD8ZesWu3nSj/8dkSz2iZlVSfG1NxEly5uLX2qS8dze/bE/v7l3s1T
 DfGpwd3bijJvUV+E+uAv2fsLLJmnwspQv01mfhDbKIEViRX+4pbNL/jHxuxBU7khJMjP
 hT3em+FRE8XgkOMS3U7H0lq98S12obb5ciuUGP3rIOsliUjRB/v3fn9IjT1HIIJUwpNO
 pwAiuRNO8Dnjxhle0e8vcvtdGlZG0eN3Jm4t0WR6xTmI7CDIww6rnYoNJEGVzsPx/cCk 7Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 31bewqmbst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 01 Jun 2020 01:24:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0511I068053043;
	Mon, 1 Jun 2020 01:23:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 31c25h5dmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Jun 2020 01:23:59 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0511NuWd004187;
	Mon, 1 Jun 2020 01:23:58 GMT
Received: from localhost.localdomain (/10.211.9.80)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sun, 31 May 2020 18:23:56 -0700
From: Dongli Zhang <dongli.zhang@oracle.com>
To: nbd@other.debian.org, linux-block@vger.kernel.org
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] nbd: two cleanup
Date: Sun, 31 May 2020 18:16:00 -0700
Message-Id: <20200601011602.29381-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9638 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=8 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=729
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006010008
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9638 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=8 impostorscore=0 cotscore=-2147483648
 lowpriorityscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=749
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006010008
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yriA2knrA7O.A.hIH.oCH1eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/892
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200601011602.29381-1-dongli.zhang@oracle.com
Resent-Date: Mon,  1 Jun 2020 03:06:16 +0000 (UTC)

This is just cleanup without functional change.

Thank you very much!

Dongli Zhang


