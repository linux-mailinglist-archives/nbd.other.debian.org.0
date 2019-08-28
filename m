Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EB323A029C
	for <lists+nbd@lfdr.de>; Wed, 28 Aug 2019 15:05:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A9C9B20459; Wed, 28 Aug 2019 13:05:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 28 13:05:16 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1FC612048E
	for <lists-other-nbd@bendel.debian.org>; Wed, 28 Aug 2019 13:05:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HgJ1NhcnXdVT for <lists-other-nbd@bendel.debian.org>;
	Wed, 28 Aug 2019 13:05:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E2F37203E7
	for <nbd@other.debian.org>; Wed, 28 Aug 2019 13:05:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58ACF18B3D88;
	Wed, 28 Aug 2019 13:05:00 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFBD560F88;
	Wed, 28 Aug 2019 13:04:56 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 1/1] protocol: Add NBD_CMD_FLAG_FAST_ZERO
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "libguestfs@redhat.com" <libguestfs@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143426.26838-1-eblake@redhat.com>
 <20190823143426.26838-2-eblake@redhat.com>
 <274bc60d-f57d-2f97-4be9-8de1aabb0949@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <810779d1-0289-d635-0446-93b3dd32ec95@redhat.com>
Date: Wed, 28 Aug 2019 08:04:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <274bc60d-f57d-2f97-4be9-8de1aabb0949@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tG6rWZ4upDMCVnVRPFdP2wdvdP7z7JN9V"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Wed, 28 Aug 2019 13:05:00 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pP5WgKkqphP.A.cQC.MwnZdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/656
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/810779d1-0289-d635-0446-93b3dd32ec95@redhat.com
Resent-Date: Wed, 28 Aug 2019 13:05:16 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tG6rWZ4upDMCVnVRPFdP2wdvdP7z7JN9V
Content-Type: multipart/mixed; boundary="YAfi9QVh4CpsWZhBez2vvY6ptixYit2ub";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "libguestfs@redhat.com" <libguestfs@redhat.com>
Message-ID: <810779d1-0289-d635-0446-93b3dd32ec95@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/1] protocol: Add NBD_CMD_FLAG_FAST_ZERO
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143426.26838-1-eblake@redhat.com>
 <20190823143426.26838-2-eblake@redhat.com>
 <274bc60d-f57d-2f97-4be9-8de1aabb0949@virtuozzo.com>
In-Reply-To: <274bc60d-f57d-2f97-4be9-8de1aabb0949@virtuozzo.com>

--YAfi9QVh4CpsWZhBez2vvY6ptixYit2ub
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/28/19 4:57 AM, Vladimir Sementsov-Ogievskiy wrote:

>> Hence, it is desirable to have a way for clients to specify that a
>> particular write zero request is being attempted for a fast wipe, and
>> get an immediate failure if the zero request would otherwise take the
>> same time as a write.  Conversely, if the client is not performing a
>> pre-initialization pass, it is still more efficient in terms of
>> networking traffic to send NBD_CMD_WRITE_ZERO requests where the
>> server implements the fallback to the slower write, than it is for the=

>> client to have to perform the fallback to send NBD_CMD_WRITE with a
>> zeroed buffer.
>=20
> How are you going to finally use it in qemu-img convert?

It's already in use there (in fact, the cover letter shows actual timing
examples of how qemu-img's use of BDRV_REQ_NO_FALLBACK, which translates
to NBD_CMD_FLAG_FAST_ZERO, observably affects timing).

> Ok, we have a loop
> of sending write-zero requests. And on first ENOTSUP we'll assume that =
there
> is no benefit to continue? But what if actually server returns ENOTSUP =
only
> once when we have 1000 iterations? Seems we should still do zeroing if =
we
> have only a few ENOTSUPs...

When attempting a bulk zero, you try to wipe the entire device,
presumably with something that is large and aligned.  Yes, if you have
to split the write zero request due to size limitations, then you risk
that the first write zero succeeds but later ones fail, then you didn't
wipe the entire disk, but you also don't need to redo the work on the
first half of the image.  But it is much more likely that the first
write of the bulk zero is representative of the overall operation (and
so in practice, it only takes one fast zero attempt to learn if bulk
zeroing is worthwhile, then continue with fast zeroes without issues).

>=20
> I understand that fail-on-first ENOTSUP is OK for raw-without-fallocte =
vs qcow2,
> as first will always return ENOTSUP and second will never fail.. But in=
 such way
> we'll OK with simpler extension, which only have one server-advirtised =
negotiation
> flag NBD_FLAG_ZERO_IS_FAST.

