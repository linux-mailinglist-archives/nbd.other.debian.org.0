Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 167797280E1
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 15:07:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D730D204A0; Thu,  8 Jun 2023 13:07:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 13:07:11 2023
Old-Return-Path: <rjones@redhat.com>
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
	by bendel.debian.org (Postfix) with ESMTP id BE86C20485
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 13:07:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.191 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IIbJP63wjjvT for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 13:06:56 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 6EA782047A
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 13:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686229611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FD9j1RfDiDulPHuLSog257x5ougmgEez8wcCjhvRHSY=;
	b=PiGnjD0mB0ccngTL+eBlgUEOyN/F5psVcoISkOjLv1uk7JjzmQm1UgPSYqm7ZsuAc09c6B
	2WSXRZYS65/jHN77/vEFLApJo7zSBkFRYOsCxVjFw8ZZt0JOogpvsgzsQgmsN1BN31SCjK
	ptEam07l+MvMc21ftJc7hLXfGreu9Lc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-ZvePkVn-P3CAK9dOFuI5Mw-1; Thu, 08 Jun 2023 09:06:50 -0400
X-MC-Unique: ZvePkVn-P3CAK9dOFuI5Mw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FAF785A5A8;
	Thu,  8 Jun 2023 13:06:50 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9B8FC154D1;
	Thu,  8 Jun 2023 13:06:49 +0000 (UTC)
Date: Thu, 8 Jun 2023 14:06:49 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com,
	qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 07/22] generator: Add struct
 nbd_extent in prep for 64-bit extents
Message-ID: <20230608130649.GU7773@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-8-eblake@redhat.com>
 <0e4ff751-88d6-837b-15a5-6f6c370a2f09@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0e4ff751-88d6-837b-15a5-6f6c370a2f09@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oFcRZhtKIDC.A.paH._JdgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2548
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230608130649.GU7773@redhat.com
Resent-Date: Thu,  8 Jun 2023 13:07:11 +0000 (UTC)

On Wed, Jun 07, 2023 at 04:23:27PM +0200, Laszlo Ersek wrote:
[...]
> > diff --git a/ocaml/helpers.c b/ocaml/helpers.c
> > index 3361a696..09666daf 100644
> > --- a/ocaml/helpers.c
> > +++ b/ocaml/helpers.c
> > @@ -133,6 +133,26 @@ nbd_internal_ocaml_alloc_i64_from_u32_array (uint32_t *a, size_t len)
> >    CAMLreturn (rv);
> >  }
> >
> > +value
> > +nbd_internal_ocaml_alloc_extent64_array (nbd_extent *a, size_t len)
> > +{
> > +  CAMLparam0 ();
> > +  CAMLlocal3 (s, v, rv);
> > +  size_t i;
> > +
> > +  rv = caml_alloc (len, 0);
> > +  for (i = 0; i < len; ++i) {
> > +    s = caml_alloc (2, 0);
> > +    v = caml_copy_int64 (a[i].length);
> > +    Store_field (s, 0, v);
> > +    v = caml_copy_int64 (a[i].flags);
> > +    Store_field (s, 1, v);
> > +    Store_field (rv, i, s);
> > +  }
> > +
> > +  CAMLreturn (rv);
> > +}
> > +
> >  /* Convert a Unix.sockaddr to a C struct sockaddr. */
> >  void
> >  nbd_internal_unix_sockaddr_to_sa (value sockaddrv,
> 
> (19) I'd suggest the following addition:
> 
> > diff --git a/ocaml/helpers.c b/ocaml/helpers.c
> > index 09666dafa7d1..db652943141d 100644
> > --- a/ocaml/helpers.c
> > +++ b/ocaml/helpers.c
> > @@ -25,6 +25,7 @@
> >  #include <string.h>
> >  #include <sys/socket.h>
> >  #include <assert.h>
> > +#include <inttypes.h>
> >
> >  #include <caml/alloc.h>
> >  #include <caml/callback.h>
> > @@ -140,6 +141,16 @@ nbd_internal_ocaml_alloc_extent64_array (nbd_extent *a, size_t len)
> >    CAMLlocal3 (s, v, rv);
> >    size_t i;
> >
> > +  for (i = 0; i < len; ++i)
> > +    if (a[i].length > INT64_MAX || a[i].flags > INT64_MAX) {
> > +      char errmsg[256];
> > +
> > +      snprintf (errmsg, sizeof errmsg,
> > +                "%s: extent[%zu] = { .length = %"PRIu64", .flags = %"PRIu64"}",
> > +                __func__, i, a[i].length, a[i].flags);
> > +      caml_failwith (errmsg);
> > +    }
> > +
> >    rv = caml_alloc (len, 0);
> >    for (i = 0; i < len; ++i) {
> >      s = caml_alloc (2, 0);
>
> *However*, considering the nbd_internal_ocaml_alloc_extent64_array()
> call site, in the generated extent64_wrapper_locked() function
> [ocaml/nbd-c.c]:
> 
> > /* Wrapper for extent64 callback. */
> > static int
> > extent64_wrapper_locked (void *user_data, const char *metacontext,
> >                          uint64_t offset, nbd_extent *entries,
> >                          size_t nr_entries, int *error)
> > {
> >   CAMLparam0 ();
> >   CAMLlocal4 (metacontextv, offsetv, entriesv, errorv);
> >   CAMLlocal2 (exn, rv);
> >   const struct user_data *data = user_data;
> >   int r;
> >   value args[4];
> >
> >   metacontextv = caml_copy_string (metacontext);
> >   offsetv = caml_copy_int64 (offset);
> >   entriesv = nbd_internal_ocaml_alloc_extent64_array (
> >                entries,
> >                nr_entries
> >              );
> >   errorv = caml_alloc_tuple (1);
> >   Store_field (errorv, 0, Val_int (*error));
> >   args[0] = metacontextv;
> >   args[1] = offsetv;
> >   args[2] = entriesv;
> >   args[3] = errorv;
> >   rv = caml_callbackN_exn (data->fnv, 4, args);
> >   *error = Int_val (Field (errorv, 0));
> >   if (Is_exception_result (rv)) {
> >     nbd_internal_ocaml_exception_in_wrapper ("extent64", rv);
> >     CAMLreturnT (int, -1);
> >   }
> >
> >   r = Int_val (rv);
> >   assert (r >= 0);
> >   CAMLreturnT (int, r);
> > }
> 
> I'm not sure if raising an OCaml exception like this, in an *inner* C
> function, is appropriate. caml_failwith() may only be suitable for C
> functions *directly* called by the OCaml runtime.

caml_failwith is just a longjmp.  The OCaml values on the stack are
cleaned up by following a chain of stack frames which are created by
the CAMLparam* macros.  These macros don't need to be used in every
function, although they should be used in functions which have OCaml
value parameters or value local variables (but there's no harm in
using them unnecessarily).  They can also be omitted for functions
which do not invoke the OCaml GC (don't allocate on the OCaml heap,
basically).

C local variables however will not be cleaned up, so if there are any
arrays that have to be freed then it gets a bit more complicated.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW

