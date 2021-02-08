Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE33144B9
	for <lists+nbd@lfdr.de>; Tue,  9 Feb 2021 01:15:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8A2282049E; Tue,  9 Feb 2021 00:15:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb  9 00:15:14 2021
Old-Return-Path: <cobb@cobb.uk.net>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BF69C2049A
	for <lists-other-nbd@bendel.debian.org>; Tue,  9 Feb 2021 00:15:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.48 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	WORD_WITHOUT_VOWELS=1] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1deRQDiGCQV0 for <lists-other-nbd@bendel.debian.org>;
	Tue,  9 Feb 2021 00:15:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 549 seconds by postgrey-1.36 at bendel; Tue, 09 Feb 2021 00:15:04 UTC
Received: from zaphod.cobb.me.uk (zaphod.cobb.me.uk [IPv6:2001:41c8:51:983::131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3F9432049B
	for <nbd@other.debian.org>; Tue,  9 Feb 2021 00:15:04 +0000 (UTC)
Received: by zaphod.cobb.me.uk (Postfix, from userid 107)
	id 7C9099C381; Tue,  9 Feb 2021 00:05:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cobb.uk.net;
	s=201703; t=1612829152;
	bh=MZ9jG3j3yHCteYmkkKpQJSWERsfD3svh63c/OdAwwCg=;
	h=From:Date:Subject:To:From;
	b=VHLmMzFakwQC0FxRw/sF6xkXV/rztj5oOO9fyK0Rijs8AUofCcnmD9iHl5ZLFAuLV
	 OH+VGtQNNJKh/08aZuB5tFaZvFJ1UCcYvKCvzW81wikvKJDSG1k3C328VEwwigwlgW
	 HwjanF9AQSNo/sSjNM7F2INaG/Mie1lwlmc/MJNtnyTSjlimniYPj1gQhUVhAYta83
	 7zKz8mPUK9fsqc3HGZBJ/W6EntWR8xlShIxH6+6KQflJlVXhj5AM28whka2gpzdkpF
	 fCwrEXpXTi+zVe/LYSauHprk4+zvkD8Q7rF5wAj+KwAYJ25oeKV3Exe3eBWhdwOPG8
	 OUxpVPC2wrxhw==
Received: from black.home.cobb.me.uk (unknown [192.168.0.205])
	by zaphod.cobb.me.uk (Postfix) with ESMTP id 201B19BBEE
	for <nbd@other.debian.org>; Tue,  9 Feb 2021 00:05:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cobb.uk.net;
	s=201703; t=1612829146;
	bh=MZ9jG3j3yHCteYmkkKpQJSWERsfD3svh63c/OdAwwCg=;
	h=From:Date:Subject:To:From;
	b=ohJ/Ahlb30XfJ/TvHoL17fsvyAEm9yJOd/fDZxSf3SXDApFCNK768rEYRJiIRqj5+
	 GRYcdbDaKFpWlY9y5xa8qgXcwUBXbIr7y3NbR9JQiapJK6K9gngIXanrlirVc95+EL
	 zB2Y31jOiL1ZCDYY8zrS3yY/95vAxKDXI3e/RTfl8H8YCUV0dO+RytSMEABkZOqlHT
	 +E8gW4092Gqruw6M8pac8lvjAJy4+US15dxNEK4mxJtB5A05Vt7HqU4yygZaNPuRvP
	 fy+2FO2mjSN6a06YM0v/fxw8HsnlsjDQp2iAODDM2/1phj4+kV5HmhRIQk9mk1hwdd
	 qsj+9tWKuUSLA==
Received: by black.home.cobb.me.uk (Postfix, from userid 500)
	id E95381ED558; Tue,  9 Feb 2021 00:05:45 +0000 (GMT)
From: "Graham R. Cobb" <g.nbd@cobb.uk.net>
Date: Mon, 8 Feb 2021 23:42:53 +0000
Subject: [PATCH] nbd-server: handle auth for v6-mapped IPv4 addresses
To: nbd@other.debian.org
Message-Id: <20210209000545.E95381ED558@black.home.cobb.me.uk>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <D8teIrnMNHO.A.YX.SQdIgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1127
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210209000545.E95381ED558@black.home.cobb.me.uk
Resent-Date: Tue,  9 Feb 2021 00:15:14 +0000 (UTC)

This patch adds support for using IPv4 addresses in the nbd-server auth file
even if the socket provides v6-mapped addresses. It extends the comparison
code in address_matches to handle the two cases where the auth file and the
socket use different address families.

This fixes issue #35 in the github repository.

Signed-off-by: Graham R. Cobb <g.nbd@cobb.uk.net>
---
 nbdsrv.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/nbdsrv.c b/nbdsrv.c
index 168d425..01ba1b2 100644
--- a/nbdsrv.c
+++ b/nbdsrv.c
@@ -35,6 +35,9 @@ bool address_matches(const char* mask, const struct sockaddr* addr, GError** err
 	char privmask[strlen(mask)+1];
 	int masklen;
 	int addrlen = addr->sa_family == AF_INET ? 4 : 16;
+#define IPV4_MAP_PREFIX 12
+	uint8_t ipv4_mapped[IPV4_MAP_PREFIX+4] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+		255, 255, 0, 0, 0, 0};
 
 	strcpy(privmask, mask);
 
@@ -61,12 +64,9 @@ bool address_matches(const char* mask, const struct sockaddr* addr, GError** err
 		uint8_t* byte_t;
 		uint8_t mask = 0;
 		int len_left = masklen;
-		if(res->ai_family != addr->sa_family) {
-			msg(LOG_DEBUG, "client address does not match %d/%d: address family mismatch (IPv4 vs IPv6?)",
-			    (int)res->ai_family, (int)addr->sa_family);
-			goto next;
-		}
-		switch(addr->sa_family) {
+		if(res->ai_family == addr->sa_family) {
+			/* Both addresses are the same address family so do a simple comparison */
+			switch(addr->sa_family) {
 			case AF_INET:
 				byte_s = (const uint8_t*)(&(((struct sockaddr_in*)addr)->sin_addr));
 				byte_t = (uint8_t*)(&(((struct sockaddr_in*)(res->ai_addr))->sin_addr));
@@ -75,6 +75,24 @@ bool address_matches(const char* mask, const struct sockaddr* addr, GError** err
 				byte_s = (const uint8_t*)(&(((struct sockaddr_in6*)addr)->sin6_addr));
 				byte_t = (uint8_t*)(&(((struct sockaddr_in6*)(res->ai_addr))->sin6_addr));
 				break;
+			}
+		} else {
+			/* Addresses are different families, compare IPv4-mapped IPv6 address */
+			switch(addr->sa_family) {
+			case AF_INET:
+				/* Map client address to IPv6 for comparison */
+				memcpy(&ipv4_mapped[IPV4_MAP_PREFIX], &(((struct sockaddr_in*)addr)->sin_addr), 4);
+				byte_s = (const uint8_t*)&ipv4_mapped;
+				byte_t = (uint8_t*)(&(((struct sockaddr_in6*)(res->ai_addr))->sin6_addr));
+				len_left += IPV4_MAP_PREFIX * 8;
+				break;
+			case AF_INET6:
+				byte_s = (const uint8_t*)(&(((struct sockaddr_in6*)addr)->sin6_addr));
+				/* Map res to IPv6 for comparison */
+				memcpy(&ipv4_mapped[IPV4_MAP_PREFIX], &(((struct sockaddr_in*)(res->ai_addr))->sin_addr), 4);
+				byte_t = &ipv4_mapped[0];
+				break;
+			}
 		}
 		while(len_left >= 8) {
 			if(*byte_s != *byte_t) {
-- 
2.29.2

