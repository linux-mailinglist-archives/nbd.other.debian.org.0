Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B43A4964AB
	for <lists+nbd@lfdr.de>; Fri, 21 Jan 2022 18:58:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EF1EB20513; Fri, 21 Jan 2022 17:58:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 21 17:58:22 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0A4F320519
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Jan 2022 17:57:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id p2smXebm0lmk for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Jan 2022 17:57:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2DAA220506
	for <nbd@other.debian.org>; Fri, 21 Jan 2022 17:57:32 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id f17so1083950wrx.1
        for <nbd@other.debian.org>; Fri, 21 Jan 2022 09:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vlkk0pMppbxF3YPVtshnOt3xKDFM9atPM5l+LLmGAEE=;
        b=uZgJyLLpZnNEhDnBTlbE2Cmt155WAGutmQEAzvR9P8N52XujMkouwIt1CtHsrCHYfc
         PZNH9ItodtD+jMu8KqavH8ua6peowTWY8no/S3FrjPVNQO38hmMKyAV3itam55/eDZFE
         K5XrAiPJx2GFEYtn+aCSgwf5JptsEyp9vU5J6RqDS8jkLLmy9zaoEzZQvk5gLMHqIFdg
         YjTH30rLKiOHRFWn9xPQCeauAPMUdal5aOzn78YHXaKzy6gM14bAgbdFL4Y9vmVeCYpH
         VH/if2xtE9dbeCIKQILBrwbjxaehPlEL9ntohoPlbR9kho1cdjKBzV1EVByio1oQJ/AH
         CFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vlkk0pMppbxF3YPVtshnOt3xKDFM9atPM5l+LLmGAEE=;
        b=K4u6smVGBF9Y/OyF+PpoHLQwIvbI/0R9/Fzlrz4VElzBQuBmbLkDOLKEbnxor8Sn+H
         ZhxZaf6vonfjMDRmiW0y4joDysYG4oZeev/7AgJZHlNtrKltCRfLv+vLqAtB8E2dLkZs
         BdbJ2jXnBDjGNw8cQdAMFl80WP0R7QgsAPA3TRnSbw9dQ/4LdLRVMxe759TWSD93yFYf
         hZkCF0dqkX8OdIscPj/EmCvtguMgOXhntn2OeloiuL5mmtzVJ0RPMLh2MuBFiqKxYngJ
         BJHvX96A2p3RUCgDxPcsl9moxTEzjrXjwNUE9oVym8BMBIEzuPUxiS4QBJne2KJ6FZLC
         tX5Q==
X-Gm-Message-State: AOAM533Hmg1q0lQ/tZZ1UKuAbsCSpU1wzVpdlHtSvpzebgKWr4tfAOgT
	Wgw77E7WnClfYUwyxDj28+aHQNGWeA0mIOcx
X-Google-Smtp-Source: ABdhPJxKgf3i6gk6+jJVYkLC1S5YqtzwMh3yidieCX/UvTmwvNYsY40uhXpBYGxh3LdMwYM01a6IKw==
X-Received: by 2002:a05:6000:3cf:: with SMTP id b15mr4689035wrg.425.1642787849564;
        Fri, 21 Jan 2022 09:57:29 -0800 (PST)
Received: from localhost.localdomain (p200300d997063800e3418724bb165e30.dip0.t-ipconnect.de. [2003:d9:9706:3800:e341:8724:bb16:5e30])
        by smtp.googlemail.com with ESMTPSA id g4sm7166329wrd.12.2022.01.21.09.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 09:57:29 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>,
	Eric Blake <eblake@redhat.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 8/9] nbd-trplay: 1st usable version
Date: Fri, 21 Jan 2022 18:57:10 +0100
Message-Id: <20220121175711.5083-9-manfred@colorfullife.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121175711.5083-1-manfred@colorfullife.com>
References: <20220121175711.5083-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <y91cyMmOk6O.A.EuC.-Qv6hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1702
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220121175711.5083-9-manfred@colorfullife.com
Resent-Date: Fri, 21 Jan 2022 17:58:22 +0000 (UTC)

From: Manfred Spraul <manfred.spraul@de.bosch.com>

Initial version.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 nbd-trplay.c | 158 ++++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 125 insertions(+), 33 deletions(-)

diff --git a/nbd-trplay.c b/nbd-trplay.c
index 19c7edf..143d8cb 100644
--- a/nbd-trplay.c
+++ b/nbd-trplay.c
@@ -26,7 +26,7 @@
 #include "nbd-helper.h"
 
 #define BUFSIZE	131072
-static char tmpbuf[BUFSIZE];
+static char g_tmpbuf[BUFSIZE];
 
 static bool g_with_datalog = false;
 
