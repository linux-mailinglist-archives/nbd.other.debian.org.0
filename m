Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F51FE78
	for <lists+nbd@lfdr.de>; Tue, 30 Apr 2019 19:07:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 10E0820421; Tue, 30 Apr 2019 17:07:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 30 17:07:14 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,PGPSIGNATURE,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9B2F5203E8
	for <lists-other-nbd@bendel.debian.org>; Tue, 30 Apr 2019 17:07:06 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5, PGPSIGNATURE=-5,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id squ66yM3JxgR for <lists-other-nbd@bendel.debian.org>;
	Tue, 30 Apr 2019 17:07:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D4B12203ED
	for <nbd@other.debian.org>; Tue, 30 Apr 2019 17:07:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56CA12D7F9
	for <nbd@other.debian.org>; Tue, 30 Apr 2019 17:06:53 +0000 (UTC)
Received: from [10.3.116.15] (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D73BE906B;
	Tue, 30 Apr 2019 17:06:51 +0000 (UTC)
Subject: Re: Requirements for an NBD client library in userspace
To: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org
Cc: mkletzan@redhat.com
References: <20190430124626.GA11138@redhat.com>
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
Message-ID: <b7a100c8-d46e-7b5f-9b33-d8a18e7f60e4@redhat.com>
Date: Tue, 30 Apr 2019 12:06:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430124626.GA11138@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zxHW7TfdoSfWXwKy4zzgBsm37yRqljnpz"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 30 Apr 2019 17:06:53 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GRRppGRAIUF.A.-nB.CDIycB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/485
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b7a100c8-d46e-7b5f-9b33-d8a18e7f60e4@redhat.com
Resent-Date: Tue, 30 Apr 2019 17:07:14 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zxHW7TfdoSfWXwKy4zzgBsm37yRqljnpz
Content-Type: multipart/mixed; boundary="rKubccd0TO33kpc9rmMxONpioQdW57V3J";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org
Cc: mkletzan@redhat.com
Message-ID: <b7a100c8-d46e-7b5f-9b33-d8a18e7f60e4@redhat.com>
Subject: Re: Requirements for an NBD client library in userspace
References: <20190430124626.GA11138@redhat.com>
In-Reply-To: <20190430124626.GA11138@redhat.com>

--rKubccd0TO33kpc9rmMxONpioQdW57V3J
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 4/30/19 7:46 AM, Richard W.M. Jones wrote:
> I believe there is no simple NBD client library.  Am I wrong about
> this?  Let's assume I'm not for the sake of the rest of this email ...
>=20
> We do however have at least 4 places this could be consumed if it exist=
ed:
>=20
>  - fio's proposed NBD engine
>    https://www.spinics.net/lists/fio/msg07831.html
>=20
>  - nbdkit-nbd-plugin
>    https://github.com/libguestfs/nbdkit/tree/master/plugins/nbd
>=20
>  - Martin K's forthcoming VMware liberation tool
>=20
>  - qemu, maybe?
>    https://github.com/qemu/qemu/blob/master/block/nbd-client.c
>=20
> In this email I'm trying to assemble some requirements for such a
> library, and I've also attempted to categorize them according to how
> difficult they might be to implement.  I guess everyone will have
> their own opinions on which features are most "required" and which are
> optional, but I've added mine below too.

Looks like a decent start at thinking about the issue.

>=20
> Did I miss out anything?
>=20
> 1 =3D easy to implement  ...  5 =3D hard to implement
> |
> | R* =3D required, library could not be used without it
> | R  =3D required
> | O+ =3D optional, but very useful for many users
> | O  =3D optional
> | O- =3D optional, not likely to be useful for many users
> | |
> v v
>=20
> 1 R*   Library which runs in userspace, callable from C programs
>=20
> 3 O+   Callable from other programming languages, eg Python etc.
>=20
> 1 R*   Connect to Unix domain socket
>=20
> 1 R*   Connect to TCP port
>=20
> 1 R    Connect to TCP port over IPv6
>=20
> 1 O-   Connect to arbitrary file descriptor [eg. for nbdkit -s]

Or even arbitrary pair of file descriptors (input and output might be
the same fd as for socketpair(), or might be distinct fds as for a pair
of pipe()s)

>=20
> 2 R    Synchronous support for easy initial use
>=20
> 5 O+   Non-blocking/asynch support, use with select/poll
>=20
> 4 O+   Integrates with external main loops, glib2, APR pollset, etc.
>=20
> 4 O    TLS support using X.509 certs
>=20
> 4 O    TLS-PSK support
>=20
> 5 O    NBD MULTI_CONN
>=20
> 5 O    NBD out of order requests on single socket
>=20
> 2 O-   Old-style protocol
>=20
> 3 R    NBD_OPT_INFO mode [required for qemu]
>=20
> 5 O    NBD structured replies
>=20
> 3 O+   NBD block status querying

via the NBD standard "base:allocation"

4 O-  alternative NBD block status querying (basically, passthrough of
any other NBD_OPT_SET_META_CONTEXT context beyond "base:allocation")

>=20
> ? ?    NBD resize extension

3 O   NBD_INFO_BLOCK_SIZE support (honoring any constraints advertised
by the server)

4 O   User-space handshake, handing off to kernel nbd module for
transmission phase on /dev/nbdN

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--rKubccd0TO33kpc9rmMxONpioQdW57V3J--

--zxHW7TfdoSfWXwKy4zzgBsm37yRqljnpz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlzIgKoACgkQp6FrSiUn
Q2qTDggAnyxIWed4nwgseyAPwJSI8JeT9oTmXffcZgrgmc0JjN9078ttxkUqaeY2
2bmsCMD1UnNckxh0CJLRCNX5t/aIWDkfBlNvex0U83/fg9b6m/kwFUYt5OUW7o4v
bgebW7IA/DkHnkNu3F02Y+xy0KVEAwFEPJFZtMzzleEIbJsjcA/2PWIDib6sn+a6
7G5SZNwd6I+O5ib7LB4RbTlY6Zr/V0abBxspKVQ/SiSBGH9TFaaQ4RLdcWTdHTDE
J85yDRiPebp6HOGai0JSdF1j+dPEKrxhGWolfJNe3neuk8KHLQ93E3txpOOiSmsJ
SSFV0ewMtw94AtcxM4Tr8ZhRc5NByg==
=1qW1
-----END PGP SIGNATURE-----

--zxHW7TfdoSfWXwKy4zzgBsm37yRqljnpz--

