Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA50C29B1D
	for <lists+nbd@lfdr.de>; Mon, 03 Nov 2025 01:06:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A16BE208F9; Mon,  3 Nov 2025 00:06:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov  3 00:06:28 2025
Old-Return-Path: <3zu0HaQkbABkHNO9zAA3GzEE72.5DD5A3JH3G1DCI3CI.1DB@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	FVGT_m_MULTI_ODD,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TO_TOO_MANY,WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 95DCB20890
	for <lists-other-nbd@bendel.debian.org>; Sun,  2 Nov 2025 23:48:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.129 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	FVGT_m_MULTI_ODD=0.02, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, TO_TOO_MANY=1,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GOTf7th2tSnn for <lists-other-nbd@bendel.debian.org>;
	Sun,  2 Nov 2025 23:48:36 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-io1-f77.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E2BDB2087D
	for <nbd@other.debian.org>; Sun,  2 Nov 2025 23:48:33 +0000 (UTC)
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-94840e58f1cso88061339f.3
        for <nbd@other.debian.org>; Sun, 02 Nov 2025 15:48:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762127310; x=1762732110;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C602hrGaUQdeWDx4IFuptUU/fphWH0ebVULXiyeNd7c=;
        b=k5hMu7L40oeH+mDg2q0NkGzjhzvx0hOwdb844GKe6K0Yz47isOo1HmaBYc1oTdqmJl
         hbmHV66Av4lO1jLQgzwmmEQMTGqYSw7FTkGC4XA08jvyrtG3kQAxWItTxT/e/ZkRp/jv
         +3uxAMm87eCLx2cU1RaL3/5OnZx3aBjpDYNgqu7PHGtK4thIFBG/lgW9AZChaCiwDUbD
         VOatyQdYphGDNr3PfGO0Y3j1xsiluuo9azZOD9dxGE1uhS9JiOeSwqHZDrpBL/fQ7P9B
         cH/AC3P+3TT4kOdFJeCeysgdnqBskP6VWK20tkkML9OyxCYyCagn2dGQ11VY0GYoY28p
         MXHw==
X-Forwarded-Encrypted: i=1; AJvYcCW8oVuunZcSokBbCcHKVgVm/fjOv8d9YPDY79uVOULCCFPiieNnD9doWQqYCHvUEcSJWl4=@other.debian.org
X-Gm-Message-State: AOJu0Yz/FEOiRuffFSak0lzEHswwAsyMlG1Gndlquy8QX+HPEMLOxnP2
	UDqOnaQ5ea77v/msWHUk8URdYQED4noIKuV/KIxQpLTc+ZEWoGvpRdY38OpKBSfuBV1Bz0K2M1u
	d7bAg/Aglc1wBIsXwvGDlZOj0MjPDZlPRFVOaurT4X1EQkkTwewlMs4aD838=
X-Google-Smtp-Source: AGHT+IEDIGsDv1VUEgQueS3MSxhrn4I0yGG2ABS9WmUFf0QFljf5TEf1o20oDK+J7JjshSno4mXo1hnXV4NsVtoXGlh+txMn5fIj
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3499:b0:433:31a0:4e6d with SMTP id
 e9e14a558f8ab-43331a051b6mr8578255ab.10.1762127310115; Sun, 02 Nov 2025
 15:48:30 -0800 (PST)
Date: Sun, 02 Nov 2025 15:48:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6907edce.a70a0220.37351b.0014.GAE@google.com>
Subject: [syzbot] [nbd?] KASAN: slab-use-after-free Write in recv_work (3)
From: syzbot <syzbot+56fbf4c7ddf65e95c7cc@syzkaller.appspotmail.com>
To: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <H22qFa-8i6D.A.CX0M.EI_BpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3464
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6907edce.a70a0220.37351b.0014.GAE@google.com
Resent-Date: Mon,  3 Nov 2025 00:06:28 +0000 (UTC)

Hello,

syzbot found the following issue on:

HEAD commit:    98bd8b16ae57 Add linux-next specific files for 20251031
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16802292580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=55e89517f3847929
dashboard link: https://syzkaller.appspot.com/bug?extid=56fbf4c7ddf65e95c7cc
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=152a5012580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=108dee14580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f5d0f0fd772a/disk-98bd8b16.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ead68b596c79/vmlinux-98bd8b16.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6722387b293d/bzImage-98bd8b16.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+56fbf4c7ddf65e95c7cc@syzkaller.appspotmail.com

block nbd0: Receive control failed (result -32)
block nbd0: shutting down sockets
==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: slab-use-after-free in atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
BUG: KASAN: slab-use-after-free in recv_work+0x1b78/0x1c60 drivers/block/nbd.c:1028
Write of size 4 at addr ffff88802f2bee78 by task kworker/u9:1/5145

