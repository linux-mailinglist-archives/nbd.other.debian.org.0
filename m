Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C149E710CE4
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:02:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A7A51204C2; Thu, 25 May 2023 13:02:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:02:22 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 96BB7204B5
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:01:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LDqQs2dbRaJF for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:01:21 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 87C4F20491
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685019676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2x6T1ZU0/LHVf0v5Ww1bxwzjtgiGX5q8nTkmqUN+b0=;
	b=Ygi1x0lugZ9k1FF2QJv2PIMNFpabeImiLApVRr85bQXnZaHkRj84fHw2WNlOX4ukqzZU+U
	qI+26Fk2/15DSmCBo5w+dc/gI8pQVllyYhgbYaA9eoYVcWfPnp7oYgL/tTgoHFYKXLOsHQ
	K8xwXRteeA6TBuBI3MJIAekXtf0C0QQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-RPuZNWoeOoi49yJ1b7SiWw-1; Thu, 25 May 2023 09:01:15 -0400
X-MC-Unique: RPuZNWoeOoi49yJ1b7SiWw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D37E0185A79B;
	Thu, 25 May 2023 13:01:14 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8212F492B0A;
	Thu, 25 May 2023 13:01:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 12/22] copy: Update nbdcopy to use 64-bit block status
Date: Thu, 25 May 2023 08:00:58 -0500
Message-Id: <20230525130108.757242-13-eblake@redhat.com>
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
Resent-Message-ID: <tESq7SkiheO.A.4wB.ex1bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2485
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-13-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:02:22 +0000 (UTC)

Although our use of "base:allocation" doesn't require the use of the
64-bit API for flags, we might perform slightly faster for a server
that does give us 64-bit extent lengths and honors larger nbd_zero
lengths.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 copy/nbd-ops.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/copy/nbd-ops.c b/copy/nbd-ops.c
index f3b3bed3..71ee0a3b 100644
--- a/copy/nbd-ops.c
+++ b/copy/nbd-ops.c
@@ -428,7 +428,7 @@ nbd_ops_asynch_notify_write (struct rw *rw, size_t index)
  * request for extents in a single round trip.
  */
 static int add_extent (void *vp, const char *metacontext,
-                       uint64_t offset, uint32_t *entries, size_t nr_entries,
+                       uint64_t offset, nbd_extent *entries, size_t nr_entries,
                        int *error);

 static void
@@ -449,11 +449,11 @@ nbd_ops_get_extents (struct rw *rw, size_t index,
     size_t i;

     exts.len = 0;
-    if (nbd_block_status (nbd, count, offset,
-                          (nbd_extent_callback) {
-                            .user_data = &exts,
-                            .callback = add_extent
-                          }, 0) == -1) {
+    if (nbd_block_status_64 (nbd, count, offset,
+                             (nbd_extent64_callback) {
+                               .user_data = &exts,
+                               .callback = add_extent
+                             }, 0) == -1) {
       /* XXX We could call default_get_extents, but unclear if it's
        * the right thing to do if the server is returning errors.
        */
@@ -496,7 +496,7 @@ nbd_ops_get_extents (struct rw *rw, size_t index,

 static int
 add_extent (void *vp, const char *metacontext,
-            uint64_t offset, uint32_t *entries, size_t nr_entries,
+            uint64_t offset, nbd_extent *entries, size_t nr_entries,
             int *error)
 {
   extent_list *ret = vp;
@@ -505,25 +505,25 @@ add_extent (void *vp, const char *metacontext,
   if (strcmp (metacontext, "base:allocation") != 0 || *error)
     return 0;

-  for (i = 0; i < nr_entries; i += 2) {
+  for (i = 0; i < nr_entries; i++) {
     struct extent e;

     e.offset = offset;
-    e.length = entries[i];
+    e.length = entries[i].length;

     /* Note we deliberately don't care about the HOLE flag.  There is
      * no need to read extent that reads as zeroes.  We will convert
      * to it to a hole or allocated extents based on the command line
      * arguments.
      */
-    e.zero = (entries[i+1] & LIBNBD_STATE_ZERO) != 0;
+    e.zero = (entries[i].flags & LIBNBD_STATE_ZERO) != 0;

     if (extent_list_append (ret, e) == -1) {
       perror ("realloc");
       exit (EXIT_FAILURE);
     }

-    offset += entries[i];
+    offset += entries[i].length;
   }

   return 0;
-- 
2.40.1

