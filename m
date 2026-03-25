Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBtTNV6Hw2lRrQQAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Wed, 25 Mar 2026 07:57:34 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7659D3205AC
	for <lists+nbd@lfdr.de>; Wed, 25 Mar 2026 07:57:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5DE272059A; Wed, 25 Mar 2026 06:57:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 25 06:57:34 2026
Old-Return-Path: <3_4LDaQYKA2gQaTOeaMUUMRK.IUSTHJUZNKX.JKHOGT.UXM@flex--kuniyu.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	TO_TOO_MANY,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4D7EF205A1
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Mar 2026 06:39:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.601 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id AT-CKPmFJDvC for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Mar 2026 06:39:02 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-pl1-x64a.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8D8732059B
	for <nbd@other.debian.org>; Wed, 25 Mar 2026 06:38:59 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b064884a7cso403126955ad.3
        for <nbd@other.debian.org>; Tue, 24 Mar 2026 23:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774420736; x=1775025536; darn=other.debian.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nL4L22a9Ck1NAZ8TRhufw+BZmJs95X+mOcKWTHsxd3s=;
        b=IeklQr5OzoA7WEMPEMY3KQ6A9KF4T0dpbKZY0QPoWFh2gliqfs0pNpcPNH5o6ewacj
         Jed3LYaKKV0u5At+JdEHc04hV80b2to4uSjjxijt6IzBFMqS7zfnwyvnItLtjU+LJ5SV
         yz5G0+KUsdHTOzQfdQND5JQYGmRBdrcoTnrmkvw1GG7iquFFG9RDRhMxA3kGshatMPyA
         maNL2vlP6AA5tZPnCCI8cHwKY7XckPwf7xyO/3TUiu/ty8h3CshlfiIrL26OrfDFSZvh
         6VIZ5fC7mCeZoanUItgx44mSBoeoa6LVIFfIHEInjg5ePaBjsmqcXkx7fYLxmwTswGwv
         SyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420736; x=1775025536;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nL4L22a9Ck1NAZ8TRhufw+BZmJs95X+mOcKWTHsxd3s=;
        b=NxezWfC0VPOeAR2lwInwd2ch2qyHPs36Y0mo/XDFd0i5swP7g9OckjjtxVlpgtTIqd
         ey9Ti1ijOX2zkED8FCaaJ3TsPHw/MXk2raIXi81ca41ORkutAhJmrbfEG/Iq1RbJJs4l
         KPhSmW6UA7zG1h13xlcP4PBZoP6ywM3ywGNmZVt4cjTDyzUYKvfcLzKnb/v5P+57u3xX
         nNWk5kgtBNSI3ovte2yB6yJTOTEry7pSC72rQM70PSjD5eQqJuJrgo1HouwFSf/1NpKF
         mNaKpz7pLtG10TSE9p/n61Vu7/6kCF/uN52H0Khb8MFfuRrK02KJac7Q9EqPdr4Xbrtv
         3yQw==
X-Forwarded-Encrypted: i=1; AJvYcCUhf0fztBG/tVP8QYBzDZ30EZb+/9l1SYYdYYSrQCSQ2F00Qu99MEHijYyThuUtMEuKyXE=@other.debian.org
X-Gm-Message-State: AOJu0YzB+xkxd2aBH39e+vyDcWUCvPWB0Probina/mzjLw3lFKXSTp/1
	96a9mjicOtA1OBxOXyTo4IFgOj2owIPAWKGDewdZTPlHvW5qeWKobe7x42wTwAz9cz/LUb47cR5
	RNtNQtw==
X-Received: from pglu12.prod.google.com ([2002:a63:140c:0:b0:c76:3cb2:929c])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:958e:b0:39c:1f90:2867
 with SMTP id adf61e73a8af0-39c4ae9f50bmr2735620637.59.1774420735355; Tue, 24
 Mar 2026 23:38:55 -0700 (PDT)
Date: Wed, 25 Mar 2026 06:38:23 +0000
In-Reply-To: <20260325063843.1790782-1-kuniyu@google.com>
Mime-Version: 1.0
References: <20260325063843.1790782-1-kuniyu@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260325063843.1790782-3-kuniyu@google.com>
Subject: [PATCH 2/5] nbd: Reject unconnected sockets in nbd_get_socket().
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
Resent-Message-ID: <MSr2RSj9leJ.A.5l9M.ed4wpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3526
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260325063843.1790782-3-kuniyu@google.com
Resent-Date: Wed, 25 Mar 2026 06:57:34 +0000 (UTC)
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
X-Rspamd-Queue-Id: 7659D3205AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

NBD requires a handshake, so passing unconnected or half-closed
sockets to NBD does not make sense.

Let's accept TCP_ESTABLISHED sockets only.

Note that AF_UNIX sockets remain in TCP_ESTABLISHED once connect()ed
regardless of shutdown(), but this is a prep patch for TCP, allowing
a subsequent patch to call tcp_sendmsg_locked() directly without extra
setup (e.g. inet_send_prepare()).

Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
---
 drivers/block/nbd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index fc714cba1f23..1877554d362e 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1228,6 +1228,13 @@ static struct socket *nbd_get_socket(struct nbd_device *nbd, unsigned long fd,
 		return NULL;
 	}
 
+	if (READ_ONCE(sock->sk->sk_state) != TCP_ESTABLISHED) {
+		dev_err(disk_to_dev(nbd->disk), "Socket does not have bi-directional stream.\n");
+		*err = -EPIPE;
+		sockfd_put(sock);
+		return NULL;
+	}
+
 	return sock;
 }
 
-- 
2.53.0.1018.g2bb0e51243-goog

