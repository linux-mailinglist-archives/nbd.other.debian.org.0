Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF1C3F87
	for <lists+nbd@lfdr.de>; Tue,  1 Oct 2019 20:12:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 468C720328; Tue,  1 Oct 2019 18:12:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct  1 18:12:12 2019
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FVGT_m_MULTI_ODD,MD5_SHA1_SUM,PHONENUMBER,RCVD_IN_DNSWL_HI,
	SORTED_RECIPS,TO_TOO_MANY autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7151D20352
	for <lists-other-nbd@bendel.debian.org>; Tue,  1 Oct 2019 17:55:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, MD5_SHA1_SUM=-1, PHONENUMBER=1.5,
	RCVD_IN_DNSWL_HI=-5, SORTED_RECIPS=2.499, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oDy42QVv9wPx for <lists-other-nbd@bendel.debian.org>;
	Tue,  1 Oct 2019 17:55:20 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1B7EF201F9
	for <nbd@other.debian.org>; Tue,  1 Oct 2019 17:55:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA83030EE12A;
	Tue,  1 Oct 2019 17:48:15 +0000 (UTC)
Received: from [10.10.122.80] (ovpn-122-80.rdu2.redhat.com [10.10.122.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DDDDC5C22F;
	Tue,  1 Oct 2019 17:48:14 +0000 (UTC)
Subject: Re: INFO: task hung in nbd_ioctl
To: syzbot <syzbot+24c12fa8d218ed26011a@syzkaller.appspotmail.com>,
 axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, nbd@other.debian.org,
 syzkaller-bugs@googlegroups.com
References: <000000000000b1b1ee0593cce78f@google.com>
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5D93915E.3090504@redhat.com>
Date: Tue, 1 Oct 2019 12:48:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <000000000000b1b1ee0593cce78f@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 01 Oct 2019 17:48:16 +0000 (UTC)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WJlOLHjhNgJ.A.1oC.8b5kdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/702
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5D93915E.3090504@redhat.com
Resent-Date: Tue,  1 Oct 2019 18:12:12 +0000 (UTC)

On 09/30/2019 05:39 PM, syzbot wrote:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    bb2aee77 Add linux-next specific files for 20190926
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=13385ca3600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e60af4ac5a01e964
> dashboard link:
> https://syzkaller.appspot.com/bug?extid=24c12fa8d218ed26011a
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12abc2a3600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11712c05600000
> 
> The bug was bisected to:
> 
> commit e9e006f5fcf2bab59149cb38a48a4817c1b538b4
> Author: Mike Christie <mchristi@redhat.com>
> Date:   Sun Aug 4 19:10:06 2019 +0000
> 
>     nbd: fix max number of supported devs
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1226f3c5600000
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=1126f3c5600000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1626f3c5600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+24c12fa8d218ed26011a@syzkaller.appspotmail.com
> Fixes: e9e006f5fcf2 ("nbd: fix max number of supported devs")
> 
> INFO: task syz-executor390:8778 can't die for more than 143 seconds.
> syz-executor390 D27432  8778   8777 0x00004004
> Call Trace:
>  context_switch kernel/sched/core.c:3384 [inline]
>  __schedule+0x828/0x1c20 kernel/sched/core.c:4065
>  schedule+0xd9/0x260 kernel/sched/core.c:4132
>  schedule_timeout+0x717/0xc50 kernel/time/timer.c:1871
>  do_wait_for_common kernel/sched/completion.c:83 [inline]
>  __wait_for_common kernel/sched/completion.c:104 [inline]
>  wait_for_common kernel/sched/completion.c:115 [inline]
>  wait_for_completion+0x29c/0x440 kernel/sched/completion.c:136
>  flush_workqueue+0x40f/0x14c0 kernel/workqueue.c:2826
>  nbd_start_device_ioctl drivers/block/nbd.c:1272 [inline]
>  __nbd_ioctl drivers/block/nbd.c:1347 [inline]
>  nbd_ioctl+0xb2e/0xc44 drivers/block/nbd.c:1387
>  __blkdev_driver_ioctl block/ioctl.c:304 [inline]
>  blkdev_ioctl+0xedb/0x1c20 block/ioctl.c:606
>  block_ioctl+0xee/0x130 fs/block_dev.c:1954
>  vfs_ioctl fs/ioctl.c:47 [inline]
>  file_ioctl fs/ioctl.c:539 [inline]
>  do_vfs_ioctl+0xdb6/0x13e0 fs/ioctl.c:726
>  ksys_ioctl+0xab/0xd0 fs/ioctl.c:743
>  __do_sys_ioctl fs/ioctl.c:750 [inline]
>  __se_sys_ioctl fs/ioctl.c:748 [inline]
>  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:748
>  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x4452d9
> Code: Bad RIP value.
> RSP: 002b:00007ffde928d288 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000004452d9
> RDX: 0000000000000000 RSI: 000000000000ab03 RDI: 0000000000000004
> RBP: 0000000000000000 R08: 00000000004025b0 R09: 00000000004025b0
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000402520
> R13: 00000000004025b0 R14: 0000000000000000 R15: 0000000000000000
> INFO: task syz-executor390:8778 blocked for more than 143 seconds.
>       Not tainted 5.3.0-next-20190926 #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> syz-executor390 D27432  8778   8777 0x00004004
> Call Trace:
>  context_switch kernel/sched/core.c:3384 [inline]
>  __schedule+0x828/0x1c20 kernel/sched/core.c:4065
>  schedule+0xd9/0x260 kernel/sched/core.c:4132
>  schedule_timeout+0x717/0xc50 kernel/time/timer.c:1871
>  do_wait_for_common kernel/sched/completion.c:83 [inline]
>  __wait_for_common kernel/sched/completion.c:104 [inline]
>  wait_for_common kernel/sched/completion.c:115 [inline]
>  wait_for_completion+0x29c/0x440 kernel/sched/completion.c:136
>  flush_workqueue+0x40f/0x14c0 kernel/workqueue.c:2826
>  nbd_start_device_ioctl drivers/block/nbd.c:1272 [inline]
>  __nbd_ioctl drivers/block/nbd.c:1347 [inline]
>  nbd_ioctl+0xb2e/0xc44 drivers/block/nbd.c:1387
>  __blkdev_driver_ioctl block/ioctl.c:304 [inline]
>  blkdev_ioctl+0xedb/0x1c20 block/ioctl.c:606
>  block_ioctl+0xee/0x130 fs/block_dev.c:1954
>  vfs_ioctl fs/ioctl.c:47 [inline]
>  file_ioctl fs/ioctl.c:539 [inline]
>  do_vfs_ioctl+0xdb6/0x13e0 fs/ioctl.c:726
>  ksys_ioctl+0xab/0xd0 fs/ioctl.c:743
>  __do_sys_ioctl fs/ioctl.c:750 [inline]
>  __se_sys_ioctl fs/ioctl.c:748 [inline]
>  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:748
>  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x4452d9
> Code: Bad RIP value.
> RSP: 002b:00007ffde928d288 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000004452d9
> RDX: 0000000000000000 RSI: 000000000000ab03 RDI: 0000000000000004
> RBP: 0000000000000000 R08: 00000000004025b0 R09: 00000000004025b0
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000402520
> R13: 00000000004025b0 R14: 0000000000000000 R15: 0000000000000000
> 

I will send a fix for this.

I had assumed that for every socket type a kernel_sock_shutdown would
break us out of sock_recvmsg call, but it looks like that's not the case.

