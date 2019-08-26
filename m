Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBFC9D2D0
	for <lists+nbd@lfdr.de>; Mon, 26 Aug 2019 17:30:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8894520415; Mon, 26 Aug 2019 15:30:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 26 15:30:56 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,PGPSIGNATURE,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 29FEF2040E
	for <lists-other-nbd@bendel.debian.org>; Mon, 26 Aug 2019 15:30:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-15.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3eUuQIq8Ozl5 for <lists-other-nbd@bendel.debian.org>;
	Mon, 26 Aug 2019 15:30:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1FB0820415
	for <nbd@other.debian.org>; Mon, 26 Aug 2019 15:30:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45EA77BDA0;
	Mon, 26 Aug 2019 15:30:40 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75C0F104B511;
	Mon, 26 Aug 2019 15:30:39 +0000 (UTC)
Subject: Re: [PATCH 1/1] protocol: Add NBD_CMD_FLAG_FAST_ZERO
To: Wouter Verhelst <wouter@grep.be>
Cc: Wouter Verhelst <w@uter.be>, nbd@other.debian.org
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143426.26838-1-eblake@redhat.com>
 <20190823143426.26838-2-eblake@redhat.com>
 <20190823184834.brhsfbc4sdq5xuij@grep.be>
 <d3d1590e-e276-e449-c3da-0bdc4d4977d7@redhat.com>
 <20190824064448.q62iwelqjn2safao@grep.be>
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
Message-ID: <8733bcee-6a48-a0b0-c919-82046a30c026@redhat.com>
Date: Mon, 26 Aug 2019 10:30:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190824064448.q62iwelqjn2safao@grep.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4ytvYVWHqTxyWzUFXxN0dFhlmAAh0OX6D"
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 26 Aug 2019 15:30:40 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0aXcm6W8cbG.A.YLD.ws_YdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/651
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/8733bcee-6a48-a0b0-c919-82046a30c026@redhat.com
Resent-Date: Mon, 26 Aug 2019 15:30:56 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4ytvYVWHqTxyWzUFXxN0dFhlmAAh0OX6D
Content-Type: multipart/mixed; boundary="UyVRduid6KyXh5SMHMVWREbWtlpcyETDc";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <wouter@grep.be>
Cc: Wouter Verhelst <w@uter.be>, nbd@other.debian.org
Message-ID: <8733bcee-6a48-a0b0-c919-82046a30c026@redhat.com>
Subject: Re: [PATCH 1/1] protocol: Add NBD_CMD_FLAG_FAST_ZERO
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143426.26838-1-eblake@redhat.com>
 <20190823143426.26838-2-eblake@redhat.com>
 <20190823184834.brhsfbc4sdq5xuij@grep.be>
 <d3d1590e-e276-e449-c3da-0bdc4d4977d7@redhat.com>
 <20190824064448.q62iwelqjn2safao@grep.be>
In-Reply-To: <20190824064448.q62iwelqjn2safao@grep.be>

--UyVRduid6KyXh5SMHMVWREbWtlpcyETDc
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

[dropping other lists for now]

On 8/24/19 1:44 AM, Wouter Verhelst wrote:

>>> One way of fulfilling the letter of this requirement but not its spir=
it
>>> could be to have background writes; that is, the server makes a note
>>> that the zeroed region should contain zeroes, makes an error-free rep=
ly
>>> to the client, and then starts updating things in the background (wit=
h
>>> proper layering so that an NBD_CMD_READ would see zeroes).
>>
>> For writes, this should still be viable IF the server can also cancel
>> that background write of zeroes in favor of a foreground request for
>> actual data to be written to the same offset.  In other words, as long=

>> as the behavior to the client is "as if" there is no duplicated I/O
>> cost, the zero appears fast, even if it kicked off a long-running asyn=
c
>> process to actually accomplish it.
>=20
> That's kind of what I was thinking of, yeah.
>=20
> A background write would cause disk I/O, which *will* cause any write
> that happen concurrently with it to slow down. If we need to write
> several orders of magnitude of zeroes, then the "fast zero" will
> actually cause the following writes to slow down, which could impact
> performance.
>=20
> The cancelling should indeed happen (otherwise ordering of writes will
> be wrong, as per the spec), but that doesn't negate the performance
> impact.
>=20
>>> This could negatively impact performance after that command to the
>>> effect that syncing the device would be slower rather than faster, if=

>>> not done right.
>>
>> Oh. I see - for flush requests, you're worried about the cost of the
>> flush forcing the I/O for the background zero to complete before flush=

>> can return.
>>
>> Perhaps that merely means that a client using fast zero requests as a
>> means of probing whether it can do a bulk pre-zero pass even though it=

