Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH/RMEaHw2lRrQQAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Wed, 25 Mar 2026 07:57:10 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B195320596
	for <lists+nbd@lfdr.de>; Wed, 25 Mar 2026 07:57:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 39AC1204D1; Wed, 25 Mar 2026 06:57:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 25 06:57:10 2026
Old-Return-Path: <394LDaQYKA2AISLGWSEMMEJC.AMKL9BMRFCP.BC9G8L.MPE@flex--kuniyu.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=4.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,TO_TOO_MANY,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6D51F20483
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Mar 2026 06:39:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.701 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1, USER_IN_DEF_DKIM_WL=-7.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jvo0FAlwwbXB for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Mar 2026 06:38:55 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-pf1-x449.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 228C620599
	for <nbd@other.debian.org>; Wed, 25 Mar 2026 06:38:51 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82a82f78a20so21780883b3a.1
        for <nbd@other.debian.org>; Tue, 24 Mar 2026 23:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774420728; x=1775025528; darn=other.debian.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ps9jyH80iSRUMtuSLZrvtXUJpNI4M5Ryo0aSIRfQLmU=;
        b=lScHoK6amzfMdCd6QhG2+5TRqTP6D3oF4roMsuyUA7cgIefyfU0PkewuVHyEhlxCqY
         kZEHy620vxudAT0gXxUdEsDx5YYOV86knBcqi0sfTJQOALjr4E5wtr9fCGuGs9gHbZWn
         q52TyzY+m6D6NYIfhYgTKzINgU6i6qXgS4dYucqsSSEdZWvRGtbH2kTVS5/Jng4B5U5P
         TwmPCRAFegcohcCe/1H9lXwx5NjV+lrUX2HspLwBI1mqN0hWOJ2F2aXdcOdkv2ua5n3W
         YXu/j/82oQdi1wuMo17J18XZKv3K8+mwwJQ6JieHc+2SJc1RcPJ5pcIV5bm9tdIloFBN
         FZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420728; x=1775025528;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ps9jyH80iSRUMtuSLZrvtXUJpNI4M5Ryo0aSIRfQLmU=;
        b=R4sKVFRMLck8zWoBcdqiYDM5D2N7Z4v54zJ5eqlH+gnOc5B+H0DcO49MCXAGvZdP+U
         h1yHXXzlQHSZ2CRnmkg7GVZRTH40aaJJBhLB0D+sk7DgHECnksUvvJ14DyDdBjFysGS1
         CcaKBL+7xWmc+cgByPhJuV1zKlFJ5tDISpTWOdfmXZSl1tDaLl2REOqIhSpOlZMX+9JW
         uE1XXigP0npz/bywLDv1grjNICgESfYKnqR4QM5UKBra7B21+yARNwlwaHK2vDRLeF8f
         kUivtf5mWd6eJT5PH26DIMlR+cuacGqAlgB+i9zbzXsa/DAhCR/ypglQalVacrZV55zf
         3Osg==
X-Forwarded-Encrypted: i=1; AJvYcCV4CpeqV4vKBXX/iEhDMbBmy6vn1Wxl6wiQB6G8ePAqfnZXEA1KR3T9YLPwlE1HFMTGUJQ=@other.debian.org
X-Gm-Message-State: AOJu0YxW5Y0+Y+fYZV+h0YOVx1xJKgog6g5fj+OtpFEkjB2SmyujB+bt
	8vrCZswiZ6OzasFGPNZd2muHJQdfvZOryT76OonKR052B0z2vVQCoZE6GoiVqGVlhyri9A7qDxJ
	g37j22Q==
X-Received: from pfbdf8.prod.google.com ([2002:a05:6a00:4708:b0:829:94bc:6c15])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4489:b0:82a:899b:d804
 with SMTP id d2e1a72fcca58-82c6dfa883cmr2464688b3a.38.1774420727444; Tue, 24
 Mar 2026 23:38:47 -0700 (PDT)
Date: Wed, 25 Mar 2026 06:38:21 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260325063843.1790782-1-kuniyu@google.com>
Subject: [PATCH 0/5] nbd: Fix deadlock during fs reclaim under lock_sock().
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
Resent-Message-ID: <hjtz2tV8jr.A.XR9M.Gd4wpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3524
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260325063843.1790782-1-kuniyu@google.com
Resent-Date: Wed, 25 Mar 2026 06:57:10 +0000 (UTC)
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
X-Rspamd-Queue-Id: 7B195320596
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Recently, syzbot has reported 100+ possible deadlock splats
involving NBD, typically following this pattern:

  lock_sock(sk)
  -> GFP_KERNEL memory allocation
     -> fs reclaim
        -> lock_sock(sk) at NBD

Instead of spreading memalloc_noio_{save,restore} over the
networking code, we want to fix it in the NBD layer.

This series introduces a try-lock version of lock_sock() and
use it in NBD to fix the deadlock.

The try-lock variant should not fail in practice because while
the socket remain exposed to userspace even after being handed
over to NBD, the socket should not be touched by userspace.

The series can be applied cleanly on block-7.0 and net.git.


Kuniyuki Iwashima (5):
  nbd: Remove redundant sock->ops->shutdown() check in nbd_get_socket().
  nbd: Reject unconnected sockets in nbd_get_socket().
  net: Introduce lock_sock_try().
  inet: Add inet_shutdown_locked().
  nbd: Use lock_sock_try() for TCP sendmsg() and shutdown().

 drivers/block/nbd.c       | 44 ++++++++++++++++++++++++++++++++++-----
 include/net/inet_common.h |  1 +
 include/net/sock.h        | 31 +++++++++++++++++++++++++++
 net/ipv4/af_inet.c        | 43 ++++++++++++++++++++++++++++----------
 4 files changed, 103 insertions(+), 16 deletions(-)

-- 
2.53.0.1018.g2bb0e51243-goog