@@ -38,15 +38,20 @@ static bool g_with_datalog = false;
 int g_verbose = 0;
 
 unsigned long g_blocksize = 512;
+unsigned long long g_cur_blocks = 0;
 unsigned long long g_max_blocks = ULLONG_MAX;
 
-static inline void doread(int f, void *buf, size_t len) {
+static inline void doread(int f, char *buf, size_t len) {
         ssize_t res;
 
         while(len>0) {
                 if((res=read(f, buf, len)) <=0) {
-                        if (!res)
+                        if (!res) {
+				/* normal exit, end of transaction log. */
+				printf("End of transaction log, total %llu blocks written.\n",
+					(unsigned long long) g_cur_blocks);
 				exit(0);
+			}
 			perror ("Error reading transactions");
 			exit(1);
                 }
@@ -55,6 +60,91 @@ static inline void doread(int f, void *buf, size_t len) {
         }
 }
 
+static inline void dowriteimage(int imagefd, const char *buf, size_t len, off_t offset) {
+	ssize_t res;
+
+	if (g_verbose >= VERBOSE_DETAILS) {
+		printf("block %llu (0x%llx): writing to offset %lld (0x%llx), len %lld (0x%llx).\n",
+			g_cur_blocks, g_cur_blocks,
+			(long long)offset, (long long) offset,
+			(long long) len, (long long) len);
+	}
+
+	while(len>0) {
+		if((res=pwrite(imagefd, buf, len, offset)) <=0) {
+			if (!res)
+				exit(0);
+			perror ("Error writing to image file");
+			exit(1);
+		}
+		len-=res;
+		buf+=res;
+		offset+=res;
+	}
+}
+
+
+void process_command(uint32_t command, uint64_t offset, uint32_t len, int logfd, int imagefd)
+{
+	if (offset % g_blocksize != 0) {
+		printf("  Got offset %llu (0x%llx), not a multiple of the block size %ld (0x%lx).\n",
+				(unsigned long long)offset, (unsigned long long)offset, g_blocksize, g_blocksize);
+		exit(1);
+	}
+	if (len % g_blocksize != 0) {
+		printf("  Got len %lu (0x%lx), not a multiple of the block size %ld (0x%lx).\n",
+				(unsigned long) len, (unsigned long) len, g_blocksize, g_blocksize);
+		exit(1);
+	}
+
+	switch (command & NBD_CMD_MASK_COMMAND) {
+	case NBD_CMD_READ:
+	case NBD_CMD_DISC:
+	case NBD_CMD_FLUSH:
+		/* READ, DISCONNECT, FLUSH: nothing to do */
+		break;
+	case NBD_CMD_WRITE:
+		if (!g_with_datalog) {
+			printf("  NBD_CMD_WRITE without data log, replay impossible.\n");
+			exit(1);
+		}
+		while (len > 0) {
+			doread(logfd, g_tmpbuf, g_blocksize);
+			dowriteimage(imagefd, g_tmpbuf, g_blocksize, offset);
+
+			offset+=g_blocksize;
+			len-=g_blocksize;
+			g_cur_blocks++;
+
+			if (g_cur_blocks == g_max_blocks) {
+				printf("g_max_blocks (%llu, 0x%llx) reached!.\n", g_max_blocks, g_max_blocks);
+				exit(0);
+			}
+		}
+		break;
+	case NBD_CMD_TRIM:
+	case NBD_CMD_WRITE_ZEROES:
+		while (len > 0) {
+			memset(g_tmpbuf, 0, g_blocksize);
+			dowriteimage(imagefd, g_tmpbuf, g_blocksize, offset);
+
+			offset+=g_blocksize;
+			len-=g_blocksize;
+			g_cur_blocks++;
+
+			if (g_cur_blocks == g_max_blocks) {
+				printf("g_max_blocks (%llu, 0x%llx) reached!.\n", g_max_blocks, g_max_blocks);
+				exit(0);
+			}
+		}
+		break;
+	default:
+		printf("  Unexpected command %d (0x%x), replay impossible.\n",
+			(unsigned int) command, (unsigned int) command);
+		exit(1);
+	}
+}
+
 int main_loop(int logfd, int imagefd) {
 	struct nbd_request req;
 	struct nbd_reply rep;
@@ -68,7 +158,7 @@ int main_loop(int logfd, int imagefd) {
 
 	while (1) {
 		/* Read a request or reply from the transaction file */
-		doread(logfd, &magic, sizeof(magic));
+		doread(logfd, (char*) &magic, sizeof(magic));
 		magic = ntohl(magic);
 		switch (magic) {
 		case NBD_REQUEST_MAGIC:
@@ -80,34 +170,29 @@ int main_loop(int logfd, int imagefd) {
 
 			ctext = getcommandname(command & NBD_CMD_MASK_COMMAND);
 
-			printf("> H=%016llx C=0x%08x (%20s+%4s) O=%016llx L=%08x\n",
-			       (long long unsigned int) handle,
-			       command,
-			       ctext,
-			       (command & NBD_CMD_FLAG_FUA)?"FUA":"NONE",
-			       (long long unsigned int) offset,
-			       len);
-			if (((command & NBD_CMD_MASK_COMMAND) == NBD_CMD_WRITE) &&
-					g_with_datalog) {
-				while (len > 0) {
-					uint32_t tmplen = len;
-
-					if (tmplen > BUFSIZE)
-						tmplen = BUFSIZE;
-					doread(logfd, tmpbuf, tmplen);
-					len -= tmplen;
-				}
+			if (g_verbose >= VERBOSE_NORMAL) {
+				printf("> H=%016llx C=0x%08x (%13s+%4s) O=%016llx L=%08x\n",
+				       (long long unsigned int) handle,
+				       command,
+				       ctext,
+				       (command & NBD_CMD_FLAG_FUA)?"FUA":"NONE",
+				       (long long unsigned int) offset,
+				       len);
 			}
+			process_command(command, offset, len, logfd, imagefd);
 
 			break;
+
 		case NBD_REPLY_MAGIC:
 			doread(logfd, sizeof(magic)+(char *)(&rep), sizeof(struct nbd_reply)-sizeof(magic));
 			handle = ntohll(*((long long int *)(rep.handle)));
 			error = ntohl(rep.error);
 
-			printf("< H=%016llx E=0x%08x\n",
-			       (long long unsigned int) handle,
-			       error);
+			if (g_verbose >= VERBOSE_NORMAL) {
+				printf("< H=%016llx E=0x%08x\n",
+				       (long long unsigned int) handle,
+				       error);
+			}
 			break;
 
 		case NBD_TRACELOG_MAGIC:
@@ -119,17 +204,20 @@ int main_loop(int logfd, int imagefd) {
 
 			ctext = gettracelogname(command);
 
-			printf("TRACE_OPTION C=0x%08x (%23s) O=%016llx L=%08x\n",
-			       command,
-			       ctext,
-			       (long long unsigned int) offset,
-			       len);
+			if (g_verbose >= VERBOSE_NORMAL) {
+				printf("TRACE_OPTION C=0x%08x (%23s) O=%016llx L=%08x\n",
+				       command,
+				       ctext,
+				       (long long unsigned int) offset,
+				       len);
+			}
 			if (offset == NBD_TRACELOG_FROM_MAGIC) {
 
 				switch (command) {
 				case NBD_TRACELOG_SET_DATALOG:
 					g_with_datalog = !!len;
-					printf("TRACE_OPTION DATALOG set to %d.\n", (int)g_with_datalog);
+					if (g_verbose >= VERBOSE_NORMAL)
+						printf("TRACE_OPTION DATALOG set to %d.\n", (int)g_with_datalog);
 					break;
 				default:
 					printf("TRACE_OPTION ? Unknown type\n");
@@ -139,9 +227,10 @@ int main_loop(int logfd, int imagefd) {
 			}
 			break;
 
+
 		default:
-			printf("? Unknown transaction type %08x\n",magic);
-			break;
+			printf("? Unknown transaction type %08x, replay impossible.\n", magic);
+			exit(1);
 		}
 
 	}
@@ -172,6 +261,9 @@ int main(int argc, char **argv) {
 	printf("%s -i <image> -l <log> [-m <max blocks>] [-b <block size]\n", argv[0]);
 
 	while ((opt = getopt(argc, argv, "i:l:m:b:hv")) != -1) {
+		if (g_verbose >= VERBOSE_DEBUG) {
+			printf("getopt: opt %c, optarg %s.\n", (char)opt, optarg);
+		}
 		switch(opt) {
 		case 'v':
 			g_verbose++;
@@ -227,7 +319,7 @@ int main(int argc, char **argv) {
 
 	if (g_verbose >= VERBOSE_NORMAL) {
 		printf(" block size: %ld bytes (0x%lx bytes).\n", g_blocksize, g_blocksize);
-		printf(" max blocks to apply: %llx.\n", g_max_blocks);
+		printf(" max blocks to apply: %llu (0x%llx).\n", g_max_blocks, g_max_blocks);
 	}
 	main_loop(logfd, imagefd);
 
-- 
2.34.1

