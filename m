Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BFD2CC73
	for <lists+nbd@lfdr.de>; Tue, 28 May 2019 18:47:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B93D3206E4; Tue, 28 May 2019 16:47:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 28 16:47:34 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9B626206DF
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 May 2019 16:47:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XqQp4NBOoJup for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 May 2019 16:47:23 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6BEED206D5
	for <nbd@other.debian.org>; Tue, 28 May 2019 16:47:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E8DA3082134;
	Tue, 28 May 2019 16:47:15 +0000 (UTC)
Received: from [10.3.116.169] (ovpn-116-169.phx2.redhat.com [10.3.116.169])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C7E51972B;
	Tue, 28 May 2019 16:47:12 +0000 (UTC)
Subject: Re: [PATCH v2] doc: Define a standard URI syntax for NBD URIs.
To: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org
Cc: w@uter.be, berrange@redhat.com, mkletzan@redhat.com
References: <20190528103537.15081-1-rjones@redhat.com>
 <20190528103537.15081-2-rjones@redhat.com>
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
Message-ID: <ee3f8aa0-e775-f300-85be-166d2c3ea504@redhat.com>
Date: Tue, 28 May 2019 11:47:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528103537.15081-2-rjones@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3LOP7QiRabXOZystGQTwezSjJKPyJqW20"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 28 May 2019 16:47:20 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9ts2vi0QquH.A._OB.mYW7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/541
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ee3f8aa0-e775-f300-85be-166d2c3ea504@redhat.com
Resent-Date: Tue, 28 May 2019 16:47:34 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3LOP7QiRabXOZystGQTwezSjJKPyJqW20
Content-Type: multipart/mixed; boundary="fK4X4IatzY8tpTvahd05qOiBVZ5Uohn0Q";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org
Cc: w@uter.be, berrange@redhat.com, mkletzan@redhat.com
Message-ID: <ee3f8aa0-e775-f300-85be-166d2c3ea504@redhat.com>
Subject: Re: [PATCH v2] doc: Define a standard URI syntax for NBD URIs.
References: <20190528103537.15081-1-rjones@redhat.com>
 <20190528103537.15081-2-rjones@redhat.com>
In-Reply-To: <20190528103537.15081-2-rjones@redhat.com>

--fK4X4IatzY8tpTvahd05qOiBVZ5Uohn0Q
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 5/28/19 5:35 AM, Richard W.M. Jones wrote:
> For further information about discussion around this standard, see
> this thread on the mailing list:
> https://lists.debian.org/nbd/2019/05/msg00013.html
>=20
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  doc/Makefile.am |   2 +-
>  doc/uri.md      | 183 ++++++++++++++++++++++++++++++++++++++++++++++++=

>  2 files changed, 184 insertions(+), 1 deletion(-)
>=20

> +## NBD URI export name
> +
> +The path part of the URI except for the leading `/` character MAY be
> +passed to the server as the export name.
> +
> +For example:
> +
> +    NBD URI                          Export name
> +    ----------------------------------------------------
> +    nbd://example.com/disk           disk
> +    nbd+unix:///disk                 disk

Should this use:

       nbd+unix:///disk?socket=3D/foo     disk

to comply with the other statements that the socket query should be
present for nbd+unix://, and to give an example of how the query is not
part of the export name?


> +## NBD URI socket parameter
> +
> +If the scheme name indicates a Unix domain socket then the query
> +parameters MUST include a `socket` key, referring to the Unix domain
> +socket which on Unix-like systems is usually a special file on the
> +local disk.
> +
> +On platforms which support Unix domain sockets in the abstract
> +namespace, and if the client supports this, the `socket` parameter MAY=

> +begin with an ASCII NUL character.  When the URI is properly encoded
> +it will look like this:
> +
> +    nbd+unix:///?socket=3D%00/abstract
> +

=2E..
> +
> +## Clients which do not support TLS
> +
> +Wherever this document refers to encryption, authentication and TLS,
> +clients which do not support TLS SHOULD give an error when
> +encountering an NBD URI that requires TLS (such as one with a scheme
> +name `nbds`).
> \ No newline at end of file

You'll want to fix that :)

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--fK4X4IatzY8tpTvahd05qOiBVZ5Uohn0Q--

--3LOP7QiRabXOZystGQTwezSjJKPyJqW20
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlztZg8ACgkQp6FrSiUn
Q2p6uQf/fgPPXsgdNP85q2fGantWB8s2ZtUc7H0BCwVF5Goh0DBGf5Q57jM/DHeI
vKt8MGg96wJggPr8ikJZZoXm4SdtBXnVewi9mVCkOzKKCzsnOSVJzDD2vfFm8K4A
k/1DX2no7Pwx3pUCV+5MswPInITmZqA7Bjnejvx4hlISSJha8A8FpLER03fvhzjQ
xpLuoDzc0lNwzfv0fdFBbq8gXqybTxE4qC+e4z6r3NNF7AkCXtSuXpgx8WTcZDuo
O5NhJXC5EPbvn5SwRKWk/qek4zGkeBd/97OU/O7zZisIoEiOATy3cZXu7EqB7NqM
p40dMx8MAlJ0rMpYgkFbTJStLgSHzw==
=QGub
-----END PGP SIGNATURE-----

--3LOP7QiRabXOZystGQTwezSjJKPyJqW20--

