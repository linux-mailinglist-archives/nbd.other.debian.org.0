Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C531589FB04
	for <lists+nbd@lfdr.de>; Wed, 10 Apr 2024 17:05:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9FC9F20522; Wed, 10 Apr 2024 15:05:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 10 15:05:41 2024
Old-Return-Path: <roker@pep-project.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=4.0 tests=FOURLA,KHOP_HELO_FCRDNS,
	LDOSUBSCRIBER,LDO_WHITELIST,PGPSIGNATURE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0E8B62052B
	for <lists-other-nbd@bendel.debian.org>; Wed, 10 Apr 2024 15:05:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.899 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, KHOP_HELO_FCRDNS=0.001,
	LDO_WHITELIST=-5, PGPSIGNATURE=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5hXAKN0DPQKi for <lists-other-nbd@bendel.debian.org>;
	Wed, 10 Apr 2024 15:05:25 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from pibit.ch (dragon.pibit.ch [185.203.114.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C0CE020522
	for <nbd@other.debian.org>; Wed, 10 Apr 2024 15:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dragon.pibit.ch (Postfix) with ESMTP id 0595C2142CB8
	for <nbd@other.debian.org>; Wed, 10 Apr 2024 17:05:23 +0200 (CEST)
Received: from pibit.ch ([127.0.0.1])
 by localhost (dragon.pibit.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfzhAaItazyA for <nbd@other.debian.org>;
 Wed, 10 Apr 2024 17:05:22 +0200 (CEST)
Received: from 127.0.0.1 (pd9e55069.dip0.t-ipconnect.de [217.229.80.105])
	by dragon.pibit.ch (Postfix) with ESMTPSA id D60432142C6D
	for <nbd@other.debian.org>; Wed, 10 Apr 2024 17:05:22 +0200 (CEST)
Message-ID: <ee0bb37f-9820-41d6-8303-9bcecad4f39e@pep-project.org>
Date: Wed, 10 Apr 2024 17:05:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: nbd@other.debian.org
From: Lars Rohwedder <roker@pep-project.org>
Subject: Coding style question: Are self-fulfilling headers desired? Are
 u32/u64 or uint32_t/uint64_t preferred?
Autocrypt: addr=roker@pep-project.org; keydata=
 xsDVBGCVZYIBDECv6bZ9vWKauYcvrF3WL7qRhQOPnIjcpkxUbVZHdehM+4EY4tYrzFu1l/5l
 wr09cewM3TDoSKKmEG+rpiTMKevRg9MDidJrUeq4A34FNHnfmyzJXJf4Rm0xfE7k1OguLXDp
 EXA6SNCfpbZdBtCPuwBo/dJl4JiAAnOWh0mfrabGSU3s3AydZ9UBKzjN+e4hScpjX8HJIyXT
 V3DybSky6RQ90SYfqSHLckMhUAur1T58edrtOyl2h+39RVi6kpf8eoy1gNRzbCDE2svJ8kg0
 y6sU5iuRD6ysW4OYn8IMRXZl5pLiiV9zlbjmbQl6VxctKc8tydMecN1YPyUa3i/L1MyUXGfc
 vxliSGfUXZUw/RXxo1RGUDMffUua0D7r5NwYIlnpkA+nMC8nKe85NKV70TD/lXs1YirImONQ
 MQhMSvdS8FOBHyE/yoMlWu4RzkCwuKXrkHrrFkX+AMWoZo65YMgtO1uB6BGQbeiC8VAKwzXu
 AStbcntgayMsY9QZXrIxKgpe3xPmzGyT4QARAQABzSlMYXJzIEguIFJvaHdlZGRlciA8cm9r
 ZXJAcGVwLXByb2plY3Qub3JnPsLBHAQTAQgAPhYhBIL4Tcc44oxO3aDGo89uC/LDP6CeBQJl
 pY1qAhsDBQkI0rpuBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEM9uC/LDP6CeI6IMPi/a
 +u9eqwg9F1vDOf0DeUlhGjdneMz2+0Yw9btE8HZjo6En0sAHFxzZlrmblwt3s5TIbtnECXTi
 Aa2hEt4PbAz5Ifeb6u+H0MutgXqrh6pkOka4RMEerm1Afkfpt5ZclKEe0UQXbmwdMhdJ76Ey
 BLzoRGEDVOpJlFIbiOVBnSy4ks7FFQKoED2E7s7laFe+EBjkCuJPL1Uq5jd3PpT7z2Rvr0ui
 TXh+jTHQ35tOba5AqXVVjiY6xlEQbKawPK/aPxnmEN8w29b+nfgTJr3CPlKmRLSn/S84aKxj
 kbB/5XfFvHhGUHZoZ0CMEatE+TOx87Tytc+t6Ahm1Qer6m0omfLBt4ZtZ6ygpFbvSyCn9z/p
 yHNUEaxE35fs76pgluUj5t4yNZde/vWLf4W83xlZWjPMFFWyt31+sdooKase1MdatjAbQvYx
 m1FFNpobAt5cijlmNWYa35l/aeZvk21n1aJZBhJAShXWDl9j2+9xaEEr23TRpw/2Mrqq4B0y
 IFSg44YTSVKjaCkHzsDVBGCVZYIBDEC9jkGR4HCZvcaNT/veGmoxoDkJSWroQOjnnEtJcsey
 JgcKYHFPKyueoVRD66xb/O0kMZMClxZxpnp5vv6NKSoIs6tZftmWm5ks0P++xybS3fvivjWz
 8ph5QUdjH1mfVFJxgvxtRlCP/KeaU5tpIFB8pZh5Qcvg/vtnvcb6jY39SQDVlkkUjKx2zSkx
 HOK2E6OWgKg+IIzGY1yBskNDvHPopzLcB8jWXE0hS6QDRtJIVaee505zN4L8I2RfV5yfoK4f
 gGshcMcYIwV8mL0Svkd1deRuBjjUGwfkiJeEPgdVCcP+KOYsT7dF0mJkDxUwRhLHwQr/Epbo
 ou19CDEnB4rs73H7nvtgjbGTc/2tS47g6mXlkQaYV7kkVsmGK5j1A0tPsw7yFPEhlg6FPWdy
 5QbXQr9lX9KiSckm6Pzf6W4Ax88IZo3KLcf/X+Ynx9LmCe6XPng0q/dCLxqOiX8nq6hTtVad
 RSDcTw8IRCYVAfeZWoPkIwfF2IUSY2MELM0AI57H6UV2sGOQiwARAQABwsEEBBgBCAAmFiEE
 gvhNxzjijE7doMajz24L8sM/oJ4FAmWljWsCGwwFCQjSum4ACgkQz24L8sM/oJ4j/Aw+LSO3
 op62JdPBR2zX81x83lpxg2dZbvwdIbaoCrxFl1LTuiZcDHF4pA1elcuVBfG15xMZiW7/iE7M
 YqMuRmxIdBP5f2VcU14igr0Hlsg3oZiClPUH2IdXUa7ETccOR6Ixm4tt2Mei4ruomuMdDDgL
 KklZsFSUawXJfSKVRxvsgjyR4ohaJfFh3NOZHV+0i8KPMZwdS2N0WmOGYPitSCAw6N/JQsiz
 Oq7G3Sf+VF6S4+6deN8hwwbQRcp6tMLmbVjo58dsLm9we3QIhyWv8i0hA6W1PlR2m7EFZRVu
 6o7Uh2VPx7o2VD3xl56kn5ZiENBAqzy6PFpIleSgeRQ2Fr91J/sXSIcsrpZTEoExHKnar2dL
 +J3EeMoXjEQSbq53MMq/Hl776/dVl1vQZCzzDd8sCTSX5qYpNF3FMh9EdWVj/OAXua9bI8it
 A3JE7zCQiL0HgM/Lgj5Y2l314axzq6L9YL1ZSxohPRksSUrF/Irx5u9HUn/XDC5D6fYi7L54
 GIaZVwoJisucuww=
Organization: =?UTF-8?B?8J+Ukg==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------stvzZMrGpTK5YlyUjd4t0iKb"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sobxWYTJUQO.A.WLD.FrqFmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2787
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ee0bb37f-9820-41d6-8303-9bcecad4f39e@pep-project.org
Resent-Date: Wed, 10 Apr 2024 15:05:41 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------stvzZMrGpTK5YlyUjd4t0iKb
Content-Type: multipart/mixed; boundary="------------zc0nsnLPC9vOPSXFqR4Y0Xfr";
 protected-headers="v1"
From: Lars Rohwedder <roker@pep-project.org>
To: nbd@other.debian.org
Message-ID: <ee0bb37f-9820-41d6-8303-9bcecad4f39e@pep-project.org>
Subject: Coding style question: Are self-fulfilling headers desired? Are
 u32/u64 or uint32_t/uint64_t preferred?

--------------zc0nsnLPC9vOPSXFqR4Y0Xfr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgdGhlcmUsDQoNCnRvIGltcGxlbWVudCBteSBkZXNpcmVkIGZlYXR1cmUgaW4gTkJEIEkn
dmUgbG9hZGVkIHRoZSBzb3VyY2VzIGludG8gbXkgDQpJREUgKFF0Q3JlYXRvcikgYW5kIGl0
IGNvbXBsYWlucyBhYm91dCB0aGUgI2luY2x1ZGUgZmlsZXM6DQoNCjEpIGluY2x1ZGUgc3Ry
dWN0dXJlOg0KDQpTb21lIGhlYWRlcnMgdXNlIHN5bWJvbHMgdGhhdCBhcmUgbm90IGluY2x1
ZGVkIGluIHRoaXMgaGVhZGVyIChlLmcuIA0Kb2ZmX3QgYW5kIHB0aHJlYWRfdCBpbiB0cmVl
ZmlsZXMuaCksIHNvIHRoZXNlIGhlYWRlcnMgZGVwZW5kIG9uIGNvcnJlY3QgDQp1c2FnZSwg
aS5lLiBpdCBpcyBuZWNlc3NhcnkgdG8gaW5jbHVkZSBjZXJ0YWluIG90aGVyIGhlYWRlcnMg
dG8gdXNlIA0KdGhlc2UgaGVhZGVycyBhdCBhbGwuDQoNCmFuZCBhbHNvIHRoZSBvcHBvc2l0
ZQ0KDQpTb21lIGluY2x1ZGVzIGFyZSAidG9vIG11Y2giIGFuZCBub3QgdXNlZCBpbiBhIGhl
YWRlciwgYnV0IG1pZ2h0IG9ubHkgYmUgDQpuZWNlc3NhcnkgYmVjYXVzZSB0aGUgdXNlcnMg
b2YgdGhlIGhlYWRlciBhcmUgdG9vIGxhenkgdG8gaW5jbHVkZSB0aGUgDQpwcm9wZXIgaGVh
ZGVycyB0aGV5IGRlcGVuZCBvbi4NCg0KDQpJIHRyaWVkIHRvIGNsZWFuIHVwIHRoYXQgaXNz
dWUgYW5kIGFub3RoZXIgb2RkaXR5IG9jY3VycmVkOg0KDQoyKSBpbiBjbGlzZXJ2Lmg6DQog
ICAqIHdoeSB1c2luZyB0aGVzZSBzdHJhbmdlICNpZi4uI2VsaWYgY2FzY2FkZSB0byBkZWZp
bmUgdTMyIGFuZCB1NjQgDQppbnN0ZWFkIG9mIHVzaW5nIHVpbnQzMl90IGFuZCB1aW50NjRf
dCBmcm9tIDxzdGRpbnQuaD4gYXMgdXNlZCBpbiBuZWFybHkgDQphbGwgb2YgdGhlIHJlc3Qg
b2YgdGhlIGNvZGUgYmFzZT8NCiAgICogX19iZTMyIGFuZCBfX2JlNjQgYXJlIG5vdCB1c2Vk
IGFuZCBtaWdodCBiZSBldmVuIG1pc2xlYWRpbmcsIA0KYmVjYXVzZSB0aGV5IGNhbWUgZnJv
bSB0aGUgTGludXgga2VybmVsIGFuZCBkZW5vdGVzICJiaWcgZW5kaWFuIiB0eXBlcyANCmV4
cGxpY2l0bHkuDQoNCg0KU28gbXkgcXVlc3Rpb24gaXM6IEFyZSBwYXRjaGVzIC8gR2l0aHVi
IHB1bGwgcmVxdWVzdHMgd2VsY29tZSBvciBub3QsIHRvIA0KY2xlYW4tdXAgc3R1ZmYgbGlr
ZSB0aGlzPw0KDQoNCkdyZWV0aW5ncywNCg0KCQlMYXJzIFIuDQo=

--------------zc0nsnLPC9vOPSXFqR4Y0Xfr--

--------------stvzZMrGpTK5YlyUjd4t0iKb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsEBBAABCAAjFiEEgvhNxzjijE7doMajz24L8sM/oJ4FAmYWqrEFAwAAAAAACgkQz24L8sM/oJ6W
+ww/c+W5gIAZHvt4GFDYr4Lh5FLjzOPEODhUBsv+iLX8JkllMVtt2sNWEQbAq9eSt9/XSTVxuckY
o139aZVndS5QFhnOqAyb8FpOUiE+P1Rz3ka1TqaEUSIgZ+6dJF4Xo6HKwg7VA7wA5extqAxKe4Vf
2FT9Nn1wye6MAhEv08xQ8StEALymifhz/PxQF0XWvz2y0sELUc1/S0VgmQ1eI8ieOK7y8kipPoqE
Xtube/+LhTztxubXoJyaQRrmTX6bu2EB5+jHmm/EFi66sDIC3/peuPLEmUOG/KgDPIFHGP46EGkO
maeGFI8UK0a6CWFUAsZZ5FgShIO2Pplxsf8FeTq8fDVn7aLJbYf+LjcdOdqCqrE/IEM/685UQBE3
SLPhn7T2pYqkt3631SDPGp+Ah/21KDaKeyHfJt9SbUWHy1jASxAr9ANHfAi1dV0MrtlO1Jjicx93
+GEOzt02wYniaNPGxzJJwreeIZ10RPCV13IKzBMu2kpRHN3hZDXjT7zVgKw+iOoI+ftMip0=
=ftUC
-----END PGP SIGNATURE-----

--------------stvzZMrGpTK5YlyUjd4t0iKb--

