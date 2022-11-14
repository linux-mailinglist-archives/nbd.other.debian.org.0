Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B65E628CCF
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:00:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0395C20668; Mon, 14 Nov 2022 23:00:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:00:30 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EBD692067E
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 22:59:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.515,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id YZEmji7noim5 for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 22:59:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 94F8E20616
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 22:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VoOH8h5zJxs1trCxHkur4lW8NowOm3VRrSmQjkq7wik=;
	b=Ib6v6EoHsGTtRwQQhHlFk5AwRFbI7tWNRjgYW/ObeYaUaoqNCIET7zq+VW90gNG4KWL66U
	u/ODkGMfMfDndSW42a+popQqipvrdKicT/BLTq+qKunQO7NmujxeEMo/Oo2rcGxMkvLGcL
	tbSOE17tV+4EzeE1xIo7jqN6PG+BB20=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-gafmUrvGONm7ECI5Pdy_jw-1; Mon, 14 Nov 2022 17:52:12 -0500
X-MC-Unique: gafmUrvGONm7ECI5Pdy_jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9726B185A7A3;
	Mon, 14 Nov 2022 22:52:11 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34F6740E9786;
	Mon, 14 Nov 2022 22:52:11 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 17/23] ocaml: Add example for 64-bit extents
Date: Mon, 14 Nov 2022 16:51:52 -0600
Message-Id: <20221114225158.2186742-18-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nbAJrGfYZwG.A.y-C.OiscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2267
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114225158.2186742-18-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:00:31 +0000 (UTC)

Since our example program for 32-bit extents is inherently limited to
32-bit lengths, it is also worth demonstrating the 64-bit extent API,
including the difference in the array indexing being saner.
---
 ocaml/examples/Makefile.am  |  3 ++-
 ocaml/examples/extents64.ml | 42 +++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 ocaml/examples/extents64.ml

diff --git a/ocaml/examples/Makefile.am b/ocaml/examples/Makefile.am
index 5ee6dd63..c6f4989d 100644
--- a/ocaml/examples/Makefile.am
+++ b/ocaml/examples/Makefile.am
@@ -1,5 +1,5 @@
 # nbd client library in userspace
-# Copyright (C) 2013-2019 Red Hat Inc.
+# Copyright (C) 2013-2022 Red Hat Inc.
 #
 # This library is free software; you can redistribute it and/or
 # modify it under the terms of the GNU Lesser General Public
@@ -20,6 +20,7 @@ include $(top_srcdir)/subdir-rules.mk
 ml_examples = \
 	asynch_copy.ml \
 	extents.ml \
+	extents64.ml \
 	get_size.ml \
 	open_qcow2.ml \
 	server_flags.ml \
diff --git a/ocaml/examples/extents64.ml b/ocaml/examples/extents64.ml
new file mode 100644
index 00000000..8ee7e218
--- /dev/null
+++ b/ocaml/examples/extents64.ml
@@ -0,0 +1,42 @@
+open Printf
+
+let () =
+  NBD.with_handle (
+    fun nbd ->
+      NBD.add_meta_context nbd "base:allocation";
+      NBD.connect_command nbd
+                          ["nbdkit"; "-s"; "--exit-with-parent"; "-r";
+                           "sparse-random"; "8G"];
+
+      (* Read the extents and print them. *)
+      let size = NBD.get_size nbd in
+      let cap =
+        match NBD.get_extended_headers_negotiated nbd with
+        | true -> size
+        | false -> 0x8000_0000_L in
+      let fetch_offset = ref 0_L in
+      while !fetch_offset < size do
+        let remaining = Int64.sub size !fetch_offset in
+        let fetch_size = min remaining cap in
+        NBD.block_status_64 nbd fetch_size !fetch_offset (
+          fun meta _ entries err ->
+            printf "nbd_block_status callback: meta=%s err=%d\n" meta !err;
+            if meta = "base:allocation" then (
+              printf "index\t%16s %16s %s\n" "offset" "length" "flags";
+              for i = 0 to Array.length entries - 1 do
+                let len = fst entries.(i)
+                and flags =
+                  match snd entries.(i) with
+                  | 0_L -> "data"
+                  | 1_L -> "hole"
+                  | 2_L -> "zero"
+                  | 3_L -> "hole+zero"
+                  | unknown -> sprintf "unknown (%Ld)" unknown in
+                printf "%d:\t%16Ld %16Ld %s\n" i !fetch_offset len flags;
+                fetch_offset := Int64.add !fetch_offset len
+              done;
+            );
+            0
+        ) (* NBD.block_status *)
+      done
+  )
-- 
2.38.1

