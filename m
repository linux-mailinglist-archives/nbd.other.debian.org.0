Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAHzFIaHw2lRrQQAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Wed, 25 Mar 2026 07:58:14 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067F3205C1
	for <lists+nbd@lfdr.de>; Wed, 25 Mar 2026 07:58:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CEC7520598; Wed, 25 Mar 2026 06:58:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 25 06:58:13 2026
Old-Return-Path: <3BIPDaQYKA20VfYTjfRZZRWP.NZXYMOZeSPc.OPMTLY.ZcR@flex--kuniyu.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,TO_TOO_MANY,
	USER_IN_DEF_DKIM_WL,WORD_WITHOUT_VOWELS autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A1F7320599
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Mar 2026 06:39:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.701 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1, USER_IN_DEF_DKIM_WL=-7.5,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KvALFfyw8uGX for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Mar 2026 06:39:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-pl1-x649.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 644BA2059F
	for <nbd@other.debian.org>; Wed, 25 Mar 2026 06:39:04 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b0554888cfso29125935ad.3
        for <nbd@other.debian.org>; Tue, 24 Mar 2026 23:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774420740; x=1775025540; darn=other.debian.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=td6V/HkD0jTQ2Ddg/5MFuwcSeqzl2MK0WzcLyWTHSrw=;
        b=ZzHpprQWCNR5NAHOlOpz+gChVALnVHWOrZQShdT68aNj37/lcxQhqTWI2cIe+FTFL3
         LNpoJHTrsB9AZ86lPkX+mECO+pUAplbpKIsmghUNthHdB+aV7PUNFiCslRdlk4+gTb37
         po+s7aixoxIo3R4OYu8lmuLobPl3/1edNTs6XRu3MKTn60jXHD4WdiT6kelO7PY4Tg1i
         Zin/CTL5PViAO+ueDBKqGq47JFWUdGxwy0oiNvzYQBZEztJgjbZXagkf83Ikkm41kGFy
         IHztsKm55ycR3Y+aSh5ONXQVTw9J7I64Ka1XWE60b3Ts+JdfEwbb/PSLf1aeA9FMXqDL
         Oyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420740; x=1775025540;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=td6V/HkD0jTQ2Ddg/5MFuwcSeqzl2MK0WzcLyWTHSrw=;
        b=TsArNPzEhMKD27/4NlE+/Gkz29tLl0WdW1CwawOFnbk5UZaGXr6D/i8uAyFAdJTRw3
         oqwRuUNhB0r6fdj8F2QwfdO17vYPehjxH08kylErcgvtWtxEi3ZNWUSucLd9WK2CJAR8
         vfTQEA1d3hTzVnxOuZIJ1EDryAyNRzg75lF+wAb0MTQpuIqr79EuEIvadqfrvAIfKXgb
         eU0ucJAJPAz4isGuaHi/ciGZhVsRDhEsives+w2A/l9H83D5ohl9Jq+/tMahSTUNLthm
         SZeLujCu8hoAbuF4OMaInlTAhvk4tWM7h0MDhTYbTkcDt5xVXTeBN8aaqKWpVQb7GSHV
         ep5A==
X-Forwarded-Encrypted: i=1; AJvYcCXvBYX+1sZ7nC/UyAbxLmBZGls877wLS8/9HUFjOpOXU/VtteqowquR0JOP4zsMiWQYtlE=@other.debian.org
X-Gm-Message-State: AOJu0YxgSYYt4xrQfGqUQjAa8jvCRNpJcZqPTlGMNk5vG38pTMY1H3X/
	Ib55l4kv7R70dlj5jxSPj540IwVHCQVMfIwZJUcalfbTbO7y1wlumPf2lMVgbb9WOF5CoT41S5I
	zVzX5KA==
X-Received: from pgmp22.prod.google.com ([2002:a63:1e56:0:b0:c74:497:507e])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:918b:b0:39b:e9e1:699f
 with SMTP id adf61e73a8af0-39c4aa688bbmr2702365637.12.1774420740019; Tue, 24
 Mar 2026 23:39:00 -0700 (PDT)
