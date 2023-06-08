Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE84727F9C
	for <lists+nbd@lfdr.de>; Thu,  8 Jun 2023 14:06:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6EBF220460; Thu,  8 Jun 2023 12:06:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  8 12:06:12 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4E743204C3
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Jun 2023 11:48:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.091 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cYzyupDxuwt1 for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Jun 2023 11:48:52 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 0AA40204C2
	for <nbd@other.debian.org>; Thu,  8 Jun 2023 11:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686224927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y1PE0MAuWQesjCkIXXdhMhLYCcpDVFS70HAN79lfFzk=;
	b=K53G72f+Cv/d0qsUiDo/HybNop9zn7v/Wqz052YGFqG1aLorTPoplc2AigZ4DzL53d53ze
	idMUpVWF4jGXJNKQMqgJXAirEoppUgEzD/FmXNdOzM9U4BYfSNmUsVDqWAPhQpm9UqpCRs
	efmXHwEUHcA9wnSXrmwyqEGrgcmaFj4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-Hu0ZHEcmPziCW4pF5KskPQ-1; Thu, 08 Jun 2023 07:48:43 -0400
X-MC-Unique: Hu0ZHEcmPziCW4pF5KskPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70823185A78B;
	Thu,  8 Jun 2023 11:48:43 +0000 (UTC)
Received: from [10.39.193.64] (unknown [10.39.193.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A6C9140E956;
	Thu,  8 Jun 2023 11:48:42 +0000 (UTC)
Message-ID: <152208c4-b9af-efda-8dc2-2b00e31c4586@redhat.com>
Date: Thu, 8 Jun 2023 13:48:41 +0200
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
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230607100036.GD7773@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <paPC8zIKNSJ.A.TjG.0QcgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2544
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/152208c4-b9af-efda-8dc2-2b00e31c4586@redhat.com
Resent-Date: Thu,  8 Jun 2023 12:06:12 +0000 (UTC)

On 6/7/23 12:00, Richard W.M. Jones wrote:
> On Tue, May 30, 2023 at 05:48:25PM +0200, Laszlo Ersek wrote:
>> BTW I'm foreseeing a problem: if the extended block descriptor can
>> provide an unsigned 64-bit length, we're going to have trouble exposing
>> that in OCaml, because OCaml only has signed 64-bit integers. So that's
>> going to reproduce the same issue, only for OCaml callers of the *new* API.
>>
>> I can see Eric's series includes patches like "ocaml: Add example for
>> 64-bit extents" -- I've not looked at those yet; for now I'm just
>> wondering what tricks we might need in the bindings generator. The
>> method seen in the "middle patch" above won't work; we don't have a
>> native OCaml "i128" type for example that we could use as an escape
>> hatch, for representing C's uint64_t.
> 
> I think that's OK because disk sizes are already limited to
> 2^63 - 1 by the kernel (and for qemu even less than that).
> The OCaml bindings return a (signed) int64 for NBD.get_size.

Under patch#7 yesterday, I made a proposal for "armoring" at least one
instance / direction of the uint64_t <-> int64 conversion. It raised an
interesting problem: raising OCaml exceptions in such C functions that
are *not* directly called by the OCaml runtime. Comments would be much
appreciated in that subthread!

(On a tangent: I've also noticed we use CAMLparam0() & friends in some
of our functions that are *not* directly called by the OCaml runtime.
They certainly run on the OCaml runtime's stack, but there's at least
one intervening stack frame where the C-language function is provided by
us. Now I know we must use CAMLparam0() in our *outermost* such
function, but what about the further functions (inner C-language
functions) that our outermost function calls in turn? I think the inner
functions are at liberty not to use CAMLparam0() -- otherwise, our
functions couldn't even call normal C library functions!)

Thanks,
Laszlo

