Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1030EA4A
	for <lists+nbd@lfdr.de>; Thu,  4 Feb 2021 03:39:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B29DD20478; Thu,  4 Feb 2021 02:39:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb  4 02:39:20 2021
Old-Return-Path: <hdanton@sina.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 897A820572
	for <lists-other-nbd@bendel.debian.org>; Thu,  4 Feb 2021 02:22:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.899 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5Cnwnumls5W7 for <lists-other-nbd@bendel.debian.org>;
	Thu,  4 Feb 2021 02:22:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .sina. - helo: .r3-17.sinamail.sina. - helo-domain: .sina.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from r3-17.sinamail.sina.com.cn (r3-17.sinamail.sina.com.cn [202.108.3.17])
	by bendel.debian.org (Postfix) with SMTP id 32D4120536
	for <nbd@other.debian.org>; Thu,  4 Feb 2021 02:22:34 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([103.193.190.174])
	by sina.com (172.16.97.27) with ESMTP
	id 601B5A630002B7B8; Thu, 4 Feb 2021 10:22:28 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 44315249283550
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+f91dbbabacae745d334f@syzkaller.appspotmail.com>
Cc: axboe@kernel.dk,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	Hillf Danton <hdanton@sina.com>,
	syzkaller-bugs@googlegroups.com
Subject: Re: KASAN: use-after-free Read in recv_work
Date: Thu,  4 Feb 2021 10:22:20 +0800
Message-Id: <20210204022220.2310-1-hdanton@sina.com>
In-Reply-To: <000000000000f296a705ba57ed59@google.com>
References: <000000000000f296a705ba57ed59@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gAfFpqC-gTH.A.FOG.Y51GgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1118
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210204022220.2310-1-hdanton@sina.com
Resent-Date: Thu,  4 Feb 2021 02:39:20 +0000 (UTC)

Tue, 02 Feb 2021 02:28:20 -0800
> syzbot found the following issue on:
> 
> HEAD commit:    b01f250d Add linux-next specific files for 20210129
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=14366378d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=725bc96dc234fda7
> dashboard link: https://syzkaller.appspot.com/bug?extid=f91dbbabacae745d334f
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+f91dbbabacae745d334f@syzkaller.appspotmail.com
> 
> block nbd5: Receive control failed (result -107)
> ==================================================================
> BUG: KASAN: use-after-free in recv_work+0x2a2/0x2c0 drivers/block/nbd.c:787
> Read of size 8 at addr ffff88801181ed20 by task kworker/u5:2/8465
> 
> CPU: 1 PID: 8465 Comm: kworker/u5:2 Not tainted 5.11.0-rc5-next-20210129-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: knbd5-recv recv_work
> Call Trace:
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x107/0x163 lib/dump_stack.c:120
>  print_address_description.constprop.0.cold+0x5b/0x2f8 mm/kasan/report.c:232
>  __kasan_report mm/kasan/report.c:399 [inline]
>  kasan_report.cold+0x7c/0xd8 mm/kasan/report.c:416
>  recv_work+0x2a2/0x2c0 drivers/block/nbd.c:787

The uaf occurs in the worker context.

