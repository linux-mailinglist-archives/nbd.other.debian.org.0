Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 181E12A136E
	for <lists+nbd@lfdr.de>; Sat, 31 Oct 2020 05:51:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D232620A09; Sat, 31 Oct 2020 04:51:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Oct 31 04:51:09 2020
Old-Return-Path: <hdanton@sina.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FREEMAIL_FROM,FVGT_m_MULTI_ODD,SORTED_RECIPS,WORD_WITHOUT_VOWELS
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8301A209DD
	for <lists-other-nbd@bendel.debian.org>; Sat, 31 Oct 2020 04:34:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=2.62 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, FREEMAIL_FROM=0.001,
	FVGT_m_MULTI_ODD=0.02, SORTED_RECIPS=2.499, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Gw8EqjckThnC for <lists-other-nbd@bendel.debian.org>;
	Sat, 31 Oct 2020 04:34:17 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 318 seconds by postgrey-1.36 at bendel; Sat, 31 Oct 2020 04:34:17 UTC
Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn [202.108.3.20])
	by bendel.debian.org (Postfix) with SMTP id 33642209FF
	for <nbd@other.debian.org>; Sat, 31 Oct 2020 04:34:16 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([222.131.71.201])
	by sina.com with ESMTP
	id 5F9CE7FD0000CA58; Sat, 31 Oct 2020 12:28:48 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 28961515073476
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+69a90a5e8f6b59086b2a@syzkaller.appspotmail.com>
Cc: axboe@kernel.dk,
	josef@toxicpanda.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: INFO: task can't die in nbd_ioctl
Date: Sat, 31 Oct 2020 12:28:37 +0800
Message-Id: <20201031042837.4024-1-hdanton@sina.com>
In-Reply-To: <00000000000061316205b0e750fc@google.com>
References: <00000000000061316205b0e750fc@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <szSAF8zITME.A.hbE.90OnfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1026
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201031042837.4024-1-hdanton@sina.com
Resent-Date: Sat, 31 Oct 2020 04:51:09 +0000 (UTC)

