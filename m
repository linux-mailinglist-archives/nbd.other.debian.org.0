Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2F5B4FDC2
	for <lists+nbd@lfdr.de>; Tue,  9 Sep 2025 15:45:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6658120476; Tue,  9 Sep 2025 13:45:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  9 13:45:11 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7E5D3205A0
	for <lists-other-nbd@bendel.debian.org>; Tue,  9 Sep 2025 13:29:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uL1Bjls7ZCNr for <lists-other-nbd@bendel.debian.org>;
	Tue,  9 Sep 2025 13:29:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x131.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E4D522058C
	for <nbd@other.debian.org>; Tue,  9 Sep 2025 13:29:20 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-411498d92deso6623235ab.1
        for <nbd@other.debian.org>; Tue, 09 Sep 2025 06:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1757424557; x=1758029357; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrUpdS9XW8kCmiI/HdKgdDuMgaTmT22blEzvxDbI6UY=;
        b=pZyzt2yzd/1x8c0Qn0DGLnormxazklWljTnuZaD2IQP7pOkX7s5S5cqZD+10DRPLmM
         NSSOuStJzJP35aaobWe8OF2PsG3cc5UhDPm8bLVeCs74jp4f56GoLDzZb6UOjqTha5Ee
         11WpvNouXUc5nbwLx9FI5czcGVCUfL/HqBO4cLvCJhNX7tWMqjr4AGbtlza6Cj4HFPnQ
         5Gbf7zEd7b6d8BVAwOV7ItZ+WoWadzT7uDzfwzPZvGPCEfdHXVCDY32Shg1GdkcNBC6/
         xTjnGmFibog3S6trwigy0/TR6LYmI/Su+hMbcDEucGV8UYa3NKnXJd+FQd1pCLqY5OBz
         bn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424557; x=1758029357;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrUpdS9XW8kCmiI/HdKgdDuMgaTmT22blEzvxDbI6UY=;
        b=qN5J9tIMcgjNFWC9TPipYcDcPiquyVByw0en7jBNyrMSK/G/FShIOrJQRRcHmgUnwn
         itkCx5fot3HigUTaJhPor1kNPBiY3hzlgaHHNCSduasbYw4yd03zsXZljqAUwSyjUzK/
         2jFjEKMNdQNrk8nyeO4HKPGcjfR0ikUYf62DGy0YceVeezlKmp1AReIPPYSo55Mc2Hf5
         5rkelChcmdy7OQTzQtr8uJh6OzhssSJAnrnQf6JcPYYQQMONEyCZOxkpPXAX8YYUcsMZ
         mcyo9Vs4dZXGT6wzwZg2P9hzY/lCCQE76pD72PelDvLRRUXRmz0mA4Yo+RyBZ0T3hWs8
         jFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxTYkUuf8+sB8rbI6pfdEmEbvBauqpPziemlQzjTwf2VJmf+edq2hu4abXvirNiAdpRXE=@other.debian.org
X-Gm-Message-State: AOJu0Yx9NF1d+CsSipMWVG8Uo5scFLJeCySQRgMaJNJLccJiZliewRGl
	YcM2KgvDZt/rkWUSFxgnhW/kbHybFewE4PjR19PiEVSe4UvqCKhlXhIRTnm+NH1dCkc=
X-Gm-Gg: ASbGncvnIYNZBmKdEXD1GyrR14CcW0pQ7QEjC50RL7RnYdFMeiikNpkFrzqHySH9oUP
	CxohYo749+LR//kGGuOS28Ao7Mk3YTiZadivkzGhNubRK0NvQmwKFa4k0ydIb7Dq4shrWgjM0ky
	wXWD/2S3eS6RJP2hc/0UX1qLh+udy9d5Ysk2EJOtaFdhZ98AJ0n5dK5CJV2gJVXs79FIG9lCw84
	Dt+X/dWvFSHGYWPzFEv1pBnhTUND8NRj0yB/4Og5aQssFS1NE6ptq/u/Z0MfZpBBUfyywyyjci4
	bjBMMkcN8OZIxB6OaEwbmcs5fmivNcwwO389UXgFZBzLhmkMCYIBAfNjrmVywDfo4B4QYW5NEx+
	vm4STJBKl/DkLTR9dyLQbRgflTTCPQ0yeR2E=
X-Google-Smtp-Source: AGHT+IEIjWqcE1zYENpDxaX7YutdAIuak1sO9GmLbuURziKcQXpN8xbXlPbtAPoitLTAuWNCpHzs7g==
X-Received: by 2002:a05:6e02:3784:b0:3f3:bbda:d037 with SMTP id e9e14a558f8ab-3fd965c4d04mr182350825ab.26.1757424557099;
        Tue, 09 Sep 2025 06:29:17 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50d8f31f6e4sm9895116173.47.2025.09.09.06.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 06:29:16 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Josef Bacik <josef@toxicpanda.com>, Eric Dumazet <edumazet@google.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
 Eric Dumazet <eric.dumazet@gmail.com>, 
 syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com, 
 Mike Christie <mchristi@redhat.com>, 
 "Richard W.M. Jones" <rjones@redhat.com>, Yu Kuai <yukuai1@huaweicloud.com>, 
 linux-block@vger.kernel.org, nbd@other.debian.org
In-Reply-To: <20250909132243.1327024-1-edumazet@google.com>
References: <20250909132243.1327024-1-edumazet@google.com>
Subject: Re: [PATCH] nbd: restrict sockets to TCP and UDP
Message-Id: <175742455632.75115.15346620038817180242.b4-ty@kernel.dk>
Date: Tue, 09 Sep 2025 07:29:16 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-2ce6c
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <os3FYuE2zOC.A.CMrC.n9CwoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3433
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/175742455632.75115.15346620038817180242.b4-ty@kernel.dk
Resent-Date: Tue,  9 Sep 2025 13:45:11 +0000 (UTC)


On Tue, 09 Sep 2025 13:22:43 +0000, Eric Dumazet wrote:
> Recently, syzbot started to abuse NBD with all kinds of sockets.
> 
> Commit cf1b2326b734 ("nbd: verify socket is supported during setup")
> made sure the socket supported a shutdown() method.
> 
> Explicitely accept TCP and UNIX stream sockets.
> 
> [...]

Applied, thanks!

[1/1] nbd: restrict sockets to TCP and UDP
      commit: 9f7c02e031570e8291a63162c6c046dc15ff85b0

Best regards,
-- 
Jens Axboe



