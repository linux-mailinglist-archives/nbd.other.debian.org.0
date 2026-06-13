Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PbZsAaTfLGr7XAQAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Sat, 13 Jun 2026 06:42:12 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C8367DAF3
	for <lists+nbd@lfdr.de>; Sat, 13 Jun 2026 06:42:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=MDzGjG9X;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=reject) header.from=google.com
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 02FE3209AE; Sat, 13 Jun 2026 04:42:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jun 13 04:42:10 2026
Old-Return-Path: <37NssaggKA68TSjbPoTiVddVaT.RdbcQSdiWTg.STQXPc.dgV@flex--edumazet.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1FF23209AE
	for <lists-other-nbd@bendel.debian.org>; Sat, 13 Jun 2026 04:26:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.701 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id D-qdedLnSYD6 for <lists-other-nbd@bendel.debian.org>;
	Sat, 13 Jun 2026 04:26:34 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 IX_MANITU=ERR(0) CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-qt1-x849.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A4C41209AD
	for <nbd@other.debian.org>; Sat, 13 Jun 2026 04:26:24 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id d75a77b69052e-5195760750bso3407201cf.0
        for <nbd@other.debian.org>; Fri, 12 Jun 2026 21:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781324781; x=1781929581; darn=other.debian.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6l2xGU+3qIFZEhz6OluRSAKcM6KzJn808ttYDsC9+QQ=;
        b=MDzGjG9XrXkBF1R++/yOGRFjyN7yeEZ55njNjxlDWWRZb/CqQrbxou2RNeayhSIQdU
         qpzwA49puevneW0UqTRmkrgFMHc/NUOiZWsyAptyvjY0asgrcyCf+aJFZ6TJ4p0Iu9me
         Zu6lhKXbqn4tlJQOWNEWCB8HA5Ll6+Wxh5DJS73AQRlcGzdrVQfHr4IoIP4KHxJRRKqv
         l1Dw1IWBsPD0tjxLohRa7cvfwdcpsIxAC7YkRJiIHTLnK/O7yxsmLPMloBSKVH4ecgtQ
         4mU8AMEmekNKbSuU8/L788dbi0e6Lx+xxZ9hAoYtKZfYmYJwrwuas4kXTb2lCyCEZnwp
         iPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781324781; x=1781929581;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6l2xGU+3qIFZEhz6OluRSAKcM6KzJn808ttYDsC9+QQ=;
        b=Vjv4lng6lVMOfmg60ZhgvFnTOYi6FEBF0DJL40aSjLXzcD8ruMh24x5QfNBBGHysub
         XncqOKLnHAENTtf8YpawNcqfTZuGlCJlUUvq11iZHWwp/mZLGsUYYLTK9sQswRZLrrnC
         8eGrLfzxxXY/DBdTNYs0az0jdgM5cMkffaqbJwztnIuwTH2llWkuUeoUwKp1+9v8ns4w
         Zi1XCcV2IQzca7WJIfYQUpzWurY9E8EZ5vHPD1CBIrixO91jJC4OFsE5wDsF72ihPeAT
         cdt41PUtFUV6Q3dYEAxaiibgSF08L/BDwkcIm9VeN2ONltyd+jLCfaT/uLpfh9/W3cJT
         OqYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YVb6i1nspfe3jMItJ/Xei9e+SZOOgSloSQ0h2ksDO77EH+5alad+mevvtp6zn6RmWm70=@other.debian.org
X-Gm-Message-State: AOJu0YzMh5LTVh1iMmbIrKXt76+/+GzbxUg7rb8CJNzd3YvpNifVbiQw
	myqMF6E9MwsGan/tWJE/lNZUu4RsvbohuFRSwNCEdAkfhdk9dyb+3RHv4IFg0ueJy9sVmey/4FR
	/m4MegOtY/Z56eA==
