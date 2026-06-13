Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g4hNCj9SLWqwewQAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Sat, 13 Jun 2026 14:51:11 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8FB67E9B0
	for <lists+nbd@lfdr.de>; Sat, 13 Jun 2026 14:51:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.s=20251104 header.b=sWMqmtoF;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=none
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 611F020905; Sat, 13 Jun 2026 12:51:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jun 13 12:51:10 2026
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 77FE220890
	for <lists-other-nbd@bendel.debian.org>; Sat, 13 Jun 2026 12:35:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eJ0-Rj_CbLU4 for <lists-other-nbd@bendel.debian.org>;
	Sat, 13 Jun 2026 12:34:54 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-ot1-x331.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B72C0208B6
	for <nbd@other.debian.org>; Sat, 13 Jun 2026 12:34:54 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7e6cfdc8382so1465899a34.2
        for <nbd@other.debian.org>; Sat, 13 Jun 2026 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1781354091; x=1781958891; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7swAtj3G/hGrSza2n1NGxMHxco6j6Vf20RGZiSvZ58c=;
        b=sWMqmtoFPqGfR6cA1sg0my740q2qT0fryPkFYKTdTt2ZAu/P9Hpp0ojG/1df0LQBW+
         4ktCsmtOD5WkTlPiQAsDxPeVxs7Xh/ZaY/MLQTAVVOhl54U+idfyRDNJ2pGntWmCcZDV
         4ZEQNY2jjbaKG7B06JDnOEDaYdctIj3XZvj20Gz64pKsFdazVCP/K+e7QxXn3t3IEKpU
         QlVlMcxn9WRXAl4vMyQ+1xdKpS8LkPBHPKLin5Ll4Cn6hdEW1s4DOECO3YTUlJuh+27s
         xCJ9cIYKjY8Su530de1xAskFga8K4fn6r+vYbB5G6eZmg0/dWrzq8zbp6Y6pU/3jNxPy
         Uf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781354091; x=1781958891;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7swAtj3G/hGrSza2n1NGxMHxco6j6Vf20RGZiSvZ58c=;
        b=V8AqQ+IKZfcqxr5w52zARvdsapDXfGAf2JK5+9m7+dfs7HuRApG5nYUb+ESaUg7H35
         P/THlTvlJiQOcyFNhKEI4G8ru7IukzvsiKlSJI1vyMFF6u4uOMc9hTveLPIT5RiY/Fuw
         w8Ki+f3aeUY7Rx5ld6NTUNzKfDowY981sST5NLfExWn1gUGDMpBU0b3HN8XO5EgOwWWX
         eILQ9cWglTk9seLvMyWismCS5scaDwI0w6celgBNU+h9Gt29546+biVpvjkDdILNHfR7
         LsLltdiDRjwpG9CNfwRaRWA5TkjpN7LP9NgOt/ua6tq1vZfRIB4fnNn94BRCCl0Wwr00
         SGJA==
X-Forwarded-Encrypted: i=1; AFNElJ/tULi0kMTVwilyvY11hQtPFgdp2GB3bjpNPrWrRT0/Uhb7Xxuv8jh7EBWzJqbr85bIk3k=@other.debian.org
X-Gm-Message-State: AOJu0YxYWE8Q9VukH0gVXIpF7EUFG3r03x+qeVvva24wHxGRTL87zFGf
	77CwyKAvZzv0hIWqlI1p4XEPkaj5ZCOj8SwmLBrINdtFhpysJW066qwCpGmZrmre962p4nGuWOE
	3bHP2mv0=
X-Gm-Gg: Acq92OGDVwL+V7Q1ch3oSwLtImk5FRPV2OiDLqhUGk7myc0iaN71joUpvenNF06A/A2
	t6NEHnbpZn8yZERHP/hYrDKHNg4VKnjfw+TL8YVS+YtKQlrN1EI65gJwCcl17vJZkECVlPSUxDr
	N6v8ckXsefkGKVWBSYQclYkfmKbXiRhxHOsy4CuQevcrW7ab4KdOMH00S7E48u0RsduXAErGWsg
	4Dadz4phaOXBr5R+RthUXwo7tcyZ30iomsvRT1yjWA2jyJeFD1F56nwzcj97tL4/DnTRz1K/r8p
	c1TT6m5h/grASVOFwjxzVUqwI7j7tktfkHQYNNMl7bR/7UZxSwKtX+GYLdkY3Y9pp6yN1Bope5f
	KYd7f0xpuKMllZkw0LLFsV9xIMrDeH6dV6gXeXOnP3NQFYtiVaXXLfRW4pjBnCZqCxyROaaeur6
	k6NNxi2b4M9TBF7DXKrpgNBNoy9jOvathtZLvxcjLewjRY0o0oVYxO1drujdokCHp1KpHDj3h9P
	1de
X-Received: by 2002:a05:6830:6810:b0:7db:b7ae:ef0b with SMTP id 46e09a7af769-7e7848a9e26mr5033267a34.24.1781354090874;
        Sat, 13 Jun 2026 05:34:50 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e781740de4sm3960977a34.23.2026.06.13.05.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 05:34:49 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Josef Bacik <josef@toxicpanda.com>, Eric Dumazet <edumazet@google.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-block@vger.kernel.org, nbd@other.debian.org, 
 Eric Dumazet <eric.dumazet@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
 netdev@vger.kernel.org, 
 syzbot+607cdcf978b3e79da878@syzkaller.appspotmail.com
In-Reply-To: <20260613042619.1108126-1-edumazet@google.com>
References: <20260613042619.1108126-1-edumazet@google.com>
Subject: Re: [PATCH] nbd: Reclassify sockets to avoid lockdep circular
 dependency
Message-Id: <178135408918.1902132.15354673921815927532.b4-ty@b4>
Date: Sat, 13 Jun 2026 06:34:49 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Kgrc54nEBHK.A.g-XC.-IVLqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3550
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/178135408918.1902132.15354673921815927532.b4-ty@b4
Resent-Date: Sat, 13 Jun 2026 12:51:10 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel-dk.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:edumazet@google.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:eric.dumazet@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:kuniyu@google.com,m:netdev@vger.kernel.org,m:syzbot+607cdcf978b3e79da878@syzkaller.appspotmail.com,m:ericdumazet@gmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[kernel.dk];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FORGED_SENDER(0.00)[axboe@kernel.dk,bounce-nbd=lists@other.debian.org];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[kernel-dk.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,bounce-nbd=lists@other.debian.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,other.debian.org,gmail.com,kernel.org,redhat.com,google.com,syzkaller.appspotmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[nbd,607cdcf978b3e79da878];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel-dk.20251104.gappssmtp.com:dkim,kernel.dk:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD8FB67E9B0


On Sat, 13 Jun 2026 04:26:19 +0000, Eric Dumazet wrote:
> syzbot reported a possible circular locking dependency in udp_sendmsg()
> where fs_reclaim can be triggered while holding sk_lock, and fs_reclaim
> can eventually depend on another sk_lock (e.g., if NBD is used for swap
> or writeback and NBD uses TLS/TCP which acquires sk_lock).
> 
> Since the UDP socket and the NBD TCP/TLS socket are different, this is a
> false positive. Fix this by reclassifying NBD sockets to a separate lock
> class when they are added to the NBD device.
> 
> [...]

Applied, thanks!

[1/1] nbd: Reclassify sockets to avoid lockdep circular dependency
      commit: d532cddb6c6049ced414d64d83c6ce7149a6421a

Best regards,
-- 
Jens Axboe



