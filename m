Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id V+teETx/m2kD0gMAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Sun, 22 Feb 2026 23:12:12 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A191708E1
	for <lists+nbd@lfdr.de>; Sun, 22 Feb 2026 23:12:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9EBD620502; Sun, 22 Feb 2026 22:12:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Feb 22 22:12:11 2026
Old-Return-Path: <tglx@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD,
	TO_TOO_MANY autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CC3EC204FA
	for <lists-other-nbd@bendel.debian.org>; Sun, 22 Feb 2026 21:55:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.081 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, TO_TOO_MANY=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Hc__aigWnTTu for <lists-other-nbd@bendel.debian.org>;
	Sun, 22 Feb 2026 21:55:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 493 seconds by postgrey-1.36 at bendel; Sun, 22 Feb 2026 21:55:08 UTC
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7FAD3204EF
	for <nbd@other.debian.org>; Sun, 22 Feb 2026 21:55:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 15BA843A27;
	Sun, 22 Feb 2026 21:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE0AC116D0;
	Sun, 22 Feb 2026 21:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771796811;
	bh=PShAnn5NkbThhv3yFxSNY6IBmrCp7uHLu1e2LOKxblc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q+Dg4TQUKfByCnYHWVLn9v5mJM7/dAoa7hDC+q7BGu2o+DBc8e4C+Eo0gevRvMHpV
	 TgWcdDkOVwynCi853Q6J7XMxTvZ2THLCvLwt2UpA51wI5I9fxdNI+mfdoQ658ZtfXO
	 KL7P83I05UD9VirIsd8S2wpykgQdZKeheWl69rBRMWZ9U77Z7rXTsIA9asRvTEKcG3
	 54B6LDeyZz96Jjk4W3Fpiec9fPuxhJV5opLyN03N3XAzFnVR/NypDZ94CrJKrveaBA
	 seBd7iLl06TZEJ2qBGF5B5gE/32vBPcr8prsjuQg34xBdR6YAlipPCV683+9kND56Q
	 agX8wle1UKW7A==
From: Thomas Gleixner <tglx@kernel.org>
To: syzbot <syzbot+0b6ec149bb8b98bd9485@syzkaller.appspotmail.com>,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com,
 syzkaller-bugs@googlegroups.com, x86@kernel.org
Cc: linux-block@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 nbd@other.debian.org
Subject: Re: [syzbot] [kernel?^W NDB] possible deadlock in worker_thread (3)
In-Reply-To: <69988ebc.a70a0220.2c38d7.0142.GAE@google.com>
References: <69988ebc.a70a0220.2c38d7.0142.GAE@google.com>
Date: Sun, 22 Feb 2026 22:46:48 +0100
Message-ID: <87bjhgwiwn.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MGAcJKOD3GF.A._uuC.783mpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3500
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/87bjhgwiwn.ffs@tglx
Resent-Date: Sun, 22 Feb 2026 22:12:11 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.49 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=61690c38d1398936];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,bounce-nbd=lists@other.debian.org];
	FORGED_RECIPIENTS(0.00)[m:syzbot+0b6ec149bb8b98bd9485@syzkaller.appspotmail.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:mingo@redhat.com,m:syzkaller-bugs@googlegroups.com,m:x86@kernel.org,m:linux-block@vger.kernel.org,m:josef@toxicpanda.com,m:nbd@other.debian.org,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,googlegroups.com:email,goo.gl:url,syzkaller.appspot.com:url,storage.googleapis.com:url];
	R_SPF_NA(0.00)[no SPF record];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,bounce-nbd=lists@other.debian.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[nbd,0b6ec149bb8b98bd9485];
	REDIRECTOR_URL(0.00)[goo.gl];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: D3A191708E1
X-Rspamd-Action: add header
X-Spam: Yes

On Fri, Feb 20 2026 at 08:41, syzbot wrote:

> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    635c467cc14e Add linux-next specific files for 20260213
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=15339b3a580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=61690c38d1398936
> dashboard link: https://syzkaller.appspot.com/bug?extid=0b6ec149bb8b98bd9485
> compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/78b3d15ca8e6/disk-635c467c.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/a95f3d108ef4/vmlinux-635c467c.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/e58086838b24/bzImage-635c467c.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+0b6ec149bb8b98bd9485@syzkaller.appspotmail.com
>
> block nbd1: Receive control failed (result -32)
> ======================================================
> WARNING: possible circular locking dependency detected
> syzkaller #0 Not tainted
> ------------------------------------------------------
> kworker/u9:3/5827 is trying to acquire lock:
> ffff8880275b9a78 (&nbd->config_lock){+.+.}-{4:4}, at: refcount_dec_and_mutex_lock+0x30/0xa0 lib/refcount.c:118
>
> but task is already holding lock:
> ffffc90003bd7c40 ((work_completion)(&args->work)#3){+.+.}-{0:0}, at: process_one_work+0x87c/0x1650 kernel/workqueue.c:3255
>
> which lock already depends on the new lock.

This is clearly a NDB issue and the lockdep splat is pretty clear.

Cc'ed the maintainer and left the report intact.

>
> the existing dependency chain (in reverse order) is:
>
> -> #2 ((work_completion)(&args->work)#3){+.+.}-{0:0}:
>        process_one_work+0x895/0x1650 kernel/workqueue.c:3255
>        process_scheduled_works kernel/workqueue.c:3362 [inline]
>        worker_thread+0xb46/0x1140 kernel/workqueue.c:3443
>        kthread+0x388/0x470 kernel/kthread.c:467
>        ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
>        ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> -> #1 ((wq_completion)nbd3-recv){+.+.}-{0:0}:
>        touch_wq_lockdep_map+0xcb/0x180 kernel/workqueue.c:3994
>        __flush_workqueue+0x14b/0x14f0 kernel/workqueue.c:4036
>        nbd_disconnect_and_put+0x9e/0x2c0 drivers/block/nbd.c:2264
>        nbd_genl_disconnect+0x4a9/0x590 drivers/block/nbd.c:2303
>        genl_family_rcv_msg_doit+0x22a/0x330 net/netlink/genetlink.c:1115
>        genl_family_rcv_msg net/netlink/genetlink.c:1195 [inline]
>        genl_rcv_msg+0x61c/0x7a0 net/netlink/genetlink.c:1210
>        netlink_rcv_skb+0x232/0x4b0 net/netlink/af_netlink.c:2550
>        genl_rcv+0x28/0x40 net/netlink/genetlink.c:1219
>        netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
>        netlink_unicast+0x80f/0x9b0 net/netlink/af_netlink.c:1344
>        netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1894
>        sock_sendmsg_nosec+0x18f/0x1d0 net/socket.c:737
>        __sock_sendmsg net/socket.c:752 [inline]
>        ____sys_sendmsg+0x589/0x8c0 net/socket.c:2610
>        ___sys_sendmsg+0x2a5/0x360 net/socket.c:2664
>        __sys_sendmsg net/socket.c:2696 [inline]
>        __do_sys_sendmsg net/socket.c:2701 [inline]
>        __se_sys_sendmsg net/socket.c:2699 [inline]
>        __x64_sys_sendmsg+0x1bd/0x2a0 net/socket.c:2699
>        do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>        do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
>        entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> -> #0 (&nbd->config_lock){+.+.}-{4:4}:
>        check_prev_add kernel/locking/lockdep.c:3165 [inline]
>        check_prevs_add kernel/locking/lockdep.c:3284 [inline]
>        validate_chain kernel/locking/lockdep.c:3908 [inline]
>        __lock_acquire+0x15a5/0x2cf0 kernel/locking/lockdep.c:5237
>        lock_acquire+0xf0/0x2e0 kernel/locking/lockdep.c:5868
>        __mutex_lock_common kernel/locking/mutex.c:614 [inline]
>        __mutex_lock+0x19f/0x1300 kernel/locking/mutex.c:776
>        refcount_dec_and_mutex_lock+0x30/0xa0 lib/refcount.c:118
>        nbd_config_put+0x2c/0x580 drivers/block/nbd.c:1434
>        recv_work+0x1cc1/0x1d90 drivers/block/nbd.c:1026
>        process_one_work+0x949/0x1650 kernel/workqueue.c:3279
>        process_scheduled_works kernel/workqueue.c:3362 [inline]
>        worker_thread+0xb46/0x1140 kernel/workqueue.c:3443
>        kthread+0x388/0x470 kernel/kthread.c:467
>        ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
>        ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> other info that might help us debug this:
>
> Chain exists of:
>   &nbd->config_lock --> (wq_completion)nbd3-recv --> (work_completion)(&args->work)#3
>
>  Possible unsafe locking scenario:
>
>        CPU0                    CPU1
>        ----                    ----
>   lock((work_completion)(&args->work)#3);
>                                lock((wq_completion)nbd3-recv);
>                                lock((work_completion)(&args->work)#3);
>   lock(&nbd->config_lock);
>
>  *** DEADLOCK ***
>
> 2 locks held by kworker/u9:3/5827:
>  #0: ffff8880275c9148 ((wq_completion)nbd1-recv){+.+.}-{0:0}, at: process_one_work+0x855/0x1650 kernel/workqueue.c:3254
>  #1: ffffc90003bd7c40 ((work_completion)(&args->work)#3){+.+.}-{0:0}, at: process_one_work+0x87c/0x1650 kernel/workqueue.c:3255
>
> stack backtrace:
> CPU: 0 UID: 0 PID: 5827 Comm: kworker/u9:3 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
> Workqueue: nbd1-recv recv_work
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>  print_circular_bug+0x2e1/0x300 kernel/locking/lockdep.c:2043
>  check_noncircular+0x12e/0x150 kernel/locking/lockdep.c:2175
>  check_prev_add kernel/locking/lockdep.c:3165 [inline]
>  check_prevs_add kernel/locking/lockdep.c:3284 [inline]
>  validate_chain kernel/locking/lockdep.c:3908 [inline]
>  __lock_acquire+0x15a5/0x2cf0 kernel/locking/lockdep.c:5237
>  lock_acquire+0xf0/0x2e0 kernel/locking/lockdep.c:5868
>  __mutex_lock_common kernel/locking/mutex.c:614 [inline]
>  __mutex_lock+0x19f/0x1300 kernel/locking/mutex.c:776
>  refcount_dec_and_mutex_lock+0x30/0xa0 lib/refcount.c:118
>  nbd_config_put+0x2c/0x580 drivers/block/nbd.c:1434
>  recv_work+0x1cc1/0x1d90 drivers/block/nbd.c:1026
>  process_one_work+0x949/0x1650 kernel/workqueue.c:3279
>  process_scheduled_works kernel/workqueue.c:3362 [inline]
>  worker_thread+0xb46/0x1140 kernel/workqueue.c:3443
>  kthread+0x388/0x470 kernel/kthread.c:467
>  ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> block nbd1: shutting down sockets
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup

