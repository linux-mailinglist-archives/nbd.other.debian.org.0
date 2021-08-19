Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE8B3F148C
	for <lists+nbd@lfdr.de>; Thu, 19 Aug 2021 09:51:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3C0402085F; Thu, 19 Aug 2021 07:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 19 07:51:10 2021
Old-Return-Path: <hdanton@sina.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,FREEMAIL_FROM,
	RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3F43F2080E
	for <lists-other-nbd@bendel.debian.org>; Thu, 19 Aug 2021 07:35:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FREEMAIL_FROM=0.001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9R94kQ3vc8wO for <lists-other-nbd@bendel.debian.org>;
	Thu, 19 Aug 2021 07:34:59 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 301 seconds by postgrey-1.36 at bendel; Thu, 19 Aug 2021 07:34:58 UTC
Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	by bendel.debian.org (Postfix) with SMTP id 8553C2080B
	for <nbd@other.debian.org>; Thu, 19 Aug 2021 07:34:57 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([222.130.245.194])
	by sina.com (172.16.97.27) with ESMTP
	id 611E086B00033BE9; Thu, 19 Aug 2021 15:29:49 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 20068649283958
From: Hillf Danton <hdanton@sina.com>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: WARNING: possible circular locking dependency detected in nbd
Date: Thu, 19 Aug 2021 15:29:38 +0800
Message-Id: <20210819072938.3839-1-hdanton@sina.com>
In-Reply-To: <yt9dsfz7xm6e.fsf@linux.ibm.com>
References: <yt9dsfz7xm6e.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nSJ3-HdsbcN.A.5zH.u1gHhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1304
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210819072938.3839-1-hdanton@sina.com
Resent-Date: Thu, 19 Aug 2021 07:51:10 +0000 (UTC)

On Wed, 18 Aug 2021 09:10:49 +0200 Sven Schnelle wrote:
> Hi,
> 
> i'm seeing the lockdep splat below in CI. I think this is because

Thanks for reporting it.

> nbd_open is called with disk->open_mutex held, and acquires
> nbd_index_mutex. However, nbd_put() first takes the nbd_index_lock,
> and calls del_gendisk, which locks disk->open_mutex, so the order is
> reversed.

Right. See diff attached.
> 
> WARNING: possible circular locking dependency detected
> 5.14.0-20210816.rc5.git0.04a03f7da6c2.300.fc34.s390x+debug #1 Not tainted
> ------------------------------------------------------
> modprobe/17864 is trying to acquire lock:
> 00000001dea24d28 (&disk->open_mutex){+.+.}-{3:3}, at: del_gendisk+0x64/0x210
> 
> but task is already holding lock:
> 000003ff805fd6e8 (nbd_index_mutex){+.+.}-{3:3}, at: refcount_dec_and_mutex_lock+0x7e/0x110
> 
> which lock already depends on the new lock.
> 
> the existing dependency chain (in reverse order) is:
> -> #1 (nbd_index_mutex){+.+.}-{3:3}:
>        validate_chain+0x9ca/0xde8
>        __lock_acquire+0x64c/0xc40
>        lock_acquire.part.0+0xec/0x258
>        lock_acquire+0xb0/0x200
>        __mutex_lock+0xa2/0x8d8
>        mutex_lock_nested+0x32/0x40
>        nbd_open+0x30/0x248 [nbd]
>        blkdev_get_whole+0x38/0x128
>        blkdev_get_by_dev+0xcc/0x400
>        blkdev_open+0x7a/0xd8
>        do_dentry_open+0x19e/0x390
>        do_open+0x2e0/0x458
>        path_openat+0xec/0x2a8
>        do_filp_open+0x90/0x130
>        do_sys_openat2+0xa8/0x168
>        do_sys_open+0x62/0x90
>        __do_syscall+0x1c2/0x1f0
>        system_call+0x78/0xa0
> 
> -> #0 (&disk->open_mutex){+.+.}-{3:3}:
>        check_noncircular+0x168/0x188
>        check_prev_add+0xe0/0xed8
>        validate_chain+0x9ca/0xde8
>        __lock_acquire+0x64c/0xc40
>        lock_acquire.part.0+0xec/0x258
>        lock_acquire+0xb0/0x200
>        __mutex_lock+0xa2/0x8d8
>        mutex_lock_nested+0x32/0x40
>        del_gendisk+0x64/0x210
>        nbd_put.part.0+0x46/0x98 [nbd]
>        nbd_cleanup+0xde/0x118 [nbd]
>        __do_sys_delete_module+0x19a/0x2a8
>        __do_syscall+0x1c2/0x1f0
>        system_call+0x78/0xa0
> 
> other info that might help us debug this:
> 
>  Possible unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock(nbd_index_mutex);
>                                lock(&disk->open_mutex);
>                                lock(nbd_index_mutex);
>   lock(&disk->open_mutex);
> 
>  *** DEADLOCK ***

To fix it, delete disk without the nbd_index_lock held after removing
nbd from the idr.

Only for thoughts.

+++ b/drivers/block/nbd.c
@@ -2443,6 +2443,7 @@ static int nbd_exit_cb(int id, void *ptr
 	struct nbd_device *nbd = ptr;
 
 	list_add_tail(&nbd->list, list);
+	idr_remove(&nbd_index_idr, nbd->index);
 	return 0;
 }
 
@@ -2462,7 +2463,7 @@ static void __exit nbd_cleanup(void)
 		list_del_init(&nbd->list);
 		if (refcount_read(&nbd->refs) != 1)
 			printk(KERN_ERR "nbd: possibly leaking a device\n");
-		nbd_put(nbd);
+		nbd_dev_remove(nbd);
 	}
 
 	idr_destroy(&nbd_index_idr);