Advertising that a server's zero behavior is always going to be
successfully fast is a much harder flag to implement.  The justification
for the semantics I chose (advertising that the server can quickly
report failure if success is not fast, but not requiring fast zero)
covers the case when the decision of whether a zero is fast may also
depend on other factors - for example, if the server knows the image
starts in an all-zero state, then it can track a boolean: all write zero
requests while the boolean is set return immediate success (nothing to
do), but after the first regular write, the boolean is set to false, and
all further write zero requests fail as being potentially slow; and such
an implementation is still useful for the qemu-img convert case.

>=20
> There is not such problem if we have only one iteration, so may be new =
command
> FILL_ZERO, filling the whole device by zeros?

Or better yet, implement support for 64-bit commands.  Yes, my cover
letter called out further orthogonal extensions, and implementing 64-bit
zeroing (so that you can issue a write zero request over the entire
image in one command), as well as a way for a server to advertise when
the image begins life in an all-zero state, are also further extensions
coming down the pipeline.  But as not all servers have to implement all
of the extensions, each extension that can be orthogonally implemented
and show an improvement on its own is still worthwhile; and my cover
letter has shown that fast zeroes on their own make a measurable
difference to certain workloads.

>> +    If the server advertised `NBD_FLAG_SEND_FAST_ZERO` but
>> +    `NBD_CMD_FLAG_FAST_ZERO` is not set, then the server MUST NOT fai=
l
>> +    with `NBD_ENOTSUP`, even if the operation is no faster than a
>> +    corresponding `NBD_CMD_WRITE`. Conversely, if
>> +    `NBD_CMD_FLAG_FAST_ZERO` is set, the server MUST fail quickly wit=
h
>> +    `NBD_ENOTSUP` unless the request can be serviced in less time tha=
n
>> +    a corresponding `NBD_CMD_WRITE`, and SHOULD NOT alter the content=
s
>> +    of the export when returning this failure. The server's
>> +    determination of a fast request MAY depend on a number of factors=
,
>> +    such as whether the request was suitably aligned, on whether the
>> +    `NBD_CMD_FLAG_NO_HOLE` flag was present, or even on whether a
>> +    previous `NBD_CMD_TRIM` had been performed on the region.  If the=

>> +    server did not advertise `NBD_FLAG_SEND_FAST_ZERO`, then it SHOUL=
D
>> +    NOT fail with `NBD_ENOTSUP`, regardless of the speed of servicing=

>> +    a request, and SHOULD fail with `NBD_EINVAL` if the
>> +    `NBD_CMD_FLAG_FAST_ZERO` flag was set. A server MAY advertise
>> +    `NBD_FLAG_SEND_FAST_ZERO` whether or not it can perform fast
>> +    zeroing; similarly, a server SHOULD fail with `NBD_ENOTSUP` when
>> +    the flag is set if the server cannot quickly determine in advance=

>> +    whether that request would have been fast, even if it turns out
>> +    that the same request without the flag would be fast after all.
>> +
>=20
> What if WRITE_ZERO in the average is faster than WRITE (for example by =
20%),
> but server never can guarantee performance for one WRITE_ZERO operation=
, do
> you restrict such case? Hmm, OK, SHOULD is not MUST actually..

I think my followup mail, based on Wouter's questions, covers this: the
goal is to document the use case of optimizing the copy of a sparse
image, by probing whether a bulk pre-zeroing pass is worthwhile.  That
should be the measuring rod - if the implementation can perform a faster
sparse copy because of write zeroes that are sometimes, but not always,
faster than writes, in spite of the duplicated I/O that happens to the
data portions of the image that were touched twice by the pre-zero pass
then the actual data pass, then succeeding on fast zero requests is
okay.  But if it makes the overall image copy slower, then failing with
ENOTSUP is probably better.  And at the end of the day, it is really
just a heuristic - if the server guessed wrong, the worst that happens
is slower performance (and not data corruption).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--YAfi9QVh4CpsWZhBez2vvY6ptixYit2ub--

--tG6rWZ4upDMCVnVRPFdP2wdvdP7z7JN9V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1me/gACgkQp6FrSiUn
Q2orKQf/YL9/loqx7rGl2hYzbVcgjwtqqQmi08ByTpPdsnQSyvhUVtlZDBngOIEe
0b/tJ3HK9RhVbTGBx1SrAK/+ZH3/VvXH/azDc0W1ThP+FyAzie8psMYUsaaKAwDO
/GqDBt7NtZrrvYSGzkpCOZ+o+15YhN//6KS5F/Ar+CLDQPOSSpPNeAYHTX9PVnyd
eIvRBiOZpeqrFb7Mxz9QBmpssCdCHkPWVJfxlolDfnSFCbSqCz01+J5omQCXtUZB
OW2R7ErXjOhu2ugynpzlI4F08ECSYczzWyF043hMlV0TOQPlX2TULrmQqe1nfFX6
VZOA4LvvRaPne+YrFUSFDx5UYqLH+g==
=hqk6
-----END PGP SIGNATURE-----

--tG6rWZ4upDMCVnVRPFdP2wdvdP7z7JN9V--

