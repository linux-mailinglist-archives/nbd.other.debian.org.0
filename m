Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E448D2E5
	for <lists+nbd@lfdr.de>; Thu, 13 Jan 2022 08:34:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DA2542063B; Thu, 13 Jan 2022 07:34:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 13 07:34:41 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 4C6DD20636
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jan 2022 07:34:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id encHUOHsQe7q for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jan 2022 07:34:18 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .colorfullife. - helo: .mail-wr1-x435.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5C7E020634
	for <nbd@other.debian.org>; Thu, 13 Jan 2022 07:34:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o3so8419907wrh.10
        for <nbd@other.debian.org>; Wed, 12 Jan 2022 23:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TtJ3CW2U1g39zHo3kjiHXQJjjGyfr1qj7zTH7IRZFIE=;
        b=a66jWkyF1EqfMg0gfOYuOuU/nTT6AvssGaPBfAD4A9/5Me03gigQJPY8uOzb3GyGd+
         1k2BQKqIYIXAR5TwyEB6ao8GTZR6bq2HJ9fyvQDL2H8YzQ8lhe0sfzuEjQdwCL31nP2n
         R06ojaixAJvieTSKfu9r7mdVxvpfqCKWCAufgBqmnHC8RJ7Wlt8Io9vYPgemsekduhE7
         0kcLx/PmjidxnpLLna3jTBmZn+xPVtsrsWmbqmSghUaQo664Qkkqnl8HW1Tv2sw60uB9
         PvQ16X7bq5/qgJAfZN43awVnSitgk1JjETdHoGqVmjVf+oJmlOeM8qijz7BHmfmYoGjM
         4gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TtJ3CW2U1g39zHo3kjiHXQJjjGyfr1qj7zTH7IRZFIE=;
        b=4/gN7snR+AL/h24s7LvIs1j5uP7xxoYlilQmMJ6CUverKl3XZQALHbQoCJ96Hkqn26
         kGTlAfwcRHgpHFZGx8SFKxWtWieELXS2Gbd+VJHhSjyMvtQOhl1TueA9NvwIRnMlWebD
         7YnOJuasymD6ffiMDTxG/4j+Jmmb/6f8v0d/QALYRQJ8PsbxcFeHr+r10Wurk/gAZSKx
         eHckF9V7vaCa+f3L5OOnGXUxXT6+sBGomPv1vmtzTX1yQFqeMmDR63yZtQcduIyB+kSE
         CzhwAfTkNkvgY/Sl0Hnesg2KgvTJpIKYP9TNrVyW6QSThINaGuIx5W0ASvCg6Ebll1u3
         6dQA==
X-Gm-Message-State: AOAM533LulxGXSFPnLlkmtU7k+q9r5kLFjOMzn/pnnLXEuEWgEFo6f7i
	NzM+UMfn2B8CnN3oke3QWRicR6UwZ7YC7uOo
X-Google-Smtp-Source: ABdhPJwcaKImH2U98N9vJSIvtXERivQ5pI21y1BoqAdJZLV5COEgIGhRIkZxLUeuGyANHbjZjBDmKQ==
X-Received: by 2002:a05:6000:144c:: with SMTP id v12mr2821112wrx.218.1642059255659;
        Wed, 12 Jan 2022 23:34:15 -0800 (PST)
Received: from localhost.localdomain (p200300d99704790072586cbefa5b7408.dip0.t-ipconnect.de. [2003:d9:9704:7900:7258:6cbe:fa5b:7408])
        by smtp.googlemail.com with ESMTPSA id t7sm1740662wrx.48.2022.01.12.23.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 23:34:15 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Manfred Spraul <manfred@colorfullife.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 2/7] nbd-server, nbd-trdump: Add support for logging actual data
Date: Thu, 13 Jan 2022 08:34:02 +0100
Message-Id: <20220113073407.4742-3-manfred@colorfullife.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220113073407.4742-1-manfred@colorfullife.com>
References: <20220113073407.4742-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bIAy2uay09P.A.CnE.RY93hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1676
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220113073407.4742-3-manfred@colorfullife.com
Resent-Date: Thu, 13 Jan 2022 07:34:41 +0000 (UTC)

The datalog generated by nbd-server contains only the requests
received by the server, not the actual data to be written.

This patch adds support to write the actual data.

As details:
- It is configurable, the default behavior is not changed.
- It adds a NBD_CMD_FLAG_DATALOG flag: I think this is the simplest
  way to mark that actual data wil follow in the log.
  As clients must not use a feature that is not exposed by the server,
  and as the server fails commands with unexpected flags, the approach
  should be safe. Obviously, if the protocol is extended so that 14
  flags are needed, then it will bite us.
- It is an incompatible change: Current nbd-trdump utilities
  will just fail/produce bad output when called with a new
  log file, without a proper error message.
- The change does not add a header to the datalog. I.e.:
  If we sometime in the future extend the log again, it will
  be again an incompatible change without a proper error
  message
- nbd-trdump supports to dump also the messages sent by the
  server. Unfortunately, the current server does not log
  the sent messages. This change does not fix this.

Known bugs:
Locking is missing. If multiple clients connect, then the data log
will be unusable.

