Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 901CC710CDD
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:02:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 76D9820617; Thu, 25 May 2023 13:02:00 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:02:00 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8FF8520459
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:01:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ujULoJOYjJRA for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:01:19 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 10C4620481
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685019674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03JYUuPRuFGBOviVT2DXp8INnT579qRlj9R0+EarDYw=;
	b=iutY0/aoUg6bu5dD9YerI4EUjMoLfUT/lz2hsdq3MZg7UNhKTvOa+jMm8LivUrfNNXWQlo
	+3hCLU3PXZgNo5szlt8Rhtb90AgzK6rxsybKt+CcyFI8SulP6NQG/WblYmgU05AXcOClXI
	EYsQAGV0GEQOOLinNqkYLO3Cf3om8tM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-moyYU70AM4-BRJh1vlvg_g-1; Thu, 25 May 2023 09:01:12 -0400
X-MC-Unique: moyYU70AM4-BRJh1vlvg_g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 706A8811E9F;
	Thu, 25 May 2023 13:01:12 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F0C7492B0A;
	Thu, 25 May 2023 13:01:11 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 07/22] generator: Add struct nbd_extent in prep for 64-bit extents
Date: Thu, 25 May 2023 08:00:53 -0500
Message-Id: <20230525130108.757242-8-eblake@redhat.com>
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
Resent-Message-ID: <a4DFWNsmLMO.A.k8D.Ix1bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2481
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-8-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:02:00 +0000 (UTC)

The existing nbd_block_status() callback is permanently stuck with an
array of uint32_t pairs (len/2 extents), which is both constrained on
maximum extent size (no larger than 4G) and on the status flags (must
fit in 32 bits).  While the "base:allocation" metacontext will never
exceed 32 bits, it is not hard to envision other extension
metacontexts where a 64-bit status would be useful (for example, Zoned
Block Devices expressing a 64-bit offset[1]).  Exposing 64-bit extents
will require a new API; we now have the decision of whether to copy
the existing API practice of returning a bare array containing len/2
extent pairs, or with a saner idea of an array of structs with len
extents.  Returning an array of structs is actually easier to map to
various language bindings, particularly since we know the length field
will generally fit in 63-bits (fallout from the fact that NBD exports
are effectively capped in size by signed off_t), but where the status
field must represent a full 64 bits (assuming that the user wants to
connect to a metadata extension that utilizes 64 bits, rather than
existing metadata contexts that only expose 32 bits).

This patch introduces the struct we plan to use in the new API, along
with language bindings.  The bindings for Python and OCaml were
relatively straightforward; the Golang bindings took a bit more effort
for me to write.  Temporary unused attributes are needed to keep the
compiler happy until a later patch exposes a new API using the new
callback type.

Note that 'struct nbd_block_descriptor_ext' in lib/nbd-protocol.h is
exactly the same as what we want to use in C.  But it is easier to
stick a new public type in <libnbd.h> than to figure out how to expose
just part of a header we only want to use internally.

[1] https://zonedstorage.io/docs/linux/zbd-api

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 generator/API.mli   |  1 +
 generator/API.ml    | 12 +++++++++++-
 generator/C.ml      | 24 +++++++++++++++++++++---
 generator/GoLang.ml | 24 ++++++++++++++++++++++++
 generator/OCaml.ml  | 24 +++++++++++++++++++++---
 generator/Python.ml | 21 ++++++++++++++++++++-
 ocaml/helpers.c     | 20 ++++++++++++++++++++
 ocaml/nbd-c.h       |  1 +
 golang/handle.go    |  6 ++++++
 9 files changed, 125 insertions(+), 8 deletions(-)

diff --git a/generator/API.mli b/generator/API.mli
index c5bba8c2..96626c9b 100644
--- a/generator/API.mli
+++ b/generator/API.mli
@@ -52,6 +52,7 @@ and
 | BytesPersistOut of string * string
 | Closure of closure       (** function pointer + void *opaque *)
 | Enum of string * enum    (** enum/union type, int in C *)
