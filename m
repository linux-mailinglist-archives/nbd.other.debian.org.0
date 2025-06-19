Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A89EBAE043F
	for <lists+nbd@lfdr.de>; Thu, 19 Jun 2025 13:48:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 706F420686; Thu, 19 Jun 2025 11:48:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 19 11:48:15 2025
Old-Return-Path: <3nvRTaAkbACEPVWH7IIBO7MMFA.DLLDIBRPBO9LKQBKQ.9LJ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	FVGT_m_MULTI_ODD,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TO_TOO_MANY,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C09132063D
	for <lists-other-nbd@bendel.debian.org>; Thu, 19 Jun 2025 11:29:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.771 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	FVGT_m_MULTI_ODD=0.02, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, TO_TOO_MANY=1, URIBL_SBL_A=0.1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hlR46DuuDhTy for <lists-other-nbd@bendel.debian.org>;
	Thu, 19 Jun 2025 11:29:41 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-il1-f206.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 98BD720627
	for <nbd@other.debian.org>; Thu, 19 Jun 2025 11:29:38 +0000 (UTC)
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ddd051e8e5so5979665ab.1
        for <nbd@other.debian.org>; Thu, 19 Jun 2025 04:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332574; x=1750937374;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q0bpKo0a444ovW4sWpz4EXcZcoHocoxfjWX98q//TTg=;
        b=FLFlszritPOUaGSMBTSjL31TTTndWI4SV1PlgycOBaVtUvxcteTe84TXcx1cDnS9Yt
         BU9xt/SVYPYQ77j57O1IjGdv86QkdSeYV10EWI1DTBqwsHIBNZ1r4IQo4s8xr+TuTCWj
         vbPfGSzlwCA1kOyuXVtzeSl6NbtJxnf2bupgLLBPGJ1o8364bgb1559gEz9ywzPQWUZA
         h0VFQSOi7GMsyI1s6PTACkouqx/tnhUqjp2H7CWQe0T8XvfvqIkIqPu+FQeYPnUs8D1z
         McUssoRFMDBq4DL2LwrngD7+eepQO3FoaJhqnplweDcyjcJ1CIrhBQunfOLvvKMNIud6
         b7Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVFMPGFDct2PMhf6HWS1dZF/z+e4a27CbBBzR6q89fFbFhzR+V/EF8Fut6mtXco6a6Alac=@other.debian.org
X-Gm-Message-State: AOJu0YzZWNaSZKEQ6hwXuM8zbRrAmIRc/iSjWnUtYMfRs0zbQUubI8a3
	pdeRCzIuPJ7IriNLmLdbRO8+Mwr0DgmRgxITTp0Muq2kpsl5F/UwGweXO2roGoedplH35G/goTc
	m9n0+hodlPc1hHeb0u5QhNYip1FcCUwAT0XrDog3/1r8JDwOj60t2M9bzzp4=
X-Google-Smtp-Source: AGHT+IH68r2tyy8nUBLxmmlVx0TaFawKz0a5suFWdAOObJenx/Ssp9C4XyqCfaJeLR8RhuYVQGNrvDW+X1+s4plJVIDdH+/YfHQc
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2583:b0:3dd:d18c:126f with SMTP id
 e9e14a558f8ab-3de07d50c73mr217896225ab.10.1750332574669; Thu, 19 Jun 2025
 04:29:34 -0700 (PDT)
Date: Thu, 19 Jun 2025 04:29:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6853f49e.a00a0220.137b3.0006.GAE@google.com>
Subject: [syzbot] [nbd?] possible deadlock in nbd_open
From: syzbot <syzbot+ea702c2366971b7fc6e4@syzkaller.appspotmail.com>
To: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <b1jWbfE6jDH.A.ClHN._j_UoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3391
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6853f49e.a00a0220.137b3.0006.GAE@google.com
Resent-Date: Thu, 19 Jun 2025 11:48:15 +0000 (UTC)

Hello,

syzbot found the following issue on:

