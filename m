Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873CB56E54
	for <lists+nbd@lfdr.de>; Mon, 15 Sep 2025 04:33:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 314BA20E18; Mon, 15 Sep 2025 02:33:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 15 02:33:35 2025
Old-Return-Path: <3-3bHaAkbAFQEKL6w770DwBB4z.2AA270GE0DyA9F09F.yA8@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	FVGT_m_MULTI_ODD,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SORTED_RECIPS,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 695FA20DE9
	for <lists-other-nbd@bendel.debian.org>; Mon, 15 Sep 2025 02:16:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.629 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	FVGT_m_MULTI_ODD=0.02, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SORTED_RECIPS=2.499,
	TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id O2OarFrB1UYc for <lists-other-nbd@bendel.debian.org>;
	Mon, 15 Sep 2025 02:16:35 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-il1-f206.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 01D9520DE4
	for <nbd@other.debian.org>; Mon, 15 Sep 2025 02:16:31 +0000 (UTC)
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-42408f6ecaaso1935285ab.0
        for <nbd@other.debian.org>; Sun, 14 Sep 2025 19:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757902588; x=1758507388;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8IPIlqo9DOCCD07ApIO1c9MxbtrOU4Vfx9BzS3ecyw=;
        b=xIOsNeIxenSOzf2hn27Rm4/ZhWZTAu7eEWXeAH0VSCuiOr/Yk48QOcsqdfGU6Ly6rV
         dJHwpS0aZqQ1at4rqfVPvDTu4lVEvJZikypc9Pipo5wWOmOsmqheDucIO9vEn3atGMGn
         gGvqqe4ixeoOfqYYCcegNJL09w52uiheXa/gsKUA4HYRHBclYxFH6yXtlygZQCsVIV6m
         fnfXknC8uT0aSUNodnl5HbOmnxZQ5GfmAZw5il51N0HXEERXDfKF2pw8sGnp85c1BLAv
         r4B8rehoQkAIfg6gLoPVKKLgHdUp5tAm/KgBHpcnes/0FJWHyggxZnVqjEekgmxECU0n
         qJ4g==
X-Forwarded-Encrypted: i=1; AJvYcCU6x9adUXXYjJVV7HRP4IF8SRFNKIuQMhmmYo+56UnkjPo+mVueFgUk+GNFWOkAJUk2E+8=@other.debian.org
X-Gm-Message-State: AOJu0Yw0N3RwMWOFg/ePIh61My4tc7WUp4HcgJbZmTtU42YLu0zwnYRU
	zJvRQbBVt00yIRaFpI4Cl5vNuBCEx4ULnTOcQ0NN0af3MYhrZ5X5KZdk8uaBoMEstL7ny34rD0M
	ssgQ+lZuIoddVeoeeej/nkyqYAizx9rw7Tk6FiFQhbaaEZgDLcawD6HeCJDg=
X-Google-Smtp-Source: AGHT+IEBxXqHI/lxzGaFRPiTubtd0JrFvI50tUlflh0ux0QnuukY/l42zlDfBlRPfmZjWyYCWRFxdvcqhY2vpAhC2TEibUDY1+EO
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:96f:b0:421:bb6:fc42 with SMTP id
 e9e14a558f8ab-4210bc64833mr85396605ab.3.1757902587945; Sun, 14 Sep 2025
 19:16:27 -0700 (PDT)
Date: Sun, 14 Sep 2025 19:16:27 -0700
In-Reply-To: <686aa557.a00a0220.c7b3.005d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c776fb.050a0220.2ff435.0387.GAE@google.com>
Subject: Re: [syzbot] [nbd?] possible deadlock in nbd_queue_rq
From: syzbot <syzbot+3dbc6142c85cc77eaf04@syzkaller.appspotmail.com>
To: axboe@kernel.dk, bvanassche@acm.org, hdanton@sina.com, 
	josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ming.lei@redhat.com, nbd@other.debian.org, 
	penguin-kernel@i-love.sakura.ne.jp, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sEOklbFEMrI.A.f3nE._r3xoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3444
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/68c776fb.050a0220.2ff435.0387.GAE@google.com
Resent-Date: Mon, 15 Sep 2025 02:33:35 +0000 (UTC)

