Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3D6710CE8
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:02:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AEE11204C2; Thu, 25 May 2023 13:02:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:02:42 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EAEFB20496
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:01:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.351 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wl8W7OAidRV7 for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:01:24 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 90F3320471
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685019679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PN3ruSYdrkWAzOy3ELAI7r7dTB2mJLJLyxemTVzx670=;
	b=HQG1MopCk7oliUreK3qdQG5GMIG2yHzyfoV0DdKgQnKT3RLnMb2U/k9Y/T6yDLnkS0Vy+A
	HBSZ2aHKlvc0Xtac0O/jjgc78tKIL8eM7gbgIqnY5jcZN4Svh4CTWwhSChB9py8pNOzXJi
	md30cqHxHUzbqU5g5AShQueUB86RGsQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-b3eWf-GRMQKbJE96snLCug-1; Thu, 25 May 2023 09:01:17 -0400
X-MC-Unique: b3eWf-GRMQKbJE96snLCug-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D0CA3C17C7C;
	Thu, 25 May 2023 13:01:17 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF7DC492B0A;
	Thu, 25 May 2023 13:01:16 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 17/22] ocaml: Add example for 64-bit extents
Date: Thu, 25 May 2023 08:01:03 -0500
Message-Id: <20230525130108.757242-18-eblake@redhat.com>
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
Resent-Message-ID: <lenAeAAaJuN.A.3FH.yx1bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2488
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-18-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:02:42 +0000 (UTC)

Since our example program for 32-bit extents is inherently limited to
32-bit lengths, it is also worth demonstrating the 64-bit extent API,
including the difference in the array indexing being saner.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 ocaml/examples/Makefile.am  |  1 +
 ocaml/examples/extents64.ml | 42 +++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 ocaml/examples/extents64.ml

diff --git a/ocaml/examples/Makefile.am b/ocaml/examples/Makefile.am
index 28b4ab94..a4eb47a5 100644
--- a/ocaml/examples/Makefile.am
+++ b/ocaml/examples/Makefile.am
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
2.40.1