HEAD commit:    306e57988197 Merge patch "riscv: defconfig: run savedefcon..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
console output: https://syzkaller.appspot.com/x/log.txt?x=10721e82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=618b9468db3872f5
dashboard link: https://syzkaller.appspot.com/bug?extid=ea702c2366971b7fc6e4
compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: riscv64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-306e5798.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5fee9bbe87f3/vmlinux-306e5798.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e959580bb405/Image-306e5798.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ea702c2366971b7fc6e4@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.16.0-rc1-syzkaller-g306e57988197 #0 Not tainted
------------------------------------------------------
syz.4.1189/8748 is trying to acquire lock:
ffffaf801a39a230 (&nbd->config_lock){+.+.}-{4:4}, at: nbd_open+0x3c0/0x6fe drivers/block/nbd.c:1703

but task is already holding lock:
ffffffff88e269e8 (nbd_index_mutex){+.+.}-{4:4}, at: nbd_open+0x98/0x6fe drivers/block/nbd.c:1690

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (nbd_index_mutex){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5871 [inline]
       lock_acquire+0x1ac/0x448 kernel/locking/lockdep.c:5828
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x166/0x1292 kernel/locking/mutex.c:747
       mutex_lock_nested+0x14/0x1c kernel/locking/mutex.c:799
       nbd_open+0x98/0x6fe drivers/block/nbd.c:1690
       blkdev_get_whole+0x8a/0x266 block/bdev.c:730
       bdev_open+0x292/0xce6 block/bdev.c:957
       blkdev_open+0x264/0x39a block/fops.c:676
       do_dentry_open+0x97e/0x171e fs/open.c:964
       vfs_open+0xbe/0x380 fs/open.c:1094
       do_open fs/namei.c:3887 [inline]
       path_openat+0x1bd8/0x2a82 fs/namei.c:4046
       do_filp_open+0x19c/0x380 fs/namei.c:4073
       do_sys_openat2+0x11a/0x1c2 fs/open.c:1437
       do_sys_open fs/open.c:1452 [inline]
       __do_sys_openat fs/open.c:1468 [inline]
       __se_sys_openat fs/open.c:1463 [inline]
       __riscv_sys_openat+0x178/0x1fe fs/open.c:1463
       syscall_handler+0x94/0x118 arch/riscv/include/asm/syscall.h:112
       do_trap_ecall_u+0x396/0x530 arch/riscv/kernel/traps.c:341
       handle_exception+0x146/0x152 arch/riscv/kernel/entry.S:197

-> #2 (&disk->open_mutex){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5871 [inline]
       lock_acquire+0x1ac/0x448 kernel/locking/lockdep.c:5828
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x166/0x1292 kernel/locking/mutex.c:747
       mutex_lock_nested+0x14/0x1c kernel/locking/mutex.c:799
       __del_gendisk+0x132/0xac6 block/genhd.c:706
       del_gendisk+0xf6/0x19a block/genhd.c:819
       nbd_dev_remove+0x3c/0xf2 drivers/block/nbd.c:268
       nbd_dev_remove_work+0x1c/0x26 drivers/block/nbd.c:284
       process_one_work+0x96a/0x1f32 kernel/workqueue.c:3238
       process_scheduled_works kernel/workqueue.c:3321 [inline]
       worker_thread+0x5ce/0xde8 kernel/workqueue.c:3402
       kthread+0x39c/0x7d4 kernel/kthread.c:464
       ret_from_fork_kernel+0x2a/0xbb2 arch/riscv/kernel/process.c:214
       ret_from_fork_kernel_asm+0x16/0x18 arch/riscv/kernel/entry.S:327

-> #1 (&set->update_nr_hwq_lock){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5871 [inline]
       lock_acquire+0x1ac/0x448 kernel/locking/lockdep.c:5828
       down_write+0x9c/0x19a kernel/locking/rwsem.c:1577
       blk_mq_update_nr_hw_queues+0x3e/0xb86 block/blk-mq.c:5041
       nbd_start_device+0x140/0xb2c drivers/block/nbd.c:1476
       nbd_genl_connect+0xae0/0x1b24 drivers/block/nbd.c:2201
       genl_family_rcv_msg_doit+0x206/0x2e6 net/netlink/genetlink.c:1115
       genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
       genl_rcv_msg+0x514/0x78e net/netlink/genetlink.c:1210
       netlink_rcv_skb+0x206/0x3be net/netlink/af_netlink.c:2534
       genl_rcv+0x36/0x4c net/netlink/genetlink.c:1219
       netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
       netlink_unicast+0x4f0/0x82c net/netlink/af_netlink.c:1339
       netlink_sendmsg+0x85e/0xdd6 net/netlink/af_netlink.c:1883
       sock_sendmsg_nosec net/socket.c:712 [inline]
       __sock_sendmsg+0xcc/0x160 net/socket.c:727
       ____sys_sendmsg+0x63e/0x79c net/socket.c:2566
       ___sys_sendmsg+0x144/0x1e6 net/socket.c:2620
       __sys_sendmsg+0x188/0x246 net/socket.c:2652
       __do_sys_sendmsg net/socket.c:2657 [inline]
       __se_sys_sendmsg net/socket.c:2655 [inline]
       __riscv_sys_sendmsg+0x70/0xa2 net/socket.c:2655
       syscall_handler+0x94/0x118 arch/riscv/include/asm/syscall.h:112
       do_trap_ecall_u+0x396/0x530 arch/riscv/kernel/traps.c:341
       handle_exception+0x146/0x152 arch/riscv/kernel/entry.S:197

-> #0 (&nbd->config_lock){+.+.}-{4:4}:
       check_noncircular+0x132/0x146 kernel/locking/lockdep.c:2178
       check_prev_add kernel/locking/lockdep.c:3168 [inline]
       check_prevs_add kernel/locking/lockdep.c:3287 [inline]
       validate_chain kernel/locking/lockdep.c:3911 [inline]
       __lock_acquire+0x12b2/0x24ea kernel/locking/lockdep.c:5240
       lock_acquire kernel/locking/lockdep.c:5871 [inline]
       lock_acquire+0x1ac/0x448 kernel/locking/lockdep.c:5828
       __mutex_lock_common kernel/locking/mutex.c:602 [inline]
       __mutex_lock+0x166/0x1292 kernel/locking/mutex.c:747
       mutex_lock_nested+0x14/0x1c kernel/locking/mutex.c:799
       nbd_open+0x3c0/0x6fe drivers/block/nbd.c:1703
       blkdev_get_whole+0x8a/0x266 block/bdev.c:730
       bdev_open+0x292/0xce6 block/bdev.c:957
       blkdev_open+0x264/0x39a block/fops.c:676
       do_dentry_open+0x97e/0x171e fs/open.c:964
       vfs_open+0xbe/0x380 fs/open.c:1094
       do_open fs/namei.c:3887 [inline]
       path_openat+0x1bd8/0x2a82 fs/namei.c:4046
       do_filp_open+0x19c/0x380 fs/namei.c:4073
       do_sys_openat2+0x11a/0x1c2 fs/open.c:1437
       do_sys_open fs/open.c:1452 [inline]
       __do_sys_openat fs/open.c:1468 [inline]
       __se_sys_openat fs/open.c:1463 [inline]
       __riscv_sys_openat+0x178/0x1fe fs/open.c:1463
       syscall_handler+0x94/0x118 arch/riscv/include/asm/syscall.h:112
       do_trap_ecall_u+0x396/0x530 arch/riscv/kernel/traps.c:341
       handle_exception+0x146/0x152 arch/riscv/kernel/entry.S:197

other info that might help us debug this:

Chain exists of:
  &nbd->config_lock --> &disk->open_mutex --> nbd_index_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(nbd_index_mutex);
                               lock(&disk->open_mutex);
                               lock(nbd_index_mutex);
  lock(&nbd->config_lock);

 *** DEADLOCK ***

2 locks held by syz.4.1189/8748:
 #0: ffffaf801a3a2358 (&disk->open_mutex){+.+.}-{4:4}, at: bdev_open+0x3d0/0xce6 block/bdev.c:945
 #1: ffffffff88e269e8 (nbd_index_mutex){+.+.}-{4:4}, at: nbd_open+0x98/0x6fe drivers/block/nbd.c:1690

stack backtrace:
CPU: 0 UID: 0 PID: 8748 Comm: syz.4.1189 Not tainted 6.16.0-rc1-syzkaller-g306e57988197 #0 PREEMPT 
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffff80078bbe>] dump_backtrace+0x2e/0x3c arch/riscv/kernel/stacktrace.c:132
[<ffffffff8000327a>] show_stack+0x30/0x3c arch/riscv/kernel/stacktrace.c:138
[<ffffffff8006103e>] __dump_stack lib/dump_stack.c:94 [inline]
[<ffffffff8006103e>] dump_stack_lvl+0x12e/0x1a6 lib/dump_stack.c:120
[<ffffffff800610d2>] dump_stack+0x1c/0x24 lib/dump_stack.c:129
[<ffffffff802ce116>] print_circular_bug+0x254/0x29a kernel/locking/lockdep.c:2046
[<ffffffff802ce28e>] check_noncircular+0x132/0x146 kernel/locking/lockdep.c:2178
[<ffffffff802d1468>] check_prev_add kernel/locking/lockdep.c:3168 [inline]
[<ffffffff802d1468>] check_prevs_add kernel/locking/lockdep.c:3287 [inline]
[<ffffffff802d1468>] validate_chain kernel/locking/lockdep.c:3911 [inline]
[<ffffffff802d1468>] __lock_acquire+0x12b2/0x24ea kernel/locking/lockdep.c:5240
[<ffffffff802d32de>] lock_acquire kernel/locking/lockdep.c:5871 [inline]
[<ffffffff802d32de>] lock_acquire+0x1ac/0x448 kernel/locking/lockdep.c:5828
[<ffffffff8630e424>] __mutex_lock_common kernel/locking/mutex.c:602 [inline]
[<ffffffff8630e424>] __mutex_lock+0x166/0x1292 kernel/locking/mutex.c:747
[<ffffffff8630f564>] mutex_lock_nested+0x14/0x1c kernel/locking/mutex.c:799
[<ffffffff82c3fb3a>] nbd_open+0x3c0/0x6fe drivers/block/nbd.c:1703
[<ffffffff81531ca6>] blkdev_get_whole+0x8a/0x266 block/bdev.c:730
[<ffffffff81532f2e>] bdev_open+0x292/0xce6 block/bdev.c:957
[<ffffffff81539df6>] blkdev_open+0x264/0x39a block/fops.c:676
[<ffffffff80be5b4e>] do_dentry_open+0x97e/0x171e fs/open.c:964
[<ffffffff80bea7aa>] vfs_open+0xbe/0x380 fs/open.c:1094
[<ffffffff80c3d1ba>] do_open fs/namei.c:3887 [inline]
[<ffffffff80c3d1ba>] path_openat+0x1bd8/0x2a82 fs/namei.c:4046
[<ffffffff80c3e200>] do_filp_open+0x19c/0x380 fs/namei.c:4073
[<ffffffff80beb5f4>] do_sys_openat2+0x11a/0x1c2 fs/open.c:1437
[<ffffffff80bebff6>] do_sys_open fs/open.c:1452 [inline]
[<ffffffff80bebff6>] __do_sys_openat fs/open.c:1468 [inline]
[<ffffffff80bebff6>] __se_sys_openat fs/open.c:1463 [inline]
[<ffffffff80bebff6>] __riscv_sys_openat+0x178/0x1fe fs/open.c:1463
[<ffffffff800769ae>] syscall_handler+0x94/0x118 arch/riscv/include/asm/syscall.h:112
[<ffffffff862fcc32>] do_trap_ecall_u+0x396/0x530 arch/riscv/kernel/traps.c:341
[<ffffffff863250ca>] handle_exception+0x146/0x152 arch/riscv/kernel/entry.S:197


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