+| Extent64 of string       (** extent descriptor, struct nbd_extent in C *)
 | Fd of string             (** file descriptor *)
 | Flags of string * flags  (** flags, uint32_t in C *)
 | Int of string            (** small int *)
diff --git a/generator/API.ml b/generator/API.ml
index 02c1260d..1da1ec53 100644
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
@@ -157,6 +158,14 @@ let extent_closure =
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
@@ -166,7 +175,8 @@ let context_closure =
   cbargs = [ CBString "name" ]
 }
 let all_closures = [ chunk_closure; completion_closure;
-                     debug_closure; extent_closure; list_closure;
+                     debug_closure; extent_closure; extent64_closure;
+                     list_closure;
                      context_closure ]

 (* Enums. *)
diff --git a/generator/C.ml b/generator/C.ml
index f772117c..d8472153 100644
--- a/generator/C.ml
+++ b/generator/C.ml
@@ -94,6 +94,7 @@ let
   | Closure { cbname } ->
      [ sprintf "%s_callback" cbname; sprintf "%s_user_data" cbname ]
   | Enum (n, _) -> [n]
+  | Extent64 n -> [n]
   | Fd n -> [n]
   | Flags (n, _) -> [n]
   | Int n -> [n]
@@ -129,7 +130,7 @@ let
   (* list of strings should be marked as non-null *)
   | StringList n -> [ true ]
   (* numeric and other non-pointer types are not able to be null *)
-  | Bool _ | Closure _ | Enum _ | Fd _ | Flags _
+  | Bool _ | Closure _ | Enum _ | Extent64 _ | Fd _ | Flags _
   | Int _ | Int64 _ | SizeT _
   | UInt _ | UInt32 _ | UInt64 _ | UIntPtr _ -> [ false ]

@@ -191,6 +192,9 @@ and
       | Enum (n, _) ->
          if types then pr "int ";
          pr "%s" n
+      | Extent64 n ->
+         if types then pr "nbd_extent ";
+         pr "%s" n
       | Flags (n, _) ->
          if types then pr "uint32_t ";
          pr "%s" n
@@ -305,6 +309,11 @@ and
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
@@ -477,6 +486,13 @@ let
   pr "extern int nbd_get_errno (void);\n";
   pr "#define LIBNBD_HAVE_NBD_GET_ERRNO 1\n";
   pr "\n";
+  pr "/* This is used in the callback for nbd_block_status_64.\n";
+  pr " */\n";
+  pr "typedef struct {\n";
+  pr "  uint64_t length;\n";
+  pr "  uint64_t flags;\n";
+  pr "} nbd_extent;\n";
+  pr "\n";
   print_closure_structs ();
   List.iter (
     fun (name, { args; optargs; ret }) ->
@@ -740,7 +756,7 @@ let
          pr "    char *%s_printable =\n" n;
          pr "        nbd_internal_printable_string_list (%s);\n" n
       | BytesOut _ | BytesPersistOut _
-      | Bool _ | Closure _ | Enum _ | Flags _ | Fd _ | Int _
+      | Bool _ | Closure _ | Enum _ | Extent64 _ | Flags _ | Fd _ | Int _
       | Int64 _ | SizeT _
       | SockAddrAndLen _ | UInt _ | UInt32 _ | UInt64 _ | UIntPtr _ -> ()
     ) args;
@@ -766,6 +782,7 @@ let
            pr " %s=\\\"%%s\\\" %s=%%zu" n count
         | Closure { cbname } -> pr " %s=%%s" cbname
         | Enum (n, _) -> pr " %s=%%d" n
+        | Extent64 _ -> assert false (* only used in extent64_closure *)
         | Flags (n, _) -> pr " %s=0x%%x" n
         | Fd n | Int n -> pr " %s=%%d" n
         | Int64 n -> pr " %s=%%\"PRIi64\"" n
@@ -804,6 +821,7 @@ let
               pr "%s_printable ? %s_printable : \"\", %s" n n count
            | Closure _ -> pr "\"<fun>\""
            | Enum (n, _) -> pr "%s" n
