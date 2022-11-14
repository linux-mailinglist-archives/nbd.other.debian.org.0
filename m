Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B99FE628CCD
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:00:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8777C20668; Mon, 14 Nov 2022 23:00:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:00:19 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	WORD_WITHOUT_VOWELS autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D2F222067B
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 22:58:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qq-YDSaxGnZc for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 22:58:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 12CF720616
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 22:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2cD56WaAJ/IvhRPrOPQ2JyhwwZRuIKdCJRpznOMdqs=;
	b=gMNENJ2t8Dp1mtq+hKr+7829Pe5awf3Ev2ZBYyNuIIBPZM0/vOFfbFADNVGaUuA+B6MIgd
	EoqIjnzMZav06yhIz0JEmRyjjpLrAHwaZqPgHTxE+31au95diCuJkwEBLzNrhBzFksilV1
	nVQTX+6VRPmhEJORNPpXil9tnGcDM8s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-pPoxq3Q7M4KEOuKG6EuL0w-1; Mon, 14 Nov 2022 17:52:10 -0500
X-MC-Unique: pPoxq3Q7M4KEOuKG6EuL0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E0CD101E148;
	Mon, 14 Nov 2022 22:52:10 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A2CA40E9786;
	Mon, 14 Nov 2022 22:52:10 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 15/23] info: Update nbdinfo --map to use 64-bit block status
Date: Mon, 14 Nov 2022 16:51:50 -0600
Message-Id: <20221114225158.2186742-16-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uyLfir57moM.A.P8C.DiscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2265
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114225158.2186742-16-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:00:19 +0000 (UTC)

Although we usually map "base:allocation" which doesn't require the
use of the 64-bit API for flags, this application IS intended to map
out other metacontexts that might have 64-bit flags.  And when
extended headers are in use, we might as well ask for the server to
give us extents as large as it wants, rather than breaking things up
at 4G boundaries.
---
 info/map.c | 67 ++++++++++++++++++++++++++++--------------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/info/map.c b/info/map.c
index a5aad955..ffa53b81 100644
--- a/info/map.c
+++ b/info/map.c
@@ -1,5 +1,5 @@
 /* NBD client library in userspace
- * Copyright (C) 2020-2021 Red Hat Inc.
+ * Copyright (C) 2020-2022 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -36,13 +36,13 @@

 #include "nbdinfo.h"

-DEFINE_VECTOR_TYPE (uint32_vector, uint32_t)
+DEFINE_VECTOR_TYPE (uint64_vector, uint64_t)

-static void print_extents (uint32_vector *entries);
-static void print_totals (uint32_vector *entries, int64_t size);
+static void print_extents (uint64_vector *entries);
+static void print_totals (uint64_vector *entries, int64_t size);
 static int extent_callback (void *user_data, const char *metacontext,
                             uint64_t offset,
-                            uint32_t *entries, size_t nr_entries,
+                            nbd_extent *entries, size_t nr_entries,
                             int *error);

 void
@@ -50,7 +50,7 @@ do_map (void)
 {
   size_t i;
   int64_t size;
-  uint32_vector entries = empty_vector;
+  uint64_vector entries = empty_vector;
   uint64_t offset, align, max_len;
   size_t prev_entries_size;

@@ -69,14 +69,16 @@ do_map (void)
     fprintf (stderr, "%s: %s\n", progname, nbd_get_error ());
     exit (EXIT_FAILURE);
   }
+  if (nbd_get_extended_headers_negotiated (nbd) == 1)
+    max_len = size;

   for (offset = 0; offset < size;) {
     prev_entries_size = entries.len;
-    if (nbd_block_status (nbd, MIN (size - offset, max_len), offset,
-                          (nbd_extent_callback) {
-                            .callback = extent_callback,
-                            .user_data = &entries },
-                          0) == -1) {
+    if (nbd_block_status_64 (nbd, MIN (size - offset, max_len), offset,
+                             (nbd_extent64_callback) {
+                               .callback = extent_callback,
+                               .user_data = &entries },
+                             0) == -1) {
       fprintf (stderr, "%s: %s\n", progname, nbd_get_error ());
       exit (EXIT_FAILURE);
     }
@@ -99,18 +101,18 @@ do_map (void)
 }

 /* Callback handling --map. */
