Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC226B5C19
	for <lists+nbd@lfdr.de>; Sat, 11 Mar 2023 14:08:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 81C4B2062D; Sat, 11 Mar 2023 13:08:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 11 13:08:08 2023
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,WORD_WITHOUT_VOWELS
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1787E205F1
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 Mar 2023 13:07:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.73 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id AUgqEKxJGgiW for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 Mar 2023 13:07:30 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3302220627
	for <nbd@other.debian.org>; Sat, 11 Mar 2023 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZRRaX0ORyT0KUnHJaFkjqQNyffch2TCcKYgdfLIGO4U=; b=QqFEkXpGoQrr9xfBVYzW0AtpBC
	/GRm6dpbQnlmZsFbyVTMf8z3gtqEFr1OH544EW2dexqkrukbJDYKTiOTGiTp4CuLBlqCp/xcs+0JL
	KeAc7G/v6m2E2YsCvIv9AWc8j6Fzr79ctePAIj/JxCCSqvWD2doGMUeMyKgdbJTfLGbd92Rg3bm6h
	hqlSGSYdE5Khf5TVNWX0h5RVXmtSwciwsSGVMU5zZIYois7d8QJoQop3nxJvxg4TpLEhLZ9QHTWTt
	XssUUQNQ0kPpiWYTG/vtyI8jxdg9Y2tBNWxpFxgfD/0EsqjzbDGx23hPCPN9LGu9GSXbcSDEfr7We
	TCP8iJTg==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <wouter@grep.be>)
	id 1paywZ-005Upt-6s; Sat, 11 Mar 2023 14:07:27 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <wouter@grep.be>)
	id 1paywQ-0014JP-2Y;
	Sat, 11 Mar 2023 15:07:18 +0200
From: w@uter.be
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>
Subject: [PATCH 3/4] Implement structured reply handling
Date: Sat, 11 Mar 2023 15:07:04 +0200
Message-Id: <20230311130705.253855-4-w@uter.be>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230311130705.253855-1-w@uter.be>
References: <20230311130705.253855-1-w@uter.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <t7DxrZpctT.A.k6C.40HDkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2380
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230311130705.253855-4-w@uter.be
Resent-Date: Sat, 11 Mar 2023 13:08:08 +0000 (UTC)

From: Wouter Verhelst <w@uter.be>

This implements the transmission phase part of structured replies as documented
in doc/proto.txt, but does not do the negotiation phase part of this (yet).

Signed-off-by: Wouter Verhelst <w@uter.be>
---
 nbd-server.c | 157 +++++++++++++++++++++++++++++++++++++++++++++------
 nbd.h        |  37 ++++++++++++
 nbdsrv.h     |   7 +++
 3 files changed, 184 insertions(+), 17 deletions(-)

diff --git a/nbd-server.c b/nbd-server.c
index 64609f3..8c84f93 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -1289,6 +1289,51 @@ static void log_reply(CLIENT *client, struct nbd_reply *prply) {
 	}
 }
 