syzbot has found a reproducer for the following issue on:

HEAD commit:    8736259279a3 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11e2bb62580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9ed0a6d7c80843e9
dashboard link: https://syzkaller.appspot.com/bug?extid=3dbc6142c85cc77eaf04
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=178df642580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=148e7934580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/025c082a7762/disk-87362592.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/606f903fe4d2/vmlinux-87362592.xz
kernel image: https://storage.googleapis.com/syzbot-assets/23ea2634f398/Image-87362592.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3dbc6142c85cc77eaf04@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
udevd/6531 is trying to acquire lock:
ffff0001ffb32070 (&nsock->tx_lock){+.+.}-{4:4}, at: nbd_handle_cmd drivers/block/nbd.c:1140 [inline]
ffff0001ffb32070 (&nsock->tx_lock){+.+.}-{4:4}, at: nbd_queue_rq+0x20c/0xc48 drivers/block/nbd.c:1204

but task is already holding lock:
ffff0000e184e178 (&cmd->lock){+.+.}-{4:4}, at: nbd_queue_rq+0xb4/0xc48 drivers/block/nbd.c:1196

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #6 (&cmd->lock){+.+.}-{4:4}:
       __mutex_lock_common+0x1d0/0x2678 kernel/locking/mutex.c:598
       __mutex_lock kernel/locking/mutex.c:760 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:812
       nbd_queue_rq+0xb4/0xc48 drivers/block/nbd.c:1196
       blk_mq_dispatch_rq_list+0x890/0x1548 block/blk-mq.c:2120
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xa7c/0x10e4 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xa4/0x154 block/blk-mq-sched.c:329
       blk_mq_run_hw_queue+0x2d0/0x4a4 block/blk-mq.c:2358
       blk_mq_dispatch_list+0xa00/0xaf8 block/blk-mq.c:-1
       blk_mq_flush_plug_list+0x3a4/0x488 block/blk-mq.c:2967
       __blk_flush_plug+0x330/0x408 block/blk-core.c:1220
       blk_finish_plug block/blk-core.c:1247 [inline]
       __submit_bio+0x3f4/0x4d8 block/blk-core.c:649
       __submit_bio_noacct_mq block/blk-core.c:722 [inline]
       submit_bio_noacct_nocheck+0x390/0xaac block/blk-core.c:751
       submit_bio_noacct+0xc94/0x177c block/blk-core.c:874
       submit_bio+0x3b4/0x550 block/blk-core.c:916
       submit_bh_wbc+0x3ec/0x4bc fs/buffer.c:2824
       submit_bh fs/buffer.c:2829 [inline]
       block_read_full_folio+0x734/0x824 fs/buffer.c:2461
       blkdev_read_folio+0x28/0x38 block/fops.c:491
       filemap_read_folio+0xec/0x2f8 mm/filemap.c:2413
       do_read_cache_folio+0x364/0x5bc mm/filemap.c:3957
       read_cache_folio+0x68/0x88 mm/filemap.c:3989
       read_mapping_folio include/linux/pagemap.h:991 [inline]
       read_part_sector+0xcc/0x6fc block/partitions/core.c:722
       adfspart_check_ICS+0xa0/0x83c block/partitions/acorn.c:360
       check_partition block/partitions/core.c:141 [inline]
       blk_add_partitions block/partitions/core.c:589 [inline]
       bdev_disk_changed+0x674/0x11fc block/partitions/core.c:693
       blkdev_get_whole+0x2b0/0x4a4 block/bdev.c:748
       bdev_open+0x3b0/0xc20 block/bdev.c:957
       blkdev_open+0x300/0x440 block/fops.c:691
       do_dentry_open+0x7a4/0x10bc fs/open.c:965
       vfs_open+0x44/0x2d4 fs/open.c:1095
       do_open fs/namei.c:3887 [inline]
       path_openat+0x2424/0x2c40 fs/namei.c:4046
       do_filp_open+0x18c/0x36c fs/namei.c:4073
       do_sys_openat2+0x11c/0x1b4 fs/open.c:1435
       do_sys_open fs/open.c:1450 [inline]
       __do_sys_openat fs/open.c:1466 [inline]
       __se_sys_openat fs/open.c:1461 [inline]
       __arm64_sys_openat+0x120/0x158 fs/open.c:1461
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x5c/0x254 arch/arm64/kernel/entry-common.c:744
       el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:763
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596

