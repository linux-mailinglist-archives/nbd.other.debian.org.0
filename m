Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98748D2E6
	for <lists+nbd@lfdr.de>; Thu, 13 Jan 2022 08:34:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E557420637; Thu, 13 Jan 2022 07:34:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 13 07:34:42 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 153D420634
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jan 2022 07:34:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1O4SjhAp-zC1 for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jan 2022 07:34:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0023920639
	for <nbd@other.debian.org>; Thu, 13 Jan 2022 07:34:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r28so8484673wrc.3
        for <nbd@other.debian.org>; Wed, 12 Jan 2022 23:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4quEaA3CDGRhEJCfB1uVoloiAdfQcS7dQnwWuxY1JyU=;
        b=u4jHcyODbYyJVyLdyp0GglP6rHH1IKSGsAqznt6toastmYBjfP4eMMFIhjxoFmBTCl
         b7C37GFJOUZkrQRPYX1yGjpfleW0L4ydwVnXXSSdnpFgGRu/RcLBGigE3yXljrxKP1ve
         uPitjY2YBFIeTwhMAPtg54r/9nwWJNRsPcafxs7vCNn0PjxO/CYKd3Mq9QOUBFEE9nzH
         Av4n6NmZtB1q1zo9euUcHcNahjXEJKpGh6uO5atx1JKMfxBS5VW0WZ0d/3yqU5c2PjOA
         74LpgyNq+MTKBOpFn3yl1GCcyGSYBHh8LYa0Hugz4o/Gq1T0BPR0es/AMjVOiZbdPRfR
         3zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4quEaA3CDGRhEJCfB1uVoloiAdfQcS7dQnwWuxY1JyU=;
        b=5Vq6pSRKkkSaFWp1Y+PWCMBZBpq9W6V28b+hXrgyk2Jct7wIdDxhMXUy65ADzTZWzd
         V2so+jEPrSXL9ZaA46SgtnfEMW21pDuUta1TOxRo29afM7Hbvpag5HuP/DDCQ5KwuoBb
         9XPW4LBVnZpNZFL+uCOxuI1u7839qfJh2VBylm3xYC5+sRQXg53LS+xj0w7xUSD2mJef
         tA9Ri7Y3YCnJmcEz+bMBd+a9sbgGQGZLvrgzVbUnUHROSmTEoxnybxxNAeKIwx0w1Oo+
         O694er7hwNQ2FerQTltbEzBnlAdfuDEIYqCbcFnir8d7zvIgMR/sY69G4GNyESegtsKi
         cYUg==
X-Gm-Message-State: AOAM531n4xUxO3HLwCx9YG+d2gEFs3Te3EkaGy2wHriHv/PNSyHD4MVl
	JjjW2FV29gpZyay8xBndkYaSbbAh+OtGUcWq
X-Google-Smtp-Source: ABdhPJyfxdnTJU/WHe5zGVSXsHlxjzTH7bFeEo5e5WHQtNAQfS+ldujkiqaVqhbImSonHb7O+yuawg==
X-Received: by 2002:a5d:588c:: with SMTP id n12mr2725224wrf.363.1642059256321;
        Wed, 12 Jan 2022 23:34:16 -0800 (PST)
Received: from localhost.localdomain (p200300d99704790072586cbefa5b7408.dip0.t-ipconnect.de. [2003:d9:9704:7900:7258:6cbe:fa5b:7408])
        by smtp.googlemail.com with ESMTPSA id t7sm1740662wrx.48.2022.01.12.23.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 23:34:15 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Manfred Spraul <manfred@colorfullife.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 3/7] nbd-server: Add locking around transaction log writes
Date: Thu, 13 Jan 2022 08:34:03 +0100
Message-Id: <20220113073407.4742-4-manfred@colorfullife.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113073407.4742-1-manfred@colorfullife.com>
References: <20220113073407.4742-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <j_0UvF6YnjK.A.ioE.SY93hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1677
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220113073407.4742-4-manfred@colorfullife.com
Resent-Date: Thu, 13 Jan 2022 07:34:42 +0000 (UTC)

