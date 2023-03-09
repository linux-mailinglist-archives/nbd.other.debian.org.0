Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 171406B2F42
	for <lists+nbd@lfdr.de>; Thu,  9 Mar 2023 22:07:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CAE7A20669; Thu,  9 Mar 2023 21:07:03 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  9 21:07:03 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 888F120667
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Mar 2023 21:06:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id pjz0fZskCJQQ for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Mar 2023 21:06:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 1448D20666
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678395989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=csRP3qx+Mj36Py/JKmEH3qRyW9Fih00FcA56AoH9ZZg=;
	b=h1INyPnqP6b9akRSymsuuKylfXErkZYXzh0CNIUtXKsrd46w20vdrg4rVfjZgJOyqG7n2Y
	PTHmd2z7bKMTHhRjsKqqhw8xKs5VD1yow78B+WK7r6y6gQkoNpmqo/XVbzVTOpHR8LoUku
	IENEEXDD2yf5wmmhDkBJP9E7WKEaUtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-N3Ic_NM7PA-HAyVnnUBAQA-1; Thu, 09 Mar 2023 16:06:27 -0500
X-MC-Unique: N3Ic_NM7PA-HAyVnnUBAQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 690C6100F90B
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:06:27 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36AD9112132D
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:06:27 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH v2 3/3] nbd: Use uint64_t instead of char[8] for cookie
Date: Thu,  9 Mar 2023 15:06:23 -0600
Message-Id: <20230309210623.2238671-4-eblake@redhat.com>
In-Reply-To: <20230309210623.2238671-1-eblake@redhat.com>
References: <20230309210623.2238671-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mqCtOZj-OFN.A.joE.3pkCkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2361
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230309210623.2238671-4-eblake@redhat.com
Resent-Date: Thu,  9 Mar 2023 21:07:03 +0000 (UTC)

Type-punning *(uint64_t*)(char[8]) is unsafe if the pointer is not
aligned per the requirements of the hardware (x86_64 has 1-byte
alignment, but other hardware exists that will give a SIGBUS).  In
practice, it didn't matter - 'struct nbd_request' was already 64-bit
aligned for 'from' (even before the recent change in commit 739f7121
to pack it), and 'struct nbd_reply' being packed means the compiler
emits code to deal with 1-byte alignment despite hardware.  But since
the cookie is already opaque on the server side, we might as well
treat it as an 8-byte integer instead of a character array, with no
visible semantic changes to the client.
---
 nbd-server.c                  |  4 ++--
 nbd-trdump.c                  |  6 +++---
 nbd-trplay.c                  |  6 +++---
 nbd.h                         |  4 ++--
 tests/run/nbd-tester-client.c | 33 +++++++++++++++------------------
 5 files changed, 25 insertions(+), 28 deletions(-)

