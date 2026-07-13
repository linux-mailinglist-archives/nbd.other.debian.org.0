Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d1tkODfYVGrzfgAAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 13 Jul 2026 14:21:11 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B3774AE04
	for <lists+nbd@lfdr.de>; Mon, 13 Jul 2026 14:21:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XtD6bjRl;
	spf=none (mail.lfdr.de: domain of "bounce-nbd=lists+nbd=lfdr.de@other.debian.org" has no SPF policy when checking 2001:41b8:202:deb:216:36ff:fe40:4002) smtp.mailfrom="bounce-nbd=lists+nbd=lfdr.de@other.debian.org";
	dmarc=pass (policy=none) header.from=gmail.com
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5736A206BD; Mon, 13 Jul 2026 12:21:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jul 13 12:21:11 2026
Old-Return-Path: <l1za0.sec@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FVGT_m_MULTI_ODD,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 795A6206DE
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Jul 2026 12:04:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	FVGT_m_MULTI_ODD=0.02, MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Yi7tTSBwmiVx for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Jul 2026 12:04:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pj2-x00.google.com (mail-pj2-x00.google.com [IPv6:2607:f8b0:4864:39::])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6F98D206DC
	for <nbd@other.debian.org>; Mon, 13 Jul 2026 12:04:03 +0000 (UTC)
Received: by mail-pj2-x00.google.com with SMTP id d9443c01a7336-2cc7a345f51so24012685ad.0
        for <nbd@other.debian.org>; Mon, 13 Jul 2026 05:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944240; x=1784549040; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vdrPerGbmq5NMDa7g7PMgXL4m2wISq1Mdu9LzzqhMGo=;
        b=XtD6bjRl11f7pPhyUTX2Ea+VO0J8uKaO72YmATizzBZz5ovEi3M63rw0d0fN1RBhhB
         2ooN7864b0I0GcuXMpCEHBKZGCK16TXn7vr7lkBawnJhfZVIBZNu01spUVQ0rkY/cVXC
         dhjP0Uc6Jw2YHR+bsTzV3ftEO3EehclEjvlLjiESqFo9vvu7lXB9ZBa7KlMt9oYKxVXK
         tqIDzSac7IZWAfOIIbrO7Syw/h9ahRA80GiGI5g7xwfLftBVVwuvefl8+GLmJZS3gHKn
         oIGdGqBKXxpiUrrr6a2vqdqqLZBNn5qgjv/OZW/p7z1M+yfa81ub92DoXpY9I8ATJSwK
         aVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944240; x=1784549040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdrPerGbmq5NMDa7g7PMgXL4m2wISq1Mdu9LzzqhMGo=;
        b=fruMawMv6kfxas5q8csyjE56Y1lPoSauOvBzRG+6Ty1SUMPQZMNEqzNHCjTD4ys352
         LRpfSFJp5N/toqSxcXSXLxkhFAbpD38Ko4G8kKpIV4HTtkwTPGCEXxPxRogxqPiazRZF
         TamlJiyAsS/9pvZoFpa9KVv8tvAjGMMHmntm9DZ+WfYTOaiATmF9NXVRGha9WApDCQYu
         dY7FUfkTtKTdluAN52zXRUeHBY4SuXK7R/9lrJmx+7Eb9rMvfuPaGX9e5DCffZHxguy4
         myQ/BdHRnW+MAyuQPWb7JkUVB9McxdQGDCPygegOsAvhTHqlSvXV/zncB8oOqyYmjc2V
         G60Q==
X-Forwarded-Encrypted: i=1; AHgh+RoXYauFi0HMpotL1E6dlV6zfLADvVpKj6h2iymM6vjGl8HG/RuGnhXpUms3qNIIVTkBpGs=@other.debian.org
X-Gm-Message-State: AOJu0Yx6c/uhBCnu0oAjPyIoOIWO++FU15BlZ6+HWBTzkszN9ShAC9tt
	/pfpJ+LndmjX97Dp2GjQRRyh95yqccX5iw9zl64NxeNKjgm1Qke0PnhL
X-Gm-Gg: AfdE7cn8U16Zs1lZE/9jBwxkVAD6UYMAZCzIkfFLNqqbY0G+XwvivPdjoBN/ayYWeIM
	+z390+mY/ukN2NRxtJ9Eyvd+mqe57F8PC893453zYerXnH9hmm2v8YPCleN7kCHWk/a0QTErPwJ
	Wef7XztKLtkOd25DgHMgfrozPpNoKnAsfqnwTrTwzesjfJZQKPKk+0IBnPRfsNlgekXqHnz8L/j
	w9DTCPHO22xdrw07z2vKDcUPjaUy4p2a5kvqqId1EFk3vFstBY9+/jVmzrOiZHTvRSRj+m6v3Fd
	YKCpET8demA7awWtPDahbYvAdtfIgUBXcJHqX5tXIMG1Wq4nTllnyu5w+YXxBRup/saaHQnAtKR
	Gpuet22d32xJsx4mzz10IFESHf8NeINqubGg74ZlNZ6K4Egd+D3bE4lrfuf7I3XkSa4rficaHjx
	yKBy3WsGRJ87uSVozjGfN7
