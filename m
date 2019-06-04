Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CF10434F28
	for <lists+nbd@lfdr.de>; Tue,  4 Jun 2019 19:41:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9D4A4202C2; Tue,  4 Jun 2019 17:41:03 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun  4 17:41:03 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4FF9E202C6
	for <lists-other-nbd@bendel.debian.org>; Tue,  4 Jun 2019 17:40:56 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Cc47d4y54_CN for <lists-other-nbd@bendel.debian.org>;
	Tue,  4 Jun 2019 17:40:52 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DD399202C2
	for <nbd@other.debian.org>; Tue,  4 Jun 2019 17:40:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE95B30089B5;
	Tue,  4 Jun 2019 17:40:48 +0000 (UTC)
Received: from [10.3.116.85] (ovpn-116-85.phx2.redhat.com [10.3.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E92B91001DD2;
	Tue,  4 Jun 2019 17:40:47 +0000 (UTC)
Subject: Re: [PATCH v2] doc: Define a standard URI syntax for NBD URIs.
To: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org
Cc: w@uter.be, berrange@redhat.com, mkletzan@redhat.com
References: <20190528103537.15081-1-rjones@redhat.com>
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
Message-ID: <b399695f-1420-9dfb-b136-779d92dd500a@redhat.com>
Date: Tue, 4 Jun 2019 12:40:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528103537.15081-1-rjones@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1ZqtoTzaVTz0GYgdV95TLsQJGjXIVNjxv"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Tue, 04 Jun 2019 17:40:48 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <i65zixLHU9J.A.HBG.v0q9cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/558
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b399695f-1420-9dfb-b136-779d92dd500a@redhat.com
Resent-Date: Tue,  4 Jun 2019 17:41:03 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1ZqtoTzaVTz0GYgdV95TLsQJGjXIVNjxv
Content-Type: multipart/mixed; boundary="ESzHcZT0PhTot5ytydqXICtMdDi92oAo3";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org
Cc: w@uter.be, berrange@redhat.com, mkletzan@redhat.com
Message-ID: <b399695f-1420-9dfb-b136-779d92dd500a@redhat.com>
Subject: Re: [PATCH v2] doc: Define a standard URI syntax for NBD URIs.
References: <20190528103537.15081-1-rjones@redhat.com>
In-Reply-To: <20190528103537.15081-1-rjones@redhat.com>

--ESzHcZT0PhTot5ytydqXICtMdDi92oAo3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 5/28/19 5:35 AM, Richard W.M. Jones wrote:
> Differences since v1:
>=20
> - Make clear that we defer all questions about the NBD protocol
>   or how it works to the NBD protocol document.
>=20
> - Make clear that the userinfo field is only needed for TLS
>   (not for NBD itself).
>=20
> - `socket` parameter is still required, because I'm unhappy about
>   a client opening a local file if no socket is specified (it's
>   far more likely to be an error and opening a local file could
>   raise security concerns).
>=20
> - Add various tls parameters.  The most controversial(?) aspect of
>   this is that I've gone with qemu-style certificates directory.

And that's the part that is not yet implemented in libnbd 0.1.2.

>=20
> - Document how clients which do not support TLS should behave.
>=20
> - Document that Unix domain sockets may begin with an ASCII NUL
>   character on some platforms.
>=20


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--ESzHcZT0PhTot5ytydqXICtMdDi92oAo3--

--1ZqtoTzaVTz0GYgdV95TLsQJGjXIVNjxv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlz2rR4ACgkQp6FrSiUn
Q2puUAf+K1HgQb2dnT9DTe8HZBfHw/PFM9vwAJLAMphbXMpkDikFD5esbjRU9FRA
SmKleuUo/2PcqIfTGuXoGcbV5qOjCg9+yeSmZ6rBzAEsQk3WMSAKT0Eqv2/7B8BL
9aEZnxpxzbUlAC5GAUvw9XctdQSQ6x3b2FfVnwgQSz2017RumE8IjPuZYKUBhK8s
3GbZfwCBEHPmGYZs3xSFZJvAMYsJ5RJsrr+SFCfHcTfQpG1KzjAWks6KxU3ClMDK
qE09UMYrw8ihkZKajmVCgieNZcYJ70pymVTE8kJVO3B/QYum7D5eloAwg9C3wilD
tVgFNF9/8F1RX4wpEWkwN9ULc7H8Mg==
=GCs+
-----END PGP SIGNATURE-----

--1ZqtoTzaVTz0GYgdV95TLsQJGjXIVNjxv--

