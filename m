Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B9F1CBB5
	for <lists+nbd@lfdr.de>; Tue, 14 May 2019 17:20:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 25BD020810; Tue, 14 May 2019 15:20:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 14 15:20:16 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,PGPSIGNATURE,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E4F7520800
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 May 2019 15:20:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-16.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BUJX9JS0zQDG for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 May 2019 15:20:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 306DE207F6
	for <nbd@other.debian.org>; Tue, 14 May 2019 15:20:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D24B81E0D;
	Tue, 14 May 2019 15:20:00 +0000 (UTC)
Received: from [10.3.116.15] (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC4B860BCF;
	Tue, 14 May 2019 15:19:53 +0000 (UTC)
Subject: Re: [Libguestfs] [nbdkit PATCH 3/7] RFC: protocol: Only send
 EOVERFLOW when valid
To: Wouter Verhelst <w@uter.be>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, libguestfs@redhat.com,
 nbd@other.debian.org
References: <20190423005026.21496-1-eblake@redhat.com>
 <20190423005026.21496-4-eblake@redhat.com> <20190423073639.GE5429@redhat.com>
 <2155d05a-99ed-b1c6-0edc-553c4778e278@redhat.com>
 <20190511225132.GB3801@grep.be>
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
Message-ID: <56fd41ce-620f-04dc-b98e-3807e6386752@redhat.com>
Date: Tue, 14 May 2019 10:19:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190511225132.GB3801@grep.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vbZmuSzJZAq8A9DwHfbZ4fGShO7WlyzEf"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 14 May 2019 15:20:00 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nZqpbVUoM0E.A.cRC.wyt2cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/498
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/56fd41ce-620f-04dc-b98e-3807e6386752@redhat.com
Resent-Date: Tue, 14 May 2019 15:20:16 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vbZmuSzJZAq8A9DwHfbZ4fGShO7WlyzEf
Content-Type: multipart/mixed; boundary="824jU7oR1SbPjCM5ggegoc5CmoB9fCJWW";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, libguestfs@redhat.com,
 nbd@other.debian.org
Message-ID: <56fd41ce-620f-04dc-b98e-3807e6386752@redhat.com>
Subject: Re: [Libguestfs] [nbdkit PATCH 3/7] RFC: protocol: Only send
 EOVERFLOW when valid
References: <20190423005026.21496-1-eblake@redhat.com>
 <20190423005026.21496-4-eblake@redhat.com> <20190423073639.GE5429@redhat.com>
 <2155d05a-99ed-b1c6-0edc-553c4778e278@redhat.com>
 <20190511225132.GB3801@grep.be>
In-Reply-To: <20190511225132.GB3801@grep.be>

--824jU7oR1SbPjCM5ggegoc5CmoB9fCJWW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 5/11/19 5:51 PM, Wouter Verhelst wrote:

>=20
> OTOH, for backcompat reasons it is reasonable to state that older
> versions of nbd-server could send pretty much anything over the wire[1]=
,
> and that clients should therefore treat any nonzero value as an unknown=

> error.
>=20
> I think that might also be a correct way to deal with error numbers in
> cases where the client does not know what to do with it.
>=20
> [1] I originally thought that errno values were way more standardized
> than they happen to be in practice, and so the initial error handling i=
n
> nbd-server just sent the value of errno, whatever it happened to be,
> over the wire. That worked just fine if client and server were the same=

> platform -- and more so since all the client would ever do when it saw
> an error was yell "the server sent error code X" and abort, so that the=

> actual error number didn't even matter -- but it obviously wasn't ideal=
;
> and when we chose the error values that got written in stone, we chose
> the errno values that Linux/x86 uses for the types of errors that seeme=
d
> reasonable. What older servers sent is however not really defined, and
> therefore should be treated as nasal daemons.
>=20
> [...]
>> SHOULD NOT rather than MUST NOT, as a server may still choose to expos=
e
>> non-standard errors over the wire if a client might benefit from those=

>> errors, and a well-written client will squash non-standard errors
>> received over the wire back to EINVAL.
>=20
> Indeed; I think that is what we should do.
>=20
>> So the question at hand is whether I should patch the NBD spec to
>> recommend that a server SHOULD NOT send EOVERFLOW except in response t=
o
>> NBD_CMD_READ when the NBD_CMD_FLAG_DF bit is set (similar to my propos=
ed
>> wording that a server SHOULD NOT send ENOTSUP except in response to
>> NBD_CMD_FLAG_FAST_ZERO).
>=20
> I think we can say that, but we should definitely also say that a clien=
t
> should treat unknown errors in a particular way. Possibly "abort the
> connection and give up", but something.
>=20

I think enough existing clients just silently treat unknown server
errors as EINVAL to make that worth specifying (as a SHOULD, rather than
MUST), rather than aborting the connection. So I wend ahead and added
this sentence on top of my other changes:

+The client SHOULD treat an unexpected error value as if it had been
+`NBD_EINVAL`, rather than disconnecting from the server.
+


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--824jU7oR1SbPjCM5ggegoc5CmoB9fCJWW--

--vbZmuSzJZAq8A9DwHfbZ4fGShO7WlyzEf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAlza3JgACgkQp6FrSiUn
Q2qYQAf/fPPoSlLGB//kdi2wMxDVZ9WAhnPtF+KfgJBHB3nbl1xlmICZti7Ztr34
k307ZBVfSjfMCu3PGPN8RX6Sd9fPpI1bmtwnIy2JfYeCh2wTlsl14dEzam21TY6r
w4FLZ/y6UNw00X9BM3hfvth5i9Xhr6ladtwv+H2kf5CvDcjebC2MLQg+BLT+u5Op
rrEI5BnuKpq2Cql6izYOq3/z46JDoDyRjCybxSCQHbq++dEXWid158A1GQPJOSHn
xlCtXzPcai/a0OxZLRfL73v5kNpIZYIRhhxeoxn/836f7Taqtpi5lHCu0W8aAqsy
+fRrWNJJk/OQ/lMlfrK+Y0sqWhjhtA==
=yG+t
-----END PGP SIGNATURE-----

--vbZmuSzJZAq8A9DwHfbZ4fGShO7WlyzEf--

