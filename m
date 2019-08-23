Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AAB9B688
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 20:59:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 41F59204CE; Fri, 23 Aug 2019 18:59:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 18:59:02 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7247420487
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 18:58:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Iu2tuqSmBham for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 18:58:51 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5A77A2010A
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 18:58:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F21213175285;
	Fri, 23 Aug 2019 18:58:47 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8027F600C1;
	Fri, 23 Aug 2019 18:58:44 +0000 (UTC)
Subject: Re: [PATCH 1/1] protocol: Add NBD_CMD_FLAG_FAST_ZERO
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 libguestfs@redhat.com
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143426.26838-1-eblake@redhat.com>
 <20190823143426.26838-2-eblake@redhat.com>
 <20190823184834.brhsfbc4sdq5xuij@grep.be>
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
Message-ID: <d3d1590e-e276-e449-c3da-0bdc4d4977d7@redhat.com>
Date: Fri, 23 Aug 2019 13:58:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823184834.brhsfbc4sdq5xuij@grep.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EH2bSYSWGcIkMUKvlAApzOkXl3E28Wsmi"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 23 Aug 2019 18:58:48 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hJuhnNCIFtG.A.5v.2dDYdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/647
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/d3d1590e-e276-e449-c3da-0bdc4d4977d7@redhat.com
Resent-Date: Fri, 23 Aug 2019 18:59:02 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EH2bSYSWGcIkMUKvlAApzOkXl3E28Wsmi
Content-Type: multipart/mixed; boundary="4aDRVcsv1YZBCvrlCxWe9GiPmIO2C73z2";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 libguestfs@redhat.com
Message-ID: <d3d1590e-e276-e449-c3da-0bdc4d4977d7@redhat.com>
Subject: Re: [PATCH 1/1] protocol: Add NBD_CMD_FLAG_FAST_ZERO
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143426.26838-1-eblake@redhat.com>
 <20190823143426.26838-2-eblake@redhat.com>
 <20190823184834.brhsfbc4sdq5xuij@grep.be>
In-Reply-To: <20190823184834.brhsfbc4sdq5xuij@grep.be>

--4aDRVcsv1YZBCvrlCxWe9GiPmIO2C73z2
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/23/19 1:48 PM, Wouter Verhelst wrote:
> On Fri, Aug 23, 2019 at 09:34:26AM -0500, Eric Blake wrote:
>> +- bit 4, `NBD_CMD_FLAG_FAST_ZERO`; valid during
>> +  `NBD_CMD_WRITE_ZEROES`. If set, but the server cannot perform the
>> +  write zeroes any faster than it would for an equivalent
>> +  `NBD_CMD_WRITE`,
>=20
> One way of fulfilling the letter of this requirement but not its spirit=

> could be to have background writes; that is, the server makes a note
> that the zeroed region should contain zeroes, makes an error-free reply=

> to the client, and then starts updating things in the background (with
> proper layering so that an NBD_CMD_READ would see zeroes).

For writes, this should still be viable IF the server can also cancel
that background write of zeroes in favor of a foreground request for
actual data to be written to the same offset.  In other words, as long
as the behavior to the client is "as if" there is no duplicated I/O
cost, the zero appears fast, even if it kicked off a long-running async
process to actually accomplish it.

>=20
> This could negatively impact performance after that command to the
> effect that syncing the device would be slower rather than faster, if
> not done right.

Oh. I see - for flush requests, you're worried about the cost of the
flush forcing the I/O for the background zero to complete before flush
can return.

Perhaps that merely means that a client using fast zero requests as a
means of probing whether it can do a bulk pre-zero pass even though it
will be rewriting part of that image with data later SHOULD NOT attempt
to flush the disk until all other interesting write requests are also
ready to queue.  In the 'qemu-img convert' case which spawned this
discussion, that's certainly the case (qemu-img does not call flush
after the pre-zeroing, but only after all data is copied - and then it
really DOES want to wait for any remaining backgrounded zeroing to land
on the disk along with any normal writes when it does its final flush).

>=20
> Do we want to keep that in consideration?

Ideas on how best to add what I mentioned above into the specification?

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--4aDRVcsv1YZBCvrlCxWe9GiPmIO2C73z2--

--EH2bSYSWGcIkMUKvlAApzOkXl3E28Wsmi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1gN2QACgkQp6FrSiUn
Q2riDwgApROHFJjgCRdVzWdGKJNRQP7KYEVqLDLMxff7YzQb00gwnr2ig7xcd0QM
4LwN6f1FKCMDWFoLdLn5nA8LCCfKJl6Hu7YrLQZfRzWMb0gQSnNwdrWXDQgYY8CQ
dwmbKx9H3cZrK6Nm2fCCtCHNnufj9rxaSPeHu+lelRZWgW7qraJOfvIl0PjL7DrS
pot+1o1ZUoJZtxYeFuOb9C0v6SNUu2ELseLBKSJNQsCVTO6TH+A3hFePC6H8Vl7n
9d4YGNg4fIevreg749HxF8Bb2aedNnmTAYuz+aeS/IeyuMacv9t+UEebhtC5bhhz
tGMY1zmsBF54h+Y/tq3fCFsuFIqPGw==
=muzs
-----END PGP SIGNATURE-----

--EH2bSYSWGcIkMUKvlAApzOkXl3E28Wsmi--

