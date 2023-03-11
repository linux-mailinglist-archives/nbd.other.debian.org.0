Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 790E86B5C18
	for <lists+nbd@lfdr.de>; Sat, 11 Mar 2023 14:08:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5F9762062C; Sat, 11 Mar 2023 13:08:01 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 11 13:08:01 2023
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,ROLEX,
	WORD_WITHOUT_VOWELS autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2DDCB2061B
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 Mar 2023 13:07:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.73 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, ROLEX=3, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6iWEb0lsDygO for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 Mar 2023 13:07:30 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 309F9205F1
	for <nbd@other.debian.org>; Sat, 11 Mar 2023 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CDOLUhrZPHS0w38kLQdBx2EZw71IdDfa0pikntAQScc=; b=YpxhsxxyRV2jIEfvd9IKQRxVZt
	YT5fShmiO6RqBoCJdfe9UXgcNoIIDDvtVzG9JtD7CArwqq8Ubmg/nj7IjGbPIyWwjlsqOsXQRIG2a
	nldJWk4DDkf1/Pa3sM5fWsp8wbMbYFFzzspI87E3FfH/EJxa+Pq0uWO0ftIdJlsPh3AKBjrR2KLHQ
	WXhpAOI3nYmRhRftXVDj1CQglVRsICy/7xxbCm9SJaZXbYRWNArpMASJIV0hgf+7XHRCjWDOxWctZ
	Al1XNq4PJOY37i60kaUIlLczI03id2CH9kETciEwprxp4a+YVmXN3bVnz2rVKvFKTiL4STESGivYT
	ohZJRBKw==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <wouter@grep.be>)
	id 1paywZ-005Upu-6s; Sat, 11 Mar 2023 14:07:27 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <wouter@grep.be>)
	id 1paywQ-0014JH-2C;
	Sat, 11 Mar 2023 15:07:18 +0200
From: w@uter.be
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>
Subject: [PATCH 1/4] Refactor request handling
Date: Sat, 11 Mar 2023 15:07:02 +0200
Message-Id: <20230311130705.253855-2-w@uter.be>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230311130705.253855-1-w@uter.be>
References: <20230311130705.253855-1-w@uter.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eHUHc502gNI.A.N4.x0HDkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2379
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230311130705.253855-2-w@uter.be
Resent-Date: Sat, 11 Mar 2023 13:08:01 +0000 (UTC)

From: Wouter Verhelst <w@uter.be>

Currently, the state of a request is stored on the stack, with the reply
being built in a buffer which is sent out at the very end of the
'handle_normal_read' function.

This makes implementing structured replies complicated, as for those we
may want to sometimes send a reply chunk before that point.

Thus, refactor request handling such that we no longer depend on the
stack for sending out things.

Signed-off-by: Wouter Verhelst <w@uter.be>
---
 nbd-server.c | 144 +++++++++++++++++++++++++++++++++++----------------
 nbdsrv.h     |   8 +++
 2 files changed, 106 insertions(+), 46 deletions(-)

diff --git a/nbd-server.c b/nbd-server.c
index 5787ddc..3bfa857 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -1275,6 +1275,50 @@ int rawexpwrite_fully(off_t a, char *buf, size_t len, CLIENT *client, int fua) {
 	return (ret < 0 || len != 0);
 }
 
+static void setup_reply(struct nbd_reply* rep, struct nbd_request* req) {
+	rep->magic = htonl(NBD_REPLY_MAGIC);
+	rep->error = 0;
+	memcpy(&(rep->handle), &(req->handle), sizeof(req->handle));
+}
+
+static void log_reply(CLIENT *client, struct nbd_reply *prply) {
+	if (client->transactionlogfd != -1) {
+		lock_logsem(client);
+		writeit(client->transactionlogfd, prply, sizeof(*prply));
+		unlock_logsem(client);
+	}
+}
+
+/**
+ * Find the location to write the data for the next chunk to.
+ * Assumes checks on memory sizes etc have already been done.
+ *
+ * @param ctx the context we're working with
+ * @param offset the offset into the request
+ * @param len the length of this chunk.
+ */
+char * find_read_buf(READ_CTX *ctx) {
+	return ctx->buf + ctx->current_offset;
+}
+
+void complete_read(CLIENT *client, READ_CTX *ctx, uint32_t error, char *errmsg, uint16_t msglen, bool with_offset, uint64_t err_offset) {
+	uint16_t type;
+	uint64_t offset = 0;
+	struct nbd_reply rep;
+	setup_reply(&rep, ctx->req);
+	if(error) {
+		rep.error = error;
+	}
+	log_reply(client, &rep);
+	pthread_mutex_lock(&(client->lock));
+	socket_write(client, &rep, sizeof rep);
+	if(!error) {
+		socket_write(client, ctx->buf, ctx->buflen);
+	}
+	pthread_mutex_unlock(&(client->lock));
+	free(ctx->buf);
+}
+
 /**
  * Read an amount of bytes at a given offset from the right file. This
  * abstracts the read-side of the multiple files option.
@@ -1310,15 +1354,20 @@ ssize_t rawexpread(off_t a, char *buf, size_t len, CLIENT *client) {
  * Call rawexpread repeatedly until all data has been read.
  * @return 0 on success, nonzero on failure
  **/
