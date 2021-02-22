Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAC4321227
	for <lists+nbd@lfdr.de>; Mon, 22 Feb 2021 09:42:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 18E6520568; Mon, 22 Feb 2021 08:42:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 22 08:42:10 2021
Old-Return-Path: <3bmozYAkbABkHNO9zAA3GzEE72.5DD5A3JH3G1DCI3CI.1DB@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FROM_LOCAL_HEX,FVGT_m_MULTI_ODD,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 882282056F
	for <lists-other-nbd@bendel.debian.org>; Mon, 22 Feb 2021 08:25:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.394 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FROM_LOCAL_HEX=0.006, FVGT_m_MULTI_ODD=0.02,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id m0AQ-rg1z_Xc for <lists-other-nbd@bendel.debian.org>;
	Mon, 22 Feb 2021 08:25:25 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-il1-f199.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id F343820549
	for <nbd@other.debian.org>; Mon, 22 Feb 2021 08:25:21 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id h17so7103505ila.12
        for <nbd@other.debian.org>; Mon, 22 Feb 2021 00:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=c8hXqBBz+8mXOrISI8+t5InjB6QMByMBQpfz881C0bs=;
        b=Qeb4jV+RPnRHFp3JmzG3MI7AT8h6yj6YFvR5f8viz2uf1na0/J5/6QazDudJrU8DjO
         FCN8TAx8amJRSIqsZeYIm+/wTEj9ari+xPtjDxAjTQ1LM3xzddv17bJRyraTVDof1H/C
         MxsNB+XnkS+UDpRFGYGwNXtzVrTZXhxkaJLXU2I8SS7NECdAxh/0z0Y5VbcDLT5srDDu
         oPjsSJMwu4WHSxPz+vZ9lY7AdNjpgpelIv7ai5TOOtbuCHx23apW7FQg8uIzHOZARXk4
         6NmwcE9FjRiaVE0CnwAyIpKRumCuAZiZr7Biz7i3tz6lLJ6KLrh4Yi9kFkbbajNUN8CJ
         hyGA==
X-Gm-Message-State: AOAM531HAfWP/qwoLsh8nt6qRjOi5756CgmSKrCTeUmI2euuqhDxewYD
	c/EcRChW3PBnxcU1hT/e8v9NKg1BmPqT0J49Q0p2CEfRhX6x
X-Google-Smtp-Source: ABdhPJz5253lID0hJ3vzkyQ6t2Ou9t9uHrukzVPiB/2GaLfMqYi/OgnFaHEv65Yze8nKZu4dty/sTYk7uhr05Umn4iSkzdG2qy0k
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1806:: with SMTP id a6mr14168565ilv.8.1613982318043;
 Mon, 22 Feb 2021 00:25:18 -0800 (PST)
Date: Mon, 22 Feb 2021 00:25:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bda69205bbe88a09@google.com>
Subject: KASAN: use-after-free Read in nbd_genl_connect
From: syzbot <syzbot+429d3f82d757c211bff3@syzkaller.appspotmail.com>
To: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <CFIRlKuMq_.A.nQG.i52MgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1138
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/000000000000bda69205bbe88a09@google.com
Resent-Date: Mon, 22 Feb 2021 08:42:10 +0000 (UTC)

Hello,

syzbot found the following issue on:

HEAD commit:    f40ddce8 Linux 5.11
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=179e8d22d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e53d04227c52a0df
dashboard link: https://syzkaller.appspot.com/bug?extid=429d3f82d757c211bff3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10d190cad00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13dc8a82d00000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1128ae60d00000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1328ae60d00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1528ae60d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+429d3f82d757c211bff3@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in instrument_atomic_read include/linux/instrumented.h:71 [inline]
BUG: KASAN: use-after-free in atomic_read include/asm-generic/atomic-instrumented.h:27 [inline]
BUG: KASAN: use-after-free in refcount_dec_not_one+0x71/0x1e0 lib/refcount.c:76
Read of size 4 at addr ffff888014ca19a0 by task syz-executor980/8540

