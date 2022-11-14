Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 671A9628D1B
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:05:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4CF512067E; Mon, 14 Nov 2022 23:05:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:05:06 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 72ABB20545
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:04:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id djIL0i3IaPfI for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:04:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id AA96F20616
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668467064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PZNu2AF6MBsi9Ah1ozXMZKmwajLMlwncx100VmFpWow=;
	b=EhRhTjltJLu2yij8lm3bQHqeiqXD7WzpiBLCHhgIA140ZNDz3T321z3WtLq7/eYfYwnDle
	+z8ZUlKqi0k/b2Mukhtb5a6q3EweXivcLfdA3GBegcPH9tRODYQkBX+8bMIH3LouflQ/SM
	o80pBEhcRmD+FhrOqnXEyGmt1bUtPUw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-EqmQR09AN4eyXcyymeTgpw-1; Mon, 14 Nov 2022 17:49:03 -0500
X-MC-Unique: EqmQR09AN4eyXcyymeTgpw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 190C0811E67;
	Mon, 14 Nov 2022 22:49:03 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7421240E42E5;
	Mon, 14 Nov 2022 22:49:02 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	nbd@other.debian.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 11/15] nbd/client: Request extended headers during negotiation
Date: Mon, 14 Nov 2022 16:48:44 -0600
Message-Id: <20221114224848.2186298-12-eblake@redhat.com>
In-Reply-To: <20221114224848.2186298-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114224848.2186298-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uEa8yeMvSAE.A.Z6D.imscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2286
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224848.2186298-12-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:05:06 +0000 (UTC)

All the pieces are in place for a client to finally request extended
headers.  Note that we must not request extended headers when qemu-nbd
is used to connect to the kernel module (as nbd.ko does not expect
them), but there is no harm in all other clients requesting them.

Extended headers are not essential to the information collected during
'qemu-nbd --list', but probing for it gives us one more piece of
information in that output.  Update the iotests affected by the new
line of output.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/client-connection.c                       |  1 +
 nbd/client.c                                  | 35 +++++++++++++------
 qemu-nbd.c                                    |  2 ++
 tests/qemu-iotests/223.out                    |  6 ++++
 tests/qemu-iotests/233.out                    |  5 +++
 tests/qemu-iotests/241.out                    |  3 ++
 tests/qemu-iotests/307.out                    |  5 +++
 .../tests/nbd-qemu-allocation.out             |  1 +
 8 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 0c5f917efa..3576190d09 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -93,6 +93,7 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,

         .initial_info.request_sizes = true,
         .initial_info.structured_reply = true,
+        .initial_info.extended_headers = true,
         .initial_info.base_allocation = true,
         .initial_info.x_dirty_bitmap = g_strdup(x_dirty_bitmap),
         .initial_info.name = g_strdup(export_name ?: "")
