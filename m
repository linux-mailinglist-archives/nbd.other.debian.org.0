Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FE282DB1B
	for <lists+nbd@lfdr.de>; Mon, 15 Jan 2024 15:15:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0976C206FC; Mon, 15 Jan 2024 14:15:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan 15 14:15:15 2024
Old-Return-Path: <horms@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0E210206BE
	for <lists-other-nbd@bendel.debian.org>; Mon, 15 Jan 2024 13:57:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.168 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-2.758, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id URqRL-i8IiBD for <lists-other-nbd@bendel.debian.org>;
	Mon, 15 Jan 2024 13:57:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 375 seconds by postgrey-1.36 at bendel; Mon, 15 Jan 2024 13:57:42 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AC61120691
	for <nbd@other.debian.org>; Mon, 15 Jan 2024 13:57:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4F33EB80BFF;
	Mon, 15 Jan 2024 13:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F5AC433F1;
	Mon, 15 Jan 2024 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705326656;
	bh=BPKbcav8hKWyYniO8mP6S8bRiXKYHLnZvQiLfUnWJCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/EZjsy9OEGxpKnOuSUsPbLrTxrXFT+yOVg5M9WUaBOZw/s8FNAWV7u5iIDQdlhNn
	 2Q6JiJ6YSLClAKQChialuCcfOhLwdp7oszZU1qO5+hAjSqdSElJSpMO32eBQ8JISPU
	 uFQb000fKROVzqr1DqlVmVfSe+7U6P8LI+9vRZ/h1kcX7KGt5HslG2X4xUzzkS1j6Q
	 fgO7W9vRPruy9LMBtFh6rY+xvpgqOrOfAdy4H6HjsbpLdIf55zchy7IPMujDsfoQjr
	 PNbM+3IE+jnay2p/EyHp7fJ8Xle1sdWulkG3ZwFeT0JrNwzjyOtYOEMbg0caKIwJ8Y
	 hlqv1zcSRFCtw==
Date: Mon, 15 Jan 2024 13:50:51 +0000
From: Simon Horman <horms@kernel.org>
To: Eric Dumazet <edumazet@google.com>
Cc: Jens Axboe <axboe@kernel.dk>,
	linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org,
	Eric Dumazet <eric.dumazet@gmail.com>,
	syzbot <syzkaller@googlegroups.com>, stable@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH net] nbd: always initialize struct msghdr completely
Message-ID: <20240115135051.GA432001@kernel.org>
References: <20240112132657.647112-1-edumazet@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112132657.647112-1-edumazet@google.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <a3bv2JaXOiH.A.CK.z3TplB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2709
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240115135051.GA432001@kernel.org
Resent-Date: Mon, 15 Jan 2024 14:15:16 +0000 (UTC)

On Fri, Jan 12, 2024 at 01:26:57PM +0000, Eric Dumazet wrote:
> syzbot complains that msg->msg_get_inq value can be uninitialized [1]
> 
> struct msghdr got many new fields recently, we should always make
> sure their values is zero by default.
> 
> [1]
>  BUG: KMSAN: uninit-value in tcp_recvmsg+0x686/0xac0 net/ipv4/tcp.c:2571
>   tcp_recvmsg+0x686/0xac0 net/ipv4/tcp.c:2571
>   inet_recvmsg+0x131/0x580 net/ipv4/af_inet.c:879
>   sock_recvmsg_nosec net/socket.c:1044 [inline]
>   sock_recvmsg+0x12b/0x1e0 net/socket.c:1066
>   __sock_xmit+0x236/0x5c0 drivers/block/nbd.c:538
>   nbd_read_reply drivers/block/nbd.c:732 [inline]
>   recv_work+0x262/0x3100 drivers/block/nbd.c:863
>   process_one_work kernel/workqueue.c:2627 [inline]
>   process_scheduled_works+0x104e/0x1e70 kernel/workqueue.c:2700
>   worker_thread+0xf45/0x1490 kernel/workqueue.c:2781
>   kthread+0x3ed/0x540 kernel/kthread.c:388
>   ret_from_fork+0x66/0x80 arch/x86/kernel/process.c:147
>   ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:242
> 
> Local variable msg created at:
>   __sock_xmit+0x4c/0x5c0 drivers/block/nbd.c:513
>   nbd_read_reply drivers/block/nbd.c:732 [inline]
>   recv_work+0x262/0x3100 drivers/block/nbd.c:863
> 
> CPU: 1 PID: 7465 Comm: kworker/u5:1 Not tainted 6.7.0-rc7-syzkaller-00041-gf016f7547aee #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/17/2023
> Workqueue: nbd5-recv recv_work
> 
> Fixes: f94fd25cb0aa ("tcp: pass back data left in socket after receive")
> Reported-by: syzbot <syzkaller@googlegroups.com>
> Signed-off-by: Eric Dumazet <edumazet@google.com>

Reviewed-by: Simon Horman <horms@kernel.org>

...

