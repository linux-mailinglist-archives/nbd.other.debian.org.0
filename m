Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7072B4680A4
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:35:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 57D5B20154; Fri,  3 Dec 2021 23:35:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:35:18 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 39696200EC
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:35:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.93 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7wDYxH6ilSDk for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:35:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 2034F200FF
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7vTNTo8uTLAByN8asrFOku08wwC2MQ4RKEAFYJrPdY=;
	b=N/mOV0jjQVdvlL6zsnm6mxVj8lakBzR3hQXW8rwi1FUno73rVb2viKgvPKwRbN1OGr6evG
	E0d5mmv7VTurMRRM4RF+RttiMl4MmuCsEnXaAfYIIwaAR6SvdmANldAzE5fWifG93ZotBk
	t+IU2UMCXoiaRx/tAPiJ2MJDozXevlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-109-aJFX8kpTMHShB6jNRcEIeA-1; Fri, 03 Dec 2021 18:17:57 -0500
X-MC-Unique: aJFX8kpTMHShB6jNRcEIeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6D51190A7A4;
	Fri,  3 Dec 2021 23:17:55 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF3345DF2B;
	Fri,  3 Dec 2021 23:17:54 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: nbd@other.debian.org,
	qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	nsoffer@redhat.com
Subject: [libnbd PATCH 03/13] protocol: Add definitions for extended headers
Date: Fri,  3 Dec 2021 17:17:31 -0600
Message-Id: <20211203231741.3901263-4-eblake@redhat.com>
In-Reply-To: <20211203231741.3901263-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231741.3901263-1-eblake@redhat.com>
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
Resent-Message-ID: <LUfZnHzWywD.A.HsD.2mqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1644
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231741.3901263-4-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:35:18 +0000 (UTC)

Add the magic numbers and new structs necessary to implement the NBD
protocol extension of extended headers providing 64-bit lengths.
---
 lib/nbd-protocol.h | 61 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 10 deletions(-)

diff --git a/lib/nbd-protocol.h b/lib/nbd-protocol.h
index e5d6404b..7247d775 100644
--- a/lib/nbd-protocol.h
+++ b/lib/nbd-protocol.h
@@ -1,5 +1,5 @@
 /* nbdkit
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are
@@ -124,6 +124,7 @@ struct nbd_fixed_new_option_reply {
 #define NBD_OPT_STRUCTURED_REPLY   8
 #define NBD_OPT_LIST_META_CONTEXT  9
 #define NBD_OPT_SET_META_CONTEXT   10
+#define NBD_OPT_EXTENDED_HEADERS   11

 #define NBD_REP_ERR(val) (0x80000000 | (val))
 #define NBD_REP_IS_ERR(val) (!!((val) & 0x80000000))
@@ -188,6 +189,13 @@ struct nbd_block_descriptor {
   uint32_t status_flags;        /* block type (hole etc) */
 } NBD_ATTRIBUTE_PACKED;

+/* NBD_REPLY_TYPE_BLOCK_STATUS_EXT block descriptor. */
+struct nbd_block_descriptor_ext {
+  uint64_t length;              /* length of block */
+  uint32_t status_flags;        /* block type (hole etc) */
+  uint32_t pad;                 /* must be zero */
+} NBD_ATTRIBUTE_PACKED;
+
 /* Request (client -> server). */
 struct nbd_request {
   uint32_t magic;               /* NBD_REQUEST_MAGIC. */
@@ -197,6 +205,14 @@ struct nbd_request {
   uint64_t offset;              /* Request offset. */
   uint32_t count;               /* Request length. */
 } NBD_ATTRIBUTE_PACKED;
+struct nbd_request_ext {
+  uint32_t magic;               /* NBD_REQUEST_EXT_MAGIC. */
+  uint16_t flags;               /* Request flags. */
+  uint16_t type;                /* Request type. */
+  uint64_t handle;              /* Opaque handle. */
+  uint64_t offset;              /* Request offset. */
+  uint64_t count;               /* Request length. */
+} NBD_ATTRIBUTE_PACKED;

 /* Simple reply (server -> client). */
 struct nbd_simple_reply {
@@ -204,6 +220,13 @@ struct nbd_simple_reply {
   uint32_t error;               /* NBD_SUCCESS or one of NBD_E*. */
   uint64_t handle;              /* Opaque handle. */
 } NBD_ATTRIBUTE_PACKED;
+struct nbd_simple_reply_ext {
+  uint32_t magic;               /* NBD_SIMPLE_REPLY_EXT_MAGIC. */
+  uint32_t error;               /* NBD_SUCCESS or one of NBD_E*. */
+  uint64_t handle;              /* Opaque handle. */
+  uint64_t pad1;                /* Must be 0. */
+  uint64_t pad2;                /* Must be 0. */
+} NBD_ATTRIBUTE_PACKED;

 /* Structured reply (server -> client). */
 struct nbd_structured_reply {
@@ -213,6 +236,14 @@ struct nbd_structured_reply {
   uint64_t handle;              /* Opaque handle. */
   uint32_t length;              /* Length of payload which follows. */
 } NBD_ATTRIBUTE_PACKED;
+struct nbd_structured_reply_ext {
+  uint32_t magic;               /* NBD_STRUCTURED_REPLY_EXT_MAGIC. */
+  uint16_t flags;               /* NBD_REPLY_FLAG_* */
+  uint16_t type;                /* NBD_REPLY_TYPE_* */
+  uint64_t handle;              /* Opaque handle. */
+  uint64_t length;              /* Length of payload which follows. */
+  uint64_t pad;                 /* Must be 0. */
+} NBD_ATTRIBUTE_PACKED;

 struct nbd_structured_reply_offset_data {
   uint64_t offset;              /* offset */
@@ -224,15 +255,23 @@ struct nbd_structured_reply_offset_hole {
   uint32_t length;              /* Length of hole. */
 } NBD_ATTRIBUTE_PACKED;

+struct nbd_structured_reply_offset_hole_ext {
+  uint64_t offset;
+  uint64_t length;              /* Length of hole. */
+} NBD_ATTRIBUTE_PACKED;
+
 struct nbd_structured_reply_error {
   uint32_t error;               /* NBD_E* error number */
   uint16_t len;                 /* Length of human readable error. */
   /* Followed by human readable error string, and possibly more structure. */
 } NBD_ATTRIBUTE_PACKED;

-#define NBD_REQUEST_MAGIC           0x25609513
-#define NBD_SIMPLE_REPLY_MAGIC      0x67446698
-#define NBD_STRUCTURED_REPLY_MAGIC  0x668e33ef
+#define NBD_REQUEST_MAGIC               0x25609513
+#define NBD_REQUEST_EXT_MAGIC           0x21e41c71
+#define NBD_SIMPLE_REPLY_MAGIC          0x67446698
+#define NBD_SIMPLE_REPLY_EXT_MAGIC      0x60d12fd6
+#define NBD_STRUCTURED_REPLY_MAGIC      0x668e33ef
+#define NBD_STRUCTURED_REPLY_EXT_MAGIC  0x6e8a278c

 /* Structured reply flags. */
 #define NBD_REPLY_FLAG_DONE         (1<<0)
@@ -241,12 +280,14 @@ struct nbd_structured_reply_error {
 #define NBD_REPLY_TYPE_IS_ERR(val) (!!((val) & (1<<15)))

 /* Structured reply types. */
-#define NBD_REPLY_TYPE_NONE         0
-#define NBD_REPLY_TYPE_OFFSET_DATA  1
-#define NBD_REPLY_TYPE_OFFSET_HOLE  2
-#define NBD_REPLY_TYPE_BLOCK_STATUS 5
-#define NBD_REPLY_TYPE_ERROR        NBD_REPLY_TYPE_ERR (1)
-#define NBD_REPLY_TYPE_ERROR_OFFSET NBD_REPLY_TYPE_ERR (2)
+#define NBD_REPLY_TYPE_NONE             0
+#define NBD_REPLY_TYPE_OFFSET_DATA      1
+#define NBD_REPLY_TYPE_OFFSET_HOLE      2
+#define NBD_REPLY_TYPE_OFFSET_HOLE_EXT  3
+#define NBD_REPLY_TYPE_BLOCK_STATUS     5
+#define NBD_REPLY_TYPE_BLOCK_STATUS_EXT 6
+#define NBD_REPLY_TYPE_ERROR            NBD_REPLY_TYPE_ERR (1)
+#define NBD_REPLY_TYPE_ERROR_OFFSET     NBD_REPLY_TYPE_ERR (2)

 /* NBD commands. */
 #define NBD_CMD_READ              0
-- 
2.33.1

