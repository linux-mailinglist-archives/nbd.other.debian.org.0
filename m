Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F7F726301
	for <lists+nbd@lfdr.de>; Wed,  7 Jun 2023 16:39:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9A742204E6; Wed,  7 Jun 2023 14:39:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  7 14:39:17 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4FDF02047D
	for <lists-other-nbd@bendel.debian.org>; Wed,  7 Jun 2023 14:23:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.091 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DBgVzb0GwUy3 for <lists-other-nbd@bendel.debian.org>;
	Wed,  7 Jun 2023 14:23:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id DF3E5204AF
	for <nbd@other.debian.org>; Wed,  7 Jun 2023 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686147816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwLM2ZtEmAlBrRzR+qBVV2mRXZf4DSpEOXyG6sSxCAw=;
	b=HaFZ0vgqsQ9YoA4AlyJl2ayZJDN93CHo/9UcrqOCKvhotPZLaCbTvhcUGWCfMeCowjo9r5
	ePCnDiAwL/s8KWSoVi7hFYx2qZR5+QHdAY8hpN27Q4Ss6LMU6DqXvhtDiiBI/F7AaECq6b
	x5B6OfmvvV3+te3Wbb8Wetf3AgmNf9A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-PNOvC_EKP6CYCbERcD0yww-1; Wed, 07 Jun 2023 10:23:32 -0400
X-MC-Unique: PNOvC_EKP6CYCbERcD0yww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70DA1802E58;
	Wed,  7 Jun 2023 14:23:32 +0000 (UTC)
Received: from [10.39.192.195] (unknown [10.39.192.195])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B1D3C1603B;
	Wed,  7 Jun 2023 14:23:29 +0000 (UTC)
Message-ID: <0e4ff751-88d6-837b-15a5-6f6c370a2f09@redhat.com>
Date: Wed, 7 Jun 2023 16:23:27 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 07/22] generator: Add struct
 nbd_extent in prep for 64-bit extents
To: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Cc: qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-8-eblake@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230525130108.757242-8-eblake@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bKaX_pQlr1J.A.kwD.VaJgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2529
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0e4ff751-88d6-837b-15a5-6f6c370a2f09@redhat.com
Resent-Date: Wed,  7 Jun 2023 14:39:17 +0000 (UTC)

On 5/25/23 15:00, Eric Blake wrote:
> The existing nbd_block_status() callback is permanently stuck with an
> array of uint32_t pairs (len/2 extents), which is both constrained on

(

so the terminology is:

- we have "len" uint32_t elements in the array,

- one extent is one uint32_t pair,

- hence we have len/2 extents in the array

)

> maximum extent size (no larger than 4G) and on the status flags (must
> fit in 32 bits).  While the "base:allocation" metacontext will never
> exceed 32 bits, it is not hard to envision other extension
> metacontexts where a 64-bit status would be useful (for example, Zoned
> Block Devices expressing a 64-bit offset[1]).  Exposing 64-bit extents
> will require a new API; we now have the decision of whether to copy
> the existing API practice of returning a bare array containing len/2
> extent pairs,

The term "extent pairs" is inconsistent with the above terminology.

(1) We should say:

- "len/2 extents", or
- "len/2 uint64_t pairs".

> or with a saner idea

(2) s/or with/or go with/ ?

> of an array of structs with len
> extents.

This sounds OK; if the element type of the array is a struct, then one
struct describes one extent, and then the "len" elements of the array
describe "len" extents.

> Returning an array of structs is actually easier to map to
> various language bindings, particularly since we know the length field
> will generally fit in 63-bits (fallout from the fact that NBD exports
> are effectively capped in size by signed off_t), but where the status
> field must represent a full 64 bits (assuming that the user wants to
> connect to a metadata extension that utilizes 64 bits, rather than
> existing metadata contexts that only expose 32 bits).

This is a good argument, but I needed to chew on the "but" conjunction
for a good while until I understood the point. The "but" seemed out of
place at first; only later did I realize it was actually the core of the
argument ("easier to map").

The point is that for each extent, we have two properties that are same
in size but that differ in meaning (hence in type), and *therefore* a
struct is better than two adjacent, raw uint64_t elements. We're going
to have two uint64_t fields, but conceptually, that's one off_t field
(just serialized as a uint64_t) and a genuine uint64_t field, for
status.

(3) Can you append a sentence, "That is, conceptually, the fields have
different types, so a structure is best to express them"? Or something
similar?

>
> This patch introduces the struct we plan to use in the new API, along
> with language bindings.  The bindings for Python and OCaml were
> relatively straightforward; the Golang bindings took a bit more effort
> for me to write.  Temporary unused attributes are needed to keep the
> compiler happy until a later patch exposes a new API using the new
> callback type.

(4) Can you say "We need to insert '__attribute__ ((unused))' a number
of times, temporarily, to keep the compiler happy..."?

"Unused attributes" sounds as if we needed some attributes that were not
used. Confusing to me. What we need instead is to mark some variables or
functions with an attribute that says those vars/funcs are unused.

>
> Note that 'struct nbd_block_descriptor_ext' in lib/nbd-protocol.h is
> exactly the same as what we want to use in C.  But it is easier to
> stick a new public type in <libnbd.h> than to figure out how to expose
> just part of a header we only want to use internally.

Could be OK or fishy; I should be able to tell later :)

