Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIOaEneHw2lRrQQAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Wed, 25 Mar 2026 07:57:59 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7143205BA
	for <lists+nbd@lfdr.de>; Wed, 25 Mar 2026 07:57:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EEAA9204DE; Wed, 25 Mar 2026 06:57:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 25 06:57:58 2026
Old-Return-Path: <3AoPDaQYKA2sTdWRhdPXXPUN.LXVWKMXcQNa.MNKRJW.XaP@flex--kuniyu.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	TO_TOO_MANY,USER_IN_DEF_DKIM_WL,WORD_WITHOUT_VOWELS autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B9D7E2059A
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Mar 2026 06:39:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.601 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1, USER_IN_DEF_DKIM_WL=-7.5,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id O-fXnX2uASGT for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Mar 2026 06:39:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.25
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D293920483
	for <nbd@other.debian.org>; Wed, 25 Mar 2026 06:39:02 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-829b8bb5211so16363980b3a.2
        for <nbd@other.debian.org>; Tue, 24 Mar 2026 23:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774420739; x=1775025539; darn=other.debian.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PEDu3iUfouJb04ptIbRT7+n4Z/VovB4BeMR+pdGzK3s=;
        b=mCbr270QkrQiOb5OvCysOA9UP0eolFSJgm+E387XWd1OjSouZGtBBR8bF6GTduVRBZ
         6I7vBSEh5OtoZ1RTOCeY7DDfE2HasAnYyukSALeO57sDKfyRghiNQLUTsgc+CcVkV+G0
         HxFM2pT3fCMZe3RVx9Bfpqpx1QknQFRafFsBLwXmkvcDrREg/QY7CDjh8VWUogNwtX8g
         RN7JYEArYYwwWLSyKO3j3sJOKTTmzZgdfkym9SBnK9u5YkWYMhiiXoXHAx7YjDaaNksd
         ImlnfOy2nm7lANg4cIIhj4v4YrwKK0hutr8OfPCpIbxs9XQbgDrAFA7RkcdZ7XaDgcJc
         kySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420739; x=1775025539;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEDu3iUfouJb04ptIbRT7+n4Z/VovB4BeMR+pdGzK3s=;
        b=jap4IyXbvuifW8u434FFwmBhXJlfKxPWigPnWJuu2JMAu4+rMph3L8YVByEoUDKv8w
         J4BOnuDQm6AcaUVsHfWbzPFqTAlp4LAHDzNYFZNut3kRLuZ16wyFoClj9vgveW+kRH6+
         ZuLxn9fKNcmI5pLktAOgYO1DnFV4ZY4eWi3zdyu7t3IFZW/SFlkoQLwG3ZqWhu62YbIa
         H0QTpXEaTuqAny4wF85SP808kqPx2xLwvfxVoFballWxkYdclCnJLJ69Z/ienxmcb5Ik
         Sr2OuBVEvklzRVS+CbGGgjEKNr6RBLc9QFsC21VXtgyIK5TorCaH578fvp8l5EjOGl5E
         ybag==
X-Forwarded-Encrypted: i=1; AJvYcCWSR9mMdnZf6CQWD6sgZnnu9hDGmtJzCWp4uKFlN+kM7DWqqKoGTPGendVvm7qMjK2rEXE=@other.debian.org
X-Gm-Message-State: AOJu0Yy3McX5JpYOuDW1Dn4v+EE+TbJXo3oATdVunrKKkD2InBhbVexy
	7i39dZYRJg9ZGTd+QgvE/HJ1PNkX0VvOdAFUk9rdEFma1G+iKgKX+e+0H+sdHaSk3UeU4zz6ebC
	+PO88FA==
X-Received: from pfbfa24.prod.google.com ([2002:a05:6a00:2d18:b0:829:813e:c970])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4215:b0:81f:3fa0:8c38
 with SMTP id d2e1a72fcca58-82c6ded2d60mr2408162b3a.20.1774420738537; Tue, 24
 Mar 2026 23:38:58 -0700 (PDT)