Date: Wed, 25 Mar 2026 06:38:26 +0000
In-Reply-To: <20260325063843.1790782-1-kuniyu@google.com>
Mime-Version: 1.0
References: <20260325063843.1790782-1-kuniyu@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260325063843.1790782-6-kuniyu@google.com>
Subject: [PATCH 5/5] nbd: Use lock_sock_try() for TCP sendmsg() and shutdown().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	netdev@vger.kernel.org, syzbot+7b4f368d3955d2c9950e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <q8CEGmx6uDK.A.CE-M.Fe4wpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3529
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260325063843.1790782-6-kuniyu@google.com
Resent-Date: Wed, 25 Mar 2026 06:58:13 +0000 (UTC)
X-Spamd-Result: default: False [1.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:kuniyu@google.com,m:kuni1840@gmail.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:netdev@vger.kernel.org,m:syzbot+7b4f368d3955d2c9950e@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kuniyu@google.com,bounce-nbd=lists@other.debian.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,other.debian.org,syzkaller.appspotmail.com];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[kuniyu@google.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[nbd,7b4f368d3955d2c9950e];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:helo,bendel.debian.org:rdns,appspotmail.com:email]
X-Rspamd-Queue-Id: 0067F3205C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As reported by syzbot [0], NBD can trigger a deadlock during
memory reclaim.

This occurs when a process holds lock_sock() on a backend TCP
socket and triggers a memory allocation that leads to fs reclaim.
If it eventually calls into NBD to send data or shut down the
socket, NBD will attempt to acquire the same lock_sock(),
resulting in the deadlock.

While NBD sets sk->sk_allocation to GFP_NOIO before calling
sendmsg(), this does not prevent the issue in some paths where
GFP_KERNEL is used directly under lock_sock().

To resolve this, let's use lock_sock_try() for TCP sendmsg() and
shutdown().

For sock_sendmsg(), if lock_sock_try() fails, -ERESTARTSYS is
returned, allowing the request to be retried later (e.g., via
was_interrupted() logic).

For sock_sendmsg() for NBD_CMD_DISC and kernel_sock_shutdown(),
the operation might be skipped if the lock cannot be acquired.
However, this is not expected to occur in practice because the
backend TCP socket should not be touched by userspace once it is
handed over to NBD.

Note that sock_recvmsg() does not require this special handling
because it is only called from the workqueue context.

Also note that AF_UNIX sockets continue to use sock_sendmsg()
and kernel_sock_shutdown() because unix_stream_sendmsg() and
unix_shutdown() do not acquire lock_sock().

[0]:
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L
syz.7.2282/12353 is trying to acquire lock:
ffffffff8e9aa700 (fs_reclaim){+.+.}-{0:0}, at: might_alloc include/linux/sched/mm.h:317 [inline]
ffffffff8e9aa700 (fs_reclaim){+.+.}-{0:0}, at: slab_pre_alloc_hook mm/slub.c:4489 [inline]
ffffffff8e9aa700 (fs_reclaim){+.+.}-{0:0}, at: slab_alloc_node mm/slub.c:4843 [inline]
ffffffff8e9aa700 (fs_reclaim){+.+.}-{0:0}, at: kmem_cache_alloc_node_noprof+0x53/0x6f0 mm/slub.c:4918

