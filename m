Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD9346806B
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:32:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E39DC2015F; Fri,  3 Dec 2021 23:32:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:32:13 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 884F620153
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:32:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.83 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6pOt2rKAbsNE for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:32:02 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id B590020154
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e3EFnsJPDPwJun1aJgNjzdxKlbpcPi3Uc2vcMyYqxMU=;
	b=gkMRm/V33dRqhRtNvw9yyaMJXn39Tvw0ZPdmjQcFTVKf3aiKTkMIbBwLMPNK+HMDeBIOgY
	Jvt641fhBe+PlJ78Y34Yz1N2FqXp+YUcuJUwVCosMdVfdvu3YbgC9oYNlH9reds7rgSRVL
	0vHuYdpzGPaowWosoJiE+SBnEG/AJc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-LBQL7h2ePAypq2JN-qyjCg-1; Fri, 03 Dec 2021 18:16:35 -0500
X-MC-Unique: LBQL7h2ePAypq2JN-qyjCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCBB4100CCC0;
	Fri,  3 Dec 2021 23:16:34 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C36D55D9D5;
	Fri,  3 Dec 2021 23:16:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	libguestfs@redhat.com,
	nsoffer@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 13/14] nbd/client: Request extended headers during negotiation
Date: Fri,  3 Dec 2021 17:15:38 -0600
Message-Id: <20211203231539.3900865-14-eblake@redhat.com>
In-Reply-To: <20211203231539.3900865-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231539.3900865-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4eaTdjQbSpE.A.UBD.9jqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1625
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231539.3900865-14-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:32:13 +0000 (UTC)

All the pieces are in place for a client to finally request extended
headers.  Note that we must not request extended headers when qemu-nbd
is used to connect to the kernel module (as nbd.ko does not expect
them), but there is no harm in all other clients requesting them.

Extended headers do not make a difference to the information collected
during 'qemu-nbd --list', but probing for it gives us one more piece
of information in that output.  Update the iotests affected by the new
line of output.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/client-connection.c                       |  1 +
 nbd/client.c                                  | 26 ++++++++++++++++---
 qemu-nbd.c                                    |  2 ++
 tests/qemu-iotests/223.out                    |  4 +++
 tests/qemu-iotests/233.out                    |  1 +
 tests/qemu-iotests/241                        |  8 +++---
 tests/qemu-iotests/307                        |  2 +-
 tests/qemu-iotests/307.out                    |  5 ++++
 .../tests/nbd-qemu-allocation.out             |  1 +
 9 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/nbd/client-connection.c b/nbd/client-connection.c
index 695f85575414..d8b9ae230264 100644
--- a/nbd/client-connection.c
+++ b/nbd/client-connection.c
@@ -87,6 +87,7 @@ NBDClientConnection *nbd_client_connection_new(const SocketAddress *saddr,

         .initial_info.request_sizes = true,
         .initial_info.structured_reply = true,
+        .initial_info.extended_headers = true,
         .initial_info.base_allocation = true,
         .initial_info.x_dirty_bitmap = g_strdup(x_dirty_bitmap),
         .initial_info.name = g_strdup(export_name ?: "")
diff --git a/nbd/client.c b/nbd/client.c
index f1aa5256c8bf..0e227255d59b 100644
--- a/nbd/client.c
+++ b/nbd/client.c
@@ -882,8 +882,8 @@ static int nbd_list_meta_contexts(QIOChannel *ioc,
 static int nbd_start_negotiate(AioContext *aio_context, QIOChannel *ioc,
                                QCryptoTLSCreds *tlscreds,
                                const char *hostname, QIOChannel **outioc,
-                               bool structured_reply, bool *zeroes,
-                               Error **errp)
+                               bool structured_reply, bool *ext_hdrs,
+                               bool *zeroes, Error **errp)
 {
     ERRP_GUARD();
     uint64_t magic;
@@ -960,6 +960,15 @@ static int nbd_start_negotiate(AioContext *aio_context, QIOChannel *ioc,
         if (fixedNewStyle) {
             int result = 0;

+            if (ext_hdrs && *ext_hdrs) {
+                result = nbd_request_simple_option(ioc,
+                                                   NBD_OPT_EXTENDED_HEADERS,
+                                                   false, errp);
+                if (result < 0) {
+                    return -EINVAL;
+                }
+                *ext_hdrs = result == 1;
+            }
             if (structured_reply) {
                 result = nbd_request_simple_option(ioc,
                                                    NBD_OPT_STRUCTURED_REPLY,
@@ -970,6 +979,9 @@ static int nbd_start_negotiate(AioContext *aio_context, QIOChannel *ioc,
             }
             return 2 + result;
         } else {
+            if (ext_hdrs) {
+                *ext_hdrs = false;
+            }
             return 1;
         }
     } else if (magic == NBD_CLIENT_MAGIC) {
@@ -977,6 +989,9 @@ static int nbd_start_negotiate(AioContext *aio_context, QIOChannel *ioc,
             error_setg(errp, "Server does not support STARTTLS");
             return -EINVAL;
         }
+        if (ext_hdrs) {
+            *ext_hdrs = false;
+        }
         return 0;
     } else {
         error_setg(errp, "Bad server magic received: 0x%" PRIx64, magic);
@@ -1030,7 +1045,8 @@ int nbd_receive_negotiate(AioContext *aio_context, QIOChannel *ioc,
     trace_nbd_receive_negotiate_name(info->name);

     result = nbd_start_negotiate(aio_context, ioc, tlscreds, hostname, outioc,
-                                 info->structured_reply, &zeroes, errp);
+                                 info->structured_reply,
+                                 &info->extended_headers, &zeroes, errp);

     info->structured_reply = false;
     info->base_allocation = false;
@@ -1147,10 +1163,11 @@ int nbd_receive_export_list(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
     int ret = -1;
     NBDExportInfo *array = NULL;
     QIOChannel *sioc = NULL;
+    bool ext_hdrs;

     *info = NULL;
     result = nbd_start_negotiate(NULL, ioc, tlscreds, hostname, &sioc, true,
-                                 NULL, errp);
+                                 &ext_hdrs, NULL, errp);
     if (tlscreds && sioc) {
         ioc = sioc;
     }
@@ -1179,6 +1196,7 @@ int nbd_receive_export_list(QIOChannel *ioc, QCryptoTLSCreds *tlscreds,
             array[count - 1].name = name;
             array[count - 1].description = desc;
             array[count - 1].structured_reply = result == 3;
+            array[count - 1].extended_headers = ext_hdrs;
         }

         for (i = 0; i < count; i++) {
diff --git a/qemu-nbd.c b/qemu-nbd.c
index c6c20df68a4d..ecf47b7e1250 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -237,6 +237,8 @@ static int qemu_nbd_client_list(SocketAddress *saddr, QCryptoTLSCreds *tls,
             printf("  opt block: %u\n", list[i].opt_block);
             printf("  max block: %u\n", list[i].max_block);
         }
+        printf("  transaction size: %s\n",
+               list[i].extended_headers ? "64-bit" : "32-bit");
         if (list[i].n_contexts) {
             printf("  available meta contexts: %d\n", list[i].n_contexts);
             for (j = 0; j < list[i].n_contexts; j++) {
diff --git a/tests/qemu-iotests/223.out b/tests/qemu-iotests/223.out
index e58ea5abbd5a..36de28ccd12f 100644
--- a/tests/qemu-iotests/223.out
+++ b/tests/qemu-iotests/223.out
@@ -76,6 +76,7 @@ exports available: 2
   min block: 1
   opt block: 4096
   max block: 33554432
+  transaction size: 64-bit
   available meta contexts: 2
    base:allocation
    qemu:dirty-bitmap:b
@@ -86,6 +87,7 @@ exports available: 2
   min block: 1
   opt block: 4096
   max block: 33554432
+  transaction size: 64-bit
   available meta contexts: 2
    base:allocation
    qemu:dirty-bitmap:b2
@@ -177,6 +179,7 @@ exports available: 2
   min block: 1
   opt block: 4096
   max block: 33554432
+  transaction size: 64-bit
   available meta contexts: 2
    base:allocation
    qemu:dirty-bitmap:b
@@ -187,6 +190,7 @@ exports available: 2
   min block: 1
   opt block: 4096
   max block: 33554432
+  transaction size: 64-bit
   available meta contexts: 2
    base:allocation
    qemu:dirty-bitmap:b2
diff --git a/tests/qemu-iotests/233.out b/tests/qemu-iotests/233.out
index 4b1f6a0e1513..b04cc38bd11c 100644
--- a/tests/qemu-iotests/233.out
+++ b/tests/qemu-iotests/233.out
@@ -43,6 +43,7 @@ exports available: 1
   min block: 1
   opt block: 4096
   max block: 33554432
+  transaction size: 64-bit
   available meta contexts: 1
    base:allocation

diff --git a/tests/qemu-iotests/241 b/tests/qemu-iotests/241
index c962c8b6075d..23307ca2d829 100755
--- a/tests/qemu-iotests/241
+++ b/tests/qemu-iotests/241
@@ -3,7 +3,7 @@
 #
 # Test qemu-nbd vs. unaligned images
 #
-# Copyright (C) 2018-2019 Red Hat, Inc.
+# Copyright (C) 2018-2021 Red Hat, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -58,7 +58,7 @@ echo

 nbd_server_start_unix_socket -f $IMGFMT "$TEST_IMG_FILE"

-$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '\(size\|min\)'
+$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '^ *\(size\|min\)'
 $QEMU_IMG map -f raw --output=json "$TEST_IMG" | _filter_qemu_img_map
 $QEMU_IO -f raw -c map "$TEST_IMG"
 nbd_server_stop
@@ -71,7 +71,7 @@ echo
 # sector alignment, here at the server.
 nbd_server_start_unix_socket "$TEST_IMG_FILE" 2> "$TEST_DIR/server.log"

-$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '\(size\|min\)'
+$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '^ *\(size\|min\)'
 $QEMU_IMG map -f raw --output=json "$TEST_IMG" | _filter_qemu_img_map
 $QEMU_IO -f raw -c map "$TEST_IMG"
 nbd_server_stop
@@ -84,7 +84,7 @@ echo
 # Now force sector alignment at the client.
 nbd_server_start_unix_socket -f $IMGFMT "$TEST_IMG_FILE"

-$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '\(size\|min\)'
+$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '^ *\(size\|min\)'
 $QEMU_IMG map --output=json "$TEST_IMG" | _filter_qemu_img_map
 $QEMU_IO -c map "$TEST_IMG"
 nbd_server_stop
diff --git a/tests/qemu-iotests/307 b/tests/qemu-iotests/307
index b429b5aa50a4..64ce250d82de 100755
--- a/tests/qemu-iotests/307
+++ b/tests/qemu-iotests/307
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
 # group: rw quick export
 #
-# Copyright (C) 2020 Red Hat, Inc.
+# Copyright (C) 2020-2021 Red Hat, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
index ec8d2be0e0a4..343ddc0a5c16 100644
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
index 0bf1abb06338..f30b4bed2144 100644
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
2.33.1

