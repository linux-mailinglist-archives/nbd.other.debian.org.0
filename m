Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A80389F07F2
	for <lists+nbd@lfdr.de>; Fri, 13 Dec 2024 10:33:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 904DF204E2; Fri, 13 Dec 2024 09:33:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec 13 09:33:11 2024
Old-Return-Path: <3ZftbZwkbAA46CDyozzs5o33wr.u22uzs86s5q217s17.q20@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	FVGT_m_MULTI_ODD,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TO_TOO_MANY,URIBL_SBL_A autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EF22820501
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Dec 2024 09:16:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.623 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	FVGT_m_MULTI_ODD=0.02, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id l0amdGbwTgqR for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Dec 2024 09:16:28 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-io1-f78.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0910520484
	for <nbd@other.debian.org>; Fri, 13 Dec 2024 09:16:24 +0000 (UTC)
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-844e6476ab1so145767439f.3
        for <nbd@other.debian.org>; Fri, 13 Dec 2024 01:16:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734081381; x=1734686181;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gkQu65Oe2VrGr/EpzjzCmzNfFTy9Q2nYTevEyzM7mbo=;
        b=XDjiZEKVitC/fzn4kgc7qPzCe0pBm5iA04dWn9m9YaOfdCqbZ3qMCk/OGTapoTt1h6
         Im/ozjXr6/LELcD2JAEfLe1kGE1MkBaVPXFFT/BfQ62c7LEamGHWAlhU5OTZk912kOts
         MAau4v6EOkmzAdp4asWZHnNuzx4Zb27EesFtQCRvA+HnLxL+PpjEnf6i6uZCt0W3d+ur
         SfB5iJEJQRtd49pMi9VJmzGkMyMXqjeFSObYahZxHBCmd0+3TwHj2f1TxjkBMIS84D/P
         R1NSNCbkeSOJqTD8pqo9wMuVy1E2EnSownkBqLmRaubl90vMvNQcW1kHu2GWKzHO0XBL
         I3rw==
X-Forwarded-Encrypted: i=1; AJvYcCXnxnyojqIVEXLp3uJkiv7HRUljyoAe5Xgfl+Ib0XZKjb0/MriqZGmrEVS/UZIDU8fKkFY=@other.debian.org
X-Gm-Message-State: AOJu0YzbkVtbZkbYakzrrhWeBEjT3ZbzDGh/cb/VJRyKRQuRmLF7u39A
	iYAIigkr8ffCjfHuR2grcm+Ea1tRTb+YLavTEVEJIxk6zjkKi7La57++o9noGtboLIYxIIqr4nS
	xLZBL8yMf4rTfrRagEtkx+5fI3vTVu9qhaZoC1hnjzwBZXW7z8q10tHs=
X-Google-Smtp-Source: AGHT+IExhJm+UsGvGT0jkX6/MScYpP4m33bTT558AQtzk2asTxFwMnoVUlTgE2w+pLERmXQl2RxqeHV2GA0veI07pDtO8m0P/3j/
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a07:b0:3a3:b3f4:af42 with SMTP id
 e9e14a558f8ab-3aff5397321mr18401995ab.7.1734081381111; Fri, 13 Dec 2024
 01:16:21 -0800 (PST)
Date: Fri, 13 Dec 2024 01:16:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <675bfb65.050a0220.1a2d0d.0006.GAE@google.com>
Subject: [syzbot] [nbd?] KASAN: slab-use-after-free Write in recv_work
From: syzbot <syzbot+6b0df248918b92c33e6a@syzkaller.appspotmail.com>
To: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Z-F0rjbdfxM.A.Jfv.X9_WnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3200
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/675bfb65.050a0220.1a2d0d.0006.GAE@google.com
Resent-Date: Fri, 13 Dec 2024 09:33:11 +0000 (UTC)

Hello,

syzbot found the following issue on:

HEAD commit:    7503345ac5f5 Merge tag 'block-6.13-20241207' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15220c0f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1362a5aee630ff34
dashboard link: https://syzkaller.appspot.com/bug?extid=6b0df248918b92c33e6a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-7503345a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e95a2b302e11/vmlinux-7503345a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e78c0c786fb3/bzImage-7503345a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6b0df248918b92c33e6a@syzkaller.appspotmail.com

Bluetooth: hci0: command tx timeout
block nbd0: Receive control failed (result -32)
block nbd0: shutting down sockets
==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: slab-use-after-free in atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
BUG: KASAN: slab-use-after-free in recv_work+0x2280/0x25c0 drivers/block/nbd.c:961
Write of size 4 at addr ffff88803e947e78 by task kworker/u5:2/5301