Bugfix for the previous patch:
nbd-server uses multiple processes and within each process multiple threads.
Thus: Locking is needed, to ensure that the data in the transaction log
is not corrupted.

Proposal: use sem_open():

sem_open() is probably the simplest solution.

Alternatives:
- shm_open() + a shared pthread_mutex

- fcntl() for cross process locking, and a ptrace_mutex for intra-process
  locking.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 nbd-server.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++---
 nbdsrv.h     |  3 +++
 2 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/nbd-server.c b/nbd-server.c
index 8c1fba0..5cd86b0 100644
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
@@ -399,6 +397,48 @@ static inline void socket_closed_negotiate(CLIENT* client) {
 	err("Negotiation failed: %m");
 }
 
+static void alloc_logsem(CLIENT *client) {
+	struct stat fdinfo;
+	int ret;
+
+	client->logsem = SEM_FAILED;
+	/* no transaction log -> no semaphore */
+	if (client->transactionlogfd == -1)
+		return;
+
+	ret = fstat(client->transactionlogfd, &fdinfo);
+	if (ret == -1) {
+		close(client->transactionlogfd);
+		client->transactionlogfd = -1;
+		return;
+	}
+	snprintf(client->semname, sizeof(client->semname), "/nbd-server-%llx-%llx",
+				(unsigned long long)fdinfo.st_dev,
+				(unsigned long long)fdinfo.st_ino);
+	client->logsem = sem_open(client->semname, O_CREAT, 0600, 1);
+	if (client->logsem == SEM_FAILED) {
+		close(client->transactionlogfd);
+		client->transactionlogfd = -1;
+	}
+}
+
+static void free_logsem(CLIENT *client) {
+	if (client->transactionlogfd == -1)
+		return;
+	if (client->logsem == SEM_FAILED)
+		return;
+	sem_close(client->logsem);
+	client->logsem = SEM_FAILED;
+	sem_unlink(client->semname);
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
@@ -422,6 +462,7 @@ static inline void finalize_client(CLIENT* client) {
 	g_thread_pool_free(tpool, FALSE, TRUE);
 	do_run(client->server->postrun, client->exportname);
 	if(client->transactionlogfd != -1) {
+		free_logsem(client);
 		close(client->transactionlogfd);
 		client->transactionlogfd = -1;
 	}
@@ -2061,6 +2102,8 @@ static bool commit_client(CLIENT* client, SERVER* server) {
 				-1) {
 			msg(LOG_INFO, "Could not open transactionlog %s, moving on without it",
 					client->server->transactionlog);
+		} else {
+			alloc_logsem(client);
 		}
 	}
 
@@ -2767,6 +2810,7 @@ end:
 static int mainloop_threaded(CLIENT* client) {
 	struct nbd_request* req;
 	struct work_package* pkg;
+	int write_data = false;
 
 	DEBUG("Entering request loop\n");
 	while(1) {
@@ -2774,12 +2818,16 @@ static int mainloop_threaded(CLIENT* client) {
 
 		socket_read(client, req, sizeof(struct nbd_request));
 		if(client->transactionlogfd != -1) {
+			lock_logsem(client);
 			if(((ntohl(req->type) & NBD_CMD_MASK_COMMAND) == NBD_CMD_WRITE) &&
 					(client->server->flags & F_DATALOG) &&
 					!(client->server->flags & F_SPLICE)) {
 				req->type = htonl(ntohl(req->type)|NBD_CMD_FLAG_DATALOG);
+				write_data = true;
 			}
 			writeit(client->transactionlogfd, req, sizeof(struct nbd_request));
+			if (!write_data)
+				unlock_logsem(client);
 		}
 
 		req->from = ntohll(req->from);
@@ -2802,8 +2850,11 @@ static int mainloop_threaded(CLIENT* client) {
 #endif
 				socket_read(client, pkg->data, req->len);
 
-			if (req->type & NBD_CMD_FLAG_DATALOG)
+			if (write_data) {
 				writeit(client->transactionlogfd, pkg->data, req->len);
+				unlock_logsem(client);
+				write_data = false;
+			}
 		}
 		if(req->type == NBD_CMD_DISC) {
 			finalize_client(client);
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
2.33.1

