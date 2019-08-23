Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C8F9B80F
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 23:16:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 366A2204EF; Fri, 23 Aug 2019 21:16:38 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 21:16:38 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 67DFC204D9
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 21:16:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aHEPAnNZ9rbE for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 21:16:27 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 25F61204CC
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 21:16:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D84CD3082D9E;
	Fri, 23 Aug 2019 21:16:23 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3FC91001284;
	Fri, 23 Aug 2019 21:16:19 +0000 (UTC)
Subject: Re: [Libguestfs] [nbdkit PATCH 3/3] plugins: Add .can_fast_zero hook
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, nbd@other.debian.org
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823144054.27420-1-eblake@redhat.com>
 <20190823144054.27420-4-eblake@redhat.com>
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
Message-ID: <0f743b37-6308-24d0-eae0-5f939af9dae2@redhat.com>
Date: Fri, 23 Aug 2019 16:16:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823144054.27420-4-eblake@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eXYbbBvIJTxpYUqAQfsoypeWf7DejGVhK"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 23 Aug 2019 21:16:23 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gtq-BU4gOMC.A.x7H.2eFYdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/649
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0f743b37-6308-24d0-eae0-5f939af9dae2@redhat.com
Resent-Date: Fri, 23 Aug 2019 21:16:38 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eXYbbBvIJTxpYUqAQfsoypeWf7DejGVhK
Content-Type: multipart/mixed; boundary="0qmAS2y8KMZdV53c81xIWwAhFPnUp50lQ";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, nbd@other.debian.org
Message-ID: <0f743b37-6308-24d0-eae0-5f939af9dae2@redhat.com>
Subject: Re: [Libguestfs] [nbdkit PATCH 3/3] plugins: Add .can_fast_zero hook
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823144054.27420-1-eblake@redhat.com>
 <20190823144054.27420-4-eblake@redhat.com>
In-Reply-To: <20190823144054.27420-4-eblake@redhat.com>

--0qmAS2y8KMZdV53c81xIWwAhFPnUp50lQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/23/19 9:40 AM, Eric Blake wrote:
> Allow plugins to affect the handling of the new NBD_CMD_FLAG_FAST_ZERO
> flag, then update affected plugins.  In particular, in-memory plugins
> are always fast; the full plugin is better served by omitting .zero
> and relying on .pwrite fallback; nbd takes advantage of libnbd
> extensions proposed in parallel to pass through support; and
> v2 language bindings expose the choice to their scripts.
>=20

> +++ b/server/plugins.c
> @@ -404,11 +404,25 @@ plugin_can_zero (struct backend *b, struct connec=
tion *conn)
>  static int
>  plugin_can_fast_zero (struct backend *b, struct connection *conn)
>  {
> +  struct backend_plugin *p =3D container_of (b, struct backend_plugin,=
 backend);
> +  int r;
> +
>    assert (connection_get_handle (conn, 0));
>=20
>    debug ("can_fast_zero");
>=20
> -  return 0; /* Upcoming patch will actually add support. */
> +  if (p->plugin.can_fast_zero)
> +    return p->plugin.can_fast_zero (connection_get_handle (conn, 0));
> +  /* Advertise support for fast zeroes if no .zero or .can_zero is
> +   * false: in those cases, we fail fast instead of using .pwrite.
> +   * This also works when v1 plugin has only ._zero_old.
> +   */
> +  if (p->plugin.zero =3D=3D NULL)
> +    return 1;
> +  r =3D plugin_can_zero (b, conn);
> +  if (r =3D=3D -1)
> +    return -1;
> +  return !r;
>  }
>=20

Needs this squashed in for libnbd to pass rather than skip its new
'can-fast-zero-flag' test:


diff --git i/server/plugins.c w/server/plugins.c
index 84329cf4..695a77ab 100644
--- i/server/plugins.c
+++ w/server/plugins.c
@@ -208,6 +208,7 @@ plugin_dump_fields (struct backend *b)
   HAS (can_cache);
   HAS (cache);
   HAS (thread_model);
+  HAS (can_fast_zero);
 #undef HAS

   /* Custom fields. */


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--0qmAS2y8KMZdV53c81xIWwAhFPnUp50lQ--

--eXYbbBvIJTxpYUqAQfsoypeWf7DejGVhK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1gV6IACgkQp6FrSiUn
Q2pzvQf/cfNQ7g1RZfUxUI16kEkNzxpc7agCkznqsk7hJqz7Nj5vOPMGsCt3lldK
AFLU5FB8BG0M2K+nEQcEHcMzIKuxi7FWFRZIC+sCQs835uurJcUixRI0uw+3SBUB
EEJwXZc6hr4SCXrbckIyFD8ZD9HZZkCuQRmzJnAssM/Q0dsZ6iVwtdOAcLEeByV3
mD1uiXYq2SENXLCM0vkcjwSMIJwMhnHG6E68/gNy/AWg+//zyZRqxOlUNsBvlbjS
3ejiTuylA2cyfU18V4aISVQVgBQ0tlTDTryEcQxLCfw7+jFDo+G246Vc/fRfLTrY
iPU96F0R1q7Ml4YJlmIjnXtrk0saaw==
=l5dh
-----END PGP SIGNATURE-----

--eXYbbBvIJTxpYUqAQfsoypeWf7DejGVhK--