+           | Extent64 _ -> assert false (* only used in extent64_closure *)
            | Flags (n, _) -> pr "%s" n
            | Fd n | Int n | Int64 n | SizeT n -> pr "%s" n
            | SockAddrAndLen (_, len) -> pr "(int) %s" len
@@ -836,7 +854,7 @@ let
       | StringList n ->
          pr "    free (%s_printable);\n" n
       | BytesOut _ | BytesPersistOut _
-      | Bool _ | Closure _ | Enum _ | Flags _ | Fd _ | Int _
+      | Bool _ | Closure _ | Enum _ | Extent64 _ | Flags _ | Fd _ | Int _
       | Int64 _ | SizeT _
       | SockAddrAndLen _ | UInt _ | UInt32 _ | UInt64 _ | UIntPtr _ -> ()
     ) args;
diff --git a/generator/GoLang.ml b/generator/GoLang.ml
index 4ab6b262..8922812b 100644
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
@@ -262,6 +264,7 @@ let
        pr "    c_%s.user_data = C.alloc_cbid(C.long(%s_cbid))\n" cbname cbname
     | Enum (n, _) ->
        pr "    c_%s := C.int (%s)\n" n n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Fd n ->
        pr "    c_%s := C.int (%s)\n" n n
     | Flags (n, _) ->
@@ -334,6 +337,7 @@ let
     | BytesPersistOut (n, len) ->  pr ", c_%s, c_%s" n len
     | Closure { cbname } ->  pr ", c_%s" cbname
     | Enum (n, _) -> pr ", c_%s" n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Fd n -> pr ", c_%s" n
     | Flags (n, _) -> pr ", c_%s" n
     | Int n -> pr ", c_%s" n
@@ -524,6 +528,18 @@ let
     copy(ret, s)
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
+      ret[i].Flags = uint64 (slice[i].flags)
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
index edb81f25..ea3b044a 100644
--- a/generator/OCaml.ml
+++ b/generator/OCaml.ml
@@ -44,6 +44,7 @@ and
   | Closure { cbargs } ->
      sprintf "(%s)" (ocaml_closuredecl_to_string cbargs)
   | Enum (_, { enum_prefix }) -> sprintf "%s.t" enum_prefix
+  | Extent64 _ -> "extent"
   | Fd _ -> "Unix.file_descr"
   | Flags (_, { flag_prefix }) -> sprintf "%s.t list" flag_prefix
   | Int _ -> "int"
@@ -102,6 +103,7 @@ let
   | BytesPersistOut (n, len) -> n
   | Closure { cbname } -> cbname
   | Enum (n, _) -> n
+  | Extent64 n -> n
   | Fd n -> n
   | Flags (n, _) -> n
   | Int n -> n
@@ -147,6 +149,9 @@ let

 type cookie = int64

