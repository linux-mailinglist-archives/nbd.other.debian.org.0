Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFC348D2E9
	for <lists+nbd@lfdr.de>; Thu, 13 Jan 2022 08:34:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D65C620312; Thu, 13 Jan 2022 07:34:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 13 07:34:58 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 35FB32063A
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jan 2022 07:34:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pqxSPMaRJ3cp for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jan 2022 07:34:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wr1-x434.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8840D2063D
	for <nbd@other.debian.org>; Thu, 13 Jan 2022 07:34:21 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e9so8496226wra.2
        for <nbd@other.debian.org>; Wed, 12 Jan 2022 23:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AapVXZGSQTkpJegXKMfPXs6SGmJFbKsbyYqwCTCyqJs=;
        b=as/hd/T/Y5J2pvcQTtIkMY7eK1MYCE+Z3QQxhtIVewlOMH0neW4wFTHX+W1eOtoYQk
         /UBoAwUxOFRocebNsYtynstjIUrQ7gyEzsNMVlAqnGdDvjmFlRWmjYO7Q1wH5JB81DoN
         G6qd5vgdCt7Q+PDcg4/tRZKTnZ4IQtaLb/+0lfpVxIem9ZQv2m8kTWw8JpiVsmWsHURD
         JFnirdosAOUuALhrGgrcbi8VxSPsKCXj7JW5ZluN1jfm+QEu2bSvhxFPUTb4qc78b1aq
         +8seyfIVPWXjmT75jQ0MwV7H2Opf1iO1fWNZ65gx7QQ7/qKv1w+4WVNHCE2pI7AanqKD
         NUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AapVXZGSQTkpJegXKMfPXs6SGmJFbKsbyYqwCTCyqJs=;
        b=2iykpkV1gmNcCvOY/m+5zQtKREn7NXbc1IrS9R1AsurpmtHyZVAy7DKRqvPWOBCOjl
         SwcPLyCRD8IH3zQM2RVUl5Cpo4gZtwDRXzx+y1L5KFNl+v9YEjXoe8T6Pzern+OgdXLN
         JqWi9LcMVCHc3T3kaPEROuTUgDm+XdKDNYVASKTqUZV0eZZ0cWlAYb3okUseQCT2Yvbd
         CsL+6F4p63oootZjtc0zKs35D2w9a7MHZpRZTj90tBd+4OFjf7s+Zzka2kVI2IXjbRcz
         +xYtyMMKH3NSsV7YqQTrQyeENnDz7cO34RWhAQgPbB7nvgm9QqrK1FjapfCOzDODw+fe
         AqLg==
X-Gm-Message-State: AOAM530f15f1OAg/JVb3/RO+voS+pSZW91jU1mZnqoe03tiCoE1gwACX
	hpZRFuO8ux0r7pMIYzpmf7vpq45NzvLYKbKg
X-Google-Smtp-Source: ABdhPJx+wwrOkx3buPL8BSKER9gdzx2ffcuTmoKPDmC4avqI27rjCR2dSB575I/sOpUExdH9161gVw==
X-Received: by 2002:a05:6000:1843:: with SMTP id c3mr2835468wri.316.1642059258920;
        Wed, 12 Jan 2022 23:34:18 -0800 (PST)
Received: from localhost.localdomain (p200300d99704790072586cbefa5b7408.dip0.t-ipconnect.de. [2003:d9:9704:7900:7258:6cbe:fa5b:7408])
        by smtp.googlemail.com with ESMTPSA id t7sm1740662wrx.48.2022.01.12.23.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 23:34:18 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Manfred Spraul <manfred@colorfullife.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 7/7] nbd-trplay: 1st usable version
Date: Thu, 13 Jan 2022 08:34:07 +0100
Message-Id: <20220113073407.4742-8-manfred@colorfullife.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113073407.4742-1-manfred@colorfullife.com>
References: <20220113073407.4742-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pgXz8kTqkVP.A.awE.iY93hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1680
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220113073407.4742-8-manfred@colorfullife.com
Resent-Date: Thu, 13 Jan 2022 07:34:58 +0000 (UTC)

Initial version.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 nbd-trplay.c | 150 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 124 insertions(+), 26 deletions(-)

