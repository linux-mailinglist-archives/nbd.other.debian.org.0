Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C0649468080
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:34:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A698A2016F; Fri,  3 Dec 2021 23:34:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:34:18 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,URIBL_DBL_SPAM
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BFED52015F
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:34:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.327 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, URIBL_DBL_SPAM=2.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nN7UQB19Egvq for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:34:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 6745B200E5
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t4A00Xo1vM+362H6uyQ8M9irC3uRjwPd0tkovWpY5LU=;
	b=OocKJR7hWlpZgfZfgv5viTespj+4nhIKABLP9d/w1l9w/2RFPZf0eJfoAMV/Xf5kw51Hjb
	m55iuFS0sfHSLK3tjFZGtshKciv2xLfW6p0GMxsIG0595iEJ7FCQeooZl7Ho6qXcI5KAkR
	AVg5FUa4OBQBsPSzWryp9/kmlIlsrO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-eCijhmAvNL6HaziRMyRDPA-1; Fri, 03 Dec 2021 18:18:01 -0500
X-MC-Unique: eCijhmAvNL6HaziRMyRDPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 346F0100B797;
	Fri,  3 Dec 2021 23:18:00 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 377EA4EC7F;
	Fri,  3 Dec 2021 23:17:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: nbd@other.debian.org,
	qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	nsoffer@redhat.com
Subject: [libnbd PATCH 07/13] generator: Add struct nbd_extent in prep for 64-bit extents
Date: Fri,  3 Dec 2021 17:17:35 -0600
Message-Id: <20211203231741.3901263-8-eblake@redhat.com>
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
Resent-Message-ID: <rIxSOwB6YGF.A.hkD.6lqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1639
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231741.3901263-8-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:34:18 +0000 (UTC)

The existing nbd_block_status() callback is permanently stuck with an
array of uint32_t pairs (len/2 extents), and exposing 64-bit extents
requires a new API.  Before we get there, we first need a way to
express a struct containing uint64_t length and uint32_t flags across
the various language bindings in the callback that will be used by the
new API.

For the language bindings, we have to construct an array of a similar
struct in the target language's preferred format.  The bindings for
Python and OCaml were relatively straightforward; the Golang bindings
took a bit more effort for me to write.  Temporary unused attributes
are needed to keep the compiler happy until a later patch exposes a
new API using the new callback type.
---
 generator/API.ml    | 12 +++++++++++-
 generator/API.mli   |  3 ++-
 generator/C.ml      | 24 +++++++++++++++++++++---
 generator/GoLang.ml | 24 ++++++++++++++++++++++++
 generator/OCaml.ml  | 21 +++++++++++++++++----
 generator/Python.ml | 30 ++++++++++++++++++++++++++----
 ocaml/helpers.c     | 22 +++++++++++++++++++++-
 ocaml/nbd-c.h       |  3 ++-
 golang/handle.go    |  6 ++++++
 9 files changed, 130 insertions(+), 15 deletions(-)

diff --git a/generator/API.ml b/generator/API.ml
index cf2e7543..70ae721d 100644
--- a/generator/API.ml
+++ b/generator/API.ml
@@ -42,6 +42,7 @@
 | BytesPersistOut of string * string
 | Closure of closure
 | Enum of string * enum
+| Extent64 of string
 | Fd of string
 | Flags of string * flags
 | Int of string
@@ -142,6 +143,14 @@ let extent_closure =
                             "nr_entries");
              CBMutable (Int "error") ]
 }
+let extent64_closure = {
+  cbname = "extent64";
+  cbargs = [ CBString "metacontext";
+             CBUInt64 "offset";
+             CBArrayAndLen (Extent64 "entries",
+                            "nr_entries");
+             CBMutable (Int "error") ]
+}
 let list_closure = {
   cbname = "list";
   cbargs = [ CBString "name"; CBString "description" ]
@@ -151,7 +160,8 @@ let context_closure =
   cbargs = [ CBString "name" ]
 }
 let all_closures = [ chunk_closure; completion_closure;
-                     debug_closure; extent_closure; list_closure;
+                     debug_closure; extent_closure; extent64_closure;
+                     list_closure;
                      context_closure ]

 (* Enums. *)