+static void log_structured_reply(CLIENT *client, struct nbd_structured_reply *prply) {
+	if (client->transactionlogfd != -1) {
+		lock_logsem(client);
+		writeit(client->transactionlogfd, prply, sizeof(*ptply));
+		unlock_logsem(client);
+	}
+}
+
+void send_structured_chunk(CLIENT *client, struct nbd_request *req, uint16_t flags, uint16_t type, uint32_t length, int bufcount, void *buf[], size_t buflen[]) {
+	struct nbd_structured_reply rep;
+	rep.magic = htonl(NBD_STRUCTURED_REPLY_MAGIC);
+	rep.flags = htons(flags);
+	rep.type = htons(type);
+	memcpy(&(rep.handle), req->handle, sizeof(rep.handle));
+	rep.paylen = htonl(length);
+	pthread_mutex_lock(&(client->lock));
+	socket_write(client, &rep, sizeof rep);
+	for(int i=0; i<bufcount; i++) {
+		socket_write(client, buf[i], buflen[i]);
+	}
+	pthread_mutex_unlock(&(client->lock));
+	log_structured_reply(client, &rep);
+}
+
+void send_structured_chunk_v(CLIENT *client, struct nbd_request *req, uint16_t flags, uint16_t type, uint32_t length, int bufcount, ...) {
+	struct nbd_structured_reply rep;
+	va_list ap;
+	rep.magic = htonl(NBD_STRUCTURED_REPLY_MAGIC);
+	rep.flags = htons(flags);
+	rep.type = htons(type);
+	memcpy(&(rep.handle), req->handle, sizeof(rep.handle));
+	rep.paylen = htonl(length);
+	va_start(ap, bufcount);
+	pthread_mutex_lock(&(client->lock));
+	socket_write(client, &rep, sizeof rep);
+	for(int i=0; i<bufcount; i++) {
+		void *buf = va_arg(ap, void*);
+		size_t size = va_arg(ap, size_t);
+		socket_write(client, buf, size);
+	}
+	pthread_mutex_unlock(&(client->lock));
+	log_structured_reply(client, &rep);
+	va_end(ap);
+}
+
 /**
  * Find the location to write the data for the next chunk to.
  * Assumes checks on memory sizes etc have already been done.
@@ -1298,28 +1343,85 @@ static void log_reply(CLIENT *client, struct nbd_reply *prply) {
  * @param len the length of this chunk.
  */
 char * find_read_buf(READ_CTX *ctx) {
-	return ctx->buf + ctx->current_offset;
+	if(!(ctx->is_structured) || ctx->df) {
+		return ctx->buf + ctx->current_offset;
+	}
+	ctx->buf = malloc(ctx->current_len);
+	if(!(ctx->buf)) {
+		err("Could not allocate memory for request");
+	}
+	return ctx->buf;
 }
 
 void confirm_read(CLIENT *client, READ_CTX *ctx, size_t len_read) {
+	if(ctx->is_structured && !(ctx->df)) {
+		uint64_t offset = htonll(ctx->req->from + (uint64_t)(ctx->current_offset));
+		send_structured_chunk_v(client, ctx->req, 0, NBD_REPLY_TYPE_OFFSET_DATA, len_read + 8, 2, &offset, sizeof offset, ctx->buf, (size_t)len_read);
+		free(ctx->buf);
+	}
 }
 
 void complete_read(CLIENT *client, READ_CTX *ctx, uint32_t error, char *errmsg, uint16_t msglen, bool with_offset, uint64_t err_offset) {
 	uint16_t type;
 	uint64_t offset = 0;
-	struct nbd_reply rep;
-	setup_reply(&rep, ctx->req);
-	if(error) {
-		rep.error = error;
-	}
-	log_reply(client, &rep);
-	pthread_mutex_lock(&(client->lock));
-	socket_write(client, &rep, sizeof rep);
-	if(!error) {
-		socket_write(client, ctx->buf, ctx->buflen);
+	if(ctx->is_structured) {
+		if(ctx->df) {
+			uint32_t len = ctx->req->len;
+			if(error != 0 && with_offset) {
+				len = err_offset;
+			}
+			if(error == 0 || with_offset) {
+				offset = htonll(ctx->req->from);
+				send_structured_chunk_v(client, ctx->req, 0, NBD_REPLY_TYPE_OFFSET_DATA, len + 8, 2, &offset, sizeof offset, ctx->buf, err_offset);
+			}
+			free(ctx->buf);
+		}
+		if(error != 0) {
+			struct nbd_structured_error_payload pl;
+			void *buf[3];
+			size_t bufsize[3];
+			int payloads = 1;
+			size_t total_size;
+			pl.error = error;
+			pl.msglen = msglen;
+			if(with_offset) {
+				offset += err_offset;
+				type = NBD_REPLY_TYPE_ERROR_OFFSET;
+			} else {
+				type = NBD_REPLY_TYPE_ERROR;
+			}
+			buf[0] = &pl;
+			bufsize[0] = sizeof pl;
+			total_size = bufsize[0];
+			if(msglen > 0) {
+				buf[++payloads] = errmsg;
+				bufsize[payloads] = msglen;
+				total_size += msglen;
+			}
+			if(with_offset) {
+				buf[++payloads] = &offset;
+				bufsize[payloads] = sizeof offset;
+				total_size += sizeof offset;
+			}
+			send_structured_chunk(client, ctx->req, NBD_REPLY_FLAG_DONE, type, total_size, payloads, buf, bufsize);
+			return;
+		}
+		send_structured_chunk_v(client, ctx->req, NBD_REPLY_FLAG_DONE, NBD_REPLY_TYPE_NONE, 0, 0);
+	} else {
+		struct nbd_reply rep;
+		setup_reply(&rep, ctx->req);
+		if(error) {
+			rep.error = error;
+		}
+		log_reply(client, &rep);
+		pthread_mutex_lock(&(client->lock));
+		socket_write(client, &rep, sizeof rep);
+		if(!error) {
+			socket_write(client, ctx->buf, ctx->buflen);
+		}
+		pthread_mutex_unlock(&(client->lock));
+		free(ctx->buf);
 	}
-	pthread_mutex_unlock(&(client->lock));
-	free(ctx->buf);
 }
 
 /**
@@ -2735,11 +2837,32 @@ static void handle_normal_read(CLIENT *client, struct nbd_request *req)
 	uint32_t error = 0;
 	char *errmsg = NULL;
 	uint16_t msglen = 0;
-	ctx->buf = malloc(req->len);
-	if(!(ctx->buf)) {
-		err("Could not allocate memory for request");
+	if(client->clientflags & F_STRUCTURED) {
+		ctx->is_structured = 1;
+	} else {
+		ctx->is_structured = 0;
+	}
+	if(req->type & NBD_CMD_FLAG_DF != 0) {
+		ctx->df = 1;
+	}
+	if(ctx->is_structured && ctx->df && req->len > (1 << 20)) {
+		/* standard requires a minimum of 64KiB; we are more generous
+		 * by allowing up to 1MiB as our largest unfragmented answer */
+		const char too_long[] = "Request too long for unfragmented reply";
+		struct nbd_structured_error_payload pl;
+		pl.error = NBD_EOVERFLOW;
+		pl.msglen = sizeof too_long;
+		send_structured_chunk_v(client, req, NBD_REPLY_FLAG_DONE, NBD_REPLY_TYPE_ERROR, 6 + pl.msglen, 2, &pl, sizeof pl, too_long, sizeof too_long);
+		free(ctx);
+		return;
+	}
+	if(ctx->df || !(ctx->is_structured)) {
+		ctx->buf = malloc(req->len);
+		if(!(ctx->buf)) {
+			err("Could not allocate memory for request");
+		}
+		ctx->buflen = req->len;
 	}
