Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 753B33D399
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2019 19:10:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5A44D203D0; Tue, 11 Jun 2019 17:10:24 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 17:10:24 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9C9B120382
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2019 17:10:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id z4z41dHWRn7p for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2019 17:10:13 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 38967203C6
	for <nbd@other.debian.org>; Tue, 11 Jun 2019 17:10:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1427E30C0DE1;
	Tue, 11 Jun 2019 17:10:10 +0000 (UTC)
Received: from [10.3.116.85] (ovpn-116-85.phx2.redhat.com [10.3.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 776B960BF1;
	Tue, 11 Jun 2019 17:10:09 +0000 (UTC)
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
To: Martin Kletzander <mkletzan@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, w@uter.be, berrange@redhat.com
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com> <20190611142259.GG29602@wheatley>
 <cda4d898-39c7-1d76-8dd3-e0067d2cbce8@redhat.com>
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
Message-ID: <24d70886-d29a-9283-5ec9-f98308ce2ce9@redhat.com>
Date: Tue, 11 Jun 2019 12:10:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cda4d898-39c7-1d76-8dd3-e0067d2cbce8@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="en9x8MX5tVyhdkpTApbBRJ7z5wuo3jX4M"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 11 Jun 2019 17:10:10 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jJ-9Kk1gmzD.A.g4C.AC-_cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/574
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/24d70886-d29a-9283-5ec9-f98308ce2ce9@redhat.com
Resent-Date: Tue, 11 Jun 2019 17:10:24 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--en9x8MX5tVyhdkpTApbBRJ7z5wuo3jX4M
Content-Type: multipart/mixed; boundary="ZCeafVxE3G2jpdkez65x7fJF8u64RLKXq";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Martin Kletzander <mkletzan@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, w@uter.be, berrange@redhat.com
Message-ID: <24d70886-d29a-9283-5ec9-f98308ce2ce9@redhat.com>
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com> <20190611142259.GG29602@wheatley>
 <cda4d898-39c7-1d76-8dd3-e0067d2cbce8@redhat.com>
In-Reply-To: <cda4d898-39c7-1d76-8dd3-e0067d2cbce8@redhat.com>

--ZCeafVxE3G2jpdkez65x7fJF8u64RLKXq
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/11/19 11:31 AM, Eric Blake wrote:

>> What I thought of would be another parameter that would specify which =
other
>> parameters must be supported, so that the client quits if any of them =
is
>> unknown.=A0 On the other hand it should be perfectly fine to make sure=
 new
>> enough
>> version of the client is used.
>=20
> So, you're asking for some way to know that ?foo=3Dbar is supported by =
the
> client, by having a way to fail if the client doesn't know how to parse=

> the foo query.  What if we document mandatory support for a parameter
> '?features=3Dcomma,list,of,names', where a client MUST fail to parse th=
e
> URI if it does not recognize one of the feature names from the list
> given to features?  Then we can have:
>=20
> nbd://host/?foo=3Dbar
>  - okay to ignore query foo=3D as unknown
> nbd://host/?foo=3Dbar&features=3Dfoo
>  - client MUST fail to parse URI unless it also knows how to parse the
> foo query parameter
>=20
> The initial set of features mandated by the NBD URI spec is 'features'
> for self-description, as well as 'socket' for Unix but not necessarily
> TCP.  Then the queries '?features=3D' and '?features=3Dfeatures' must b=
oth
> succeed, the query '?features=3Dsocket' depends on the scheme, and any
> other '?features=3D...' query becomes a feature probe.

We could also reserve feature 'fail' as something that MUST NOT be
recognized as a query parameter name, to use 'nbd://host/?features=3Dfail=
'
as a way to probe whether a client correctly rejects unknown features.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--ZCeafVxE3G2jpdkez65x7fJF8u64RLKXq--

--en9x8MX5tVyhdkpTApbBRJ7z5wuo3jX4M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlz/4HAACgkQp6FrSiUn
Q2pgCQf/QTprHdN/tdmPBvwZzElDxemIkj2djxUD2P1T9Y/LXasSJTzmwrh+RI+Q
/xP7sjRla4oBZd0dPrjEotHNT1er1Mal/71R11bIq0QCRikvSvgsZOoCW4mgLMIB
XhyeE/O7u/ljLXaq/y1oFTX5yK93WgS12ml2FHo52LI2oDcoEiKXtqaVXPYrEpJ2
BkU6StAl6/KgVpvalNzpxmDudeHCEt7i3sRfyRsdST6jqzgZgWQ4MlpXA1/uzdPA
nzKYX4t1zN9TRbuFYoVY7FId8jPdOW1iBvGTZaj5Ibz94AD0q+lA+3ZoSuhjCqQ/
stX+RfyB2+7QWcjDGhr+hdMR0dGiEw==
=OhXz
-----END PGP SIGNATURE-----

--en9x8MX5tVyhdkpTApbBRJ7z5wuo3jX4M--

