Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8452B48D2E3
	for <lists+nbd@lfdr.de>; Thu, 13 Jan 2022 08:34:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 147F32063E; Thu, 13 Jan 2022 07:34:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 13 07:34:33 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9EE8220638
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jan 2022 07:34:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PD1kA21TfSik for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jan 2022 07:34:17 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wm1-x32f.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B727A20637
	for <nbd@other.debian.org>; Thu, 13 Jan 2022 07:34:17 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id d18-20020a05600c251200b0034974323cfaso4855999wma.4
        for <nbd@other.debian.org>; Wed, 12 Jan 2022 23:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q9gxgqHjLyrQk6B4m1d2yD3Mj3SKO1qvOeyCrYhlvDI=;
        b=ZpRojxaPjLxFOy9W8/8a0vtZFoZCBezhMqWUoNWzZIvZGg90lbz58i1RjZGcYeqp3M
         BL4PVME0fuG1nh6tg64we/vco3BraURtAWIewqQ9hsfE5vILr3wABjbDa33Ce9WO/V7A
         gdzklHS6WyrmkwZtZLbCLltaMJOr+/+bTCgC3hgP1mKP6Ab0WxITHK5ZsPAb0nB6o+s6
         AGQf2reMWrgQD0aSSnxq7KFrQewX/owiIU653VYhgKjquF0SsFiwnnU2qHLgtQ7pFOT6
         iamjCkRVMluszahkJpFOAXWSo46uxUgDrCH2pHpM8X1F6oF37WxlTCiQa9xHA4oyTF/x
         /JXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q9gxgqHjLyrQk6B4m1d2yD3Mj3SKO1qvOeyCrYhlvDI=;
        b=BLsrr6m/RfHCY49o6yPfq64DUnOMIT/Ca0ISYrOcQyDDBo37vysvTGwUvnbqaqRfDK
         Lh/r9daHKU608GQY4zfsSj7/JJYfxgB+kWbYI0dQ9eDDAtCPDjMwaDfhCiIVP97POZO5
         sxtc8+JDdZYl9iGaPPgktQlE4ZOBL3Rv0WEkCg6mDB5XD2By48yyL0t0ySFFP5TqSdbd
         d8ZeSQDvaOwWslRbJsAz6ZQCKj/9k9ue9/y50oGWbALAlNw1vWY2riEOBSYhuwe67iUX
         uZu9nVdJuJl8glfYe0J5oaBlaDTKjkjlMkVaTx2IoPgjEjeEQXfIeJDPVHqtzmDkywl4
         4ATg==
X-Gm-Message-State: AOAM53253xg7h2E9sa03eLbEgSwEEzZPSYMm3gHjy/gg3LIxRaT/Sl25
	Y21o2nAGsKxQJwGkcfkw4Du5nPC+Y3o4yd7e
X-Google-Smtp-Source: ABdhPJzGk/dCplYjAnmYSyA+xbMsBi+p/5lcOCv4Sf15mOLhV68RgHd+oo9nR+Yge0tiRZHj4AoXKw==
X-Received: by 2002:a05:600c:3c9b:: with SMTP id bg27mr2580641wmb.163.1642059255072;
        Wed, 12 Jan 2022 23:34:15 -0800 (PST)
Received: from localhost.localdomain (p200300d99704790072586cbefa5b7408.dip0.t-ipconnect.de. [2003:d9:9704:7900:7258:6cbe:fa5b:7408])
        by smtp.googlemail.com with ESMTPSA id t7sm1740662wrx.48.2022.01.12.23.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 23:34:14 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Manfred Spraul <manfred@colorfullife.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 1/7] nbd-trdump: Add support for WRITE_ZEROES and TRIM
Date: Thu, 13 Jan 2022 08:34:01 +0100
Message-Id: <20220113073407.4742-2-manfred@colorfullife.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113073407.4742-1-manfred@colorfullife.com>
References: <20220113073407.4742-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tCAG6haTniG.A.9hE.IY93hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1674
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220113073407.4742-2-manfred@colorfullife.com
Resent-Date: Thu, 13 Jan 2022 07:34:33 +0000 (UTC)

Support for pretty-printing NBD_CMD_TRIM and NBD_CMD_WRITE_ZEROES is
missing in nbd-trdump.

Thus:
- move the existing getcommandname() helper function into a new
  nbd-helper.h header file.
- use the helper function in nbd-trdump
- in nbd-trdump: change ctest from "char *" to "const char *"

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 nbd-helper.h | 33 +++++++++++++++++++++++++++++++++
 nbd-server.c | 26 +-------------------------
 nbd-trdump.c | 22 ++++------------------
 3 files changed, 38 insertions(+), 43 deletions(-)
 create mode 100644 nbd-helper.h

