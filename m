Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EBA3EFE5A
	for <lists+nbd@lfdr.de>; Wed, 18 Aug 2021 09:57:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8223A206D3; Wed, 18 Aug 2021 07:57:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 18 07:57:09 2021
Old-Return-Path: <svens@linux.ibm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6F8E12042D
	for <lists-other-nbd@bendel.debian.org>; Wed, 18 Aug 2021 07:39:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.998 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ax7wsX5__vAa for <lists-other-nbd@bendel.debian.org>;
	Wed, 18 Aug 2021 07:39:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1732 seconds by postgrey-1.36 at bendel; Wed, 18 Aug 2021 07:39:54 UTC
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.pphosted.com", Issuer "Sectigo RSA Organization Validation Secure Server CA" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3AC7B2041B
	for <nbd@other.debian.org>; Wed, 18 Aug 2021 07:39:53 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17I72rDM093572;
	Wed, 18 Aug 2021 03:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=pp1;
 bh=L0vxKEKnFdjT0PFFXXbL0rEcpKZsocQxC6g3pFNdD+4=;
 b=LyyrBXfO+y7+kSv2gTrNIQ5+o4D1c9sVDND3UNRb/3WCOJ6UMNePr4ofxkHTiwhDg2IF
 fyVmT7enkGcgGSmr18cSafzRU570dj7wNXpZN/FXy0ZpVKAnCktvCE5Fmby1SD0Q+mgE
 /1uHxL8T03NCjqkyzmsM8Mwh9y0E/imD0XVAQmQ894xFePC84l8iYegMqNpzl1qYoIyN
 vMz2g5suD5IyQ8tdYD5qKL0WWGZ0d18KLY80IVgg7m9fgWweaW9p//7Re52xf/yprMg8
 6HT3qOnZ+4zgrTPzeU4mCsBoQQmOgR3hMQD+2H76eXhyuwlqP0rrpLUeVY+NkS4XMl+W YA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3agcsqv3hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Aug 2021 03:10:56 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17I730Dw024522;
	Wed, 18 Aug 2021 07:10:54 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3ae5f8e2wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Aug 2021 07:10:54 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 17I77OYE57278750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Aug 2021 07:07:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 232254C05E;
	Wed, 18 Aug 2021 07:10:51 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A3B224C06D;
	Wed, 18 Aug 2021 07:10:50 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Wed, 18 Aug 2021 07:10:50 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
        nbd@other.debian.org, linux-kernel@vger.kernel.org
Subject: WARNING: possible circular locking dependency detected in nbd
Date: Wed, 18 Aug 2021 09:10:49 +0200
Message-ID: <yt9dsfz7xm6e.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _PGIRfK6yZgtOxdwiL49GLVLz7FxUHr7
X-Proofpoint-GUID: _PGIRfK6yZgtOxdwiL49GLVLz7FxUHr7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-18_02:2021-08-17,2021-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=767 mlxscore=0
 clxscore=1011 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108180045
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-qNgRQLaElH.A.xdD.V1LHhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1300
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/yt9dsfz7xm6e.fsf@linux.ibm.com
Resent-Date: Wed, 18 Aug 2021 07:57:09 +0000 (UTC)

Hi,

i'm seeing the lockdep splat below in CI. I think this is because
nbd_open is called with disk->open_mutex held, and acquires
nbd_index_mutex. However, nbd_put() first takes the nbd_index_lock,
and calls del_gendisk, which locks disk->open_mutex, so the order is
reversed.

WARNING: possible circular locking dependency detected
5.14.0-20210816.rc5.git0.04a03f7da6c2.300.fc34.s390x+debug #1 Not tainted
------------------------------------------------------
modprobe/17864 is trying to acquire lock:
00000001dea24d28 (&disk->open_mutex){+.+.}-{3:3}, at: del_gendisk+0x64/0x210

but task is already holding lock:
000003ff805fd6e8 (nbd_index_mutex){+.+.}-{3:3}, at: refcount_dec_and_mutex_lock+0x7e/0x110

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:
-> #1 (nbd_index_mutex){+.+.}-{3:3}:
       validate_chain+0x9ca/0xde8
       __lock_acquire+0x64c/0xc40
       lock_acquire.part.0+0xec/0x258
       lock_acquire+0xb0/0x200
       __mutex_lock+0xa2/0x8d8
       mutex_lock_nested+0x32/0x40
       nbd_open+0x30/0x248 [nbd]
       blkdev_get_whole+0x38/0x128
       blkdev_get_by_dev+0xcc/0x400
       blkdev_open+0x7a/0xd8
       do_dentry_open+0x19e/0x390
       do_open+0x2e0/0x458
       path_openat+0xec/0x2a8
       do_filp_open+0x90/0x130
       do_sys_openat2+0xa8/0x168
       do_sys_open+0x62/0x90
       __do_syscall+0x1c2/0x1f0
       system_call+0x78/0xa0

-> #0 (&disk->open_mutex){+.+.}-{3:3}:
       check_noncircular+0x168/0x188
       check_prev_add+0xe0/0xed8
       validate_chain+0x9ca/0xde8
       __lock_acquire+0x64c/0xc40
       lock_acquire.part.0+0xec/0x258
       lock_acquire+0xb0/0x200
       __mutex_lock+0xa2/0x8d8
       mutex_lock_nested+0x32/0x40
       del_gendisk+0x64/0x210
       nbd_put.part.0+0x46/0x98 [nbd]
       nbd_cleanup+0xde/0x118 [nbd]
       __do_sys_delete_module+0x19a/0x2a8
       __do_syscall+0x1c2/0x1f0
       system_call+0x78/0xa0

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(nbd_index_mutex);
                               lock(&disk->open_mutex);
                               lock(nbd_index_mutex);
  lock(&disk->open_mutex);

 *** DEADLOCK ***

1 lock held by modprobe/17864:
 #0: 000003ff805fd6e8 (nbd_index_mutex){+.+.}-{3:3}, at: refcount_dec_and_mutex_lock+0x7e/0x110

stack backtrace:
CPU: 1 PID: 17864 Comm: modprobe Not tainted 5.14.0-20210816.rc5.git0.04a03f7da6c2.300.fc34.s390x+debug #1
Hardware name: IBM 8561 T01 703 (LPAR)
Call Trace:
 [<000000008f735098>] show_stack+0x90/0xf8 
 [<000000008f746d56>] dump_stack_lvl+0x8e/0xc8 
 [<000000008eb3a3b0>] check_noncircular+0x168/0x188 
 [<000000008eb3b470>] check_prev_add+0xe0/0xed8 
 [<000000008eb3cc32>] validate_chain+0x9ca/0xde8 
 [<000000008eb3fc2c>] __lock_acquire+0x64c/0xc40 
 [<000000008eb3e834>] lock_acquire.part.0+0xec/0x258 
 [<000000008eb3ea50>] lock_acquire+0xb0/0x200 
 [<000000008f75591a>] __mutex_lock+0xa2/0x8d8 
 [<000000008f756182>] mutex_lock_nested+0x32/0x40 
 [<000000008f2538cc>] del_gendisk+0x64/0x210 
 [<000003ff805f4936>] nbd_put.part.0+0x46/0x98 [nbd] 
 [<000003ff805f965e>] nbd_cleanup+0xde/0x118 [nbd] 
 [<000000008eba7a52>] __do_sys_delete_module+0x19a/0x2a8 
 [<000000008f74a67a>] __do_syscall+0x1c2/0x1f0 
 [<000000008f75cf38>] system_call+0x78/0xa0 
INFO: lockdep is turned off.

