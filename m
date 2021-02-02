Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C14A30BC49
	for <lists+nbd@lfdr.de>; Tue,  2 Feb 2021 11:45:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F1B5B2072B; Tue,  2 Feb 2021 10:45:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb  2 10:45:09 2021
Old-Return-Path: <3RCkZYAkbAAMv12ndoohudsslg.jrrjohxvhufrqwhqw.frp@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,TO_TOO_MANY autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 87B6320596
	for <lists-other-nbd@bendel.debian.org>; Tue,  2 Feb 2021 10:28:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.355 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FROM_LOCAL_HEX=0.006, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CuWLGEH8Q8ro for <lists-other-nbd@bendel.debian.org>;
	Tue,  2 Feb 2021 10:28:27 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-il1-f198.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C843A20589
	for <nbd@other.debian.org>; Tue,  2 Feb 2021 10:28:24 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id b10so359415ilh.7
        for <nbd@other.debian.org>; Tue, 02 Feb 2021 02:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=MlUXTuM6nOcMNaAgBlcrcz9jVk5WWusj8rtcdYwVnH0=;
        b=AgGjJzQNoe2/4PWkhsIzNIC6kPJGEJHd9+aqBEdXXK+TQh9rGc0cQD2KIUUWS13tJ1
         R+uNOe4vBJrGgZSsOWhNEVqL+hD8yrmx4C2kqIuE+GnPeETy9wRtqar2QNUgaB/4gv/9
         PHA8onf0jm0ZbpFuqiZHLMLhaI7/LlAgtAi8+EZVTL5RPhkS1WjX+xtDom9N9OhVazwN
         FOqQWS+akE1DtmIk3YtAo4uxROaJ9bglTy0zBD8zgZdk3D1sypNFxUQAw/4yHGAufgYm
         i9+IPFWs6ZIXsFEtdvtafI6vKV5XrVkcv7haNh+jyt+1f8RxN4BhScV3deXDF89kzSx8
         I89A==
X-Gm-Message-State: AOAM5301E/mwL/K7bg9EdJBFjRaigpNau4zKVAhKqiE54Cn4yl+YL3JV
	HjuNRwYJskcYdPrmc/fmmA22zrHDTIMW8Edp6ojE/ljS0/rU
X-Google-Smtp-Source: ABdhPJwnAECBIuQx27J1xbO7XYer3HeB5Yjm9r18gXGnE5ccgp1BfxHjFaIEJucRIGDX/UirKlMvZBw2fbApYc7qlEFB6ZY8Hrlj
MIME-Version: 1.0
X-Received: by 2002:a92:8e4b:: with SMTP id k11mr16677869ilh.192.1612261700570;
 Tue, 02 Feb 2021 02:28:20 -0800 (PST)
Date: Tue, 02 Feb 2021 02:28:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f296a705ba57ed59@google.com>
Subject: KASAN: use-after-free Read in recv_work
From: syzbot <syzbot+f91dbbabacae745d334f@syzkaller.appspotmail.com>
To: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <iGGAxTHChXO.A.ZhC.10SGgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1115
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/000000000000f296a705ba57ed59@google.com
Resent-Date: Tue,  2 Feb 2021 10:45:09 +0000 (UTC)

Hello,

syzbot found the following issue on:

HEAD commit:    b01f250d Add linux-next specific files for 20210129
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14366378d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=725bc96dc234fda7
dashboard link: https://syzkaller.appspot.com/bug?extid=f91dbbabacae745d334f
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f91dbbabacae745d334f@syzkaller.appspotmail.com

block nbd5: Receive control failed (result -107)
==================================================================
BUG: KASAN: use-after-free in recv_work+0x2a2/0x2c0 drivers/block/nbd.c:787
Read of size 8 at addr ffff88801181ed20 by task kworker/u5:2/8465

