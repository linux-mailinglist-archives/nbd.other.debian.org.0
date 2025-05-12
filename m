Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8781DAB47C4
	for <lists+nbd@lfdr.de>; Tue, 13 May 2025 01:03:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5D48420576; Mon, 12 May 2025 23:03:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 12 23:03:12 2025
Old-Return-Path: <3BHoiaAkbAMk7DEzp00t6p44xs.v33v0t97t6r328t28.r31@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=4.0 tests=FOURLA,FROM_LOCAL_HEX,
	FVGT_m_MULTI_ODD,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,TO_TOO_MANY,WORD_WITHOUT_VOWELS
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C15D22052C
	for <lists-other-nbd@bendel.debian.org>; Mon, 12 May 2025 22:45:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.23 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FROM_LOCAL_HEX=0.006,
	FVGT_m_MULTI_ODD=0.02, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, TO_TOO_MANY=1, URIBL_SBL_A=0.1,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1LvLJ5KVg06W for <lists-other-nbd@bendel.debian.org>;
	Mon, 12 May 2025 22:45:33 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-il1-f207.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0F7D920515
	for <nbd@other.debian.org>; Mon, 12 May 2025 22:45:27 +0000 (UTC)
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3da731b7df8so48709155ab.1
        for <nbd@other.debian.org>; Mon, 12 May 2025 15:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747089924; x=1747694724;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hqbhKFiX0gkaWgzt5g7mGnx9EKqaLGog2TNAwQZBVGM=;
        b=OlCfwxa2MlL5GccIv00xhPr7kEsdMcRJfQdFPhg6a8Zfne9IxOu/HVO+yXcSwrBcPf
         e04vV0LDjdmRYp3LI7ofs1vOYoHJZUYCDJN37PGwLc0vrwwvDSu1FbEpi29lIuMRXAlB
         1kXB/Ole5L+nVgy+Ya3ish9laKt6sKBxFL6FGIOi8ypRqFBi+/WQzLzu/rBXcOV6HRo4
         Tz8GT2L/FaCavz6RpG3bK6pXurdubzSZLg4iTrdCcquiUcpAqj1eSkgH0ny8kte++UvT
         Jlzt6gDVvYFCq/uYLVRLAwu+o28Si77VE7n5RmCcPxcxDM93O6DutZ0uACf+g2OVJNyt
         j69Q==
X-Forwarded-Encrypted: i=1; AJvYcCXw3PXVrDQgoLtG/OWka5ZSQwa7lEvrnhWkyoj3xLSADT2WL6JGlKTCjHH/3wsCHZQO2LA=@other.debian.org
X-Gm-Message-State: AOJu0YykYmoW6kg5V1jV6gV9kkUYyu5k62fqudPZOWM5O+AcozCT+qR/
	3Lgs/VX5/gjRn0c0HVfng4zNZsuGIjkZYKd9TIIHgjqQqOLx3aX57t7vDCtcthYOmwdQ152gRji
	QPY+zByUW9tAi0CRGONwR2aNVTxs7eUAAobliq4dZMrjCSx+awMsecEU=
X-Google-Smtp-Source: AGHT+IEwmwUiXthAE0Eb4/SyWnRzE1nYBkFptOFOiTynfSoqxDq5YXpRpAGxRrkepKJ1TPB79Fc2ZO+VeHWofvsDAammt/5RywVx
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b09:b0:3d3:fa69:6755 with SMTP id
 e9e14a558f8ab-3db663b8eb2mr14244235ab.5.1747089924226; Mon, 12 May 2025
 15:45:24 -0700 (PDT)
Date: Mon, 12 May 2025 15:45:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68227a04.050a0220.f2294.00b5.GAE@google.com>
Subject: [syzbot] [nbd?] KASAN: slab-use-after-free Write in recv_work (2)
From: syzbot <syzbot+48240bab47e705c53126@syzkaller.appspotmail.com>
To: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7DX26GYX06K.A.RsiO.w4nIoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3376
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/68227a04.050a0220.f2294.00b5.GAE@google.com
Resent-Date: Mon, 12 May 2025 23:03:12 +0000 (UTC)

Hello,

syzbot found the following issue on:

HEAD commit:    2c89c1b655c0 Merge tag 'net-6.15-rc6' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10a38768580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b39cb28b0a399ed3
dashboard link: https://syzkaller.appspot.com/bug?extid=48240bab47e705c53126
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=154bd4f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1578c670580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-2c89c1b6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/597b69724951/vmlinux-2c89c1b6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ff3b903b9d6f/bzImage-2c89c1b6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+48240bab47e705c53126@syzkaller.appspotmail.com

