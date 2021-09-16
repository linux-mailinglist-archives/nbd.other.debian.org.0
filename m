Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCC640D1E2
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 05:00:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9B40F20877; Thu, 16 Sep 2021 03:00:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 03:00:14 2021
Old-Return-Path: <sunhao.th@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	FVGT_m_MULTI_ODD,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 42DDD2087B
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 02:44:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.079 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, FVGT_m_MULTI_ODD=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 94Acn8rSsLZM for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 02:43:59 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C43912087A
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 02:43:56 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id h3so4746653pgb.7
        for <nbd@other.debian.org>; Wed, 15 Sep 2021 19:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nDBpAWHJuHcU5humJwxuHMnlP/G/uEcPkz2K0rjH5GY=;
        b=NWupysXxY/w+vKBTgztNbktJ6/+d4zc+ahFYcwoMqMpk6glt35FOgj6dEFdTw3U9YG
         F57fWpBn8Vx9cduR4NEgY3QWgf6F41Qcii0V9GEcA28sL5dO+r8eulI5NaU7hzqX8S1E
         WxxtRGk8Xtoe9IBNQmhxINqk/TCzJZ6eu2LenLQ8lVW0MpKA92YIs/HqOnX9pju6/CQ+
         GL6MLg3xKzeqSsNiMHGR3lhGT1URZZ35v6b7dgxEQUwZnXJyZzLcRG9Jq3DWpdYmEkb7
         WND2RQpP7kaAePzSskKq3+0mi3Karg4vP3aKwGFArifhptFFMmqRkvEZCYm09afGxg2r
         KP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nDBpAWHJuHcU5humJwxuHMnlP/G/uEcPkz2K0rjH5GY=;
        b=VHyh4A3qQeC+kYPjem6T1AR9bjYGt5tAiYSXtRDq12w39lixQ/BtELW3+3+eD0Npgj
         B8mSQHy7rnexeeth7nE3pqelbenhxYEZ9n1GrAn/USu+z447HyXg3RTflO9eXt1ztkMz
         uy0oLxOx14Z02E+qn+F8HHCiJ9rzaYAyMmhyr4d+wGrb6fejguF1dSgj+qjL1LmRt36U
         GasjjuZFtsmN96Wg16mbNZJWCv+mbm4YB3W51SN1RQk6qVCkeZ1Uw88wCm7rnp0jAzLs
         +IsAZeJj8KwOI/EhhCxemAK6twFQSbRdsBCbiyetipnOWL194vwlvbtAeCt7cUjVnqaV
         DO/A==
X-Gm-Message-State: AOAM531nD3JZrvop2HAVCAq6AyURCSYC48odRe7Va4p7QqyAyMIkLPRe
	aEfkgoPomt3FxKXrPa2XKMbVWKikQENv/tgsSA==
X-Google-Smtp-Source: ABdhPJyS7v+injHSGluZjGx5+ST7kzaCcSwjqcmiwgdkUP1xYFW9MB/qbsWo3pCvOHTBIoN7RlNcAbMFZYsp8BO6UGA=
X-Received: by 2002:a05:6a00:2449:b0:43c:4a5e:55a6 with SMTP id
 d9-20020a056a00244900b0043c4a5e55a6mr2685907pfj.43.1631760232893; Wed, 15 Sep
 2021 19:43:52 -0700 (PDT)
MIME-Version: 1.0
From: Hao Sun <sunhao.th@gmail.com>
Date: Thu, 16 Sep 2021 10:43:55 +0800
Message-ID: <CACkBjsZw6fT_J_thhES0pCDs+hxiapoE3Tgka47J9T06yh8T9Q@mail.gmail.com>
Subject: INFO: task hung in nbd_ioctl
To: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org
Cc: Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org, nbd@other.debian.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EwDYWkYjr5N.A.11F.-MrQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1484
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CACkBjsZw6fT_J_thhES0pCDs+hxiapoE3Tgka47J9T06yh8T9Q@mail.gmail.com
Resent-Date: Thu, 16 Sep 2021 03:00:14 +0000 (UTC)

Hello,

When using Healer to fuzz the latest Linux kernel, the following crash
was triggered.

