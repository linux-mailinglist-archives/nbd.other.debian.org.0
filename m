Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B30A215138
	for <lists+nbd@lfdr.de>; Mon,  6 May 2019 18:28:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9FE3420846; Mon,  6 May 2019 16:28:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May  6 16:28:11 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3EBE5207DE
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 May 2019 16:28:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PgjCzlQsAZPc for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 May 2019 16:28:00 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1F15820772
	for <nbd@other.debian.org>; Mon,  6 May 2019 16:28:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2C6F30833A5
	for <nbd@other.debian.org>; Mon,  6 May 2019 16:27:56 +0000 (UTC)
Received: from [10.3.116.15] (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F44560852;
	Mon,  6 May 2019 16:27:54 +0000 (UTC)
Subject: Re: [Libguestfs] [nbdkit PATCH 3/7] RFC: protocol: Only send
 EOVERFLOW when valid
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: libguestfs@redhat.com, nbd@other.debian.org
References: <20190423005026.21496-1-eblake@redhat.com>
 <20190423005026.21496-4-eblake@redhat.com> <20190423073639.GE5429@redhat.com>
 <2155d05a-99ed-b1c6-0edc-553c4778e278@redhat.com>
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
Message-ID: <2805fc79-13f5-0afe-016e-0341ba0b6589@redhat.com>
Date: Mon, 6 May 2019 11:27:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2155d05a-99ed-b1c6-0edc-553c4778e278@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="otsmkwa9TJNTxmnO4Bao3OdPDAoWvwLMU"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 06 May 2019 16:27:56 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2LsRh3MBFqD.A.31.bCG0cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/490
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2805fc79-13f5-0afe-016e-0341ba0b6589@redhat.com
Resent-Date: Mon,  6 May 2019 16:28:11 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--otsmkwa9TJNTxmnO4Bao3OdPDAoWvwLMU
Content-Type: multipart/mixed; boundary="Ab8UZzw9EWyJBKEC4fiXOgzLbjRPwY42K";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: libguestfs@redhat.com, nbd@other.debian.org
Message-ID: <2805fc79-13f5-0afe-016e-0341ba0b6589@redhat.com>
Subject: Re: [Libguestfs] [nbdkit PATCH 3/7] RFC: protocol: Only send
 EOVERFLOW when valid
References: <20190423005026.21496-1-eblake@redhat.com>
 <20190423005026.21496-4-eblake@redhat.com> <20190423073639.GE5429@redhat.com>
 <2155d05a-99ed-b1c6-0edc-553c4778e278@redhat.com>
In-Reply-To: <2155d05a-99ed-b1c6-0edc-553c4778e278@redhat.com>

--Ab8UZzw9EWyJBKEC4fiXOgzLbjRPwY42K
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 4/23/19 7:38 AM, Eric Blake wrote:
> [adding NBD list]
>=20
> On 4/23/19 2:36 AM, Richard W.M. Jones wrote:
>> On Mon, Apr 22, 2019 at 07:50:22PM -0500, Eric Blake wrote:
>>> Previously, we were squashing EOVERFLOW into EINVAL; continue to do s=
o
>>> at points in the protocol where the client may not be expecting
>>> EOVERFLOW.
>=20
>>
>> The protocol spec is unclear on whether EOVERFLOW can be returned in
>> cases other than the DF flag being set.  Whether we include this patch=

>> or not seems to hinge on the interpretation of the protocol spec which=

>> I'm not really in a position to make.

=2E..

>=20
> So the question at hand is whether I should patch the NBD spec to
> recommend that a server SHOULD NOT send EOVERFLOW except in response to=

> NBD_CMD_READ when the NBD_CMD_FLAG_DF bit is set (similar to my propose=
d
> wording that a server SHOULD NOT send ENOTSUP except in response to
> NBD_CMD_FLAG_FAST_ZERO).

As I have now pushed my proposed changes to the NBD spec to clarify
this, I am also pushing the nbdkit patch to handle EOVERFLOW only when
NBD_CMD_FLAG_DF is in use.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--Ab8UZzw9EWyJBKEC4fiXOgzLbjRPwY42K--

--otsmkwa9TJNTxmnO4Bao3OdPDAoWvwLMU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlzQYIkACgkQp6FrSiUn
Q2ppsQf9Gurisi2zTHwOUQBOnnF43H390a+GsTXOs/8wVSyw9O+DQfSrRT14Mv4N
M9wCDK2CiBmQs8sa2OSVQZoiq3EVg8uNb9+2/kANYvOAODEsf0rp4OYTRpOnNyza
RxWtMMAj7sEVQVoDNoGL/y7DQAxOSw29xk5+hve6IJeo4FBdMQFHVjFnRQq2GRin
WJBvJZOhV3QvNV3xwCiDhCM/UDPOBW1H36+aHAkQeYhABPbVORN80gYLpCUi8Qy8
MZ+NvLPmf4XrbJzSdE+ejnVjJ8XHqZXaBl93jYoiaIvX5R0mXH6m86Z7cgrk2ueM
gvwkMFZsADJUbeTHH1BSRQ+ILUiMcQ==
=OqZk
-----END PGP SIGNATURE-----

--otsmkwa9TJNTxmnO4Bao3OdPDAoWvwLMU--