-	ctx->buflen = req->len;
 	if(expread(ctx, client)) {
 		DEBUG("Read failed: %m");
 		char read_failed[] = "Read failed";
diff --git a/nbd.h b/nbd.h
index caa3595..4cf692a 100644
--- a/nbd.h
+++ b/nbd.h
@@ -45,6 +45,7 @@ enum {
 #define NBD_CMD_SHIFT (16)
 #define NBD_CMD_FLAG_FUA ((1 << 0) << NBD_CMD_SHIFT)
 #define NBD_CMD_FLAG_NO_HOLE ((1 << 1) << NBD_CMD_SHIFT)
+#define NBD_CMD_FLAG_DF  ((1 << 2) << NBD_CMD_SHIFT)
 
 /* values for flags field */
 #define NBD_FLAG_HAS_FLAGS	(1 << 0)	/* Flags are there */
@@ -71,6 +72,16 @@ enum {
 
 #define NBD_OPT_REPLY_MAGIC 0x3e889045565a9LL
 
+#define NBD_REPLY_TYPE_NONE 		(0)
+#define NBD_REPLY_TYPE_OFFSET_DATA	(1)
+#define NBD_REPLY_TYPE_OFFSET_HOLE	(2)
+#define NBD_REPLY_TYPE_BLOCK_STATUS	(3)
+
+#define NBD_REPLY_TYPE_ERROR		((1 << 15) + 1)
+#define NBD_REPLY_TYPE_ERROR_OFFSET	((1 << 15) + 2)
+
+#define NBD_REPLY_FLAG_DONE		(1 << 0)
+
 /*
  * This is the packet used for communication between client and
  * server. All data are in network byte order.
@@ -92,4 +103,30 @@ struct nbd_reply {
 	uint32_t error;		/* 0 = ok, else error	*/
 	char handle[8];		/* handle you got from request	*/
 } __attribute__ ((packed));
+
+/*
+ * The reply packet for structured replies
+ */
+struct nbd_structured_reply {
+	uint32_t magic;
+	uint16_t flags;
+	uint16_t type;
+	uint64_t handle;
+	uint32_t paylen;
+} __attribute__ ((packed));
+
+struct nbd_structured_error_payload {
+	uint32_t error;
+	uint16_t msglen;
+} __attribute__ ((packed));
+
+#define NBD_EPERM 1
+#define NBD_EIO 5
+#define NBD_ENOMEM 12
+#define NBD_EINVAL 22
+#define NBD_ENOSPC 28
+#define NBD_EOVERFLOW 75
+#define NBD_ENOTSUP 95
+#define NBD_ESHUTDOWN 108
+
 #endif
diff --git a/nbdsrv.h b/nbdsrv.h
index 4b227e7..43c44cd 100644
--- a/nbdsrv.h
+++ b/nbdsrv.h
@@ -73,6 +73,7 @@ typedef struct _client {
 	char semname[100];	/**< name of the posix sem that protects access to the transaction log */
 	sem_t *logsem;		/**< posix sem that protects access to the transaction log */
 	int clientfeats;	/**< Client flags specified during negotiation */
+	int clientflags;	/**< Internal flags for this client, as determined by nbd-server */
 	pthread_mutex_t lock;	/**< socket lock */
 	void *tls_session;	/**< TLS session context. Is NULL unless STARTTLS
 				     has been negotiated. */
@@ -95,6 +96,8 @@ typedef struct {
 	size_t buflen;
 	size_t current_offset;
 	uint32_t current_len;
+	unsigned int is_structured : 1;
+	unsigned int df : 1;
 } READ_CTX;
 
 /* Constants and macros */
@@ -167,6 +170,10 @@ typedef enum {
 #define F_WAIT 65536      /**< flag to tell us to wait for file creation */
 #define F_DATALOG 131072  /**< flag to tell us that the transaction log shall contain the written data */
 
+/** Internal flags (for clientflags) */
+
+#define F_STRUCTURED 1
+
 /* Functions */
 
 /**
-- 
2.39.2