HEAD commit: 6880fa6c5660 Linux 5.15-rc1
git tree: upstream
console output:
https://drive.google.com/file/d/1LfSHVsXZBF1k8KjBkz5OauavDE0rMs7D/view?usp=sharing
kernel config: https://drive.google.com/file/d/1rUzyMbe5vcs6khA3tL9EHTLJvsUdWcgB/view?usp=sharing

Sorry, I don't have a reproducer for this crash, hope the symbolized
report can help.
If you fix this issue, please add the following tag to the commit:
Reported-by: Hao Sun <sunhao.th@gmail.com>

INFO: task syz-executor:24965 blocked for more than 143 seconds.
      Not tainted 5.15.0-rc1 #2
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:27880 pid:24965 ppid: 24302 flags:0x00004004
Call Trace:
 context_switch kernel/sched/core.c:4940 [inline]
 __schedule+0xcd9/0x2530 kernel/sched/core.c:6287
 schedule+0xd3/0x270 kernel/sched/core.c:6366
 schedule_preempt_disabled+0xf/0x20 kernel/sched/core.c:6425
 __mutex_lock_common kernel/locking/mutex.c:669 [inline]
 __mutex_lock+0xc96/0x1680 kernel/locking/mutex.c:729
 nbd_start_device_ioctl drivers/block/nbd.c:1361 [inline]
 __nbd_ioctl drivers/block/nbd.c:1422 [inline]
 nbd_ioctl+0x58b/0x9c0 drivers/block/nbd.c:1462
 blkdev_ioctl+0x2a4/0x720 block/ioctl.c:589
 block_ioctl+0xfa/0x140 block/fops.c:477
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4739cd
RSP: 002b:00007fd1b9ddec58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000059c0a0 RCX: 00000000004739cd
RDX: 0000000000000000 RSI: 000000000000ab03 RDI: 0000000000000008
RBP: 00000000004ebd80 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000059c0a0
R13: 00007ffd8476ee1f R14: 00007ffd8476efc0 R15: 00007fd1b9ddedc0
INFO: task syz-executor:24976 blocked for more than 143 seconds.
      Not tainted 5.15.0-rc1 #2
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:28400 pid:24976 ppid: 24302 flags:0x00000004
Call Trace:
 context_switch kernel/sched/core.c:4940 [inline]
 __schedule+0xcd9/0x2530 kernel/sched/core.c:6287
 schedule+0xd3/0x270 kernel/sched/core.c:6366
 blk_mq_freeze_queue_wait+0x114/0x160 block/blk-mq.c:151
 nbd_add_socket+0x102/0x7c0 drivers/block/nbd.c:1050
 __nbd_ioctl drivers/block/nbd.c:1405 [inline]
 nbd_ioctl+0x391/0x9c0 drivers/block/nbd.c:1462
 blkdev_ioctl+0x2a4/0x720 block/ioctl.c:589
 block_ioctl+0xfa/0x140 block/fops.c:477
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4739cd
RSP: 002b:00007fd1b9d7bc58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 000000000059c2c8 RCX: 00000000004739cd
RDX: 0000000000000006 RSI: 000000000000ab00 RDI: 0000000000000004
RBP: 00000000004ebd80 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000059c2c8
R13: 00007ffd8476ee1f R14: 00007ffd8476efc0 R15: 00007fd1b9d7bdc0

Showing all locks held in the system:
1 lock held by khungtaskd/39:
 #0: ffffffff8b97e9a0 (rcu_read_lock){....}-{1:2}, at:
debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:6446
1 lock held by in:imklog/15673:
 #0: ffff88801eeab570 (&f->f_pos_lock){+.+.}-{3:3}, at:
__fdget_pos+0xe9/0x100 fs/file.c:990
1 lock held by syz-executor/24965:
 #0: ffff88801a0f4208 (&nbd->config_lock){+.+.}-{3:3}, at:
nbd_start_device_ioctl drivers/block/nbd.c:1361 [inline]
 #0: ffff88801a0f4208 (&nbd->config_lock){+.+.}-{3:3}, at: __nbd_ioctl
drivers/block/nbd.c:1422 [inline]
 #0: ffff88801a0f4208 (&nbd->config_lock){+.+.}-{3:3}, at:
nbd_ioctl+0x58b/0x9c0 drivers/block/nbd.c:1462
1 lock held by syz-executor/24976:
 #0: ffff88801a0f4208 (&nbd->config_lock){+.+.}-{3:3}, at:
nbd_ioctl+0x14f/0x9c0 drivers/block/nbd.c:1455

=============================================

NMI backtrace for cpu 2
CPU: 2 PID: 39 Comm: khungtaskd Not tainted 5.15.0-rc1 #2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 nmi_cpu_backtrace.cold+0x47/0x144 lib/nmi_backtrace.c:105
 nmi_trigger_cpumask_backtrace+0x1e1/0x220 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:210 [inline]
 watchdog+0xcc8/0x1010 kernel/hung_task.c:295
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
Sending NMI from CPU 2 to CPUs 0-1,3:
NMI backtrace for cpu 1
CPU: 1 PID: 15674 Comm: rs:main Q:Reg Not tainted 5.15.0-rc1 #2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:__lock_acquire+0xdc5/0x57e0 kernel/locking/lockdep.c:4885
Code: bc e9 0d e9 f4 01 00 00 48 b8 00 00 00 00 00 fc ff df 4c 89 f2
48 c1 ea 03 80 3c 02 00 0f 85 76 2a 00 00 49 81 3e 40 34 f0 8e <0f> 84
16 f3 ff ff 83 fd 01 0f 87 1e f3 ff ff 89 eb 0f 87 3d 39 00
RSP: 0018:ffffc90007fbf628 EFLAGS: 00000087
RAX: dffffc0000000000 RBX: 1ffff92000ff7ef5 RCX: 0000000000000000
RDX: 1ffffffff1757c40 RSI: 0000000000000000 RDI: ffffffff8babe200
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: ffff888135c32a0b R11: ffffed1026b86541 R12: 0000000000000000
R13: ffff88810287d580 R14: ffffffff8babe200 R15: 0000000000000000
FS:  00007fe40dfd0700(0000) GS:ffff888135c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000056f1d8 CR3: 000000001911a000 CR4: 0000000000350ee0
Call Trace:
 lock_acquire kernel/locking/lockdep.c:5625 [inline]
 lock_acquire+0x1ab/0x520 kernel/locking/lockdep.c:5590
 fs_reclaim_acquire+0xd2/0x160 mm/page_alloc.c:4556
 might_alloc include/linux/sched/mm.h:198 [inline]
 slab_pre_alloc_hook mm/slab.h:492 [inline]
 slab_alloc_node mm/slub.c:3120 [inline]
 slab_alloc mm/slub.c:3214 [inline]
 kmem_cache_alloc+0x42/0x340 mm/slub.c:3219
 kmem_cache_zalloc include/linux/slab.h:711 [inline]
 jbd2_alloc_handle include/linux/jbd2.h:1603 [inline]
 new_handle fs/jbd2/transaction.c:481 [inline]
 jbd2__journal_start fs/jbd2/transaction.c:508 [inline]
 jbd2__journal_start+0x191/0x920 fs/jbd2/transaction.c:490
 __ext4_journal_start_sb+0x3a8/0x4a0 fs/ext4/ext4_jbd2.c:105
 __ext4_journal_start fs/ext4/ext4_jbd2.h:326 [inline]
 ext4_da_write_begin+0x4c5/0x1180 fs/ext4/inode.c:3002
 generic_perform_write+0x1fe/0x510 mm/filemap.c:3770
 ext4_buffered_write_iter+0x206/0x4c0 fs/ext4/file.c:269
 ext4_file_write_iter+0x42e/0x14a0 fs/ext4/file.c:680
 call_write_iter include/linux/fs.h:2163 [inline]
 new_sync_write+0x414/0x640 fs/read_write.c:507
 vfs_write+0x67a/0xae0 fs/read_write.c:594
 ksys_write+0x12d/0x250 fs/read_write.c:647
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fe410a141cd
Code: c2 20 00 00 75 10 b8 01 00 00 00 0f 05 48 3d 01 f0 ff ff 73 31
c3 48 83 ec 08 e8 ae fc ff ff 48 89 04 24 b8 01 00 00 00 0f 05 <48> 8b
3c 24 48 89 c2 e8 f7 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007fe40dfcf590 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fe404027260 RCX: 00007fe410a141cd
RDX: 000000000000005c RSI: 00007fe404027260 RDI: 0000000000000009
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000293 R12: 00007fe404026fe0
R13: 00007fe40dfcf5b0 R14: 000055dcd82aa800 R15: 000000000000005c
NMI backtrace for cpu 0 skipped: idling at native_safe_halt
arch/x86/include/asm/irqflags.h:51 [inline]
NMI backtrace for cpu 0 skipped: idling at arch_safe_halt
arch/x86/include/asm/irqflags.h:89 [inline]
NMI backtrace for cpu 0 skipped: idling at default_idle+0xb/0x10
arch/x86/kernel/process.c:716
NMI backtrace for cpu 3
CPU: 3 PID: 3017 Comm: systemd-journal Not tainted 5.15.0-rc1 #2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:lockdep_hardirqs_off+0x3b/0xd0 kernel/locking/lockdep.c:4372
Code: 2b 47 cf 76 a9 00 00 f0 00 55 53 48 89 fb 74 49 8b 15 f9 2f f2
06 85 d2 74 0e 65 8b 05 6a 4e cf 76 85 c0 75 4e 5b 5d c3 9c 58 <f6> c4
02 74 eb e8 5b fa ac fa 85 c0 74 ed 8b 05 b9 46 3b 04 85 c0
RSP: 0018:ffffc90000edf900 EFLAGS: 00000046
RAX: 0000000000000046 RBX: ffffffff81ccee3d RCX: 0000000000000001
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90000edf9b0 R08: ffffffff817c49c9 R09: 0000000000000000
R10: 0000000000000007 R11: ffffed1026ba6541 R12: 0000000000000200
R13: 0000000000000000 R14: ffff888109853900 R15: 0000000000000000
FS:  00007fdba43168c0(0000) GS:ffff888135d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fdb9ff28000 CR3: 000000001bdb3000 CR4: 0000000000350ee0
Call Trace:
 trace_hardirqs_off+0x13/0x1b0 kernel/trace/trace_preemptirq.c:76
 seqcount_lockdep_reader_access include/linux/seqlock.h:102 [inline]
 set_root+0x39d/0x560 fs/namei.c:940
 nd_jump_root+0x38d/0x520 fs/namei.c:961
 path_init+0xf81/0x1700 fs/namei.c:2359
 path_openat+0x18e/0x2710 fs/namei.c:3556
 do_filp_open+0x1c1/0x290 fs/namei.c:3588
 do_sys_openat2+0x61b/0x9a0 fs/open.c:1200
 do_sys_open+0xc3/0x140 fs/open.c:1216
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fdba38a685d
Code: bb 20 00 00 75 10 b8 02 00 00 00 0f 05 48 3d 01 f0 ff ff 73 31
c3 48 83 ec 08 e8 1e f6 ff ff 48 89 04 24 b8 02 00 00 00 0f 05 <48> 8b
3c 24 48 89 c2 e8 67 f6 ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007ffd7e798f70 EFLAGS: 00000293 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007ffd7e799280 RCX: 00007fdba38a685d
RDX: 00000000000001a0 RSI: 0000000000080042 RDI: 000055ef99869060
RBP: 000000000000000d R08: 000000000000ffc0 R09: 00000000ffffffff
R10: 0000000000000069 R11: 0000000000000293 R12: 00000000ffffffff
R13: 000055ef99865040 R14: 00007ffd7e799240 R15: 000055ef99870c40
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:   e9 0d e9 f4 01          jmpq   0x1f4e912
   5:   00 00                   add    %al,(%rax)
   7:   48 b8 00 00 00 00 00    movabs $0xdffffc0000000000,%rax
   e:   fc ff df
  11:   4c 89 f2                mov    %r14,%rdx
  14:   48 c1 ea 03             shr    $0x3,%rdx
  18:   80 3c 02 00             cmpb   $0x0,(%rdx,%rax,1)
  1c:   0f 85 76 2a 00 00       jne    0x2a98
  22:   49 81 3e 40 34 f0 8e    cmpq   $0xffffffff8ef03440,(%r14)
* 29:   0f 84 16 f3 ff ff       je     0xfffff345 <-- trapping instruction
  2f:   83 fd 01                cmp    $0x1,%ebp
  32:   0f 87 1e f3 ff ff       ja     0xfffff356
  38:   89 eb                   mov    %ebp,%ebx
  3a:   0f                      .byte 0xf
  3b:   87                      .byte 0x87
  3c:   3d                      .byte 0x3d
  3d:   39 00                   cmp    %eax,(%rax)

