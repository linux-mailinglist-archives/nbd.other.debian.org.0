Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C094964A2
	for <lists+nbd@lfdr.de>; Fri, 21 Jan 2022 18:57:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3462F2051D; Fri, 21 Jan 2022 17:57:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 21 17:57:42 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0F6C12051A
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Jan 2022 17:57:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1q1JF5JDY2oP for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Jan 2022 17:57:26 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wr1-x42e.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BC64F20506
	for <nbd@other.debian.org>; Fri, 21 Jan 2022 17:57:26 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id s4so175789wrb.0
        for <nbd@other.debian.org>; Fri, 21 Jan 2022 09:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G42NP/yQqSu/tacSskgxHPnwH/AMUX3h4vvcj5ZnxV4=;
        b=NJZ5DfiwTsTDiqmh5X3PkXi5GOsw5+/9uLyo+i44kM50b/vqFe7n0PUNVpIzKqjngV
         ittVC9B4Xl3OhKQ0+JtEA1om2BjHe4sq3NbuTtlX0VLtGUybpB5yBx4gU0QFTZk2QgfU
         I153Ge1Oa8KfL/9A+mh96Ixu00Tmk1c8LgqpqVxN7tXTcaWq1VVRTTvYuIRQ4I14QHpx
         X4NNHD6iz8ynQ+JqCcv2pv8ofIuOz5u1YktDae8Hh6qvj5/5ybpu0PDbUD2gXMCV7+Sk
         S/3fnK2JZqELKsAcC6+kxsSANqY4tQY0ny2TkTgCFvdMjlhJIb6k+I6Cg+DG26kPkdGy
         xeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G42NP/yQqSu/tacSskgxHPnwH/AMUX3h4vvcj5ZnxV4=;
        b=HKpHf0XpuBxjZBYhR0h2BFuMa4tVMdy1g1T1nrOFDHBu8ekxKfgfowaFVVh41QIyxz
         //sH5LR2I+m8FWk9zOG6iGaDlrZCE+hkSQwvqq6ZRuuLk2b/RMmqjcwX6zIWv6T69byW
         rspF4PQAyV7VLdtej+41ykx1WrDr0y/XLgMap19bhIL0t3AMt3U+G/tOgCkw88dMJW1d
         Jfa9GWvKhLl7HHRxmOxLQjePGQOiYzeZGbpm5nQuMARRl9AAzixD5JGad+3hSylQLjxv
         3DUcykiAaNnmuspqiNsQUQwAqVtJ2L0B8XzPyK67jw13dC7SKpsH2oAmf2z9+TSpOp88
         aMDA==
X-Gm-Message-State: AOAM532yhTd6cE/mf+LBGrxR8XP/ZIE7WeL++ernwd6M8LJUKBZ6tC52
	dNwjphiaheZns13pZRkJ7aNDoeT3Y7XTMzWq
X-Google-Smtp-Source: ABdhPJzrIxSQLLJ3Ec/aRo/8OD31If3PEOYa6g4JWDp3YbN68uQ9x7tqmrwKvMCShNYXjEKZOkqCvA==
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr4600623wrn.6.1642787843871;
        Fri, 21 Jan 2022 09:57:23 -0800 (PST)
Received: from localhost.localdomain (p200300d997063800e3418724bb165e30.dip0.t-ipconnect.de. [2003:d9:9706:3800:e341:8724:bb16:5e30])
        by smtp.googlemail.com with ESMTPSA id g4sm7166329wrd.12.2022.01.21.09.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 09:57:23 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>,
	Eric Blake <eblake@redhat.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 1/9] nbd-trdump: Add support for all commands
Date: Fri, 21 Jan 2022 18:57:03 +0100
Message-Id: <20220121175711.5083-2-manfred@colorfullife.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121175711.5083-1-manfred@colorfullife.com>
References: <20220121175711.5083-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <u87lChS9DAL.A.7hC.WQv6hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1694
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220121175711.5083-2-manfred@colorfullife.com
Resent-Date: Fri, 21 Jan 2022 17:57:42 +0000 (UTC)

From: Manfred Spraul <manfred.spraul@de.bosch.com>

Support for pretty-printing NBD_CMD_TRIM and NBD_CMD_WRITE_ZEROES is
missing in nbd-trdump.
In addition, only the commands right now implemented in nbd-server
are supported, instead of all commands defined in the protocol.

Thus:
- move the existing getcommandname() helper function into a new
  nbd-helper.h header file.
- use the helper function in nbd-trdump
- add all commands from proto.md.
- in nbd-trdump: change ctest from "char *" to "const char *"
  and increase number of characters in printf statement.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 nbd-helper.h | 32 ++++++++++++++++++++++++++++++++
 nbd-server.c | 26 +-------------------------
 nbd-trdump.c | 24 +++++-------------------
 nbd.h        |  5 ++++-
 4 files changed, 42 insertions(+), 45 deletions(-)
 create mode 100644 nbd-helper.h

diff --git a/nbd-helper.h b/nbd-helper.h
new file mode 100644
index 0000000..86ac1c2
--- /dev/null
+++ b/nbd-helper.h
@@ -0,0 +1,32 @@
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
+#define ENUM2STR(x)	case x: return #x
+static inline const char * getcommandname(uint32_t command) {
+	switch (command) {
+	ENUM2STR(NBD_CMD_READ);
+	ENUM2STR(NBD_CMD_WRITE);
+	ENUM2STR(NBD_CMD_DISC);
+	ENUM2STR(NBD_CMD_FLUSH);
+	ENUM2STR(NBD_CMD_TRIM);
+	ENUM2STR(NBD_CMD_CACHE);
+	ENUM2STR(NBD_CMD_WRITE_ZEROES);
+	ENUM2STR(NBD_CMD_BLOCK_STATUS);
+	ENUM2STR(NBD_CMD_RESIZE);
+	default:
+		return "UNKNOWN";
+	}
+}
+#undef ENUM2STR
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
index 1185224..d9c2ae5 100644
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
@@ -68,24 +69,9 @@ int main(int argc, char**argv) {
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
-			printf("> H=%016llx C=0x%08x (%13s+%4s) O=%016llx L=%08x\n",
+			ctext = getcommandname(command & NBD_CMD_MASK_COMMAND);
+
+			printf("> H=%016llx C=0x%08x (%20s+%4s) O=%016llx L=%08x\n",
 			       (long long unsigned int) handle,
 			       command,
 			       ctext,
diff --git a/nbd.h b/nbd.h
index 6326b6e..1e57b3e 100644
--- a/nbd.h
+++ b/nbd.h
@@ -35,7 +35,10 @@ enum {
 	NBD_CMD_DISC = 2,
 	NBD_CMD_FLUSH = 3,
 	NBD_CMD_TRIM = 4,
-	NBD_CMD_WRITE_ZEROES = 6
+	NBD_CMD_CACHE = 5,
+	NBD_CMD_WRITE_ZEROES = 6,
+	NBD_CMD_BLOCK_STATUS = 7,
+	NBD_CMD_RESIZE = 8
 };
 
 #define NBD_CMD_MASK_COMMAND 0x0000ffff
-- 
2.34.1

