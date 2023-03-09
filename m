Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDF56B2F43
	for <lists+nbd@lfdr.de>; Thu,  9 Mar 2023 22:07:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CC55D20667; Thu,  9 Mar 2023 21:07:04 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  9 21:07:04 2023
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
	by bendel.debian.org (Postfix) with ESMTP id C702720666
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
	with ESMTP id RWS0muMoc7C9 for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Mar 2023 21:06:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 088EE20665
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678395988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WNFAWyaTFATbq7tT56oCJljwoq6ZusVhOJ//MXpSm/E=;
	b=LjSTwVX0MwM6rGlORPBDxIGW/G/c4UrQzeLmaBQvVlspOciWI15tnnKZlvzdjTJ2kEqJiq
	M8FLtERUKYZnC0gP2fl6Aj6JARRjFlJ54gDj3mbPdFMTKDGnaMz56RFOJPx+kEeLWtUoCW
	7aQzOEPfGnMtzEVi8lVOCTdLq4DsL0g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-UMcpLQL4NMyB9VK8qGV81A-1; Thu, 09 Mar 2023 16:06:27 -0500
X-MC-Unique: UMcpLQL4NMyB9VK8qGV81A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1879A857F42
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:06:27 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4029112132D
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:06:26 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH v2 2/3] nbd: s/handle/cookie/g when referring to opaque client id
Date: Thu,  9 Mar 2023 15:06:22 -0600
Message-Id: <20230309210623.2238671-3-eblake@redhat.com>
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
Resent-Message-ID: <FECARAN3ZAM.A.QpE.4pkCkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2362
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230309210623.2238671-3-eblake@redhat.com
Resent-Date: Thu,  9 Mar 2023 21:07:04 +0000 (UTC)

Match the documentation change of the previous patch.  Now, places
using 'handle' refer to things like signal handlers and callbacks,
while 'cookie' is the 8-byte opaque value used by the client to
correlate replies back to requests.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd-server.c                  |  4 +-
 nbd-trdump.c                  | 12 +++---
 nbd-trplay.c                  | 12 +++---
 nbd.h                         |  4 +-
 tests/run/nbd-tester-client.c | 74 +++++++++++++++++------------------
 5 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/nbd-server.c b/nbd-server.c
