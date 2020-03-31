Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ADB199CD5
	for <lists+nbd@lfdr.de>; Tue, 31 Mar 2020 19:27:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EC33D2041D; Tue, 31 Mar 2020 17:27:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 31 17:27:13 2020
Old-Return-Path: <3s3mDXgkbAK4gmnYOZZSfOddWR.UccUZSigSfQcbhSbh.Qca@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2785820468
	for <lists-other-nbd@bendel.debian.org>; Tue, 31 Mar 2020 17:11:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.376 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FROM_LOCAL_DIGITS=0.001, FROM_LOCAL_HEX=0.006,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wSUVjHfEfFOF for <lists-other-nbd@bendel.debian.org>;
	Tue, 31 Mar 2020 17:11:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-il1-f198.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 05CD720453
	for <nbd@other.debian.org>; Tue, 31 Mar 2020 17:11:19 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id h10so20659458ilq.22
        for <nbd@other.debian.org>; Tue, 31 Mar 2020 10:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=GeqKjfeAdJEJGZUK1GjRw+TiUXvLDp+2kKiRMtW1LCk=;
        b=iyzyx5ihnJlmqrMRKzxa/r4NG4f58EIDXar6w5sOgQa1hwN2KjRIAlYfW6es5MtyPV
         6F225jovQtKmyvvYwV5zv2PPr/c61ZCsCkRVSFOuTcEaEneZXJj7UgV7akwPhodRJS0K
         diljde0qeYAIsmpUL+mrO1wfPs9tTFE10/rU7Oji6L1FvrH1TwZn5htjaf3Jo/J7wbEf
         tqUsnRlozE2ZtnYtPZsAlGydmfjY4D0W6GrHIA9O9fJGo1JZw3IxNihGesQRObBXeajT
         0DqY2SizR5bCNyic7JH2ZUnKysWLGLLtXvn6CSDlhFr6rTv/dez7FWEGfYXEDfr2J5in
         zrJg==
X-Gm-Message-State: ANhLgQ1Ky9CIJMeggBTaaJiZ7ovtp+iNy+psRICWlmz2KDBZn47TXvO9
	+aZEwpYfZHGup5q94tTeRbdGawKNtRARBOCjOGPAwP3WnMou
X-Google-Smtp-Source: ADFU+vt+Tkk/vonhfkivzolcbjP+ktb+edSvNeC5MpAAEcl8QjOIsuGNwdwt5tE0tU8UThY0NBr6tIuoUZHzvQQy8JX8ZuxIgRsR
MIME-Version: 1.0
X-Received: by 2002:a02:c551:: with SMTP id g17mr7773176jaj.52.1585674675789;
 Tue, 31 Mar 2020 10:11:15 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:11:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c7a80905a229a785@google.com>
Subject: memory leak in nbd_add_socket
From: syzbot <syzbot+934037347002901b8d2a@syzkaller.appspotmail.com>
To: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Y8LbFalJrTD.A.bbD.x13geB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/869
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/000000000000c7a80905a229a785@google.com
Resent-Date: Tue, 31 Mar 2020 17:27:13 +0000 (UTC)

Hello,

syzbot found the following crash on:

