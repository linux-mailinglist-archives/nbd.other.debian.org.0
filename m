Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97D54E009
	for <lists+nbd@lfdr.de>; Thu, 16 Jun 2022 13:30:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DB6F520580; Thu, 16 Jun 2022 11:30:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 16 11:30:08 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	FVGT_m_MULTI_ODD,LDOSUBSCRIBER,LDO_WHITELIST,MONEY,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,STOCKLIKE,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6572020579
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Jun 2022 11:29:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.717 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.147,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02,
	LDO_WHITELIST=-5, MONEY=0.5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, STOCKLIKE=1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id t5NhwFOY6Sp2 for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Jun 2022 11:29:53 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 8E5CD2056D
	for <nbd@other.debian.org>; Thu, 16 Jun 2022 11:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655378988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=er2f+Hfx2Wg8exFOu3IPf63E0BOcLMqdPFJ9WWWnRC8=;
	b=NsohSb6Qp2b17z60TzVGuWxuuO+BTkLzdKkZVS9Ge0Oq9M1jC8tSpM0+r5c52x7oPEX7Ew
	gYDz5G37XxfFFBgQCMC1El8LCpVykhWe8TJZccaagki1ilrIwCO02f5Fxdv698mmjClPWW
	HwqCtL6XqwqXz5pcuI1Gzp6p3zcE16c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-DBfEtp1cP3-IZRmi1tLRJQ-1; Thu, 16 Jun 2022 07:29:47 -0400
X-MC-Unique: DBfEtp1cP3-IZRmi1tLRJQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45D013803901;
	Thu, 16 Jun 2022 11:29:47 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 098FE492CA5;
	Thu, 16 Jun 2022 11:29:45 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: josef@toxicpanda.com
Cc: axboe@kernel.dk,
	prasanna.kalever@redhat.com,
	xiubli@redhat.com,
	ming.lei@redhat.com,
	nbd@other.debian.org,
	eblake@redhat.com
Subject: [PATCH nbd-client] client: Request NBD_INFO_BLOCK_SIZE and set constraints in the kernel
Date: Thu, 16 Jun 2022 12:29:42 +0100
Message-Id: <20220616112942.3222708-2-rjones@redhat.com>
In-Reply-To: <20220616112942.3222708-1-rjones@redhat.com>
References: <20220616112942.3222708-1-rjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <KQqqQXDFQt.A.t7H.ARxqiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2146
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220616112942.3222708-2-rjones@redhat.com
Resent-Date: Thu, 16 Jun 2022 11:30:08 +0000 (UTC)

NBD servers may advertise their minimum, preferred and maximum block
size constraints.  The constraints do not map well to what the kernel
expects, so see this design document for the mapping used here:
https://lists.debian.org/nbd/2022/06/msg00022.html

This patch only does the smallest change to read these constraints
from the server and map the preferred block size to kernel hints
minimum_io_size and optimal_io_size.  The minimum and maximum
constraints are ignored for now.

The names of the kernel hints are very confusing, and do not refer to
the "minimum" of anything, see this document for an explanation:
https://people.redhat.com/msnitzer/docs/io-limits.txt

This requires a separate kernel patch which allows setting the
minimum_io_size and optimal_io_size through netlink attributes
NBD_ATTR_BLOCK_SIZE_MIN and NBD_ATTR_BLOCK_SIZE_OPT.  Older kernels
ignore these attributes.

Example of usage:

$ nbdkit -fv memory 1G --filter=blocksize-policy blocksize-preferred=65536

$ sudo ./nbd-client server /dev/nbd0
Warning: the oldstyle protocol is no longer supported.
This method now uses the newstyle protocol with a default export
Negotiation: ..size = 1024MB

$ cat /sys/devices/virtual/block/nbd0/queue/minimum_io_size
65536
$ cat /sys/devices/virtual/block/nbd0/queue/optimal_io_size
65536