>  process_one_work+0x98d/0x15f0 kernel/workqueue.c:2275
>  worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
>  kthread+0x3b1/0x4a0 kernel/kthread.c:292
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
> 
> Allocated by task 17044:
>  kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
>  kasan_set_track mm/kasan/common.c:46 [inline]
>  set_alloc_info mm/kasan/common.c:403 [inline]
>  ____kasan_kmalloc mm/kasan/common.c:434 [inline]
>  ____kasan_kmalloc.constprop.0+0xa0/0xd0 mm/kasan/common.c:406
>  kasan_slab_alloc include/linux/kasan.h:208 [inline]
>  slab_post_alloc_hook mm/slab.h:516 [inline]
>  slab_alloc_node mm/slub.c:2907 [inline]
>  slab_alloc mm/slub.c:2915 [inline]
>  __kmalloc_track_caller+0x16c/0x2e0 mm/slub.c:4550
>  __do_krealloc mm/slab_common.c:1149 [inline]
>  krealloc+0x60/0xa0 mm/slab_common.c:1178
>  nbd_add_socket+0x263/0x6a0 drivers/block/nbd.c:1044
>  __nbd_ioctl drivers/block/nbd.c:1369 [inline]
>  nbd_ioctl+0x388/0xa50 drivers/block/nbd.c:1425
>  blkdev_ioctl+0x2a1/0x6d0 block/ioctl.c:576
>  block_ioctl+0xf9/0x140 fs/block_dev.c:1650
>  vfs_ioctl fs/ioctl.c:48 [inline]
>  __do_sys_ioctl fs/ioctl.c:753 [inline]
>  __se_sys_ioctl fs/ioctl.c:739 [inline]
>  __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> Freed by task 17044:
>  kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
>  kasan_set_track+0x1c/0x30 mm/kasan/common.c:46
>  kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:357
>  ____kasan_slab_free.part.0+0xe1/0x110 mm/kasan/common.c:364
>  kasan_slab_free include/linux/kasan.h:191 [inline]
>  slab_free_hook mm/slub.c:1562 [inline]
>  slab_free_freelist_hook+0x82/0x1d0 mm/slub.c:1600
>  slab_free mm/slub.c:3161 [inline]
>  kfree+0xe5/0x7b0 mm/slub.c:4202
>  krealloc+0x45/0xa0 mm/slab_common.c:1180

Change memory slice without parking worker.

>  nbd_add_socket+0x263/0x6a0 drivers/block/nbd.c:1044
>  __nbd_ioctl drivers/block/nbd.c:1369 [inline]
>  nbd_ioctl+0x388/0xa50 drivers/block/nbd.c:1425
>  blkdev_ioctl+0x2a1/0x6d0 block/ioctl.c:576
>  block_ioctl+0xf9/0x140 fs/block_dev.c:1650
>  vfs_ioctl fs/ioctl.c:48 [inline]
>  __do_sys_ioctl fs/ioctl.c:753 [inline]
>  __se_sys_ioctl fs/ioctl.c:739 [inline]
>  __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> 
> The buggy address belongs to the object at ffff88801181ed20
>  which belongs to the cache kmalloc-8 of size 8
> The buggy address is located 0 bytes inside of
>  8-byte region [ffff88801181ed20, ffff88801181ed28)
> The buggy address belongs to the page:
> page:00000000e0a0f4b5 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1181e
> flags: 0xfff00000000200(slab)
> raw: 00fff00000000200 ffffea000053d180 0000000500000005 ffff88800fc41280
> raw: ffff88801181ef28 0000000080660062 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  ffff88801181ec00: fc 00 fc fc fc fc fa fc fc fc fc 00 fc fc fc fc
>  ffff88801181ec80: fa fc fc fc fc 00 fc fc fc fc 00 fc fc fc fc 00
> >ffff88801181ed00: fc fc fc fc fa fc fc fc fc 00 fc fc fc fc 00 fc
>                                ^
>  ffff88801181ed80: fc fc fc 00 fc fc fc fc 00 fc fc fc fc fa fc fc
>  ffff88801181ee00: fc fc 00 fc fc fc fc fa fc fc fc fc 00 fc fc fc
> ==================================================================

What is reported here is different from the uaf fixed in b98e762e3d71,
and it is highly appreciated to add a Fixes tag.

Add a sem for nbd to serialise dereferencing sock in the ioctl and
kworker contexts in order to fix the UAF. This is the fix as simple as
thought of while turning the config_lock into a sem seems another good
option.

Plus s/recv_work/nbd_recv_work/ to make it simpler to spot a Fixes tag.

--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -36,6 +36,7 @@
 #include <linux/types.h>
 #include <linux/debugfs.h>
 #include <linux/blk-mq.h>
+#include <linux/rwsem.h>
 
 #include <linux/uaccess.h>
 #include <asm/types.h>
