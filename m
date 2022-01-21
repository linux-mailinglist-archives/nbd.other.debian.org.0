Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0601F4964A9
	for <lists+nbd@lfdr.de>; Fri, 21 Jan 2022 18:58:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B062D20513; Fri, 21 Jan 2022 17:58:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 21 17:58:14 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D4A5220508
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Jan 2022 17:57:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id AAqvQTVq6xl4 for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Jan 2022 17:57:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 57CA620519
	for <nbd@other.debian.org>; Fri, 21 Jan 2022 17:57:31 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v13so1064771wrv.10
        for <nbd@other.debian.org>; Fri, 21 Jan 2022 09:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zPjYjobK6REkxOIhaSyJcByRnRDmC8hmJT8il6E2D4M=;
        b=0Skm7p0pkiJnvXKP0b3VhJqWzNjoj0iDP0iFoIGc0JhA8/xmkzdjqrmFCQI+pTXCuC
         d0gwOf8iHHfifmhPPnhfdknE52QS/n5I5+pIve8uRnbaEu1Zu+krkzTp2qldY3pHWLiN
         CWxvIpYIPVm4Z81NhuiJEIdcueA9c5Wk70wpEpAM2zN1tTYg5rN2aPZJ3UCm6nMi+rNU
         A/Qvpv05cZf3up//70+f17utCcehZR9g4pLosGbdr2jAN+BHMB2YmpSMpaOldESyFJ/4
         A3lzs5Y70twU6Z37E5iTHwLTaZ6i/0SmmtwT/cwiuNlV3rGBy5bWRSg0p7ynzLauKT/n
         QdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zPjYjobK6REkxOIhaSyJcByRnRDmC8hmJT8il6E2D4M=;
        b=ydPcH3BRqGggQahrbdgWYszTOwaJc807YGpQOizawKYjb8q6pV1sz0LnLNJWJoLRLV
         PqZiULsdn+PrLsFm/CRDFa0RFzZ7aCLSI050xk//Am0T4HoEkj8xcUEvpfxL9jmUHAUp
         /bwCG02BJuMymBlP1gbfmpG4CXkGZic+ZEgAl7n5nQ+dSjQg2sW5TcFFxzfAyNH0W4KW
         KUZMlBwbIu8gTT3DRZhl2wM4pT47TvQSM1ZhZx5vgE6FU/PN7t+IoUnthmPRzGv+VO8G
         iNKDdyVF73rUoa2QmralU0yiL7Xwhj8YeEuZoCdxm+e4kgMfKhVWHqQMiaOi0oNK8/l8
         2lRA==
X-Gm-Message-State: AOAM5306Lr4PFec4D6Y7AONYkENuk2Fu7eGwBIL77KcadwzlBy3F53gY
	QTWCWLibJjIN/vsU2uLQdyZi/KXq0oNEQFRX
X-Google-Smtp-Source: ABdhPJyDW4xfITcr/Pfw9TJn/wmJe/wOkuZaIdGW90K0bB6QpH8aBryB64gJ68kPFuPd52vBXlJ4TA==
X-Received: by 2002:a05:6000:2a6:: with SMTP id l6mr4938283wry.323.1642787848638;
        Fri, 21 Jan 2022 09:57:28 -0800 (PST)
Received: from localhost.localdomain (p200300d997063800e3418724bb165e30.dip0.t-ipconnect.de. [2003:d9:9706:3800:e341:8724:bb16:5e30])
        by smtp.googlemail.com with ESMTPSA id g4sm7166329wrd.12.2022.01.21.09.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 09:57:28 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>,
	Eric Blake <eblake@redhat.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 7/9] nbd-trplay: Add simple CLI
Date: Fri, 21 Jan 2022 18:57:09 +0100
Message-Id: <20220121175711.5083-8-manfred@colorfullife.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121175711.5083-1-manfred@colorfullife.com>
References: <20220121175711.5083-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-__OUOxnEyG.A.frC.2Qv6hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1700
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220121175711.5083-8-manfred@colorfullife.com
Resent-Date: Fri, 21 Jan 2022 17:58:14 +0000 (UTC)

From: Manfred Spraul <manfred.spraul@de.bosch.com>

Add an initial CLI.
Planned CLI extentions:
- define what TRIM should do: keep unchanged, set to 0, take the content
  from another block.
- do not apply all sectors, instead behave like a write-back cache
  and drop a few random sectors.
- Create a log file of what was skipped/applied.
- Replay a log file.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 nbd-trplay.c | 125 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 107 insertions(+), 18 deletions(-)

diff --git a/nbd-trplay.c b/nbd-trplay.c
index 7af255d..19c7edf 100644
--- a/nbd-trplay.c
+++ b/nbd-trplay.c
@@ -1,14 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * nbd-trplay.c
  *
  * Takes an nbd transaction log file and replays some/all of the write commands.
+ *
+ * Based on nbd-trdump
+ * (C) Robert Bosch GmbH, 2021
  */
 
 #include <stdlib.h>
+#include <limits.h>
 #include <stdio.h>
 #include <string.h>
 #include <sys/time.h>
 #include <sys/types.h>
+#include <fcntl.h>
 #include <stdint.h>
 #include <stdbool.h>
 #include <unistd.h>
@@ -24,6 +30,16 @@ static char tmpbuf[BUFSIZE];
 
 static bool g_with_datalog = false;
 
+#define	VERBOSE_DEBUG	3
+#define	VERBOSE_DETAILS	2
+#define	VERBOSE_NORMAL	1
+#define	VERBOSE_OFF	0
+
+int g_verbose = 0;
+
+unsigned long g_blocksize = 512;
+unsigned long long g_max_blocks = ULLONG_MAX;
+
 static inline void doread(int f, void *buf, size_t len) {
         ssize_t res;
 
@@ -39,7 +55,7 @@ static inline void doread(int f, void *buf, size_t len) {
         }
 }
 