Plan: Use a named posix semaphore (sem_open()).
Given the multi-process, multi-thread model, with a single fd shared
by everyone, this is probably simpler than trying to find a reliable
flock()/fcntl()/pthread_mutex_lock() combination.
Alternative: shm_open()+a shared pthread_mutex.

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 nbd-helper.h |  4 ++++
 nbd-server.c | 20 +++++++++++++++++++-
 nbd-trdump.c | 13 +++++++++++++
 nbdsrv.h     |  1 +
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/nbd-helper.h b/nbd-helper.h
index 7b7b75d..0d0d1b9 100644
--- a/nbd-helper.h
+++ b/nbd-helper.h
@@ -3,6 +3,10 @@
 
 #include "nbd.h"
 
+/* Constants and macros */
+
+#define NBD_CMD_FLAG_DATALOG ((1 << 14) << NBD_CMD_SHIFT)
+
 /* Functions */
 
 /**
diff --git a/nbd-server.c b/nbd-server.c
index 3c3589e..8c1fba0 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -786,6 +786,7 @@ GArray* parse_cfile(gchar* f, struct generic_conf *const genconf, bool expect_ge
 		{ "rotational",	FALSE,  PARAM_BOOL,	&(s.flags),		F_ROTATIONAL },
 		{ "temporary",	FALSE,  PARAM_BOOL,	&(s.flags),		F_TEMPORARY },
 		{ "trim",	FALSE,  PARAM_BOOL,	&(s.flags),		F_TRIM },
+		{ "datalog",	FALSE,  PARAM_BOOL,	&(s.flags),		F_DATALOG },
 		{ "listenaddr", FALSE,  PARAM_STRING,   &(s.listenaddr),	0 },
 		{ "maxconnections", FALSE, PARAM_INT,	&(s.max_connections),	0 },
 		{ "force_tls",	FALSE,	PARAM_BOOL,	&(s.flags),		F_FORCEDTLS },
@@ -982,6 +983,15 @@ GArray* parse_cfile(gchar* f, struct generic_conf *const genconf, bool expect_ge
 			g_key_file_free(cfile);
 			return NULL;
 		}
+		/* We can't mix datalog and splice. */
+		if ((s.flags & F_DATALOG) && (s.flags & F_SPLICE)) {
+			g_set_error(e, NBDS_ERR, NBDS_ERR_CFILE_INVALID_SPLICE,
+				    "Cannot mix datalog with splice for an export in group %s",
+				    groups[i]);
+			g_array_free(retval, TRUE);
+			g_key_file_free(cfile);
+			return NULL;
+		}
 		/* Don't need to free this, it's not our string */
 		virtstyle=NULL;
 		/* Don't append values for the [generic] group */
@@ -2692,7 +2702,7 @@ static void handle_request(gpointer data, gpointer user_data) {
 	struct nbd_reply rep;
 	int err = EINVAL;
 
-	if(flags & ~(NBD_CMD_FLAG_FUA | NBD_CMD_FLAG_NO_HOLE)) {
+	if(flags & ~(NBD_CMD_FLAG_FUA | NBD_CMD_FLAG_NO_HOLE | NBD_CMD_FLAG_DATALOG)) {
 		msg(LOG_ERR, "E: received invalid flag %d on command %d, ignoring", flags, type);
 		goto error;
 	}
@@ -2764,6 +2774,11 @@ static int mainloop_threaded(CLIENT* client) {
 
 		socket_read(client, req, sizeof(struct nbd_request));
 		if(client->transactionlogfd != -1) {
+			if(((ntohl(req->type) & NBD_CMD_MASK_COMMAND) == NBD_CMD_WRITE) &&
+					(client->server->flags & F_DATALOG) &&
+					!(client->server->flags & F_SPLICE)) {
+				req->type = htonl(ntohl(req->type)|NBD_CMD_FLAG_DATALOG);
+			}
 			writeit(client->transactionlogfd, req, sizeof(struct nbd_request));
 		}
 
@@ -2786,6 +2801,9 @@ static int mainloop_threaded(CLIENT* client) {
 			else
 #endif
 				socket_read(client, pkg->data, req->len);
+
+			if (req->type & NBD_CMD_FLAG_DATALOG)
+				writeit(client->transactionlogfd, pkg->data, req->len);
 		}
 		if(req->type == NBD_CMD_DISC) {
 			finalize_client(client);
diff --git a/nbd-trdump.c b/nbd-trdump.c
index 8131698..ae32adc 100644
--- a/nbd-trdump.c
+++ b/nbd-trdump.c
@@ -19,6 +19,9 @@
 #include "nbd.h"
 #include "nbd-helper.h"
 
+#define BUFSIZE	131072
+static char tmpbuf[BUFSIZE];
+
 static inline void doread(int f, void *buf, size_t len) {
         ssize_t res;
 
@@ -78,6 +81,16 @@ int main(int argc, char**argv) {
 			       (command & NBD_CMD_FLAG_FUA)?"FUA":"NONE",
 			       (long long unsigned int) offset,
 			       len);
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
 			
 			break;
 		case NBD_REPLY_MAGIC:
diff --git a/nbdsrv.h b/nbdsrv.h
index 6a20c9b..b84e26a 100644
--- a/nbdsrv.h
+++ b/nbdsrv.h
@@ -155,6 +155,7 @@ typedef enum {
 #define F_FORCEDTLS 16384 /**< TLS is required, either for the server as a whole or for a given export */
 #define F_SPLICE 32768	  /**< flag to tell us to use splice for read/write operations */
 #define F_WAIT 65536      /**< flag to tell us to wait for file creation */
+#define F_DATALOG 131072  /**< flag to tell us that the transaction log shall contain the written data */
 
 /* Functions */
 
-- 
2.33.1

