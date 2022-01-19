Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A56494028
	for <lists+nbd@lfdr.de>; Wed, 19 Jan 2022 19:49:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A92CD2032C; Wed, 19 Jan 2022 18:49:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan 19 18:49:31 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,FVGT_m_MULTI_ODD,LDOSUBSCRIBER,LDO_WHITELIST,
	PHONENUMBER,RCVD_IN_DNSWL_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 753F1202FE
	for <lists-other-nbd@bendel.debian.org>; Wed, 19 Jan 2022 18:49:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.38 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02, LDO_WHITELIST=-5,
	PHONENUMBER=1.5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jyjpjz0BzXBA for <lists-other-nbd@bendel.debian.org>;
	Wed, 19 Jan 2022 18:49:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 48CF9201E8
	for <nbd@other.debian.org>; Wed, 19 Jan 2022 18:49:18 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id c2so7044793wml.1
        for <nbd@other.debian.org>; Wed, 19 Jan 2022 10:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:content-language:from
         :subject:content-transfer-encoding;
        bh=+423QOdKTsn1/nJN/tgCGb98iEbEBwfviYj1mNLs158=;
        b=OfaDxzLmV5fGPi4v0v7jwt/iDsNlmR1cCl09i/e1WPi1I8C1gEeR9FFFYXGd3k95+I
         NjuYzASbkufOecFfMpw7R7dx8zbotu1N6pivM6OHftj0lo/U1DuN3B++Z09jD/apA6t/
         941E9PFVe20+wmu9YcQv+Qomh9JXZgHMeN0fOYDni0wJ8wQ1NnVrUQWtuHpwCQcjey2k
         jcKaohB/i/K2XpVECn+3cQjkpe5Rnr6EMUd0REP6l814Ez/mUogm118R/VnYcgCsQpoS
         yZA1yRXcLxkhSvUCT4PhtN8CHsQBSD0IL/CTjbbBFopfotDSAnsJ/Vuv88cT+fcR1ISo
         x97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to
         :content-language:from:subject:content-transfer-encoding;
        bh=+423QOdKTsn1/nJN/tgCGb98iEbEBwfviYj1mNLs158=;
        b=QZV2YFVow8nfvIC4F1M11nEpqJgZu0BnuMSLt5IQF49jns7F9ONOFABmKPPK9nPTPd
         srdsKeJ1XeVgiek2gABzAW66wOoOYyGo7ZzSXy03EBVb7VZ2OtaSJwiiwm56ysHVpxMe
         CH75Zm73XiJy4i/6E5KUUyw4be4F2Z7MxQfe/pJO2oj1z6bTqtQpe1Ie/KmdFFgOKsCe
         l1K4YmQfXhN4qS66P1eBAFAeY02HpwB7QzIdV35jjA2cEf0u7gQAVhnV2+rMBT2XmfAG
         gUvKW0794Fd53NBqOl7QY8vdXzZS7ZClQ5DCsvOmJ+DYoPxWx15cvd84f70A7D7JXfIZ
         R7lg==
X-Gm-Message-State: AOAM532/uivFIZeCtO7y96/yzNsdCDXOHBZKNgqOfKREYRPXmr9Y+zKH
	QpVbg23UQ00OU7/jJZzI1VztuX9vcUNRbw==
X-Google-Smtp-Source: ABdhPJwFLZ3HjrxKMDDETxKbTkPMbXhWfL9l9DiRY6QnzYc+nrdH8N/HZnBWwt52ckMQpmZgCOxHPQ==
X-Received: by 2002:a5d:6701:: with SMTP id o1mr29991631wru.128.1642618155093;
        Wed, 19 Jan 2022 10:49:15 -0800 (PST)
Received: from ?IPV6:2003:d9:9705:b200:a4f8:a4f1:d507:1ad9? (p200300d99705b200a4f8a4f1d5071ad9.dip0.t-ipconnect.de. [2003:d9:9705:b200:a4f8:a4f1:d507:1ad9])
        by smtp.googlemail.com with ESMTPSA id m2sm732649wrr.6.2022.01.19.10.49.14
        for <nbd@other.debian.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 10:49:14 -0800 (PST)
