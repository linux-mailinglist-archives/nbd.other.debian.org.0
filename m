Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 870F2A6BB8
	for <lists+nbd@lfdr.de>; Tue,  3 Sep 2019 16:42:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5B42A2023C; Tue,  3 Sep 2019 14:42:24 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  3 14:42:24 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5446020135
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Sep 2019 14:42:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Qvg9EYwD-6TS for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Sep 2019 14:42:13 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AF72820038
	for <nbd@other.debian.org>; Tue,  3 Sep 2019 14:42:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DA1B3061421;
	Tue,  3 Sep 2019 14:42:09 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47C5B5D6D0;
	Tue,  3 Sep 2019 14:42:06 +0000 (UTC)
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
To: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org
Cc: w@uter.be, berrange@redhat.com, mkletzan@redhat.com
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com>
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
Message-ID: <27a64c91-7309-31d7-b639-b32e1107c3f5@redhat.com>
Date: Tue, 3 Sep 2019 09:42:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190611115330.6842-2-rjones@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Zdbn6TThQSEAIuriwpWWrPArg8X3EJt9a"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 03 Sep 2019 14:42:09 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <26jaBoRvopB.A.-4H.QvnbdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/678
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/27a64c91-7309-31d7-b639-b32e1107c3f5@redhat.com
Resent-Date: Tue,  3 Sep 2019 14:42:24 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Zdbn6TThQSEAIuriwpWWrPArg8X3EJt9a
Content-Type: multipart/mixed; boundary="DrxaMdAkPQ1NbYd5ie8eA7B289qz6vvdg";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org
Cc: w@uter.be, berrange@redhat.com, mkletzan@redhat.com
Message-ID: <27a64c91-7309-31d7-b639-b32e1107c3f5@redhat.com>
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com>
In-Reply-To: <20190611115330.6842-2-rjones@redhat.com>

--DrxaMdAkPQ1NbYd5ie8eA7B289qz6vvdg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/11/19 6:53 AM, Richard W.M. Jones wrote:
> For further information about discussion around this standard, see
> this thread on the mailing list:
> https://lists.debian.org/nbd/2019/05/msg00013.html
>=20
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  doc/Makefile.am |   2 +-
>  doc/uri.md      | 171 ++++++++++++++++++++++++++++++++++++++++++++++++=

>  2 files changed, 172 insertions(+), 1 deletion(-)

Are we ready to commit this?  There were some discussions about whether
to recognize/reserve any additional query parameters, but consensus
seemed to be that was just over-engineering at this point.

> +++ b/doc/uri.md

> +Note that export names are not usually paths, they are free text
> +strings.  In particular they do not usually start with a `/`
> +character, they may be an empty string, and they may contain any
> +Unicode character.

Well, not the NUL character.

Do we need to worry about normalization issues?  That is, a server with
an export named 'a//b/../c' might be normalized by URI parsers into
'a/c'.   Maybe we should adjust the NBD spec to recommend against the
use of export names that could be altered during traditional file name
normalization?


> +## NBD URI query parameters related to TLS
> +
> +If TLS encryption is to be negotiated then the following query
> +parameters MAY be present:
> +
> +* `tls-type`: Possible values include `anon`, `x509` or `psk`.  This
> +  specifies the desired TLS authentication method.
> +
> +* `tls-hostname`: The optional TLS hostname to use for certificate
> +  verification.  This can be used when connecting over a Unix domain
> +  socket since there is no hostname available in the URI authority
> +  field; or when DNS does not properly resolve the server's hostname.
> +
> +* `tls-verify-peer`: This optional parameter may be `0` or `1` to
> +  control whether the client verifies the server's identity.  By
> +  default clients SHOULD verify the server's identity if TLS is
> +  negotiated and if a suitable Certificate Authorty is available.

Authority

> +
> +## Other NBD URI query parameters
> +
> +Clients SHOULD prefix experimental query parameters using `x-`.  This
> +SHOULD NOT be used for query parameters which are expected to be
> +widely used.
> +
> +Any other query parameters which the client does not understand SHOULD=

> +be ignored by the parser.
> +
> +## Clients which do not support TLS
> +
> +Wherever this document refers to encryption, authentication and TLS,
> +clients which do not support TLS SHOULD give an error when
> +encountering an NBD URI that requires TLS (such as one with a scheme
> +name `nbds` or `nbds+unix`).
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--DrxaMdAkPQ1NbYd5ie8eA7B289qz6vvdg--

--Zdbn6TThQSEAIuriwpWWrPArg8X3EJt9a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1ue70ACgkQp6FrSiUn
Q2pB+AgApFLPoNGtfw2kO+gkUktp6waTaRUmV2jEn9Mwof5ajOdtIrg0iMHNaXyq
iwkJKOhtpfyXn6/1CGjvbpPOcIokOzNsvOH/HcN6+oMzzeErWGB/zDx6YhQr+/2l
NOnFojSIhwpT0EElPmusJtbtr/M2Xms1vM/6Q4Aqdo82UB6A6KyY+P+spGUe6X2Q
UhhKmj4Fqo7tyVZdvfJodJoo6tnQZCfyoU2XI/35RwNh/MmskpkI/j88OT8uNqK9
RqvabAWHCNHwqHPisuFtCKf/cnxLyji6hPCAslNKsDArQwAnzQlG9cKikDu0yKta
q+FKOAic0xMGPc+z7XGfjcVS/7vw/A==
=OOEI
-----END PGP SIGNATURE-----

--Zdbn6TThQSEAIuriwpWWrPArg8X3EJt9a--