HEAD commit:    673b41e0 staging/octeon: fix up merge error
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15badadbe00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d97026d04c648459
dashboard link: https://syzkaller.appspot.com/bug?extid=934037347002901b8d2a
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12dbb747e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14421b9de00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+934037347002901b8d2a@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810fd584a0 (size 32):
  comm "syz-executor586", pid 8424, jiffies 4294961663 (age 40.060s)
  hex dump (first 32 bytes):
    2f 64 65 76 2f 6e 62 64 30 00 00 00 00 00 00 00  /dev/nbd0.......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000090cb73c8>] __do_krealloc mm/slab_common.c:1671 [inline]
    [<0000000090cb73c8>] krealloc+0x7c/0xa0 mm/slab_common.c:1700
    [<00000000cf9e6ba7>] nbd_add_socket+0x7d/0x1e0 drivers/block/nbd.c:1040
    [<0000000040a0a881>] __nbd_ioctl drivers/block/nbd.c:1373 [inline]
    [<0000000040a0a881>] nbd_ioctl+0x175/0x430 drivers/block/nbd.c:1437
    [<000000004972a55a>] __blkdev_driver_ioctl block/ioctl.c:322 [inline]
    [<000000004972a55a>] blkdev_ioctl+0x147/0x300 block/ioctl.c:718
    [<000000008903d911>] block_ioctl+0x50/0x70 fs/block_dev.c:1995
    [<00000000c37950d9>] vfs_ioctl fs/ioctl.c:47 [inline]
    [<00000000c37950d9>] ksys_ioctl+0xa6/0xd0 fs/ioctl.c:763
    [<00000000ffe4bbdc>] __do_sys_ioctl fs/ioctl.c:772 [inline]
    [<00000000ffe4bbdc>] __se_sys_ioctl fs/ioctl.c:770 [inline]
    [<00000000ffe4bbdc>] __x64_sys_ioctl+0x1a/0x20 fs/ioctl.c:770
    [<00000000ede38b98>] do_syscall_64+0x6e/0x220 arch/x86/entry/common.c:294
    [<00000000553f73d5>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88810fd584a0 (size 32):
  comm "syz-executor586", pid 8424, jiffies 4294961663 (age 40.170s)
  hex dump (first 32 bytes):
    2f 64 65 76 2f 6e 62 64 30 00 00 00 00 00 00 00  /dev/nbd0.......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000090cb73c8>] __do_krealloc mm/slab_common.c:1671 [inline]
    [<0000000090cb73c8>] krealloc+0x7c/0xa0 mm/slab_common.c:1700
    [<00000000cf9e6ba7>] nbd_add_socket+0x7d/0x1e0 drivers/block/nbd.c:1040
    [<0000000040a0a881>] __nbd_ioctl drivers/block/nbd.c:1373 [inline]
    [<0000000040a0a881>] nbd_ioctl+0x175/0x430 drivers/block/nbd.c:1437
    [<000000004972a55a>] __blkdev_driver_ioctl block/ioctl.c:322 [inline]
    [<000000004972a55a>] blkdev_ioctl+0x147/0x300 block/ioctl.c:718
    [<000000008903d911>] block_ioctl+0x50/0x70 fs/block_dev.c:1995
    [<00000000c37950d9>] vfs_ioctl fs/ioctl.c:47 [inline]
    [<00000000c37950d9>] ksys_ioctl+0xa6/0xd0 fs/ioctl.c:763
    [<00000000ffe4bbdc>] __do_sys_ioctl fs/ioctl.c:772 [inline]
    [<00000000ffe4bbdc>] __se_sys_ioctl fs/ioctl.c:770 [inline]
    [<00000000ffe4bbdc>] __x64_sys_ioctl+0x1a/0x20 fs/ioctl.c:770
    [<00000000ede38b98>] do_syscall_64+0x6e/0x220 arch/x86/entry/common.c:294
    [<00000000553f73d5>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88810fd584a0 (size 32):
  comm "syz-executor586", pid 8424, jiffies 4294961663 (age 40.270s)
  hex dump (first 32 bytes):
    2f 64 65 76 2f 6e 62 64 30 00 00 00 00 00 00 00  /dev/nbd0.......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000090cb73c8>] __do_krealloc mm/slab_common.c:1671 [inline]
    [<0000000090cb73c8>] krealloc+0x7c/0xa0 mm/slab_common.c:1700
    [<00000000cf9e6ba7>] nbd_add_socket+0x7d/0x1e0 drivers/block/nbd.c:1040
    [<0000000040a0a881>] __nbd_ioctl drivers/block/nbd.c:1373 [inline]
    [<0000000040a0a881>] nbd_ioctl+0x175/0x430 drivers/block/nbd.c:1437
    [<000000004972a55a>] __blkdev_driver_ioctl block/ioctl.c:322 [inline]
    [<000000004972a55a>] blkdev_ioctl+0x147/0x300 block/ioctl.c:718
    [<000000008903d911>] block_ioctl+0x50/0x70 fs/block_dev.c:1995
    [<00000000c37950d9>] vfs_ioctl fs/ioctl.c:47 [inline]
    [<00000000c37950d9>] ksys_ioctl+0xa6/0xd0 fs/ioctl.c:763
    [<00000000ffe4bbdc>] __do_sys_ioctl fs/ioctl.c:772 [inline]
    [<00000000ffe4bbdc>] __se_sys_ioctl fs/ioctl.c:770 [inline]
    [<00000000ffe4bbdc>] __x64_sys_ioctl+0x1a/0x20 fs/ioctl.c:770
    [<00000000ede38b98>] do_syscall_64+0x6e/0x220 arch/x86/entry/common.c:294
    [<00000000553f73d5>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88810fd584a0 (size 32):
  comm "syz-executor586", pid 8424, jiffies 4294961663 (age 40.380s)
  hex dump (first 32 bytes):
    2f 64 65 76 2f 6e 62 64 30 00 00 00 00 00 00 00  /dev/nbd0.......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000090cb73c8>] __do_krealloc mm/slab_common.c:1671 [inline]
    [<0000000090cb73c8>] krealloc+0x7c/0xa0 mm/slab_common.c:1700
    [<00000000cf9e6ba7>] nbd_add_socket+0x7d/0x1e0 drivers/block/nbd.c:1040
    [<0000000040a0a881>] __nbd_ioctl drivers/block/nbd.c:1373 [inline]
    [<0000000040a0a881>] nbd_ioctl+0x175/0x430 drivers/block/nbd.c:1437
    [<000000004972a55a>] __blkdev_driver_ioctl block/ioctl.c:322 [inline]
    [<000000004972a55a>] blkdev_ioctl+0x147/0x300 block/ioctl.c:718
    [<000000008903d911>] block_ioctl+0x50/0x70 fs/block_dev.c:1995
    [<00000000c37950d9>] vfs_ioctl fs/ioctl.c:47 [inline]
    [<00000000c37950d9>] ksys_ioctl+0xa6/0xd0 fs/ioctl.c:763
    [<00000000ffe4bbdc>] __do_sys_ioctl fs/ioctl.c:772 [inline]
    [<00000000ffe4bbdc>] __se_sys_ioctl fs/ioctl.c:770 [inline]
    [<00000000ffe4bbdc>] __x64_sys_ioctl+0x1a/0x20 fs/ioctl.c:770
    [<00000000ede38b98>] do_syscall_64+0x6e/0x220 arch/x86/entry/common.c:294
    [<00000000553f73d5>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88810fd584a0 (size 32):
  comm "syz-executor586", pid 8424, jiffies 4294961663 (age 40.480s)
  hex dump (first 32 bytes):
    2f 64 65 76 2f 6e 62 64 30 00 00 00 00 00 00 00  /dev/nbd0.......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000090cb73c8>] __do_krealloc mm/slab_common.c:1671 [inline]
    [<0000000090cb73c8>] krealloc+0x7c/0xa0 mm/slab_common.c:1700
    [<00000000cf9e6ba7>] nbd_add_socket+0x7d/0x1e0 drivers/block/nbd.c:1040
    [<0000000040a0a881>] __nbd_ioctl drivers/block/nbd.c:1373 [inline]
    [<0000000040a0a881>] nbd_ioctl+0x175/0x430 drivers/block/nbd.c:1437
    [<000000004972a55a>] __blkdev_driver_ioctl block/ioctl.c:322 [inline]
    [<000000004972a55a>] blkdev_ioctl+0x147/0x300 block/ioctl.c:718
    [<000000008903d911>] block_ioctl+0x50/0x70 fs/block_dev.c:1995
    [<00000000c37950d9>] vfs_ioctl fs/ioctl.c:47 [inline]
    [<00000000c37950d9>] ksys_ioctl+0xa6/0xd0 fs/ioctl.c:763
    [<00000000ffe4bbdc>] __do_sys_ioctl fs/ioctl.c:772 [inline]
    [<00000000ffe4bbdc>] __se_sys_ioctl fs/ioctl.c:770 [inline]
    [<00000000ffe4bbdc>] __x64_sys_ioctl+0x1a/0x20 fs/ioctl.c:770
    [<00000000ede38b98>] do_syscall_64+0x6e/0x220 arch/x86/entry/common.c:294
    [<00000000553f73d5>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88810fd584a0 (size 32):
  comm "syz-executor586", pid 8424, jiffies 4294961663 (age 40.590s)
  hex dump (first 32 bytes):
    2f 64 65 76 2f 6e 62 64 30 00 00 00 00 00 00 00  /dev/nbd0.......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000090cb73c8>] __do_krealloc mm/slab_common.c:1671 [inline]
    [<0000000090cb73c8>] krealloc+0x7c/0xa0 mm/slab_common.c:1700
    [<00000000cf9e6ba7>] nbd_add_socket+0x7d/0x1e0 drivers/block/nbd.c:1040
    [<0000000040a0a881>] __nbd_ioctl drivers/block/nbd.c:1373 [inline]
    [<0000000040a0a881>] nbd_ioctl+0x175/0x430 drivers/block/nbd.c:1437
    [<000000004972a55a>] __blkdev_driver_ioctl block/ioctl.c:322 [inline]
    [<000000004972a55a>] blkdev_ioctl+0x147/0x300 block/ioctl.c:718
    [<000000008903d911>] block_ioctl+0x50/0x70 fs/block_dev.c:1995
    [<00000000c37950d9>] vfs_ioctl fs/ioctl.c:47 [inline]
    [<00000000c37950d9>] ksys_ioctl+0xa6/0xd0 fs/ioctl.c:763
    [<00000000ffe4bbdc>] __do_sys_ioctl fs/ioctl.c:772 [inline]
    [<00000000ffe4bbdc>] __se_sys_ioctl fs/ioctl.c:770 [inline]
    [<00000000ffe4bbdc>] __x64_sys_ioctl+0x1a/0x20 fs/ioctl.c:770
    [<00000000ede38b98>] do_syscall_64+0x6e/0x220 arch/x86/entry/common.c:294
    [<00000000553f73d5>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88810fd584a0 (size 32):
  comm "syz-executor586", pid 8424, jiffies 4294961663 (age 40.690s)
  hex dump (first 32 bytes):
    2f 64 65 76 2f 6e 62 64 30 00 00 00 00 00 00 00  /dev/nbd0.......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000090cb73c8>] __do_krealloc mm/slab_common.c:1671 [inline]
    [<0000000090cb73c8>] krealloc+0x7c/0xa0 mm/slab_common.c:1700
    [<00000000cf9e6ba7>] nbd_add_socket+0x7d/0x1e0 drivers/block/nbd.c:1040
    [<0000000040a0a881>] __nbd_ioctl drivers/block/nbd.c:1373 [inline]
    [<0000000040a0a881>] nbd_ioctl+0x175/0x430 drivers/block/nbd.c:1437
    [<000000004972a55a>] __blkdev_driver_ioctl block/ioctl.c:322 [inline]
    [<000000004972a55a>] blkdev_ioctl+0x147/0x300 block/ioctl.c:718
    [<000000008903d911>] block_ioctl+0x50/0x70 fs/block_dev.c:1995
    [<00000000c37950d9>] vfs_ioctl fs/ioctl.c:47 [inline]
    [<00000000c37950d9>] ksys_ioctl+0xa6/0xd0 fs/ioctl.c:763
    [<00000000ffe4bbdc>] __do_sys_ioctl fs/ioctl.c:772 [inline]
    [<00000000ffe4bbdc>] __se_sys_ioctl fs/ioctl.c:770 [inline]
    [<00000000ffe4bbdc>] __x64_sys_ioctl+0x1a/0x20 fs/ioctl.c:770
    [<00000000ede38b98>] do_syscall_64+0x6e/0x220 arch/x86/entry/common.c:294
    [<00000000553f73d5>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88810fd584a0 (size 32):
  comm "syz-executor586", pid 8424, jiffies 4294961663 (age 40.800s)
  hex dump (first 32 bytes):
    2f 64 65 76 2f 6e 62 64 30 00 00 00 00 00 00 00  /dev/nbd0.......
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000090cb73c8>] __do_krealloc mm/slab_common.c:1671 [inline]
    [<0000000090cb73c8>] krealloc+0x7c/0xa0 mm/slab_common.c:1700
    [<00000000cf9e6ba7>] nbd_add_socket+0x7d/0x1e0 drivers/block/nbd.c:1040
    [<0000000040a0a881>] __nbd_ioctl drivers/block/nbd.c:1373 [inline]
    [<0000000040a0a881>] nbd_ioctl+0x175/0x430 drivers/block/nbd.c:1437
    [<000000004972a55a>] __blkdev_driver_ioctl block/ioctl.c:322 [inline]
    [<000000004972a55a>] blkdev_ioctl+0x147/0x300 block/ioctl.c:718
    [<000000008903d911>] block_ioctl+0x50/0x70 fs/block_dev.c:1995
    [<00000000c37950d9>] vfs_ioctl fs/ioctl.c:47 [inline]
    [<00000000c37950d9>] ksys_ioctl+0xa6/0xd0 fs/ioctl.c:763
    [<00000000ffe4bbdc>] __do_sys_ioctl fs/ioctl.c:772 [inline]
    [<00000000ffe4bbdc>] __se_sys_ioctl fs/ioctl.c:770 [inline]
    [<00000000ffe4bbdc>] __x64_sys_ioctl+0x1a/0x20 fs/ioctl.c:770
    [<00000000ede38b98>] do_syscall_64+0x6e/0x220 arch/x86/entry/common.c:294
    [<00000000553f73d5>] entry_SYSCALL_64_after_hwframe+0x44/0xa9



---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

