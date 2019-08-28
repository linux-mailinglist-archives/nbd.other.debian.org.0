Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CB068A0427
	for <lists+nbd@lfdr.de>; Wed, 28 Aug 2019 16:05:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 84B0D204AC; Wed, 28 Aug 2019 14:05:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 28 14:05:31 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6312120478
	for <lists-other-nbd@bendel.debian.org>; Wed, 28 Aug 2019 14:05:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IwydK9keAOb0 for <lists-other-nbd@bendel.debian.org>;
	Wed, 28 Aug 2019 14:05:16 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1F30020282
	for <nbd@other.debian.org>; Wed, 28 Aug 2019 14:05:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA59181129;
	Wed, 28 Aug 2019 14:05:12 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E5F15D6B0;
	Wed, 28 Aug 2019 14:05:07 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 0/5] Add NBD fast zero support to qemu client
 and server
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "libguestfs@redhat.com" <libguestfs@redhat.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <9d2ee7ad-a575-dc33-a7c7-dcaceea63792@virtuozzo.com>
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
Message-ID: <e0dd8b33-8711-8591-25f3-60ff626989b3@redhat.com>
Date: Wed, 28 Aug 2019 09:05:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9d2ee7ad-a575-dc33-a7c7-dcaceea63792@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="I9Jaf7Cxo1Cy6si1BfRsSYHzYBBmerqeM"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 28 Aug 2019 14:05:12 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qSCyHYHW7IN.A.I4D.rooZdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/657
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/e0dd8b33-8711-8591-25f3-60ff626989b3@redhat.com
Resent-Date: Wed, 28 Aug 2019 14:05:31 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--I9Jaf7Cxo1Cy6si1BfRsSYHzYBBmerqeM
Content-Type: multipart/mixed; boundary="sxdxhjp3YoqaiqLPWDoosiMeTVtq8x53N";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "libguestfs@redhat.com" <libguestfs@redhat.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>
Message-ID: <e0dd8b33-8711-8591-25f3-60ff626989b3@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 0/5] Add NBD fast zero support to qemu client
 and server
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <9d2ee7ad-a575-dc33-a7c7-dcaceea63792@virtuozzo.com>
In-Reply-To: <9d2ee7ad-a575-dc33-a7c7-dcaceea63792@virtuozzo.com>

--sxdxhjp3YoqaiqLPWDoosiMeTVtq8x53N
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/28/19 8:55 AM, Vladimir Sementsov-Ogievskiy wrote:
> 23.08.2019 17:37, Eric Blake wrote:
>> See the cross-post cover letter for more details:
>> https://www.redhat.com/archives/libguestfs/2019-August/msg00322.html
>>
>> Based-on: https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg048=
05.html
>> [Andrey Shinkevich block: workaround for unaligned byte range in fallo=
cate()]
>=20
> I assume, I can look at git://repo.or.cz/qemu/ericb.git fast-zero branc=
h?

Yes, I posted a fast-zero branch for all four projects that I touched
(with the obvious similar URLs). They might have non-fast-forward
changes as I rebase things (for example, the nbdkit stuff needs to
s/1.13.9/1.15.0/ in docs about which version introduced things), but
should be sufficient to reproduce experiments with the feature supported.=


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--sxdxhjp3YoqaiqLPWDoosiMeTVtq8x53N--

--I9Jaf7Cxo1Cy6si1BfRsSYHzYBBmerqeM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1mihIACgkQp6FrSiUn
Q2pzigf/dCScJNRFxs3jJbSAeoqaKWwyGFKKiMtuIZ2slOJRkXM7scMQWUyDdLFf
OLJ36NjX51aTo5pChRf72URUQSUiinffjmvn6aemJhBYx/tqWRGp03pQoXQpQ0LZ
W8307KWwvvWo3llD08BRLgtlbtthXCMkB3QVAB3LpGKkLKzhVki7kHCwgu/HioDa
RbjjgeejVltcRG478gH5zyVQYEWBcYF5hpq3xtrWZObdTG4TRNvnIKB7ONNqCr1k
thrfoQvOUOMeDaOGT9fe4yDWsAxiUao2WF8L7oEIuLiLZYn7gO5xr5LfvjUoG6sc
FY/jrk60hSudvKYZlOi1qWB0NMFXwA==
=JzmC
-----END PGP SIGNATURE-----

--I9Jaf7Cxo1Cy6si1BfRsSYHzYBBmerqeM--