>
> [1] https://zonedstorage.io/docs/linux/zbd-api
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  generator/API.mli   |  1 +
>  generator/API.ml    | 12 +++++++++++-
>  generator/C.ml      | 24 +++++++++++++++++++++---
>  generator/GoLang.ml | 24 ++++++++++++++++++++++++
>  generator/OCaml.ml  | 24 +++++++++++++++++++++---
>  generator/Python.ml | 21 ++++++++++++++++++++-
>  ocaml/helpers.c     | 20 ++++++++++++++++++++
>  ocaml/nbd-c.h       |  1 +
>  golang/handle.go    |  6 ++++++
>  9 files changed, 125 insertions(+), 8 deletions(-)
>
> diff --git a/generator/API.mli b/generator/API.mli
> index c5bba8c2..96626c9b 100644
> --- a/generator/API.mli
> +++ b/generator/API.mli
> @@ -52,6 +52,7 @@ and
>  | BytesPersistOut of string * string
>  | Closure of closure       (** function pointer + void *opaque *)
>  | Enum of string * enum    (** enum/union type, int in C *)
> +| Extent64 of string       (** extent descriptor, struct nbd_extent in C *)
>  | Fd of string             (** file descriptor *)
>  | Flags of string * flags  (** flags, uint32_t in C *)
>  | Int of string            (** small int *)
> diff --git a/generator/API.ml b/generator/API.ml
> index 02c1260d..1da1ec53 100644
> --- a/generator/API.ml
> +++ b/generator/API.ml
> @@ -42,6 +42,7 @@
>  | BytesPersistOut of string * string
>  | Closure of closure
>  | Enum of string * enum
> +| Extent64 of string
>  | Fd of string
>  | Flags of string * flags
>  | Int of string
> @@ -157,6 +158,14 @@ let extent_closure =
>                              "nr_entries");
>               CBMutable (Int "error") ]
>  }
> +let extent64_closure = {
> +  cbname = "extent64";
> +  cbargs = [ CBString "metacontext";
> +             CBUInt64 "offset";
> +             CBArrayAndLen (Extent64 "entries",
> +                            "nr_entries");
> +             CBMutable (Int "error") ]
> +}
>  let list_closure = {
>    cbname = "list";
>    cbargs = [ CBString "name"; CBString "description" ]
> @@ -166,7 +175,8 @@ let context_closure =
>    cbargs = [ CBString "name" ]
>  }
>  let all_closures = [ chunk_closure; completion_closure;
> -                     debug_closure; extent_closure; list_closure;
> +                     debug_closure; extent_closure; extent64_closure;
> +                     list_closure;
>                       context_closure ]
>
>  (* Enums. *)

OK.

> diff --git a/generator/C.ml b/generator/C.ml
> index f772117c..d8472153 100644
> --- a/generator/C.ml
> +++ b/generator/C.ml
> @@ -94,6 +94,7 @@ let
>    | Closure { cbname } ->
>       [ sprintf "%s_callback" cbname; sprintf "%s_user_data" cbname ]
>    | Enum (n, _) -> [n]
> +  | Extent64 n -> [n]
>    | Fd n -> [n]
>    | Flags (n, _) -> [n]
>    | Int n -> [n]

This extends "name_of_arg".

> @@ -129,7 +130,7 @@ let
>    (* list of strings should be marked as non-null *)
>    | StringList n -> [ true ]
>    (* numeric and other non-pointer types are not able to be null *)
> -  | Bool _ | Closure _ | Enum _ | Fd _ | Flags _
> +  | Bool _ | Closure _ | Enum _ | Extent64 _ | Fd _ | Flags _
>    | Int _ | Int64 _ | SizeT _
>    | UInt _ | UInt32 _ | UInt64 _ | UIntPtr _ -> [ false ]
>

This extends "arg_attr_nonnull".

> @@ -191,6 +192,9 @@ and
>        | Enum (n, _) ->
>           if types then pr "int ";
>           pr "%s" n
> +      | Extent64 n ->
> +         if types then pr "nbd_extent ";
> +         pr "%s" n
>        | Flags (n, _) ->
>           if types then pr "uint32_t ";
>           pr "%s" n

This extends "print_arg_list".

> @@ -305,6 +309,11 @@ and
>           pr "%s, " n;
>           if types then pr "size_t ";
>           pr "%s" len
> +      | CBArrayAndLen (Extent64 n, len) ->
> +         if types then pr "nbd_extent *";
> +         pr "%s, " n;
> +         if types then pr "size_t ";
> +         pr "%s" len
>        | CBArrayAndLen _ -> assert false
>        | CBBytesIn (n, len) ->
>           if types then pr "const void *";

This extends "print_cbarg_list".

> @@ -477,6 +486,13 @@ let
>    pr "extern int nbd_get_errno (void);\n";
>    pr "#define LIBNBD_HAVE_NBD_GET_ERRNO 1\n";
>    pr "\n";
> +  pr "/* This is used in the callback for nbd_block_status_64.\n";

Pointing a bit into the future, but fine / unavoidable.

> +  pr " */\n";
> +  pr "typedef struct {\n";
> +  pr "  uint64_t length;\n";
> +  pr "  uint64_t flags;\n";
> +  pr "} nbd_extent;\n";
> +  pr "\n";
>    print_closure_structs ();
>    List.iter (
>      fun (name, { args; optargs; ret }) ->

The "nbd_" prefix for the new type seems consistent with existent
practice (e.g. "nbd_handle").

The placement of the new typedef is good as well, IMO; looking at the
generated library header, this typedef appears just before the callback
structures. Also in the generator's source code / context above, we can
see the call to "print_closure_structs" just after the insertion. That's
where our new "extent64_closure" is going to be handled too.

The question is how we're going to translate "nbd_block_descriptor_ext"
to this new structure, in *C* code. If we populate the members
individually, together with big-endian-to-host-endian conversion, that
should be OK. I figure that belongs in a later patch though.

> @@ -740,7 +756,7 @@ let
>           pr "    char *%s_printable =\n" n;
>           pr "        nbd_internal_printable_string_list (%s);\n" n
>        | BytesOut _ | BytesPersistOut _
> -      | Bool _ | Closure _ | Enum _ | Flags _ | Fd _ | Int _
> +      | Bool _ | Closure _ | Enum _ | Extent64 _ | Flags _ | Fd _ | Int _
>        | Int64 _ | SizeT _
>        | SockAddrAndLen _ | UInt _ | UInt32 _ | UInt64 _ | UIntPtr _ -> ()
>      ) args;