-> #5 (set->srcu){.+.+}-{0:0}:
       srcu_lock_sync+0x2c/0x38 include/linux/srcu.h:173
       __synchronize_srcu+0xa0/0x348 kernel/rcu/srcutree.c:1429
       synchronize_srcu+0x2cc/0x338 kernel/rcu/srcutree.c:-1
       blk_mq_wait_quiesce_done block/blk-mq.c:283 [inline]
       blk_mq_quiesce_queue+0x118/0x16c block/blk-mq.c:303
       elevator_switch+0x12c/0x410 block/elevator.c:588
       elevator_change+0x264/0x3cc block/elevator.c:690
       elevator_set_default+0x138/0x21c block/elevator.c:766
       blk_register_queue+0x2b4/0x338 block/blk-sysfs.c:904
       __add_disk+0x560/0xb90 block/genhd.c:528
       add_disk_fwnode+0xdc/0x438 block/genhd.c:597
       device_add_disk+0x38/0x4c block/genhd.c:627
       add_disk include/linux/blkdev.h:774 [inline]
       nbd_dev_add+0x560/0x820 drivers/block/nbd.c:1973
       nbd_init+0x15c/0x174 drivers/block/nbd.c:2680
       do_one_initcall+0x250/0x990 init/main.c:1269
       do_initcall_level+0x128/0x1c4 init/main.c:1331
       do_initcalls+0x70/0xd0 init/main.c:1347
       do_basic_setup+0x78/0x8c init/main.c:1366
       kernel_init_freeable+0x268/0x39c init/main.c:1579
       kernel_init+0x24/0x1dc init/main.c:1469
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:844

-> #4 (&q->elevator_lock){+.+.}-{4:4}:
       __mutex_lock_common+0x1d0/0x2678 kernel/locking/mutex.c:598
       __mutex_lock kernel/locking/mutex.c:760 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:812
       elevator_change+0x16c/0x3cc block/elevator.c:688
       elevator_set_none+0x48/0xac block/elevator.c:781
       blk_mq_elv_switch_none block/blk-mq.c:5023 [inline]
       __blk_mq_update_nr_hw_queues block/blk-mq.c:5066 [inline]
       blk_mq_update_nr_hw_queues+0x4c8/0x15f4 block/blk-mq.c:5124
       nbd_start_device+0x158/0xa48 drivers/block/nbd.c:1478
       nbd_genl_connect+0xf88/0x158c drivers/block/nbd.c:2228
       genl_family_rcv_msg_doit+0x1d8/0x2bc net/netlink/genetlink.c:1115
       genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
       genl_rcv_msg+0x450/0x624 net/netlink/genetlink.c:1210
       netlink_rcv_skb+0x220/0x3fc net/netlink/af_netlink.c:2552
       genl_rcv+0x38/0x50 net/netlink/genetlink.c:1219
       netlink_unicast_kernel net/netlink/af_netlink.c:1320 [inline]
       netlink_unicast+0x694/0x8c4 net/netlink/af_netlink.c:1346
       netlink_sendmsg+0x648/0x930 net/netlink/af_netlink.c:1896
       sock_sendmsg_nosec net/socket.c:714 [inline]
       __sock_sendmsg net/socket.c:729 [inline]
       ____sys_sendmsg+0x490/0x7b8 net/socket.c:2614
       ___sys_sendmsg+0x204/0x278 net/socket.c:2668
       __sys_sendmsg net/socket.c:2700 [inline]
       __do_sys_sendmsg net/socket.c:2705 [inline]
       __se_sys_sendmsg net/socket.c:2703 [inline]
       __arm64_sys_sendmsg+0x184/0x238 net/socket.c:2703
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x5c/0x254 arch/arm64/kernel/entry-common.c:744
       el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:763
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596