@@ -113,6 +114,7 @@ struct nbd_device {
 	struct mutex config_lock;
 	struct gendisk *disk;
 	struct workqueue_struct *recv_workq;
+	struct rw_semaphore sk_realloc_sem;
 
 	struct list_head list;
 	struct task_struct *task_recv;
@@ -771,7 +773,7 @@ out:
 	return ret ? ERR_PTR(ret) : cmd;
 }
 
-static void recv_work(struct work_struct *work)
+static void nbd_recv_work(struct work_struct *work)
 {
 	struct recv_thread_args *args = container_of(work,
 						     struct recv_thread_args,
@@ -784,11 +786,16 @@ static void recv_work(struct work_struct
 	while (1) {
 		cmd = nbd_read_stat(nbd, args->index);
 		if (IS_ERR(cmd)) {
-			struct nbd_sock *nsock = config->socks[args->index];
+			struct nbd_sock *nsock;
+
+			down_read(&nbd->sk_realloc_sem);
+			nsock = config->socks[args->index];
 
 			mutex_lock(&nsock->tx_lock);
 			nbd_mark_nsock_dead(nbd, nsock, 1);
 			mutex_unlock(&nsock->tx_lock);
+
+			up_read(&nbd->sk_realloc_sem);
 			break;
 		}
 
@@ -1046,10 +1053,12 @@ static int nbd_add_socket(struct nbd_dev
 		err = -ENOMEM;
 		goto put_socket;
 	}
+	down_write(&nbd->sk_realloc_sem);
 
 	socks = krealloc(config->socks, (config->num_connections + 1) *
 			 sizeof(struct nbd_sock *), GFP_KERNEL);
 	if (!socks) {
+		up_write(&nbd->sk_realloc_sem);
 		kfree(nsock);
 		err = -ENOMEM;
 		goto put_socket;
@@ -1066,6 +1075,7 @@ static int nbd_add_socket(struct nbd_dev
 	nsock->cookie = 0;
 	socks[config->num_connections++] = nsock;
 	atomic_inc(&config->live_connections);
+	up_write(&nbd->sk_realloc_sem);
 	blk_mq_unfreeze_queue(nbd->disk->queue);
 
 	return 0;
@@ -1114,7 +1124,7 @@ static int nbd_reconnect_socket(struct n
 		nsock->fallback_index = -1;
 		nsock->sock = sock;
 		nsock->dead = false;
-		INIT_WORK(&args->work, recv_work);
+		INIT_WORK(&args->work, nbd_recv_work);
 		args->index = i;
 		args->nbd = nbd;
 		nsock->cookie++;
@@ -1123,7 +1133,7 @@ static int nbd_reconnect_socket(struct n
 
 		clear_bit(NBD_RT_DISCONNECTED, &config->runtime_flags);
 
-		/* We take the tx_mutex in an error path in the recv_work, so we
+		/* We take the tx_mutex in an error path in the nbd_recv_work, so we
 		 * need to queue_work outside of the tx_mutex.
 		 */
 		queue_work(nbd->recv_workq, &args->work);
@@ -1305,7 +1315,7 @@ static int nbd_start_device(struct nbd_d
 				nbd->tag_set.timeout;
 		atomic_inc(&config->recv_threads);
 		refcount_inc(&nbd->config_refs);
-		INIT_WORK(&args->work, recv_work);
+		INIT_WORK(&args->work, nbd_recv_work);
 		args->nbd = nbd;
 		args->index = i;
 		queue_work(nbd->recv_workq, &args->work);
@@ -1728,6 +1738,7 @@ static int nbd_dev_add(int index)
 	disk->queue->limits.max_sectors = 256;
 
 	mutex_init(&nbd->config_lock);
+	init_rwsem(&nbd->sk_realloc_sem);
 	refcount_set(&nbd->config_refs, 0);
 	refcount_set(&nbd->refs, 1);
 	INIT_LIST_HEAD(&nbd->list);