+type extent = int64 * int64
+(** Length and flags of an extent in block_status_64 callback. *)
+
 ";

   List.iter (
@@ -268,6 +273,7 @@ let
 exception Error of string * Unix.error option
 exception Closed of string
 type cookie = int64
+type extent = int64 * int64

 (* Give the exceptions names so that they can be raised from the C code. *)
 let () =
@@ -498,7 +504,8 @@ let
   let argnames =
     List.map (
       function
-      | CBArrayAndLen (UInt32 n, _) | CBBytesIn (n, _)
+      | CBArrayAndLen (UInt32 n, _) | CBArrayAndLen (Extent64 n, _)
+      | CBBytesIn (n, _)
       | CBInt n | CBInt64 n
       | CBMutable (Int n) | CBString n | CBUInt n | CBUInt64 n ->
          n ^ "v"
@@ -531,6 +538,14 @@ let
        pr "%s  %s,\n" indent n;
        pr "%s  %s\n" indent count;
        pr "%s);\n" indent
+    | CBArrayAndLen (Extent64 n, count) ->
+       pr "  %sv = " n;
+       let fncol = output_column () in
+       let indent = spaces fncol in
+       pr "nbd_internal_ocaml_alloc_extent64_array (\n";
+       pr "%s  %s,\n" indent n;
+       pr "%s  %s\n" indent count;
+       pr "%s);\n" indent
     | CBBytesIn (n, len) ->
        pr "  %sv = caml_alloc_initialized_string (%s, %s);\n" n len n
     | CBInt n | CBUInt n ->
@@ -554,7 +569,7 @@ let

   List.iter (
     function
-    | CBArrayAndLen (UInt32 _, _)
+    | CBArrayAndLen (_, _)
     | CBBytesIn _
     | CBInt _
     | CBInt64 _
@@ -563,7 +578,7 @@ let
     | CBUInt64 _ -> ()
     | CBMutable (Int n) ->
        pr "  *%s = Int_val (Field (%sv, 0));\n" n n
-    | CBArrayAndLen _ | CBMutable _ -> assert false
+    | CBMutable _ -> assert false
   ) cbargs;

   pr "  if (Is_exception_result (rv)) {\n";
@@ -578,6 +593,7 @@ let
   pr "}\n";
   pr "\n";
   pr "static int\n";
+  pr "__attribute__ ((unused)) /* XXX temporary hack */\n";
   pr "%s_wrapper " cbname;
   C.print_cbarg_list ~wrap:true cbargs;
   pr "\n";
@@ -695,6 +711,7 @@ let
        pr "  %s_callback.free = free_user_data;\n" cbname
     | Enum (n, { enum_prefix }) ->
        pr "  int %s = %s_val (%sv);\n" n enum_prefix n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Fd n ->
        pr "  /* OCaml Unix.file_descr is just an int, at least on Unix. */\n";
        pr "  int %s = Int_val (%sv);\n" n n
@@ -780,6 +797,7 @@ let
     | BytesPersistOut _
     | Closure _
     | Enum _
+    | Extent64 _
     | Fd _
     | Flags _
     | Int _
diff --git a/generator/Python.ml b/generator/Python.ml
index c81878de..ccac5fed 100644
--- a/generator/Python.ml
+++ b/generator/Python.ml
@@ -158,6 +158,7 @@ let
 let print_python_closure_wrapper { cbname; cbargs } =
   pr "/* Wrapper for %s callback. */\n" cbname;
   pr "static int\n";
+  pr "__attribute__ ((unused)) /* XXX temporary hack */\n";
   pr "%s_wrapper " cbname;
   C.print_cbarg_list ~wrap:true cbargs;
   pr "\n";
@@ -170,6 +171,7 @@ let
   List.iter (
     function
     | CBArrayAndLen (UInt32 n, _)
+    | CBArrayAndLen (Extent64 n, _)
     | CBBytesIn (n, _)
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
     | CBBytesIn (n, len) ->
        pr "  py_%s = nbd_internal_py_get_subview (data->view, %s, %s);\n" n n len;
        pr "  if (!py_%s) { PyErr_PrintEx (0); goto out; }\n" n
@@ -206,6 +218,7 @@ let
     List.map (
       function
       | CBArrayAndLen (UInt32 n, _) -> "O", sprintf "py_%s" n
+      | CBArrayAndLen (Extent64 n, _) -> "O", sprintf "py_%s" n
       | CBBytesIn (n, _) -> "O", sprintf "py_%s" n
       | CBInt n -> "i", n
       | CBInt64 n -> "L", n
@@ -254,7 +267,8 @@ let
   pr " out:\n";
   List.iter (
     function
-    | CBArrayAndLen (UInt32 n, _) ->
+    | CBArrayAndLen (UInt32 n, _)
+    | CBArrayAndLen (Extent64 n, _) ->
        pr "  Py_XDECREF (py_%s);\n" n
     | CBBytesIn (n, _) ->
        pr "  Py_XDECREF (py_%s);\n" n
@@ -307,6 +321,7 @@ let
            pr ".callback = %s_wrapper, .free = free_user_data" cbname);
        pr " };\n"
     | Enum (n, _) -> pr "  int %s;\n" n
+    | Extent64 _ -> assert false (* only used in extent64_closure *)
     | Flags (n, _) ->
        pr "  uint32_t %s_u32;\n" n;
        pr "  unsigned int %s; /* really uint32_t */\n" n
@@ -363,6 +378,7 @@ let
          "O", sprintf "&%s" n, sprintf "py_%s->buf, py_%s->len" n n
       | Closure { cbname } -> "O", sprintf "&py_%s_fn" cbname, cbname
       | Enum (n, _) -> "i", sprintf "&%s" n, n
+      | Extent64 _ -> assert false (* only used in extent64_closure *)
       | Flags (n, _) -> "I", sprintf "&%s" n, sprintf "%s_u32" n
       | Fd n | Int n -> "i", sprintf "&%s" n, n
       | Int64 n -> "L", sprintf "&%s" n, sprintf "%s_i64" n
@@ -454,6 +470,7 @@ let
          pr "  if (!chunk_user_data->view) goto out;\n"
        )
     | Enum _ -> ()
+    | Extent64 _ -> ()
     | Flags (n, _) -> pr "  %s_u32 = %s;\n" n n
     | Fd _ | Int _ -> ()
     | Int64 n -> pr "  %s_i64 = %s;\n" n n
@@ -552,6 +569,7 @@ let
     | Closure { cbname } ->
        pr "  free_user_data (%s_user_data);\n" cbname
     | Enum _ -> ()
+    | Extent64 _ -> ()
     | Flags _ -> ()
     | Fd _ | Int _ -> ()
     | Int64 _ -> ()
@@ -881,6 +899,7 @@ let
           | BytesPersistOut (n, _) -> n, None
           | Closure { cbname } -> cbname, None
           | Enum (n, _) -> n, None
+          | Extent64 _ -> assert false (* only used in extent64_closure *)
           | Flags (n, _) -> n, None
           | Fd n | Int n -> n, None
           | Int64 n -> n, None
diff --git a/ocaml/helpers.c b/ocaml/helpers.c
index 3361a696..09666daf 100644
--- a/ocaml/helpers.c
+++ b/ocaml/helpers.c
@@ -133,6 +133,26 @@ nbd_internal_ocaml_alloc_i64_from_u32_array (uint32_t *a, size_t len)
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
+    v = caml_copy_int64 (a[i].flags);
+    Store_field (s, 1, v);
+    Store_field (rv, i, s);
+  }
+
+  CAMLreturn (rv);
+}
+
 /* Convert a Unix.sockaddr to a C struct sockaddr. */
 void
 nbd_internal_unix_sockaddr_to_sa (value sockaddrv,
diff --git a/ocaml/nbd-c.h b/ocaml/nbd-c.h
index e3abb912..adcdd15a 100644
--- a/ocaml/nbd-c.h
+++ b/ocaml/nbd-c.h
@@ -62,6 +62,7 @@ extern void nbd_internal_ocaml_raise_closed (const char *func) Noreturn;

 extern const char **nbd_internal_ocaml_string_list (value);
 extern value nbd_internal_ocaml_alloc_i64_from_u32_array (uint32_t *, size_t);
+extern value nbd_internal_ocaml_alloc_extent64_array (nbd_extent *, size_t);
 extern void nbd_internal_unix_sockaddr_to_sa (value, struct sockaddr_storage *,
                                               socklen_t *);
 extern void nbd_internal_ocaml_exception_in_wrapper (const char *, value);
diff --git a/golang/handle.go b/golang/handle.go
index 5fe4ed4f..0b126005 100644
--- a/golang/handle.go
+++ b/golang/handle.go
@@ -58,6 +58,12 @@ func (h *Libnbd) String() string {
 	return "&Libnbd{}"
 }

+/* Used for block status callback. */
+type LibnbdExtent struct {
+	Length uint64        // length of the extent
+	Flags  uint64        // flags describing properties of the extent
+}
+
 /* All functions (except Close) return ([result,] LibnbdError). */
 type LibnbdError struct {
 	Op     string        // operation which failed
-- 
2.40.1