diff --git a/nbd-server.c b/nbd-server.c
index aa57ce0..08034cd 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -2052,7 +2052,7 @@ static void setup_transactionlog(CLIENT *client) {

 		req.magic = htonl(NBD_TRACELOG_MAGIC);
 		req.type = htonl(NBD_TRACELOG_SET_DATALOG);
-		memset(req.cookie, 0, sizeof(req.cookie));
+		req.cookie = 0;
 		req.from = htonll(NBD_TRACELOG_FROM_MAGIC);
 		req.len = htonl(TRUE);

@@ -2626,7 +2626,7 @@ struct work_package* package_create(CLIENT* client, struct nbd_request* req) {
 static void setup_reply(struct nbd_reply* rep, struct nbd_request* req) {
 	rep->magic = htonl(NBD_REPLY_MAGIC);
 	rep->error = 0;
-	memcpy(&(rep->cookie), &(req->cookie), sizeof(req->cookie));
+	rep->cookie = req->cookie;
 }

 static void log_reply(CLIENT *client, struct nbd_reply *prply)
diff --git a/nbd-trdump.c b/nbd-trdump.c
index 1e3017e..ee01519 100644
--- a/nbd-trdump.c
+++ b/nbd-trdump.c
@@ -70,7 +70,7 @@ int main(int argc, char**argv) {
 		switch (magic) {
 		case NBD_REQUEST_MAGIC:
 			doread(readfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
-			cookie = ntohll(*((long long int *)(req.cookie)));
+			cookie = ntohll(req.cookie);
 			offset = ntohll(req.from);
 			len = ntohl(req.len);
 			command = ntohl(req.type);
@@ -99,7 +99,7 @@ int main(int argc, char**argv) {
 			break;
 		case NBD_REPLY_MAGIC:
 			doread(readfd, sizeof(magic)+(char *)(&rep), sizeof(struct nbd_reply)-sizeof(magic));
-			cookie = ntohll(*((long long int *)(rep.cookie)));
+			cookie = ntohll(rep.cookie);
 			error = ntohl(rep.error);
 			
 			printf("< H=%016llx E=0x%08x\n",
@@ -109,7 +109,7 @@ int main(int argc, char**argv) {
 			
 		case NBD_TRACELOG_MAGIC:
 			doread(readfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
-			cookie = ntohll(*((long long int *)(req.cookie)));
+			cookie = ntohll(req.cookie);
 			offset = ntohll(req.from);
 			len = ntohl(req.len);
 			command = ntohl(req.type);
diff --git a/nbd-trplay.c b/nbd-trplay.c
index 698800e..deeea51 100644
--- a/nbd-trplay.c
+++ b/nbd-trplay.c
@@ -163,7 +163,7 @@ int main_loop(int logfd, int imagefd) {
 		switch (magic) {
 		case NBD_REQUEST_MAGIC:
 			doread(logfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
-			cookie = ntohll(*((long long int *)(req.cookie)));
+			cookie = ntohll(req.cookie);
 			offset = ntohll(req.from);
 			len = ntohl(req.len);
 			command = ntohl(req.type);
@@ -185,7 +185,7 @@ int main_loop(int logfd, int imagefd) {

 		case NBD_REPLY_MAGIC:
 			doread(logfd, sizeof(magic)+(char *)(&rep), sizeof(struct nbd_reply)-sizeof(magic));
-			cookie = ntohll(*((long long int *)(rep.cookie)));
+			cookie = ntohll(rep.cookie);
 			error = ntohl(rep.error);

 			if (g_verbose >= VERBOSE_NORMAL) {
@@ -197,7 +197,7 @@ int main_loop(int logfd, int imagefd) {

 		case NBD_TRACELOG_MAGIC:
 			doread(logfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
-			cookie = ntohll(*((long long int *)(req.cookie)));
+			cookie = ntohll(req.cookie);
 			offset = ntohll(req.from);
 			len = ntohl(req.len);
 			command = ntohl(req.type);
diff --git a/nbd.h b/nbd.h
index 156405a..0cfebe5 100644
--- a/nbd.h
+++ b/nbd.h
@@ -78,7 +78,7 @@ enum {
 struct nbd_request {
 	uint32_t magic;
 	uint32_t type;	/* == READ || == WRITE 	*/
-	char cookie[8];
+	uint64_t cookie;
 	uint64_t from;
 	uint32_t len;
 } __attribute__ ((packed));
@@ -90,6 +90,6 @@ struct nbd_request {
 struct nbd_reply {
 	uint32_t magic;
 	uint32_t error;		/* 0 = ok, else error	*/
-	char cookie[8];		/* cookie you got from request	*/
+	uint64_t cookie;	/* cookie you got from request	*/
 } __attribute__ ((packed));
 #endif
diff --git a/tests/run/nbd-tester-client.c b/tests/run/nbd-tester-client.c
index d09308a..547c0d7 100644
--- a/tests/run/nbd-tester-client.c
+++ b/tests/run/nbd-tester-client.c
@@ -73,7 +73,7 @@ typedef enum {

 struct reqcontext {
 	uint64_t seq;
-	char origcookie[8];
+	uint64_t origcookie;
 	struct nbd_request req;
 	struct reqcontext *next;
 	struct reqcontext *prev;
@@ -680,7 +680,7 @@ int close_connection(int sock, CLOSE_TYPE type)
 	case CONNECTION_CLOSE_PROPERLY:
 		req.magic = htonl(NBD_REQUEST_MAGIC);
 		req.type = htonl(NBD_CMD_DISC);
-		memcpy(&(req.cookie), &(counter), sizeof(counter));
+		req.cookie = htonll(counter);
 		counter++;
 		req.from = 0;
 		req.len = 0;
@@ -720,8 +720,8 @@ int read_packet_check_header(int sock, size_t datasize, long long int curcookie)
 			 "Received package with incorrect reply_magic. Index of sent packages is %lld (0x%llX), received cookie is %lld (0x%llX). Received magic 0x%lX, expected 0x%lX",
 			 (long long int)curcookie,
 			 (long long unsigned int)curcookie,
-			 (long long int)*((u64 *) rep.cookie),
-			 (long long unsigned int)*((u64 *) rep.cookie),
+			 (long long int)rep.cookie,
+			 (long long unsigned int)rep.cookie,
 			 (long unsigned int)rep.magic,
 			 (long unsigned int)NBD_REPLY_MAGIC);
 		retval = -1;
@@ -731,8 +731,8 @@ int read_packet_check_header(int sock, size_t datasize, long long int curcookie)
 		snprintf(errstr, errstr_len,
 			 "Received error from server: %ld (0x%lX). Cookie is %lld (0x%llX).",
 			 (long int)rep.error, (long unsigned int)rep.error,
-			 (long long int)(*((u64 *) rep.cookie)),
-			 (long long unsigned int)*((u64 *) rep.cookie));
+			 (long long int)rep.cookie,
+			 (long long unsigned int)rep.cookie);
 		retval = -2;
 		goto end;
 	}
@@ -767,7 +767,7 @@ int oversize_test(char *name, int sock, char close_sock, int testflags)
 	req.magic = htonl(NBD_REQUEST_MAGIC);
 	req.type = htonl(NBD_CMD_READ);
 	req.len = htonl(1024 * 1024);
-	memcpy(&(req.cookie), &i, sizeof(i));
+	req.cookie = htonll(i);
 	req.from = htonll(i);
 	WRITE_ALL_ERR_RT(sock, &req, sizeof(req), err, -1,
 			 "Could not write request: %s", strerror(errno));
@@ -971,7 +971,7 @@ int throughput_test(char *name, int sock, char close_sock, int testflags)
 			if (sendfua)
 				req.type =
 				    htonl(NBD_CMD_WRITE | NBD_CMD_FLAG_FUA);
-			memcpy(&(req.cookie), &i, sizeof(i));
+			req.cookie = htonll(i);
 			req.from = htonll(i);
 			if (write_all(sock, &req, sizeof(req)) < 0) {
 				retval = -1;
@@ -987,7 +987,7 @@ int throughput_test(char *name, int sock, char close_sock, int testflags)
 			if (sendflush) {
 				long long int j = i ^ (1LL << 63);
 				req.type = htonl(NBD_CMD_FLUSH);
-				memcpy(&(req.cookie), &j, sizeof(j));
+				req.cookie = htonll(j);
 				req.from = 0;
 				req.len = 0;
 				if (write_all(sock, &req, sizeof(req)) < 0) {
@@ -1334,7 +1334,7 @@ int integrity_test(char *name, int sock, char close_sock, int testflags)
 						"Could not read transaction log: %s",
 						strerror(errno));
 				prc->req.magic = htonl(NBD_REQUEST_MAGIC);
-				memcpy(prc->origcookie, prc->req.cookie, 8);
+				prc->origcookie = htonll(prc->req.cookie);
 				prc->seq = seq++;
 				if ((ntohl(prc->req.type) &
 				     NBD_CMD_MASK_COMMAND) == NBD_CMD_DISC) {
@@ -1439,9 +1439,8 @@ int integrity_test(char *name, int sock, char close_sock, int testflags)

 				dumpcommand("Sending command", prc->req.type);
 				/* we rewrite the cookie as they otherwise may not be unique */
-				*((uint64_t *) (prc->req.cookie)) =
-				    getrandomcookie(cookiehash);
-				g_hash_table_insert(cookiehash, prc->req.cookie,
+				prc->req.cookie = getrandomcookie(cookiehash);
+				g_hash_table_insert(cookiehash, &prc->req.cookie,
 						    prc);
 				addbuffer(&txbuf, &(prc->req),
 					  sizeof(struct nbd_request));
@@ -1538,20 +1537,18 @@ skipdequeue:
 			}

 			uint64_t cookie;
-			memcpy(&cookie, rep.cookie, 8);
+			cookie = rep.cookie;
 			prc = g_hash_table_lookup(cookiehash, &cookie);
 			if (!prc) {
 				snprintf(errstr, errstr_len,
 					 "Unrecognised cookie in reply: 0x%llX",
-					 *(long long unsigned int *)(rep.
-								     cookie));
+					 (long long unsigned int)rep.cookie);
 				goto err_open;
 			}
 			if (!g_hash_table_remove(cookiehash, &cookie)) {
 				snprintf(errstr, errstr_len,
 					 "Could not remove cookie from hash: 0x%llX",
-					 *(long long unsigned int *)(rep.
-								     cookie));
+					 (long long unsigned int)rep.cookie);
 				goto err_open;
 			}

-- 
2.39.2