CPU: 1 PID: 8465 Comm: kworker/u5:2 Not tainted 5.11.0-rc5-next-20210129-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: knbd5-recv recv_work
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 print_address_description.constprop.0.cold+0x5b/0x2f8 mm/kasan/report.c:232
 __kasan_report mm/kasan/report.c:399 [inline]
 kasan_report.cold+0x7c/0xd8 mm/kasan/report.c:416
 recv_work+0x2a2/0x2c0 drivers/block/nbd.c:787
 process_one_work+0x98d/0x15f0 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

Allocated by task 17044:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:46 [inline]
 set_alloc_info mm/kasan/common.c:403 [inline]
 ____kasan_kmalloc mm/kasan/common.c:434 [inline]
 ____kasan_kmalloc.constprop.0+0xa0/0xd0 mm/kasan/common.c:406
 kasan_slab_alloc include/linux/kasan.h:208 [inline]
 slab_post_alloc_hook mm/slab.h:516 [inline]
 slab_alloc_node mm/slub.c:2907 [inline]
 slab_alloc mm/slub.c:2915 [inline]
 __kmalloc_track_caller+0x16c/0x2e0 mm/slub.c:4550
 __do_krealloc mm/slab_common.c:1149 [inline]
 krealloc+0x60/0xa0 mm/slab_common.c:1178
 nbd_add_socket+0x263/0x6a0 drivers/block/nbd.c:1044
 __nbd_ioctl drivers/block/nbd.c:1369 [inline]
 nbd_ioctl+0x388/0xa50 drivers/block/nbd.c:1425
 blkdev_ioctl+0x2a1/0x6d0 block/ioctl.c:576
 block_ioctl+0xf9/0x140 fs/block_dev.c:1650
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Freed by task 17044:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track+0x1c/0x30 mm/kasan/common.c:46
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:357
 ____kasan_slab_free.part.0+0xe1/0x110 mm/kasan/common.c:364
 kasan_slab_free include/linux/kasan.h:191 [inline]
 slab_free_hook mm/slub.c:1562 [inline]
 slab_free_freelist_hook+0x82/0x1d0 mm/slub.c:1600
 slab_free mm/slub.c:3161 [inline]
 kfree+0xe5/0x7b0 mm/slub.c:4202
 krealloc+0x45/0xa0 mm/slab_common.c:1180
 nbd_add_socket+0x263/0x6a0 drivers/block/nbd.c:1044
 __nbd_ioctl drivers/block/nbd.c:1369 [inline]
 nbd_ioctl+0x388/0xa50 drivers/block/nbd.c:1425
 blkdev_ioctl+0x2a1/0x6d0 block/ioctl.c:576
 block_ioctl+0xf9/0x140 fs/block_dev.c:1650
 vfs_ioctl fs/ioctl.c:48 [inline]
 __do_sys_ioctl fs/ioctl.c:753 [inline]
 __se_sys_ioctl fs/ioctl.c:739 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The buggy address belongs to the object at ffff88801181ed20
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 0 bytes inside of
 8-byte region [ffff88801181ed20, ffff88801181ed28)
The buggy address belongs to the page:
page:00000000e0a0f4b5 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1181e
flags: 0xfff00000000200(slab)
raw: 00fff00000000200 ffffea000053d180 0000000500000005 ffff88800fc41280
raw: ffff88801181ef28 0000000080660062 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88801181ec00: fc 00 fc fc fc fc fa fc fc fc fc 00 fc fc fc fc
 ffff88801181ec80: fa fc fc fc fc 00 fc fc fc fc 00 fc fc fc fc 00
>ffff88801181ed00: fc fc fc fc fa fc fc fc fc 00 fc fc fc fc 00 fc
                               ^
 ffff88801181ed80: fc fc fc 00 fc fc fc fc 00 fc fc fc fc fa fc fc
 ffff88801181ee00: fc fc 00 fc fc fc fc fa fc fc fc fc 00 fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

