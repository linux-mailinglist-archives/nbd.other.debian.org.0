Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 124BF628C7F
	for <lists+nbd@lfdr.de>; Mon, 14 Nov 2022 23:59:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EC21020615; Mon, 14 Nov 2022 22:59:38 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 22:59:38 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2FD3220668
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 22:58:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, WORD_WITHOUT_VOWELS=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id soNriJlLdVyj for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 22:58:36 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id A60AD20681
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 22:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2UZ3+3XiNyWGBAYAGfP+9zc44+qr/0xwK7n95Q82oNs=;
	b=B1fXsUGMqVoX9RLK3R9hoaEAL87fKjJYOJp8JXgciQBBMhUuJiaCZhbiysL7MiVie9wbK3
	B8dP/Frn6qL2+Goz2TuzVD+NhPbMX7YEUebIDYDCV+eExFDEq1V617W133n6tPBFF6kOe/
	OVqAoG0WcsMnaHG3nCKJ52+6kr3BI/I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-4q8RnqxQMPGUta7j2eXmuw-1; Mon, 14 Nov 2022 17:52:15 -0500
X-MC-Unique: 4q8RnqxQMPGUta7j2eXmuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CED82101E14C;
	Mon, 14 Nov 2022 22:52:08 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CA3440E9786;
	Mon, 14 Nov 2022 22:52:08 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 12/23] copy: Update nbdcopy to use 64-bit block status
Date: Mon, 14 Nov 2022 16:51:47 -0600
Message-Id: <20221114225158.2186742-13-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aEKnyBeb8VP.A.bgB.ahscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2259
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114225158.2186742-13-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 22:59:38 +0000 (UTC)

Although our use of "base:allocation" doesn't require the use of the
64-bit API for flags, we might perform slightly faster for a server
that does give us 64-bit extent lengths and honors larger nbd_zero
lengths.
---
 copy/nbd-ops.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/copy/nbd-ops.c b/copy/nbd-ops.c
index 34ab4857..dad78ea9 100644
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
@@ -493,7 +493,7 @@ nbd_ops_get_extents (struct rw *rw, size_t index,

 static int
 add_extent (void *vp, const char *metacontext,
-            uint64_t offset, uint32_t *entries, size_t nr_entries,
+            uint64_t offset, nbd_extent *entries, size_t nr_entries,
             int *error)
 {
   extent_list *ret = vp;
@@ -502,25 +502,25 @@ add_extent (void *vp, const char *metacontext,
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
2.38.1

