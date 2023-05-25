Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3189F710CF1
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:03:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 16F79204B1; Thu, 25 May 2023 13:03:24 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:03:24 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 8DA2620471
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:02:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.351 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id X1MQZ3AijZVz for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:02:56 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 826F020491
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685019771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bhc//5O4d+JtXQ/1BxxJfr1tsjFNqBspaVEly1XJcr4=;
	b=FZcWWC6Vkj4l2VG6uKBVq+L+BZcXmyMfNq05iSsCffhl+R7rZZk3RqB26WqIh113ByTTG7
	mUeNM5v2v9aAfiE/9RDCABU2vcFApM32hwgWiFLq1x7YWQAZ1dNM+keCF4cpYgebNGcX5I
	3WeL7B36LptlF0v3slpWEnmkmxy9W40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-xsjdmcxZOvuoECdKPDBO0Q-1; Thu, 25 May 2023 09:01:40 -0400
X-MC-Unique: xsjdmcxZOvuoECdKPDBO0Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63BF4101A597;
	Thu, 25 May 2023 13:01:15 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02D68492B0A;
	Thu, 25 May 2023 13:01:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 13/22] dump: Update nbddump to use 64-bit block status
Date: Thu, 25 May 2023 08:00:59 -0500
Message-Id: <20230525130108.757242-14-eblake@redhat.com>
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
Resent-Message-ID: <fU6vYmvnYAL.A.s6B.cy1bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2495
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-14-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:03:24 +0000 (UTC)

Although our use of "base:allocation" doesn't require the use of the
64-bit API for flags, we might perform slightly faster for a server
that does give us 64-bit extent lengths.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 dump/dump.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index b4aebe84..71053277 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -38,7 +38,7 @@
 #include "version.h"
 #include "vector.h"

-DEFINE_VECTOR_TYPE (uint32_vector, uint32_t);
+DEFINE_VECTOR_TYPE (uint64_vector, uint64_t);

 static const char *progname;
 static struct nbd_handle *nbd;
@@ -262,10 +262,10 @@ catch_signal (int sig)
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

   if (strcmp (metacontext, LIBNBD_CONTEXT_BASE_ALLOCATION) != 0)
@@ -273,7 +273,8 @@ extent_callback (void *user_data, const char *metacontext,

   /* Just append the entries we got to the list. */
   for (i = 0; i < nr_entries; ++i) {
-    if (uint32_vector_append (list, entries[i]) == -1) {
+    if (uint64_vector_append (list, entries[i].length) == -1 ||
+        uint64_vector_append (list, entries[i].flags) == -1) {
       perror ("realloc");
       exit (EXIT_FAILURE);
     }
@@ -284,7 +285,7 @@ extent_callback (void *user_data, const char *metacontext,
 static bool
 test_all_zeroes (uint64_t offset, size_t count)
 {
-  uint32_vector entries = empty_vector;
+  uint64_vector entries = empty_vector;
   size_t i;
   uint64_t count_read;

@@ -296,22 +297,22 @@ test_all_zeroes (uint64_t offset, size_t count)
    * false, causing the main code to do a full read.  We could be
    * smarter and keep asking the server (XXX).
    */
-  if (nbd_block_status (nbd, count, offset,
-                        (nbd_extent_callback) {
-                          .callback = extent_callback,
-                          .user_data = &entries },
-                        0) == -1) {
+  if (nbd_block_status_64 (nbd, count, offset,
+                           (nbd_extent64_callback) {
+                             .callback = extent_callback,
+                             .user_data = &entries },
+                           0) == -1) {
     fprintf (stderr, "%s: %s\n", progname, nbd_get_error ());
     exit (EXIT_FAILURE);
   }

   count_read = 0;
   for (i = 0; i < entries.len; i += 2) {
-    uint32_t len = entries.ptr[i];
-    uint32_t type = entries.ptr[i+1];
+    uint64_t len = entries.ptr[i];
+    uint64_t type = entries.ptr[i+1];

     count_read += len;
-    if (!(type & 2))            /* not zero */
+    if (!(type & LIBNBD_STATE_ZERO))            /* not zero */
       return false;
   }

-- 
2.40.1