diff --git a/nbd-helper.h b/nbd-helper.h
new file mode 100644
index 0000000..7b7b75d
--- /dev/null
+++ b/nbd-helper.h
@@ -0,0 +1,33 @@
+#ifndef NBD_HELPER_H
+#define NBD_HELPER_H
+
+#include "nbd.h"
+
+/* Functions */
+
+/**
+ * Translate a command name into human readable form
+ *
+ * @param command The command number (after applying NBD_CMD_MASK_COMMAND)
+ * @return pointer to the command name
+ **/
+static inline const char * getcommandname(uint64_t command) {
+	switch (command) {
+	case NBD_CMD_READ:
+		return "NBD_CMD_READ";
+	case NBD_CMD_WRITE:
+		return "NBD_CMD_WRITE";
+	case NBD_CMD_DISC:
+		return "NBD_CMD_DISC";
+	case NBD_CMD_FLUSH:
+		return "NBD_CMD_FLUSH";
+	case NBD_CMD_TRIM:
+		return "NBD_CMD_TRIM";
+	case NBD_CMD_WRITE_ZEROES:
+		return "NBD_CMD_WRITE_ZEROES";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+#endif //NBD_HELPER_H
diff --git a/nbd-server.c b/nbd-server.c
index 1eff99d..3c3589e 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -129,6 +129,7 @@
 #include "netdb-compat.h"
 #include "backend.h"
 #include "treefiles.h"
+#include "nbd-helper.h"
 
 #ifdef WITH_SDP
 #include <sdp_inet.h>
@@ -285,31 +286,6 @@ struct generic_conf {
 	gint threads;		/**< maximum number of parallel threads we want to run */
 };
 
-/**
- * Translate a command name into human readable form
- *
- * @param command The command number (after applying NBD_CMD_MASK_COMMAND)
- * @return pointer to the command name
- **/
-static inline const char * getcommandname(uint64_t command) {
-	switch (command) {
-	case NBD_CMD_READ:
-		return "NBD_CMD_READ";
-	case NBD_CMD_WRITE:
-		return "NBD_CMD_WRITE";
-	case NBD_CMD_DISC:
-		return "NBD_CMD_DISC";
-	case NBD_CMD_FLUSH:
-		return "NBD_CMD_FLUSH";
-	case NBD_CMD_TRIM:
-		return "NBD_CMD_TRIM";
-	case NBD_CMD_WRITE_ZEROES:
-		return "NBD_CMD_WRITE_ZEROES";
-	default:
-		return "UNKNOWN";
-	}
-}
-
 #if HAVE_GNUTLS
 static int writeit_tls(gnutls_session_t s, void *buf, size_t len) {
 	ssize_t res;
diff --git a/nbd-trdump.c b/nbd-trdump.c
index 1185224..8131698 100644
--- a/nbd-trdump.c
+++ b/nbd-trdump.c
@@ -17,6 +17,7 @@
 #undef ISSERVER
 #include "cliserv.h"
 #include "nbd.h"
+#include "nbd-helper.h"
 
 static inline void doread(int f, void *buf, size_t len) {
         ssize_t res;
@@ -42,7 +43,7 @@ int main(int argc, char**argv) {
 	uint32_t command;
 	uint32_t len;
 	uint64_t offset;
-	char * ctext;
+	const char * ctext;
 	int readfd = 0; /* stdin */
 
 	if(argc > 1) {
@@ -68,23 +69,8 @@ int main(int argc, char**argv) {
 			len = ntohl(req.len);
 			command = ntohl(req.type);
 			
-			switch (command & NBD_CMD_MASK_COMMAND) {
-			case NBD_CMD_READ:
-				ctext="NBD_CMD_READ";
-				break;
-			case NBD_CMD_WRITE:
-				ctext="NBD_CMD_WRITE";
-				break;
-			case NBD_CMD_DISC:
-				ctext="NBD_CMD_DISC";
-				break;
-			case NBD_CMD_FLUSH:
-				ctext="NBD_CMD_FLUSH";
-				break;
-			default:
-				ctext="UNKNOWN";
-				break;
-			}
+			ctext = getcommandname(command & NBD_CMD_MASK_COMMAND);
+
 			printf("> H=%016llx C=0x%08x (%13s+%4s) O=%016llx L=%08x\n",
 			       (long long unsigned int) handle,
 			       command,
-- 
2.33.1

