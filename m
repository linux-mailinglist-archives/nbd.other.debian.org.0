Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C63BD82C10A
	for <lists+nbd@lfdr.de>; Fri, 12 Jan 2024 14:45:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AC1E92053F; Fri, 12 Jan 2024 13:45:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 12 13:45:19 2024
Old-Return-Path: <3JD6hZQgKA1k54LD1Q5K7FF7C5.3FDE24FK85I.45291E.FI7@flex--edumazet.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MD5_SHA1_SUM,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C49D32051F
	for <lists-other-nbd@bendel.debian.org>; Fri, 12 Jan 2024 13:27:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.611 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cuSU_2gAv_1T for <lists-other-nbd@bendel.debian.org>;
	Fri, 12 Jan 2024 13:27:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-yb1-xb4a.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CCC2720516
	for <nbd@other.debian.org>; Fri, 12 Jan 2024 13:27:04 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dbce2a8d700so7987612276.1
        for <nbd@other.debian.org>; Fri, 12 Jan 2024 05:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705066021; x=1705670821; darn=other.debian.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f93Ig9LJYi6SxdMZrbYZZHjHKOcib3L6QU/xnO4vU2I=;
        b=YQqbhkBRGOCSqszyaEb2FLAKb11DZNi2Wf/IgfLgHXwYWNbmiBVBen77ksrOlLrrvg
         u2F7zZ3OtjyOVL/TXqcgAY1hBjuYoIIg6He09/Oy4tVY21JibfKOV2Q4+zmGEA6cKmtK
         aIJXrdZA7wrWSIYtbUgQXIw2s5zeS2yNfSDRTFhBziThRNTOXHFDPxPBOgemR8L9IeJc
         Pm8n27NHFGZ7pQWQzvJIJyMSTUGWX8Wwl2eBz/57dWUUtebxYyqP0taV4rZ+10SDQUOi
         sCOYbxYV8qA42sHbqfV0EMFZnW1XvGjgyC8jaPMxlaDal/rMVTBwh20yrkYopkPiYxfd
         NdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705066021; x=1705670821;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f93Ig9LJYi6SxdMZrbYZZHjHKOcib3L6QU/xnO4vU2I=;
        b=K4B4keBPXztkN2P0uWGwFtR5KvNOzNHKFFHF2ST7NTM6dBzeLOO+sfdpyadRu/hCJ9
         HYT7rZbEDLtB7FUKMb3HfNmj9p7D1gRUIBoK6QOa+0Wm30P82ja/ZZ/UdVsXlh18iw9P
         jD1nWhjIEMAJIRqhmDJv6aasm24rqGPHqJqkTAXNuUiO3xyXVAYvdhwCuiw0EyvtMRWT
         B5cx91Uzdwonti7KJc3TuOEZjyf4oXjOhDXTQCa09oB6uY/PBLl2bvN4q8YvzAUvqNIv
         9rXdvq2zvY5meXc3kTR+9J/mA995CSgPiMdhqibAk/oozaXRXbVdPDURrIPjDsnK4LoD
         7k6w==
X-Gm-Message-State: AOJu0YxBVfDe96CB7XcGaqTqm3QQ+GcoUaX4ISARitgu509qg2BOmrmh
	q8daPXS885b7XMZ3p5UPODDQ6GBnyT8YWF8/0I/n
X-Google-Smtp-Source: AGHT+IEdNpp9MV1efGqWVumTNO6v9b0Uyr5We6/Yz4ZyzAHpiTLmjWlQyhYuSCloT/e8oLsD+H1RgUnxsQqoUQ==
X-Received: from edumazet1.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:395a])
 (user=edumazet job=sendgmr) by 2002:a05:6902:2483:b0:dbd:73bd:e55a with SMTP
 id ds3-20020a056902248300b00dbd73bde55amr21536ybb.4.1705066020920; Fri, 12
 Jan 2024 05:27:00 -0800 (PST)
Date: Fri, 12 Jan 2024 13:26:57 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
Message-ID: <20240112132657.647112-1-edumazet@google.com>
Subject: [PATCH net] nbd: always initialize struct msghdr completely
From: Eric Dumazet <edumazet@google.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Eric Dumazet <edumazet@google.com>, Eric Dumazet <eric.dumazet@gmail.com>, 
	syzbot <syzkaller@googlegroups.com>, stable@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org, nbd@other.debian.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6YksqGKX2AM.A.nhB.vJUolB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2708
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240112132657.647112-1-edumazet@google.com
Resent-Date: Fri, 12 Jan 2024 13:45:19 +0000 (UTC)

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
---
 drivers/block/nbd.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 4e72ec4e25ac5a0f41bca299e7efaecf6503c451..33a8f37bb6a1f504060f783c6d727e4c76026a2e 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -508,7 +508,7 @@ static int __sock_xmit(struct nbd_device *nbd, struct socket *sock, int send,
 		       struct iov_iter *iter, int msg_flags, int *sent)
 {
 	int result;
-	struct msghdr msg;
+	struct msghdr msg = {} ;
 	unsigned int noreclaim_flag;
 
 	if (unlikely(!sock)) {
@@ -524,10 +524,6 @@ static int __sock_xmit(struct nbd_device *nbd, struct socket *sock, int send,
 	do {
 		sock->sk->sk_allocation = GFP_NOIO | __GFP_MEMALLOC;
 		sock->sk->sk_use_task_frag = false;
-		msg.msg_name = NULL;
-		msg.msg_namelen = 0;
-		msg.msg_control = NULL;
-		msg.msg_controllen = 0;
 		msg.msg_flags = msg_flags | MSG_NOSIGNAL;
 
 		if (send)
-- 
2.43.0.275.g3460e3d667-goog