X-Received: from qtc12.prod.google.com ([2002:a05:622a:8e0c:b0:517:29b8:33b3])
 (user=edumazet job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:5e08:0:b0:517:6a26:43b with SMTP id d75a77b69052e-51953553d89mr38847661cf.44.1781324780985;
 Fri, 12 Jun 2026 21:26:20 -0700 (PDT)
Date: Sat, 13 Jun 2026 04:26:19 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260613042619.1108126-1-edumazet@google.com>
Subject: [PATCH] nbd: Reclassify sockets to avoid lockdep circular dependency
From: Eric Dumazet <edumazet@google.com>
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, Eric Dumazet <eric.dumazet@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
	Eric Dumazet <edumazet@google.com>, syzbot+607cdcf978b3e79da878@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GAS7CitingD.A.YNmI.i-NLqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3548
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260613042619.1108126-1-edumazet@google.com
Resent-Date: Sat, 13 Jun 2026 04:42:11 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FORGED_SENDER(0.00)[edumazet@google.com,bounce-nbd=lists@other.debian.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,other.debian.org,gmail.com,kernel.org,redhat.com,google.com,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:eric.dumazet@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:kuniyu@google.com,m:netdev@vger.kernel.org,m:edumazet@google.com,m:syzbot+607cdcf978b3e79da878@syzkaller.appspotmail.com,m:ericdumazet@gmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[edumazet@google.com,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[nbd,607cdcf978b3e79da878];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0C8367DAF3

syzbot reported a possible circular locking dependency in udp_sendmsg()
where fs_reclaim can be triggered while holding sk_lock, and fs_reclaim
can eventually depend on another sk_lock (e.g., if NBD is used for swap
or writeback and NBD uses TLS/TCP which acquires sk_lock).

Since the UDP socket and the NBD TCP/TLS socket are different, this is a
false positive. Fix this by reclassifying NBD sockets to a separate lock
class when they are added to the NBD device.

This is similar to what nvme-tcp and other network block devices do.

Fixes: ffa1e7ada456 ("block: Make request_queue lockdep splats show up earlier")
Reported-by: syzbot+607cdcf978b3e79da878@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/netdev/6a2cdafe.428ffe26.258b27.0161.GAE@google.com/T/#u
Signed-off-by: Eric Dumazet <edumazet@google.com>
---
 drivers/block/nbd.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index fe63f3c55d0d960a1a4bbb2c60738cbbece10719..0e2180e910c4eaaa58556a0c75c1b9c3fdc1930d 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1238,6 +1238,42 @@ static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
 	return sock;
 }
 
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+static struct lock_class_key nbd_key[3];
+static struct lock_class_key nbd_slock_key[3];
+
+static void nbd_reclassify_socket(struct socket *sock)
+{
+	struct sock *sk = sock->sk;
+
+	if (WARN_ON_ONCE(!sock_allow_reclassification(sk)))
+		return;
+
+	switch (sk->sk_family) {
+	case AF_INET:
+		sock_lock_init_class_and_name(sk, "slock-AF_INET-NBD",
+					      &nbd_slock_key[0],
+					      "sk_lock-AF_INET-NBD",
+					      &nbd_key[0]);
+		break;
+	case AF_INET6:
+		sock_lock_init_class_and_name(sk, "slock-AF_INET6-NBD",
+					      &nbd_slock_key[1],
+					      "sk_lock-AF_INET6-NBD",
+					      &nbd_key[1]);
+		break;
+	case AF_UNIX:
+		sock_lock_init_class_and_name(sk, "slock-AF_UNIX-NBD",
+					      &nbd_slock_key[2],
+					      "sk_lock-AF_UNIX-NBD",
+					      &nbd_key[2]);
+		break;
+	}
+}
+#else
+static inline void nbd_reclassify_socket(struct socket *sock) {}
+#endif
+
 static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 			  bool netlink)
 {
@@ -1254,6 +1290,7 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	sock = nbd_get_socket(nbd, arg, &err);
 	if (!sock)
 		return err;
+	nbd_reclassify_socket(sock);
 
 	/*
 	 * We need to make sure we don't get any errant requests while we're
-- 
2.54.0.1136.gdb2ca164c4-goog