-static void print_one_extent (uint64_t offset, uint64_t len, uint32_t type);
-static void extent_description (const char *metacontext, uint32_t type,
+static void print_one_extent (uint64_t offset, uint64_t len, uint64_t type);
+static void extent_description (const char *metacontext, uint64_t type,
                                 char **descr, bool *free_descr,
                                 const char **fg, const char **bg);

 static int
 extent_callback (void *user_data, const char *metacontext,
                  uint64_t offset,
-                 uint32_t *entries, size_t nr_entries,
+                 nbd_extent *entries, size_t nr_entries,
                  int *error)
 {
-  uint32_vector *list = user_data;
+  uint64_vector *list = user_data;
   size_t i;

   if (strcmp (metacontext, map) != 0)
@@ -120,7 +122,8 @@ extent_callback (void *user_data, const char *metacontext,
    * print_extents below.
    */
   for (i = 0; i < nr_entries; ++i) {
-    if (uint32_vector_append (list, entries[i]) == -1) {
+    if (uint64_vector_append (list, entries[i].length) == -1 ||
+        uint64_vector_append (list, entries[i].flags) == -1) {
       perror ("realloc");
       exit (EXIT_FAILURE);
     }
@@ -129,7 +132,7 @@ extent_callback (void *user_data, const char *metacontext,
 }

 static void
-print_extents (uint32_vector *entries)
+print_extents (uint64_vector *entries)
 {
   size_t i, j;
   uint64_t offset = 0;          /* end of last extent printed + 1 */
@@ -138,7 +141,7 @@ print_extents (uint32_vector *entries)
   if (json_output) fprintf (fp, "[\n");

   for (i = 0; i < entries->len; i += 2) {
-    uint32_t type = entries->ptr[last+1];
+    uint64_t type = entries->ptr[last+1];

     /* If we're coalescing and the current type is different from the
      * previous one then we should print everything up to this entry.
@@ -157,7 +160,7 @@ print_extents (uint32_vector *entries)

   /* Print the last extent if there is one. */
   if (last != i) {
-    uint32_t type = entries->ptr[last+1];
+    uint64_t type = entries->ptr[last+1];
     uint64_t len;

     for (j = last, len = 0; j < i; j += 2)
@@ -169,7 +172,7 @@ print_extents (uint32_vector *entries)
 }

 static void
-print_one_extent (uint64_t offset, uint64_t len, uint32_t type)
+print_one_extent (uint64_t offset, uint64_t len, uint64_t type)
 {
   static bool comma = false;
   char *descr;
@@ -185,7 +188,7 @@ print_one_extent (uint64_t offset, uint64_t len, uint32_t type)
       ansi_colour (bg, fp);
     fprintf (fp, "%10" PRIu64 "  "
              "%10" PRIu64 "  "
-             "%3" PRIu32,
+             "%3" PRIu64,
              offset, len, type);
     if (descr)
       fprintf (fp, "  %s", descr);
@@ -199,7 +202,7 @@ print_one_extent (uint64_t offset, uint64_t len, uint32_t type)

     fprintf (fp, "{ \"offset\": %" PRIu64 ", "
              "\"length\": %" PRIu64 ", "
-             "\"type\": %" PRIu32,
+             "\"type\": %" PRIu64,
              offset, len, type);
     if (descr) {
       fprintf (fp, ", \"description\": ");
@@ -215,9 +218,9 @@ print_one_extent (uint64_t offset, uint64_t len, uint32_t type)

 /* --map --totals suboption */
 static void
-print_totals (uint32_vector *entries, int64_t size)
+print_totals (uint64_vector *entries, int64_t size)
 {
-  uint32_t type;
+  uint64_t type;
   bool comma = false;

   /* This is necessary to avoid a divide by zero below, but if the
@@ -237,16 +240,16 @@ print_totals (uint32_vector *entries, int64_t size)
    */
   type = 0;
   for (;;) {
-    uint64_t next_type = (uint64_t)UINT32_MAX + 1;
+    uint64_t next_type = 0;
     uint64_t c = 0;
     size_t i;

     for (i = 0; i < entries->len; i += 2) {
-      uint32_t t = entries->ptr[i+1];
+      uint64_t t = entries->ptr[i+1];

       if (t == type)
         c += entries->ptr[i];
-      else if (type < t && t < next_type)
+      else if (type < t && (next_type == 0 || t < next_type))
         next_type = t;
     }

@@ -263,7 +266,7 @@ print_totals (uint32_vector *entries, int64_t size)
           ansi_colour (fg, fp);
         if (bg)
           ansi_colour (bg, fp);
-        fprintf (fp, "%10" PRIu64 " %5.1f%% %3" PRIu32,
+        fprintf (fp, "%10" PRIu64 " %5.1f%% %3" PRIu64,
                  c, percent, type);
         if (descr)
           fprintf (fp, " %s", descr);
@@ -278,7 +281,7 @@ print_totals (uint32_vector *entries, int64_t size)
         fprintf (fp,
                  "{ \"size\": %" PRIu64 ", "
                  "\"percent\": %g, "
-                 "\"type\": %" PRIu32,
+                 "\"type\": %" PRIu64,
                  c, percent, type);
         if (descr) {
           fprintf (fp, ", \"description\": ");
@@ -292,7 +295,7 @@ print_totals (uint32_vector *entries, int64_t size)
         free (descr);
     }

-    if (next_type == (uint64_t)UINT32_MAX + 1)
+    if (next_type == 0)
       break;
     type = next_type;
   }
@@ -301,7 +304,7 @@ print_totals (uint32_vector *entries, int64_t size)
 }

 static void
-extent_description (const char *metacontext, uint32_t type,
+extent_description (const char *metacontext, uint64_t type,
                     char **descr, bool *free_descr,
                     const char **fg, const char **bg)
 {
@@ -348,7 +351,7 @@ extent_description (const char *metacontext, uint32_t type,
       *fg = ANSI_FG_BRIGHT_WHITE; *bg = ANSI_BG_BLACK;
       return;
     default:
-      if (asprintf (descr, "backing depth %u", type) == -1) {
+      if (asprintf (descr, "backing depth %" PRIu64, type) == -1) {
         perror ("asprintf");
         exit (EXIT_FAILURE);
       }
-- 
2.38.1

