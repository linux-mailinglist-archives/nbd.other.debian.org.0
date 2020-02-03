Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEF6151067
	for <lists+nbd@lfdr.de>; Mon,  3 Feb 2020 20:41:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 23D6220607; Mon,  3 Feb 2020 19:41:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb  3 19:41:39 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2E95220454
	for <lists-other-nbd@bendel.debian.org>; Mon,  3 Feb 2020 19:41:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.081 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tmcBPJRxnKYM for <lists-other-nbd@bendel.debian.org>;
	Mon,  3 Feb 2020 19:41:28 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 378 seconds by postgrey-1.36 at bendel; Mon, 03 Feb 2020 19:41:28 UTC
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id 13FFE20419
	for <nbd@other.debian.org>; Mon,  3 Feb 2020 19:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580758882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/pP1gmm2GO/NGc9U/tRbjNf1ckrAksOsLupkwyxLi8M=;
	b=DiVwGJFaVRINAm+/R3LKNpm2NzQm3YeFu7H0LrbJlpFRTLl53Ui/Dkuwkem0B2ZQlAPbjx
	M0NOag5qrm9ToCTtGFn3VlfoKbB9ApkKH2I3pbNJN15Ds+sZcZYASSNyIOAU4BpYz8L1mh
	QEOac5PGkZvv5FatxKZ31xPmKqecQAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-LQ_WKF5RPoCQ24koKe_clQ-1; Mon, 03 Feb 2020 14:34:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DC3B8010F9;
	Mon,  3 Feb 2020 19:34:57 +0000 (UTC)