diff --git a/nbd-trplay.c b/nbd-trplay.c
index fa13e49..1a46ea2 100644
--- a/nbd-trplay.c
+++ b/nbd-trplay.c
@@ -25,7 +25,7 @@
 #include "nbd-helper.h"
 
 #define BUFSIZE	131072
-static char tmpbuf[BUFSIZE];
+static char g_tmpbuf[BUFSIZE];
 
 #define	VERBOSE_DEBUG	3
 #define	VERBOSE_DETAILS	2
@@ -35,15 +35,20 @@ static char tmpbuf[BUFSIZE];
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
@@ -52,6 +57,97 @@ static inline void doread(int f, void *buf, size_t len) {
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
+		if (command & NBD_CMD_FLAG_DATALOG) {
+				while (len > 0) {
+					uint32_t tmplen = len;
+
+					if (tmplen > BUFSIZE)
+						tmplen = BUFSIZE;
+					doread(logfd, g_tmpbuf, tmplen);
+					len -= tmplen;
+				}
+		}
+		break;
+	case NBD_CMD_WRITE:
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
@@ -65,7 +161,7 @@ int main_loop(int logfd, int imagefd) {
 
 	while (1) {
 		/* Read a request or reply from the transaction file */
-		doread(logfd, &magic, sizeof(magic));
+		doread(logfd, (char*) &magic, sizeof(magic));
 		magic = ntohl(magic);
 		switch (magic) {
 		case NBD_REQUEST_MAGIC:
@@ -77,23 +173,16 @@ int main_loop(int logfd, int imagefd) {
 
 			ctext = getcommandname(command & NBD_CMD_MASK_COMMAND);
 
-			printf("> H=%016llx C=0x%08x (%13s+%4s) O=%016llx L=%08x\n",
-			       (long long unsigned int) handle,
-			       command,
-			       ctext,
-			       (command & NBD_CMD_FLAG_FUA)?"FUA":"NONE",
-			       (long long unsigned int) offset,
-			       len);
-			if (command & NBD_CMD_FLAG_DATALOG) {
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
 		case NBD_REPLY_MAGIC:
@@ -101,14 +190,16 @@ int main_loop(int logfd, int imagefd) {
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
 
 		default:
-			printf("? Unknown transaction type %08x\n",magic);
-			break;
+			printf("? Unknown transaction type %08x, replay impossible.\n",magic);
+			exit(1);
 		}
 
 	}
@@ -139,6 +230,9 @@ int main(int argc, char **argv) {
 	printf("%s -i <image> -l <log> [-m <max blocks>] [-b <block size]\n", argv[0]);
 
 	while ((opt = getopt(argc, argv, "i:l:m:b:hv")) != -1) {
+		if (g_verbose >= VERBOSE_DEBUG) {
+			printf("getopt: opt %c, optarg %s.\n", (char)opt, optarg);
+		}
 		switch(opt) {
 		case 'v':
 			g_verbose++;
@@ -154,6 +248,7 @@ int main(int argc, char **argv) {
 				printf("  Invalid block count.\n");
 				return 1;
 			}
+			break;
 		case 'b':
 			g_blocksize = strtoul(optarg, NULL, 0);
 			if (g_blocksize == 0) {
@@ -164,18 +259,21 @@ int main(int argc, char **argv) {
 				printf(" block size is larger than %d, not supported.\n", (int)BUFSIZE);
 				return 1;
 			}
+			break;
 		case 'i':
 			imagefd = open(optarg, O_RDWR, 0);
 			if (imagefd == -1) {
 				printf("  Opening disk image failed, errno %d.", errno);
 				return 1;
 			}
+			break;
 		case 'l':
 			logfd = open(optarg, O_RDONLY, 0);
 			if (logfd == -1) {
 				printf("  Opening disk image failed, errno %d.", errno);
 				return 1;
 			}
+			break;
 		}
 	}
 
@@ -190,7 +288,7 @@ int main(int argc, char **argv) {
 
 	if (g_verbose >= VERBOSE_NORMAL) {
 		printf(" block size: %ld bytes (0x%lx bytes).\n", g_blocksize, g_blocksize);
-		printf(" max blocks to apply: %llx.\n", g_max_blocks);
+		printf(" max blocks to apply: %llu (0x%llx).\n", g_max_blocks, g_max_blocks);
 	}
 	main_loop(logfd, imagefd);
 
-- 
2.33.1