This extends "print_trace_enter" (near the top).

> @@ -766,6 +782,7 @@ let
>             pr " %s=\\\"%%s\\\" %s=%%zu" n count
>          | Closure { cbname } -> pr " %s=%%s" cbname
>          | Enum (n, _) -> pr " %s=%%d" n
> +        | Extent64 _ -> assert false (* only used in extent64_closure *)
>          | Flags (n, _) -> pr " %s=0x%%x" n
>          | Fd n | Int n -> pr " %s=%%d" n
>          | Int64 n -> pr " %s=%%\"PRIi64\"" n

And this extends "print_format_string" within "print_trace_enter".

Now here's why I've inserted all those "this extends ..." remarks:

I think your assertion is valid here, *but* it is inconsistent with the
extensions to:

- name_of_arg
- arg_attr_nonnull
- print_arg_list
- print_trace_enter

We only deal with Extent64 via the "penetrating pattern match"
CBArrayAndLen (Extent64 n, len), in "print_cbarg_list".

(5) Therefore, for consistency, *all* other Extent64 pattern matches
should assert that they are unreachable -- not only in
"print_format_string", but in those four functions too that I list
above.

Clearly, I could be missing some code paths leading to those functions /
patterns; I've not tested my proposition. The idea is that the narrowest
necessary subset of patterns should be handled. Even if it is easy to
"handle" a pattern with just (), it makes the wrong impression.


> @@ -804,6 +821,7 @@ let
>                pr "%s_printable ? %s_printable : \"\", %s" n n count
>             | Closure _ -> pr "\"<fun>\""
>             | Enum (n, _) -> pr "%s" n
> +           | Extent64 _ -> assert false (* only used in extent64_closure *)
>             | Flags (n, _) -> pr "%s" n
>             | Fd n | Int n | Int64 n | SizeT n -> pr "%s" n
>             | SockAddrAndLen (_, len) -> pr "(int) %s" len

This extends "print_args" within "print_trace_enter".

The assertion is OK.

> @@ -836,7 +854,7 @@ let
>        | StringList n ->
>           pr "    free (%s_printable);\n" n
>        | BytesOut _ | BytesPersistOut _
> -      | Bool _ | Closure _ | Enum _ | Flags _ | Fd _ | Int _
> +      | Bool _ | Closure _ | Enum _ | Extent64 _ | Flags _ | Fd _ | Int _
>        | Int64 _ | SizeT _
>        | SockAddrAndLen _ | UInt _ | UInt32 _ | UInt64 _ | UIntPtr _ -> ()
>      ) args;

(6) This is near the end of "print_trace_enter", and again, we should
assert here that "Extent64 _" will never match.

> diff --git a/generator/GoLang.ml b/generator/GoLang.ml
> index 4ab6b262..8922812b 100644
> --- a/generator/GoLang.ml
> +++ b/generator/GoLang.ml
> @@ -49,6 +49,7 @@ let
>    | BytesPersistOut (n, len) -> n
>    | Closure { cbname } -> cbname
>    | Enum (n, _) -> n
> +  | Extent64 n -> n
>    | Fd n -> n
>    | Flags (n, _) -> n
>    | Int n -> n
> @@ -71,6 +72,7 @@ let
>    | BytesPersistOut _ -> "AioBuffer"
>    | Closure { cbname } -> sprintf "%sCallback" (camel_case cbname)
>    | Enum (_, { enum_prefix }) -> camel_case enum_prefix
> +  | Extent64 _ -> assert false (* only used in extent64_closure *)
>    | Fd _ -> "int"
>    | Flags (_, { flag_prefix }) -> camel_case flag_prefix
>    | Int _ -> "int"
> @@ -262,6 +264,7 @@ let
>         pr "    c_%s.user_data = C.alloc_cbid(C.long(%s_cbid))\n" cbname cbname
>      | Enum (n, _) ->
>         pr "    c_%s := C.int (%s)\n" n n
> +    | Extent64 _ -> assert false (* only used in extent64_closure *)
>      | Fd n ->
>         pr "    c_%s := C.int (%s)\n" n n
>      | Flags (n, _) ->
> @@ -334,6 +337,7 @@ let
>      | BytesPersistOut (n, len) ->  pr ", c_%s, c_%s" n len
>      | Closure { cbname } ->  pr ", c_%s" cbname
>      | Enum (n, _) -> pr ", c_%s" n
> +    | Extent64 _ -> assert false (* only used in extent64_closure *)
>      | Fd n -> pr ", c_%s" n
>      | Flags (n, _) -> pr ", c_%s" n
>      | Int n -> pr ", c_%s" n

(7) I care pretty little for the Go binding, but again: the hunk above
that is the first for "GoLang.ml", we extend "go_name_of_arg", and I'd
argue we should insert an "assert false" there.

> @@ -524,6 +528,18 @@ let
>      copy(ret, s)
>      return ret
>  }
> +
> +func copy_extent_array (entries *C.nbd_extent, count C.size_t) []LibnbdExtent {
> +    unsafePtr := unsafe.Pointer(entries)
> +    arrayPtr := (*[1 << 20]C.nbd_extent)(unsafePtr)
> +    slice := arrayPtr[:count:count]
> +    ret := make([]LibnbdExtent, count)
> +    for i := 0; i < int (count); i++ {
> +      ret[i].Length = uint64 (slice[i].length)
> +      ret[i].Flags = uint64 (slice[i].flags)
> +    }
> +    return ret
> +}
>  ";
>
>    List.iter (

The pre-existent copy_uint32_array() function uses the hideous trick at
<https://github.com/golang/go/wiki/cgo#turning-c-arrays-into-go-slices>,
and needlessly so, IMO.

- The trick is (a) hideous because it requires us to use arbitrary sizes
such as "1<<30".

- The trick is (b) unnecessary because we don't intend to hang on to the
slice indefinitely. We only use it as a means to access the source
object. But at the noted URL, the trick is "being sold" with the pitch
"to create a Go slice backed by a C array (without copying the original
data)" -- and we copy the original data *anyway*! So it's better to use
pointer arithmetic IMO.

