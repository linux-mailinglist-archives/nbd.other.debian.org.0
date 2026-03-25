Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFVVLFKHw2lRrQQAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Wed, 25 Mar 2026 07:57:22 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 771D03205A4
	for <lists+nbd@lfdr.de>; Wed, 25 Mar 2026 07:57:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 51546204D2; Wed, 25 Mar 2026 06:57:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 25 06:57:22 2026
Old-Return-Path: <3_YLDaQYKA2YOYRMcYKSSKPI.GSQRFHSXLIV.HIFMER.SVK@flex--kuniyu.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	TO_TOO_MANY,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 86203205A2
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Mar 2026 06:39:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.601 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PlCi28oGwbva for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Mar 2026 06:39:00 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-pj1-x1049.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id AA9B22059D
	for <nbd@other.debian.org>; Wed, 25 Mar 2026 06:38:57 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-35bea322389so4109371a91.1
        for <nbd@other.debian.org>; Tue, 24 Mar 2026 23:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774420734; x=1775025534; darn=other.debian.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fe7lwzU/0LJm5TPvDH/KfFTCZrDEcrbFnFZJiKYD2Dg=;
        b=hdM/JT7uc5u8mOXccLZqJyJf0VDvVZfmzjU+ysGhHU6ZcnYDQG1s2xgBg3rTHklRmw
         yWP6BkAG8Vx5xre0o8Mo+yj30hNOeXdK/A+jS1vQ7jnKIOWQZiPkxTjnbWO4XXSt8yz3
         +NNERV1Yu+oujm38nn1dBjX32HUNHQ8uoqFNp/ytYIPiOgvRuKGqIpGp8dUMlhF6Vv0v
         F5x/LT+QSrz2In/OSWV5D3hzu6sSeUcPMhFN38F7CkFHZs8WyNYEl2JQD0Arcedd94TQ
         fhSUENIhv8UrHAEpbLe5FKkbq7x5E1aLWqB1CA7FlOF7YLi9hyXvlfE5v7BEDwQaLRPD
         YwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420734; x=1775025534;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fe7lwzU/0LJm5TPvDH/KfFTCZrDEcrbFnFZJiKYD2Dg=;
        b=IJfP8zttzr52xH8Of6+GG1fxFzgDjGOieIsug6tKLD2zZADdWYdxnJcVK5kjQ0cpma
         m9fTGeAykjPcOMPrt60EjQ2X4g+/qVi1Wl7VO2R1ePj+Dl9+yRY0lYNx1NqQOXh4q26v
         ph/fELQO2m578UfykKCXK4zFjuWVwN2mt0XHXZnKfCMChIy4TvTGW58GZX2hEbXrSl/S
         J3kkqDbR00uzEzmpbhcMawqe9S/e55OnPNCepKcv+qler5GL2mK89f29dOk27Vxf3mGS
         lniYUwd1Fd99AW+WGbF6Wc0hASPNGfr1Id3lYzN4dVpA393ilyfLhagnqkqgFu+CzQUG
         o+/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGYO8JpGphDP2J7Fv5VTvQoU2wFbIiFhohXezKKTBce8FMTJ1OG5yCVU77H/k9eOMwH48=@other.debian.org
X-Gm-Message-State: AOJu0Yxyi2HbxDAI0kaK98A9qzhCmt2E+tDNvct5EbhtGP0IXsFUkshV
	Mjk96hEzpkPmy6zffQVUCQVhhiYCKBDK+hB9EfDnTV6cnXStHts+u+S+h/rDZAIrIq5fWzLpT9K
	VmKTuRg==
X-Received: from pjbfz5.prod.google.com ([2002:a17:90b:245:b0:35b:8f3f:2b30])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:35cf:b0:359:f77f:8cff
 with SMTP id 98e67ed59e1d1-35c0dd6a759mr2063094a91.19.1774420733796; Tue, 24
 Mar 2026 23:38:53 -0700 (PDT)
Date: Wed, 25 Mar 2026 06:38:22 +0000
In-Reply-To: <20260325063843.1790782-1-kuniyu@google.com>
Mime-Version: 1.0
References: <20260325063843.1790782-1-kuniyu@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260325063843.1790782-2-kuniyu@google.com>
Subject: [PATCH 1/5] nbd: Remove redundant sock->ops->shutdown() check in nbd_get_socket().
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
Resent-Message-ID: <1UGrJD_MeEG.A.Ab9M.Sd4wpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3525
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260325063843.1790782-2-kuniyu@google.com
Resent-Date: Wed, 25 Mar 2026 06:57:22 +0000 (UTC)
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
X-Rspamd-Queue-Id: 771D03205A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since commit 9f7c02e03157 ("nbd: restrict sockets to TCP
and UDP") (s/UDP/AF_UNIX/), NBD only accepts TCP and AF_UNIX
SOCK_STREAM sockets as backend.

nbd_get_socket() currently checks if sock->ops->shutdown()
is sock_no_shutdown(), but sock->ops->shutdown() is always
inet_shutdown() or unix_shutdown() for these socket types.

Let's remove the redundant check.

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 drivers/block/nbd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index fe63f3c55d0d..fc714cba1f23 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1228,13 +1228,6 @@ static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
 		return NULL;
 	}
 
-	if (sock->ops->shutdown == sock_no_shutdown) {
-		dev_err(disk_to_dev(nbd->disk), "Unsupported socket: shutdown callout must be supported.\n");
-		*err = -EINVAL;
-		sockfd_put(sock);
-		return NULL;
-	}
-
 	return sock;
 }
 
-- 
2.53.0.1018.g2bb0e51243-goog