CPU: 0 UID: 0 PID: 5301 Comm: kworker/u5:2 Not tainted 6.13.0-rc1-syzkaller-00337-g7503345ac5f5 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: nbd0-recv recv_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:489
 kasan_report+0x143/0x180 mm/kasan/report.c:602
 kasan_check_range+0x282/0x290 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
 recv_work+0x2280/0x25c0 drivers/block/nbd.c:961
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3310
 worker_thread+0x870/0xd30 kernel/workqueue.c:3391
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 5314:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __kmalloc_cache_noprof+0x243/0x390 mm/slub.c:4314
 kmalloc_noprof include/linux/slab.h:901 [inline]
 kzalloc_noprof include/linux/slab.h:1037 [inline]
 nbd_alloc_and_init_config+0x88/0x260 drivers/block/nbd.c:1596
 nbd_genl_connect+0xcba/0x1c80 drivers/block/nbd.c:2059
 genl_family_rcv_msg_doit net/netlink/genetlink.c:1115 [inline]
 genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
 genl_rcv_msg+0xb14/0xec0 net/netlink/genetlink.c:1210
 netlink_rcv_skb+0x1e3/0x430 net/netlink/af_netlink.c:2542
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1219
 netlink_unicast_kernel net/netlink/af_netlink.c:1321 [inline]
 netlink_unicast+0x7f6/0x990 net/netlink/af_netlink.c:1347
 netlink_sendmsg+0x8e4/0xcb0 net/netlink/af_netlink.c:1891
 sock_sendmsg_nosec net/socket.c:711 [inline]
 __sock_sendmsg+0x221/0x270 net/socket.c:726
 ____sys_sendmsg+0x52a/0x7e0 net/socket.c:2583
 ___sys_sendmsg net/socket.c:2637 [inline]
 __sys_sendmsg+0x269/0x350 net/socket.c:2669
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5301:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:582
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x59/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2338 [inline]
 slab_free mm/slub.c:4598 [inline]
 kfree+0x196/0x430 mm/slub.c:4746
 nbd_config_put+0x67d/0x7e0 drivers/block/nbd.c:1386
 recv_work+0x226a/0x25c0 drivers/block/nbd.c:960
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3310
 worker_thread+0x870/0xd30 kernel/workqueue.c:3391
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

The buggy address belongs to the object at ffff88803e947e00
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 120 bytes inside of
 freed 256-byte region [ffff88803e947e00, ffff88803e947f00)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3e947
ksm flags: 0x4fff00000000000(node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000000 ffff88801ac41b40 ffffea0000fb95c0 dead000000000003
raw: 0000000000000000 0000000080080008 00000001f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 1, tgid 1 (swapper/0), ts 17751892312, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f3/0x230 mm/page_alloc.c:1556
 prep_new_page mm/page_alloc.c:1564 [inline]
 get_page_from_freelist+0x365c/0x37a0 mm/page_alloc.c:3474
 __alloc_pages_noprof+0x292/0x710 mm/page_alloc.c:4751
 alloc_pages_mpol_noprof+0x3e8/0x680 mm/mempolicy.c:2265
 alloc_slab_page+0x6a/0x140 mm/slub.c:2408
 allocate_slab+0x5a/0x2f0 mm/slub.c:2574
 new_slab mm/slub.c:2627 [inline]
 ___slab_alloc+0xcd1/0x14b0 mm/slub.c:3815
 __slab_alloc+0x58/0xa0 mm/slub.c:3905
 __slab_alloc_node mm/slub.c:3980 [inline]
 slab_alloc_node mm/slub.c:4141 [inline]
 __do_kmalloc_node mm/slub.c:4282 [inline]
 __kmalloc_node_noprof+0x2ee/0x4d0 mm/slub.c:4289
 __kvmalloc_node_noprof+0x72/0x190 mm/util.c:650
 v4l2_ctrl_new+0x910/0x1910 drivers/media/v4l2-core/v4l2-ctrls-core.c:1931
 v4l2_ctrl_new_std+0x449/0x5b0 drivers/media/v4l2-core/v4l2-ctrls-core.c:2068
 handler_new_ref+0x1fe/0x940 drivers/media/v4l2-core/v4l2-ctrls-core.c:1689
 v4l2_ctrl_add_handler+0x1a1/0x290 drivers/media/v4l2-core/v4l2-ctrls-core.c:2212
 vivid_create_controls+0x37dd/0x4140 drivers/media/test-drivers/vivid/vivid-ctrls.c:2030
 vivid_create_instance drivers/media/test-drivers/vivid/vivid-core.c:1931 [inline]
 vivid_probe+0x48ba/0x7cf0 drivers/media/test-drivers/vivid/vivid-core.c:2093
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88803e947d00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88803e947d80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88803e947e00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                ^
 ffff88803e947e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803e947f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


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