Regarding the new copy_extent_array(), my additional complaints are:

- whitespace usage before opening parens is inconsistent -- there is no
space after "make" and "Pointer".

- we cast "count" (a size_t in C) to a Go "int"; similarly the index
variable "i" has Go type "int".

(8) So how about this instead (should be split in two: the first part
should update copy_uint32_array() in a separate patch, and the second
part should be squashed into this patch):

> diff --git a/generator/GoLang.ml b/generator/GoLang.ml
> index 8922812b76a4..37b2240ef5bf 100644
> --- a/generator/GoLang.ml
> +++ b/generator/GoLang.ml
> @@ -521,22 +521,32 @@ let
>  /* Closures. */
>
>  func copy_uint32_array (entries *C.uint32_t, count C.size_t) []uint32 {
> -    ret := make([]uint32, int (count))
> -    // See https://github.com/golang/go/wiki/cgo#turning-c-arrays-into-go-slices
> -    // TODO: Use unsafe.Slice() when we require Go 1.17.
> -    s := (*[1<<30]uint32)(unsafe.Pointer(entries))[:count:count]
> -    copy(ret, s)
> +    ret := make ([]uint32, count)
> +    addr := uintptr (unsafe.Pointer (entries))
> +    var i uint64 = 0
> +    for i < uint64 (count) {
> +        ptr := (*C.uint32_t)(unsafe.Pointer (addr))
> +
> +        ret[i] = uint32 (*ptr)
> +
> +        addr += unsafe.Sizeof (*ptr)
> +        i++
> +    }
>      return ret
>  }
>
>  func copy_extent_array (entries *C.nbd_extent, count C.size_t) []LibnbdExtent {
> -    unsafePtr := unsafe.Pointer(entries)
> -    arrayPtr := (*[1 << 20]C.nbd_extent)(unsafePtr)
> -    slice := arrayPtr[:count:count]
> -    ret := make([]LibnbdExtent, count)
> -    for i := 0; i < int (count); i++ {
> -      ret[i].Length = uint64 (slice[i].length)
> -      ret[i].Flags = uint64 (slice[i].flags)
> +    ret := make ([]LibnbdExtent, count)
> +    addr := uintptr (unsafe.Pointer (entries))
> +    var i uint64 = 0
> +    for i < uint64 (count) {
> +        ptr := (*C.nbd_extent)(unsafe.Pointer (addr))
> +
> +        ret[i].Length = uint64 ((*ptr).length)
> +        ret[i].Flags = uint64 ((*ptr).flags)
> +
> +        addr += unsafe.Sizeof (*ptr)
> +        i++
>      }
>      return ret
>  }

(This passes make and make-check, when the tree is checked out at your
patch#7, and this is applied on top.)

Back to your patch:

On 5/25/23 15:00, Eric Blake wrote:
> @@ -537,6 +553,8 @@ let
>            match cbarg with
>            | CBArrayAndLen (UInt32 n, _) ->
>               pr "%s []uint32" n;
> +          | CBArrayAndLen (Extent64 n, _) ->
> +             pr "%s []LibnbdExtent" n;
>            | CBBytesIn (n, len) ->
>               pr "%s []byte" n;
>            | CBInt n ->
> @@ -563,6 +581,8 @@ let
>            match cbarg with
>            | CBArrayAndLen (UInt32 n, count) ->
>               pr "%s *C.uint32_t, %s C.size_t" n count
> +          | CBArrayAndLen (Extent64 n, count) ->
> +             pr "%s *C.nbd_extent, %s C.size_t" n count
>            | CBBytesIn (n, len) ->
>               pr "%s unsafe.Pointer, %s C.size_t" n len
>            | CBInt n ->
> @@ -605,6 +625,8 @@ let
>            match cbarg with
>            | CBArrayAndLen (UInt32 n, count) ->
>               pr "copy_uint32_array (%s, %s)" n count
> +          | CBArrayAndLen (Extent64 n, count) ->
> +             pr "copy_extent_array (%s, %s)" n count
>            | CBBytesIn (n, len) ->
>               pr "C.GoBytes (%s, C.int (%s))" n len
>            | CBInt n ->
> @@ -756,6 +778,8 @@ let
>             match cbarg with
>             | CBArrayAndLen (UInt32 n, count) ->
>                pr "uint32_t *%s, size_t %s" n count
> +           | CBArrayAndLen (Extent64 n, count) ->
> +              pr "nbd_extent *%s, size_t %s" n count
>             | CBBytesIn (n, len) ->
>                pr "void *%s, size_t %s" n len
>             | CBInt n ->

OK.

Quoting the rest of the patch out of order, so I can leave the OCaml
stuff for the end (this is a *terribly* large patch, when the contexts
are increased suitably for reviewing, so I really wish we could split it
up somehow):

> diff --git a/golang/handle.go b/golang/handle.go
> index 5fe4ed4f..0b126005 100644
> --- a/golang/handle.go
> +++ b/golang/handle.go
> @@ -58,6 +58,12 @@ func (h *Libnbd) String() string {
>  	return "&Libnbd{}"
>  }
>
> +/* Used for block status callback. */
> +type LibnbdExtent struct {
> +	Length uint64        // length of the extent
> +	Flags  uint64        // flags describing properties of the extent
> +}
> +
>  /* All functions (except Close) return ([result,] LibnbdError). */
>  type LibnbdError struct {
>  	Op     string        // operation which failed

OK.

> diff --git a/generator/Python.ml b/generator/Python.ml
> index c81878de..ccac5fed 100644
> --- a/generator/Python.ml
> +++ b/generator/Python.ml
> @@ -158,6 +158,7 @@ let
>  let print_python_closure_wrapper { cbname; cbargs } =
>    pr "/* Wrapper for %s callback. */\n" cbname;
>    pr "static int\n";
> +  pr "__attribute__ ((unused)) /* XXX temporary hack */\n";
>    pr "%s_wrapper " cbname;
>    C.print_cbarg_list ~wrap:true cbargs;
>    pr "\n";

OK, this is as announced in the commit message.

> @@ -170,6 +171,7 @@ let
>    List.iter (
>      function
>      | CBArrayAndLen (UInt32 n, _)
> +    | CBArrayAndLen (Extent64 n, _)
>      | CBBytesIn (n, _)
>      | CBMutable (Int n) ->
>         pr "  PyObject *py_%s = NULL;\n" n

OK, this is responsible for generating:

  PyObject *py_entries = NULL;


> @@ -187,6 +189,16 @@ let
>         pr "    if (!py_e_%s) { PyErr_PrintEx (0); goto out; }\n" n;
>         pr "    PyList_SET_ITEM (py_%s, i_%s, py_e_%s);\n" n n n;
>         pr "  }\n"
> +    | CBArrayAndLen (Extent64 n, len) ->
> +       pr "  py_%s = PyList_New (%s);\n" n len;
> +       pr "  size_t i_%s;\n" n;

(9) Under "CBArrayAndLen (UInt32 n, len)", we also check whether the New
call succeeds; I think it should not be omitted here either:

        pr "  if (!py_%s) { PyErr_PrintEx (0); goto out; }\n" n;

producing (in the preexistent "extent_wrapper" function):

  if (!py_entries) { PyErr_PrintEx (0); goto out; }

> +       pr "  for (i_%s = 0; i_%s < %s; ++i_%s) {\n" n n len n;
> +       pr "    PyObject *py_e_%s = Py_BuildValue (\"OO\",\n" n;
> +       pr "      PyLong_FromUnsignedLong (%s[i_%s].length),\n" n n;
> +       pr "      PyLong_FromUnsignedLong (%s[i_%s].flags));\n" n n;

We have two issues here:

(10) We should call PyLong_FromUnsignedLongLong(), not
PyLong_FromUnsignedLong(). On an ILP32 platform, the latter will not do
the right thing.

(11) PyLong_FromWhatever() returns a new reference, and so it can fail
due to memory exhaustion (minimally, I think). That means zero, one, or
two of our PyLong_FromUnsignedLongLong() calls can fail, and return
NULL.

We call Py_BuildValue() with an "OO" specification. The documentation
says:

> Pass a Python object untouched (except for its reference count, which
> is incremented by one). If the object passed in is a NULL pointer, it
> is assumed that this was caused because the call producing the
> argument found an error and set an exception. Therefore,
> Py_BuildValue() will return NULL but won’t raise an exception. If no
> exception has been raised yet, SystemError is set.

Now, I don't think PyLong_FromUnsignedLongLong() sets an exception when
it fails (and returns NULL), but that should be fine -- at least
Py_BuildValue() will raise SystemError.

The problem is that we have three possible ways to leak memory:

- If we pass two NULLs to "OO" (after both our
PyLong_FromUnsignedLongLong() calls fail), there's no leak.
Py_BuildValue() fails in response too, and nothing is leaked.

- If we pass exactly one NULL to "OO" (after one
PyLong_FromUnsignedLongLong() succeeds, but the other fails), then
Py_BuildValue() fails again (as expected), but we leak the PyLongObject
that we *did* successfully create.

- If we pass two non-NULLs to "OO" (after both
PyLong_FromUnsignedLongLong() succeed), and Py_BuildValue() fails
because *it* cannot allocate further memory, then we leak *both*
PyLongObjects.

- If we pass two non-NULLs to "OO" (after both
PyLong_FromUnsignedLongLong() succeed), and Py_BuildValue() *succeds*,
then we leak both PyLongObjects again: PyLong_FromUnsignedLongLong()
returns a new reference, but when Py_BuildValue() succeeds, it adds a
*new* reference (it does not only take ownership). The actual leak will
happen later, when the object just constructed with Py_BuildValue() is
torn down.

So, we should implement this in a much more "staged" way. Shown as a
diff on top of the code generated by your patch, covering points (9)
through (11) (even (12) below):

> --- python/methods.c.orig       2023-06-07 13:29:01.947636166 +0200
> +++ python/methods.c    2023-06-07 13:44:23.845892043 +0200
> @@ -286,15 +286,24 @@ extent64_wrapper (void *user_data, const
>    PyObject *py_args, *py_ret;
>    PyObject *py_entries = NULL;
>    PyObject *py_error = NULL;
> +  PyObject *py_e_length = NULL;
> +  PyObject *py_e_flags = NULL;
>
>    py_entries = PyList_New (nr_entries);
> +  if (!py_entries) { PyErr_PrintEx (0); goto out; }
>    size_t i_entries;
>    for (i_entries = 0; i_entries < nr_entries; ++i_entries) {
> -    PyObject *py_e_entries = Py_BuildValue ("OO",
> -      PyLong_FromUnsignedLong (entries[i_entries].length),
> -      PyLong_FromUnsignedLong (entries[i_entries].flags));
> +    PyObject *py_e_entries;
> +
> +    py_e_length = PyLong_FromUnsignedLongLong (entries[i_entries].length);
> +    py_e_flags = PyLong_FromUnsignedLongLong (entries[i_entries].flags);
> +    py_e_entries = Py_BuildValue ("OO", py_e_length, py_e_flags);
>      if (!py_e_entries) { PyErr_PrintEx (0); goto out; }
>      PyList_SET_ITEM (py_entries, i_entries, py_e_entries);
> +    Py_XDECREF (py_e_flags);
> +    Py_XDECREF (py_e_length);
> +    py_e_flags = NULL;
> +    py_e_length = NULL;
>    }
>    py_error = nbd_internal_py_wrap_errptr (*error);
>    if (!py_error) { PyErr_PrintEx (0); goto out; }
> @@ -325,6 +334,8 @@ extent64_wrapper (void *user_data, const
>    };
>
>   out:
> +  Py_XDECREF (py_e_flags);
> +  Py_XDECREF (py_e_length);
>    Py_XDECREF (py_entries);
>    if (py_error) {
>      PyObject *py_error_ret = PyObject_GetAttrString (py_error, "value");

In this variant, if at least one PyLong_FromUnsignedLongLong() call
fails, then Py_BuildValue() catches that, fails itself, and at the "out"
label, we release precisely those PyLongObjects that we managed to
construct (zero or one objects).

If both PyLongObjects get allocated, but Py_BuildValue() fails, then at
the "out" label, we release both PyLongObjects.

If even the Py_BuildValue() call succeeds, then we reach
PyList_SET_ITEM(). PyList_SET_ITEM() "steals" a reference (i.e., takes
ownership of one reference), it does not add one. Therefore the just
constructed "py_e_entries" object is now owned by the "py_entries" list
-- and we want the new "py_e_entries" entry in that list too to own our
PyLongObjects. Therefore, we release our temporary references to the
PyLongObjects (see the xdecref's in the loop body). We also NULL out the
variables, reflecting the ownership transfer. This is generally good
practice, but it even matters, for example, when this is the last
iteration of the loop, and the subsequent nbd_internal_py_wrap_errptr()
call fails. Then we jump to the "out" label, and at that point, the
xdecref's *there* must be no-ops. The PyLongObjects will be released via
"py_entries". (In theory we could NULL out the variables right after the
loop body, rather than at the end of the loop body, given that the top
of the loop body immediately overwrites both variables -- but as
written, the code is more understandable.)

The xdecref's and the NULL'ing happen in reverse, relative to order of
construction (i.e., the inverse order is intentional).

Back to your patch:

On 5/25/23 15:00, Eric Blake wrote:
> +       pr "    if (!py_e_%s) { PyErr_PrintEx (0); goto out; }\n" n;
> +       pr "    PyList_SET_ITEM (py_%s, i_%s, py_e_%s);\n" n n n;
> +       pr "  }\n"
>      | CBBytesIn (n, len) ->
>         pr "  py_%s = nbd_internal_py_get_subview (data->view, %s, %s);\n" n n len;
>         pr "  if (!py_%s) { PyErr_PrintEx (0); goto out; }\n" n
> @@ -206,6 +218,7 @@ let
>      List.map (
>        function
>        | CBArrayAndLen (UInt32 n, _) -> "O", sprintf "py_%s" n
> +      | CBArrayAndLen (Extent64 n, _) -> "O", sprintf "py_%s" n
>        | CBBytesIn (n, _) -> "O", sprintf "py_%s" n
>        | CBInt n -> "i", n
>        | CBInt64 n -> "L", n

Right, this corresponds to "py_entries" being a list object.

> @@ -254,7 +267,8 @@ let
>    pr " out:\n";
>    List.iter (
>      function
> -    | CBArrayAndLen (UInt32 n, _) ->
> +    | CBArrayAndLen (UInt32 n, _)
> +    | CBArrayAndLen (Extent64 n, _) ->
>         pr "  Py_XDECREF (py_%s);\n" n
>      | CBBytesIn (n, _) ->
>         pr "  Py_XDECREF (py_%s);\n" n

(12) We do need this

  Py_XDECREF (py_entries);

we just need the

  Py_XDECREF (py_e_flags);
  Py_XDECREF (py_e_length);

calls before it, too, so I think ultimately you'll want to handle this
pattern separately.

> @@ -307,6 +321,7 @@ let
>             pr ".callback = %s_wrapper, .free = free_user_data" cbname);
>         pr " };\n"
>      | Enum (n, _) -> pr "  int %s;\n" n
> +    | Extent64 _ -> assert false (* only used in extent64_closure *)
>      | Flags (n, _) ->
>         pr "  uint32_t %s_u32;\n" n;
>         pr "  unsigned int %s; /* really uint32_t */\n" n
> @@ -363,6 +378,7 @@ let
>           "O", sprintf "&%s" n, sprintf "py_%s->buf, py_%s->len" n n
>        | Closure { cbname } -> "O", sprintf "&py_%s_fn" cbname, cbname
>        | Enum (n, _) -> "i", sprintf "&%s" n, n
> +      | Extent64 _ -> assert false (* only used in extent64_closure *)
>        | Flags (n, _) -> "I", sprintf "&%s" n, sprintf "%s_u32" n
>        | Fd n | Int n -> "i", sprintf "&%s" n, n
>        | Int64 n -> "L", sprintf "&%s" n, sprintf "%s_i64" n

Yes, these are an "easy sell".

> @@ -454,6 +470,7 @@ let
>           pr "  if (!chunk_user_data->view) goto out;\n"
>         )
>      | Enum _ -> ()
> +    | Extent64 _ -> ()
>      | Flags (n, _) -> pr "  %s_u32 = %s;\n" n n
>      | Fd _ | Int _ -> ()
>      | Int64 n -> pr "  %s_i64 = %s;\n" n n
> @@ -552,6 +569,7 @@ let
>      | Closure { cbname } ->
>         pr "  free_user_data (%s_user_data);\n" cbname
>      | Enum _ -> ()
> +    | Extent64 _ -> ()
>      | Flags _ -> ()
>      | Fd _ | Int _ -> ()
>      | Int64 _ -> ()

(13) However I would turn these into assertions of "false", as well.
They too are in "print_python_binding".

> @@ -881,6 +899,7 @@ let
>            | BytesPersistOut (n, _) -> n, None
>            | Closure { cbname } -> cbname, None
>            | Enum (n, _) -> n, None
> +          | Extent64 _ -> assert false (* only used in extent64_closure *)
>            | Flags (n, _) -> n, None
>            | Fd n | Int n -> n, None
>            | Int64 n -> n, None

OK.

> diff --git a/ocaml/nbd-c.h b/ocaml/nbd-c.h
> index e3abb912..adcdd15a 100644
> --- a/ocaml/nbd-c.h
> +++ b/ocaml/nbd-c.h
> @@ -62,6 +62,7 @@ extern void nbd_internal_ocaml_raise_closed (const char *func) Noreturn;
>
>  extern const char **nbd_internal_ocaml_string_list (value);
>  extern value nbd_internal_ocaml_alloc_i64_from_u32_array (uint32_t *, size_t);
> +extern value nbd_internal_ocaml_alloc_extent64_array (nbd_extent *, size_t);
>  extern void nbd_internal_unix_sockaddr_to_sa (value, struct sockaddr_storage *,
>                                                socklen_t *);
>  extern void nbd_internal_ocaml_exception_in_wrapper (const char *, value);

OK.

> diff --git a/generator/OCaml.ml b/generator/OCaml.ml
> index edb81f25..ea3b044a 100644
> --- a/generator/OCaml.ml
> +++ b/generator/OCaml.ml
> @@ -44,6 +44,7 @@ and
>    | Closure { cbargs } ->
>       sprintf "(%s)" (ocaml_closuredecl_to_string cbargs)
>    | Enum (_, { enum_prefix }) -> sprintf "%s.t" enum_prefix
> +  | Extent64 _ -> "extent"
>    | Fd _ -> "Unix.file_descr"
>    | Flags (_, { flag_prefix }) -> sprintf "%s.t list" flag_prefix
>    | Int _ -> "int"
> @@ -102,6 +103,7 @@ let
>    | BytesPersistOut (n, len) -> n
>    | Closure { cbname } -> cbname
>    | Enum (n, _) -> n
> +  | Extent64 n -> n
>    | Fd n -> n
>    | Flags (n, _) -> n
>    | Int n -> n

(14) Could we use "assert false" with these too?

> @@ -147,6 +149,9 @@ let
>
>  type cookie = int64
>
> +type extent = int64 * int64
> +(** Length and flags of an extent in block_status_64 callback. *)
> +
>  ";
>
>    List.iter (

(15) Can we add a note here that negative values are not permitted? (See
my further comments below.)

> @@ -268,6 +273,7 @@ let
>  exception Error of string * Unix.error option
>  exception Closed of string
>  type cookie = int64
> +type extent = int64 * int64
>
>  (* Give the exceptions names so that they can be raised from the C code. *)
>  let () =
> @@ -498,7 +504,8 @@ let
>    let argnames =
>      List.map (
>        function
> -      | CBArrayAndLen (UInt32 n, _) | CBBytesIn (n, _)
> +      | CBArrayAndLen (UInt32 n, _) | CBArrayAndLen (Extent64 n, _)
> +      | CBBytesIn (n, _)
>        | CBInt n | CBInt64 n
>        | CBMutable (Int n) | CBString n | CBUInt n | CBUInt64 n ->
>           n ^ "v"

This is inside "print_ocaml_closure_wrapper"; OK.

(16) You can contract the new pattern as follows:

      | CBArrayAndLen ((UInt32 n | Extent64 n), _)

> @@ -531,6 +538,14 @@ let
>         pr "%s  %s,\n" indent n;
>         pr "%s  %s\n" indent count;
>         pr "%s);\n" indent
> +    | CBArrayAndLen (Extent64 n, count) ->
> +       pr "  %sv = " n;
> +       let fncol = output_column () in
> +       let indent = spaces fncol in
> +       pr "nbd_internal_ocaml_alloc_extent64_array (\n";
> +       pr "%s  %s,\n" indent n;
> +       pr "%s  %s\n" indent count;
> +       pr "%s);\n" indent
>      | CBBytesIn (n, len) ->
>         pr "  %sv = caml_alloc_initialized_string (%s, %s);\n" n len n
>      | CBInt n | CBUInt n ->

Seems OK superficially; matches the 'CBArrayAndLen (UInt32 n, count)'
case, with only the helper function differing.

> @@ -554,7 +569,7 @@ let
>
>    List.iter (
>      function
> -    | CBArrayAndLen (UInt32 _, _)
> +    | CBArrayAndLen (_, _)
>      | CBBytesIn _
>      | CBInt _
>      | CBInt64 _
> @@ -563,7 +578,7 @@ let
>      | CBUInt64 _ -> ()
>      | CBMutable (Int n) ->
>         pr "  *%s = Int_val (Field (%sv, 0));\n" n n
> -    | CBArrayAndLen _ | CBMutable _ -> assert false
> +    | CBMutable _ -> assert false
>    ) cbargs;
>
>    pr "  if (Is_exception_result (rv)) {\n";

(17) We're still inside "print_ocaml_closure_wrapper", so I think the
patterns here should follow the patterns seen in the "argnames"
definition:

  | CBArrayAndLen (UInt32 n, _) | CBArrayAndLen (Extent64 n, _)

or even better (again)

  | CBArrayAndLen ((UInt32 _ | Extent64 _), _)

IOW I think "CBArrayAndLen (_, _)" is too generic / inconsistent with
previously added code. We should handle the Extent64 constructor, and
not touch the "CBArrayAndLen _" fallback.

> @@ -578,6 +593,7 @@ let
>    pr "}\n";
>    pr "\n";
>    pr "static int\n";
> +  pr "__attribute__ ((unused)) /* XXX temporary hack */\n";
>    pr "%s_wrapper " cbname;
>    C.print_cbarg_list ~wrap:true cbargs;
>    pr "\n";

OK, announced in the commit message.

> @@ -695,6 +711,7 @@ let
>         pr "  %s_callback.free = free_user_data;\n" cbname
>      | Enum (n, { enum_prefix }) ->
>         pr "  int %s = %s_val (%sv);\n" n enum_prefix n
> +    | Extent64 _ -> assert false (* only used in extent64_closure *)
>      | Fd n ->
>         pr "  /* OCaml Unix.file_descr is just an int, at least on Unix. */\n";
>         pr "  int %s = Int_val (%sv);\n" n n

OK, this is in "print_ocaml_binding".

> @@ -780,6 +797,7 @@ let
>      | BytesPersistOut _
>      | Closure _
>      | Enum _
> +    | Extent64 _
>      | Fd _
>      | Flags _
>      | Int _

This is still in "print_ocaml_binding", under comment "Any parameters
which need to be freed".

(18) For consistency I'd suggest "assert false" here as well.

> diff --git a/ocaml/helpers.c b/ocaml/helpers.c
> index 3361a696..09666daf 100644
> --- a/ocaml/helpers.c
> +++ b/ocaml/helpers.c
> @@ -133,6 +133,26 @@ nbd_internal_ocaml_alloc_i64_from_u32_array (uint32_t *a, size_t len)
>    CAMLreturn (rv);
>  }
>
> +value
> +nbd_internal_ocaml_alloc_extent64_array (nbd_extent *a, size_t len)
> +{
> +  CAMLparam0 ();
> +  CAMLlocal3 (s, v, rv);
> +  size_t i;
> +
> +  rv = caml_alloc (len, 0);
> +  for (i = 0; i < len; ++i) {
> +    s = caml_alloc (2, 0);
> +    v = caml_copy_int64 (a[i].length);
> +    Store_field (s, 0, v);
> +    v = caml_copy_int64 (a[i].flags);
> +    Store_field (s, 1, v);
> +    Store_field (rv, i, s);
> +  }
> +
> +  CAMLreturn (rv);
> +}
> +
>  /* Convert a Unix.sockaddr to a C struct sockaddr. */
>  void
>  nbd_internal_unix_sockaddr_to_sa (value sockaddrv,

(19) I'd suggest the following addition:

> diff --git a/ocaml/helpers.c b/ocaml/helpers.c
> index 09666dafa7d1..db652943141d 100644
> --- a/ocaml/helpers.c
> +++ b/ocaml/helpers.c
> @@ -25,6 +25,7 @@
>  #include <string.h>
>  #include <sys/socket.h>
>  #include <assert.h>
> +#include <inttypes.h>
>
>  #include <caml/alloc.h>
>  #include <caml/callback.h>
> @@ -140,6 +141,16 @@ nbd_internal_ocaml_alloc_extent64_array (nbd_extent *a, size_t len)
>    CAMLlocal3 (s, v, rv);
>    size_t i;
>
> +  for (i = 0; i < len; ++i)
> +    if (a[i].length > INT64_MAX || a[i].flags > INT64_MAX) {
> +      char errmsg[256];
> +
> +      snprintf (errmsg, sizeof errmsg,
> +                "%s: extent[%zu] = { .length = %"PRIu64", .flags = %"PRIu64"}",
> +                __func__, i, a[i].length, a[i].flags);
> +      caml_failwith (errmsg);
> +    }
> +
>    rv = caml_alloc (len, 0);
>    for (i = 0; i < len; ++i) {
>      s = caml_alloc (2, 0);

*However*, considering the nbd_internal_ocaml_alloc_extent64_array()
call site, in the generated extent64_wrapper_locked() function
[ocaml/nbd-c.c]:

> /* Wrapper for extent64 callback. */
> static int
> extent64_wrapper_locked (void *user_data, const char *metacontext,
>                          uint64_t offset, nbd_extent *entries,
>                          size_t nr_entries, int *error)
> {
>   CAMLparam0 ();
>   CAMLlocal4 (metacontextv, offsetv, entriesv, errorv);
>   CAMLlocal2 (exn, rv);
>   const struct user_data *data = user_data;
>   int r;
>   value args[4];
>
>   metacontextv = caml_copy_string (metacontext);
>   offsetv = caml_copy_int64 (offset);
>   entriesv = nbd_internal_ocaml_alloc_extent64_array (
>                entries,
>                nr_entries
>              );
>   errorv = caml_alloc_tuple (1);
>   Store_field (errorv, 0, Val_int (*error));
>   args[0] = metacontextv;
>   args[1] = offsetv;
>   args[2] = entriesv;
>   args[3] = errorv;
>   rv = caml_callbackN_exn (data->fnv, 4, args);
>   *error = Int_val (Field (errorv, 0));
>   if (Is_exception_result (rv)) {
>     nbd_internal_ocaml_exception_in_wrapper ("extent64", rv);
>     CAMLreturnT (int, -1);
>   }
>
>   r = Int_val (rv);
>   assert (r >= 0);
>   CAMLreturnT (int, r);
> }

I'm not sure if raising an OCaml exception like this, in an *inner* C
function, is appropriate. caml_failwith() may only be suitable for C
functions *directly* called by the OCaml runtime.

If that's the case, then we should propagate the error from
nbd_internal_ocaml_alloc_extent64_array() differently. We might have to
change the signature of nbd_internal_ocaml_alloc_extent64_array(), and
then the generated call site (i.e., extent64_wrapper_locked()) must take
a potential failure into account.

This is really hard to reason about, as the only "prior art", namely
extent_wrapper_locked() ->
nbd_internal_ocaml_alloc_i64_from_u32_array(), does not face such a
conundrum. There we took the easy way: we convert from uint32_t to
OCaml's int64, which cannot overflow.


Again, this is a huge patch; I've now spent almost a full workday on
reviewing it. I suggest splitting each language to its own patch; thus,
we'd get at least 5 patches (core generator changes + 4 languages). If
necessary to placate the OCaml compiler, I'd try introducing bare-bones
place-holder code at first in the generator for each language, in the
first ("core") patch, and then elaborate on each language in a separate
patch (replacing the placeholders with actual code).

Laszlo


