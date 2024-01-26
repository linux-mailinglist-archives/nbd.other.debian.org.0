Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F042883E6AA
	for <lists+nbd@lfdr.de>; Sat, 27 Jan 2024 00:21:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C9F41206F2; Fri, 26 Jan 2024 23:21:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 26 23:21:27 2024
Old-Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FOURLA,MD5_SHA1_SUM,RCVD_IN_DNSWL_MED,TO_TOO_MANY,T_SCC_BODY_TEXT_LINE,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BEC8A206D1
	for <lists-other-nbd@bendel.debian.org>; Fri, 26 Jan 2024 23:03:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.168 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-2.758, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_MED=-2.3, TO_TOO_MANY=1,
	T_SCC_BODY_TEXT_LINE=-0.01, WORD_WITHOUT_VOWELS=1]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HCIAe7mSRc-x for <lists-other-nbd@bendel.debian.org>;
	Fri, 26 Jan 2024 23:03:36 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
X-Greylist: delayed 451 seconds by postgrey-1.36 at bendel; Fri, 26 Jan 2024 23:03:36 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3CCC4206D3
	for <nbd@other.debian.org>; Fri, 26 Jan 2024 23:03:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C71E3CE37CE;
	Fri, 26 Jan 2024 22:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B62C433C7;
	Fri, 26 Jan 2024 22:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706309760;
	bh=GT8qkNsDVQYo2be8UGd4BfQYMca9fIktcwPMFY8iB34=;
	h=Subject:To:Cc:From:Date:From;
	b=2Jguo4jkurey1SnTHv3glGHh7HT81R3MJY6lLK3qVPPloTMYnLH5GwTkyR1V6NvUw
	 GrezkPyv1UE7KfQvf71JKCK2RsImSrTtQfWHCm5gOaa9wGNsMoWpqzg89+1cUfhAuj
	 Hww5WlQwlRmA6kHs2+qX6c8PM8nLtnNMx1XwZ8/o=
Subject: Patch "nbd: always initialize struct msghdr completely" has been added to the 6.6-stable tree
To: axboe@kernel.dk,edumazet@google.com,gregkh@linuxfoundation.org,horms@kernel.org,josef@toxicpanda.com,nbd@other.debian.org,syzkaller@googlegroups.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 26 Jan 2024 14:55:34 -0800
Message-ID: <2024012634-alabaster-quartered-86c5@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uuB4eVQZ9hI.A.8-.35DtlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2717
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2024012634-alabaster-quartered-86c5@gregkh
Resent-Date: Fri, 26 Jan 2024 23:21:27 +0000 (UTC)


This is a note to let you know that I've just added the patch titled

    nbd: always initialize struct msghdr completely

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     nbd-always-initialize-struct-msghdr-completely.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


>From 78fbb92af27d0982634116c7a31065f24d092826 Mon Sep 17 00:00:00 2001
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 12 Jan 2024 13:26:57 +0000
Subject: nbd: always initialize struct msghdr completely

From: Eric Dumazet <edumazet@google.com>

commit 78fbb92af27d0982634116c7a31065f24d092826 upstream.

syzbot complains that msg->msg_get_inq value can be uninitialized [1]

struct msghdr got many new fields recently, we should always make
sure their values is zero by default.

[1]
 BUG: KMSAN: uninit-value in tcp_recvmsg+0x686/0xac0 net/ipv4/tcp.c:2571
  tcp_recvmsg+0x686/0xac0 net/ipv4/tcp.c:2571
  inet_recvmsg+0x131/0x580 net/ipv4/af_inet.c:879
  sock_recvmsg_nosec net/socket.c:1044 [inline]
  sock_recvmsg+0x12b/0x1e0 net/socket.c:1066
  __sock_xmit+0x236/0x5c0 drivers/block/nbd.c:538
  nbd_read_reply drivers/block/nbd.c:732 [inline]
  recv_work+0x262/0x3100 drivers/block/nbd.c:863
  process_one_work kernel/workqueue.c:2627 [inline]
  process_scheduled_works+0x104e/0x1e70 kernel/workqueue.c:2700
  worker_thread+0xf45/0x1490 kernel/workqueue.c:2781
  kthread+0x3ed/0x540 kernel/kthread.c:388
  ret_from_fork+0x66/0x80 arch/x86/kernel/process.c:147
  ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:242

Local variable msg created at:
  __sock_xmit+0x4c/0x5c0 drivers/block/nbd.c:513
  nbd_read_reply drivers/block/nbd.c:732 [inline]
  recv_work+0x262/0x3100 drivers/block/nbd.c:863

CPU: 1 PID: 7465 Comm: kworker/u5:1 Not tainted 6.7.0-rc7-syzkaller-00041-gf016f7547aee #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/17/2023
Workqueue: nbd5-recv recv_work

Fixes: f94fd25cb0aa ("tcp: pass back data left in socket after receive")
Reported-by: syzbot <syzkaller@googlegroups.com>
Signed-off-by: Eric Dumazet <edumazet@google.com>
Cc: stable@vger.kernel.org
Cc: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org
Cc: nbd@other.debian.org
Reviewed-by: Simon Horman <horms@kernel.org>
Link: https://lore.kernel.org/r/20240112132657.647112-1-edumazet@google.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/block/nbd.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -510,7 +510,7 @@ static int __sock_xmit(struct nbd_device
 		       struct iov_iter *iter, int msg_flags, int *sent)
 {
 	int result;
-	struct msghdr msg;
+	struct msghdr msg = {} ;
 	unsigned int noreclaim_flag;
 
 	if (unlikely(!sock)) {
@@ -526,10 +526,6 @@ static int __sock_xmit(struct nbd_device
 	do {
 		sock->sk->sk_allocation = GFP_NOIO | __GFP_MEMALLOC;
 		sock->sk->sk_use_task_frag = false;
-		msg.msg_name = NULL;
-		msg.msg_namelen = 0;
-		msg.msg_control = NULL;
-		msg.msg_controllen = 0;
 		msg.msg_flags = msg_flags | MSG_NOSIGNAL;
 
 		if (send)


Patches currently in stable-queue which might be from edumazet@google.com are

queue-6.6/nbd-always-initialize-struct-msghdr-completely.patch

