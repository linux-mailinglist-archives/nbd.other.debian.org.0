Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNZ2N2qHw2lRrQQAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Wed, 25 Mar 2026 07:57:46 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id AE67E3205B3
	for <lists+nbd@lfdr.de>; Wed, 25 Mar 2026 07:57:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8B70D20598; Wed, 25 Mar 2026 06:57:46 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 25 06:57:46 2026
Old-Return-Path: <3AIPDaQYKA2kRbUPfbNVVNSL.JVTUIKVaOLY.KLIPHU.VYN@flex--kuniyu.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,TO_TOO_MANY,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 90E5920599
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Mar 2026 06:39:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.701 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dU9c1wRAEz5A for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Mar 2026 06:39:03 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.25
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 97AE32059A
	for <nbd@other.debian.org>; Wed, 25 Mar 2026 06:39:00 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82a68acce26so1359196b3a.3
        for <nbd@other.debian.org>; Tue, 24 Mar 2026 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774420737; x=1775025537; darn=other.debian.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v5KS0AwVtElapM67R1okpaPmVE6Ykz6fWReVphg8duc=;
        b=CF21jZbgxpYtMeFEzRTQCq4f8h0ouibmZGz1t2vWdccfKPY+2hb95vBwuWv8e0K6dl
         qYG5V9RcDVI3b7yi3pZNJFVp27szlP/H2R3f/aTlrPyL1o2GhFW2lWsIwH3PzyzeWIn5
         nfN/tB1q0Tgg7Sp+ja7k/FAhtIIlVVlujukW+cixaz1nsDQsCPKgQBll28gJvq6oLE62
         w2aDS0YwkQJ52o71TSNvV8tjye152oavlQLjl+Ug96WFu82zVCJLnKgX6a7P9KgSTq68
         hm6H0XmbQ2oYkJkjYwI3l9ZfVyZzKX3NXBPXcNR+3+N4u941uu1vbhzvMGeV+mToN3L1
         RdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420737; x=1775025537;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5KS0AwVtElapM67R1okpaPmVE6Ykz6fWReVphg8duc=;
        b=RCOpNdhlBrMpbg2YzaKKAnF6CHyz5j2e6e39F5irFL2ICjcmzqK5ZP1bEApBCk7jQc
         Owc87aZfycIZrTkVyEQwQP0KilO1exEXwr45GOe66nj/6etOH9eAr9WAwah9pA6061L4
         8wZy6y+ky9UR297TDpyXjzJMxl5JG7OTSd9NaUTO8xOi8LxnplEkK4XzrTcVPxkHtMgN
         TGcJy5aq58j/GHer0SzBdkxET9Li8WljpsVioKOpUPODf+sx2MoynHqll0s1ws39HryB
         ks2zdi+6c7EkOCpUNylHYml4A94AEUTdELmurQJdsiSZ/ejyxWUzzNkVgYN7jBEpSkrT
         dMBg==
X-Forwarded-Encrypted: i=1; AJvYcCXvDqLCrkWzYhmjTsBYu6OtGzBnjdt7R3yHwN9TLdmRyJhiaJa1tFbxeAegvXWV4TZB5tU=@other.debian.org
X-Gm-Message-State: AOJu0YzfKeIu5AaR1GcG+QLEmp0PwF0c39AVgyc9lN/0bVGnhT4SxRrT
	urkGqixXvD2V/7OHAdMSnYDgqTJC6opqra6lTCQMgSHo0v+ww7c9hH6HV7Agdx5MwFuIfAulG2P
	FqcZtqw==
X-Received: from pfbmy7-n2.prod.google.com ([2002:a05:6a00:6d47:20b0:822:4e8c:2c9e])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1acf:b0:7f7:2f82:9904
 with SMTP id d2e1a72fcca58-82c6de992dcmr2345147b3a.5.1774420736872; Tue, 24
 Mar 2026 23:38:56 -0700 (PDT)
Date: Wed, 25 Mar 2026 06:38:24 +0000
In-Reply-To: <20260325063843.1790782-1-kuniyu@google.com>
Mime-Version: 1.0
References: <20260325063843.1790782-1-kuniyu@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260325063843.1790782-4-kuniyu@google.com>
Subject: [PATCH 3/5] net: Introduce lock_sock_try().
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
Resent-Message-ID: <DxcCFcKFSlG.A.Yu9M.qd4wpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3527
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260325063843.1790782-4-kuniyu@google.com
Resent-Date: Wed, 25 Mar 2026 06:57:46 +0000 (UTC)
X-Spamd-Result: default: False [0.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org,other.debian.org];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:kuniyu@google.com,m:kuni1840@gmail.com,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:netdev@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kuniyu@google.com,bounce-nbd=lists@other.debian.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	R_SPF_NA(0.00)[no SPF record];
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
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:helo,bendel.debian.org:rdns]
X-Rspamd-Queue-Id: AE67E3205B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

syzbot has reported 100+ possible deadlock splats involving NBD,
typically following this pattern:

  lock_sock(sk)
  -> GFP_KERNEL memory allocation
     -> fs reclaim
       -> lock_sock(sk) at NBD

Before calling sock_sendmsg() or sock_recvmsg(), NBD sets
sk->sk_allocation to GFP_NOIO to prevent fs reclaim from being
triggered during memory allocation for the backend socket.

However, even after a socket is passed to NBD, it remains
exposed to userspace and thus can exercise various slow paths
under lock_sock(), where GFP_KERNEL is used directly instead
of sk->sk_allocation, leading to the deadlock.

Some of those paths do not currently have a reference to struct
sock, and plumbing the sk pointer through the call chain just to
fix the allocation flags would be extremely cumbersome.

Even with that, lockdep would not be happy because such a path
could be exercised before passing the socket to NBD, and then
lockdep would learn that the path could trigger fs reclaim.

Additionally, since the socket is exposed to userspace, we
cannot change the lockdep key (even for sk->sk_lock.dep_map,
due to lock_sock_fast()).

We could spread memalloc_noio_{save,restore} over the networking
code, but we want to avoid that and solve it in the NBD layer,
which requires the trylock variant of lock_sock().

Let's introduce lock_sock_try() for that purpose.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 include/net/sock.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/net/sock.h b/include/net/sock.h
index 6c9a83016e95..69e4b8d17afb 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -1710,6 +1710,37 @@ static inline void lock_sock(struct sock *sk)
 }
 
 void __lock_sock(struct sock *sk);
+
+/**
+ * lock_sock_try - trylock version of lock_sock
+ * @sk: socket
+ *
+ * Use of this function is strongly discouraged.
+ *
+ * It is primarily intended for NBD, where the driver must avoid
+ * deadlock during fs reclaim caused by the backend socket remaining
+ * exposed to userspace even after being handed over to NBD,
+ * which _is_ bad but too late to change.
+ *
+ * Return: true if the lock was acquired, false otherwise.
+ */
+static inline bool lock_sock_try(struct sock *sk)
+{
+	if (!spin_trylock_bh(&sk->sk_lock.slock))
+		return false;
+
+	if (sk->sk_lock.owned) {
+		spin_unlock_bh(&sk->sk_lock.slock);
+		return false;
+	}
+
+	sk->sk_lock.owned = 1;
+	spin_unlock_bh(&sk->sk_lock.slock);
+
+	mutex_acquire(&sk->sk_lock.dep_map, 0, 1, _RET_IP_);
+	return true;
+}
+
 void __release_sock(struct sock *sk);
 void release_sock(struct sock *sk);
 
-- 
2.53.0.1018.g2bb0e51243-goog

