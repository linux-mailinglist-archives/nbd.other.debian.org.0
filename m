Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B4B760388
	for <lists+nbd@lfdr.de>; Tue, 25 Jul 2023 02:04:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1601720696; Tue, 25 Jul 2023 00:04:47 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul 25 00:04:47 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	DIGITS_LETTERS,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 618B720674
	for <lists-other-nbd@bendel.debian.org>; Tue, 25 Jul 2023 00:04:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.47 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, BAYES_00=-2, DIGITS_LETTERS=1,
	DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QVU5vrXz6z5X for <lists-other-nbd@bendel.debian.org>;
	Tue, 25 Jul 2023 00:04:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 33584 seconds by postgrey-1.36 at bendel; Tue, 25 Jul 2023 00:04:26 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id AFC9720614
	for <nbd@other.debian.org>; Tue, 25 Jul 2023 00:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690243461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sf0LP2Rwtq8sAc5XPAsDz8xeWtuhtv7ZFDgeLW2A/N4=;
	b=FUC8ppg9lAJ4Vi8676YsKRFvTvVbAz49tLTzCkHkFvqJIXNtIsbBqH/GEN3r3EFDbN8+GZ
	VptRJkiCvDGBlzD3MkAhdg0uRVtR8/1J+Y2rOJoQdZqQKRDDj/oEhDdrnmVD89fefLLpTn
	aqnDFGEMgq4RBbUJI/goPy2ecRfqYtY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-B-jovBMSMWekSOKPS7hebQ-1; Mon, 24 Jul 2023 20:04:17 -0400
X-MC-Unique: B-jovBMSMWekSOKPS7hebQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 543221C06913;
	Tue, 25 Jul 2023 00:04:17 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.93])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA2C2492C13;
	Tue, 25 Jul 2023 00:04:16 +0000 (UTC)
Date: Mon, 24 Jul 2023 19:04:15 -0500
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 07/22] generator: Add struct
 nbd_extent in prep for 64-bit extents
Message-ID: <i7alko4l4i4trjv5pxw37qxo6wgvj6ch4e4p3gmfwq3bffmbf2@igy7hjxnq6nq>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-8-eblake@redhat.com>
 <0e4ff751-88d6-837b-15a5-6f6c370a2f09@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0e4ff751-88d6-837b-15a5-6f6c370a2f09@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gzH1may0kMJ.A.mrG.eGxvkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2578
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/i7alko4l4i4trjv5pxw37qxo6wgvj6ch4e4p3gmfwq3bffmbf2@igy7hjxnq6nq
Resent-Date: Tue, 25 Jul 2023 00:04:47 +0000 (UTC)

On Wed, Jun 07, 2023 at 04:23:27PM +0200, Laszlo Ersek wrote:
> > +++ b/generator/GoLang.ml
> > @@ -524,6 +528,18 @@ let
> >      copy(ret, s)
> >      return ret
> >  }
> > +
> > +func copy_extent_array (entries *C.nbd_extent, count C.size_t) []LibnbdExtent {
> > +    unsafePtr := unsafe.Pointer(entries)
> > +    arrayPtr := (*[1 << 20]C.nbd_extent)(unsafePtr)
> > +    slice := arrayPtr[:count:count]
> > +    ret := make([]LibnbdExtent, count)
> > +    for i := 0; i < int (count); i++ {
> > +      ret[i].Length = uint64 (slice[i].length)
> > +      ret[i].Flags = uint64 (slice[i].flags)
> > +    }
> > +    return ret
> > +}
> >  ";
> >
> >    List.iter (
> 
> The pre-existent copy_uint32_array() function uses the hideous trick at
> <https://github.com/golang/go/wiki/cgo#turning-c-arrays-into-go-slices>,
> and needlessly so, IMO.
> 
> - The trick is (a) hideous because it requires us to use arbitrary sizes
> such as "1<<30".
> 
> - The trick is (b) unnecessary because we don't intend to hang on to the
> slice indefinitely. We only use it as a means to access the source
> object. But at the noted URL, the trick is "being sold" with the pitch
> "to create a Go slice backed by a C array (without copying the original
> data)" -- and we copy the original data *anyway*! So it's better to use
> pointer arithmetic IMO.
> 
> Regarding the new copy_extent_array(), my additional complaints are:
> 
> - whitespace usage before opening parens is inconsistent -- there is no
> space after "make" and "Pointer".
> 
> - we cast "count" (a size_t in C) to a Go "int"; similarly the index
> variable "i" has Go type "int".
> 
> (8) So how about this instead (should be split in two: the first part
> should update copy_uint32_array() in a separate patch, and the second
> part should be squashed into this patch):
> 
> > diff --git a/generator/GoLang.ml b/generator/GoLang.ml
> > index 8922812b76a4..37b2240ef5bf 100644
> > --- a/generator/GoLang.ml
> > +++ b/generator/GoLang.ml
> > @@ -521,22 +521,32 @@ let
> >  /* Closures. */
> >
> >  func copy_uint32_array (entries *C.uint32_t, count C.size_t) []uint32 {
> > -    ret := make([]uint32, int (count))
> > -    // See https://github.com/golang/go/wiki/cgo#turning-c-arrays-into-go-slices
> > -    // TODO: Use unsafe.Slice() when we require Go 1.17.
> > -    s := (*[1<<30]uint32)(unsafe.Pointer(entries))[:count:count]
> > -    copy(ret, s)
> > +    ret := make ([]uint32, count)
> > +    addr := uintptr (unsafe.Pointer (entries))
> > +    var i uint64 = 0
> > +    for i < uint64 (count) {
> > +        ptr := (*C.uint32_t)(unsafe.Pointer (addr))
> > +
> > +        ret[i] = uint32 (*ptr)
> > +
> > +        addr += unsafe.Sizeof (*ptr)
> > +        i++
> > +    }

Pointer arithmetic is straightforward, but not necessarily the best
use of hardware.  For all I know, the copy() routine is vectorized,
and therefore can achieve better performance by copying multiple bytes
at once using better hardware primitives.  So there may still be an
advantage to using the hideous hack for the sake of performance.  But
as I have not bothered to benchmark that claim, I'm happy to change
back to linear copying.

> >      return ret
> >  }
> >
> >  func copy_extent_array (entries *C.nbd_extent, count C.size_t) []LibnbdExtent {
> > -    unsafePtr := unsafe.Pointer(entries)
> > -    arrayPtr := (*[1 << 20]C.nbd_extent)(unsafePtr)
> > -    slice := arrayPtr[:count:count]
> > -    ret := make([]LibnbdExtent, count)
> > -    for i := 0; i < int (count); i++ {
> > -      ret[i].Length = uint64 (slice[i].length)
> > -      ret[i].Flags = uint64 (slice[i].flags)
> > +    ret := make ([]LibnbdExtent, count)
> > +    addr := uintptr (unsafe.Pointer (entries))
> > +    var i uint64 = 0
> > +    for i < uint64 (count) {
> > +        ptr := (*C.nbd_extent)(unsafe.Pointer (addr))
> > +
> > +        ret[i].Length = uint64 ((*ptr).length)
> > +        ret[i].Flags = uint64 ((*ptr).flags)
> > +
> > +        addr += unsafe.Sizeof (*ptr)
> > +        i++

That sentiment is further strengthened by the fact that neither my
original proposal nor your replacement can use copy() for the struct
purposes.  Even if copy() can speed up []uint32 copies, I'd rather let
the Go compiler worry about vectorizing the loop if we can't find an
obvious library function that already takes advantage of hardware
vectors.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