-int main(int argc, char**argv) {
+int main_loop(int logfd, int imagefd) {
 	struct nbd_request req;
 	struct nbd_reply rep;
 	uint32_t magic;
@@ -49,26 +65,14 @@ int main(int argc, char**argv) {
 	uint32_t len;
 	uint64_t offset;
 	const char * ctext;
-	int readfd = 0; /* stdin */
-
-	if(argc > 1) {
-		int retval=0;
-		if(strcmp(argv[1], "--help") && strcmp(argv[1], "-h")) {
-			printf("E: unknown option %s.\n", argv[1]);
-			retval=1;
-		}
-		printf("This is nbd-trplay, part of nbd %s.\n", PACKAGE_VERSION);
-		printf("Use: %s < transactionlog\n", argv[0]);
-		return retval;
-	}
 
 	while (1) {
 		/* Read a request or reply from the transaction file */
-		doread(readfd, &magic, sizeof(magic));
+		doread(logfd, &magic, sizeof(magic));
 		magic = ntohl(magic);
 		switch (magic) {
 		case NBD_REQUEST_MAGIC:
-			doread(readfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
+			doread(logfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
 			handle = ntohll(*((long long int *)(req.handle)));
 			offset = ntohll(req.from);
 			len = ntohl(req.len);
@@ -90,14 +94,14 @@ int main(int argc, char**argv) {
 
 					if (tmplen > BUFSIZE)
 						tmplen = BUFSIZE;
-					doread(readfd, tmpbuf, tmplen);
+					doread(logfd, tmpbuf, tmplen);
 					len -= tmplen;
 				}
 			}
 
 			break;
 		case NBD_REPLY_MAGIC:
-			doread(readfd, sizeof(magic)+(char *)(&rep), sizeof(struct nbd_reply)-sizeof(magic));
+			doread(logfd, sizeof(magic)+(char *)(&rep), sizeof(struct nbd_reply)-sizeof(magic));
 			handle = ntohll(*((long long int *)(rep.handle)));
 			error = ntohl(rep.error);
 
@@ -107,7 +111,7 @@ int main(int argc, char**argv) {
 			break;
 
 		case NBD_TRACELOG_MAGIC:
-			doread(readfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
+			doread(logfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
 			handle = ntohll(*((long long int *)(req.handle)));
 			offset = ntohll(req.from);
 			len = ntohl(req.len);
@@ -144,3 +148,88 @@ int main(int argc, char**argv) {
 	/* never reached */
 	return 0;
 }
+
+static void show_help(const char *progname) {
+	printf("\n");
+	printf("This is nbd-trplay, part of nbd %s.\n", PACKAGE_VERSION);
+	printf("Use: %s -i <image> -l <log> [-m <max blocks>] [-b <block size]\n", progname);
+	printf(" Applies up to <max blocks> elements from file <log> to disk image <image>.\n");
+	printf(" Command line parameters:\n");
+	printf(" <image>: name of the initial image file.\n");
+	printf(" <log>: nbd trace log. Must contain actual data (datalog=true).\n");
+	printf(" <block size>: device block size. Default 512.\n");
+	printf(" <max blocks>: where to stop the replay. Default all.\n");
+	printf("  -v: Increase verbose level. Specify multiple times to increase further.\n");
+
+}
+
+
+int main(int argc, char **argv) {
+	int opt;
+	int imagefd = -1;
+	int logfd = -1;
+
+	printf("%s -i <image> -l <log> [-m <max blocks>] [-b <block size]\n", argv[0]);
+
+	while ((opt = getopt(argc, argv, "i:l:m:b:hv")) != -1) {
+		switch(opt) {
+		case 'v':
+			g_verbose++;
+			break;
+		default:
+		case '?':
+		case 'h':
+			show_help(argv[0]);
+			return 0;
+		case 'm':
+			g_max_blocks = strtoull(optarg, NULL, 0);
+			if (g_max_blocks == 0) {
+				printf("  Invalid block count.\n");
+				return 1;
+			}
+			break;
+		case 'b':
+			g_blocksize = strtoul(optarg, NULL, 0);
+			if (g_blocksize == 0) {
+				printf("  Invalid block size.\n");
+				return 1;
+			}
+			if (g_blocksize > BUFSIZE) {
+				printf(" block size is larger than %d, not supported.\n", (int)BUFSIZE);
+				return 1;
+			}
+			break;
+		case 'i':
+			imagefd = open(optarg, O_RDWR, 0);
+			if (imagefd == -1) {
+				printf("  Opening disk image failed, errno %d.", errno);
+				return 1;
+			}
+			break;
+		case 'l':
+			logfd = open(optarg, O_RDONLY, 0);
+			if (logfd == -1) {
+				printf("  Opening disk image failed, errno %d.", errno);
+				return 1;
+			}
+			break;
+		}
+	}
+
+	if (logfd == -1) {
+		printf("  Log file not specified, this is mandatory.\n");
+		return 1;
+	}
+	if (imagefd == -1) {
+		printf("  Disk image not specified, this is mandatory.\n");
+		return 1;
+	}
+
+	if (g_verbose >= VERBOSE_NORMAL) {
+		printf(" block size: %ld bytes (0x%lx bytes).\n", g_blocksize, g_blocksize);
+		printf(" max blocks to apply: %llx.\n", g_max_blocks);
+	}
+	main_loop(logfd, imagefd);
+
+	return 0;
+}
-- 
2.34.1

