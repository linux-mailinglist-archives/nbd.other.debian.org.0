Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F0948D2EA
	for <lists+nbd@lfdr.de>; Thu, 13 Jan 2022 08:35:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 63F522050C; Thu, 13 Jan 2022 07:35:00 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 13 07:35:00 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,URI_NOVOWEL,WORD_WITHOUT_VOWELS
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 696012063C
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jan 2022 07:34:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.38 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, URI_NOVOWEL=0.5, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wwAucl8lCnA5 for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jan 2022 07:34:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wr1-x42d.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5953E2063B
	for <nbd@other.debian.org>; Thu, 13 Jan 2022 07:34:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d19so8566366wrb.0
        for <nbd@other.debian.org>; Wed, 12 Jan 2022 23:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F0sQBe9kAXApNGN/0mMeNnALnNSM8HEubwbBacgVxVo=;
        b=pnIhlUQoiiBuyaFsWD9ET0oruXJOCh5ldqxNbPiINtCrZHkSuBR5KyCSjyRAAmR2JZ
         04xxy1QDrtkE3CUtCEkGnuIMJzfM3zoNDc2pzSxcwzRWXNm8SfcDeJ35lRPfNJ4pYv58
         A6zhBHbOfHSNKJTLLKdbWGyBPECHZTUVty5/KjhbYPpO1XrdOq9bkruCDUplsiBx+1aJ
         RqCf40EzbMs5b2LcdcpPa1TQ7jiT5pWE/P+2ZpnUI/+8+o+Z52gSjG25J3dLI1H/ZOw2
         9r3Yy8bV8WwyLjw1XkgJfm0H6lZDK3bwJbjTQfPnYr01Ow1blEoiH3jl3EWWNdEjSWOA
         3lrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F0sQBe9kAXApNGN/0mMeNnALnNSM8HEubwbBacgVxVo=;
        b=B+63jLnNkhCOw4rl18QIKpE2YXR/LyhR0Ww01LsXCRnqxIr5A+phOv/4bXr9hAW1wW
         dTcT8YbiPak5CP/mstp3wE32SfRkGE7NN7ZIaUYMzoRfCaB7al98OeZP9bey2GW//5ve
         Nf6/9yBtrD5qevArb9K/FenUaK83Ot4Cca157zAyYnjGB+Lu+ZQ/EFckO5iZPI6JL5if
         ZriZANi7ScHCOKui44ficLqxrRIzZcSpcyaWR9tSxTULLJNb4y4lL/eGbqtbzC0OWVCY
         sfhY6oDudmj93bHHI4qba8VGaBOIyuW9Pn3PL2/k2rrNqYMcF2Ef1WCI1hQUQ6xuELAJ
         uIZA==
X-Gm-Message-State: AOAM532scHelvA1ZJGgyhhVM24BzKQY2K1LcU8IpTt2q1KAypPeO9D/m
	Tgcp7UOY0SHZhRwnPnNuHvdRzKMV7BlPOLIK
X-Google-Smtp-Source: ABdhPJzEETaDdJSgWv6a+Cdvo2ex7pkoYjtmT43gggkQv1mzWyeGyFjO5g3oewdSEQnlse1qcGNoIA==
X-Received: by 2002:a5d:4538:: with SMTP id j24mr2804095wra.470.1642059257675;
        Wed, 12 Jan 2022 23:34:17 -0800 (PST)
Received: from localhost.localdomain (p200300d99704790072586cbefa5b7408.dip0.t-ipconnect.de. [2003:d9:9704:7900:7258:6cbe:fa5b:7408])
        by smtp.googlemail.com with ESMTPSA id t7sm1740662wrx.48.2022.01.12.23.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 23:34:17 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Manfred Spraul <manfred@colorfullife.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 5/7] Add a new utility: nbd-trplay
Date: Thu, 13 Jan 2022 08:34:05 +0100
Message-Id: <20220113073407.4742-6-manfred@colorfullife.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113073407.4742-1-manfred@colorfullife.com>
References: <20220113073407.4742-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <X8zeog3SCL.A.gxE.kY93hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1681
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220113073407.4742-6-manfred@colorfullife.com
Resent-Date: Thu, 13 Jan 2022 07:35:00 +0000 (UTC)

Initial commit for nbd-trplay, a command to replay parts of an nbd
trace file.

Changes:
- Just copy nbd-trdump.
- Changes:
   * nbd-trdump replaced with nbd-trplay.
   * Whitespace in empty lines removed.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 Makefile.am  |   5 ++-
 nbd-trplay.c | 113 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 117 insertions(+), 1 deletion(-)
 create mode 100644 nbd-trplay.c

diff --git a/Makefile.am b/Makefile.am
index fde6ad7..14d264e 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,6 +1,6 @@
 ACLOCAL_AMFLAGS = -I support
 SUBDIRS = . man doc tests systemd gznbd
-bin_PROGRAMS = nbd-server nbd-trdump
+bin_PROGRAMS = nbd-server nbd-trdump nbd-trplay
 EXTRA_PROGRAMS = nbd-client make-integrityhuge
 noinst_LTLIBRARIES = libnbdsrv.la libcliserv.la libnbdclt.la
 libcliserv_la_SOURCES = cliserv.h cliserv.c