CPU: 0 UID: 0 PID: 5145 Comm: kworker/u9:1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
Workqueue: nbd0-recv recv_work
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xca/0x240 mm/kasan/report.c:482
 kasan_report+0x118/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x2b0/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
 recv_work+0x1b78/0x1c60 drivers/block/nbd.c:1028
 process_one_work+0x94a/0x15d0 kernel/workqueue.c:3267
 process_scheduled_works kernel/workqueue.c:3350 [inline]
 worker_thread+0x9b0/0xee0 kernel/workqueue.c:3431
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5998:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 poison_kmalloc_redzone mm/kasan/common.c:397 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:414
 kasan_kmalloc include/linux/kasan.h:262 [inline]
 __kmalloc_cache_noprof+0x3e2/0x700 mm/slub.c:5771
 kmalloc_noprof include/linux/slab.h:957 [inline]
 kzalloc_noprof include/linux/slab.h:1094 [inline]
 nbd_alloc_and_init_config+0x88/0x260 drivers/block/nbd.c:1683
 nbd_genl_connect+0x9d7/0x18f0 drivers/block/nbd.c:2145
 genl_family_rcv_msg_doit+0x215/0x300 net/netlink/genetlink.c:1115
 genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
 genl_rcv_msg+0x60e/0x790 net/netlink/genetlink.c:1210
 netlink_rcv_skb+0x208/0x470 net/netlink/af_netlink.c:2550
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1219
 netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
 netlink_unicast+0x82f/0x9e0 net/netlink/af_netlink.c:1344
 netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1894
 sock_sendmsg_nosec net/socket.c:727 [inline]
 __sock_sendmsg+0x21c/0x270 net/socket.c:746
 ____sys_sendmsg+0x505/0x830 net/socket.c:2634
 ___sys_sendmsg+0x21f/0x2a0 net/socket.c:2688
 __sys_sendmsg net/socket.c:2720 [inline]
 __do_sys_sendmsg net/socket.c:2725 [inline]
 __se_sys_sendmsg net/socket.c:2723 [inline]
 __x64_sys_sendmsg+0x19b/0x260 net/socket.c:2723
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5145:
 kasan_save_stack mm/kasan/common.c:56 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:77
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:252 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:284
 kasan_slab_free include/linux/kasan.h:234 [inline]
 slab_free_hook mm/slub.c:2547 [inline]
 slab_free mm/slub.c:6638 [inline]
 kfree+0x19a/0x6d0 mm/slub.c:6845
 nbd_config_put+0x4a1/0x580 drivers/block/nbd.c:1463
 recv_work+0x1b62/0x1c60 drivers/block/nbd.c:1027
 process_one_work+0x94a/0x15d0 kernel/workqueue.c:3267
 process_scheduled_works kernel/workqueue.c:3350 [inline]
 worker_thread+0x9b0/0xee0 kernel/workqueue.c:3431
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff88802f2bee00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 120 bytes inside of
 freed 256-byte region [ffff88802f2bee00, ffff88802f2bef00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2f2be
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b026b40 dead000000000122 0000000000000000
raw: 0000000000000000 0000000080100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b026b40 dead000000000122 0000000000000000
head: 0000000000000000 0000000080100010 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffea0000bcaf81 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5937, tgid 5937 (syz-executor), ts 108999640718, free_ts 108976063617
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x240/0x2a0 mm/page_alloc.c:1851
 prep_new_page mm/page_alloc.c:1859 [inline]
 get_page_from_freelist+0x2365/0x2440 mm/page_alloc.c:3920
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:5214
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2479
 alloc_slab_page mm/slub.c:3063 [inline]
 allocate_slab+0x96/0x350 mm/slub.c:3236
 new_slab mm/slub.c:3290 [inline]
 ___slab_alloc+0xe94/0x18a0 mm/slub.c:4659
 __slab_alloc+0x65/0x100 mm/slub.c:4778
 __slab_alloc_node mm/slub.c:4854 [inline]
 slab_alloc_node mm/slub.c:5276 [inline]
 __do_kmalloc_node mm/slub.c:5649 [inline]
 __kmalloc_noprof+0x47d/0x800 mm/slub.c:5662
 kmalloc_noprof include/linux/slab.h:961 [inline]
 kmalloc_array_noprof include/linux/slab.h:1003 [inline]
 genl_family_rcv_msg_attrs_parse+0xa3/0x2a0 net/netlink/genetlink.c:940
 genl_family_rcv_msg_doit+0xb8/0x300 net/netlink/genetlink.c:1093
 genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
 genl_rcv_msg+0x60e/0x790 net/netlink/genetlink.c:1210
 netlink_rcv_skb+0x208/0x470 net/netlink/af_netlink.c:2550
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1219
 netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
 netlink_unicast+0x82f/0x9e0 net/netlink/af_netlink.c:1344
 netlink_sendmsg+0x805/0xb30 net/netlink/af_netlink.c:1894
 sock_sendmsg_nosec net/socket.c:727 [inline]
 __sock_sendmsg+0x21c/0x270 net/socket.c:746
page last free pid 5937 tgid 5937 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1395 [inline]
 __free_frozen_pages+0xbc8/0xd30 mm/page_alloc.c:2948
 __slab_free+0x2e7/0x390 mm/slub.c:5970
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:349
 kasan_slab_alloc include/linux/kasan.h:252 [inline]
 slab_post_alloc_hook mm/slub.c:4978 [inline]
 slab_alloc_node mm/slub.c:5288 [inline]
 kmem_cache_alloc_noprof+0x37d/0x700 mm/slub.c:5295
 __kernfs_new_node+0xd7/0x7e0 fs/kernfs/dir.c:637
 kernfs_new_node+0x102/0x210 fs/kernfs/dir.c:713
 __kernfs_create_file+0x4b/0x2e0 fs/kernfs/file.c:1057
 sysfs_add_file_mode_ns+0x238/0x300 fs/sysfs/file.c:313
 sysfs_merge_group+0x177/0x310 fs/sysfs/group.c:376
 dpm_sysfs_add+0xd2/0x270 drivers/base/power/sysfs.c:704
 device_add+0x4d8/0xb80 drivers/base/core.c:3649
 wiphy_register+0x1d2e/0x2d20 net/wireless/core.c:1035
 ieee80211_register_hw+0x34a7/0x4110 net/mac80211/main.c:1591
 mac80211_hwsim_new_radio+0x2f85/0x5340 drivers/net/wireless/virtual/mac80211_hwsim.c:5804

Memory state around the buggy address:
 ffff88802f2bed00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88802f2bed80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88802f2bee00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                ^
 ffff88802f2bee80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802f2bef00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

