Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B281892AFB
	for <lists+nbd@lfdr.de>; Sat, 30 Mar 2024 12:56:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CC59B20CD9; Sat, 30 Mar 2024 11:56:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 30 11:56:30 2024
Old-Return-Path: <roker@pep-project.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=4.0 tests=KHOP_HELO_FCRDNS,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,PGPSIGNATURE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D866A20CA9
	for <lists-other-nbd@bendel.debian.org>; Sat, 30 Mar 2024 11:56:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12.999 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, KHOP_HELO_FCRDNS=0.001, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, PGPSIGNATURE=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id F3Wv3hog51SR for <lists-other-nbd@bendel.debian.org>;
	Sat, 30 Mar 2024 11:56:11 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
X-Greylist: delayed 532 seconds by postgrey-1.36 at bendel; Sat, 30 Mar 2024 11:56:11 UTC
Received: from pibit.ch (dragon.pibit.ch [185.203.114.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8613220CC6
	for <nbd@other.debian.org>; Sat, 30 Mar 2024 11:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dragon.pibit.ch (Postfix) with ESMTP id 2F032214386C
	for <nbd@other.debian.org>; Sat, 30 Mar 2024 12:47:16 +0100 (CET)
Received: from pibit.ch ([127.0.0.1])
 by localhost (dragon.pibit.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyXyPO7pG1NV for <nbd@other.debian.org>;
 Sat, 30 Mar 2024 12:47:16 +0100 (CET)
Received: from 127.0.0.1 (p57a9b1f9.dip0.t-ipconnect.de [87.169.177.249])
	by dragon.pibit.ch (Postfix) with ESMTPSA id 06FA12143861
	for <nbd@other.debian.org>; Sat, 30 Mar 2024 12:47:15 +0100 (CET)
Message-ID: <80f2bea6-e6e0-4c32-8c5d-766a9faf1bbf@pep-project.org>
Date: Sat, 30 Mar 2024 12:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: nbd@other.debian.org
From: Lars Rohwedder <roker@pep-project.org>
Subject: fix clang v14 warnings in nbd-server.c
Autocrypt: addr=roker@pep-project.org; keydata=
 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
 GIaZVwoJisucuww=
Organization: =?UTF-8?B?8J+Ukg==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dZd3g8XSe9HtwoAj5ATzSyv0"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XpvSYmhOAoJ.A.U6F.u3_BmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2785
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/80f2bea6-e6e0-4c32-8c5d-766a9faf1bbf@pep-project.org
Resent-Date: Sat, 30 Mar 2024 11:56:30 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dZd3g8XSe9HtwoAj5ATzSyv0
Content-Type: multipart/mixed; boundary="------------pnDooUz0cehxjeCKqpN5TCXV";
 protected-headers="v1"
From: Lars Rohwedder <roker@pep-project.org>
To: nbd@other.debian.org
Message-ID: <80f2bea6-e6e0-4c32-8c5d-766a9faf1bbf@pep-project.org>
Subject: fix clang v14 warnings in nbd-server.c

--------------pnDooUz0cehxjeCKqpN5TCXV
Content-Type: multipart/mixed; boundary="------------5i0xc25ugT92gxrSMjN0vyMl"

--------------5i0xc25ugT92gxrSMjN0vyMl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

Q2xhbmcgMTQgb24gbWFjT1MgMTIuNy40IChhbmQgSSBndWVzcyBhbHNvIG5ld2VyIHZlcnNp
b25zKSBlbWl0cyB0aGVzZSANCndhcm5pbmdzIHdoZW4gY29tcGlsaW5nIG5iZC1zZXJ2ZXIu
YzoNCg0KICAgQ0MgICAgICAgbmJkX3NlcnZlci1uYmQtc2VydmVyLm8NCm5iZC1zZXJ2ZXIu
YzoyODg1OjE1OiB3YXJuaW5nOiAmIGhhcyBsb3dlciBwcmVjZWRlbmNlIHRoYW4gIT07ICE9
IHdpbGwgDQpiZSBldmFsdWF0ZWQgZmlyc3QgWy1XcGFyZW50aGVzZXNdDQogICAgICAgICBp
ZihyZXEtPnR5cGUgJiBOQkRfQ01EX0ZMQUdfREYgIT0gMCkgew0KICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCm5iZC1zZXJ2ZXIuYzoyODg1OjE1OiBu
b3RlOiBwbGFjZSBwYXJlbnRoZXNlcyBhcm91bmQgdGhlICchPScgZXhwcmVzc2lvbiANCnRv
IHNpbGVuY2UgdGhpcyB3YXJuaW5nDQogICAgICAgICBpZihyZXEtPnR5cGUgJiBOQkRfQ01E
X0ZMQUdfREYgIT0gMCkgew0KICAgICAgICAgICAgICAgICAgICAgIF4gfn5+fn5+fn5+fn5+
fn5+fn5+fn4NCm5iZC1zZXJ2ZXIuYzoyODg1OjE1OiBub3RlOiBwbGFjZSBwYXJlbnRoZXNl
cyBhcm91bmQgdGhlICYgZXhwcmVzc2lvbiB0byANCmV2YWx1YXRlIGl0IGZpcnN0DQogICAg
ICAgICBpZihyZXEtPnR5cGUgJiBOQkRfQ01EX0ZMQUdfREYgIT0gMCkgew0KICAgICAgICAg
ICAgfn5+fn5+fn5+fl5+fn5+fn5+fn5+fn5+fn5+DQpuYmQtc2VydmVyLmM6MzMxNToxMDog
d2FybmluZzogcmVzdWx0IG9mIGNvbXBhcmlzb24gb2YgY29uc3RhbnQgDQoxODQ0Njc0NDA3
MzcwOTU1MTYxNCB3aXRoIGV4cHJlc3Npb24gb2YgdHlwZSAndWludDMyX3QnIChha2EgJ3Vu
c2lnbmVkIA0KaW50JykgaXMgYWx3YXlzIGZhbHNlIFstV3RhdXRvbG9naWNhbC1jb25zdGFu
dC1vdXQtb2YtcmFuZ2UtY29tcGFyZV0NCiAgICAgICAgIGlmIChsZW4gPj0gVUxPTkdfTUFY
IC0gMSkgew0KICAgICAgICAgICAgIH5+fiBeICB+fn5+fn5+fn5+fn5+DQoNClRoaXMgY29t
bWl0IHdpbGwgYWRkcmVzcyB0aGVzZSAyIHdhcm5pbmdzIGFuZCBmaXggdGhlIGNvZGUuDQoN
Ci0tLS0tDQoNCkkndmUgYWxzbyBvcGVuZWQgYSBwdWxsIHJlcXVlc3QgaW4gZ2l0aHViIGZv
ciB0aGlzIGZpeDoNCg0KaHR0cHM6Ly9naXRodWIuY29tL05ldHdvcmtCbG9ja0RldmljZS9u
YmQvcHVsbC8xNjANCg0KRmVlbCBmcmVlIHRvIG1lcmdlIHRoZSBQUiBvciBqdXN0IGFwcGx5
IHRoZSBhdHRhY2hlZCBwYXRjaC4NCg0KDQoJCUxhcnMgUi4NCg==
--------------5i0xc25ugT92gxrSMjN0vyMl
Content-Type: text/plain; charset=UTF-8;
 name="0001-fix-clang-warnings-in-nbd-server.c.patch"
Content-Disposition: attachment;
 filename="0001-fix-clang-warnings-in-nbd-server.c.patch"
Content-Transfer-Encoding: base64

RnJvbSBhNzJjMWY4NDFiYTA3NDNhZWFjNTcxYTcyZjRmNGFjMjg4NmQyZjlmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiByb2tlciA8cm9rZXJAcGVwLXByb2plY3Qub3JnPgpE
YXRlOiBTYXQsIDMwIE1hciAyMDI0IDEyOjM2OjU0ICswMTAwClN1YmplY3Q6IFtQQVRDSF0g
Zml4IGNsYW5nIHdhcm5pbmdzIGluIG5iZC1zZXJ2ZXIuYwoKLS0tCiBuYmQtc2VydmVyLmMg
fCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvbmJkLXNlcnZlci5jIGIvbmJkLXNlcnZlci5jCmluZGV4IDBm
Zjc5OTIuLjU4OGU1NmIgMTAwNjQ0Ci0tLSBhL25iZC1zZXJ2ZXIuYworKysgYi9uYmQtc2Vy
dmVyLmMKQEAgLTI4ODIsNyArMjg4Miw3IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9ub3JtYWxf
cmVhZChDTElFTlQgKmNsaWVudCwgc3RydWN0IG5iZF9yZXF1ZXN0ICpyZXEpCiAJfSBlbHNl
IHsKIAkJY3R4LT5pc19zdHJ1Y3R1cmVkID0gMDsKIAl9Ci0JaWYocmVxLT50eXBlICYgTkJE
X0NNRF9GTEFHX0RGICE9IDApIHsKKwlpZigocmVxLT50eXBlICYgTkJEX0NNRF9GTEFHX0RG
KSAhPSAwKSB7CiAJCWN0eC0+ZGYgPSAxOwogCX0KIAlpZihjdHgtPmlzX3N0cnVjdHVyZWQg
JiYgY3R4LT5kZiAmJiByZXEtPmxlbiA+ICgxIDw8IDIwKSkgewpAQCAtMzMxMiw3ICszMzEy
LDcgQEAgc3RhdGljIGludCBoYW5kbGVfY2hpbGRuYW1lKEdBcnJheSogc2VydmVycywgaW50
IHNvY2tldCkKIAkJCQlicmVhazsKIAkJfQogCX0KLQlpZiAobGVuID49IFVMT05HX01BWCAt
IDEpIHsKKwlpZiAobGVuID49IFVJTlQzMl9NQVggLSAxKSB7CiAJCWVycl9ub25mYXRhbCgi
VmFsdWUgb3V0IG9mIHJhbmdlIik7CiAJCXJldHVybiAtMTsKIAl9Ci0tIAoyLjQ0LjAKCg==


--------------5i0xc25ugT92gxrSMjN0vyMl--

--------------pnDooUz0cehxjeCKqpN5TCXV--

--------------dZd3g8XSe9HtwoAj5ATzSyv0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsEBBAABCAAjFiEEgvhNxzjijE7doMajz24L8sM/oJ4FAmYH+8IFAwAAAAAACgkQz24L8sM/oJ72
oAxAqeuOt+aE+eL0777aPGLTz83+adDUuv4bg8VEG+KWX0b3fV9vhe80f5aFqL2iQ+/BdaKdZ5D3
tec0tgPDzdcyQrDrKIDccS8b+Qe/6dcG8RBmGKf7fW5mxi1wZBQgOMaegs1PRWx+2pnc4YsIrb4Q
n4ufrhzDGNZMCzGjnZKIuSvef5b4OOdth3iFHDVVelApXFDLtoMCCZoz1yOUh5YG5ZG8UZ9m6c4l
XO0rsRbhzC9vzAOLyzwvatJWaUwbKlu7nVegI0oQei/t3xXJ9j0Gdfwrhn4JNAGUF+B34HAdnhOA
W1Gh1FKnOUsA42YalVTGC48lE2jEP0fixThapWxPA526X3ytcwThGFqmbhF9z+8R9mRG/l4f0PRH
dXZZUvgXaAgYZOqFMXXTwoukxe8ZgvONJouNl2N1WLRywTlz3iBU4wCnxE/fjiFxS/aUEr9pm85x
4Z/IzxvgtXAkR+mkydmN4hCIYruhkEjnoHUBxvbDIsw6rF4AIyO2dhF1kwyHwfhp/KgLp8w=
=1rKV
-----END PGP SIGNATURE-----

--------------dZd3g8XSe9HtwoAj5ATzSyv0--