>> will be rewriting part of that image with data later SHOULD NOT attemp=
t
>> to flush the disk until all other interesting write requests are also
>> ready to queue.  In the 'qemu-img convert' case which spawned this
>> discussion, that's certainly the case (qemu-img does not call flush
>> after the pre-zeroing, but only after all data is copied - and then it=

>> really DOES want to wait for any remaining backgrounded zeroing to lan=
d
>> on the disk along with any normal writes when it does its final flush)=
=2E
>=20
> Not what I meant, but also a good point, thanks :)
>=20
>>> Do we want to keep that in consideration?
>>
>> Ideas on how best to add what I mentioned above into the specification=
?
>=20
> Perhaps clarify that the "fast zero" flag is meant to *improve*
> performance, and that it therefore should either be implemented in a wa=
y
> that does in fact improve performance, or not at all?
>=20

Here's the wording changes I'm considering (ragged lines to minimize
churn; I can reflow the existing paragraph if we like it):

diff --git i/doc/proto.md w/doc/proto.md
index 914910f..b98a455 100644
--- i/doc/proto.md
+++ w/doc/proto.md
@@ -2054,7 +2054,7 @@ The following request types exist:
     `NBD_ENOTSUP` unless the request can be serviced in less time than
     a corresponding `NBD_CMD_WRITE`, and SHOULD NOT alter the contents
     of the export when returning this failure. The server's
-    determination of a fast request MAY depend on a number of factors,
+    determination on whether to fail a fast request MAY depend on a
number of factors,
     such as whether the request was suitably aligned, on whether the
     `NBD_CMD_FLAG_NO_HOLE` flag was present, or even on whether a
     previous `NBD_CMD_TRIM` had been performed on the region.  If the
@@ -2062,12 +2062,30 @@ The following request types exist:
     NOT fail with `NBD_ENOTSUP`, regardless of the speed of servicing
     a request, and SHOULD fail with `NBD_EINVAL` if the
     `NBD_CMD_FLAG_FAST_ZERO` flag was set. A server MAY advertise
-    `NBD_FLAG_SEND_FAST_ZERO` whether or not it can perform fast
-    zeroing; similarly, a server SHOULD fail with `NBD_ENOTSUP` when
-    the flag is set if the server cannot quickly determine in advance
-    whether that request would have been fast, even if it turns out
+    `NBD_FLAG_SEND_FAST_ZERO` whether or not it will actually succeed
+    on a fast zero request (a fast failure of `NBD_ENOTSUP` still
+    counts as a fast response); similarly, a server SHOULD fail a fast
+    zero request with `NBD_ENOTSUP` if the server cannot quickly
determine in advance
+    whether the request would be fast, even if it turns out
     that the same request without the flag would be fast after all.

+    One intended use of a fast zero request is optimizing the copying
+    of a sparse image source into the export: a client can request
+    fast zeroing of the entire export, and if it succeeds, follow that
+    with write requests to just the data portions before a single
+    flush of the entire image, for fewer transactions overall.  On the
+    other hand, if the fast zero request fails, the fast failure lets
+    the client know that it must manually write zeroes corresponding
+    to the holes of the source image before a final flush, for more
+    transactions but with no time lost to duplicated I/O to the data
+    portions.  Knowing this usage pattern can help decide whether a
+    server's implementation for writing zeroes counts as fast (for
+    example, a successful fast zero request may start a background
+    operation that would cause the next flush request to take longer,
+    but that is okay as long as intermediate writes before that flush
+    do not further lengthen the time spent on the overall sequence of
+    operations).
+
     If an error occurs, the server MUST set the appropriate error code
     in the error field.



--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


--UyVRduid6KyXh5SMHMVWREbWtlpcyETDc--

--4ytvYVWHqTxyWzUFXxN0dFhlmAAh0OX6D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEccLMIrHEYCkn0vOqp6FrSiUnQ2oFAl1j+x4ACgkQp6FrSiUn
Q2oxUAf+J9gM6isTGR6bOCEV+7IALfKdliMj0BTlLXyU8gTR45Ln61Ps96mxpwVl
l2Zh4gwaebLOZsX5Rh6O76kD0BwO8enDrjS6yEaQiiYae/4YFLkWDTN6Szfw+OnA
CkeHxdwuRtr93F4uqt6VtgpoUOTODmZQAIvM6mwM/KgkaC0gVv7NL4+CxfyjDEJM
NbYAtzsTMzSHIN+4MR+WZ6Lzj52M69h1gOE4E0tI85V0Gtp/4X2bTn+gycycV257
8+fEwiQwZQ52w2KIZ4JTlS4HRJTTNQxT8hCI/15Jc423N2fHfXQW6S7tP9WXul6A
W8gku5TDzUCgTIC4wrXeCdi925+3QQ==
=piNU
-----END PGP SIGNATURE-----

--4ytvYVWHqTxyWzUFXxN0dFhlmAAh0OX6D--