diff --git a/generator/API.mli b/generator/API.mli
index d284637f..922d8120 100644
--- a/generator/API.mli
+++ b/generator/API.mli
@@ -1,6 +1,6 @@
 (* hey emacs, this is OCaml code: -*- tuareg -*- *)
 (* nbd client library in userspace: the API
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -52,6 +52,7 @@ and
 | BytesPersistOut of string * string
 | Closure of closure       (** function pointer + void *opaque *)
 | Enum of string * enum    (** enum/union type, int in C *)
+| Extent64 of string       (** extent descriptor, struct nbd_extent in C *)
 | Fd of string             (** file descriptor *)
 | Flags of string * flags  (** flags, uint32_t in C *)
 | Int of string            (** small int *)
diff --git a/generator/C.ml b/generator/C.ml
index 797af531..7b0be583 100644
--- a/generator/C.ml
+++ b/generator/C.ml
@@ -1,6 +1,6 @@
 (* hey emacs, this is OCaml code: -*- tuareg -*- *)
 (* nbd client library in userspace: generate the C API and documentation
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -90,6 +90,7 @@ let
 | Closure { cbname } ->
    [ sprintf "%s_callback" cbname; sprintf "%s_user_data" cbname ]
 | Enum (n, _) -> [n]
+| Extent64 n -> [n]
 | Fd n -> [n]
 | Flags (n, _) -> [n]
 | Int n -> [n]
@@ -152,6 +153,9 @@ and
       | Enum (n, _) ->
          if types then pr "int ";
          pr "%s" n
+      | Extent64 n ->
+         if types then pr "nbd_extent ";
+         pr "%s" n
       | Flags (n, _) ->
          if types then pr "uint32_t ";
          pr "%s" n
@@ -238,6 +242,11 @@ and
          pr "%s, " n;
          if types then pr "size_t ";
          pr "%s" len
+      | CBArrayAndLen (Extent64 n, len) ->
+         if types then pr "nbd_extent *";
+         pr "%s, " n;
+         if types then pr "size_t ";
+         pr "%s" len
       | CBArrayAndLen _ -> assert false
       | CBBytesIn (n, len) ->
          if types then pr "const void *";
@@ -388,6 +397,13 @@ let
   pr "extern int nbd_get_errno (void);\n";
   pr "#define LIBNBD_HAVE_NBD_GET_ERRNO 1\n";
   pr "\n";
+  pr "/* This is used in the callback for nbd_block_status_64.\n";
+  pr " */\n";
+  pr "typedef struct {\n";
+  pr "  uint64_t length;\n";
+  pr "  uint32_t flags;\n";
+  pr "} nbd_extent;\n";
+  pr "\n";
   print_closure_structs ();
   List.iter (
     fun (name, { args; optargs; ret }) ->
@@ -630,7 +646,7 @@ let
          pr "    char *%s_printable =\n" n;
          pr "        nbd_internal_printable_string_list (%s);\n" n
       | BytesOut _ | BytesPersistOut _
-      | Bool _ | Closure _ | Enum _ | Flags _ | Fd _ | Int _
+      | Bool _ | Closure _ | Enum _ | Extent64 _ | Flags _ | Fd _ | Int _
       | Int64 _ | SizeT _
       | SockAddrAndLen _ | UInt _ | UInt32 _ | UInt64 _ | UIntPtr _ -> ()
     ) args;
@@ -645,6 +661,7 @@ let
          pr " %s=\\\"%%s\\\" %s=%%zu" n count
       | Closure { cbname } -> pr " %s=<fun>" cbname
       | Enum (n, _) -> pr " %s=%%d" n
+      | Extent64 _ -> assert false (* only used in extent64_closure *)
       | Flags (n, _) -> pr " %s=0x%%x" n
       | Fd n | Int n -> pr " %s=%%d" n
       | Int64 n -> pr " %s=%%\" PRIi64 \"" n
@@ -674,6 +691,7 @@ let
          pr ", %s_printable ? %s_printable : \"\", %s" n n count
       | Closure { cbname } -> ()
       | Enum (n, _) -> pr ", %s" n
+      | Extent64 _ -> assert false (* only used in extent64_closure *)
       | Flags (n, _) -> pr ", %s" n
       | Fd n | Int n | Int64 n | SizeT n -> pr ", %s" n
       | SockAddrAndLen (_, len) -> pr ", (int) %s" len
@@ -697,7 +715,7 @@ let
       | StringList n ->
          pr "    free (%s_printable);\n" n
       | BytesOut _ | BytesPersistOut _
-      | Bool _ | Closure _ | Enum _ | Flags _ | Fd _ | Int _
+      | Bool _ | Closure _ | Enum _ | Extent64 _ | Flags _ | Fd _ | Int _
       | Int64 _ | SizeT _
       | SockAddrAndLen _ | UInt _ | UInt32 _ | UInt64 _ | UIntPtr _ -> ()
     ) args;
diff --git a/generator/GoLang.ml b/generator/GoLang.ml
index d3b7dc79..7363063f 100644
--- a/generator/GoLang.ml
+++ b/generator/GoLang.ml
@@ -49,6 +49,7 @@ let
   | BytesPersistOut (n, len) -> n
   | Closure { cbname } -> cbname
   | Enum (n, _) -> n
+  | Extent64 n -> n
   | Fd n -> n
   | Flags (n, _) -> n
   | Int n -> n
@@ -71,6 +72,7 @@ let
   | BytesPersistOut _ -> "AioBuffer"
   | Closure { cbname } -> sprintf "%sCallback" (camel_case cbname)
   | Enum (_, { enum_prefix }) -> camel_case enum_prefix
+  | Extent64 _ -> assert false (* only used in extent64_closure *)
   | Fd _ -> "int"
   | Flags (_, { flag_prefix }) -> camel_case flag_prefix
   | Int _ -> "int"
@@ -261,6 +263,7 @@ let
        pr "    c_%s.user_data = C.alloc_cbid(C.long(%s_cbid))\n" cbname cbname
     | Enum (n, _) ->
        pr "    c_%s := C.int (%s)\n" n n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Fd n ->
        pr "    c_%s := C.int (%s)\n" n n
     | Flags (n, _) ->
@@ -333,6 +336,7 @@ let
     | BytesPersistOut (n, len) ->  pr ", c_%s, c_%s" n len
     | Closure { cbname } ->  pr ", c_%s" cbname
     | Enum (n, _) -> pr ", c_%s" n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Fd n -> pr ", c_%s" n
     | Flags (n, _) -> pr ", c_%s" n
     | Int n -> pr ", c_%s" n
@@ -524,6 +528,18 @@ let
     copy(ret, arrayPtr[:count:count])
     return ret
 }
