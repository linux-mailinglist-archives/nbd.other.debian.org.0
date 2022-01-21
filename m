Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CD84964A5
	for <lists+nbd@lfdr.de>; Fri, 21 Jan 2022 18:57:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5A58A20513; Fri, 21 Jan 2022 17:57:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 21 17:57:50 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 92AB5204EB
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Jan 2022 17:57:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ghD8xzlHidL8 for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Jan 2022 17:57:28 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0E9DB20513
	for <nbd@other.debian.org>; Fri, 21 Jan 2022 17:57:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l25so1085973wrb.13
        for <nbd@other.debian.org>; Fri, 21 Jan 2022 09:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DyeGcNGEbValvyHiIq6YmSjZ1mkkej8EJTaSaayi3wE=;
        b=ECXhHZsdLtIpYbtBll+Q0a8zGemlC7TSgbpfkHsjdxehcqumrxD9m/+VEDoCyl5b1J
         UPQiVadR3u7favfsWErO19ii/07VbgkqaZIsukziD75iPE/Z/t3vJbMgAfL6FcGTejsU
         wXNTpNHDgp3+4Bbo3bD1X7jseUtVNNcrcYWiEegbw0OHBGT70Pjl9mnOblgQbh365GJC
         r3w3u+fUqR0PIWF+kZustm7c0pNbSbXYRsaA7WI8rEdFXLZrl64duLCRor2FbRCzKhvi
         3dOlaRopnB9lbTIxX9EIfVnS9luX7hhEJP0IFMYVVKEWynIphjONVZw0OdyrHHRYHA1T
         eZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DyeGcNGEbValvyHiIq6YmSjZ1mkkej8EJTaSaayi3wE=;
        b=4NbLzLQRTMaiqIuqmUVN1L216Ct820hPh9OrqKigeTNY+dK2gxD1Jw+W8HGZDMl4BD
         AwHUGPHoDhOBpkhjlEuVT4ZXITV8TVmUVnyug58XAyDztOw3TAhHWFaoFibgs4+tunen
         oGwug6bB3kCc4hwjYlGheLxSNvRzd+T6vwZ7zofEfLj3GAWZENlDePPW0xXSVbVTI/JK
         yUtljj8e8ESCWNXLn0vECnDNyaGlnQ3CUwsND0y13Cts0JGImr85qO1Ib7MPllENAPjR
         CdUWrbX9Ucvr70CTrMYWVle0pc46JD19Phgxo04wfu66KeCpNBUoSok2uDQQyFE8MQD/
         eWeA==
X-Gm-Message-State: AOAM532fx/wXeib4y3NUFCSjYnP8rQIa9oU+ptnVQpwWrmdcgDwD4eBn
	RKNH4Gdhf9lOKHIFEgEu+Z4Wzv7E1vqBkL74
X-Google-Smtp-Source: ABdhPJweX+EX5c0Y50hy78gA/r7yEUm4BbLgyyp3Tecr6yLiqVJVvxmmtAk6U/v930LGBd/451+f/Q==
X-Received: by 2002:a5d:618b:: with SMTP id j11mr4769549wru.619.1642787845531;
        Fri, 21 Jan 2022 09:57:25 -0800 (PST)
Received: from localhost.localdomain (p200300d997063800e3418724bb165e30.dip0.t-ipconnect.de. [2003:d9:9706:3800:e341:8724:bb16:5e30])
        by smtp.googlemail.com with ESMTPSA id g4sm7166329wrd.12.2022.01.21.09.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 09:57:25 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>,
	Eric Blake <eblake@redhat.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 3/9] nbd-server: Add locking around transaction log writes
Date: Fri, 21 Jan 2022 18:57:05 +0100
Message-Id: <20220121175711.5083-4-manfred@colorfullife.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121175711.5083-1-manfred@colorfullife.com>
References: <20220121175711.5083-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_i7CA5JS7II.A.jkC.eQv6hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1696
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220121175711.5083-4-manfred@colorfullife.com
Resent-Date: Fri, 21 Jan 2022 17:57:58 +0000 (UTC)