-> #3 (&q->q_usage_counter(io)#33){++++}-{0:0}:
       blk_alloc_queue+0x48c/0x54c block/blk-core.c:461
       blk_mq_alloc_queue block/blk-mq.c:4400 [inline]
       __blk_mq_alloc_disk+0x124/0x304 block/blk-mq.c:4447
       nbd_dev_add+0x398/0x820 drivers/block/nbd.c:1943
       nbd_init+0x15c/0x174 drivers/block/nbd.c:2680
       do_one_initcall+0x250/0x990 init/main.c:1269
       do_initcall_level+0x128/0x1c4 init/main.c:1331
       do_initcalls+0x70/0xd0 init/main.c:1347
       do_basic_setup+0x78/0x8c init/main.c:1366
       kernel_init_freeable+0x268/0x39c init/main.c:1579
       kernel_init+0x24/0x1dc init/main.c:1469
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:844

-> #2 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4234 [inline]
       fs_reclaim_acquire+0x8c/0x118 mm/page_alloc.c:4248
       might_alloc include/linux/sched/mm.h:318 [inline]
       slab_pre_alloc_hook mm/slub.c:4142 [inline]
       slab_alloc_node mm/slub.c:4220 [inline]
       __kmalloc_cache_noprof+0x58/0x3fc mm/slub.c:4402
       kmalloc_noprof include/linux/slab.h:905 [inline]
       kzalloc_noprof include/linux/slab.h:1039 [inline]
       virtio_transport_do_socket_init+0x60/0x2b8 net/vmw_vsock/virtio_transport_common.c:910
       vsock_assign_transport+0x514/0x65c net/vmw_vsock/af_vsock.c:537
       vsock_connect+0x4a8/0xb94 net/vmw_vsock/af_vsock.c:1583
       __sys_connect_file net/socket.c:2086 [inline]
       __sys_connect+0x2a0/0x3ac net/socket.c:2105
       __do_sys_connect net/socket.c:2111 [inline]
       __se_sys_connect net/socket.c:2108 [inline]
       __arm64_sys_connect+0x7c/0x94 net/socket.c:2108
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x5c/0x254 arch/arm64/kernel/entry-common.c:744
       el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:763
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596

-> #1 (sk_lock-AF_VSOCK){+.+.}-{0:0}:
       lock_sock_nested+0x58/0x118 net/core/sock.c:3711
       lock_sock include/net/sock.h:1669 [inline]
       vsock_shutdown+0x70/0x280 net/vmw_vsock/af_vsock.c:1103
       kernel_sock_shutdown+0x6c/0x80 net/socket.c:3701
       nbd_mark_nsock_dead+0x2a4/0x534 drivers/block/nbd.c:318
       recv_work+0x1cf8/0x2044 drivers/block/nbd.c:1018
       process_one_work+0x7e8/0x155c kernel/workqueue.c:3236
       process_scheduled_works kernel/workqueue.c:3319 [inline]
       worker_thread+0x958/0xed8 kernel/workqueue.c:3400
       kthread+0x5fc/0x75c kernel/kthread.c:463
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:844

