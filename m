Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E10927280A0
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 14:54:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 87E59204A0; Thu,  8 Jun 2023 12:54:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 12:54:15 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MD5_SHA1_SUM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 023C7204B2
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 12:39:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.091 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rAp4M0LLeS9z for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 12:38:52 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id CCAEE204A0
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686227926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d7PgkG+49+R8VC4bFQAByVzT3Rv/UeM7bDPVi3Wy5Wo=;
	b=cHi3A5Qy9MhkzqcGBkW/9OZ7pE1/bX1cCiutL/2jEgNlLjKXw6VDKnnZc/r4VkzjtgaZ+1
	5ayPYCOG0/C9ycUQJZ2DbXNCJBuxzbKSU5UKSX8FmyDlEhRgxD7uRI9OgrsRvUSPy77IGm
	53ja2qf09io3SipEYCcqFLy5n7P0CtE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-y-D5eVw0MfKFAq88ov5dig-1; Thu, 08 Jun 2023 08:38:43 -0400
X-MC-Unique: y-D5eVw0MfKFAq88ov5dig-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D727185A78F;
	Thu,  8 Jun 2023 12:38:43 +0000 (UTC)
Received: from [10.39.193.64] (unknown [10.39.193.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9EC2492B0A;
	Thu,  8 Jun 2023 12:38:41 +0000 (UTC)
Message-ID: <4fa9d4eb-3102-e134-245e-bdf3ab0da58d@redhat.com>
Date: Thu, 8 Jun 2023 14:38:40 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 03/22] protocol: Add definitions
 for extended headers
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-4-eblake@redhat.com>
 <2b98a2ca-62d5-c87b-2a37-1a49af89b4b4@redhat.com>
 <ZHYOgQAL3ELxr1S9@pc220518.home.grep.be>
 <7f186cd0-b42e-7a20-2946-39ffecd23383@redhat.com>
 <20230607100036.GD7773@redhat.com>
 <152208c4-b9af-efda-8dc2-2b00e31c4586@redhat.com>
 <20230608122034.GH7636@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230608122034.GH7636@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mEsvXRWKsvB.A.Y7.39cgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2546
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4fa9d4eb-3102-e134-245e-bdf3ab0da58d@redhat.com
Resent-Date: Thu,  8 Jun 2023 12:54:15 +0000 (UTC)

On 6/8/23 14:20, Richard W.M. Jones wrote:
> On Thu, Jun 08, 2023 at 01:48:41PM +0200, Laszlo Ersek wrote:
>> On 6/7/23 12:00, Richard W.M. Jones wrote:
>>> On Tue, May 30, 2023 at 05:48:25PM +0200, Laszlo Ersek wrote:
>>>> BTW I'm foreseeing a problem: if the extended block descriptor can
>>>> provide an unsigned 64-bit length, we're going to have trouble exposing
>>>> that in OCaml, because OCaml only has signed 64-bit integers. So that's
>>>> going to reproduce the same issue, only for OCaml callers of the *new* API.
>>>>
>>>> I can see Eric's series includes patches like "ocaml: Add example for
>>>> 64-bit extents" -- I've not looked at those yet; for now I'm just
>>>> wondering what tricks we might need in the bindings generator. The
>>>> method seen in the "middle patch" above won't work; we don't have a
>>>> native OCaml "i128" type for example that we could use as an escape
>>>> hatch, for representing C's uint64_t.
>>>
>>> I think that's OK because disk sizes are already limited to
>>> 2^63 - 1 by the kernel (and for qemu even less than that).
>>> The OCaml bindings return a (signed) int64 for NBD.get_size.
>>
>> Under patch#7 yesterday, I made a proposal for "armoring" at least one
>> instance / direction of the uint64_t <-> int64 conversion. It raised an
>> interesting problem: raising OCaml exceptions in such C functions that
>> are *not* directly called by the OCaml runtime. Comments would be much
>> appreciated in that subthread!
> 
> I can't seem to find that thread (but also gmail-- split the messages
> randomly over the 3 different mailing lists because Google don't
> understand how email works).  Do you have a link?

It starts here (link to patch#7):

http://mid.mail-archive.com/20230525130108.757242-8-eblake@redhat.com

(The primary libguestfs archive works too, but mailman splits the
archives on month boundaries, and so the patch is still in the May
bucket, but my reply is in the June one:

https://listman.redhat.com/archives/libguestfs/2023-May/031613.html
https://listman.redhat.com/archives/libguestfs/2023-June/031736.html
)

The particular topic is at the very end of my message.

> But the answer is you can raise an exception anywhere since it's
> really just a longjmp.  The only issue is if you need stack-allocated
> variables to be freed, which for OCaml values is handled by the
> CAMLlocal* macros and for C variables you need to be careful about and
> deal with yourself.

Understood! Thanks!

So for example, in extent64_wrapper_locked(), if we exited the called
nbd_internal_ocaml_alloc_extent64_array() function with caml_failwith(),
the caml_copy_string() and caml_copy_int64() allocations, stored earlier
into "CAMLlocal"s "metacontextv" and "offsetv", would not be leaked?

> 
>> (On a tangent: I've also noticed we use CAMLparam0() & friends in some
>> of our functions that are *not* directly called by the OCaml runtime.
>> They certainly run on the OCaml runtime's stack, but there's at least
>> one intervening stack frame where the C-language function is provided by
>> us. Now I know we must use CAMLparam0() in our *outermost* such
>> function, but what about the further functions (inner C-language
>> functions) that our outermost function calls in turn? I think the inner
>> functions are at liberty not to use CAMLparam0() -- otherwise, our
>> functions couldn't even call normal C library functions!)
> 
> These macros just set up a linked list of frames.  You don't need to
> use them in every function, only ones which are using OCaml values.

Ah, understood.

> The macros are fairly easy to understand by reading them:
> 
> https://github.com/ocaml/ocaml/blob/864f772e5338dcf6be2093d5cc3ed6f7fbce16b7/runtime/caml/memory.h#L270
> 
> When the GC runs it walks up the linked list of the current thread to
> find roots.  The only tricky thing about it is making sure that at any
> point where the GC could run, each slot contains a valid entry and not
> some intermediate or uninitialized value, since this is precise (not
> conservative) garbage collection.

Right, <https://v2.ocaml.org/manual/intfc.html> too contains a related
warning:

  Rule 5  After a structured block (a block with tag less than
  No_scan_tag) is allocated with the low-level functions, all fields of
  this block must be filled with well-formed values before the next
  allocation operation. [...]

Thankfully it also says, "You can ignore those rules if you stick to the
simplified allocation function caml_alloc".

> 
> This mechanism is only used by C code.  In OCaml code there's a bitmap
> generated for each function showing which stack slots contain values
> (versus ints, return addresses, other stuff).

I'm slightly interested in learning the OCaml runtime details, but at
the same time I feel like not knowing them (and relying only on the
docs) might allow me to write more "portable" code...

Laszlo

