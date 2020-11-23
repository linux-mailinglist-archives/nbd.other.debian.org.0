Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFE62C031B
	for <lists+nbd@lfdr.de>; Mon, 23 Nov 2020 11:21:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B68C72024F; Mon, 23 Nov 2020 10:21:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 23 10:21:09 2020
Old-Return-Path: <3XYm7XwkbAGISYZKALLERAPPID.GOOGLEUSERCONTENT.COM@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FROM_LOCAL_HEX,FVGT_m_MULTI_ODD,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8AFF620208
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 Nov 2020 10:05:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.374 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FROM_LOCAL_HEX=0.006, FVGT_m_MULTI_ODD=0.02,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id sb2iew6QAe3o for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 Nov 2020 10:05:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.25
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id EBBA220204
	for <nbd@other.debian.org>; Mon, 23 Nov 2020 10:05:20 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id t9so13318532ilp.20
        for <nbd@other.debian.org>; Mon, 23 Nov 2020 02:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=zBgwzi68qzrXdjI3v6aoG522nFgE68o6wE8yIJVg79k=;
        b=dgda/XSDV7sXnsO9LQ/xPf/bl3MlmgG7W2kwz+linMe1u4d60obXfV4Hmjttp9z2O3
         +jZXhNZuXL20eJaVPi3eoMr/YgrkaVAAbN0tJe7knUsJGBL1L6B0gCUAC3LziSsF7Stg
         vrMK6JCXSoN7cqOOuEiXdvIADI3Kug6ortoNR914GxaY5HNAOmo9+iRVpHzUKiGV2kQF
         2pm2KsqHa48Qd31bVxuDHr2f83IcCSl5X+f3Kgjg5GVDg9B4h/9g3Ii3BGoNZCSv9BsJ
         VwBcH7d32vXiRQZ2MSSVJJPWSMFElcxBAfPB+aET300TnL4gjvScBywFJEXZWsokcWI2
         sBIw==
X-Gm-Message-State: AOAM532Y7DDlSMugwaXG0C4r29TpOx/5xeWrXjAsiV6XuwfVenljyXmq
	P+EBQ5OWk23tJcfFGINV8ZpEKcdyXgKvTw4oYAFMX3+I88oo
X-Google-Smtp-Source: ABdhPJy/m127PjSfJZCUQU/mwsLeNdRiRvVWiuIaQd1AajQ0eMm2H7W/z3v1a9fEx16vH1FVCnPRPmMkV8o3l0I68CN8QhiikeaB
MIME-Version: 1.0
X-Received: by 2002:a02:b146:: with SMTP id s6mr29551471jah.10.1606125917639;
 Mon, 23 Nov 2020 02:05:17 -0800 (PST)
Date: Mon, 23 Nov 2020 02:05:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c91a4805b4c354d5@google.com>
Subject: WARNING in nbd_config_put
From: syzbot <syzbot+547e604b2b1c65869d7f@syzkaller.appspotmail.com>
To: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DEpcweGQcrK.A.PdB.V04ufB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1098
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/000000000000c91a4805b4c354d5@google.com
Resent-Date: Mon, 23 Nov 2020 10:21:09 +0000 (UTC)

Hello,

syzbot found the following issue on:

HEAD commit:    27bba9c5 Merge tag 'scsi-fixes' of git://git.kernel.org/pu..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15ffd94d500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e7f3c831f4536ec1
dashboard link: https://syzkaller.appspot.com/bug?extid=547e604b2b1c65869d7f
compiler:       gcc (GCC) 10.1.0-syz 20200507
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+547e604b2b1c65869d7f@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 3 PID: 27869 at kernel/workqueue.c:4396 destroy_workqueue.cold+0x5/0x71 kernel/workqueue.c:4396
Modules linked in:
CPU: 3 PID: 27869 Comm: syz-executor.3 Not tainted 5.10.0-rc4-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
RIP: 0010:destroy_workqueue.cold+0x5/0x71 kernel/workqueue.c:4396
Code: 00 90 4a 89 f7 f1 89 c6 e8 01 80 00 00 c6 44 24 37 01 e9 a1 a7 9b f8 48 c7 c7 80 f1 00 8b e8 9a f4 04 f9 eb c2 e8 63 76 c3 f8 <0f> 0b 48 c7 c6 00 95 4a 89 48 c7 c7 40 90 4a 89 49 8d 96 60 01 00
RSP: 0018:ffffc900009f7a30 EFLAGS: 00010046
RAX: 0000000000040000 RBX: 0000000000000002 RCX: ffffc90023698000
RDX: 0000000000040000 RSI: ffffffff88acb97d RDI: 0000000000000005
RBP: 000000000000000f R08: 0000000000000001 R09: 0000000000000003
R10: 0000000000000001 R11: 0000000000000000 R12: dffffc0000000000
R13: ffff888024e1dc00 R14: ffff88801270a000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff88802cf00000(0063) knlGS:00000000f5524b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 0000000001991fe8 CR3: 000000001216e000 CR4: 0000000000350ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 nbd_config_put+0x3d3/0x870 drivers/block/nbd.c:1231
 nbd_release+0x103/0x190 drivers/block/nbd.c:1523
 __blkdev_put+0x642/0x890 fs/block_dev.c:1782
 blkdev_close+0x8c/0xb0 fs/block_dev.c:1851
 __fput+0x285/0x920 fs/file_table.c:281
 task_work_run+0xdd/0x190 kernel/task_work.c:151
 get_signal+0xd89/0x1f00 kernel/signal.c:2562
 arch_do_signal+0x82/0x2390 arch/x86/kernel/signal.c:811
 exit_to_user_mode_loop kernel/entry/common.c:161 [inline]
 exit_to_user_mode_prepare+0x100/0x1a0 kernel/entry/common.c:191
 syscall_exit_to_user_mode+0x38/0x260 kernel/entry/common.c:266
 __do_fast_syscall_32+0x62/0x80 arch/x86/entry/common.c:138
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:160
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
RIP: 0023:0xf7f6c549
Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000f55240bc EFLAGS: 00000296 ORIG_RAX: 0000000000000036
RAX: fffffffffffffe00 RBX: 0000000000000003 RCX: 000000000000ab03
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