Tools such as parted and mkfs may use these hints to align partitions,
filesystem structures etc to (in this example) 64K.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 nbd-client.c  | 51 ++++++++++++++++++++++++++++++++++++++++++++-------
 nbd-netlink.h |  5 +++++
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/nbd-client.c b/nbd-client.c
index c187e8c..4871b9d 100644
--- a/nbd-client.c
+++ b/nbd-client.c
@@ -168,7 +168,7 @@ static struct nl_sock *get_nbd_socket(int *driver_id) {
 
 static void netlink_configure(int index, int *sockfds, int num_connects,
 			      u64 size64, int blocksize, uint16_t flags,
-			      int timeout) {
+			      uint32_t *block_sizes, int timeout) {
 	struct nl_sock *socket;
 	struct nlattr *sock_attr;
 	struct nl_msg *msg;
@@ -186,6 +186,9 @@ static void netlink_configure(int index, int *sockfds, int num_connects,
 		NLA_PUT_U32(msg, NBD_ATTR_INDEX, index);
 	NLA_PUT_U64(msg, NBD_ATTR_SIZE_BYTES, size64);
 	NLA_PUT_U64(msg, NBD_ATTR_BLOCK_SIZE_BYTES, blocksize);
+	/* Set both minimum_io_size & optimal_io_size to the preferred size. */
+	NLA_PUT_U32(msg, NBD_ATTR_BLOCK_SIZE_MIN, block_sizes[1]);
+	NLA_PUT_U32(msg, NBD_ATTR_BLOCK_SIZE_OPT, block_sizes[1]);
 	NLA_PUT_U64(msg, NBD_ATTR_SERVER_FLAGS, flags);
 	if (timeout)
 		NLA_PUT_U64(msg, NBD_ATTR_TIMEOUT, timeout);
@@ -241,7 +244,7 @@ nla_put_failure:
 #else
 static void netlink_configure(int index, int *sockfds, int num_connects,
 			      u64 size64, int blocksize, uint16_t flags,
-			      int timeout)
+			      uint32_t *block_sizes, int timeout)
 {
 }
 
@@ -529,6 +532,28 @@ void parse_sizes(char *buf, uint64_t *size, uint16_t *flags) {
 	printf("\n");
 }
 
+/* Parse reply from NBD_INFO_BLOCK_SIZE */
+void parse_block_sizes(char *data, uint32_t datasize, uint32_t *block_sizes)
+{
+	if (datasize < 3 * sizeof(uint32_t)) {
+		err("E: server sent too short reply to NBD_INFO_BLOCK_SIZE, ignoring");
+		return;
+	}
+	memcpy(&block_sizes[0], &data[0], sizeof(uint32_t));
+	block_sizes[0] = ntohl(block_sizes[0]);
+	memcpy(&block_sizes[1], &data[4], sizeof(uint32_t));
+	block_sizes[1] = ntohl(block_sizes[1]);
+	memcpy(&block_sizes[2], &data[8], sizeof(uint32_t));
+	block_sizes[2] = ntohl(block_sizes[2]);
+
+#if 0
+	printf("server block sizes: min: %ld, pref: %ld, max: %ld\n",
+	       (long) block_sizes[0],
+	       (long) block_sizes[1],
+	       (long) block_sizes[2]);
+#endif
+}
+
 void send_opt_exportname(int sock, u64 *rsize64, uint16_t *flags, bool can_opt_go, char* name, uint16_t global_flags) {
 	send_request(sock, NBD_OPT_EXPORT_NAME, -1, name);
 	char b[sizeof(*flags) + sizeof(*rsize64)];
@@ -542,10 +567,12 @@ void send_opt_exportname(int sock, u64 *rsize64, uint16_t *flags, bool can_opt_g
 	}
 }
 
-void negotiate(int *sockp, u64 *rsize64, uint16_t *flags, char* name, uint32_t needed_flags, uint32_t client_flags, uint32_t do_opts, char *certfile, char *keyfile, char *cacertfile, char *tlshostname, bool tls, bool can_opt_go) {
+void negotiate(int *sockp, u64 *rsize64, uint16_t *flags, uint32_t *block_sizes, char* name, uint32_t needed_flags, uint32_t client_flags, uint32_t do_opts, char *certfile, char *keyfile, char *cacertfile, char *tlshostname, bool tls, bool can_opt_go) {
 	u64 magic;
 	uint16_t tmp;
 	uint16_t global_flags;
+	uint16_t info_reqs[1];
+	int nr_info_reqs = 0;
 	char buf[256] = "\0\0\0\0\0\0\0\0\0";
 	int sock = *sockp;
 
@@ -682,7 +709,12 @@ void negotiate(int *sockp, u64 *rsize64, uint16_t *flags, char* name, uint32_t n
 		return;
 	}
 
-	send_info_request(sock, NBD_OPT_GO, 0, NULL, name);
+	block_sizes[0] = 1; /* default minimum */
+	block_sizes[1] = 4096; /* default preferred */
+	block_sizes[2] = 0xffffffff; /* default maximum */
+	info_reqs[nr_info_reqs] = htons(NBD_INFO_BLOCK_SIZE);
+	nr_info_reqs++;
+	send_info_request(sock, NBD_OPT_GO, nr_info_reqs, info_reqs, name);
 
 	do {
 		if(rep != NULL) free(rep);
@@ -726,6 +758,9 @@ void negotiate(int *sockp, u64 *rsize64, uint16_t *flags, char* name, uint32_t n
 					case NBD_INFO_EXPORT:
 						parse_sizes(rep->data + 2, rsize64, flags);
 						break;
+					case NBD_INFO_BLOCK_SIZE:
+						parse_block_sizes(rep->data + 2, rep->datasize - 2, block_sizes);
+						break;
 					default:
 						// ignore these, don't need them
 						break;
@@ -934,6 +969,7 @@ int main(int argc, char *argv[]) {
 	u64 size64 = 0;
 	u64 force_size64 = 0;
 	uint16_t flags = 0;
+	uint32_t block_sizes[3]; // NBD_INFO_BLOCK_SIZE (min, pref, max)
 	bool force_read_only = false;
 	bool preinit = false;
 	int c;
@@ -1222,7 +1258,7 @@ int main(int argc, char *argv[]) {
 			exit(EXIT_FAILURE);
 
 		if (!preinit)
-			negotiate(&sock, &size64, &flags, name, needed_flags, cflags, opts, certfile, keyfile, cacertfile, tlshostname, tls, can_opt_go);
+			negotiate(&sock, &size64, &flags, block_sizes, name, needed_flags, cflags, opts, certfile, keyfile, cacertfile, tlshostname, tls, can_opt_go);
 		if (force_read_only)
 			flags |= NBD_FLAG_READ_ONLY;
 		if (force_size64)
@@ -1255,7 +1291,8 @@ int main(int argc, char *argv[]) {
 				err("Invalid nbd device target\n");
 		}
 		netlink_configure(index, sockfds, num_connections,
-				  size64, blocksize, flags, timeout);
+				  size64, blocksize, flags, block_sizes,
+				  timeout);
 		return 0;
 	}
 	/* Go daemon */
@@ -1340,7 +1377,7 @@ int main(int argc, char *argv[]) {
 					nbd = open(nbddev, O_RDWR);
 					if (nbd < 0)
 						err("Cannot open NBD: %m");
-					negotiate(&sock, &new_size, &new_flags, name, needed_flags, cflags, opts, certfile, keyfile, cacertfile, tlshostname, tls, can_opt_go);
+					negotiate(&sock, &new_size, &new_flags, block_sizes, name, needed_flags, cflags, opts, certfile, keyfile, cacertfile, tlshostname, tls, can_opt_go);
 					if (size64 != new_size) {
 						err("Size of the device changed. Bye");
 					}
diff --git a/nbd-netlink.h b/nbd-netlink.h
index fd0f4e4..9901f1b 100644
--- a/nbd-netlink.h
+++ b/nbd-netlink.h
@@ -31,6 +31,11 @@ enum {
 	NBD_ATTR_SERVER_FLAGS,
 	NBD_ATTR_CLIENT_FLAGS,
 	NBD_ATTR_SOCKETS,
+	NBD_ATTR_DEAD_CONN_TIMEOUT,
+	NBD_ATTR_DEVICE_LIST,
+	NBD_ATTR_BACKEND_IDENTIFIER,
+	NBD_ATTR_BLOCK_SIZE_MIN,
+	NBD_ATTR_BLOCK_SIZE_OPT,
 	__NBD_ATTR_MAX,
 };
 #define NBD_ATTR_MAX (__NBD_ATTR_MAX - 1)
-- 
2.35.1