-int rawexpread_fully(off_t a, char *buf, size_t len, CLIENT *client) {
+int rawexpread_fully(READ_CTX *ctx, CLIENT *client) {
 	ssize_t ret=0;
 
-	while(len > 0 && (ret=rawexpread(a, buf, len, client)) > 0 ) {
-		a += ret;
-		buf += ret;
-		len -= ret;
+	char *buf;
+
+	while(ctx->current_len > 0) {
+		buf = find_read_buf(ctx);
+		if((ret = rawexpread((off_t)ctx->req->from + (off_t)ctx->current_offset, buf, ctx->current_len, client)) < 0) {
+			return ret;
+		}
+		ctx->current_offset += ret;
+		ctx->current_len -= ret;
 	}
-	return (ret < 0 || len != 0);
+	return (ret < 0 || ctx->current_len != 0);
 }
 
 #ifdef HAVE_SPLICE
@@ -1393,14 +1442,17 @@ int expsplice(int pipe, off_t a, size_t len, CLIENT *client, int dir, int fua)
  * @param client The client we're going to read for
  * @return 0 on success, nonzero on failure
  **/
-int expread(off_t a, char *buf, size_t len, CLIENT *client) {
+int expread(READ_CTX *ctx, CLIENT *client) {
 	off_t rdlen, offset;
 	off_t mapcnt, mapl, maph, pagestart;
+	off_t a = (off_t)ctx->current_offset + (off_t)ctx->req->from;
+	size_t len = (size_t) ctx->req->len;
+	int rv = 0;
 
 	DEBUG("Asked to read %u bytes at %llu.\n", (unsigned int)len, (unsigned long long)a);
 
 	if (!(client->server->flags & F_COPYONWRITE) && !((client->server->flags & F_WAIT) && (client->export == NULL)))
-		return(rawexpread_fully(a, buf, len, client));
+		return(rawexpread_fully(ctx, client));
 
 	mapl=a/DIFFPAGESIZE; maph=(a+len-1)/DIFFPAGESIZE;
 
@@ -1414,7 +1466,10 @@ int expread(off_t a, char *buf, size_t len, CLIENT *client) {
 		if (client->difmap[mapcnt]!=(u32)(-1)) { /* the block is already there */
 			DEBUG("Page %llu is at %lu\n", (unsigned long long)mapcnt,
 			       (unsigned long)(client->difmap[mapcnt]));
-			if (pread(client->difffile, buf, rdlen, client->difmap[mapcnt]*DIFFPAGESIZE+offset) != rdlen) goto fail;
+			char *buf = find_read_buf(ctx);
+			if (pread(client->difffile, buf, rdlen, client->difmap[mapcnt]*DIFFPAGESIZE+offset) != rdlen) {
+				goto fail;
+			}
 		} else { /* the block is not there */
 			if ((client->server->flags & F_WAIT) && (client->export == NULL)){
 				DEBUG("Page %llu is not here, and waiting for file\n",
@@ -1423,18 +1478,22 @@ int expread(off_t a, char *buf, size_t len, CLIENT *client) {
 			} else {
 				DEBUG("Page %llu is not here, we read the original one\n",
 				       (unsigned long long)mapcnt);
-				if(rawexpread_fully(a, buf, rdlen, client)) goto fail;
+				ctx->current_len = rdlen;
+				if(rawexpread_fully(ctx, client)) goto fail;
 			}
 		}
 		if (!(client->server->flags & F_COPYONWRITE))
 			pthread_rwlock_unlock(&client->export_lock);
-		len-=rdlen; a+=rdlen; buf+=rdlen;
+		len-=rdlen; a+=rdlen;
 	}
-	return 0;
+	rv = 0;
+	goto end;
 fail:
 	if (!(client->server->flags & F_COPYONWRITE))
 		pthread_rwlock_unlock(&client->export_lock);
-	return -1;
+	rv = -1;
+end:
+	return rv;
 }
 
 /**
@@ -1486,9 +1545,16 @@ int expwrite(off_t a, char *buf, size_t len, CLIENT *client, int fua) {
 					DEBUG("error: we can write only whole page while waiting for file\n");
 					goto fail;
 				}
-				rdlen=DIFFPAGESIZE ;
-				if (rawexpread_fully(pagestart, pagebuf, rdlen, client))
-					goto fail;
+				rdlen=DIFFPAGESIZE;
+				int ret;
+				char *ptr = pagebuf;
+				while(rdlen > 0 && (ret = rawexpread(pagestart, ptr, rdlen, client)) > 0) {
+					pagestart += ret;
+					ptr += ret;
+					rdlen -= ret;
+				}
+				if(ret < 0 ) goto fail;
+				pagestart -= DIFFPAGESIZE;
 			}
 			memcpy(pagebuf+offset,buf,wrlen) ;
 			if (write(client->difffile, pagebuf, DIFFPAGESIZE) != DIFFPAGESIZE)
@@ -2623,21 +2689,6 @@ struct work_package* package_create(CLIENT* client, struct nbd_request* req) {
 	return rv;
 }
 
-static void setup_reply(struct nbd_reply* rep, struct nbd_request* req) {
-	rep->magic = htonl(NBD_REPLY_MAGIC);
-	rep->error = 0;
-	memcpy(&(rep->handle), &(req->handle), sizeof(req->handle));
-}
-
-static void log_reply(CLIENT *client, struct nbd_reply *prply)
-{
-	if (client->transactionlogfd != -1) {
-		lock_logsem(client);
-		writeit(client->transactionlogfd, prply, sizeof(*prply));
-		unlock_logsem(client);
-	}
-}
-
 #ifdef HAVE_SPLICE
 static int handle_splice_read(CLIENT *client, struct nbd_request *req)
 {
@@ -2672,25 +2723,26 @@ static int handle_splice_read(CLIENT *client, struct nbd_request *req)
 
 static void handle_normal_read(CLIENT *client, struct nbd_request *req)
 {
-	struct nbd_reply rep;
-	void* buf = malloc(req->len);
-	if(!buf) {
+	DEBUG("handling read request\n");
+	READ_CTX *ctx = g_new0(READ_CTX, 1);
+	ctx->req = req;
+	ctx->current_len = req->len;
+	uint32_t error = 0;
+	char *errmsg = NULL;
+	uint16_t msglen = 0;
+	ctx->buf = malloc(req->len);
+	if(!(ctx->buf)) {
 		err("Could not allocate memory for request");
 	}
-	DEBUG("handling read request\n");
-	setup_reply(&rep, req);
-	if(expread(req->from, buf, req->len, client)) {
+	ctx->buflen = req->len;
+	if(expread(ctx, client)) {
 		DEBUG("Read failed: %m");
-		rep.error = nbd_errno(errno);
-	}
-	log_reply(client, &rep);
-	pthread_mutex_lock(&(client->lock));
-	socket_write(client, &rep, sizeof rep);
-	if(!rep.error) {
-		socket_write(client, buf, req->len);
+		char read_failed[] = "Read failed";
+		error = nbd_errno(errno);
+		errmsg = read_failed;
+		msglen = sizeof read_failed;
 	}
-	pthread_mutex_unlock(&(client->lock));
-	free(buf);
+	complete_read(client, ctx, error, errmsg, msglen, false, 0);
 }
 
 static void handle_read(CLIENT* client, struct nbd_request* req)
diff --git a/nbdsrv.h b/nbdsrv.h
index 3a14873..4b227e7 100644
--- a/nbdsrv.h
+++ b/nbdsrv.h
@@ -89,6 +89,14 @@ typedef struct {
 	off_t startoff;   /**< starting offset of this file */
 } FILE_INFO;
 
+typedef struct {
+	struct nbd_request *req;
+	char *buf;
+	size_t buflen;
+	size_t current_offset;
+	uint32_t current_len;
+} READ_CTX;
+
 /* Constants and macros */
 
 /**
-- 
2.39.2