Message-ID: <3fff1b15-2f23-481a-5b92-fa0779edb20c@colorfullife.com>
Date: Wed, 19 Jan 2022 19:49:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: nbd@other.debian.org
Content-Language: en-US
From: Manfred Spraul <manfred@colorfullife.com>
Subject: Circular lock:Chain exists of: &cmd->lock --> mapping.invalidate_lock
 --> &ei->i_data_sem
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8AEk4IYsZSG.A.0_G.70F6hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1691
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3fff1b15-2f23-481a-5b92-fa0779edb20c@colorfullife.com
Resent-Date: Wed, 19 Jan 2022 18:49:31 +0000 (UTC)

Hello together,

while testing my replay tool, i.e. with an unmodified kernel module but 
with a modified server, I got the below included warning from lockdep.

Is this known?

- test setup is a slightly modified maketr

- current mainline, most likely from yesterday.

--

     Manfred


[    0.000000] Linux version 5.16.0+ (root@(none)) (gcc (GCC) 11.2.1 20211203 (Red Hat 11.2.1-7), GNU ld version 2.37-10.fc35) #388 SMP PREEMPT Wed Jan 19 18:58:00 CET 2022
[...]
[  298.187458] nbd0: detected capacity change from 0 to 102400
[  298.651192] EXT4-fs (nbd0): mounted filesystem with ordered data mode. Quota mode: disabled.
[  298.660358] ext4 filesystem being mounted at /tmp/mnt-tmp.Nw47r1pxBy supports timestamps until 2038 (0x7fffffff)

[  298.697042] ======================================================
[  298.706900] WARNING: possible circular locking dependency detected
[  298.717017] 5.16.0+ #388 Not tainted
[  298.727102] ------------------------------------------------------
[  298.737650] mkdir/717 is trying to acquire lock:
[  298.748348] ffff888102bc97f0 (&cmd->lock){+.+.}-{3:3}, at: nbd_queue_rq+0x51/0x6d3

[  298.759507] but task is already holding lock:
[  298.781602] ffff88810d17a5b8 (&ei->i_data_sem){++++}-{3:3}, at: ext4_map_blocks+0x4ed/0x959

[  298.793412] which lock already depends on the new lock.


[  298.827878] the existing dependency chain (in reverse order) is:

[  298.850781] -> #4 (&ei->i_data_sem){++++}-{3:3}:
[  298.873878]        down_read+0x48/0x5d
[  298.885621]        ext4_map_blocks+0x31f/0x959
[  298.897295]        ext4_mpage_readpages+0x37a/0x708
[  298.909055]        ext4_readahead+0x47/0x50
[  298.920834]        read_pages+0x88/0x1ee
[  298.932540]        page_cache_ra_unbounded+0x143/0x2cd
[  298.944452]        do_page_cache_ra+0x7b/0x87
[  298.956405]        ondemand_readahead+0x3ea/0x3fe
[  298.968335]        page_cache_sync_ra+0x97/0xa5
[  298.980265]        filemap_read+0x2f2/0xba2
[  298.992112]        generic_file_read_iter+0x1ec/0x206
[  299.003972]        ext4_file_read_iter+0x17e/0x194
[  299.015945]        __kernel_read+0x141/0x1ed
[  299.028014]        kernel_read+0x4c/0x62
[  299.039953]        bprm_execve+0x419/0xa36
[  299.051755]        do_execveat_common.isra.0+0x205/0x241
[  299.063558]        __x64_sys_execve+0x62/0x74
[  299.075236]        do_syscall_64+0x8f/0xb0
[  299.086897]        entry_SYSCALL_64_after_hwframe+0x44/0xae

[  299.098619] -> #3 (mapping.invalidate_lock){++++}-{3:3}:
[  299.121599]        down_read+0x48/0x5d
[  299.133177]        filemap_fault+0x255/0x7f4
[  299.144820]        __do_fault+0x6a/0xda
[  299.156505]        __handle_mm_fault+0x7c0/0xbc9
[  299.168215]        handle_mm_fault+0x215/0x36b
[  299.179895]        do_user_addr_fault+0x397/0x53e
[  299.191493]        exc_page_fault+0x1d1/0x1f1
[  299.202919]        asm_exc_page_fault+0x1e/0x30

[  299.214119] -> #2 (&mm->mmap_lock#2){++++}-{3:3}:
[  299.235444]        __might_fault+0xa1/0xc9
[  299.245940]        _copy_from_user+0x2a/0xb1
[  299.256259]        copy_from_sockptr+0x35/0x54
[  299.266485]        sock_setsockopt+0x821/0x13c0
[  299.276587]        __sys_setsockopt+0xe7/0x191
[  299.286537]        __x64_sys_setsockopt+0x6a/0x7d
[  299.296293]        do_syscall_64+0x8f/0xb0
[  299.305801]        entry_SYSCALL_64_after_hwframe+0x44/0xae

