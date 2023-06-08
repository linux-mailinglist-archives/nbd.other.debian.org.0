Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A41E1727FBB
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 14:20:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6191D204C2; Thu,  8 Jun 2023 12:20:57 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 12:20:57 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0F4C0204AD
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 12:20:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.091 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4PeN-1wDTq11 for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 12:20:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id DD5BD204AA
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 12:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686226836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hIWH613KPUdpfiOnduxZd1RUr8beMiMS2ZTV0aaqrt8=;
	b=geNRY9YUoZHT+z0d0dIn3LAlCjM4GbCLqA04+FI8rJ5eYqLgwIyYd6ucmP8b3rJ0mkI2zV
	eMnlMM22N/hC9L/yTERedQcEd6XGXZtjKhaZHp7bXtXUbGoE2Z/Vku9ldSZjz7HCPIe6cO
	IA969s4Zqd0wqn4FCrsoQIz2wzcjxE4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-T--l5H9eNFaEidKP5E7gcg-1; Thu, 08 Jun 2023 08:20:35 -0400
X-MC-Unique: T--l5H9eNFaEidKP5E7gcg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67501280AA3A;
	Thu,  8 Jun 2023 12:20:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20CFD9E8B;
	Thu,  8 Jun 2023 12:20:35 +0000 (UTC)
Date: Thu, 8 Jun 2023 13:20:34 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, Eric Blake <eblake@redhat.com>,
	qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 03/22] protocol: Add definitions
 for extended headers
Message-ID: <20230608122034.GH7636@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-4-eblake@redhat.com>
 <2b98a2ca-62d5-c87b-2a37-1a49af89b4b4@redhat.com>
 <ZHYOgQAL3ELxr1S9@pc220518.home.grep.be>
 <7f186cd0-b42e-7a20-2946-39ffecd23383@redhat.com>
 <20230607100036.GD7773@redhat.com>
 <152208c4-b9af-efda-8dc2-2b00e31c4586@redhat.com>
MIME-Version: 1.0
In-Reply-To: <152208c4-b9af-efda-8dc2-2b00e31c4586@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JXBGqCy3msL.A.tFB.pecgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2545
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230608122034.GH7636@redhat.com
Resent-Date: Thu,  8 Jun 2023 12:20:57 +0000 (UTC)

On Thu, Jun 08, 2023 at 01:48:41PM +0200, Laszlo Ersek wrote:
> On 6/7/23 12:00, Richard W.M. Jones wrote:
> > On Tue, May 30, 2023 at 05:48:25PM +0200, Laszlo Ersek wrote:
> >> BTW I'm foreseeing a problem: if the extended block descriptor can
> >> provide an unsigned 64-bit length, we're going to have trouble exposing
> >> that in OCaml, because OCaml only has signed 64-bit integers. So that's
> >> going to reproduce the same issue, only for OCaml callers of the *new* API.
> >>
> >> I can see Eric's series includes patches like "ocaml: Add example for
> >> 64-bit extents" -- I've not looked at those yet; for now I'm just
> >> wondering what tricks we might need in the bindings generator. The
> >> method seen in the "middle patch" above won't work; we don't have a
> >> native OCaml "i128" type for example that we could use as an escape
> >> hatch, for representing C's uint64_t.
> > 
> > I think that's OK because disk sizes are already limited to
> > 2^63 - 1 by the kernel (and for qemu even less than that).
> > The OCaml bindings return a (signed) int64 for NBD.get_size.
> 
> Under patch#7 yesterday, I made a proposal for "armoring" at least one
> instance / direction of the uint64_t <-> int64 conversion. It raised an
> interesting problem: raising OCaml exceptions in such C functions that
> are *not* directly called by the OCaml runtime. Comments would be much
> appreciated in that subthread!

I can't seem to find that thread (but also gmail-- split the messages
randomly over the 3 different mailing lists because Google don't
understand how email works).  Do you have a link?

But the answer is you can raise an exception anywhere since it's
really just a longjmp.  The only issue is if you need stack-allocated
variables to be freed, which for OCaml values is handled by the
CAMLlocal* macros and for C variables you need to be careful about and
deal with yourself.

> (On a tangent: I've also noticed we use CAMLparam0() & friends in some
> of our functions that are *not* directly called by the OCaml runtime.
> They certainly run on the OCaml runtime's stack, but there's at least
> one intervening stack frame where the C-language function is provided by
> us. Now I know we must use CAMLparam0() in our *outermost* such
> function, but what about the further functions (inner C-language
> functions) that our outermost function calls in turn? I think the inner
> functions are at liberty not to use CAMLparam0() -- otherwise, our
> functions couldn't even call normal C library functions!)

These macros just set up a linked list of frames.  You don't need to
use them in every function, only ones which are using OCaml values.

The macros are fairly easy to understand by reading them:

https://github.com/ocaml/ocaml/blob/864f772e5338dcf6be2093d5cc3ed6f7fbce16b7/runtime/caml/memory.h#L270

When the GC runs it walks up the linked list of the current thread to
find roots.  The only tricky thing about it is making sure that at any
point where the GC could run, each slot contains a valid entry and not
some intermediate or uninitialized value, since this is precise (not
conservative) garbage collection.

This mechanism is only used by C code.  In OCaml code there's a bitmap
generated for each function showing which stack slots contain values
(versus ints, return addresses, other stuff).

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