CPU: 0 PID: 8540 Comm: syz-executor980 Not tainted 5.11.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 print_address_description.constprop.0.cold+0x5b/0x2f8 mm/kasan/report.c:230
 __kasan_report mm/kasan/report.c:396 [inline]
 kasan_report.cold+0x79/0xd5 mm/kasan/report.c:413
 check_memory_region_inline mm/kasan/generic.c:179 [inline]
 check_memory_region+0x13d/0x180 mm/kasan/generic.c:185
 instrument_atomic_read include/linux/instrumented.h:71 [inline]
 atomic_read include/asm-generic/atomic-instrumented.h:27 [inline]
 refcount_dec_not_one+0x71/0x1e0 lib/refcount.c:76
 refcount_dec_and_mutex_lock+0x19/0x140 lib/refcount.c:115
 nbd_put drivers/block/nbd.c:248 [inline]
 nbd_genl_connect+0xee7/0x1560 drivers/block/nbd.c:1980
 genl_family_rcv_msg_doit+0x228/0x320 net/netlink/genetlink.c:739
 genl_family_rcv_msg net/netlink/genetlink.c:783 [inline]
 genl_rcv_msg+0x328/0x580 net/netlink/genetlink.c:800
 netlink_rcv_skb+0x153/0x420 net/netlink/af_netlink.c:2494
 genl_rcv+0x24/0x40 net/netlink/genetlink.c:811
 netlink_unicast_kernel net/netlink/af_netlink.c:1304 [inline]
 netlink_unicast+0x533/0x7d0 net/netlink/af_netlink.c:1330
 netlink_sendmsg+0x856/0xd90 net/netlink/af_netlink.c:1919
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:672
 ____sys_sendmsg+0x6e8/0x810 net/socket.c:2345
 ___sys_sendmsg+0xf3/0x170 net/socket.c:2399
 __sys_sendmsg+0xe5/0x1b0 net/socket.c:2432
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x440709
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd63e9cc88 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 000000000000e3fb RCX: 0000000000440709
RDX: 0000000000000000 RSI: 0000000020000340 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 00007ffd63e9ce28
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffd63e9cc9c
R13: 431bde82d7b634db R14: 00000000004ae018 R15: 00000000004004a0

Allocated by task 8536:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:46 [inline]
 set_alloc_info mm/kasan/common.c:401 [inline]
 ____kasan_kmalloc.constprop.0+0x82/0xa0 mm/kasan/common.c:429
 kmalloc include/linux/slab.h:552 [inline]
 kzalloc include/linux/slab.h:682 [inline]
 nbd_dev_add+0x44/0x8e0 drivers/block/nbd.c:1673
 nbd_genl_connect+0x59c/0x1560 drivers/block/nbd.c:1838
 genl_family_rcv_msg_doit+0x228/0x320 net/netlink/genetlink.c:739
 genl_family_rcv_msg net/netlink/genetlink.c:783 [inline]
 genl_rcv_msg+0x328/0x580 net/netlink/genetlink.c:800
 netlink_rcv_skb+0x153/0x420 net/netlink/af_netlink.c:2494
 genl_rcv+0x24/0x40 net/netlink/genetlink.c:811
 netlink_unicast_kernel net/netlink/af_netlink.c:1304 [inline]
 netlink_unicast+0x533/0x7d0 net/netlink/af_netlink.c:1330
 netlink_sendmsg+0x856/0xd90 net/netlink/af_netlink.c:1919
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:672
 ____sys_sendmsg+0x6e8/0x810 net/socket.c:2345
 ___sys_sendmsg+0xf3/0x170 net/socket.c:2399
 __sys_sendmsg+0xe5/0x1b0 net/socket.c:2432
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Freed by task 8540:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track+0x1c/0x30 mm/kasan/common.c:46
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:356
 ____kasan_slab_free+0xe1/0x110 mm/kasan/common.c:362
 kasan_slab_free include/linux/kasan.h:192 [inline]
 slab_free_hook mm/slub.c:1547 [inline]
 slab_free_freelist_hook+0x5d/0x150 mm/slub.c:1580
 slab_free mm/slub.c:3143 [inline]
 kfree+0xdb/0x3b0 mm/slub.c:4139
 nbd_dev_remove drivers/block/nbd.c:243 [inline]
 nbd_put.part.0+0x180/0x1d0 drivers/block/nbd.c:251
 nbd_put drivers/block/nbd.c:295 [inline]
 nbd_config_put+0x6dd/0x8c0 drivers/block/nbd.c:1242
 nbd_genl_connect+0xeb7/0x1560 drivers/block/nbd.c:1978
 genl_family_rcv_msg_doit+0x228/0x320 net/netlink/genetlink.c:739
 genl_family_rcv_msg net/netlink/genetlink.c:783 [inline]
 genl_rcv_msg+0x328/0x580 net/netlink/genetlink.c:800
 netlink_rcv_skb+0x153/0x420 net/netlink/af_netlink.c:2494
 genl_rcv+0x24/0x40 net/netlink/genetlink.c:811
 netlink_unicast_kernel net/netlink/af_netlink.c:1304 [inline]
 netlink_unicast+0x533/0x7d0 net/netlink/af_netlink.c:1330
 netlink_sendmsg+0x856/0xd90 net/netlink/af_netlink.c:1919
 sock_sendmsg_nosec net/socket.c:652 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:672
 ____sys_sendmsg+0x6e8/0x810 net/socket.c:2345
 ___sys_sendmsg+0xf3/0x170 net/socket.c:2399
 __sys_sendmsg+0xe5/0x1b0 net/socket.c:2432
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The buggy address belongs to the object at ffff888014ca1800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 416 bytes inside of
 1024-byte region [ffff888014ca1800, ffff888014ca1c00)
The buggy address belongs to the page:
page:0000000086766889 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x14ca0
head:0000000086766889 order:3 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head)
raw: 00fff00000010200 ffffea0000929400 0000000200000002 ffff888010c41140
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888014ca1880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888014ca1900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888014ca1980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                               ^
 ffff888014ca1a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888014ca1a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

