Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B21EC34F1D
	for <lists+nbd@lfdr.de>; Tue,  4 Jun 2019 19:39:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7DF63202E5; Tue,  4 Jun 2019 17:39:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun  4 17:39:08 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E704E202D8
	for <lists-other-nbd@bendel.debian.org>; Tue,  4 Jun 2019 17:39:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id v4XZQNaLtpyi for <lists-other-nbd@bendel.debian.org>;
	Tue,  4 Jun 2019 17:38:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 05124202C6
	for <nbd@other.debian.org>; Tue,  4 Jun 2019 17:38:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 328A93001822
	for <nbd@other.debian.org>; Tue,  4 Jun 2019 17:38:50 +0000 (UTC)
Received: from [10.3.116.85] (ovpn-116-85.phx2.redhat.com [10.3.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3D4219C69
	for <nbd@other.debian.org>; Tue,  4 Jun 2019 17:38:49 +0000 (UTC)
Subject: Re: [PATCH] docs: Recommend TCP_NODELAY (disabling Nagle)
To: nbd@other.debian.org
References: <20190530190825.14580-1-eblake@redhat.com>
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
Message-ID: <5c971670-2fec-f26b-24c2-6c286c2250e9@redhat.com>
Date: Tue, 4 Jun 2019 12:38:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190530190825.14580-1-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RJ8Kofg4rw3RQUi47f4Y10njQdVLyvmj2"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 04 Jun 2019 17:38:52 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yXDCQqWs3bI.A.msF.8yq9cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/557
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5c971670-2fec-f26b-24c2-6c286c2250e9@redhat.com
Resent-Date: Tue,  4 Jun 2019 17:39:08 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RJ8Kofg4rw3RQUi47f4Y10njQdVLyvmj2
Content-Type: multipart/mixed; boundary="zv3WSZjSpUJQx5QqUJiQKYhOvTJbOg4BL";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Message-ID: <5c971670-2fec-f26b-24c2-6c286c2250e9@redhat.com>
Subject: Re: [PATCH] docs: Recommend TCP_NODELAY (disabling Nagle)
References: <20190530190825.14580-1-eblake@redhat.com>
In-Reply-To: <20190530190825.14580-1-eblake@redhat.com>

--zv3WSZjSpUJQx5QqUJiQKYhOvTJbOg4BL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 5/30/19 2:08 PM, Eric Blake wrote:
> This text from https://en.wikipedia.org/wiki/Nagle%27s_algorithm
> is telling:
>=20
> "In any request-response application protocols where request data can
> be larger than a packet, this can artificially impose a few hundred
> milliseconds latency between the requester and the responder, even if
> the requester has properly buffered the request data. Nagle's
> algorithm should be disabled by the requester in this case. If the
> response data can be larger than a packet, the responder should also
> disable Nagle's algorithm so the requester can promptly receive the
> whole response."
>=20
> And we hit it in real life with libnbd/nbdkit - more than an order of
> magnitude in slowdown results when trying to saturate a connection
> with as many parallel requests as possible when Nagle's algorithm
> introduces artificial delay waiting for the ACKs:
> https://www.redhat.com/archives/libguestfs/2019-May/msg00237.html
>=20
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  doc/proto.md | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Hearing no comments, I'll go ahead and push this.

>=20
> diff --git a/doc/proto.md b/doc/proto.md
> index 918e4ea..37156c9 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -64,6 +64,17 @@ client to communicate the options to the kernel whic=
h were negotiated
>  with the server during the handshake. This document does not describe
>  those.
>=20
> +When handling the client-side transmission phase with the Linux
> +kernel, the socket between the client and server can use either Unix
> +or TCP sockets. For other implementations, the client and server can
> +use any agreeable communication channel (a socket is typical, but it
> +is also possible to implement the NBD protocol over a pair of
> +uni-directional pipes). If TCP sockets are used, both the client and
> +server SHOULD disable Nagle's algorithm (that is, use `setsockopt` to
> +set the `TCP_NODELAY` option to non-zero), to eliminate artificial
> +delays waiting for ACK response that would otherwise arise when a
> +large message payload spans multiple network packets.
> +
>  ### Handshake
>=20
>  The handshake is the first phase of the protocol. Its main purpose is =
to
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--zv3WSZjSpUJQx5QqUJiQKYhOvTJbOg4BL--

--RJ8Kofg4rw3RQUi47f4Y10njQdVLyvmj2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlz2rKMACgkQp6FrSiUn
Q2qoRwgArGg6GiKe1JvV6OAiakbtr68eEMnISi+4kuPWbE2VjH8Iv51ObOqSSSys
uESzblcHg7947OqeLT5xAFp7MjLCmOQrO1z3+DLqswn9teqZWtrQ9ys3WUIy97GZ
s6RX1qSOf8okaXXxyNMDC5QF+WBrD/pFjs2X23xcV5Z1/6+0iCqnvQh6/oVxisGf
kvFrvXdLL/bWWQ04VT2OwaLDdPfVj5N36DbFnuEZH1eaoYQynHshRVtyTu9HKWqr
Dj3p1jNq2XuIaMdK6JNhwM7YV5TxRj6UN0bIMuaGiFEr6B8Naf/8DovOMMlYyaiq
ZKD6Nf3pVerPYe9BfvWOq4ngZmQ+tQ==
=Bnp0
-----END PGP SIGNATURE-----

--RJ8Kofg4rw3RQUi47f4Y10njQdVLyvmj2--