X-Received: by 2002:a17:903:350c:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2ce9eac6af3mr84428895ad.14.1783944239683;
        Mon, 13 Jul 2026 05:03:59 -0700 (PDT)
Received: from amax.cluster.local ([115.233.223.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c100adsm97053395ad.32.2026.07.13.05.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:03:59 -0700 (PDT)
From: l1za0.sec@gmail.com
To: josef@toxicpanda.com
Cc: axboe@kernel.dk,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	Haocheng Yu <l1za0.sec@gmail.com>
Subject: [PATCH] nbd: do not reclassify userspace sockets
Date: Mon, 13 Jul 2026 20:02:42 +0800
Message-Id: <20260713120242.1284559-1-l1za0.sec@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bisXGvc33iK.A.UnNG.3gNVqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3591
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260713120242.1284559-1-l1za0.sec@gmail.com
Resent-Date: Mon, 13 Jul 2026 12:21:11 +0000 (UTC)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,m:linux-kernel@vger.kernel.org,m:l1za0.sec@gmail.com,m:l1za0sec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[l1za0sec@gmail.com,bounce-nbd=lists@other.debian.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.dk,vger.kernel.org,other.debian.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[l1za0sec@gmail.com,bounce-nbd=lists@other.debian.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:helo,bendel.debian.org:rdns,other.debian.org:from_smtp];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74B3774AE04

From: Haocheng Yu <l1za0.sec@gmail.com>

A Syzkaller-based tool we developed reported a pvqspinlock warning when
one thread passes a TCP socket to NBD_SET_SOCK while another thread
concurrently calls setsockopt() on the same socket:

  pvqspinlock: lock ... has corrupted value 0x0
  sockopt_lock_sock()
  do_ip_setsockopt()
  __sys_setsockopt()

NBD gets the socket with sockfd_lookup(), so the socket remains a normal
userspace-visible file descriptor. Under CONFIG_DEBUG_LOCK_ALLOC,
nbd_add_socket() calls nbd_reclassify_socket(), which in turn calls
sock_lock_init_class_and_name(). This function resets sk_lock.owned,
reinitializes sk_lock.wq, and calls spin_lock_init() on sk_lock.slock.

The sock_allow_reclassification() check only samples the current socket
lock state. It does not prevent a concurrent syscall from acquiring or
using the socket lock immediately after the check. Reinitializing the
socket lock while setsockopt() is using it can therefore clear the
queued spinlock state and make the later unlock trigger the corrupted-lock
warning.

Only reclassify sockets that are private to the kernel before they are
published. NBD accepts sockets supplied by userspace and cannot make
that guarantee, so remove the NBD-specific reclassification.

Signed-off-by: Haocheng Yu <l1za0.sec@gmail.com>
---
 drivers/block/nbd.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 8f10762e90ef..e2fe9e3308fc 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1238,42 +1238,6 @@ static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
 	return sock;
 }
 
-#ifdef CONFIG_DEBUG_LOCK_ALLOC
-static struct lock_class_key nbd_key[3];
-static struct lock_class_key nbd_slock_key[3];
-
-static void nbd_reclassify_socket(struct socket *sock)
-{
-	struct sock *sk = sock->sk;
-
-	if (!sock_allow_reclassification(sk))
-		return;
-
-	switch (sk->sk_family) {
-	case AF_INET:
-		sock_lock_init_class_and_name(sk, "slock-AF_INET-NBD",
-					      &nbd_slock_key[0],
-					      "sk_lock-AF_INET-NBD",
-					      &nbd_key[0]);
-		break;
-	case AF_INET6:
-		sock_lock_init_class_and_name(sk, "slock-AF_INET6-NBD",
-					      &nbd_slock_key[1],
-					      "sk_lock-AF_INET6-NBD",
-					      &nbd_key[1]);
-		break;
-	case AF_UNIX:
-		sock_lock_init_class_and_name(sk, "slock-AF_UNIX-NBD",
-					      &nbd_slock_key[2],
-					      "sk_lock-AF_UNIX-NBD",
-					      &nbd_key[2]);
-		break;
-	}
-}
-#else
-static inline void nbd_reclassify_socket(struct socket *sock) {}
-#endif
-
 static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 			  bool netlink)
 {
@@ -1290,7 +1254,6 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	sock = nbd_get_socket(nbd, arg, &err);
 	if (!sock)
 		return err;
-	nbd_reclassify_socket(sock);
 
 	/*
 	 * We need to make sure we don't get any errant requests while we're

base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.51.0