-> #0 (&nsock->tx_lock){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x1774/0x30a4 kernel/locking/lockdep.c:5237
       lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5868
       __mutex_lock_common+0x1d0/0x2678 kernel/locking/mutex.c:598
       __mutex_lock kernel/locking/mutex.c:760 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:812
       nbd_handle_cmd drivers/block/nbd.c:1140 [inline]
       nbd_queue_rq+0x20c/0xc48 drivers/block/nbd.c:1204
       blk_mq_dispatch_rq_list+0x890/0x1548 block/blk-mq.c:2120
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xa7c/0x10e4 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xa4/0x154 block/blk-mq-sched.c:329
       blk_mq_run_hw_queue+0x2d0/0x4a4 block/blk-mq.c:2358
       blk_mq_dispatch_list+0xa00/0xaf8 block/blk-mq.c:-1
       blk_mq_flush_plug_list+0x3a4/0x488 block/blk-mq.c:2967
       __blk_flush_plug+0x330/0x408 block/blk-core.c:1220
       blk_finish_plug block/blk-core.c:1247 [inline]
       __submit_bio+0x3f4/0x4d8 block/blk-core.c:649
       __submit_bio_noacct_mq block/blk-core.c:722 [inline]
       submit_bio_noacct_nocheck+0x390/0xaac block/blk-core.c:751
       submit_bio_noacct+0xc94/0x177c block/blk-core.c:874
       submit_bio+0x3b4/0x550 block/blk-core.c:916
       submit_bh_wbc+0x3ec/0x4bc fs/buffer.c:2824
       submit_bh fs/buffer.c:2829 [inline]
       block_read_full_folio+0x734/0x824 fs/buffer.c:2461
       blkdev_read_folio+0x28/0x38 block/fops.c:491
       filemap_read_folio+0xec/0x2f8 mm/filemap.c:2413
       do_read_cache_folio+0x364/0x5bc mm/filemap.c:3957
       read_cache_folio+0x68/0x88 mm/filemap.c:3989
       read_mapping_folio include/linux/pagemap.h:991 [inline]
       read_part_sector+0xcc/0x6fc block/partitions/core.c:722
       adfspart_check_ICS+0xa0/0x83c block/partitions/acorn.c:360
       check_partition block/partitions/core.c:141 [inline]
       blk_add_partitions block/partitions/core.c:589 [inline]
       bdev_disk_changed+0x674/0x11fc block/partitions/core.c:693
       blkdev_get_whole+0x2b0/0x4a4 block/bdev.c:748
       bdev_open+0x3b0/0xc20 block/bdev.c:957
       blkdev_open+0x300/0x440 block/fops.c:691
       do_dentry_open+0x7a4/0x10bc fs/open.c:965
       vfs_open+0x44/0x2d4 fs/open.c:1095
       do_open fs/namei.c:3887 [inline]
       path_openat+0x2424/0x2c40 fs/namei.c:4046
       do_filp_open+0x18c/0x36c fs/namei.c:4073
       do_sys_openat2+0x11c/0x1b4 fs/open.c:1435
       do_sys_open fs/open.c:1450 [inline]
       __do_sys_openat fs/open.c:1466 [inline]
       __se_sys_openat fs/open.c:1461 [inline]
       __arm64_sys_openat+0x120/0x158 fs/open.c:1461
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
       el0_svc+0x5c/0x254 arch/arm64/kernel/entry-common.c:744
       el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:763
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596

other info that might help us debug this:

Chain exists of:
  &nsock->tx_lock --> set->srcu --> &cmd->lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&cmd->lock);
                               lock(set->srcu);
                               lock(&cmd->lock);
  lock(&nsock->tx_lock);

 *** DEADLOCK ***

3 locks held by udevd/6531:
 #0: ffff0000cb97e358 (&disk->open_mutex){+.+.}-{4:4}, at: bdev_open+0xcc/0xc20 block/bdev.c:945
 #1: ffff0000cad37e90 (set->srcu){.+.+}-{0:0}, at: srcu_lock_acquire+0x18/0x54 include/linux/srcu.h:160
 #2: ffff0000e184e178 (&cmd->lock){+.+.}-{4:4}, at: nbd_queue_rq+0xb4/0xc48 drivers/block/nbd.c:1196

