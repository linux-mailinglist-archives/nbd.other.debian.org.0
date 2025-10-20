Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD0DBF28C8
	for <lists+nbd@lfdr.de>; Mon, 20 Oct 2025 18:54:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A6330205CB; Mon, 20 Oct 2025 16:54:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 20 16:54:10 2025
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 56C56205B5
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 Oct 2025 16:38:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tl_JOq7BPRzU for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 Oct 2025 16:38:44 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd2d.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B55DE205B3
	for <nbd@other.debian.org>; Mon, 20 Oct 2025 16:38:41 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-93e89a59d68so87903039f.0
        for <nbd@other.debian.org>; Mon, 20 Oct 2025 09:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1760978316; x=1761583116; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61GIboXxOs25s0evX1OKzmkcFyOeZT63Qc8gi5u7/jM=;
        b=NtCP+k2chP6u3l5TGCfVrZxm2TluXdZDRZZpF1NuAdRG2KjYiwuJ+OYOZyeyClohfg
         kpfZvBb2N+lfWPrJ519Xf9hGtQoRrasceZwpLC0KTA05Y7W1DFICb3RoV4OL6cUAPWUd
         ptXb95c//05sOX89o0TlH8INy8uweuhvDyLFMtvWw6I0asF3piiMclLxyup7hILzCXtE
         MCBRZqQ8afTKBuTgF4yysyr6nrZZ0wk048mx9u33q/63z77Qn5YlpOBSm8tKehkULMlM
         LvuxLjY7d/S+wVVrh7qBYcofeaU7Ot+UjU+Z4ns/HmCk3i2mtC1dE0pIlArZ8zGmqpSO
         HLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760978316; x=1761583116;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61GIboXxOs25s0evX1OKzmkcFyOeZT63Qc8gi5u7/jM=;
        b=PLWcjkkdRF0sdbsPAvCGp0hK2wjI5UkLHJgOsnGxGY942292NNariyD33WQKK9OBPz
         RxFzOrCwjj0wdEp7QCeWVvTinCyTg+KflFy+yP/QPvEUfhmvTZ26JFApaDwMoTSypMMC
         i4lq4HvbAOWELlJzAK5MPQsqcfGtx0qLR/xCU8fbXOynD3M9iXAIEvc6BB5ARvjxMLr0
         4+B0SbCfi4YilMdj32vyaR+mxHBNX7QdMvvT8sq5CENzlMBwFEFgWaD4cCUUtpjEpdAl
         vVvBXOYhw5qJ9cgpRkSVfzpWvQH5GR1hAuYRB2zD8x+IfWyNyYU47cNlzO1+mvBUVD8U
         uxIA==
X-Forwarded-Encrypted: i=1; AJvYcCVypJvqJL7W/IMzwqq2XDIB2NWpPtMWVZJ41DOuOWXEirxZgMYjC9NZ6c5kiKpOFa25W9E=@other.debian.org
X-Gm-Message-State: AOJu0YyQiX7wQdS4kGAq6TEIJdyWTdpCYLysWSrmbT7ZSjOWgmWRlBVg
	yamyTWb1FnugFHrl1SrBIaKkW7Fmbjsw79z0NvJNdgSYaKD7lrgeEht1hYLPoaDPFIDyAZtceUH
	dXgmQV4c=
X-Gm-Gg: ASbGncsrN6qXXvCMHu+D41DPEnUtw3cJBAFfQiPLDiKfh0f7+kFcB/vgxQlYhsuJcmj
	sRMNySRjaSyGF48mE3hFTpFh1MY0CCvEaRx/LfY3GbbbDiXebuXdDWdsuCRTgNaCahD9aOX2zrb
	kGez2hlcr0b+4lytX6uh3jrod7q6EaO+WLXaE903rujk/UG8xsbnlSW03fu6nKG/4pm8F03sLkB
	uQZYHDsE9KlIV5wL110EPxdKBXVY7+V8w+s1eAS5vacUoz3iL+L3io+MFo3LKUrTiJini94lPX5
	q4Pb3Wp8jTA+Uqxo2egtxXdxF+VJJ/SD70c9iO/c6oCBcJ6G/OFMiotVz1bawdV1P2i4QOvPav0
	KvV7dtUKf+zUSEW/Kt+rObFHNUm0qGVdcLQsfc5vFabJKhbu1SNWIejrLyZz7FjdakqMLU8axyK
	5Igg==
X-Google-Smtp-Source: AGHT+IEgP9MoSmwcT4IXjkDNqCrTHBFr78jjo89iNv/AbCf70/y5g8JWKMQdHYEnP0MCwavgamCqEQ==
X-Received: by 2002:a05:6e02:1689:b0:42d:876e:61bd with SMTP id e9e14a558f8ab-430c527fb41mr203189835ab.28.1760978316183;
        Mon, 20 Oct 2025 09:38:36 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a97909edsm3088855173.57.2025.10.20.09.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:38:34 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Josef Bacik <josef@toxicpanda.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
 Ming Lei <ming.lei@redhat.com>
In-Reply-To: <20251010080900.1680512-1-omosnace@redhat.com>
References: <20251010080900.1680512-1-omosnace@redhat.com>
Subject: Re: [PATCH v2] nbd: override creds to kernel when calling
 sock_{send,recv}msg()
Message-Id: <176097831454.27956.10406749282595384592.b4-ty@kernel.dk>
Date: Mon, 20 Oct 2025 10:38:34 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <H3ZUZK0jR8F.A.p7RF.ykm9oB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3462
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/176097831454.27956.10406749282595384592.b4-ty@kernel.dk
Resent-Date: Mon, 20 Oct 2025 16:54:10 +0000 (UTC)


On Fri, 10 Oct 2025 10:09:00 +0200, Ondrej Mosnacek wrote:
> sock_{send,recv}msg() internally calls security_socket_{send,recv}msg(),
> which does security checks (e.g. SELinux) for socket access against the
> current task. However, _sock_xmit() in drivers/block/nbd.c may be called
> indirectly from a userspace syscall, where the NBD socket access would
> be incorrectly checked against the calling userspace task (which simply
> tries to read/write a file that happens to reside on an NBD device).
> 
> [...]

Applied, thanks!

[1/1] nbd: override creds to kernel when calling sock_{send,recv}msg()
      commit: 81ccca31214e11ea2b537fd35d4f66d7cf46268e

Best regards,
-- 
Jens Axboe