Received: from [10.3.116.181] (ovpn-116-181.phx2.redhat.com [10.3.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3E8160BE0;
	Mon,  3 Feb 2020 19:34:56 +0000 (UTC)
Subject: Re: [PATCH v4] doc: Add alternate trim/zero limits
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>
Cc: Denis Lunev <den@virtuozzo.com>
References: <20180501212242.986796-1-eblake@redhat.com>
 <bbf265a8-3380-e153-1fa3-3a7c9048692a@virtuozzo.com>
 <272b17ce-9247-e751-b85f-9eda492c3853@redhat.com>
 <5de902a3-bbe3-4415-8238-57d0f8e75371@virtuozzo.com>
 <08f2380d-10c6-ef3c-4361-2c484cd90c81@virtuozzo.com>
 <e4ffe034-b2fa-f7e6-aa5c-e7db55f546b6@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ef0bfebc-b222-8e19-8828-d1cb4d32972d@redhat.com>
Date: Mon, 3 Feb 2020 13:34:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e4ffe034-b2fa-f7e6-aa5c-e7db55f546b6@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: LQ_WKF5RPoCQ24koKe_clQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GUN-tR0gWBO.A.iX.zdHOeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/785
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ef0bfebc-b222-8e19-8828-d1cb4d32972d@redhat.com
Resent-Date: Mon,  3 Feb 2020 19:41:39 +0000 (UTC)

On 2/3/20 1:18 PM, Vladimir Sementsov-Ogievskiy wrote:

>>> Investigating our heap of patches in virtuozzo qemu above rhel qemu,=20
>>> I now look at two patches which actually drop these restrictions
>>> in client for WRITE_ZERO, TRIM and BLOCK_STATUS. So actually we just=20
>>> live with a bit non-compliant client for more than year due to
>>> these restrictions..

So far this is working well enough that my idea of an extension still=20
hasn't percolated to the top of my todo queue; but it is is getting closer.

>>>
>>> I didn't answer your question about BLOCK_STATUS: yes, we need large=20
>>> BLOCK_STASTUS requests, as qemu-img convert does additional loop
>>> of block status querying before actual converting, and this loop is=20
>>> slowed down because of restrictions. About CACHE I'm unsure, seems
>>> we didn't face such problems with it.
>>>
>>> Do you have plans or ideas on this topic?
>>>
>>> I think that for BLOCK_STATUS and TRIM we can safely drop max_block=20
>>> restriction at all, documenting that max_block is unrelated to
>>> these commands, as actually, for BLOCK_STATUS server may return less=20
>>> then required anyway, and TRIM should never lead to some big
>>> allocations or calculations..
>>>
>>> WRITE_ZERO is a bit trickier, as if it is backed by just writing=20
>>> zeroes, but we can at least drop max_block restriction if FAST_ZERO
>>> flag is specified, than client may implement write zero as
>>>
>>> write_zero(FAST_ZERO)
>>> if failed:
>>> =C2=A0=C2=A0=C2=A0 writing zero is slow anyway, do it in a loop.
>>>
>>>
>>> So, in other words, can we do something like this:
>>>
>>> =C2=A0=C2=A0diff --git a/doc/proto.md b/doc/proto.md
>>> =C2=A0=C2=A0index fc7baf6..4b067f5 100644
>>> =C2=A0=C2=A0--- a/doc/proto.md
>>> =C2=A0=C2=A0+++ b/doc/proto.md
>>> =C2=A0=C2=A0@@ -815,9 +815,12 @@ Where a transmission request can have =
a=20
>>> nonzero *offset* and/or
>>> =C2=A0=C2=A0 the client MUST ensure that *offset* and *length* are inte=
ger
>>> =C2=A0=C2=A0 multiples of any advertised minimum block size, and SHOULD=
 use=20
>>> integer
>>> =C2=A0=C2=A0 multiples of any advertised preferred block size where pos=
sible.=C2=A0 For
>>> =C2=A0=C2=A0-those requests, the client MUST NOT use a *length* larger =
than any
>>> =C2=A0=C2=A0-advertised maximum block size or which, when added to *off=
set*, would
>>> =C2=A0=C2=A0-exceed the export size.=C2=A0 The server SHOULD report an =
`NBD_EINVAL`=20
>>> error if
>>> =C2=A0=C2=A0+those requests, the client MUST NOT use a *length* which, =
when=20
>>> added to
>>> =C2=A0=C2=A0+*offset*, would exceed the export size. Also for NBD_CMD_R=
EAD,
>>> =C2=A0=C2=A0+NBD_CMD_WRITE, NBD_CMD_CACHE and NBD_CMD_WRITE_ZEROES (exc=
ept for
>>> =C2=A0=C2=A0+when NBD_CMD_FLAG_FAST_ZERO is set), the client MUST NOT u=
se a=20
>>> *length*
>>> =C2=A0=C2=A0+larger than any advertised maximum block size.

Meanwhile, this doc tweak makes sense to me. Would you like to submit it=20
as a proper patch against nbd.git to make it easier for me to apply the=20
patch correctly?

>>> =C2=A0=C2=A0+The server SHOULD report an `NBD_EINVAL` error if
>>> =C2=A0=C2=A0 the client's request is not aligned to advertised minimum =
block size
>>> =C2=A0=C2=A0 boundaries, or is larger than the advertised maximum block=
 size.
>>> =C2=A0=C2=A0 Notwithstanding any maximum block size advertised, either =
the server
>>>
>>> ?
>>>
>>> Or it will make existent nbd servers non-compliant? At least seems=20
>>> qemu nbd server never forced these restrictions
>>> in specified cases.
>>>
>>>
>>> And, additional idea: can we in qemu just ignore these restrictions=20
>>> up to first EINVAL returned? So, for example,
>>> we start with bs->bl.max_pwrite_zeroes =3D INT_MAX, we send=20
>>> WRITE_ZEROES with length exceeding max_block, if server
>>> replies with EINVAL we retry current request using limited length (we=
=20
>>> have to do it in a loop) and set
>>> bs->bl.max_pwrite_zeroes =3D max_block.
>>>
>>>
>>
>> Eric? Now, I'm investigating the heap again, and remember of this=20
>> talk:) What do you think?
>>
>=20
> Any ideas?
>=20

I still hope to revisit my idea of extending NBD_INFO during NBD_OPT_GO=20
to expose actual server limits for trim, write zeroes, and block status.=20
  But I'm also about to post a different extension adding=20
NBD_INFO_INIT_STATE which would let a server advertise to the client=20
when it is already known that the export reads as all zeroes, so you=20
don't even have to TRY to use large trim or write zero requests, nor=20
iterate over the image with block status, but can immediately proceed=20
straight to writing just the non-zero portions of the export.


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