stack backtrace:
CPU: 1 UID: 0 PID: 6531 Comm: udevd Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/30/2025
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_circular_bug+0x324/0x32c kernel/locking/lockdep.c:2043
 check_noncircular+0x154/0x174 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x1774/0x30a4 kernel/locking/lockdep.c:5237
 lock_acquire+0x14c/0x2e0 kernel/locking/lockdep.c:5868
 __mutex_lock_common+0x1d0/0x2678 kernel/locking/mutex.c:598
 __mutex_lock kernel/locking/mutex.c:760 [inline]
 mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:812
 nbd_handle_cmd drivers/block/nbd.c:1140 [inline]
 nbd_queue_rq+0x20c/0xc48 drivers/block/nbd.c:1204
 blk_mq_dispatch_rq_list+0x890/0x1548 block/blk-mq.c:2120
 __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
 blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
 __blk_mq_sched_dispatch_requests+0xa7c/0x10e4 block/blk-mq-sched.c:307
 blk_mq_sched_dispatch_requests+0xa4/0x154 block/blk-mq-sched.c:329
 blk_mq_run_hw_queue+0x2d0/0x4a4 block/blk-mq.c:2358
 blk_mq_dispatch_list+0xa00/0xaf8 block/blk-mq.c:-1
 blk_mq_flush_plug_list+0x3a4/0x488 block/blk-mq.c:2967
 __blk_flush_plug+0x330/0x408 block/blk-core.c:1220
 blk_finish_plug block/blk-core.c:1247 [inline]
 __submit_bio+0x3f4/0x4d8 block/blk-core.c:649
 __submit_bio_noacct_mq block/blk-core.c:722 [inline]
 submit_bio_noacct_nocheck+0x390/0xaac block/blk-core.c:751
 submit_bio_noacct+0xc94/0x177c block/blk-core.c:874
 submit_bio+0x3b4/0x550 block/blk-core.c:916
 submit_bh_wbc+0x3ec/0x4bc fs/buffer.c:2824
 submit_bh fs/buffer.c:2829 [inline]
 block_read_full_folio+0x734/0x824 fs/buffer.c:2461
 blkdev_read_folio+0x28/0x38 block/fops.c:491
 filemap_read_folio+0xec/0x2f8 mm/filemap.c:2413
 do_read_cache_folio+0x364/0x5bc mm/filemap.c:3957
 read_cache_folio+0x68/0x88 mm/filemap.c:3989
 read_mapping_folio include/linux/pagemap.h:991 [inline]
 read_part_sector+0xcc/0x6fc block/partitions/core.c:722
 adfspart_check_ICS+0xa0/0x83c block/partitions/acorn.c:360
 check_partition block/partitions/core.c:141 [inline]
 blk_add_partitions block/partitions/core.c:589 [inline]
 bdev_disk_changed+0x674/0x11fc block/partitions/core.c:693
 blkdev_get_whole+0x2b0/0x4a4 block/bdev.c:748
 bdev_open+0x3b0/0xc20 block/bdev.c:957
 blkdev_open+0x300/0x440 block/fops.c:691
 do_dentry_open+0x7a4/0x10bc fs/open.c:965
 vfs_open+0x44/0x2d4 fs/open.c:1095
 do_open fs/namei.c:3887 [inline]
 path_openat+0x2424/0x2c40 fs/namei.c:4046
 do_filp_open+0x18c/0x36c fs/namei.c:4073
 do_sys_openat2+0x11c/0x1b4 fs/open.c:1435
 do_sys_open fs/open.c:1450 [inline]
 __do_sys_openat fs/open.c:1466 [inline]
 __se_sys_openat fs/open.c:1461 [inline]
 __arm64_sys_openat+0x120/0x158 fs/open.c:1461
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x5c/0x254 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:763
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
block nbd0: Dead connection, failed to find a fallback
block nbd0: shutting down sockets
I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
Buffer I/O error on dev nbd0, logical block 0, async page read
I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
Buffer I/O error on dev nbd0, logical block 0, async page read
I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
Buffer I/O error on dev nbd0, logical block 0, async page read
I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
Buffer I/O error on dev nbd0, logical block 0, async page read
I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
Buffer I/O error on dev nbd0, logical block 0, async page read
I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
Buffer I/O error on dev nbd0, logical block 0, async page read
I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
Buffer I/O error on dev nbd0, logical block 0, async page read
I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
Buffer I/O error on dev nbd0, logical block 0, async page read
ldm_validate_partition_table(): Disk read failed.
I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
Buffer I/O error on dev nbd0, logical block 0, async page read
I/O error, dev nbd0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 2
Buffer I/O error on dev nbd0, logical block 0, async page read
Dev nbd0: unable to read RDB block 0
 nbd0: unable to read partition table
ldm_validate_partition_table(): Disk read failed.
Dev nbd0: unable to read RDB block 0
 nbd0: unable to read partition table


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