block nbd6: Receive control failed (result -104)
block nbd6: shutting down sockets
==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: slab-use-after-free in atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
BUG: KASAN: slab-use-after-free in recv_work+0x694/0xa80 drivers/block/nbd.c:1022
Write of size 4 at addr ffff8880295de478 by task kworker/u33:0/67

CPU: 2 UID: 0 PID: 67 Comm: kworker/u33:0 Not tainted 6.15.0-rc5-syzkaller-00123-g2c89c1b655c0 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: nbd6-recv recv_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xc3/0x670 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0xef/0x1a0 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
 recv_work+0x694/0xa80 drivers/block/nbd.c:1022
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5940:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394
 kmalloc_noprof include/linux/slab.h:905 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 nbd_alloc_and_init_config+0x97/0x2a0 drivers/block/nbd.c:1659
 nbd_genl_connect+0x490/0x1c20 drivers/block/nbd.c:2121
 genl_family_rcv_msg_doit+0x206/0x2f0 net/netlink/genetlink.c:1115
 genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
 genl_rcv_msg+0x55c/0x800 net/netlink/genetlink.c:1210
 netlink_rcv_skb+0x16a/0x440 net/netlink/af_netlink.c:2534
 genl_rcv+0x28/0x40 net/netlink/genetlink.c:1219
 netlink_unicast_kernel net/netlink/af_netlink.c:1313 [inline]
 netlink_unicast+0x53a/0x7f0 net/netlink/af_netlink.c:1339
 netlink_sendmsg+0x8d1/0xdd0 net/netlink/af_netlink.c:1883
 sock_sendmsg_nosec net/socket.c:712 [inline]
 __sock_sendmsg net/socket.c:727 [inline]
 ____sys_sendmsg+0xa95/0xc70 net/socket.c:2566
 ___sys_sendmsg+0x134/0x1d0 net/socket.c:2620
 __sys_sendmsg+0x16d/0x220 net/socket.c:2652
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xcd/0x260 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 67:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2380 [inline]
 slab_free mm/slub.c:4642 [inline]
 kfree+0x2b6/0x4d0 mm/slub.c:4841
 nbd_config_put+0x3c1/0x750 drivers/block/nbd.c:1449
 recv_work+0x681/0xa80 drivers/block/nbd.c:1021
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880295de400
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 120 bytes inside of
 freed 256-byte region [ffff8880295de400, ffff8880295de500)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x295de
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
anon flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801b442b40 0000000000000000 dead000000000001
raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000040 ffff88801b442b40 0000000000000000 dead000000000001
head: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
head: 00fff00000000001 ffffea0000a57781 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000002
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 13520876544, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x181/0x1b0 mm/page_alloc.c:1718
 prep_new_page mm/page_alloc.c:1726 [inline]
 get_page_from_freelist+0x135c/0x3920 mm/page_alloc.c:3688
 __alloc_frozen_pages_noprof+0x263/0x23a0 mm/page_alloc.c:4970
 alloc_pages_mpol+0x1fb/0x550 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab mm/slub.c:2618 [inline]
 new_slab+0x244/0x340 mm/slub.c:2672
 ___slab_alloc+0xd9c/0x1940 mm/slub.c:3858
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3948
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kmalloc_noprof+0x2f2/0x510 mm/slub.c:4339
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kzalloc_noprof include/linux/slab.h:1039 [inline]
 rh_call_control drivers/usb/core/hcd.c:491 [inline]
 rh_urb_enqueue drivers/usb/core/hcd.c:821 [inline]
 usb_hcd_submit_urb+0x5cf/0x1c60 drivers/usb/core/hcd.c:1529
 usb_submit_urb+0x87c/0x1730 drivers/usb/core/urb.c:581
 usb_start_wait_urb+0x104/0x4b0 drivers/usb/core/message.c:59
 usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
 usb_control_msg+0x326/0x4a0 drivers/usb/core/message.c:154
 usb_get_string+0xab/0x1a0 drivers/usb/core/message.c:844
 usb_string_sub+0x107/0x390 drivers/usb/core/message.c:883
 usb_string+0x307/0x670 drivers/usb/core/message.c:988
 usb_cache_string+0x80/0x150 drivers/usb/core/message.c:1030
page_owner free stack trace missing

Memory state around the buggy address:
 ffff8880295de300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880295de380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880295de400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                ^
 ffff8880295de480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880295de500: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
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