+
+func copy_extent_array (entries *C.nbd_extent, count C.size_t) []LibnbdExtent {
+    unsafePtr := unsafe.Pointer(entries)
+    arrayPtr := (*[1 << 20]C.nbd_extent)(unsafePtr)
+    slice := arrayPtr[:count:count]
+    ret := make([]LibnbdExtent, count)
+    for i := 0; i < int (count); i++ {
+      ret[i].Length = uint64 (slice[i].length)
+      ret[i].Flags = uint32 (slice[i].flags)
+    }
+    return ret
+}
 ";

   List.iter (
@@ -537,6 +553,8 @@ let
           match cbarg with
           | CBArrayAndLen (UInt32 n, _) ->
              pr "%s []uint32" n;
+          | CBArrayAndLen (Extent64 n, _) ->
+             pr "%s []LibnbdExtent" n;
           | CBBytesIn (n, len) ->
              pr "%s []byte" n;
           | CBInt n ->
@@ -563,6 +581,8 @@ let
           match cbarg with
           | CBArrayAndLen (UInt32 n, count) ->
              pr "%s *C.uint32_t, %s C.size_t" n count
+          | CBArrayAndLen (Extent64 n, count) ->
+             pr "%s *C.nbd_extent, %s C.size_t" n count
           | CBBytesIn (n, len) ->
              pr "%s unsafe.Pointer, %s C.size_t" n len
           | CBInt n ->
@@ -605,6 +625,8 @@ let
           match cbarg with
           | CBArrayAndLen (UInt32 n, count) ->
              pr "copy_uint32_array (%s, %s)" n count
+          | CBArrayAndLen (Extent64 n, count) ->
+             pr "copy_extent_array (%s, %s)" n count
           | CBBytesIn (n, len) ->
              pr "C.GoBytes (%s, C.int (%s))" n len
           | CBInt n ->
@@ -756,6 +778,8 @@ let
            match cbarg with
            | CBArrayAndLen (UInt32 n, count) ->
               pr "uint32_t *%s, size_t %s" n count
+           | CBArrayAndLen (Extent64 n, count) ->
+              pr "nbd_extent *%s, size_t %s" n count
            | CBBytesIn (n, len) ->
               pr "void *%s, size_t %s" n len
            | CBInt n ->
diff --git a/generator/OCaml.ml b/generator/OCaml.ml
index 1349609b..eac42668 100644
--- a/generator/OCaml.ml
+++ b/generator/OCaml.ml
@@ -1,6 +1,6 @@
 (* hey emacs, this is OCaml code: -*- tuareg -*- *)
 (* nbd client library in userspace: generator
- * Copyright (C) 2013-2020 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -44,6 +44,7 @@ and
   | Closure { cbargs } ->
      sprintf "(%s)" (ocaml_closuredecl_to_string cbargs)
   | Enum (_, { enum_prefix }) -> sprintf "%s.t" enum_prefix
+  | Extent64 _ -> "extent"
   | Fd _ -> "Unix.file_descr"
   | Flags (_, { flag_prefix }) -> sprintf "%s.t list" flag_prefix
   | Int _ -> "int"
@@ -100,6 +101,7 @@ let
   | BytesPersistOut (n, len) -> n
   | Closure { cbname } -> cbname
   | Enum (n, _) -> n
+  | Extent64 n -> n
   | Fd n -> n
   | Flags (n, _) -> n
   | Int n -> n
@@ -145,6 +147,9 @@ let

 type cookie = int64

+type extent = int64 * int32
+(** Length and flags of an extent in block_status_64 callback. *)
+
 ";

   List.iter (
@@ -246,6 +251,7 @@ let
 exception Error of string * int
 exception Closed of string
 type cookie = int64
+type extent = int64 * int32

 (* Give the exceptions names so that they can be raised from the C code. *)
 let () =
@@ -469,7 +475,8 @@ let
   let argnames =
     List.map (
       function
-      | CBArrayAndLen (UInt32 n, _) | CBBytesIn (n, _)
+      | CBArrayAndLen (UInt32 n, _) | CBArrayAndLen (Extent64 n, _)
+      | CBBytesIn (n, _)
       | CBInt n | CBInt64 n
       | CBMutable (Int n) | CBString n | CBUInt n | CBUInt64 n ->
          n ^ "v"
@@ -497,6 +504,9 @@ let
     | CBArrayAndLen (UInt32 n, count) ->
        pr "  %sv = nbd_internal_ocaml_alloc_int32_array (%s, %s);\n"
          n n count;
+    | CBArrayAndLen (Extent64 n, count) ->
+       pr "  %sv = nbd_internal_ocaml_alloc_extent64_array (%s, %s);\n"
+         n n count;
     | CBBytesIn (n, len) ->
        pr "  %sv = caml_alloc_initialized_string (%s, %s);\n" n len n
     | CBInt n | CBUInt n ->
@@ -520,7 +530,7 @@ let

   List.iter (
     function
-    | CBArrayAndLen (UInt32 _, _)
+    | CBArrayAndLen (_, _)
     | CBBytesIn _
     | CBInt _
     | CBInt64 _
@@ -529,7 +539,7 @@ let
     | CBUInt64 _ -> ()
     | CBMutable (Int n) ->
        pr "  *%s = Int_val (Field (%sv, 0));\n" n n
-    | CBArrayAndLen _ | CBMutable _ -> assert false
+    | CBMutable _ -> assert false
   ) cbargs;

   pr "  if (Is_exception_result (rv)) {\n";
@@ -544,6 +554,7 @@ let
   pr "}\n";
   pr "\n";
   pr "static int\n";
+  pr "__attribute__((unused)) /* XXX temporary hack */\n";
   pr "%s_wrapper " cbname;
   C.print_cbarg_list ~wrap:true cbargs;
   pr "\n";
@@ -659,6 +670,7 @@ let
        pr "  %s_callback.free = free_user_data;\n" cbname
     | Enum (n, { enum_prefix }) ->
        pr "  int %s = %s_val (%sv);\n" n enum_prefix n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Fd n ->
        pr "  /* OCaml Unix.file_descr is just an int, at least on Unix. */\n";
        pr "  int %s = Int_val (%sv);\n" n n
@@ -739,6 +751,7 @@ let
     | BytesPersistOut _
     | Closure _
     | Enum _
+    | Extent64 _
     | Fd _
     | Flags _
     | Int _
diff --git a/generator/Python.ml b/generator/Python.ml
index 4ab18f62..4212e2ac 100644
--- a/generator/Python.ml
+++ b/generator/Python.ml
@@ -158,6 +158,7 @@ let
 let print_python_closure_wrapper { cbname; cbargs } =
   pr "/* Wrapper for %s callback. */\n" cbname;
   pr "static int\n";
+  pr "__attribute__((unused)) /* XXX temporary hack */\n";
   pr "%s_wrapper " cbname;
   C.print_cbarg_list ~wrap:true cbargs;
   pr "\n";
@@ -169,7 +170,8 @@ let
   pr "  PyObject *py_args, *py_ret;\n";
   List.iter (
     function
-    | CBArrayAndLen (UInt32 n, _) ->
+    | CBArrayAndLen (UInt32 n, _)
+    | CBArrayAndLen (Extent64 n, _) ->
        pr "  PyObject *py_%s = NULL;\n" n
     | CBMutable (Int n) ->
        pr "  PyObject *py_%s = NULL;\n" n
@@ -187,6 +189,16 @@ let
        pr "    if (!py_e_%s) { PyErr_PrintEx (0); goto out; }\n" n;
        pr "    PyList_SET_ITEM (py_%s, i_%s, py_e_%s);\n" n n n;
        pr "  }\n"
+    | CBArrayAndLen (Extent64 n, len) ->
+       pr "  py_%s = PyList_New (%s);\n" n len;
+       pr "  size_t i_%s;\n" n;
+       pr "  for (i_%s = 0; i_%s < %s; ++i_%s) {\n" n n len n;
+       pr "    PyObject *py_e_%s = Py_BuildValue (\"OO\",\n" n;
+       pr "      PyLong_FromUnsignedLong (%s[i_%s].length),\n" n n;
+       pr "      PyLong_FromUnsignedLong (%s[i_%s].flags));\n" n n;
+       pr "    if (!py_e_%s) { PyErr_PrintEx (0); goto out; }\n" n;
+       pr "    PyList_SET_ITEM (py_%s, i_%s, py_e_%s);\n" n n n;
+       pr "  }\n"
     | CBBytesIn _
     | CBInt _
     | CBInt64 _ -> ()
@@ -209,7 +221,7 @@ let
   pr "  py_args = Py_BuildValue (\"(\"";
   List.iter (
     function
-    | CBArrayAndLen (UInt32 n, len) -> pr " \"O\""
+    | CBArrayAndLen (_, len) -> pr " \"O\""
     | CBBytesIn (n, len) -> pr " \"y#\""
     | CBInt n -> pr " \"i\""
     | CBInt64 n -> pr " \"L\""
@@ -217,12 +229,13 @@ let
     | CBString n -> pr " \"s\""
     | CBUInt n -> pr " \"I\""
     | CBUInt64 n -> pr " \"K\""
-    | CBArrayAndLen _ | CBMutable _ -> assert false
+    | CBMutable _ -> assert false
   ) cbargs;
   pr " \")\"";
   List.iter (
     function
     | CBArrayAndLen (UInt32 n, _) -> pr ", py_%s" n
+    | CBArrayAndLen (Extent64 n, _) -> pr ", py_%s" n
     | CBBytesIn (n, len) -> pr ", %s, (int) %s" n len
     | CBMutable (Int n) -> pr ", py_%s" n
     | CBInt n | CBInt64 n
@@ -259,7 +272,8 @@ let
   pr " out:\n";
   List.iter (
     function
-    | CBArrayAndLen (UInt32 n, _) ->
+    | CBArrayAndLen (UInt32 n, _)
+    | CBArrayAndLen (Extent64 n, _) ->
        pr "  Py_XDECREF (py_%s);\n" n
     | CBMutable (Int n) ->
        pr "  if (py_%s) {\n" n;
@@ -307,6 +321,7 @@ let
          cbname cbname cbname;
        pr "                         .free = free_user_data };\n"
     | Enum (n, _) -> pr "  int %s;\n" n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Flags (n, _) ->
        pr "  uint32_t %s_u32;\n" n;
        pr "  unsigned int %s; /* really uint32_t */\n" n
@@ -360,6 +375,7 @@ let
     | BytesPersistOut (_, count) -> pr " \"O\""
     | Closure _ -> pr " \"O\""
     | Enum _ -> pr " \"i\""
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Flags _ -> pr " \"I\""
     | Fd n | Int n -> pr " \"i\""
     | Int64 n -> pr " \"L\""
@@ -388,6 +404,7 @@ let
     | BytesOut (_, count) -> pr ", &%s" count
     | Closure { cbname } -> pr ", &py_%s_fn" cbname
     | Enum (n, _) -> pr ", &%s" n
+    | Extent64 _ -> assert false
     | Flags (n, _) -> pr ", &%s" n
     | Fd n | Int n | SizeT n | Int64 n -> pr ", &%s" n
     | Path n -> pr ", PyUnicode_FSConverter, &py_%s" n
@@ -452,6 +469,7 @@ let
        pr "  Py_INCREF (py_%s_fn);\n" cbname;
        pr "  %s_user_data->fn = py_%s_fn;\n" cbname cbname
     | Enum _ -> ()
+    | Extent64 _ -> ()
     | Flags (n, _) -> pr "  %s_u32 = %s;\n" n n
     | Fd _ | Int _ -> ()
     | Int64 n -> pr "  %s_i64 = %s;\n" n n
@@ -484,6 +502,7 @@ let
     | BytesPersistOut (n, _) -> pr ", %s_buf->data, %s_buf->len" n n
     | Closure { cbname } -> pr ", %s" cbname
     | Enum (n, _) -> pr ", %s" n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Flags (n, _) -> pr ", %s_u32" n
     | Fd n | Int n -> pr ", %s" n
     | Int64 n -> pr ", %s_i64" n
@@ -532,6 +551,7 @@ let
     | BytesPersistIn _ | BytesPersistOut _
     | Closure _
     | Enum _
+    | Extent64 _
     | Flags _
     | Fd _ | Int _
     | Int64 _
@@ -577,6 +597,7 @@ let
     | Closure { cbname } ->
        pr "  free_user_data (%s_user_data);\n" cbname
     | Enum _ -> ()
+    | Extent64 _ -> ()
     | Flags _ -> ()
     | Fd _ | Int _ -> ()
     | Int64 _ -> ()
@@ -820,6 +841,7 @@ let
           | BytesPersistOut (n, _) -> n, None, Some (sprintf "%s._o" n)
           | Closure { cbname } -> cbname, None, None
           | Enum (n, _) -> n, None, None
+          | Extent64 _ -> assert false (* only used in extent64_closure *)
           | Flags (n, _) -> n, None, None
           | Fd n | Int n -> n, None, None
           | Int64 n -> n, None, None
diff --git a/ocaml/helpers.c b/ocaml/helpers.c
index 90333cd7..d15ffaf3 100644
--- a/ocaml/helpers.c
+++ b/ocaml/helpers.c
@@ -1,5 +1,5 @@
 /* NBD client library in userspace
- * Copyright (C) 2013-2019 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -112,6 +112,26 @@ nbd_internal_ocaml_alloc_int32_array (uint32_t *a, size_t len)
   CAMLreturn (rv);
 }

+value
+nbd_internal_ocaml_alloc_extent64_array (nbd_extent *a, size_t len)
+{
+  CAMLparam0 ();
+  CAMLlocal3 (s, v, rv);
+  size_t i;
+
+  rv = caml_alloc (len, 0);
+  for (i = 0; i < len; ++i) {
+    s = caml_alloc (2, 0);
+    v = caml_copy_int64 (a[i].length);
+    Store_field (s, 0, v);
+    v = caml_copy_int32 (a[i].flags);
+    Store_field (s, 1, v);
+    Store_field (rv, i, s);
+  }
+
+  CAMLreturn (rv);
+}
+
 /* Common code when an exception is raised in an OCaml callback and
  * the wrapper has to deal with it.  Callbacks are not supposed to
  * raise exceptions, so we print it.  We also handle Assert_failure
diff --git a/ocaml/nbd-c.h b/ocaml/nbd-c.h
index 9f362fa1..3b66049d 100644
--- a/ocaml/nbd-c.h
+++ b/ocaml/nbd-c.h
@@ -1,5 +1,5 @@
 /* NBD client library in userspace
- * Copyright (C) 2013-2019 Red Hat Inc.
+ * Copyright (C) 2013-2021 Red Hat Inc.
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
@@ -61,6 +61,7 @@ extern void nbd_internal_ocaml_raise_closed (const char *func) Noreturn;

 extern const char **nbd_internal_ocaml_string_list (value);
 extern value nbd_internal_ocaml_alloc_int32_array (uint32_t *, size_t);
+extern value nbd_internal_ocaml_alloc_extent64_array (nbd_extent *, size_t);
 extern void nbd_internal_ocaml_exception_in_wrapper (const char *, value);

 /* Extract an NBD handle from an OCaml heap value. */
diff --git a/golang/handle.go b/golang/handle.go
index c8d9485d..43a0e489 100644
--- a/golang/handle.go
+++ b/golang/handle.go
@@ -58,6 +58,12 @@ func (h *Libnbd) String() string {
 	return "&Libnbd{}"
 }

+/* Used for block status callback. */
+type LibnbdExtent struct {
+	Length uint64        // length of the extent
+	Flags  uint32        // flags describing properties of the extent
+}
+
 /* All functions (except Close) return ([result,] LibnbdError). */
 type LibnbdError struct {
 	Op     string        // operation which failed
-- 
2.33.1

