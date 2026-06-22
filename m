Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NwNeNqK0OWohwgcAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 23 Jun 2026 00:18:10 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C366B2995
	for <lists+nbd@lfdr.de>; Tue, 23 Jun 2026 00:18:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.s=20251104 header.b=KDV97xw+;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=none
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 02AA020753; Mon, 22 Jun 2026 22:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 22 22:18:09 2026
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E0C9920583
	for <lists-other-nbd@bendel.debian.org>; Mon, 22 Jun 2026 22:01:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tnxGrkKBab-k for <lists-other-nbd@bendel.debian.org>;
	Mon, 22 Jun 2026 22:01:15 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-qv1-xf33.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 21020207FA
	for <nbd@other.debian.org>; Mon, 22 Jun 2026 22:01:14 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-8dd586317ccso44993416d6.2
        for <nbd@other.debian.org>; Mon, 22 Jun 2026 15:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1782165671; x=1782770471; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4Lw75p2n6l8hEXIv7+z9jfsW1LJfFPe/bV3l7WiUWc=;
        b=KDV97xw+WFbSEsAAwhxI72ZFFsrXfht7TSHnb0WiDmq3qMibzPNLprq8d4pxugHMdJ
         jAWAVbJ63VLmq/9i8j4x76AfsOc8ONkzR7evEM4EP2F9NcMwfTZ6OCO4orhnRNQ3eDrC
         Cr//0UNFTc+VgbryUU/DLpPiM/fsT06+iuyOCgt5JdUmhnpN6crTJl5e0MGacYBkRszJ
         flQob7iorU25jybY/G4W/h6vg50Cftuqb5gpF9eOJif9sVTuBwZY1D0pebIGMX3XkVTX
         +J/vcWQvcZyFI5RZsUUhZiZqwCulnk5idUgEK4hLwVX/SIBfQFu565YlQz6ZLGB+pdJC
         O6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782165671; x=1782770471;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U4Lw75p2n6l8hEXIv7+z9jfsW1LJfFPe/bV3l7WiUWc=;
        b=j30z9J2E5nFGoKL4yQHYSZLjctpQAtmg3brrY9uPpzc3I5dG7xwY8VKvxcvYNdqg0G
         m/1D9fW3FtHANgkdGovJsgj3+S/yUMiPUBE2lnOko1N5hyLf1vitWf4UaGSqRAcJiAzZ
         F4ed40IMouKKofliZKPht+C6GzU5a9mSBVxUPgg8CgBrmARkNzKHQM3pD7LXORvGbswp
         GXVoP4ZnigtM2cBOTMEege6lijgr/XH5eLiYzPzp0c57atLzfVEK3VjyKvC8ZgStafVh
         sCehtPx2Iw9OS3tBZZ5pD59EpSC1n0nidf1QAuRx0DBU8ppJBWL/TgpDRC+Fu+ZKpXFX
         V2Ig==
X-Forwarded-Encrypted: i=1; AHgh+RqGgMU+sOjaupgbQsygaZrY84VVst019C2KIyGzKbCwBnbL+jLUeii674y1AICK8c4fhJc=@other.debian.org
X-Gm-Message-State: AOJu0Yw9r5CkZ+MMfc+4e3gpDzWX9hUUalG6Q0IMZ8jQxtey8XJri6bB
	keJqRm/Vz1kwalb5sWWjKqFkst2Z4O/RnMm6dgNtl4D7UDvW8ninOVIFL+sbpyk5tSEWhxpkanc
	m0PZey6s=
X-Gm-Gg: AfdE7cndYPmSfYqoax0jZ4UEyFCi4viMkV0OdC6RHBrv/Bc+4E+aZloZXNu2e1EfBTR
	7LdpfjqszRQlWtER6SMZ/IbMUVv0SAK3xmXFx3JkY6aftrt1mUvHZ3fwcMdRYDzH99Oc5L79asZ
	AWqwPxFBvuSpUXxHxYnL//uHmNZp0RhM0FOIqjLlqmWJ6rw43q9X7yPHXLXUGYYMC2wZc4BVlXJ
	wF6Ecd1FzRHVz3o9A5bqIwv+WuIqhq0UgMLUfIQRtyy6nViYFieW+SMOqOYNMNoXyClSiB6ixlA
	oWCRgQIAjjjzpkRlWHao1/qzg8aZ7NRUXQtEyK75OzX3kkaDionCVKXeXEUPqrKGKNY9WEHE5Np
	73FTXN3khecZrCitSA5n5FY40oWZxWvAEWujDPtC0KmUvfsP5jjVYYmfkjKbkPBLUwIwyqTIHo5
	dkJhFnjNpmacv7nVZ1JVX2nRdtR+a5rsdVCSE=
X-Received: by 2002:a05:6214:27cf:b0:8df:250a:5fa8 with SMTP id 6a1803df08f44-8df250a62e3mr248073216d6.15.1782165648876;
        Mon, 22 Jun 2026 15:00:48 -0700 (PDT)
Received: from [127.0.0.1] ([99.196.128.58])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018898sm106932496d6.7.2026.06.22.15.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:00:48 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, edumazet@google.com, 
 Deepanshu Kartikey <kartikey406@gmail.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com
In-Reply-To: <20260621235255.66015-1-kartikey406@gmail.com>
References: <20260621235255.66015-1-kartikey406@gmail.com>
Subject: Re: [PATCH] nbd: don't warn when reclassifying a busy socket lock
Message-Id: <178216564143.110437.13652604139496842570.b4-ty@b4>
Date: Mon, 22 Jun 2026 16:00:41 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ixIjRIvmRZF.A.NNgK.hSbOqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3556
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/178216564143.110437.13652604139496842570.b4-ty@b4
Resent-Date: Mon, 22 Jun 2026 22:18:10 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel-dk.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:edumazet@google.com,m:kartikey406@gmail.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:linux-kernel@vger.kernel.org,m:syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[toxicpanda.com,google.com,gmail.com];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_SENDER(0.00)[axboe@kernel.dk,bounce-nbd=lists@other.debian.org];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[kernel.dk];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	DKIM_TRACE(0.00)[kernel-dk.20251104.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[nbd,6b85d1e39a5b8ed9a954];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel.dk:from_mime,kernel-dk.20251104.gappssmtp.com:dkim,other.debian.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69C366B2995


On Mon, 22 Jun 2026 05:22:55 +0530, Deepanshu Kartikey wrote:
> nbd_reclassify_socket() warns via WARN_ON_ONCE() if the socket lock is
> held at the point of reclassification. That assertion was copied from
> nvme-tcp, where the socket is created internally by the kernel
> (sock_create_kern()) and is never visible to user space, so the lock
> is guaranteed to be free.
> 
> NBD is different: the socket is looked up from a user-supplied fd in
> nbd_get_socket(), and user space retains that fd. A concurrent syscall
> on the same socket (or softirq processing taking bh_lock_sock() on a
> connected TCP socket) can legitimately hold the lock at the instant
> NBD reclassifies it. sock_allow_reclassification() then returns false
> and the WARN_ON_ONCE() fires, which turns into a crash under
> panic_on_warn. This is reachable by simply racing NBD_CMD_CONNECT
> against socket activity on the same fd, as reported by syzbot.
> 
> [...]

Applied, thanks!

[1/1] nbd: don't warn when reclassifying a busy socket lock
      commit: 9280e6edf65662b6aafc8b704ad065b54c08b519

Best regards,
-- 
Jens Axboe



