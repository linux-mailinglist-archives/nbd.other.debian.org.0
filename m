Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F33ECB56DA6
	for <lists+nbd@lfdr.de>; Mon, 15 Sep 2025 02:48:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 867F820DA2; Mon, 15 Sep 2025 00:48:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 15 00:48:11 2025
Old-Return-Path: <yskelg@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=4.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FVGT_m_MULTI_ODD,HEADER_FROM_DIFFERENT_DOMAINS,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 59E4220B69
	for <lists-other-nbd@bendel.debian.org>; Mon, 15 Sep 2025 00:30:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.974 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FREEMAIL_FORGED_FROMDOMAIN=0.001,
	FREEMAIL_FROM=0.001, FVGT_m_MULTI_ODD=0.02,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, LDO_WHITELIST=-5,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JAWSHYK4t96q for <lists-other-nbd@bendel.debian.org>;
	Mon, 15 Sep 2025 00:30:30 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pl1-f176.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 84D2020AC4
	for <nbd@other.debian.org>; Mon, 15 Sep 2025 00:30:23 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24602f6d8b6so6954815ad.1
        for <nbd@other.debian.org>; Sun, 14 Sep 2025 17:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757896220; x=1758501020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVqgqxcgKTNTeyqzc9pMfCfOrslPc+RNjaWKAoWiop8=;
        b=WLp+XBc6rIgtwabuid5EtFc0llu2920vJaXmly25/yogY/bcZzVRvQOkWtt0+NohCw
         /Vm3HoRUIc/Iu6rrhoYn1B+qhjjpPKhQvBtimZ/4H2xw3VK676NOJ4LcRLKSCLAh6T0y
         Qqa7W7+ucY1zSh6/BKGFQ8HLFwVsPl5ykvYCfOVHgRvWXlEzEci1+MpL3hwMf/zp22V/
         05yE2u6fDt1c727mOuj4ZEXGMV0WxHCwC/RO4PrZzT4GJZCeZT+fPkwzodYpBI+q+F0q
         VFTUIBEpvNbmE5Y4q3qTB7y8XFWplPyxlw6R4HPr4/Pb5kM8druUmdlv2jIhUwp+ldLX
         9xzg==
X-Gm-Message-State: AOJu0YyenuC3Rjmr1jHJNWsravKWRE+oCnN2NBWE8xEAQ1zrwhax5AL3
	dBonQaLZlYmXYfThiI1KwObVuLldFx0kl4YjrGMkbIkrvZXdc8OUPPBT
X-Gm-Gg: ASbGncu8H4lfXBzk0Pi0xRwe1K01qYQW+HJ9Mb1HqMuzbmdu6/CK5l8LI2lkLNmB/p+
	dGx9Htfk/cEjOaP9ivrQc8TnGqsyjjAa91600TgjuhE+b0/rtjbk5eNnJXecJm3ARJlev2fo0ti
	iLRpBNcf0Vt730jdL9oNsIpUVEPm0c6z0D92yrByBBGT1wQixQDex7WV+NuwByqsWQ4Reg8CXzM
	BwYnWuQ+6/zfdCa3jm+mCxRB9lWTzmiIxQ/C0SJLHs14UwmIjF0r1Atn6ua2PyfYp+6zbh3fXhr
	R6FZgtkP4HX2iNDw3D9Dz5DeKY9pAsWVVTh9tARmuY3BRI/K+upod8HkzuMbewOmvOCfe5ah7uP
	fMCe9Ef8E9JfwiwzXM3HQzxQ2O6AsvKhSG7fdUBKaNKDAFkPpyMXYLnQayk6ifAzHeSC1yw0Odo
	uJsDKm1szbiw==
X-Google-Smtp-Source: AGHT+IEWBBCeZEGDfs1LGDOUEl++ut7jv/h4LK8oECVGIm15Wd85FMGEWtnoxzm+xEnyCAfSjoK2Vg==
X-Received: by 2002:a17:90b:3a84:b0:32b:8373:203f with SMTP id 98e67ed59e1d1-32de4f8b813mr6558471a91.4.1757896219646;
        Sun, 14 Sep 2025 17:30:19 -0700 (PDT)
Received: from localhost ([218.152.98.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd98b438esm12472202a91.14.2025.09.14.17.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:30:19 -0700 (PDT)
From: Yunseong Kim <ysk@kzalloc.com>
To: Wouter Verhelst <w@uter.be>,
	Eric Blake <eblake@redhat.com>,
	Pavel Machek <pavel@kernel.org>
Cc: nbd@other.debian.org,
	Yunseong Kim <ysk@kzalloc.com>
Subject: [PATCH] nbd: fix build failure after openunix/opennet refactor
Date: Mon, 15 Sep 2025 00:29:42 +0000
Message-ID: <20250915002941.937139-2-ysk@kzalloc.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nIXw9qH5W5F.A.5vr.LJ2xoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3443
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250915002941.937139-2-ysk@kzalloc.com
Resent-Date: Mon, 15 Sep 2025 00:48:11 +0000 (UTC)

Commit 17043b068f43 ("Refactor the negotiate() and connected functions")
removed all parameters from openunix() and opennet(), but main()
still called them with host/port arguments. This causes build errors:

nbd-client.c:1224:32: error: too many arguments to function ‘openunix’; expected 0, have 1
nbd-client.c:1226:32: error: too many arguments to function ‘opennet’; expected 0, have 2

Update the calls in main() to match the new prototypes.

Fixes: 17043b068f43 ("Refactor the negotiate() and connected functions")
Signed-off-by: Yunseong Kim <ysk@kzalloc.com>
---
 nbd-client.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/nbd-client.c b/nbd-client.c
index 158ec80..e809d9c 100644
--- a/nbd-client.c
+++ b/nbd-client.c
@@ -1221,9 +1221,9 @@ int main(int argc, char *argv[]) {
 
 	for (i = 0; i < cur_client->nconn; i++) {
 		if (cur_client->b_unix)
-			sock = openunix(cur_client->hostn);
+			sock = openunix();
 		else
-			sock = opennet(cur_client->hostn, cur_client->port);
+			sock = opennet();
 		if (sock < 0)
 			exit(EXIT_FAILURE);
 
-- 
2.51.0