[  299.315497] -> #1 (sk_lock-AF_INET){+.+.}-{0:0}:
[  299.333948]        lock_sock_nested+0x4a/0xa7
[  299.343118]        lock_sock+0x18/0x1f
[  299.352157]        tcp_recvmsg+0x141/0x1f0
[  299.361361]        inet_recvmsg+0x97/0xed
[  299.370433]        sock_recvmsg_nosec+0x75/0x8e
[  299.379402]        sock_recvmsg+0x4a/0x5e
[  299.388275]        sock_xmit+0x208/0x28e
[  299.397080]        nbd_handle_reply+0x660/0x887
[  299.405884]        recv_work+0x310/0x3fa
[  299.414684]        process_one_work+0x3de/0x689
[  299.423512]        worker_thread+0x2ce/0x3e9
[  299.432339]        kthread+0x172/0x17a
[  299.441089]        ret_from_fork+0x22/0x30

[  299.449755] -> #0 (&cmd->lock){+.+.}-{3:3}:
[  299.466898]        __lock_acquire+0xeb0/0x1196
[  299.475600]        lock_acquire+0x239/0x270
[  299.484272]        __mutex_lock+0xdb/0x462
[  299.492854]        mutex_lock_nested+0x2f/0x38
[  299.501476]        nbd_queue_rq+0x51/0x6d3
[  299.510076]        __blk_mq_try_issue_directly+0x11d/0x17d
[  299.518839]        blk_mq_request_issue_directly+0x34/0x45
[  299.527630]        blk_mq_plug_issue_direct.constprop.0+0xbb/0x141
[  299.536469]        blk_mq_flush_plug_list+0x2a0/0x42d
[  299.545278]        blk_flush_plug+0x1e3/0x20f
[  299.554013]        blk_finish_plug+0x41/0x5e
[  299.562615]        ext4_mb_prefetch+0x154/0x16b
[  299.571225]        ext4_mb_regular_allocator+0x936/0x10f0
[  299.579776]        ext4_mb_new_blocks+0x7be/0x1b43
[  299.588323]        ext4_ext_map_blocks+0x2337/0x282e
[  299.596879]        ext4_map_blocks+0x51d/0x959
[  299.605420]        ext4_getblk+0xdc/0x2e4
[  299.613882]        ext4_bread+0x39/0x88
[  299.622311]        ext4_append+0xca/0x185
[  299.630680]        ext4_init_new_dir+0xa1/0x188
[  299.639080]        ext4_mkdir+0x144/0x324
[  299.647392]        vfs_mkdir+0xca/0x124
[  299.655673]        do_mkdirat+0xea/0x134
[  299.663878]        __x64_sys_mkdir+0x43/0x50
[  299.672102]        do_syscall_64+0x8f/0xb0
[  299.680315]        entry_SYSCALL_64_after_hwframe+0x44/0xae

[  299.688666] other info that might help us debug this:

[  299.713302] Chain exists of:
[  299.713302]   &cmd->lock --> mapping.invalidate_lock --> &ei->i_data_sem

[  299.738136]  Possible unsafe locking scenario:

[  299.754774]        CPU0                    CPU1
[  299.763173]        ----                    ----
[  299.771496]   lock(&ei->i_data_sem);
[  299.779826]                                lock(mapping.invalidate_lock);
[  299.788515]                                lock(&ei->i_data_sem);
[  299.797193]   lock(&cmd->lock);

[  299.805759]  *** DEADLOCK ***

[  299.830673] 5 locks held by mkdir/717:
[  299.839097]  #0: ffff888103365438 (sb_writers#3){.+.+}-{0:0}, at: mnt_want_write+0x32/0x66
[  299.848125]  #1: ffff888116d516b0 (&type->i_mutex_dir_key#5/1){+.+.}-{3:3}, at: filename_create+0xb0/0x1a6
[  299.857514]  #2: ffff8881039c4990 (jbd2_handle){++++}-{0:0}, at: start_this_handle+0x833/0x9eb
[  299.867122]  #3: ffff88810d17a5b8 (&ei->i_data_sem){++++}-{3:3}, at: ext4_map_blocks+0x4ed/0x959
[  299.876891]  #4: ffff8881029eda18 (q->srcu){....}-{0:0}, at: rcu_lock_acquire+0x0/0x32

