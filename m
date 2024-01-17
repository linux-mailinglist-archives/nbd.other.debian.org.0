Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5965D830A50
	for <lists+nbd@lfdr.de>; Wed, 17 Jan 2024 17:03:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3C6022071F; Wed, 17 Jan 2024 16:03:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan 17 16:03:30 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 89FBC2082A
	for <lists-other-nbd@bendel.debian.org>; Wed, 17 Jan 2024 15:48:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RVUsF81JML2y for <lists-other-nbd@bendel.debian.org>;
	Wed, 17 Jan 2024 15:48:06 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CEF9420833
	for <nbd@other.debian.org>; Wed, 17 Jan 2024 15:48:06 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-7bed82030faso60661539f.1
        for <nbd@other.debian.org>; Wed, 17 Jan 2024 07:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1705506482; x=1706111282; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBwQPpl+zXik806WtECeSYlAHrweUHc1hm7lYkwTJFs=;
        b=ihDlJbZAVntAxWx6+JBknWko5KesBKSPtyqnRGpr2q6ADpwSLQTSSOonlUxZR9KJa8
         D8PR8Nmh4fp7sVV14PyPHoBKHTlrGYe1BWA2FgpqXLxaO9Sb1U9FLEu9//R3Ql2gxuNM
         jkF2RccOX56VQCwp2Jntuv9WC52ygpFCtV5zeYaY5LH6fZpW4To0scoS+xJr7bxYfxLJ
         cRSTA/9sXeOIlRuEcBZumI2R0jXossyWlxw5AJTcZ01QtMa7DoVoAik/kZ6OeuUUWAeu
         vtG9oQ/G09arjgR2gNZYoEVNkK75LmLx5qSv5G3/DFZ+Mf4TktY+RXgjtPbx6RiIdiKW
         dS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705506482; x=1706111282;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBwQPpl+zXik806WtECeSYlAHrweUHc1hm7lYkwTJFs=;
        b=MgnrU0SiDjePihQ59ri2/9VR4g9m9uVahknylwYxjL69sNXutLfnGrI9GP9Rjpe0Ew
         /8863NCfkSYUtXHZ4knjXNLgAWVuRKQ6EUZJFY2g+Jg8HQaTfcacfsUxDFY6Hg+X3UCp
         vy/N06e6IjV4NeAkkTdQQQgTyKryjDnBh9Iu4hlH1PU9wqTX29Zdt6YkcC50WrnTOBGV
         ArAT+2O3jVfgY+yXG8lTygPk4JDXIVpHrN8ifvTP6ykRlTTpBOl5nq0sUUL3XpvFdzWE
         M8amkENPuuhW/TEoffiRktKDiWfM/LNU0d8631jGq/6zncFgm0N5nskhIVZpXckCTfoH
         YC0Q==
X-Gm-Message-State: AOJu0YxOTYqN5finbHwQ6+46XvvvvD8fbHewTEbLw5z08VfqLdjdGp4O
	ngHGNOX12f0i55UsD/RMnShUj6zCD4TD14H7tNOiBeov57QJ4g==
X-Google-Smtp-Source: AGHT+IFZZGSI3LvvEy+XRSDgw/MUW2O98Sa/T0cEKhvZ1zzsrKqvOW8y4/IMwgbP32kgoihbqtn42w==
X-Received: by 2002:a6b:5803:0:b0:7bf:4758:2a12 with SMTP id m3-20020a6b5803000000b007bf47582a12mr8519442iob.0.1705506482496;
        Wed, 17 Jan 2024 07:48:02 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id c34-20020a029625000000b0046e4c2f9f5csm482353jai.28.2024.01.17.07.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:48:01 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Eric Dumazet <edumazet@google.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
 Eric Dumazet <eric.dumazet@gmail.com>, syzbot <syzkaller@googlegroups.com>, 
 stable@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
 linux-block@vger.kernel.org, nbd@other.debian.org
In-Reply-To: <20240112132657.647112-1-edumazet@google.com>
References: <20240112132657.647112-1-edumazet@google.com>
Subject: Re: [PATCH net] nbd: always initialize struct msghdr completely
Message-Id: <170550648165.620853.7074880501945877841.b4-ty@kernel.dk>
Date: Wed, 17 Jan 2024 08:48:01 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <QLhs_wEet0O.A.uUC.Sp_plB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2712
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/170550648165.620853.7074880501945877841.b4-ty@kernel.dk
Resent-Date: Wed, 17 Jan 2024 16:03:30 +0000 (UTC)


On Fri, 12 Jan 2024 13:26:57 +0000, Eric Dumazet wrote:
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
> [...]

Applied, thanks!

[1/1] nbd: always initialize struct msghdr completely
      commit: 78fbb92af27d0982634116c7a31065f24d092826

Best regards,
-- 
Jens Axboe



