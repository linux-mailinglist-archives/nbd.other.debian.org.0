Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB652386D
	for <lists+nbd@lfdr.de>; Mon, 20 May 2019 15:42:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E05BB20444; Mon, 20 May 2019 13:42:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 20 13:42:10 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,PGPSIGNATURE,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A7A9C203A2
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 May 2019 13:42:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3dan_IvhCuZK for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 May 2019 13:41:59 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4F42E2033D
	for <nbd@other.debian.org>; Mon, 20 May 2019 13:41:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29A0981DEE;
	Mon, 20 May 2019 13:41:47 +0000 (UTC)
Received: from [10.3.116.56] (ovpn-116-56.phx2.redhat.com [10.3.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AEB019C68;
	Mon, 20 May 2019 13:41:45 +0000 (UTC)
Subject: Re: Standard NBD URL syntax (again)
To: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org,
 berrange@redhat.com, w@uter.be
References: <20190520092056.GA9368@redhat.com>
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
Message-ID: <81150a0a-11ce-c0e9-179d-7ff865586fb8@redhat.com>
Date: Mon, 20 May 2019 08:41:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520092056.GA9368@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oqD4ONy29wt3eIWFw54Yxh1ciAnKZ9RDX"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 20 May 2019 13:41:52 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qAIskOpgE5M.A.zIE.y6q4cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/502
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/81150a0a-11ce-c0e9-179d-7ff865586fb8@redhat.com
Resent-Date: Mon, 20 May 2019 13:42:10 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oqD4ONy29wt3eIWFw54Yxh1ciAnKZ9RDX
Content-Type: multipart/mixed; boundary="ZQyNlLlTsXHjXIWKqYvxpWrPn2mPrH7eG";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org,
 berrange@redhat.com, w@uter.be
Message-ID: <81150a0a-11ce-c0e9-179d-7ff865586fb8@redhat.com>
Subject: Re: Standard NBD URL syntax (again)
References: <20190520092056.GA9368@redhat.com>
In-Reply-To: <20190520092056.GA9368@redhat.com>

--ZQyNlLlTsXHjXIWKqYvxpWrPn2mPrH7eG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 5/20/19 4:20 AM, Richard W.M. Jones wrote:
>=20
> Previous discussion:
> https://lists.debian.org/nbd/2018/07/msg00002.html
>=20
> Again I'm stuck because we need a URL syntax for NBD.
>=20
> Various URLs have been proposed before:
>=20
>   * Library      Hostname+port over TCP/IP
>                  Unix domain socket
> 		 Export name
>   - Link for further information
>   - Notes
>=20
>   * libguestfs   nbd://example.com:port      (:port is optional)
>                  nbd://?socket=3D/socket
> 		 nbd://example.com:port/exportname
>                  nbd:///exportname?socket=3D/socket
>   - http://libguestfs.org/guestfish.1.html#a-nbd:-example.com-:port
>   - Cannot specify an export name without a leading '/' character
>=20
>   * QEMU         nbd:example.com:port
>                  nbd:unix:/socket
> 		 nbd:example.com:port:exportname=3D/export
>   - https://qemu.weilnetz.de/doc/qemu-doc.html#Device-URL-Syntax
>   - Not a real URL!

Qemu also supports actual URLs:

nbd[+tcp]://example.com[:port]/[exportname]
nbd+unix:///[exportname]?socket=3Dpath

where the [...] blocks are optional (missing exportname requests the
default '' export, missing port defaults to 10809)

>=20
>   * Curl         nbd://example.com/
>                  nbd://example.com/exportname
>   - https://github.com/rwmjones/curl/commit/2aba3dd7d8f9b8e03a8c3435e75=
55ab9e195675a#diff-77ab3188c0ad08b7b9d8d9787c8e9d75
>   - Cannot specify an export name without a leading '/' character
>   - No Unix domain socket syntax was ever defined.
>   - Did not go upstream.
>=20
> The leading problem with the "obvious" NBD URL format seems to be that
> it's impossible to specify empty export names or export names which
> don't start with a '/' character.

The qemu format allows empty export names. 'nbd://hostname' and
'nbd://hostname/' are the same empty export, 'nbd://hostname//' is the
export named '/'.

>=20
> This is why I'd be inclined to use an extra URL parameter instead,
> like:
>=20
>   nbd://example.com[:port]/?export=3Dexportname
>=20
> and for Unix domain sockets:
>=20
>   nbd:///?export=3Dexportname&socket=3D/socket

The qemu solution was to use the 'nbd+unix://' protocol rather than the
bare 'nbd://' protocol to tell the difference between tcp and Unix
sockets, rather than trying to figure out from the rest of the URL which
context was implied.

>=20
> The export would be optional, defaulting to empty string.  IPv6
> addresses would work in the obvious way for URLs, using "[...]"
> around the address part (ie as in RFC 2732).  All escaping issues
> would work as for standard URLs.
>=20
> I think we should standardize this once and for all in a document in
> the NBD repository.
>=20
> Anyway let me know what you think and I will try to write something
> formal.
>=20
> Rich.
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--ZQyNlLlTsXHjXIWKqYvxpWrPn2mPrH7eG--

--oqD4ONy29wt3eIWFw54Yxh1ciAnKZ9RDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlzirpgACgkQp6FrSiUn
Q2rv8Af6A2fnbCdjGOslevbykw61Z8w/gvy/RPteu5QXgQ6ruzqVqn4ag7N0yYaZ
ZYjVkYuZItwl747XOyRLwG41Jnq4WjRh8PPB5PnOSFe38IC50xSQ4zfVEwxHB2R9
CpPwMtUPg3xZFv7rF05rz2u2CDj+iDJlhq9LXEsCa89OM2g/Gruxgw51P3vqu7BR
r1SN5EdSZ5tD88drjOR1YDtHoeNyd+J+BSI+4t3HhQKhdaaH3s3pepk4pWqmETqa
ply/I7RDYdJGfjMwaB+fv/6zKjd2IU1detplAKGM3Ou79ttW8gQccSWkSz90Tdf4
+R9DOAQ/8tPLBXlv0+fUvaCvij/C4g==
=PnN2
-----END PGP SIGNATURE-----

--oqD4ONy29wt3eIWFw54Yxh1ciAnKZ9RDX--