diff --git a/nbd/client.c b/nbd/client.c
index 70f06ce637..413304f553 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -878,12 +878,13 @@ static int nbd_list_meta_contexts(QIOChannel *ioc,
  *          1: server is newstyle, but can only accept EXPORT_NAME
  *          2: server is newstyle, but lacks structured replies
  *          3: server is newstyle and set up for structured replies
+ *          4: server is newstyle and set up for extended headers
  */
 static int nbd_start_negotiate(AioContext *aio_context, QIOChannel *ioc,
                                QCryptoTLSCreds *tlscreds,
                                const char *hostname, QIOChannel **outioc,
-                               bool structured_reply, bool *zeroes,
-                               Error **errp)
+                               bool structured_reply, bool ext_hdrs,
+                               bool *zeroes, Error **errp)
 {
     ERRP_GUARD();
     uint64_t magic;
@@ -960,15 +961,23 @@ static int nbd_start_negotiate(AioContext *aio_context, QIOChannel *ioc,
         if (fixedNewStyle) {
             int result = 0;

-            if (structured_reply) {
+            if (ext_hdrs) {
+                result = nbd_request_simple_option(ioc,
+                                                   NBD_OPT_EXTENDED_HEADERS,
+                                                   false, errp);
+                if (result) {
+                    return result < 0 ? -EINVAL : 4;
+                }
+            }
+            if (structured_reply && !result) {
                 result = nbd_request_simple_option(ioc,
                                                    NBD_OPT_STRUCTURED_REPLY,
                                                    false, errp);
-                if (result < 0) {
-                    return -EINVAL;
+                if (result) {
+                    return result < 0 ? -EINVAL : 3;
                 }
             }
-            return 2 + result;
+            return 2;
         } else {
             return 1;
         }
@@ -1030,7 +1039,8 @@ int nbd_receive_negotiate(AioContext *aio_context, QIOChannel *ioc,
     trace_nbd_receive_negotiate_name(info->name);

     result = nbd_start_negotiate(aio_context, ioc, tlscreds, hostname, outioc,
-                                 info->structured_reply, &zeroes, errp);
+                                 info->structured_reply,
+                                 info->extended_headers, &zeroes, errp);

     info->structured_reply = false;
     info->extended_headers = false;
@@ -1040,6 +1050,9 @@ int nbd_receive_negotiate(AioContext *aio_context, QIOChannel *ioc,
     }

     switch (result) {
+    case 4: /* newstyle, with extended headers */
+        info->extended_headers = true;
+        /* fall through */
     case 3: /* newstyle, with structured replies */
         info->structured_reply = true;
         if (base_allocation) {
@@ -1151,7 +1164,7 @@ int nbd_receive_export_list(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,

     *info = NULL;
     result = nbd_start_negotiate(NULL, ioc, tlscreds, hostname, &sioc, true,
-                                 NULL, errp);
+                                 true, NULL, errp);
     if (tlscreds && sioc) {
         ioc = sioc;
     }
@@ -1159,6 +1172,7 @@ int nbd_receive_export_list(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
     switch (result) {
     case 2:
     case 3:
+    case 4:
         /* newstyle - use NBD_OPT_LIST to populate array, then try
          * NBD_OPT_INFO on each array member. If structured replies
          * are enabled, also try NBD_OPT_LIST_META_CONTEXT. */
@@ -1179,7 +1193,8 @@ int nbd_receive_export_list(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
             memset(&array[count - 1], 0, sizeof(*array));
             array[count - 1].name = name;
             array[count - 1].description = desc;
-            array[count - 1].structured_reply = result == 3;
+            array[count - 1].structured_reply = result >= 3;
+            array[count - 1].extended_headers = result >= 4;
         }

         for (i = 0; i < count; i++) {
@@ -1195,7 +1210,7 @@ int nbd_receive_export_list(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
                 break;
             }

-            if (result == 3 &&
+            if (result >= 3 &&
                 nbd_list_meta_contexts(ioc, &array[i], errp) < 0) {
                 goto out;
             }
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 0cd5aa6f02..9404164487 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -238,6 +238,8 @@ static int qemu_nbd_client_list(SocketAddress *saddr, QCryptoTLSCreds *tls,
             printf("  opt block: %u\n", list[i].opt_block);
             printf("  max block: %u\n", list[i].max_block);
         }
+        printf("  transaction size: %s\n",
+               list[i].extended_headers ? "64-bit" : "32-bit");
         if (list[i].n_contexts) {
             printf("  available meta contexts: %d\n", list[i].n_contexts);
             for (j = 0; j < list[i].n_contexts; j++) {
diff --git a/tests/qemu-iotests/223.out b/tests/qemu-iotests/223.out
index 26fb347c5d..b98582c38e 100644
--- a/tests/qemu-iotests/223.out
+++ b/tests/qemu-iotests/223.out
@@ -87,6 +87,7 @@ exports available: 3
   min block: 1
   opt block: 4096
   max block: 33554432
+  transaction size: 64-bit
   available meta contexts: 2
    base:allocation
    qemu:dirty-bitmap:b
@@ -97,6 +98,7 @@ exports available: 3
   min block: 1
   opt block: 4096
   max block: 33554432
+  transaction size: 64-bit
   available meta contexts: 2
    base:allocation
    qemu:dirty-bitmap:b2
@@ -106,6 +108,7 @@ exports available: 3
   min block: 1
   opt block: 4096
   max block: 33554432
+  transaction size: 64-bit
   available meta contexts: 2
    base:allocation
    qemu:dirty-bitmap:b3
@@ -206,6 +209,7 @@ exports available: 3
   min block: 1
   opt block: 4096
   max block: 33554432
+  transaction size: 64-bit
   available meta contexts: 2
    base:allocation
    qemu:dirty-bitmap:b
@@ -216,6 +220,7 @@ exports available: 3
   min block: 1
   opt block: 4096
   max block: 33554432
+  transaction size: 64-bit
   available meta contexts: 2
    base:allocation
    qemu:dirty-bitmap:b2
@@ -225,6 +230,7 @@ exports available: 3
   min block: 1
   opt block: 4096
   max block: 33554432
+  transaction size: 64-bit
   available meta contexts: 2
    base:allocation
    qemu:dirty-bitmap:b3
diff --git a/tests/qemu-iotests/233.out b/tests/qemu-iotests/233.out
index 237c82767e..33cb622ecf 100644
--- a/tests/qemu-iotests/233.out
+++ b/tests/qemu-iotests/233.out
@@ -53,6 +53,11 @@ exports available: 1
  export: ''
   size:  67108864
   min block: 1
+  opt block: 4096
+  max block: 33554432
+  transaction size: 64-bit
+  available meta contexts: 1
+   base:allocation

 == check TLS with different CA fails ==
 qemu-img: Could not open 'driver=nbd,host=127.0.0.1,port=PORT,tls-creds=tls0': The certificate hasn't got a known issuer
diff --git a/tests/qemu-iotests/241.out b/tests/qemu-iotests/241.out
index 88e8cfcd7e..a9efb87652 100644
--- a/tests/qemu-iotests/241.out
+++ b/tests/qemu-iotests/241.out
@@ -6,6 +6,7 @@ exports available: 1
  export: ''
   size:  1024
   min block: 1
+  transaction size: 64-bit
 [{ "start": 0, "length": 1000, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
 { "start": 1000, "length": 24, "depth": 0, "present": true, "zero": true, "data": false, "offset": OFFSET}]
 1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)
@@ -16,6 +17,7 @@ exports available: 1
  export: ''
   size:  1024
   min block: 512
+  transaction size: 64-bit
 [{ "start": 0, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET}]
 1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)
 WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed raw.
@@ -28,6 +30,7 @@ exports available: 1
  export: ''
   size:  1024
   min block: 1
+  transaction size: 64-bit
 [{ "start": 0, "length": 1000, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
 { "start": 1000, "length": 24, "depth": 0, "present": true, "zero": true, "data": false, "offset": OFFSET}]
 1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index 390f05d1b7..2b9a6a67a1 100644
--- a/tests/qemu-iotests/307.out
+++ b/tests/qemu-iotests/307.out
@@ -19,6 +19,7 @@ exports available: 1
   min block: XXX
   opt block: XXX
   max block: XXX
+  transaction size: 64-bit
   available meta contexts: 1
    base:allocation

@@ -47,6 +48,7 @@ exports available: 1
   min block: XXX
   opt block: XXX
   max block: XXX
+  transaction size: 64-bit
   available meta contexts: 1
    base:allocation

@@ -78,6 +80,7 @@ exports available: 2
   min block: XXX
   opt block: XXX
   max block: XXX
+  transaction size: 64-bit
   available meta contexts: 1
    base:allocation
  export: 'export1'
@@ -87,6 +90,7 @@ exports available: 2
   min block: XXX
   opt block: XXX
   max block: XXX
+  transaction size: 64-bit
   available meta contexts: 1
    base:allocation

@@ -113,6 +117,7 @@ exports available: 1
   min block: XXX
   opt block: XXX
   max block: XXX
+  transaction size: 64-bit
   available meta contexts: 1
    base:allocation

diff --git a/tests/qemu-iotests/tests/nbd-qemu-allocation.out b/tests/qemu-iotests/tests/nbd-qemu-allocation.out
index 9d938db24e..659276032b 100644
--- a/tests/qemu-iotests/tests/nbd-qemu-allocation.out
+++ b/tests/qemu-iotests/tests/nbd-qemu-allocation.out
@@ -21,6 +21,7 @@ exports available: 1
   min block: 1
   opt block: 4096
   max block: 33554432
+  transaction size: 64-bit
   available meta contexts: 2
    base:allocation
    qemu:allocation-depth
-- 
2.38.1