index 5787ddc..aa57ce0 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -2052,7 +2052,7 @@ static void setup_transactionlog(CLIENT *client) {

 		req.magic = htonl(NBD_TRACELOG_MAGIC);
 		req.type = htonl(NBD_TRACELOG_SET_DATALOG);
-		memset(req.handle, 0, sizeof(req.handle));
+		memset(req.cookie, 0, sizeof(req.cookie));
 		req.from = htonll(NBD_TRACELOG_FROM_MAGIC);
 		req.len = htonl(TRUE);

@@ -2626,7 +2626,7 @@ struct work_package* package_create(CLIENT* client, struct nbd_request* req) {
 static void setup_reply(struct nbd_reply* rep, struct nbd_request* req) {
 	rep->magic = htonl(NBD_REPLY_MAGIC);
 	rep->error = 0;
-	memcpy(&(rep->handle), &(req->handle), sizeof(req->handle));
+	memcpy(&(rep->cookie), &(req->cookie), sizeof(req->cookie));
 }

 static void log_reply(CLIENT *client, struct nbd_reply *prply)
diff --git a/nbd-trdump.c b/nbd-trdump.c
index d914e63..1e3017e 100644
--- a/nbd-trdump.c
+++ b/nbd-trdump.c
@@ -44,7 +44,7 @@ int main(int argc, char**argv) {
 	struct nbd_request req;
 	struct nbd_reply rep;
 	uint32_t magic;
-	uint64_t handle;
+	uint64_t cookie;
 	uint32_t error;
 	uint32_t command;
 	uint32_t len;
@@ -70,7 +70,7 @@ int main(int argc, char**argv) {
 		switch (magic) {
 		case NBD_REQUEST_MAGIC:
 			doread(readfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
-			handle = ntohll(*((long long int *)(req.handle)));
+			cookie = ntohll(*((long long int *)(req.cookie)));
 			offset = ntohll(req.from);
 			len = ntohl(req.len);
 			command = ntohl(req.type);
@@ -78,7 +78,7 @@ int main(int argc, char**argv) {
 			ctext = getcommandname(command & NBD_CMD_MASK_COMMAND);

 			printf("> H=%016llx C=0x%08x (%20s+%4s) O=%016llx L=%08x\n",
-			       (long long unsigned int) handle,
+			       (long long unsigned int) cookie,
 			       command,
 			       ctext,
 			       (command & NBD_CMD_FLAG_FUA)?"FUA":"NONE",
@@ -99,17 +99,17 @@ int main(int argc, char**argv) {
 			break;
 		case NBD_REPLY_MAGIC:
 			doread(readfd, sizeof(magic)+(char *)(&rep), sizeof(struct nbd_reply)-sizeof(magic));
-			handle = ntohll(*((long long int *)(rep.handle)));
+			cookie = ntohll(*((long long int *)(rep.cookie)));
 			error = ntohl(rep.error);
 			
 			printf("< H=%016llx E=0x%08x\n",
-			       (long long unsigned int) handle,
+			       (long long unsigned int) cookie,
 			       error);
 			break;
 			
 		case NBD_TRACELOG_MAGIC:
 			doread(readfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
-			handle = ntohll(*((long long int *)(req.handle)));
+			cookie = ntohll(*((long long int *)(req.cookie)));
 			offset = ntohll(req.from);
 			len = ntohl(req.len);
 			command = ntohl(req.type);
diff --git a/nbd-trplay.c b/nbd-trplay.c
index 143d8cb..698800e 100644
--- a/nbd-trplay.c
+++ b/nbd-trplay.c
@@ -149,7 +149,7 @@ int main_loop(int logfd, int imagefd) {
 	struct nbd_request req;
 	struct nbd_reply rep;
 	uint32_t magic;
-	uint64_t handle;
+	uint64_t cookie;
 	uint32_t error;
 	uint32_t command;
 	uint32_t len;
@@ -163,7 +163,7 @@ int main_loop(int logfd, int imagefd) {
 		switch (magic) {
 		case NBD_REQUEST_MAGIC:
 			doread(logfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
-			handle = ntohll(*((long long int *)(req.handle)));
+			cookie = ntohll(*((long long int *)(req.cookie)));
 			offset = ntohll(req.from);
 			len = ntohl(req.len);
 			command = ntohl(req.type);
@@ -172,7 +172,7 @@ int main_loop(int logfd, int imagefd) {

 			if (g_verbose >= VERBOSE_NORMAL) {
 				printf("> H=%016llx C=0x%08x (%13s+%4s) O=%016llx L=%08x\n",
-				       (long long unsigned int) handle,
+				       (long long unsigned int) cookie,
 				       command,
 				       ctext,
 				       (command & NBD_CMD_FLAG_FUA)?"FUA":"NONE",
@@ -185,19 +185,19 @@ int main_loop(int logfd, int imagefd) {

 		case NBD_REPLY_MAGIC:
 			doread(logfd, sizeof(magic)+(char *)(&rep), sizeof(struct nbd_reply)-sizeof(magic));
-			handle = ntohll(*((long long int *)(rep.handle)));
+			cookie = ntohll(*((long long int *)(rep.cookie)));
 			error = ntohl(rep.error);

 			if (g_verbose >= VERBOSE_NORMAL) {
 				printf("< H=%016llx E=0x%08x\n",
-				       (long long unsigned int) handle,
+				       (long long unsigned int) cookie,
 				       error);
 			}
 			break;

 		case NBD_TRACELOG_MAGIC:
 			doread(logfd, sizeof(magic)+(char *)(&req), sizeof(struct nbd_request)-sizeof(magic));
-			handle = ntohll(*((long long int *)(req.handle)));
+			cookie = ntohll(*((long long int *)(req.cookie)));
 			offset = ntohll(req.from);
 			len = ntohl(req.len);
 			command = ntohl(req.type);
diff --git a/nbd.h b/nbd.h
index caa3595..156405a 100644
--- a/nbd.h
+++ b/nbd.h
@@ -78,7 +78,7 @@ enum {
 struct nbd_request {
 	uint32_t magic;
 	uint32_t type;	/* == READ || == WRITE 	*/
-	char handle[8];
+	char cookie[8];
 	uint64_t from;
 	uint32_t len;
 } __attribute__ ((packed));
@@ -90,6 +90,6 @@ struct nbd_request {
 struct nbd_reply {
 	uint32_t magic;
 	uint32_t error;		/* 0 = ok, else error	*/
-	char handle[8];		/* handle you got from request	*/
+	char cookie[8];		/* cookie you got from request	*/
 } __attribute__ ((packed));
 #endif
diff --git a/tests/run/nbd-tester-client.c b/tests/run/nbd-tester-client.c
index 1b4f595..d09308a 100644
--- a/tests/run/nbd-tester-client.c
+++ b/tests/run/nbd-tester-client.c
@@ -73,7 +73,7 @@ typedef enum {

 struct reqcontext {
 	uint64_t seq;
-	char orighandle[8];
+	char origcookie[8];
 	struct nbd_request req;
 	struct reqcontext *next;
 	struct reqcontext *prev;
@@ -680,7 +680,7 @@ int close_connection(int sock, CLOSE_TYPE type)
 	case CONNECTION_CLOSE_PROPERLY:
 		req.magic = htonl(NBD_REQUEST_MAGIC);
 		req.type = htonl(NBD_CMD_DISC);
-		memcpy(&(req.handle), &(counter), sizeof(counter));
+		memcpy(&(req.cookie), &(counter), sizeof(counter));
 		counter++;
 		req.from = 0;
 		req.len = 0;
@@ -705,7 +705,7 @@ int close_connection(int sock, CLOSE_TYPE type)
 	return 0;
 }

-int read_packet_check_header(int sock, size_t datasize, long long int curhandle)
+int read_packet_check_header(int sock, size_t datasize, long long int curcookie)
 {
 	struct nbd_reply rep;
 	int retval = 0;
@@ -717,11 +717,11 @@ int read_packet_check_header(int sock, size_t datasize, long long int curhandle)
 	rep.error = ntohl(rep.error);
 	if (rep.magic != NBD_REPLY_MAGIC) {
 		snprintf(errstr, errstr_len,
-			 "Received package with incorrect reply_magic. Index of sent packages is %lld (0x%llX), received handle is %lld (0x%llX). Received magic 0x%lX, expected 0x%lX",
-			 (long long int)curhandle,
-			 (long long unsigned int)curhandle,
-			 (long long int)*((u64 *) rep.handle),
-			 (long long unsigned int)*((u64 *) rep.handle),
+			 "Received package with incorrect reply_magic. Index of sent packages is %lld (0x%llX), received cookie is %lld (0x%llX). Received magic 0x%lX, expected 0x%lX",
+			 (long long int)curcookie,
+			 (long long unsigned int)curcookie,
+			 (long long int)*((u64 *) rep.cookie),
+			 (long long unsigned int)*((u64 *) rep.cookie),
 			 (long unsigned int)rep.magic,
 			 (long unsigned int)NBD_REPLY_MAGIC);
 		retval = -1;
@@ -729,10 +729,10 @@ int read_packet_check_header(int sock, size_t datasize, long long int curhandle)
 	}
 	if (rep.error) {
 		snprintf(errstr, errstr_len,
-			 "Received error from server: %ld (0x%lX). Handle is %lld (0x%llX).",
+			 "Received error from server: %ld (0x%lX). Cookie is %lld (0x%llX).",
 			 (long int)rep.error, (long unsigned int)rep.error,
-			 (long long int)(*((u64 *) rep.handle)),
-			 (long long unsigned int)*((u64 *) rep.handle));
+			 (long long int)(*((u64 *) rep.cookie)),
+			 (long long unsigned int)*((u64 *) rep.cookie));
 		retval = -2;
 		goto end;
 	}
@@ -767,7 +767,7 @@ int oversize_test(char *name, int sock, char close_sock, int testflags)
 	req.magic = htonl(NBD_REQUEST_MAGIC);
 	req.type = htonl(NBD_CMD_READ);
 	req.len = htonl(1024 * 1024);
-	memcpy(&(req.handle), &i, sizeof(i));
+	memcpy(&(req.cookie), &i, sizeof(i));
 	req.from = htonll(i);
 	WRITE_ALL_ERR_RT(sock, &req, sizeof(req), err, -1,
 			 "Could not write request: %s", strerror(errno));
@@ -971,7 +971,7 @@ int throughput_test(char *name, int sock, char close_sock, int testflags)
 			if (sendfua)
 				req.type =
 				    htonl(NBD_CMD_WRITE | NBD_CMD_FLAG_FUA);
-			memcpy(&(req.handle), &i, sizeof(i));
+			memcpy(&(req.cookie), &i, sizeof(i));
 			req.from = htonll(i);
 			if (write_all(sock, &req, sizeof(req)) < 0) {
 				retval = -1;
@@ -987,7 +987,7 @@ int throughput_test(char *name, int sock, char close_sock, int testflags)
 			if (sendflush) {
 				long long int j = i ^ (1LL << 63);
 				req.type = htonl(NBD_CMD_FLUSH);
-				memcpy(&(req.handle), &j, sizeof(j));
+				memcpy(&(req.cookie), &j, sizeof(j));
 				req.from = 0;
 				req.len = 0;
 				if (write_all(sock, &req, sizeof(req)) < 0) {
@@ -1104,8 +1104,8 @@ err:

 /*
  * fill 512 byte buffer 'buf' with a hashed selection of interesting data based
- * only on handle and blknum. The first word is blknum, and the second handle, for ease
- * of understanding. Things with handle 0 are blank.
+ * only on cookie and blknum. The first word is blknum, and the second cookie, for ease
+ * of understanding. Things with cookie 0 are blank.
  */
 static inline void makebuf(char *buf, uint64_t seq, uint64_t blknum)
 {
@@ -1161,17 +1161,17 @@ static inline void dumpcommand(char *text, uint32_t command)
 #endif
 }

-/* return an unused handle */
-uint64_t getrandomhandle(GHashTable * phash)
+/* return an unused cookie */
+uint64_t getrandomcookie(GHashTable * phash)
 {
-	uint64_t handle = 0;
+	uint64_t cookie = 0;
 	int i;
 	do {
 		/* RAND_MAX may be as low as 2^15 */
 		for (i = 1; i <= 5; i++)
-			handle ^= random() ^ (handle << 15);
-	} while (g_hash_table_lookup(phash, &handle));
-	return handle;
+			cookie ^= random() ^ (cookie << 15);
+	} while (g_hash_table_lookup(phash, &cookie));
+	return cookie;
 }

 int integrity_test(char *name, int sock, char close_sock, int testflags)
@@ -1203,7 +1203,7 @@ int integrity_test(char *name, int sock, char close_sock, int testflags)
 	struct rclist inflight = { NULL, NULL, 0 };
 	struct chunklist txbuf = { NULL, NULL, 0 };

-	GHashTable *handlehash = g_hash_table_new(g_int64_hash, g_int64_equal);
+	GHashTable *cookiehash = g_hash_table_new(g_int64_hash, g_int64_equal);

 	size = 0;
 	if ((sock =
@@ -1334,7 +1334,7 @@ int integrity_test(char *name, int sock, char close_sock, int testflags)
 						"Could not read transaction log: %s",
 						strerror(errno));
 				prc->req.magic = htonl(NBD_REQUEST_MAGIC);
-				memcpy(prc->orighandle, prc->req.handle, 8);
+				memcpy(prc->origcookie, prc->req.cookie, 8);
 				prc->seq = seq++;
 				if ((ntohl(prc->req.type) &
 				     NBD_CMD_MASK_COMMAND) == NBD_CMD_DISC) {
@@ -1438,10 +1438,10 @@ int integrity_test(char *name, int sock, char close_sock, int testflags)
 				rclist_addtail(&inflight, prc);

 				dumpcommand("Sending command", prc->req.type);
-				/* we rewrite the handle as they otherwise may not be unique */
-				*((uint64_t *) (prc->req.handle)) =
-				    getrandomhandle(handlehash);
-				g_hash_table_insert(handlehash, prc->req.handle,
+				/* we rewrite the cookie as they otherwise may not be unique */
+				*((uint64_t *) (prc->req.cookie)) =
+				    getrandomcookie(cookiehash);
+				g_hash_table_insert(cookiehash, prc->req.cookie,
 						    prc);
 				addbuffer(&txbuf, &(prc->req),
 					  sizeof(struct nbd_request));
@@ -1537,21 +1537,21 @@ skipdequeue:
 				goto err_open;
 			}

-			uint64_t handle;
-			memcpy(&handle, rep.handle, 8);
-			prc = g_hash_table_lookup(handlehash, &handle);
+			uint64_t cookie;
+			memcpy(&cookie, rep.cookie, 8);
+			prc = g_hash_table_lookup(cookiehash, &cookie);
 			if (!prc) {
 				snprintf(errstr, errstr_len,
-					 "Unrecognised handle in reply: 0x%llX",
+					 "Unrecognised cookie in reply: 0x%llX",
 					 *(long long unsigned int *)(rep.
-								     handle));
+								     cookie));
 				goto err_open;
 			}
-			if (!g_hash_table_remove(handlehash, &handle)) {
+			if (!g_hash_table_remove(cookiehash, &cookie)) {
 				snprintf(errstr, errstr_len,
-					 "Could not remove handle from hash: 0x%llX",
+					 "Could not remove cookie from hash: 0x%llX",
 					 *(long long unsigned int *)(rep.
-								     handle));
+								     cookie));
 				goto err_open;
 			}

@@ -1696,7 +1696,7 @@ err:
 	if (*errstr)
 		g_warning("%s", errstr);

-	g_hash_table_destroy(handlehash);
+	g_hash_table_destroy(cookiehash);

 	return retval;
 }
-- 
2.39.2

