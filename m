Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 54003A411A
	for <lists+nbd@lfdr.de>; Sat, 31 Aug 2019 01:37:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2A18D2050D; Fri, 30 Aug 2019 23:37:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 30 23:37:49 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,PGPSIGNATURE,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4746920475
	for <lists-other-nbd@bendel.debian.org>; Fri, 30 Aug 2019 23:37:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-15.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id z3cUbphhC_db for <lists-other-nbd@bendel.debian.org>;
	Fri, 30 Aug 2019 23:37:38 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 26B6F20348
	for <nbd@other.debian.org>; Fri, 30 Aug 2019 23:37:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0980A3064FD3;
	Fri, 30 Aug 2019 23:37:35 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF98160BE1;
	Fri, 30 Aug 2019 23:37:31 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 2/5] nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 "libguestfs@redhat.com" <libguestfs@redhat.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <20190823143726.27062-3-eblake@redhat.com>
 <9476b1d1-47e4-ecfd-eb23-5b2fbc1410e3@virtuozzo.com>
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
Message-ID: <911ecfee-675a-da91-19ec-dd11d6d21e78@redhat.com>
Date: Fri, 30 Aug 2019 18:37:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9476b1d1-47e4-ecfd-eb23-5b2fbc1410e3@virtuozzo.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="46va6QQZhRXnzDASUGymO2IFKUF99XQLa"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 30 Aug 2019 23:37:35 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FKrQqjA4xKO.A.9JE.NNbadB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/671
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/911ecfee-675a-da91-19ec-dd11d6d21e78@redhat.com
Resent-Date: Fri, 30 Aug 2019 23:37:49 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--46va6QQZhRXnzDASUGymO2IFKUF99XQLa
Content-Type: multipart/mixed; boundary="eBaeapEhS0IQ8YsghDrEZ0NpdIhuPqJr2";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 "libguestfs@redhat.com" <libguestfs@redhat.com>,
 "nbd@other.debian.org" <nbd@other.debian.org>
Message-ID: <911ecfee-675a-da91-19ec-dd11d6d21e78@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 2/5] nbd: Prepare for NBD_CMD_FLAG_FAST_ZERO
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143726.27062-1-eblake@redhat.com>
 <20190823143726.27062-3-eblake@redhat.com>
 <9476b1d1-47e4-ecfd-eb23-5b2fbc1410e3@virtuozzo.com>
In-Reply-To: <9476b1d1-47e4-ecfd-eb23-5b2fbc1410e3@virtuozzo.com>

--eBaeapEhS0IQ8YsghDrEZ0NpdIhuPqJr2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/30/19 1:07 PM, Vladimir Sementsov-Ogievskiy wrote:
> 23.08.2019 17:37, Eric Blake wrote:
>> Commit fe0480d6 and friends added BDRV_REQ_NO_FALLBACK as a way to
>> avoid wasting time on a preliminary write-zero request that will later=

>> be rewritten by actual data, if it is known that the write-zero
>> request will use a slow fallback; but in doing so, could not optimize
>> for NBD.  The NBD specification is now considering an extension that
>> will allow passing on those semantics; this patch updates the new
>> protocol bits and 'qemu-nbd --list' output to recognize the bit, as
>> well as the new errno value possible when using the new flag; while
>> upcoming patches will improve the client to use the feature when
>> present, and the server to advertise support for it.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>

>> +++ b/nbd/server.c
>> @@ -55,6 +55,8 @@ static int system_errno_to_nbd_errno(int err)
>>           return NBD_ENOSPC;
>>       case EOVERFLOW:
>>           return NBD_EOVERFLOW;
>> +    case ENOTSUP:
>> +        return NBD_ENOTSUP;
>=20
> This may provoke returning NBD_ENOTSUP in other cases, not only new one=
 we are going to add.

Correct. But the spec only said SHOULD avoid ENOTSUP in those other
cases, not MUST avoid ENOTSUP; and in practice, either the client that
is not suspecting it will treat it the same as NBD_EINVAL, or we've
managed to get a slightly better error message across than normal.  I
don't see that as a real show-stopper.

But if it bothers you, note that in nbdkit, I actually coded things up
to refuse to send NBD_EOVERFLOW unless NBD_CMD_FLAG_DF was set, and to
refuse to send NBD_ENOTSUP unless NBD_CMD_FLAG_FAST_ZERO was set. I
could copy that behavior here, if we want qemu to be that much stricter
as a server.

(Note to self: also check if, when using structured replies to send
error messages, in addition to the code, if the string contains
strerror(errno) from BEFORE the mapping, rather than after we've lost
information to the more-limited NBD_E* values)

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--eBaeapEhS0IQ8YsghDrEZ0NpdIhuPqJr2--

--46va6QQZhRXnzDASUGymO2IFKUF99XQLa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1pszsACgkQp6FrSiUn
Q2o35Af+NRKl9YxnwATtHd3TublZrJG8XRR5EacPuwPRU7HwMvPq04QYV7VqsR0i
LJb0N+u2QuNc+DlboOR9JqJ+FZE/R9lTKCEWsgBQXMnKRy1JVeSxsEcJwCset5zm
9fS3DoYDa0tuczcDfjEBFdUoQfVFl36mVady8EgCLjOQ58YhZrfO5zHl8Q52V1NZ
IkfzM/Lc9nlJ/NmOz4EzssfPETFIH9DUPGEvF+RV6L0PiNKiVj7nz9cgiq1A8TRW
7qDJn4mGctIRSYBAEdTtdW0v5m9KmX88aI9PdL6co6r9qrZ8MlulCZyVC4IAe1xk
mylCc6fqTap4yGUv4+i4lnCN/NxuLA==
=n2dv
-----END PGP SIGNATURE-----

--46va6QQZhRXnzDASUGymO2IFKUF99XQLa--

