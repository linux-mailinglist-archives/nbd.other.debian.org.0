Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E664EAFA8D8
	for <lists+nbd@lfdr.de>; Mon,  7 Jul 2025 03:27:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9F89320496; Mon,  7 Jul 2025 01:27:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul  7 01:27:14 2025
Old-Return-Path: <hdanton@sina.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,FVGT_m_MULTI_ODD,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,URIBL_SBL_A autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9423A20458
	for <lists-other-nbd@bendel.debian.org>; Mon,  7 Jul 2025 01:09:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.975 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, FVGT_m_MULTI_ODD=0.02, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, URIBL_SBL_A=0.1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Kzgomb6yqyJ7 for <lists-other-nbd@bendel.debian.org>;
	Mon,  7 Jul 2025 01:09:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 572 seconds by postgrey-1.36 at bendel; Mon, 07 Jul 2025 01:09:39 UTC
Received: from mail3-162.sinamail.sina.com.cn (mail3-162.sinamail.sina.com.cn [202.108.3.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5D82D2041A
	for <nbd@other.debian.org>; Mon,  7 Jul 2025 01:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751850579;
	bh=UW5MbP2tk4RXyua8yR++k6nis/jR0cumuZtdrtQIvjU=;
	h=From:Subject:Date:Message-ID;
	b=OSvM3xsBwIXPrW6VUKasWQyJ9HDDMPWxJaqlBJS+DQJ7LA7WyVg8ASypq6ZqNiSlz
	 QwMhd95aWyISU74KPrFsEtDNpny3eFvsEXbAfi5/zPXzJsUCDrDBnST2CYeOpxmTWB
	 R2CR96/+Zxhd25VEwZsf89AmA6KI50dUbs0k1gE4=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 686B1C0B000060C8; Mon, 7 Jul 2025 08:59:57 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3647326291936
X-SMAIL-UIID: 7008B6D11373451C98EE0EF34DCBB6E0-20250707-085957-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+3dbc6142c85cc77eaf04@syzkaller.appspotmail.com>
Cc: axboe@kernel.dk,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nbd?] possible deadlock in nbd_queue_rq
Date: Mon,  7 Jul 2025 08:59:44 +0800
Message-ID: <20250707005946.2669-1-hdanton@sina.com>
In-Reply-To: <686aa557.a00a0220.c7b3.005d.GAE@google.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sjpujWB2gwK.A.TC4N.yJyaoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3406
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250707005946.2669-1-hdanton@sina.com
Resent-Date: Mon,  7 Jul 2025 01:27:14 +0000 (UTC)

> Date: Sun, 06 Jul 2025 09:33:27 -0700
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    26ffb3d6f02c Add linux-next specific files for 20250704
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=154e6582580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=1e4f88512ae53408
> dashboard link: https://syzkaller.appspot.com/bug?extid=3dbc6142c85cc77eaf04
> compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/fd5569903143/disk-26ffb3d6.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/1b0c9505c543/vmlinux-26ffb3d6.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/9d864c72bed1/bzImage-26ffb3d6.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+3dbc6142c85cc77eaf04@syzkaller.appspotmail.com
> 
> ======================================================
> WARNING: possible circular locking dependency detected
> 6.16.0-rc4-next-20250704-syzkaller #0 Not tainted
> ------------------------------------------------------
> udevd/6083 is trying to acquire lock:
> ffff88807b837870 (&nsock->tx_lock){+.+.}-{4:4}, at: nbd_handle_cmd drivers/block/nbd.c:1140 [inline]
> ffff88807b837870 (&nsock->tx_lock){+.+.}-{4:4}, at: nbd_queue_rq+0x257/0xf10 drivers/block/nbd.c:1204
> 
> but task is already holding lock:
> ffff8880597ee178 (&cmd->lock){+.+.}-{4:4}, at: nbd_queue_rq+0xc8/0xf10 drivers/block/nbd.c:1196
> 
> which lock already depends on the new lock.
> 
> 
> the existing dependency chain (in reverse order) is:
> 
> -> #6 (&cmd->lock){+.+.}-{4:4}:
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>        __mutex_lock_common kernel/locking/mutex.c:602 [inline]
>        __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:747
>        nbd_queue_rq+0xc8/0xf10 drivers/block/nbd.c:1196
>        blk_mq_dispatch_rq_list+0x4c0/0x1900 block/blk-mq.c:2118
>        __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
>        blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
>        __blk_mq_sched_dispatch_requests+0xda4/0x1570 block/blk-mq-sched.c:307
>        blk_mq_sched_dispatch_requests+0xd7/0x190 block/blk-mq-sched.c:329
>        blk_mq_run_hw_queue+0x348/0x4f0 block/blk-mq.c:2356
>        blk_mq_dispatch_list+0xd0c/0xe00 include/linux/spinlock.h:-1
>        blk_mq_flush_plug_list+0x469/0x550 block/blk-mq.c:2965
>        __blk_flush_plug+0x3d3/0x4b0 block/blk-core.c:1220
>        blk_finish_plug block/blk-core.c:1247 [inline]
>        __submit_bio+0x2d3/0x5a0 block/blk-core.c:649
>        __submit_bio_noacct_mq block/blk-core.c:722 [inline]
>        submit_bio_noacct_nocheck+0x4ab/0xb50 block/blk-core.c:751
>        submit_bh fs/buffer.c:2829 [inline]
>        block_read_full_folio+0x7b7/0x830 fs/buffer.c:2461
>        filemap_read_folio+0x117/0x380 mm/filemap.c:2413
>        do_read_cache_folio+0x350/0x590 mm/filemap.c:3957
>        read_mapping_folio include/linux/pagemap.h:972 [inline]
>        read_part_sector+0xb6/0x2b0 block/partitions/core.c:722
>        adfspart_check_ICS+0xa4/0xa50 block/partitions/acorn.c:360
>        check_partition block/partitions/core.c:141 [inline]
>        blk_add_partitions block/partitions/core.c:589 [inline]
>        bdev_disk_changed+0x75c/0x14b0 block/partitions/core.c:693
>        blkdev_get_whole+0x380/0x510 block/bdev.c:748
>        bdev_open+0x31e/0xd30 block/bdev.c:957
>        blkdev_open+0x3a8/0x510 block/fops.c:676
>        do_dentry_open+0xdf0/0x1970 fs/open.c:964
>        vfs_open+0x3b/0x340 fs/open.c:1094
>        do_open fs/namei.c:3887 [inline]
>        path_openat+0x2ee5/0x3830 fs/namei.c:4046
>        do_filp_open+0x1fa/0x410 fs/namei.c:4073
>        do_sys_openat2+0x121/0x1c0 fs/open.c:1434
>        do_sys_open fs/open.c:1449 [inline]
>        __do_sys_openat fs/open.c:1465 [inline]
>        __se_sys_openat fs/open.c:1460 [inline]
>        __x64_sys_openat+0x138/0x170 fs/open.c:1460
>        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>        do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> -> #5 (set->srcu){.+.+}-{0:0}:
>        lock_sync+0xba/0x160 kernel/locking/lockdep.c:5919
>        srcu_lock_sync include/linux/srcu.h:173 [inline]
>        __synchronize_srcu+0x96/0x3a0 kernel/rcu/srcutree.c:1429
>        elevator_switch+0x12b/0x5f0 block/elevator.c:587
>        elevator_change+0x21b/0x320 block/elevator.c:679
>        elevator_set_default+0x144/0x210 block/elevator.c:737
>        blk_register_queue+0x35d/0x400 block/blk-sysfs.c:879
>        __add_disk+0x677/0xd50 block/genhd.c:528
>        add_disk_fwnode+0xfc/0x480 block/genhd.c:597
>        add_disk include/linux/blkdev.h:765 [inline]
>        nbd_dev_add+0x70e/0xb00 drivers/block/nbd.c:1963
>        nbd_init+0x21a/0x2d0 drivers/block/nbd.c:2670

The first case of nbd_init in the lock chain,

>        do_one_initcall+0x233/0x820 init/main.c:1269
>        do_initcall_level+0x137/0x1f0 init/main.c:1331
>        do_initcalls+0x69/0xd0 init/main.c:1347
>        kernel_init_freeable+0x3d9/0x570 init/main.c:1579
>        kernel_init+0x1d/0x1d0 init/main.c:1469
>        ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
>        ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> -> #4 (&q->elevator_lock){+.+.}-{4:4}:
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>        __mutex_lock_common kernel/locking/mutex.c:602 [inline]
>        __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:747
>        elv_update_nr_hw_queues+0x87/0x2a0 block/elevator.c:699
>        __blk_mq_update_nr_hw_queues block/blk-mq.c:5024 [inline]
>        blk_mq_update_nr_hw_queues+0xd54/0x14c0 block/blk-mq.c:5045
>        nbd_start_device+0x16c/0xac0 drivers/block/nbd.c:1476
>        nbd_genl_connect+0x1250/0x1930 drivers/block/nbd.c:2201
>        genl_family_rcv_msg_doit+0x212/0x300 net/netlink/genetlink.c:1115
>        genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
>        genl_rcv_msg+0x60e/0x790 net/netlink/genetlink.c:1210
>        netlink_rcv_skb+0x208/0x470 net/netlink/af_netlink.c:2534
>        genl_rcv+0x28/0x40 net/netlink/genetlink.c:1219
>        netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
>        netlink_unicast+0x75b/0x8d0 net/netlink/af_netlink.c:1339
>        netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1883
>        sock_sendmsg_nosec net/socket.c:714 [inline]
>        __sock_sendmsg+0x219/0x270 net/socket.c:729
>        ____sys_sendmsg+0x505/0x830 net/socket.c:2614
>        ___sys_sendmsg+0x21f/0x2a0 net/socket.c:2668
>        __sys_sendmsg net/socket.c:2700 [inline]
>        __do_sys_sendmsg net/socket.c:2705 [inline]
>        __se_sys_sendmsg net/socket.c:2703 [inline]
>        __x64_sys_sendmsg+0x19b/0x260 net/socket.c:2703
>        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>        do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> -> #3 (&q->q_usage_counter(io)#49){++++}-{0:0}:
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>        blk_alloc_queue+0x538/0x620 block/blk-core.c:461
>        blk_mq_alloc_queue block/blk-mq.c:4398 [inline]
>        __blk_mq_alloc_disk+0x162/0x340 block/blk-mq.c:4445
>        nbd_dev_add+0x476/0xb00 drivers/block/nbd.c:1933
>        nbd_init+0x21a/0x2d0 drivers/block/nbd.c:2670

and given the second one, the report is false positive.

>        do_one_initcall+0x233/0x820 init/main.c:1269
>        do_initcall_level+0x137/0x1f0 init/main.c:1331
>        do_initcalls+0x69/0xd0 init/main.c:1347
>        kernel_init_freeable+0x3d9/0x570 init/main.c:1579
>        kernel_init+0x1d/0x1d0 init/main.c:1469
>        ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
>        ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> -> #2 (fs_reclaim){+.+.}-{0:0}:
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>        __fs_reclaim_acquire mm/page_alloc.c:4231 [inline]
>        fs_reclaim_acquire+0x72/0x100 mm/page_alloc.c:4245
>        might_alloc include/linux/sched/mm.h:318 [inline]
>        slab_pre_alloc_hook mm/slub.c:4131 [inline]
>        slab_alloc_node mm/slub.c:4209 [inline]
>        kmem_cache_alloc_node_noprof+0x47/0x3c0 mm/slub.c:4281
>        __alloc_skb+0x112/0x2d0 net/core/skbuff.c:660
>        alloc_skb_fclone include/linux/skbuff.h:1386 [inline]
>        tcp_stream_alloc_skb+0x3d/0x340 net/ipv4/tcp.c:892
>        tcp_sendmsg_locked+0x1f46/0x5630 net/ipv4/tcp.c:1198
>        tcp_sendmsg+0x2f/0x50 net/ipv4/tcp.c:1394
>        sock_sendmsg_nosec net/socket.c:714 [inline]
>        __sock_sendmsg+0x19c/0x270 net/socket.c:729
>        sock_write_iter+0x258/0x330 net/socket.c:1179
>        new_sync_write fs/read_write.c:593 [inline]
>        vfs_write+0x548/0xa90 fs/read_write.c:686
>        ksys_write+0x145/0x250 fs/read_write.c:738
>        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>        do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> -> #1 (sk_lock-AF_INET){+.+.}-{0:0}:
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>        lock_sock_nested+0x48/0x100 net/core/sock.c:3727
>        lock_sock include/net/sock.h:1667 [inline]
>        inet_shutdown+0x6a/0x390 net/ipv4/af_inet.c:905
>        nbd_mark_nsock_dead+0x2e9/0x560 drivers/block/nbd.c:318
>        recv_work+0x2138/0x24f0 drivers/block/nbd.c:1018
>        process_one_work kernel/workqueue.c:3239 [inline]
>        process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
>        worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
>        kthread+0x70e/0x8a0 kernel/kthread.c:463
>        ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
>        ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> 
> -> #0 (&nsock->tx_lock){+.+.}-{4:4}:
>        check_prev_add kernel/locking/lockdep.c:3168 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3287 [inline]
>        validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
>        __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
>        lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>        __mutex_lock_common kernel/locking/mutex.c:602 [inline]
>        __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:747
>        nbd_handle_cmd drivers/block/nbd.c:1140 [inline]
>        nbd_queue_rq+0x257/0xf10 drivers/block/nbd.c:1204
>        blk_mq_dispatch_rq_list+0x4c0/0x1900 block/blk-mq.c:2118
>        __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
>        blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
>        __blk_mq_sched_dispatch_requests+0xda4/0x1570 block/blk-mq-sched.c:307
>        blk_mq_sched_dispatch_requests+0xd7/0x190 block/blk-mq-sched.c:329
>        blk_mq_run_hw_queue+0x348/0x4f0 block/blk-mq.c:2356
>        blk_mq_dispatch_list+0xd0c/0xe00 include/linux/spinlock.h:-1
>        blk_mq_flush_plug_list+0x469/0x550 block/blk-mq.c:2965
>        __blk_flush_plug+0x3d3/0x4b0 block/blk-core.c:1220
>        blk_finish_plug block/blk-core.c:1247 [inline]
>        __submit_bio+0x2d3/0x5a0 block/blk-core.c:649
>        __submit_bio_noacct_mq block/blk-core.c:722 [inline]
>        submit_bio_noacct_nocheck+0x4ab/0xb50 block/blk-core.c:751
>        submit_bh fs/buffer.c:2829 [inline]
>        block_read_full_folio+0x7b7/0x830 fs/buffer.c:2461
>        filemap_read_folio+0x117/0x380 mm/filemap.c:2413
>        do_read_cache_folio+0x350/0x590 mm/filemap.c:3957
>        read_mapping_folio include/linux/pagemap.h:972 [inline]
>        read_part_sector+0xb6/0x2b0 block/partitions/core.c:722
>        adfspart_check_ICS+0xa4/0xa50 block/partitions/acorn.c:360
>        check_partition block/partitions/core.c:141 [inline]
>        blk_add_partitions block/partitions/core.c:589 [inline]
>        bdev_disk_changed+0x75c/0x14b0 block/partitions/core.c:693
>        blkdev_get_whole+0x380/0x510 block/bdev.c:748
>        bdev_open+0x31e/0xd30 block/bdev.c:957
>        blkdev_open+0x3a8/0x510 block/fops.c:676
>        do_dentry_open+0xdf0/0x1970 fs/open.c:964
>        vfs_open+0x3b/0x340 fs/open.c:1094
>        do_open fs/namei.c:3887 [inline]
>        path_openat+0x2ee5/0x3830 fs/namei.c:4046
>        do_filp_open+0x1fa/0x410 fs/namei.c:4073
>        do_sys_openat2+0x121/0x1c0 fs/open.c:1434
>        do_sys_open fs/open.c:1449 [inline]
>        __do_sys_openat fs/open.c:1465 [inline]
>        __se_sys_openat fs/open.c:1460 [inline]
>        __x64_sys_openat+0x138/0x170 fs/open.c:1460
>        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>        do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> other info that might help us debug this:
> 
> Chain exists of:
>   &nsock->tx_lock --> set->srcu --> &cmd->lock
> 
>  Possible unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock(&cmd->lock);
>                                lock(set->srcu);
>                                lock(&cmd->lock);
>   lock(&nsock->tx_lock);
> 
>  *** DEADLOCK ***
> 
> 3 locks held by udevd/6083:
>  #0: ffff888024ed8358 (&disk->open_mutex){+.+.}-{4:4}, at: bdev_open+0xe0/0xd30 block/bdev.c:945
>  #1: ffff888024d36f90 (set->srcu){.+.+}-{0:0}, at: srcu_lock_acquire include/linux/srcu.h:161 [inline]
>  #1: ffff888024d36f90 (set->srcu){.+.+}-{0:0}, at: srcu_read_lock include/linux/srcu.h:253 [inline]
>  #1: ffff888024d36f90 (set->srcu){.+.+}-{0:0}, at: blk_mq_run_hw_queue+0x31f/0x4f0 block/blk-mq.c:2356
>  #2: ffff8880597ee178 (&cmd->lock){+.+.}-{4:4}, at: nbd_queue_rq+0xc8/0xf10 drivers/block/nbd.c:1196
> 
> stack backtrace:
> CPU: 0 UID: 0 PID: 6083 Comm: udevd Not tainted 6.16.0-rc4-next-20250704-syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2046
>  check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2178
>  check_prev_add kernel/locking/lockdep.c:3168 [inline]
>  check_prevs_add kernel/locking/lockdep.c:3287 [inline]
>  validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3911
>  __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5240
>  lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
>  __mutex_lock_common kernel/locking/mutex.c:602 [inline]
>  __mutex_lock+0x182/0xe80 kernel/locking/mutex.c:747
>  nbd_handle_cmd drivers/block/nbd.c:1140 [inline]
>  nbd_queue_rq+0x257/0xf10 drivers/block/nbd.c:1204
>  blk_mq_dispatch_rq_list+0x4c0/0x1900 block/blk-mq.c:2118
>  __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
>  blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
>  __blk_mq_sched_dispatch_requests+0xda4/0x1570 block/blk-mq-sched.c:307
>  blk_mq_sched_dispatch_requests+0xd7/0x190 block/blk-mq-sched.c:329
>  blk_mq_run_hw_queue+0x348/0x4f0 block/blk-mq.c:2356
>  blk_mq_dispatch_list+0xd0c/0xe00 include/linux/spinlock.h:-1
>  blk_mq_flush_plug_list+0x469/0x550 block/blk-mq.c:2965
>  __blk_flush_plug+0x3d3/0x4b0 block/blk-core.c:1220
>  blk_finish_plug block/blk-core.c:1247 [inline]
>  __submit_bio+0x2d3/0x5a0 block/blk-core.c:649
>  __submit_bio_noacct_mq block/blk-core.c:722 [inline]
>  submit_bio_noacct_nocheck+0x4ab/0xb50 block/blk-core.c:751
>  submit_bh fs/buffer.c:2829 [inline]
>  block_read_full_folio+0x7b7/0x830 fs/buffer.c:2461
>  filemap_read_folio+0x117/0x380 mm/filemap.c:2413
>  do_read_cache_folio+0x350/0x590 mm/filemap.c:3957
>  read_mapping_folio include/linux/pagemap.h:972 [inline]
>  read_part_sector+0xb6/0x2b0 block/partitions/core.c:722
>  adfspart_check_ICS+0xa4/0xa50 block/partitions/acorn.c:360
>  check_partition block/partitions/core.c:141 [inline]
>  blk_add_partitions block/partitions/core.c:589 [inline]
>  bdev_disk_changed+0x75c/0x14b0 block/partitions/core.c:693
>  blkdev_get_whole+0x380/0x510 block/bdev.c:748
>  bdev_open+0x31e/0xd30 block/bdev.c:957
>  blkdev_open+0x3a8/0x510 block/fops.c:676
>  do_dentry_open+0xdf0/0x1970 fs/open.c:964
>  vfs_open+0x3b/0x340 fs/open.c:1094
>  do_open fs/namei.c:3887 [inline]
>  path_openat+0x2ee5/0x3830 fs/namei.c:4046
>  do_filp_open+0x1fa/0x410 fs/namei.c:4073
>  do_sys_openat2+0x121/0x1c0 fs/open.c:1434
>  do_sys_open fs/open.c:1449 [inline]
>  __do_sys_openat fs/open.c:1465 [inline]
>  __se_sys_openat fs/open.c:1460 [inline]
>  __x64_sys_openat+0x138/0x170 fs/open.c:1460
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f674caa7407
> Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
> RSP: 002b:00007fff79271070 EFLAGS: 00000202 ORIG_RAX: 0000000000000101
> RAX: ffffffffffffffda RBX: 00007f674d25e880 RCX: 00007f674caa7407
> RDX: 00000000000a0800 RSI: 000055ad17c52fe0 RDI: ffffffffffffff9c
> RBP: 000055ad17c52910 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000202 R12: 000055ad17c53000
> R13: 000055ad17c6a430 R14: 0000000000000000 R15: 000055ad17c53000
>  </TASK>
> block nbd0: Dead connection, failed to find a fallback
> block nbd0: shutting down sockets
> I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> Buffer I/O error on dev nbd0, logical block 0, async page read
> I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> Buffer I/O error on dev nbd0, logical block 0, async page read
> I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> Buffer I/O error on dev nbd0, logical block 0, async page read
> I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> Buffer I/O error on dev nbd0, logical block 0, async page read
> I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> Buffer I/O error on dev nbd0, logical block 0, async page read
> I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> Buffer I/O error on dev nbd0, logical block 0, async page read
> I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> Buffer I/O error on dev nbd0, logical block 0, async page read
> I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> Buffer I/O error on dev nbd0, logical block 0, async page read
> ldm_validate_partition_table(): Disk read failed.
> I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> Buffer I/O error on dev nbd0, logical block 0, async page read
> I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> Buffer I/O error on dev nbd0, logical block 0, async page read
> Dev nbd0: unable to read RDB block 0
>  nbd0: unable to read partition table
> ldm_validate_partition_table(): Disk read failed.
> Dev nbd0: unable to read RDB block 0
>  nbd0: unable to read partition table
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 

