Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C048D2E8
	for <lists+nbd@lfdr.de>; Thu, 13 Jan 2022 08:34:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BAF3D20312; Thu, 13 Jan 2022 07:34:51 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 13 07:34:51 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DAAAA20623
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jan 2022 07:34:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bXLe7NG6Vc0T for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jan 2022 07:34:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D50D62063C
	for <nbd@other.debian.org>; Thu, 13 Jan 2022 07:34:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v6so8423881wra.8
        for <nbd@other.debian.org>; Wed, 12 Jan 2022 23:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Jq4G27lcCaw0/bMN35sNuGKWJWIyDIVXe9Wx8ttyaY=;
        b=dGn4gLWPYrZOiWNIK20FuET06LEaTfsBBePNhRqshAQMchN+jop7txzArnmKbiH4Xf
         eyIM7HmW91iY9fU83bu1sNmMt79gvjYI57uLw+mJQrBIF0I14/vqidQ1SISCPfFBlrPL
         RH+d+YlKJgEUtqLJ1FahlG/RJ5n9eAl3lOOI1nk47gVHWlc/SGLc57QQjmbUmUAzYe4P
         odgV0JrU8gIn/Sv/lBGDSThaG/6wz4BO7OvwYN7HnOOdmHhqXSQwbVE7YJL9vwYkBZyJ
         1tEWO6haZAZfBJVdKtQAuMJE0IQwuuNMMRXSPxKSAODj/iLWhmOpxBnLorbwHYRHRXST
         ROKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Jq4G27lcCaw0/bMN35sNuGKWJWIyDIVXe9Wx8ttyaY=;
        b=brJ3BAyOZcTChTpUzCKwn7c32QBinJrGJcECaNlR6QQ1ROv5x11okrniVbixI10i8g
         oHIoi6x0gLud/FPOeFYvicJx591WRaK+Ooay9tNhVkGdgeTXu34WhkDdlZtZMNaeP6Vu
         R4Ew1hHRUlUhvdtbRJRS6ZfX/l87pHCoPeQllblninzLifWtldp3CemvJ067nzLvzOvG
         mRR2zL3l8pJrRIG7JpjBq4OMf0iLVRropZ7rlNuhho62yeEXQzdoUiEg6XZk7BgX1Sky
         d/9bX2iZTsUvF6x+2YkpGnrJW/ad3qBWQ6BAhu2oe8AdLvsaQVj6cw2Cr16hU0cEBkYW
         QimQ==
X-Gm-Message-State: AOAM530t+YqgeNemeW1Ugv4VhGvM0uI58G3rVpQPALYAMYGPJar+0dbG
	HOIIA/2zymsMMrWlkMLN0pK6VbTBt0cOjTiN
X-Google-Smtp-Source: ABdhPJzNVz0q55EAFi5sT7a423BiATuSNVkCPw3INeJfB0/DMAprqTRN8YGraZ6tzpiQghb6TwIBvg==
X-Received: by 2002:a05:6000:168e:: with SMTP id y14mr2868806wrd.492.1642059258272;
        Wed, 12 Jan 2022 23:34:18 -0800 (PST)
Received: from localhost.localdomain (p200300d99704790072586cbefa5b7408.dip0.t-ipconnect.de. [2003:d9:9704:7900:7258:6cbe:fa5b:7408])
        by smtp.googlemail.com with ESMTPSA id t7sm1740662wrx.48.2022.01.12.23.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 23:34:17 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Manfred Spraul <manfred@colorfullife.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 6/7] nbd-trplay: Add simple CLI
Date: Thu, 13 Jan 2022 08:34:06 +0100
Message-Id: <20220113073407.4742-7-manfred@colorfullife.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113073407.4742-1-manfred@colorfullife.com>
References: <20220113073407.4742-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SNNRVCCNdRO.A.PtE.bY93hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1679
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220113073407.4742-7-manfred@colorfullife.com
Resent-Date: Thu, 13 Jan 2022 07:34:51 +0000 (UTC)

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
 nbd-trplay.c | 119 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 102 insertions(+), 17 deletions(-)

diff --git a/nbd-trplay.c b/nbd-trplay.c
index e31bb3b..fa13e49 100644
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
 #include <unistd.h>
 #include "config.h"
@@ -21,6 +27,16 @@
 #define BUFSIZE	131072
 static char tmpbuf[BUFSIZE];
 
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
 
@@ -36,7 +52,7 @@ static inline void doread(int f, void *buf, size_t len) {
         }
 }
 
-int main(int argc, char**argv) {
+int main_loop(int logfd, int imagefd) {
 	struct nbd_request req;
 	struct nbd_reply rep;
 	uint32_t magic;
@@ -46,26 +62,14 @@ int main(int argc, char**argv) {
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
@@ -86,14 +90,14 @@ int main(int argc, char**argv) {
 
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
 
@@ -111,3 +115,84 @@ int main(int argc, char**argv) {
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
+		case 'i':
+			imagefd = open(optarg, O_RDWR, 0);
+			if (imagefd == -1) {
+				printf("  Opening disk image failed, errno %d.", errno);
+				return 1;
+			}
+		case 'l':
+			logfd = open(optarg, O_RDONLY, 0);
+			if (logfd == -1) {
+				printf("  Opening disk image failed, errno %d.", errno);
+				return 1;
+			}
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
2.33.1

