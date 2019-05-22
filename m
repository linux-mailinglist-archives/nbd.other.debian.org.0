Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C3B2656A
	for <lists+nbd@lfdr.de>; Wed, 22 May 2019 16:12:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 830D6205F2; Wed, 22 May 2019 14:12:00 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 22 14:12:00 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	PGPSIGNATURE,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9FEB4205DF
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 May 2019 14:11:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-17 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, PGPSIGNATURE=-5,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2Llmw2plDJrk for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 May 2019 14:11:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 30DAB205EC
	for <nbd@other.debian.org>; Wed, 22 May 2019 14:11:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E08633082E69;
	Wed, 22 May 2019 14:11:40 +0000 (UTC)
Received: from [10.3.116.56] (ovpn-116-56.phx2.redhat.com [10.3.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7691975E;
	Wed, 22 May 2019 14:11:37 +0000 (UTC)
Subject: Re: Standard NBD URL syntax (again)
To: "Richard W.M. Jones" <rjones@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, nbd@other.debian.org,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <20190520092056.GA9368@redhat.com>
 <20190521203036.GA24332@grep.be> <20190521212701.GS9582@redhat.com>
 <20190522064220.GB24332@grep.be>
 <CAMRbyytPDfg-usi20x_hua=x-48ceOKj3oaTGUK6oHpgnzDvpg@mail.gmail.com>
 <20190522095545.GY9582@redhat.com>
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
Message-ID: <f023df7a-0803-af53-eb46-e759a0961911@redhat.com>
Date: Wed, 22 May 2019 09:11:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522095545.GY9582@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xRrRJlp3AHeuEQktndywd1e7Qf5nvhx8x"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 22 May 2019 14:11:40 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_ypX13HjfjD.A.W4H.wiV5cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/513
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f023df7a-0803-af53-eb46-e759a0961911@redhat.com
Resent-Date: Wed, 22 May 2019 14:12:00 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xRrRJlp3AHeuEQktndywd1e7Qf5nvhx8x
Content-Type: multipart/mixed; boundary="CYhCi3dsykBldfDf4H39e30ARiakDj29s";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, nbd@other.debian.org,
 "Daniel P. Berrange" <berrange@redhat.com>
Message-ID: <f023df7a-0803-af53-eb46-e759a0961911@redhat.com>
Subject: Re: Standard NBD URL syntax (again)
References: <20190520092056.GA9368@redhat.com>
 <20190521203036.GA24332@grep.be> <20190521212701.GS9582@redhat.com>
 <20190522064220.GB24332@grep.be>
 <CAMRbyytPDfg-usi20x_hua=x-48ceOKj3oaTGUK6oHpgnzDvpg@mail.gmail.com>
 <20190522095545.GY9582@redhat.com>
In-Reply-To: <20190522095545.GY9582@redhat.com>

--CYhCi3dsykBldfDf4H39e30ARiakDj29s
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 5/22/19 4:55 AM, Richard W.M. Jones wrote:
> So last night I had an important thought about this:
>=20
>  * What existing export names are people using in real life?
>=20
> nbdkit doesn't use export names for anything - you can pass
> anything you like.
>=20
> qemu-nbd has an odd system where the export name must match what was
> specified on the command line, but AFAIK it doesn't care about it
> otherwise.

In the future, qemu-nbd may be taught to support multiple exports on a
single server. At which point export names matching will matter more.

>=20
> qemu's internal NBD server may permit multiple export names, but I'm
> not totally sure about that.  What do they look like?  Arbitrary
> strings?  Absolute paths?  Relative paths?

Whatever the caller wanted. In my work to add incremental backups to
libvirt, I create a single NBD server, then add one export per disk with
names chosen by libvirt, giving output such as:

# qemu-nbd --list -k /var/lib/libvirt/qemu/pull.sock
exports available: 2
 export: 'vda'
  size:  6442450944
  flags: 0x4ef ( readonly flush fua trim zeroes df cache )
  min block: 512
  opt block: 4096
  max block: 33554432
  available meta contexts: 1
   base:allocation
 export: 'vdb'
  size:  104857600
  flags: 0x4ef ( readonly flush fua trim zeroes df cache )
  min block: 512
  opt block: 4096
  max block: 33554432
  available meta contexts: 1
   base:allocation

But the point is they are arbitrary strings, not paths.

>=20
> nbd-server supports multiple export names, and it does appear to want
> absolute paths.  Can it use arbitrary strings too, or are absolute
> paths the only option?  How about relative paths?
>=20
> Basically, I think what we most commonly use export names for should
> influence how we decide to use them in URLs.

Right now, the NBD spec is silent on whether / is used in typical
pathname resolution style, or must be treated literally. And there are
enough uses out there that it may be hard to add semantics now other
than preserving things as a literal string (/ does not change
directories, // cannot be simplified to /, etc).

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--CYhCi3dsykBldfDf4H39e30ARiakDj29s--

--xRrRJlp3AHeuEQktndywd1e7Qf5nvhx8x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlzlWJgACgkQp6FrSiUn
Q2qKdAgAqCI3UzchqKKa5tOZ6sAiBNftpB07kV8ODEvpNX0QL7wfuSQKwlDBPHd3
2LudRgBJnik+HmRg1BQhfVJHs+gNwCI3ddTCihwLE4iG7l/ul43LlaD90Yj8T0ve
Dmt6hexcF0yzpSlsNP2cj5UmteeEaxNoIxBzSv/PE4v6RY1IHSmFRunz8aIz5rEq
8GsvPVqjX+BsxmIceN8CRcRs2l7Pnau0ikr2YbBZBVQlq13Fx3+IbDE+jfWtYHPr
WFmeOK+lWtY3/mR+U5MIfRFljLrOHDL20vmRzDG9g/YU/jxHLZ5R+hA18VtXhEm8
o6/sg0P7VD4JiS6tr0UzUfJDrfTsUg==
=ffhP
-----END PGP SIGNATURE-----

--xRrRJlp3AHeuEQktndywd1e7Qf5nvhx8x--

