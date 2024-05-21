Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDC38CA5A0
	for <lists+nbd@lfdr.de>; Tue, 21 May 2024 03:09:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E861120526; Tue, 21 May 2024 01:09:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 21 01:09:11 2024
Old-Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 874362050C
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 May 2024 00:51:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.199 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IfOpBL6LB321 for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 May 2024 00:51:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C1F38204E8
	for <nbd@other.debian.org>; Tue, 21 May 2024 00:50:57 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f0937479f8so89754585ad.3
        for <nbd@other.debian.org>; Mon, 20 May 2024 17:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716252654; x=1716857454; darn=other.debian.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E7IgrQv77JNGoReE73O6jlcO4ja2xpOf19wDuWbBNEI=;
        b=IJAe2n+fQ0RYvMX/R37lF9Yl2qBaCahrH+c2e70c17kgsEMRxOJSnYlB/ObBtvwQ2m
         VTq5pynFWP5FsKcQ2uaqgDdYXvYJSLDE1QgR/L20qNPUW76UdoUMZOE7gzJquXiyo6YO
         YzRUhyNCNYmjh4Jm/bVXFKUkQK+9SXHgPut8Bs8s5Qp1+elNKA0FtHcbzDZp74+ijjLo
         C8KcGAR1Bx2XM6ekEzkLmIRx3rUrtAXu1yjpqAJI5N7kjBsZtKAD3uhbPD0VPtynjSab
         f0ssQxhzR1abNxMZbH8rCAPBKBDkEFAuOklTzelisYBAqPRi9i7WIDO/OvW8YFAH8IJ9
         KGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716252654; x=1716857454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7IgrQv77JNGoReE73O6jlcO4ja2xpOf19wDuWbBNEI=;
        b=twm7KkWmx3gUHhXgFt4OSj95+xvYodP/Gs0xbhfURC3FMQGA5rcO6OyZ5EwTUOfnpS
         MNBnVNvJCMU3RX10YWH+XqQQbnUkxlKGm7xQiVWP7kLS4YHUFxjEhpwnssJSfMY75ghG
         CUcMZuHIPrah4NEySRJHdtQ79EBhIQacYPFI12dfuxGLYTLj0q3q3asCO6OZzfIayyu6
         Qhdsw21x+4K6onrGue39npibN09EzJGQWSmlNNin5tQ4nSZzKbfF6ghTuwcy118xClce
         2v9Imqv7LICc86Mh27RXFyHMFlxLhOP/YztQ4mZtTEqJ/y9nroU49fAoR8+urFjERmf4
         EAvw==
X-Gm-Message-State: AOJu0YxSycwnqyE12t9MWA4cO5zXoI/z8y7XDynsH+i20cuy0SOKNg1Z
	WxBheURG/+D+Fqz/UY+VbMtPNtYG0Z7G9fJotFPiqAwygzHrEEqqD6cuLTgPkZ4=
X-Google-Smtp-Source: AGHT+IGho1B5aikA+fz6m12kR3mwMGstfWlDiWx7L0oc004a4FsSP2NjpIkf/m7MN0bkVGQbkZXa0Q==
X-Received: by 2002:a17:903:1251:b0:1eb:5344:6a01 with SMTP id d9443c01a7336-1ef4404a25bmr328380435ad.44.1716252653806;
        Mon, 20 May 2024 17:50:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad819csm209725365ad.84.2024.05.20.17.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 17:50:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: nbd@other.debian.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] nbd-client: Fix build on musl + gcc14
Date: Mon, 20 May 2024 17:50:51 -0700
Message-ID: <20240521005051.2333219-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jdL8_FV7GSD.A.2zmI.3Q_SmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2813
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240521005051.2333219-1-raj.khem@gmail.com
Resent-Date: Tue, 21 May 2024 01:09:11 +0000 (UTC)

GCC-14 has promoted incompatible-pointer-types warning into error which is
now flagged especially with when building on musl

Fixes following error

| ../nbd-3.26.1/nbd-client.c: In function 'openunix':
| ../nbd-3.26.1/nbd-client.c:345:27: error: passing argument 2 of 'connect' from incompatible pointer type [-Wincompatible-pointer-types]
|   345 |         if (connect(sock, &un_addr, sizeof(un_addr)) == -1) {
|       |                           ^~~~~~~~
|       |                           |
|       |                           struct sockaddr_un *
| In file included from ../nbd-3.26.1/nbd-client.c:25:
| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/nbd/3.26.1/recipe-sysroot/usr/include/sys/socket.h:386:19: note: expected 'const struct sockaddr *' but argument is of type 'struct sockaddr_un *'
|   386 | int connect (int, const struct sockaddr *, socklen_t);
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 nbd-client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nbd-client.c b/nbd-client.c
index 8d1101b..7b25c67 100644
--- a/nbd-client.c
+++ b/nbd-client.c
@@ -342,7 +342,7 @@ int openunix(const char *path) {
 		return -1;
 	};
 
-	if (connect(sock, &un_addr, sizeof(un_addr)) == -1) {
+	if (connect(sock, (struct sockaddr*)&un_addr, sizeof(un_addr)) == -1) {
 		err_nonfatal("CONNECT failed");
 		close(sock);
 		return -1;
-- 
2.45.1