but task is already holding lock:
ffff88806f972a20 (sk_lock-AF_INET6){+.+.}-{0:0}, at: lock_sock include/net/sock.h:1709 [inline]
ffff88806f972a20 (sk_lock-AF_INET6){+.+.}-{0:0}, at: tcp_close+0x1d/0x110 net/ipv4/tcp.c:3349

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #6 (sk_lock-AF_INET6){+.+.}-{0:0}:
       lock_sock_nested+0x41/0xf0 net/core/sock.c:3780
       lock_sock include/net/sock.h:1709 [inline]
       inet_shutdown+0x67/0x410 net/ipv4/af_inet.c:919
       nbd_mark_nsock_dead+0xae/0x5c0 drivers/block/nbd.c:318
       sock_shutdown+0x16b/0x200 drivers/block/nbd.c:411
       nbd_clear_sock drivers/block/nbd.c:1427 [inline]
       nbd_config_put+0x1eb/0x750 drivers/block/nbd.c:1451
       nbd_genl_connect+0xaf8/0x1a40 drivers/block/nbd.c:2248
       genl_family_rcv_msg_doit+0x214/0x300 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x560/0x800 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x159/0x420 net/netlink/af_netlink.c:2550
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
       netlink_unicast+0x5aa/0x870 net/netlink/af_netlink.c:1344
       netlink_sendmsg+0x8b0/0xda0 net/netlink/af_netlink.c:1894
       sock_sendmsg_nosec net/socket.c:727 [inline]
       __sock_sendmsg net/socket.c:742 [inline]
       ____sys_sendmsg+0x9e1/0xb70 net/socket.c:2592
       ___sys_sendmsg+0x190/0x1e0 net/socket.c:2646
       __sys_sendmsg+0x170/0x220 net/socket.c:2678
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x106/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #5 (&nsock->tx_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:614 [inline]
       __mutex_lock+0x1a2/0x1b90 kernel/locking/mutex.c:776
       nbd_handle_cmd drivers/block/nbd.c:1143 [inline]
       nbd_queue_rq+0x428/0x1080 drivers/block/nbd.c:1207
       blk_mq_dispatch_rq_list+0x422/0x1e70 block/blk-mq.c:2148
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xcea/0x1620 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xd7/0x1c0 block/blk-mq-sched.c:329
       blk_mq_run_hw_queue+0x23c/0x670 block/blk-mq.c:2386
       blk_mq_dispatch_list+0x51d/0x1360 block/blk-mq.c:2949
       blk_mq_flush_plug_list block/blk-mq.c:2997 [inline]
       blk_mq_flush_plug_list+0x130/0x600 block/blk-mq.c:2969
       __blk_flush_plug+0x2c4/0x4b0 block/blk-core.c:1230
       blk_finish_plug block/blk-core.c:1257 [inline]
       __submit_bio+0x584/0x6c0 block/blk-core.c:649
       __submit_bio_noacct_mq block/blk-core.c:722 [inline]
       submit_bio_noacct_nocheck+0x562/0xc10 block/blk-core.c:753
       submit_bio_noacct+0xd17/0x2010 block/blk-core.c:884
       blk_crypto_submit_bio include/linux/blk-crypto.h:203 [inline]
       submit_bh_wbc+0x59c/0x770 fs/buffer.c:2821
       submit_bh fs/buffer.c:2826 [inline]
       block_read_full_folio+0x264/0x8e0 fs/buffer.c:2444
       filemap_read_folio+0xfc/0x3b0 mm/filemap.c:2501
       do_read_cache_folio+0x2d7/0x6b0 mm/filemap.c:4101
       read_mapping_folio include/linux/pagemap.h:1028 [inline]
       read_part_sector+0xd1/0x370 block/partitions/core.c:723
       adfspart_check_ICS+0x93/0x910 block/partitions/acorn.c:360
       check_partition block/partitions/core.c:142 [inline]
       blk_add_partitions block/partitions/core.c:590 [inline]
       bdev_disk_changed+0x7f8/0xc80 block/partitions/core.c:694
       blkdev_get_whole+0x187/0x290 block/bdev.c:764
       bdev_open+0x2c7/0xe40 block/bdev.c:973
       blkdev_open+0x34e/0x4f0 block/fops.c:697
       do_dentry_open+0x6d8/0x1660 fs/open.c:949
       vfs_open+0x82/0x3f0 fs/open.c:1081
       do_open fs/namei.c:4671 [inline]
       path_openat+0x208c/0x31a0 fs/namei.c:4830
       do_file_open+0x20e/0x430 fs/namei.c:4859
       do_sys_openat2+0x10d/0x1e0 fs/open.c:1366
       do_sys_open fs/open.c:1372 [inline]
       __do_sys_openat fs/open.c:1388 [inline]
       __se_sys_openat fs/open.c:1383 [inline]
       __x64_sys_openat+0x12d/0x210 fs/open.c:1383
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x106/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #4 (&cmd->lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:614 [inline]
       __mutex_lock+0x1a2/0x1b90 kernel/locking/mutex.c:776
       nbd_queue_rq+0xba/0x1080 drivers/block/nbd.c:1199
       blk_mq_dispatch_rq_list+0x422/0x1e70 block/blk-mq.c:2148
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xcea/0x1620 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xd7/0x1c0 block/blk-mq-sched.c:329
       blk_mq_run_hw_queue+0x23c/0x670 block/blk-mq.c:2386
       blk_mq_dispatch_list+0x51d/0x1360 block/blk-mq.c:2949
       blk_mq_flush_plug_list block/blk-mq.c:2997 [inline]
       blk_mq_flush_plug_list+0x130/0x600 block/blk-mq.c:2969
       __blk_flush_plug+0x2c4/0x4b0 block/blk-core.c:1230
       blk_finish_plug block/blk-core.c:1257 [inline]
       __submit_bio+0x584/0x6c0 block/blk-core.c:649
       __submit_bio_noacct_mq block/blk-core.c:722 [inline]
       submit_bio_noacct_nocheck+0x562/0xc10 block/blk-core.c:753
       submit_bio_noacct+0xd17/0x2010 block/blk-core.c:884
       blk_crypto_submit_bio include/linux/blk-crypto.h:203 [inline]
       submit_bh_wbc+0x59c/0x770 fs/buffer.c:2821
       submit_bh fs/buffer.c:2826 [inline]
       block_read_full_folio+0x264/0x8e0 fs/buffer.c:2444
       filemap_read_folio+0xfc/0x3b0 mm/filemap.c:2501
       do_read_cache_folio+0x2d7/0x6b0 mm/filemap.c:4101
       read_mapping_folio include/linux/pagemap.h:1028 [inline]
       read_part_sector+0xd1/0x370 block/partitions/core.c:723
       adfspart_check_ICS+0x93/0x910 block/partitions/acorn.c:360
       check_partition block/partitions/core.c:142 [inline]
       blk_add_partitions block/partitions/core.c:590 [inline]
       bdev_disk_changed+0x7f8/0xc80 block/partitions/core.c:694
       blkdev_get_whole+0x187/0x290 block/bdev.c:764
       bdev_open+0x2c7/0xe40 block/bdev.c:973
       blkdev_open+0x34e/0x4f0 block/fops.c:697
       do_dentry_open+0x6d8/0x1660 fs/open.c:949
       vfs_open+0x82/0x3f0 fs/open.c:1081
       do_open fs/namei.c:4671 [inline]
       path_openat+0x208c/0x31a0 fs/namei.c:4830
       do_file_open+0x20e/0x430 fs/namei.c:4859
       do_sys_openat2+0x10d/0x1e0 fs/open.c:1366
       do_sys_open fs/open.c:1372 [inline]
       __do_sys_openat fs/open.c:1388 [inline]
       __se_sys_openat fs/open.c:1383 [inline]
       __x64_sys_openat+0x12d/0x210 fs/open.c:1383
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x106/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #3 (set->srcu){.+.+}-{0:0}:
       srcu_lock_sync include/linux/srcu.h:199 [inline]
       __synchronize_srcu+0xa1/0x2a0 kernel/rcu/srcutree.c:1505
       blk_mq_wait_quiesce_done block/blk-mq.c:284 [inline]
       blk_mq_wait_quiesce_done block/blk-mq.c:281 [inline]
       blk_mq_quiesce_queue block/blk-mq.c:304 [inline]
       blk_mq_quiesce_queue+0x149/0x1c0 block/blk-mq.c:299
       elevator_switch+0x17b/0x7e0 block/elevator.c:576
       elevator_change+0x352/0x530 block/elevator.c:681
       elevator_set_default+0x29e/0x360 block/elevator.c:754
       blk_register_queue+0x412/0x590 block/blk-sysfs.c:946
       __add_disk+0x73f/0xe40 block/genhd.c:528
       add_disk_fwnode+0x118/0x5c0 block/genhd.c:597
       add_disk include/linux/blkdev.h:785 [inline]
       nbd_dev_add+0x77a/0xb10 drivers/block/nbd.c:1984
       nbd_init+0x291/0x2b0 drivers/block/nbd.c:2692
       do_one_initcall+0x11d/0x760 init/main.c:1382
       do_initcall_level init/main.c:1444 [inline]
       do_initcalls init/main.c:1460 [inline]
       do_basic_setup init/main.c:1479 [inline]
       kernel_init_freeable+0x6e5/0x7a0 init/main.c:1692
       kernel_init+0x1f/0x1e0 init/main.c:1582
       ret_from_fork+0x754/0xd80 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #2 (&q->elevator_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:614 [inline]
       __mutex_lock+0x1a2/0x1b90 kernel/locking/mutex.c:776
       elevator_change+0x1bc/0x530 block/elevator.c:679
       elevator_set_none+0x92/0xf0 block/elevator.c:769
       blk_mq_elv_switch_none block/blk-mq.c:5110 [inline]
       __blk_mq_update_nr_hw_queues block/blk-mq.c:5155 [inline]
       blk_mq_update_nr_hw_queues+0x4c1/0x15f0 block/blk-mq.c:5220
       nbd_start_device+0x1a6/0xbd0 drivers/block/nbd.c:1489
       nbd_genl_connect+0xff2/0x1a40 drivers/block/nbd.c:2239
       genl_family_rcv_msg_doit+0x214/0x300 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x560/0x800 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x159/0x420 net/netlink/af_netlink.c:2550
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
       netlink_unicast+0x5aa/0x870 net/netlink/af_netlink.c:1344
       netlink_sendmsg+0x8b0/0xda0 net/netlink/af_netlink.c:1894
       sock_sendmsg_nosec net/socket.c:727 [inline]
       __sock_sendmsg net/socket.c:742 [inline]
       ____sys_sendmsg+0x9e1/0xb70 net/socket.c:2592
       ___sys_sendmsg+0x190/0x1e0 net/socket.c:2646
       __sys_sendmsg+0x170/0x220 net/socket.c:2678
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x106/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&q->q_usage_counter(io)#49){++++}-{0:0}:
       blk_alloc_queue+0x610/0x790 block/blk-core.c:461
       blk_mq_alloc_queue+0x174/0x290 block/blk-mq.c:4429
       __blk_mq_alloc_disk+0x29/0x120 block/blk-mq.c:4476
       nbd_dev_add+0x492/0xb10 drivers/block/nbd.c:1954
       nbd_init+0x291/0x2b0 drivers/block/nbd.c:2692
       do_one_initcall+0x11d/0x760 init/main.c:1382
       do_initcall_level init/main.c:1444 [inline]
       do_initcalls init/main.c:1460 [inline]
       do_basic_setup init/main.c:1479 [inline]
       kernel_init_freeable+0x6e5/0x7a0 init/main.c:1692
       kernel_init+0x1f/0x1e0 init/main.c:1582
       ret_from_fork+0x754/0xd80 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 (fs_reclaim){+.+.}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x14b8/0x2630 kernel/locking/lockdep.c:5237
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1cf/0x380 kernel/locking/lockdep.c:5825
       __fs_reclaim_acquire mm/page_alloc.c:4348 [inline]
       fs_reclaim_acquire+0xc4/0x100 mm/page_alloc.c:4362
       might_alloc include/linux/sched/mm.h:317 [inline]
       slab_pre_alloc_hook mm/slub.c:4489 [inline]
       slab_alloc_node mm/slub.c:4843 [inline]
       kmem_cache_alloc_node_noprof+0x53/0x6f0 mm/slub.c:4918
       __alloc_skb+0x140/0x710 net/core/skbuff.c:702
       alloc_skb include/linux/skbuff.h:1383 [inline]
       tcp_send_active_reset+0x8b/0xa60 net/ipv4/tcp_output.c:3862
       __tcp_close+0x41e/0x1110 net/ipv4/tcp.c:3223
       tcp_close+0x28/0x110 net/ipv4/tcp.c:3350
       inet_release+0xed/0x200 net/ipv4/af_inet.c:443
       inet6_release+0x4f/0x70 net/ipv6/af_inet6.c:479
       __sock_release+0xb3/0x260 net/socket.c:662
       sock_close+0x1c/0x30 net/socket.c:1455
       __fput+0x3ff/0xb40 fs/file_table.c:469
       task_work_run+0x150/0x240 kernel/task_work.c:233
       resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
       __exit_to_user_mode_loop kernel/entry/common.c:67 [inline]
       exit_to_user_mode_loop+0x100/0x4a0 kernel/entry/common.c:98
       __exit_to_user_mode_prepare include/linux/irq-entry-common.h:226 [inline]
       syscall_exit_to_user_mode_prepare include/linux/irq-entry-common.h:256 [inline]
       syscall_exit_to_user_mode include/linux/entry-common.h:325 [inline]
       do_syscall_64+0x67c/0xf80 arch/x86/entry/syscall_64.c:100
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  fs_reclaim --> &nsock->tx_lock --> sk_lock-AF_INET6

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(sk_lock-AF_INET6);
                               lock(&nsock->tx_lock);
                               lock(sk_lock-AF_INET6);
  lock(fs_reclaim);

 *** DEADLOCK ***

