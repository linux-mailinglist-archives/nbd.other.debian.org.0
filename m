Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AE58B55DE3
	for <lists+nbd@lfdr.de>; Wed, 26 Jun 2019 03:44:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 946AF20551; Wed, 26 Jun 2019 01:44:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 26 01:44:45 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F2CC620362
	for <lists-other-nbd@bendel.debian.org>; Wed, 26 Jun 2019 01:44:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cIh0_Mpy_Z_N for <lists-other-nbd@bendel.debian.org>;
	Wed, 26 Jun 2019 01:44:34 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B2610204F1
	for <nbd@other.debian.org>; Wed, 26 Jun 2019 01:44:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31EFA30821DF;
	Wed, 26 Jun 2019 01:44:30 +0000 (UTC)
Received: from [10.3.116.44] (ovpn-116-44.phx2.redhat.com [10.3.116.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAAEF5C1A1;
	Wed, 26 Jun 2019 01:44:28 +0000 (UTC)
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
To: Wouter Verhelst <wouter@grep.be>
Cc: Martin Kletzander <mkletzan@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org, w@uter.be,
 berrange@redhat.com
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com> <20190611142259.GG29602@wheatley>
 <cda4d898-39c7-1d76-8dd3-e0067d2cbce8@redhat.com>
 <20190611173543.msj6s6fwambak5wu@grep.be>
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
Message-ID: <d5c7b5ea-bef2-fa46-2206-8f0c2b464b49@redhat.com>
Date: Tue, 25 Jun 2019 20:44:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611173543.msj6s6fwambak5wu@grep.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Y0G6QLsAGPWgSnm5iGA1PiuXk6LasoR2c"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 26 Jun 2019 01:44:30 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sLX5V5gGbpH.A.CYB.N4sEdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/597
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d5c7b5ea-bef2-fa46-2206-8f0c2b464b49@redhat.com
Resent-Date: Wed, 26 Jun 2019 01:44:45 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Y0G6QLsAGPWgSnm5iGA1PiuXk6LasoR2c
Content-Type: multipart/mixed; boundary="iz2zOLWgi8zqDx4o0UFOaYzcdgGflSB55";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <wouter@grep.be>
Cc: Martin Kletzander <mkletzan@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org, w@uter.be,
 berrange@redhat.com
Message-ID: <d5c7b5ea-bef2-fa46-2206-8f0c2b464b49@redhat.com>
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com> <20190611142259.GG29602@wheatley>
 <cda4d898-39c7-1d76-8dd3-e0067d2cbce8@redhat.com>
 <20190611173543.msj6s6fwambak5wu@grep.be>
In-Reply-To: <20190611173543.msj6s6fwambak5wu@grep.be>

--iz2zOLWgi8zqDx4o0UFOaYzcdgGflSB55
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/11/19 12:35 PM, Wouter Verhelst wrote:

> I think you're overthinking it here. We could just say that a client
> which does not recognize a parameter should just balk? After all, a URI=

> is something that in most cases would be passed on the command line, or=

> some such; the feedback to the user would be fairly quick. Additionally=
,
> I can't think of any extra feature that we might want to add to the URL=

> but which might be optional...

And RFC 3986 states:

"   When presented with a URI that violates one or more scheme-specific
   restrictions, the scheme-specific resolution process should flag the
   reference as an error rather than ignore the unused parts; doing so
   reduces the number of equivalent URIs and helps detect abuses of the
   generic syntax, which might indicate that the URI has been
   constructed to mislead the user (Section 7.6).
"

So recommending that clients reject a URI they cannot recognize is sane.

It also turns out that RFC 3986 permits:

nbd:unix:/path/to/socket

as a valid URI in the nbd: scheme with no authority and a relative path
(different than nbd+unix:///export?socket=3D/path/to/socket as a URI with=

an empty authority).  However, I'd recommend that you document it as
being a scheme-specific restriction that we require the
scheme://[authority][/abs/path] form, especially since the former string
(used by qemu prior to the introduction of its nbd+unix: scheme) can end
up trying to connect over TCP to the export named 'unix:/path/to/socket'
on localhost port 10809 rather than the intended connection to the empty
string export at a Unix socket at '/path/to/socket'.

If you are using libxml2 xmlParseURI, you can tell the difference on
which form was used based on whether path is empty or begins with '/'
(good) vs. beginning with anything else, prior to the step where we
discard a leading '/'.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--iz2zOLWgi8zqDx4o0UFOaYzcdgGflSB55--

--Y0G6QLsAGPWgSnm5iGA1PiuXk6LasoR2c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl0SzfsACgkQp6FrSiUn
Q2qBwggAqUiZ/A5SKY2SMS2u6IAfKNH7TI5LpSdG4WgPq/sc8BzrGd1VDBwGnXZH
+M6+uBA0MBMkX6jtYWP5TWt29P6pPfcHGLXr6ie8cGuLMBuffT+Im7fzprAWLlJt
TrrbPc8pzWQuSmrbU6tuUuWrjIgmOl1x0AiLutu/RdoqwQFKz3sCr1n0Zpzn8gov
/zSSO51f9ND6Ej/E2IJW+4AAqVFo8vDW/rXdBFW5VohgSYSbcIWDFfpfuXnE7ud7
HTY5AWwt8/jYfEdq03Uf9JhAxnhik8nAOFoVf9NN0Ip8huOE5kYxBAaFQ9KfGWSh
acc0MUl6Tuk0U55rGH/cn91xFl7pFg==
=h7EL
-----END PGP SIGNATURE-----

--Y0G6QLsAGPWgSnm5iGA1PiuXk6LasoR2c--