From: Manfred Spraul <manfred.spraul@de.bosch.com>

Bugfix for the previous patch:
nbd-server uses multiple processes and within each process multiple threads.
Thus: Locking is needed, to ensure that the data in the transaction log
is not corrupted.

Solution: Use sem_open(), the simplest solution.

Alternatives:
- shm_open() + a shared pthread_mutex

- fcntl() for cross process locking, and a ptrace_mutex for intra-process
  locking.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 nbd-server.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++------
 nbdsrv.h     |  3 +++
 2 files changed, 69 insertions(+), 8 deletions(-)

diff --git a/nbd-server.c b/nbd-server.c
index dbb4e74..5ee9bbe 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -120,8 +120,6 @@
 #include <pthread.h>
 #endif
 
-#include <semaphore.h>
-
 /* used in cliserv.h, so must come first */
 #define MY_NAME "nbd_server"
 #include "cliserv.h"
@@ -399,6 +397,26 @@ static inline void socket_closed_negotiate(CLIENT* client) {
 	err("Negotiation failed: %m");
 }
 
+static void cleanup_transactionlog(CLIENT *client) {
+
+	if (client->transactionlogfd != -1) {
+		close(client->transactionlogfd);
+		client->transactionlogfd = -1;
+	}
+	if (client->logsem != SEM_FAILED) {
+		sem_close(client->logsem);
+		client->logsem = SEM_FAILED;
+		sem_unlink(client->semname);
+	}
+}
+
+static void lock_logsem(CLIENT *client) {
+	sem_wait(client->logsem);
+}
+static void unlock_logsem(CLIENT *client) {
+	sem_post(client->logsem);
+}
+
 /**
  * Run a command. This is used for the ``prerun'' and ``postrun'' config file
  * options
@@ -421,10 +439,9 @@ int do_run(gchar* command, gchar* file) {
 static inline void finalize_client(CLIENT* client) {
 	g_thread_pool_free(tpool, FALSE, TRUE);
 	do_run(client->server->postrun, client->exportname);
-	if(client->transactionlogfd != -1) {
-		close(client->transactionlogfd);
-		client->transactionlogfd = -1;
-	}
+	if(client->transactionlogfd != -1)
+		cleanup_transactionlog(client);
+
 	if(client->server->flags & F_COPYONWRITE) {
 		unlink(client->difffilename);
 	}
@@ -1995,6 +2012,7 @@ void send_export_info(CLIENT* client, SERVER* server, bool maybe_zeroes) {
   *
   * The function does all things required for the transaction log:
   * - Create a new log file.
+  * - allocate the posix semaphore for synchronization.
   * - Report if a log file already exists.
   * - If needed add a header to the log.
   *
@@ -2004,7 +2022,10 @@ void send_export_info(CLIENT* client, SERVER* server, bool maybe_zeroes) {
   * up correctly
   */
 static void setup_transactionlog(CLIENT *client) {
+	struct stat fdinfo;
+	int ret;
 
+	/* 1) create the file */
 	if((client->transactionlogfd =
 				open(client->server->transactionlog,
 					O_WRONLY | O_CREAT,
@@ -2013,6 +2034,8 @@ static void setup_transactionlog(CLIENT *client) {
 		msg(LOG_INFO, "Could not open transactionlog %s, moving on without it",
 				client->server->transactionlog);
 	}
+
+	/* 2) If needed, write flags */
 	if (client->server->flags & F_DATALOG) {
 		struct nbd_request req;
 		int ret;
@@ -2031,6 +2054,26 @@ static void setup_transactionlog(CLIENT *client) {
 			client->transactionlogfd = -1;
 		}
 	}
+
+	/* 3) Allocate the semaphore used for locking */
+	ret = fstat(client->transactionlogfd, &fdinfo);
+	if (ret == -1) {
+		msg(LOG_INFO, "Could not stat transactionlog %s, moving on without it",
+			client->server->transactionlog);
+		close(client->transactionlogfd);
+		client->transactionlogfd = -1;
+		return;
+	}
+	snprintf(client->semname, sizeof(client->semname), "/nbd-server-%llx-%llx",
+				(unsigned long long)fdinfo.st_dev,
+				(unsigned long long)fdinfo.st_ino);
+	client->logsem = sem_open(client->semname, O_CREAT, 0600, 1);
+	if (client->logsem == SEM_FAILED) {
+		msg(LOG_INFO, "Could not allocate semaphore for transactionlog %s, moving on without it",
+			client->server->transactionlog);
+		close(client->transactionlogfd);
+		client->transactionlogfd = -1;
+	}
 }
 
 /**
@@ -2395,6 +2438,8 @@ CLIENT* negotiate(int net, GArray* servers, struct generic_conf *genconf) {
 	client->socket_read = socket_read_notls;
 	client->socket_write = socket_write_notls;
 	client->socket_closed = socket_closed_negotiate;
+	client->transactionlogfd = -1;
+	client->logsem = SEM_FAILED;
 
 	assert(servers != NULL);
 	socket_write(client, INIT_PASSWD, 8);
@@ -2802,20 +2847,32 @@ end:
 static int mainloop_threaded(CLIENT* client) {
 	struct nbd_request* req;
 	struct work_package* pkg;
+	int write_data = false;
 
 	DEBUG("Entering request loop\n");
 	while(1) {
 		req = calloc(sizeof (struct nbd_request), 1);
 
 		socket_read(client, req, sizeof(struct nbd_request));
+
 		if(client->transactionlogfd != -1) {
+			lock_logsem(client);
 			writeit(client->transactionlogfd, req, sizeof(struct nbd_request));
+			if(((ntohl(req->type) & NBD_CMD_MASK_COMMAND) == NBD_CMD_WRITE) &&
+					(client->server->flags & F_DATALOG) &&
+					!(client->server->flags & F_SPLICE)) {
+				write_data = true;
+			} else {
+				write_data = false;
+				unlock_logsem(client);
+			}
 		}
 
 		req->from = ntohll(req->from);
 		req->type = ntohl(req->type);
 		req->len = ntohl(req->len);
 
+
 		if(req->magic != htonl(NBD_REQUEST_MAGIC))
 			err("Protocol error: not enough magic.");
 
@@ -2832,9 +2889,10 @@ static int mainloop_threaded(CLIENT* client) {
 #endif
 				socket_read(client, pkg->data, req->len);
 
-			if ((client->server->flags & F_DATALOG) &&
-					!(client->server->flags & F_SPLICE)) {
+			if (write_data) {
 				writeit(client->transactionlogfd, pkg->data, req->len);
+				unlock_logsem(client);
+				write_data = false;
 			}
 		}
 		if(req->type == NBD_CMD_DISC) {
diff --git a/nbdsrv.h b/nbdsrv.h
index b84e26a..85c6073 100644
--- a/nbdsrv.h
+++ b/nbdsrv.h
@@ -9,6 +9,7 @@
 
 #include <sys/socket.h>
 #include <sys/types.h>
+#include <semaphore.h>
 #include "nbd.h"
 
 /* Structures */
@@ -70,6 +71,8 @@ typedef struct _client {
 	uint32_t difffilelen;     /**< number of pages in difffile */
 	uint32_t *difmap;	     /**< see comment on the global difmap for this one */
 	int transactionlogfd;/**< fd for transaction log */
+	char semname[100]; /**< name of the posix sem that protects access to the transaction log */
+	sem_t *logsem;	 /**< posix sem that protects access to the transaction log */
 	int clientfeats;     /**< Features supported by this client */
 	pthread_mutex_t lock; /**< socket lock */
 	void *tls_session; /**< TLS session context. Is NULL unless STARTTLS
-- 
2.34.1

