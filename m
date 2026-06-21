Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NI+SASl9OGomcwcAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 22 Jun 2026 02:09:13 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 811B66ABD73
	for <lists+nbd@lfdr.de>; Mon, 22 Jun 2026 02:09:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="iW/NTni2";
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=none) header.from=gmail.com
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 066AA2089F; Mon, 22 Jun 2026 00:09:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 22 00:09:11 2026
Old-Return-Path: <kartikey406@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2FF9320B38
	for <lists-other-nbd@bendel.debian.org>; Sun, 21 Jun 2026 23:53:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.949 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HF41FgGIHssb for <lists-other-nbd@bendel.debian.org>;
	Sun, 21 Jun 2026 23:53:09 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pf1-x42b.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7F32320B31
	for <nbd@other.debian.org>; Sun, 21 Jun 2026 23:53:06 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8453bcf7276so2018976b3a.2
        for <nbd@other.debian.org>; Sun, 21 Jun 2026 16:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782085983; x=1782690783; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUwkknzM3W8jOMgWbU+Q98oClrKuC6/1N4Q1+LqXc2M=;
        b=iW/NTni2mGzRuuJNUrd783UmkZnHYiZjclvlIZOWHjQ6w+YgMFSX0d1zi4nCa46Qxl
         9tExJXY6agWjVE4qHB4Iz0e0qnUHOkFWEGU/Jdc0aSUO5ihOnOBLGezPk1k0Sk/5o0sr
         XTZE9+MlddHqw3aU8UfDKX2/WyK2TOvUKGaGNxUyET+W197vhK7zZqP/Axg2kteJiN26
         FvlH2G83YW0WLQh9yQ6fx6pLcEZKbHEUS0AkPurFdymGZoo0k03beWq4xps6vW5HsqNL
         kEnCblOt1XkU9rLXFG5s46Ff7cGdWVApVZgjo/lgiSK/M6GPhXwwXrlqlo07iV/PGYuM
         rfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782085983; x=1782690783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUwkknzM3W8jOMgWbU+Q98oClrKuC6/1N4Q1+LqXc2M=;
        b=RwM8lqrHf+Z2IijLh7a0BSZoNf9T9FjRQNyuSls4OoWPwXOlkrB9J18nr0YgX6l0Ti
         9VmKhu0Wml/6C8eIp8k3jPHSKoGkjXBTv7jnQRTQkolmYqPm2QAjYf43RXJ051fQLkEB
         Cd3BSgKTWuSWWydUKr/82b9RJvlrQajvf+qFBzKi+MLgU3QWMolgBoKdcg83Px+ssdmH
         Ml8oR5g/0+b2N2f6mYcnLDlu/n4Rz8bq06rycFr0bTvzlk/PwMy9jEOKC/fcu5zDEom1
         421w2NgDqAoEBfQesx38bpXZ0IPc005YgI+kJ0kcd9UvQ6klOOS3TZEStSykIyXuDmst
         IZgw==
X-Forwarded-Encrypted: i=1; AFNElJ/cbHZU04eDx8cgQlgW6cddp0wDC2DiQD3soWcfP1oXIbmzTU0o87Mx7Y0e65Pf2IUn9h0=@other.debian.org
X-Gm-Message-State: AOJu0YyCdfcmdhuq+Izzo+gUsCalbN72ZVdfRrfo/1cFMGWOYttuFtSn
	qhtbuHA1A9sGWsVTcpVYfCTMVkLCddIKEAGZiJnIqQplmLwuQ6F2XfJn
X-Gm-Gg: AfdE7ckBwYy09McEHrKyKO0aIL5z3o6EKr+DoLr57nG7bqtjHqtHDXIWwSkmcO9le+v
	GQAvgN6E48xJHx1gMiJuw/hdylpStp/0Y+tQ71HpL3PxO/0gkGGAR72pP2Bg8LGHPJRJQbaStcR
	ZswX6Deih2HKMZ2U+hbQgY5PK1et+BbJ6yWoCWMSUcCD8/aZSzUiVk2GM6vg4V6T8vjfnAjGXue
	oO1n1KS3H0qSCGpLMl0qPtEKy6CS1z3oaNX9VEbiCBGYV2rvz8oddnTsK17ohCeGrLG4QvGfiF9
	1I0WFsmlgO3uRDvY4zIsK2bGFR+4ouX9b7CxY6TlQAJL0pptFQn5o6b2mq0eqdmalyV0eGLtO//
	2Qcn5xQhk20e+mTrff0NTJM5wlAPmpyVXbBQftp5utVdIHLYh2aXlvQG3WgXsQ8ZvGaqBWPfOaw
	104l7duMP2LJntlyX7WO8EjssRKw8VopAHWX5AP6j42lRWOLUFh+3pT+egWMFgwglLxKk=
X-Received: by 2002:a05:6a00:2d8b:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845508bb8camr13490364b3a.34.1782085982563;
        Sun, 21 Jun 2026 16:53:02 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:a10c:b74:f527:1266])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ec335csm5449327b3a.49.2026.06.21.16.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 16:53:01 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	edumazet@google.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com
Subject: [PATCH] nbd: don't warn when reclassifying a busy socket lock
Date: Mon, 22 Jun 2026 05:22:55 +0530
Message-ID: <20260621235255.66015-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <v_amyLnPeHE.A.XYSD.n0HOqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3552
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260621235255.66015-1-kartikey406@gmail.com
Resent-Date: Mon, 22 Jun 2026 00:09:12 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,other.debian.org,gmail.com,syzkaller.appspotmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:edumazet@google.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:linux-kernel@vger.kernel.org,m:kartikey406@gmail.com,m:syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kartikey406@gmail.com,bounce-nbd=lists@other.debian.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,appspotmail.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[nbd,6b85d1e39a5b8ed9a954];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 811B66ABD73


nbd_reclassify_socket() warns via WARN_ON_ONCE() if the socket lock is
held at the point of reclassification. That assertion was copied from
nvme-tcp, where the socket is created internally by the kernel
(sock_create_kern()) and is never visible to user space, so the lock
is guaranteed to be free.

NBD is different: the socket is looked up from a user-supplied fd in
nbd_get_socket(), and user space retains that fd. A concurrent syscall
on the same socket (or softirq processing taking bh_lock_sock() on a
connected TCP socket) can legitimately hold the lock at the instant
NBD reclassifies it. sock_allow_reclassification() then returns false
and the WARN_ON_ONCE() fires, which turns into a crash under
panic_on_warn. This is reachable by simply racing NBD_CMD_CONNECT
against socket activity on the same fd, as reported by syzbot.

Hitting a held lock here is expected for an externally owned socket and
is not a kernel bug, so skip reclassification silently instead of
warning. Reclassification is a lockdep-only annotation, so skipping it
in the rare racing case is harmless.

Reported-by: syzbot+6b85d1e39a5b8ed9a954@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6b85d1e39a5b8ed9a954
Fixes: d532cddb6c60 ("nbd: Reclassify sockets to avoid lockdep circular dependency")
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 3a585a0c882a..8f10762e90ef 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1246,7 +1246,7 @@ static void nbd_reclassify_socket(struct socket *sock)
 {
 	struct sock *sk = sock->sk;
 
-	if (WARN_ON_ONCE(!sock_allow_reclassification(sk)))
+	if (!sock_allow_reclassification(sk))
 		return;
 
 	switch (sk->sk_family) {
-- 
2.43.0

