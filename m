Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 081DF710CE0
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:02:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EAD5220632; Thu, 25 May 2023 13:02:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:02:11 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1E38F204C2
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:01:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.351 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id E5IV7u62ro5W for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:01:28 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id BA35A204B1
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685019679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ZShMcMRxM2r230EM0RT23b/lI26EuHGS/izUYawGZs=;
	b=hxJOJAG0FWZP7t/ue3lZijfnWqKg+7AHOIKMw2b5zraqi0HWSMlpkY6qn+wOsgJGZTs00G
	i9gY6l/uHjAD76vktd6+HYeWanKc42brfpgqxPjVUGreqzwqVcZBA3ihq7gZ67ubvF4NNa
	M+IZOJEMozRMEJZjTAZrKVd5z2CikLo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-9_ikKdBhPjerm0xr07cRMA-1; Thu, 25 May 2023 09:01:16 -0400
X-MC-Unique: 9_ikKdBhPjerm0xr07cRMA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 591F61C0171E;
	Thu, 25 May 2023 13:01:16 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06E09492B0A;
	Thu, 25 May 2023 13:01:15 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 15/22] info: Update nbdinfo --map to use 64-bit block status
Date: Thu, 25 May 2023 08:01:01 -0500
Message-Id: <20230525130108.757242-16-eblake@redhat.com>
In-Reply-To: <20230525130108.757242-1-eblake@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Gv7x5zo66aD.A.q5G.Tx1bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2483
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-16-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:02:11 +0000 (UTC)

Although we usually map "base:allocation" which doesn't require the
use of the 64-bit API for flags, this application IS intended to map
out other metacontexts that might have 64-bit flags.  And when
extended headers are in use, we might as well ask for the server to
give us extents as large as it wants, rather than breaking things up
at 4G boundaries.

At the time this patch was written, there are no known servers that
actually provide a metacontext with 64-bit flags.  However, that is
planned for the nbdkit v3 protocol.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 info/map.c | 65 ++++++++++++++++++++++++++++--------------------------
 1 file changed, 34 insertions(+), 31 deletions(-)

diff --git a/info/map.c b/info/map.c
index 1169fce4..50b058f2 100644
--- a/info/map.c
+++ b/info/map.c
@@ -36,13 +36,13 @@

 #include "nbdinfo.h"

-DEFINE_VECTOR_TYPE (uint32_vector, uint32_t);
+DEFINE_VECTOR_TYPE (uint64_vector, uint64_t);

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
2.40.1

