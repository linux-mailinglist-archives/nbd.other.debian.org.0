Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2759B675
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 20:53:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 68E7E20437; Fri, 23 Aug 2019 18:53:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 18:53:14 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C2633203E2
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 18:53:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wXjhxLdUuH03 for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 18:53:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0DF14203D6
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 18:53:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC8E5C062ECD
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 18:52:58 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 812EB19C4F
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 18:52:58 +0000 (UTC)
Subject: Re: [PATCH 1/1] protocol: Add NBD_CMD_FLAG_FAST_ZERO
To: nbd@other.debian.org
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143426.26838-1-eblake@redhat.com>
 <20190823143426.26838-2-eblake@redhat.com>
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
Message-ID: <4d13acc4-3237-14cd-4539-f72a630283ca@redhat.com>
Date: Fri, 23 Aug 2019 13:52:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823143426.26838-2-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="66Adzg0Y4GhwiBd7fqJjstJTeycRMRgdU"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 23 Aug 2019 18:52:58 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6WMIKyRGsD.A.T0H.aYDYdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/646
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4d13acc4-3237-14cd-4539-f72a630283ca@redhat.com
Resent-Date: Fri, 23 Aug 2019 18:53:14 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--66Adzg0Y4GhwiBd7fqJjstJTeycRMRgdU
Content-Type: multipart/mixed; boundary="QRskNVmZVcZPXjy2cKNWHu8mwz5WJV7EA";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Message-ID: <4d13acc4-3237-14cd-4539-f72a630283ca@redhat.com>
Subject: Re: [PATCH 1/1] protocol: Add NBD_CMD_FLAG_FAST_ZERO
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143426.26838-1-eblake@redhat.com>
 <20190823143426.26838-2-eblake@redhat.com>
In-Reply-To: <20190823143426.26838-2-eblake@redhat.com>

--QRskNVmZVcZPXjy2cKNWHu8mwz5WJV7EA
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Dropping non-nbd lists

On 8/23/19 9:34 AM, Eric Blake wrote:
> While it may be counterintuitive at first, the introduction of
> NBD_CMD_WRITE_ZEROES and NBD_CMD_BLOCK_STATUS has caused a performance
> regression in qemu [1], when copying a sparse file. When the
> destination file must contain the same contents as the source, but it
> is not known in advance whether the destination started life with all
> zero content, then there are cases where it is faster to request a
> bulk zero of the entire device followed by writing only the portions
> of the device that are to contain data, as that results in fewer I/O
> transactions overall.


> @@ -2015,7 +2033,10 @@ The following request types exist:
>      reached permanent storage, unless `NBD_CMD_FLAG_FUA` is in use.
>=20
>      A client MUST NOT send a write zeroes request unless
> -    `NBD_FLAG_SEND_WRITE_ZEROES` was set in the transmission flags fie=
ld.
> +    `NBD_FLAG_SEND_WRITE_ZEROES` was set in the transmission flags
> +    field. Additionally, a client MUST NOT send the
> +    `NBD_CMD_FLAG_FAST_ZERO` flag unless `NBD_FLAG_SEND_FAST_ZERO` was=

> +    set in the transimssion flags field.

Squashing in a typo fix here.

>=20
>      By default, the server MAY use trimming to zero out the area, even=

>      if it did not advertise `NBD_FLAG_SEND_TRIM`; but it MUST ensure
> @@ -2025,6 +2046,28 @@ The following request types exist:
>      same area will not cause fragmentation or cause failure due to
>      insufficient space.
>=20
> +    If the server advertised `NBD_FLAG_SEND_FAST_ZERO` but
> +    `NBD_CMD_FLAG_FAST_ZERO` is not set, then the server MUST NOT fail=

> +    with `NBD_ENOTSUP`, even if the operation is no faster than a
> +    corresponding `NBD_CMD_WRITE`. Conversely, if
> +    `NBD_CMD_FLAG_FAST_ZERO` is set, the server MUST fail quickly with=

> +    `NBD_ENOTSUP` unless the request can be serviced in less time than=

> +    a corresponding `NBD_CMD_WRITE`, and SHOULD NOT alter the contents=

> +    of the export when returning this failure. The server's
> +    determination of a fast request MAY depend on a number of factors,=


Maybe:

determination of whether to fail fast rather than proceed MAY depend...

> +    such as whether the request was suitably aligned, on whether the
> +    `NBD_CMD_FLAG_NO_HOLE` flag was present, or even on whether a
> +    previous `NBD_CMD_TRIM` had been performed on the region.  If the
> +    server did not advertise `NBD_FLAG_SEND_FAST_ZERO`, then it SHOULD=

> +    NOT fail with `NBD_ENOTSUP`, regardless of the speed of servicing
> +    a request, and SHOULD fail with `NBD_EINVAL` if the
> +    `NBD_CMD_FLAG_FAST_ZERO` flag was set. A server MAY advertise
> +    `NBD_FLAG_SEND_FAST_ZERO` whether or not it can perform fast
> +    zeroing; similarly, a server SHOULD fail with `NBD_ENOTSUP` when
> +    the flag is set if the server cannot quickly determine in advance
> +    whether that request would have been fast, even if it turns out
> +    that the same request without the flag would be fast after all.
> +
>      If an error occurs, the server MUST set the appropriate error code=

>      in the error field.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--QRskNVmZVcZPXjy2cKNWHu8mwz5WJV7EA--

--66Adzg0Y4GhwiBd7fqJjstJTeycRMRgdU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1gNgkACgkQp6FrSiUn
Q2ohtAf/doMP1OooHVQD2rtaNxPeYS3OwIKbJ9qzvpEofu2odB//f7jNebnzR6bu
KeAgs/GyOeam1wD7/8+4FmZrNOO/oHbmqfZCDQQfPNh25q/WBsV1nBaCbefOtZpT
psmopMfCeUZs2+8rjsNsjF3KDzPIo+2Z/nwlPQnIiAZKP/QgIpnRX6zFo45S/1GM
8HuKTskFzLBXJyP343lr4wA3SffpU2V1SMNe9VOYpkBakEcT+N21UofSvXo5Z/xo
trxLPI0Kve/5pQOpWCRs7giqhr5o3Brh6fRQj9eZNUBpZyUL0kjFFjuIdZ1F+ZzZ
j6g6EhSxKwo4Qrjvt+oR5XrUo83RHg==
=gX/N
-----END PGP SIGNATURE-----

--66Adzg0Y4GhwiBd7fqJjstJTeycRMRgdU--