Fixes: fd8383fd88a2 ("nbd: convert to blkmq")
Reported-by: syzbot+7b4f368d3955d2c9950e@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/netdev/69c37e6a.a70a0220.234938.0046.GAE@google.com/
Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 drivers/block/nbd.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 1877554d362e..d0d57f8816db 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -45,6 +45,8 @@
 #include <linux/nbd.h>
 #include <linux/nbd-netlink.h>
 #include <net/genetlink.h>
+#include <net/tcp.h>
+#include <net/inet_common.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/nbd.h>
@@ -302,6 +304,21 @@ static int nbd_disconnected(struct nbd_config *config)
 		test_bit(NBD_RT_DISCONNECT_REQUESTED, &config->runtime_flags);
 }
 
+static void nbd_sock_shutdown(struct socket *sock)
+{
+	struct sock *sk = sock->sk;
+
+	if (sk_is_stream_unix(sk)) {
+		kernel_sock_shutdown(sock, SHUT_RDWR);
+		return;
+	}
+
+	if (lock_sock_try(sk)) {
+		inet_shutdown_locked(sock, SHUT_RDWR);
+		release_sock(sk);
+	}
+}
+
 static void nbd_mark_nsock_dead(struct nbd_device *nbd, struct nbd_sock *nsock,
 				int notify)
 {
@@ -315,7 +332,8 @@ static void nbd_mark_nsock_dead(struct nbd_device *nbd, struct nbd_sock *nsock,
 		}
 	}
 	if (!nsock->dead) {
-		kernel_sock_shutdown(nsock->sock, SHUT_RDWR);
+		nbd_sock_shutdown(nsock->sock);
+
 		if (atomic_dec_return(&nbd->config->live_connections) == 0) {
 			if (test_and_clear_bit(NBD_RT_DISCONNECT_REQUESTED,
 					       &nbd->config->runtime_flags)) {
@@ -548,6 +566,22 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
 	return BLK_EH_DONE;
 }
 
+static int nbd_sock_sendmsg(struct socket *sock, struct msghdr *msg)
+{
+	struct sock *sk = sock->sk;
+	int err = -ERESTARTSYS;
+
+	if (sk_is_stream_unix(sk))
+		return sock_sendmsg(sock, msg);
+
+	if (lock_sock_try(sk)) {
+		err = tcp_sendmsg_locked(sk, msg, msg_data_left(msg));
+		release_sock(sk);
+	}
+
+	return err;
+}
+
 static int __sock_xmit(struct nbd_device *nbd, struct socket *sock, int send,
 		       struct iov_iter *iter, int msg_flags, int *sent)
 {
@@ -573,7 +607,7 @@ static int __sock_xmit(struct nbd_device *nbd, struct socket *sock, int send,
 			msg.msg_flags = msg_flags | MSG_NOSIGNAL;
 
 			if (send)
-				result = sock_sendmsg(sock, &msg);
+				result = nbd_sock_sendmsg(sock, &msg);
 			else
 				result = sock_recvmsg(sock, &msg, msg.msg_flags);
 
-- 
2.53.0.1018.g2bb0e51243-goog