On Mon, 05 Oct 2020 00:20:16 -0700
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    de69ee6d Add linux-next specific files for 20200930
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=10d04f17900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4919771fba5919e5
> dashboard link: https://syzkaller.appspot.com/bug?extid=69a90a5e8f6b59086b2a
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+69a90a5e8f6b59086b2a@syzkaller.appspotmail.com
> 
> INFO: task syz-executor.0:4417 can't die for more than 143 seconds.
> task:syz-executor.0  state:D stack:28472 pid: 4417 ppid:  6852 flags:0x10004004
> Call Trace:
>  context_switch kernel/sched/core.c:3777 [inline]
>  __schedule+0xec5/0x2200 kernel/sched/core.c:4526
>  schedule+0xcf/0x270 kernel/sched/core.c:4604
>  schedule_timeout+0x1d8/0x250 kernel/time/timer.c:1855
>  do_wait_for_common kernel/sched/completion.c:85 [inline]
>  __wait_for_common kernel/sched/completion.c:106 [inline]
>  wait_for_common kernel/sched/completion.c:117 [inline]
>  wait_for_completion+0x163/0x260 kernel/sched/completion.c:138
>  flush_workqueue+0x3ff/0x13e0 kernel/workqueue.c:2832
>  nbd_start_device_ioctl drivers/block/nbd.c:1331 [inline]
>  __nbd_ioctl drivers/block/nbd.c:1408 [inline]
>  nbd_ioctl+0x76d/0xbe0 drivers/block/nbd.c:1448
>  __blkdev_driver_ioctl block/ioctl.c:228 [inline]
>  blkdev_ioctl+0x2a7/0x7f0 block/ioctl.c:623
>  block_ioctl+0xf9/0x140 fs/block_dev.c:1866
>  vfs_ioctl fs/ioctl.c:48 [inline]
>  __do_sys_ioctl fs/ioctl.c:753 [inline]
>  __se_sys_ioctl fs/ioctl.c:739 [inline]
>  __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x45dd99
> Code: Bad RIP value.
> RSP: 002b:00007f39f37eac78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000012e80 RCX: 000000000045dd99
> RDX: 0000000000000000 RSI: 000000000000ab03 RDI: 0000000000000004
> RBP: 000000000118bf58 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 000000000118bf2c
> R13: 00007fff8753a28f R14: 00007f39f37eb9c0 R15: 000000000118bf2c
> INFO: task syz-executor.0:4417 blocked for more than 144 seconds.
>       Not tainted 5.9.0-rc7-next-20200930-syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor.0  state:D stack:28472 pid: 4417 ppid:  6852 flags:0x10004004
> Call Trace:
>  context_switch kernel/sched/core.c:3777 [inline]
>  __schedule+0xec5/0x2200 kernel/sched/core.c:4526
>  schedule+0xcf/0x270 kernel/sched/core.c:4604
>  schedule_timeout+0x1d8/0x250 kernel/time/timer.c:1855
>  do_wait_for_common kernel/sched/completion.c:85 [inline]
>  __wait_for_common kernel/sched/completion.c:106 [inline]
>  wait_for_common kernel/sched/completion.c:117 [inline]
>  wait_for_completion+0x163/0x260 kernel/sched/completion.c:138
>  flush_workqueue+0x3ff/0x13e0 kernel/workqueue.c:2832
>  nbd_start_device_ioctl drivers/block/nbd.c:1331 [inline]
>  __nbd_ioctl drivers/block/nbd.c:1408 [inline]
>  nbd_ioctl+0x76d/0xbe0 drivers/block/nbd.c:1448
>  __blkdev_driver_ioctl block/ioctl.c:228 [inline]
>  blkdev_ioctl+0x2a7/0x7f0 block/ioctl.c:623
>  block_ioctl+0xf9/0x140 fs/block_dev.c:1866
>  vfs_ioctl fs/ioctl.c:48 [inline]
>  __do_sys_ioctl fs/ioctl.c:753 [inline]
>  __se_sys_ioctl fs/ioctl.c:739 [inline]
>  __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x45dd99
> Code: Bad RIP value.
> RSP: 002b:00007f39f37eac78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000012e80 RCX: 000000000045dd99
> RDX: 0000000000000000 RSI: 000000000000ab03 RDI: 0000000000000004
> RBP: 000000000118bf58 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 000000000118bf2c
> R13: 00007fff8753a28f R14: 00007f39f37eb9c0 R15: 000000000118bf2c
> 
> Showing all locks held in the system:
> 1 lock held by khungtaskd/1178:
>  #0: ffffffff8a553d00 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:6221
> 1 lock held by in:imklog/6557:
>  #0: ffff8880a0a526b0 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100 fs/file.c:930
> 2 locks held by kworker/u5:2/6867:
>  #0: ffff888093c7f138 ((wq_completion)knbd0-recv){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>  #0: ffff888093c7f138 ((wq_completion)knbd0-recv){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:856 [inline]
>  #0: ffff888093c7f138 ((wq_completion)knbd0-recv){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:41 [inline]
>  #0: ffff888093c7f138 ((wq_completion)knbd0-recv){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:616 [inline]
>  #0: ffff888093c7f138 ((wq_completion)knbd0-recv){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:643 [inline]
>  #0: ffff888093c7f138 ((wq_completion)knbd0-recv){+.+.}-{0:0}, at: process_one_work+0x821/0x15a0 kernel/workqueue.c:2240
>  #1: ffffc900017b7da8 ((work_completion)(&args->work)){+.+.}-{0:0}, at: process_one_work+0x854/0x15a0 kernel/workqueue.c:2244
> 
> =============================================
> 
> NMI backtrace for cpu 0
> CPU: 0 PID: 1178 Comm: khungtaskd Not tainted 5.9.0-rc7-next-20200930-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x198/0x1fb lib/dump_stack.c:118
>  nmi_cpu_backtrace.cold+0x44/0xd7 lib/nmi_backtrace.c:105
>  nmi_trigger_cpumask_backtrace+0x1b3/0x230 lib/nmi_backtrace.c:62
>  trigger_all_cpu_backtrace include/linux/nmi.h:147 [inline]
>  check_hung_uninterruptible_tasks kernel/hung_task.c:253 [inline]
>  watchdog+0xd89/0xf30 kernel/hung_task.c:339
>  kthread+0x3af/0x4a0 kernel/kthread.c:292
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
> Sending NMI from CPU 0 to CPUs 1:
> NMI backtrace for cpu 1
> CPU: 1 PID: 6835 Comm: syz-fuzzer Not tainted 5.9.0-rc7-next-20200930-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0033:0x415b7a
> Code: 89 ac 24 c8 00 00 00 48 8d ac 24 c8 00 00 00 48 8b 94 24 e0 00 00 00 48 83 fa 08 0f 84 4d 09 00 00 48 8b 1d 98 4a 5a 01 84 03 <90> 48 8b b4 24 d8 00 00 00 48 bf 00 00 00 00 00 80 00 00 48 8d 04
> RSP: 002b:000000c026e52b98 EFLAGS: 00000246
> RAX: 000000c026e52c18 RBX: 00007f1f2ef8f000 RCX: 000000c000083980
> RDX: 0000000000000030 RSI: 0000000000000000 RDI: 0000000000000030
> RBP: 000000c026e52c60 R08: 00000000008f7880 R09: 0000000000203000
> R10: 000000c011bb4cf0 R11: 0000000000000001 R12: ffffffffffffffff
> R13: 0000000000000046 R14: 0000000000000045 R15: 00000000000000aa
> FS:  0000000001992df0 GS:  0000000000000000

Make the recv kworker handle sock shutdown for workqueue flusher to
make forward progress.

--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -787,6 +787,9 @@ static void recv_work(struct work_struct
 	struct request *rq;
 
 	while (1) {
+		/* bail out if sock shutdown */
+		if (test_bit(NBD_RT_DISCONNECTED, &config->runtime_flags))
+			break;
 		cmd = nbd_read_stat(nbd, args->index);
 		if (IS_ERR(cmd)) {
 			struct nbd_sock *nsock = config->socks[args->index];
@@ -1325,7 +1328,7 @@ static int nbd_start_device_ioctl(struct
 	mutex_unlock(&nbd->config_lock);
 	ret = wait_event_interruptible(config->recv_wq,
 					 atomic_read(&config->recv_threads) == 0);
-	if (ret)
+	if (ret) /* the recv kworker would notice and handle sock shutdown */
 		sock_shutdown(nbd);
 	flush_workqueue(nbd->recv_workq);
 