[  299.886813] stack backtrace:
[  299.906106] CPU: 3 PID: 717 Comm: mkdir Not tainted 5.16.0+ #388
[  299.916153] Hardware name: Hewlett-Packard HP 350 G2/803A, BIOS F.13 06/10/2015
[  299.926399] Call Trace:
[  299.936474]  <TASK>
[  299.946366]  dump_stack_lvl+0x4f/0x68
[  299.956315]  dump_stack+0x15/0x1b
[  299.966185]  check_noncircular+0x65/0x75
[  299.976102]  __lock_acquire+0xeb0/0x1196
[  299.986043]  ? lock_is_held_type+0x7b/0xd6
[  299.995975]  lock_acquire+0x239/0x270
[  300.005829]  ? nbd_queue_rq+0x51/0x6d3
[  300.015729]  ? lock_is_held_type+0x7b/0xd6
[  300.025623]  __mutex_lock+0xdb/0x462
[  300.035516]  ? nbd_queue_rq+0x51/0x6d3
[  300.045418]  ? nbd_queue_rq+0x51/0x6d3
[  300.055257]  ? hlock_class+0x1a/0x5f
[  300.065056]  ? mark_lock+0x8c/0x368
[  300.074839]  ? blk_mq_submit_bio+0xa82/0xa91
[  300.084734]  ? mutex_lock_nested+0x2f/0x38
[  300.094666]  mutex_lock_nested+0x2f/0x38
[  300.104597]  nbd_queue_rq+0x51/0x6d3
[  300.114514]  ? hlock_class+0x1a/0x5f
[  300.124331]  __blk_mq_try_issue_directly+0x11d/0x17d
[  300.134242]  blk_mq_request_issue_directly+0x34/0x45
[  300.144167]  blk_mq_plug_issue_direct.constprop.0+0xbb/0x141
[  300.154175]  blk_mq_flush_plug_list+0x2a0/0x42d
[  300.164205]  blk_flush_plug+0x1e3/0x20f
[  300.174068]  blk_finish_plug+0x41/0x5e
[  300.183721]  ext4_mb_prefetch+0x154/0x16b
[  300.193441]  ext4_mb_regular_allocator+0x936/0x10f0
[  300.203211]  ? lock_is_held_type+0x7b/0xd6
[  300.213063]  ? rcu_read_lock_sched_held+0x6d/0x75
[  300.223071]  ? kmem_cache_alloc+0x171/0x181
[  300.233090]  ext4_mb_new_blocks+0x7be/0x1b43
[  300.242986]  ext4_ext_map_blocks+0x2337/0x282e
[  300.252874]  ? __down_write_common+0x86b/0x87d
[  300.262735]  ? lock_acquire+0x239/0x270
[  300.272606]  ? lock_is_held_type+0x7b/0xd6
[  300.282591]  ext4_map_blocks+0x51d/0x959
[  300.292638]  ext4_getblk+0xdc/0x2e4
[  300.302660]  ext4_bread+0x39/0x88
[  300.312367]  ext4_append+0xca/0x185
[  300.321746]  ext4_init_new_dir+0xa1/0x188
[  300.330890]  ext4_mkdir+0x144/0x324
[  300.339800]  vfs_mkdir+0xca/0x124
[  300.348443]  do_mkdirat+0xea/0x134
[  300.356845]  __x64_sys_mkdir+0x43/0x50
[  300.365327]  do_syscall_64+0x8f/0xb0
[  300.373671]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  300.381985] RIP: 0033:0x7f42560a63cb
[  300.390109] Code: 8b 05 61 8a 0f 00 41 bc ff ff ff ff 64 c7 00 16 00 00 00 e9 4f ff ff ff e8 82 fd 01 00 66 90 f3 0f 1e fa b8 53 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 2d 8a 0f 00 f7 d8 64 89 01 48
[  300.408774] RSP: 002b:00007ffd96246eb8 EFLAGS: 00000246 ORIG_RAX: 0000000000000053
[  300.418586] RAX: ffffffffffffffda RBX: 00000000000001ff RCX: 00007f42560a63cb
[  300.428527] RDX: 0000000000000000 RSI: 00000000000001ff RDI: 00007ffd96247f1b
[  300.438497] RBP: 00007ffd96247f1b R08: 00000000000001ff R09: 0000000000000000
[  300.448491] R10: 0000000000001000 R11: 0000000000000246 R12: 0000000000000000
[  300.458455] R13: 00007ffd96247078 R14: 00007ffd96247f1b R15: 00007ffd96247080
[  300.468480]  </TASK>
[....]