Date: Wed, 25 Mar 2026 06:38:25 +0000
In-Reply-To: <20260325063843.1790782-1-kuniyu@google.com>
Mime-Version: 1.0
References: <20260325063843.1790782-1-kuniyu@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260325063843.1790782-5-kuniyu@google.com>
Subject: [PATCH 4/5] inet: Add inet_shutdown_locked().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, linux-block@vger.kernel.org, nbd@other.debian.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <G5ScrcMLwlO.A.N39M.2d4wpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3528
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260325063843.1790782-5-kuniyu@google.com
Resent-Date: Wed, 25 Mar 2026 06:57:58 +0000 (UTC)
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.20)[generic];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_SPF_NA(0.00)[no SPF record];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:kuniyu@google.com,m:kuni1840@gmail.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:netdev@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kuniyu@google.com,bounce-nbd=lists@other.debian.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,other.debian.org];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[kuniyu@google.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:helo,bendel.debian.org:rdns]
X-Rspamd-Queue-Id: 1C7143205BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When NBD calls sendmsg() and shutdown() for TCP sockets,
it must use lock_sock_try() to avoid potential deadlock.

While TCP already exports tcp_sendmsg_locked(), there is
no locked variant for inet_shutdown().

Let's add inet_shutdown_locked().

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 include/net/inet_common.h |  1 +
 net/ipv4/af_inet.c        | 43 +++++++++++++++++++++++++++++----------
 2 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/include/net/inet_common.h b/include/net/inet_common.h
index 5dd2bf24449e..c085c39573c9 100644
--- a/include/net/inet_common.h
+++ b/include/net/inet_common.h
@@ -38,6 +38,7 @@ void inet_splice_eof(struct socket *sock);
 int inet_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 		 int flags);
 int inet_shutdown(struct socket *sock, int how);
+int inet_shutdown_locked(struct socket *sock, int how);
 int inet_listen(struct socket *sock, int backlog);
 int __inet_listen_sk(struct sock *sk, int backlog);
 void inet_sock_destruct(struct sock *sk);
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index c7731e300a44..6fa8fd11fe6d 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -902,21 +902,11 @@ int inet_recvmsg(struct socket *sock, struct msghdr *msg, size_t size,
 }
 EXPORT_SYMBOL(inet_recvmsg);
 
-int inet_shutdown(struct socket *sock, int how)
+static int __inet_shutdown(struct socket *sock, int how)
 {
 	struct sock *sk = sock->sk;
 	int err = 0;
 
-	/* This should really check to make sure
-	 * the socket is a TCP socket. (WHY AC...)
-	 */
-	how++; /* maps 0->1 has the advantage of making bit 1 rcvs and
-		       1->2 bit 2 snds.
-		       2->3 */
-	if ((how & ~SHUTDOWN_MASK) || !how)	/* MAXINT->0 */
-		return -EINVAL;
-
-	lock_sock(sk);
 	if (sock->state == SS_CONNECTING) {
 		if ((1 << sk->sk_state) &
 		    (TCPF_SYN_SENT | TCPF_SYN_RECV | TCPF_CLOSE))
@@ -953,11 +943,42 @@ int inet_shutdown(struct socket *sock, int how)
 
 	/* Wake up anyone sleeping in poll. */
 	sk->sk_state_change(sk);
+
+	return err;
+}
+
+int inet_shutdown(struct socket *sock, int how)
+{
+	struct sock *sk = sock->sk;
+	int err;
+
+	/* maps SHUT_RD (0) -> RCV_SHUTDOWN (1), etc */
+	how++;
+
+	if ((how & ~SHUTDOWN_MASK) || !how)
+		return -EINVAL;
+
+	lock_sock(sk);
+	err = __inet_shutdown(sock, how);
 	release_sock(sk);
+
 	return err;
 }
 EXPORT_SYMBOL(inet_shutdown);
 
+int inet_shutdown_locked(struct socket *sock, int how)
+{
+	sock_owned_by_me(sock->sk);
+
+	how++;
+
+	if ((how & ~SHUTDOWN_MASK) || !how)
+		return -EINVAL;
+
+	return __inet_shutdown(sock, how);
+}
+EXPORT_SYMBOL_GPL(inet_shutdown_locked);
+
 /*
  *	ioctl() calls you can issue on an INET socket. Most of these are
  *	device configuration and stuff and very rarely used. Some ioctls
-- 
2.53.0.1018.g2bb0e51243-goog