@@ -9,14 +9,17 @@ client_srcs = nbd-client.c cliserv.h nbd-netlink.h
 nbd_server_SOURCES = nbd-server.c cliserv.h lfs.h nbd.h nbdsrv.h backend.h \
 	netdb-compat.h
 nbd_trdump_SOURCES = nbd-trdump.c cliserv.h nbd.h
+nbd_trplay_SOURCES = nbd-trplay.c cliserv.h nbd.h
 client_flags = @CFLAGS@
 nbd_server_CFLAGS = @CFLAGS@ @GLIB_CFLAGS@
 nbd_trdump_CFLAGS = @CFLAGS@ @GLIB_CFLAGS@
+nbd_trplay_CFLAGS = @CFLAGS@ @GLIB_CFLAGS@
 libnbdsrv_la_SOURCES = nbdsrv.c nbdsrv.h treefiles.c treefiles.h
 libnbdsrv_la_CFLAGS = @CFLAGS@ @GLIB_CFLAGS@
 client_libs = libcliserv.la libnbdclt.la
 nbd_server_LDADD = @GLIB_LIBS@ libnbdsrv.la libcliserv.la
 nbd_trdump_LDADD = libcliserv.la
+nbd_trplay_LDADD = libcliserv.la
 make_integrityhuge_SOURCES = make-integrityhuge.c cliserv.h nbd.h nbd-debug.h
 EXTRA_DIST = maketr CodingStyle autogen.sh README.md support/genver.sh
 if GNUTLS
diff --git a/nbd-trplay.c b/nbd-trplay.c
new file mode 100644
index 0000000..e31bb3b
--- /dev/null
+++ b/nbd-trplay.c
@@ -0,0 +1,113 @@
+/*
+ * nbd-trplay.c
+ *
+ * Takes an nbd transaction log file and replays some/all of the write commands.
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/time.h>
+#include <sys/types.h>
+#include <stdint.h>
+#include <unistd.h>
+#include "config.h"
+/* We don't want to do syslog output in this program */
+#undef ISSERVER
+#include "cliserv.h"
+#include "nbd.h"
+#include "nbd-helper.h"
+
+#define BUFSIZE	131072
+static char tmpbuf[BUFSIZE];
+
+static inline void doread(int f, void *buf, size_t len) {
+        ssize_t res;
+
+        while(len>0) {
+                if((res=read(f, buf, len)) <=0) {
+                        if (!res)
+				exit(0);
+			perror ("Error reading transactions");
+			exit(1);
+                }
+                len-=res;
+                buf+=res;
+        }
+}
+
+int main(int argc, char**argv) {
+	struct nbd_request req;
+	struct nbd_reply rep;
+	uint32_t magic;
+	uint64_t handle;
+	uint32_t error;
+	uint32_t command;
+	uint32_t len;
+	uint64_t offset;
+	const char * ctext;
+	int readfd = 0; /* stdin */
+
+	if(argc > 1) {
+		int retval=0;
+		if(strcmp(argv[1], "--help") && strcmp(argv[1], "-h")) {
+			printf("E: unknown option %s.\n", argv[1]);
+			retval=1;
+		}
+		printf("This is nbd-trplay, part of nbd %s.\n", PACKAGE_VERSION);
+		printf("Use: %s < transactionlog\n", argv[0]);
+		return retval;
+	}
+
+	while (1) {
+		/* Read a request or reply from the transaction file */
+		doread(readfd, &magic, sizeof(magic));
+		magic = ntohl(magic);
+		switch (magic) {
+		case NBD_REQUEST_MAGIC:
+			doread(readfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
+			handle = ntohll(*((long long int *)(req.handle)));
+			offset = ntohll(req.from);
+			len = ntohl(req.len);
+			command = ntohl(req.type);
+
+			ctext = getcommandname(command & NBD_CMD_MASK_COMMAND);
+
+			printf("> H=%016llx C=0x%08x (%13s+%4s) O=%016llx L=%08x\n",
+			       (long long unsigned int) handle,
+			       command,
+			       ctext,
+			       (command & NBD_CMD_FLAG_FUA)?"FUA":"NONE",
+			       (long long unsigned int) offset,
+			       len);
+			if (command & NBD_CMD_FLAG_DATALOG) {
+				while (len > 0) {
+					uint32_t tmplen = len;
+
+					if (tmplen > BUFSIZE)
+						tmplen = BUFSIZE;
+					doread(readfd, tmpbuf, tmplen);
+					len -= tmplen;
+				}
+			}
+
+			break;
+		case NBD_REPLY_MAGIC:
+			doread(readfd, sizeof(magic)+(char *)(&rep), sizeof(struct nbd_reply)-sizeof(magic));
+			handle = ntohll(*((long long int *)(rep.handle)));
+			error = ntohl(rep.error);
+
+			printf("< H=%016llx E=0x%08x\n",
+			       (long long unsigned int) handle,
+			       error);
+			break;
+
+		default:
+			printf("? Unknown transaction type %08x\n",magic);
+			break;
+		}
+
+	}
+	/* never reached */
+	return 0;
+}
-- 
2.33.1

