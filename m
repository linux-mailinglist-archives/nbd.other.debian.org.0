Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3BF82FB34
	for <lists+nbd@lfdr.de>; Tue, 16 Jan 2024 22:50:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C21BD20854; Tue, 16 Jan 2024 21:50:48 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan 16 21:50:48 2024
Old-Return-Path: <roker@pep-project.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=4.0 tests=FOURLA,FVGT_m_MULTI_ODD,
	KHOP_HELO_FCRDNS,LDOSUBSCRIBER,LDO_WHITELIST,PGPSIGNATURE,
	T_SCC_BODY_TEXT_LINE,WORD_WITHOUT_VOWELS autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B2E8E20847
	for <lists-other-nbd@bendel.debian.org>; Tue, 16 Jan 2024 21:50:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.889 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02,
	KHOP_HELO_FCRDNS=0.001, LDO_WHITELIST=-5, PGPSIGNATURE=-5,
	T_SCC_BODY_TEXT_LINE=-0.01, WORD_WITHOUT_VOWELS=1]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9L1Q3lJEQGmQ for <lists-other-nbd@bendel.debian.org>;
	Tue, 16 Jan 2024 21:50:26 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
X-Greylist: delayed 617 seconds by postgrey-1.36 at bendel; Tue, 16 Jan 2024 21:50:26 UTC
Received: from pibit.ch (dragon.pibit.ch [185.203.114.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3B71620849
	for <nbd@other.debian.org>; Tue, 16 Jan 2024 21:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dragon.pibit.ch (Postfix) with ESMTP id 1074C2142DFA
	for <nbd@other.debian.org>; Tue, 16 Jan 2024 22:40:06 +0100 (CET)
Received: from pibit.ch ([127.0.0.1])
 by localhost (dragon.pibit.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vpnc-pWGhkqU for <nbd@other.debian.org>;
 Tue, 16 Jan 2024 22:40:05 +0100 (CET)
Received: from 127.0.0.1 (pd9e55c12.dip0.t-ipconnect.de [217.229.92.18])
	by dragon.pibit.ch (Postfix) with ESMTPSA id CCCED2140452
	for <nbd@other.debian.org>; Tue, 16 Jan 2024 22:40:05 +0100 (CET)
Message-ID: <19b8472a-305c-4f23-a985-c5567a10b5df@pep-project.org>
Date: Tue, 16 Jan 2024 22:40:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: nbd@other.debian.org
Content-Language: de-DE, en-US
From: Lars Rohwedder <roker@pep-project.org>
Subject: Can dependency to "docbook-utils" be made optional?
Autocrypt: addr=roker@pep-project.org; keydata=
 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
 GIaZVwoJisucuww=
Organization: =?UTF-8?B?8J+Ukg==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5w6p8B5vrBpQ04FxfS7LhnwZ"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kz-pE6HejpP.A.8SF.4ovplB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2710
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/19b8472a-305c-4f23-a985-c5567a10b5df@pep-project.org
Resent-Date: Tue, 16 Jan 2024 21:50:48 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5w6p8B5vrBpQ04FxfS7LhnwZ
Content-Type: multipart/mixed; boundary="------------0JTykWCF0Td0B1fSlGRkVPmS";
 protected-headers="v1"
From: Lars Rohwedder <roker@pep-project.org>
To: nbd@other.debian.org
Message-ID: <19b8472a-305c-4f23-a985-c5567a10b5df@pep-project.org>
Subject: Can dependency to "docbook-utils" be made optional?

--------------0JTykWCF0Td0B1fSlGRkVPmS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgdGhlcmUsDQoNCkkganVzdCB3YW50ZWQgdG8gYnVpbGQgbmJkIGZyb20gdGhlIGdpdGh1
YiByZXBvLCBhbmQgYXMgZGVzY3JpYmVkIGluIHRoZSANClJFQURNRS5tZCBpdCBkZXBlbmRz
IG9uIHRoZSBTR01MIHRvb2xzLCB3aGljaCBhcmUgaW4gImRvY2Jvb2stdXRpbHMiIG9uIA0K
RGViaWFuLg0KDQpTbyBJIHN0YXJ0ZWQgdG8gaW5zdGFsbCBpdCBhbmQgd2FzIHJlYWxseSBz
dXJwcmlzZWQgYWJvdXQgaXRzIGlycml0YXRpbmcgDQpodWdlIGRlcGVuZGVuY3kgbGlzdCBh
bmQgaXRzIHNpemU6DQoNCi0tLS08c25pcD4tLS0tDQpyb290QGJ1bW1pOn4jIGFwdCBpbnN0
YWxsIGRvY2Jvb2stdXRpbHMNClJlYWRpbmcgcGFja2FnZSBsaXN0cy4uLiBEb25lDQpCdWls
ZGluZyBkZXBlbmRlbmN5IHRyZWUuLi4gRG9uZQ0KUmVhZGluZyBzdGF0ZSBpbmZvcm1hdGlv
bi4uLiBEb25lDQpUaGUgZm9sbG93aW5nIGFkZGl0aW9uYWwgcGFja2FnZXMgd2lsbCBiZSBp
bnN0YWxsZWQ6DQoNCiAgIGRlZmF1bHQtanJlIGRlZmF1bHQtanJlLWhlYWRsZXNzIGRvY2Jv
b2stZHNzc2wgZHZpc3ZnbSBmb250cy1sbW9kZXJuDQogICBsaWJhcGFjaGUtcG9tLWphdmEg
bGliYml0LXZlY3Rvci1wZXJsIGxpYmNhcnAtY2xhbi1wZXJsDQogICBsaWJjb21tb25zLWxv
Z2dpbmctamF2YSBsaWJjb21tb25zLXBhcmVudC1qYXZhIGxpYmNyeXB0LXJjNC1wZXJsDQog
ICBsaWJkYXRlLWNhbGMtcGVybCBsaWJkYXRlLWNhbGMteHMtcGVybCBsaWJkYXRlLW1hbmlw
LXBlcmwNCiAgIGxpYmRpZ2VzdC1wZXJsLW1kNS1wZXJsIGxpYmZvbnRib3gtamF2YSBsaWJq
Y29kZS1wbS1wZXJsIGxpYm11anMyDQogICBsaWJvbGUtc3RvcmFnZS1saXRlLXBlcmwgbGli
b3NwNSBsaWJvc3R5bGUxYzIgbGlicGFyc2UtcmVjZGVzY2VudC1wZXJsDQogICBsaWJwZGZi
b3gtamF2YSBsaWJwb3RyYWNlMCBsaWJwdGV4ZW5jMSBsaWJydWJ5IGxpYnJ1YnkzLjENCiAg
IGxpYnNnbWxzLXBlcmwgbGlic3ByZWFkc2hlZXQtcGFyc2VleGNlbC1wZXJsDQogICBsaWJz
cHJlYWRzaGVldC13cml0ZWV4Y2VsLXBlcmwgbGlidGVja2l0MCBsaWJ0ZXhsdWE1My01IGxp
YnRleGx1YWppdDINCiAgIGxpYnVuaWNvZGUtbWFwLXBlcmwgbGlienppcC0wLTEzIGxtb2Rl
cm4gbXVwZGYtdG9vbHMgb3BlbmphZGUgb3BlbnNwDQogICBwcmV2aWV3LWxhdGV4LXN0eWxl
IHJha2UgcnVieSBydWJ5LW5ldC10ZWxuZXQgcnVieS1ydWJ5Z2VtcyBydWJ5LXNkYm0NCiAg
IHJ1Ynktd2VicmljayBydWJ5LXhtbHJwYyBydWJ5My4xIHJ1YnlnZW1zLWludGVncmF0aW9u
IHNnbWxzcGwgdDF1dGlscw0KICAgdGVja2l0IHRleC1neXJlIHRleGxpdmUtYmFzZSB0ZXhs
aXZlLWJpbmFyaWVzDQogICB0ZXhsaXZlLWZvbnRzLXJlY29tbWVuZGVkIHRleGxpdmUtZm9y
bWF0cy1leHRyYSB0ZXhsaXZlLWxhdGV4LWJhc2UNCiAgIHRleGxpdmUtbGF0ZXgtZXh0cmEg
dGV4bGl2ZS1sYXRleC1yZWNvbW1lbmRlZCB0ZXhsaXZlLXBpY3R1cmVzDQogICB0ZXhsaXZl
LXBsYWluLWdlbmVyaWMgdGV4bGl2ZS14ZXRleCB0aXBhDQoNClN1Z2dlc3RlZCBwYWNrYWdl
czoNCiAgIGRvY2Jvb2stZHNzc2wtZG9jIGxpYmF2YWxvbi1mcmFtZXdvcmstamF2YSBsaWJj
b21tb25zLWxvZ2dpbmctamF2YS1kb2MNCiAgIGxpYmV4Y2FsaWJ1ci1sb2draXQtamF2YSBs
aWJsb2c0ajEuMi1qYXZhIHNnbWxzLWRvYyBkb2MtYmFzZSByaQ0KICAgcnVieS1kZXYgYnVu
ZGxlciB4emRlYyB0ZXhsaXZlLWZvbnRzLXJlY29tbWVuZGVkLWRvYw0KICAgdGV4bGl2ZS1s
YXRleC1iYXNlLWRvYyB3cDJsYXRleCBpY2MtcHJvZmlsZXMgdGV4bGl2ZS1sYXRleC1leHRy
YS1kb2MNCiAgIHRleGxpdmUtc2NpZW5jZSB0ZXhsaXZlLWxhdGV4LXJlY29tbWVuZGVkLWRv
YyB0ZXhsaXZlLWx1YXRleA0KICAgdGV4bGl2ZS1wc3RyaWNrcyBkb3QydGV4IHByZXJleCB0
ZXhsaXZlLXBpY3R1cmVzLWRvYyB2cHJlcmV4IHRpcGEtZG9jDQoNClRoZSBmb2xsb3dpbmcg
TkVXIHBhY2thZ2VzIHdpbGwgYmUgaW5zdGFsbGVkOg0KICAgZGVmYXVsdC1qcmUgZGVmYXVs
dC1qcmUtaGVhZGxlc3MgZG9jYm9vay1kc3NzbCBkb2Nib29rLXV0aWxzIGR2aXN2Z20NCiAg
IGZvbnRzLWxtb2Rlcm4gbGliYXBhY2hlLXBvbS1qYXZhIGxpYmJpdC12ZWN0b3ItcGVybCBs
aWJjYXJwLWNsYW4tcGVybA0KICAgbGliY29tbW9ucy1sb2dnaW5nLWphdmEgbGliY29tbW9u
cy1wYXJlbnQtamF2YSBsaWJjcnlwdC1yYzQtcGVybA0KICAgbGliZGF0ZS1jYWxjLXBlcmwg
bGliZGF0ZS1jYWxjLXhzLXBlcmwgbGliZGF0ZS1tYW5pcC1wZXJsDQogICBsaWJkaWdlc3Qt
cGVybC1tZDUtcGVybCBsaWJmb250Ym94LWphdmEgbGliamNvZGUtcG0tcGVybCBsaWJtdWpz
Mg0KICAgbGlib2xlLXN0b3JhZ2UtbGl0ZS1wZXJsIGxpYm9zcDUgbGlib3N0eWxlMWMyIGxp
YnBhcnNlLXJlY2Rlc2NlbnQtcGVybA0KICAgbGlicGRmYm94LWphdmEgbGlicG90cmFjZTAg
bGlicHRleGVuYzEgbGlicnVieSBsaWJydWJ5My4xDQogICBsaWJzZ21scy1wZXJsIGxpYnNw
cmVhZHNoZWV0LXBhcnNlZXhjZWwtcGVybA0KICAgbGlic3ByZWFkc2hlZXQtd3JpdGVleGNl
bC1wZXJsIGxpYnRlY2tpdDAgbGlidGV4bHVhNTMtNSBsaWJ0ZXhsdWFqaXQyDQogICBsaWJ1
bmljb2RlLW1hcC1wZXJsIGxpYnp6aXAtMC0xMyBsbW9kZXJuIG11cGRmLXRvb2xzIG9wZW5q
YWRlIG9wZW5zcA0KICAgcHJldmlldy1sYXRleC1zdHlsZSByYWtlIHJ1YnkgcnVieS1uZXQt
dGVsbmV0IHJ1YnktcnVieWdlbXMgcnVieS1zZGJtDQogICBydWJ5LXdlYnJpY2sgcnVieS14
bWxycGMgcnVieTMuMSBydWJ5Z2Vtcy1pbnRlZ3JhdGlvbiBzZ21sc3BsIHQxdXRpbHMNCiAg
IHRlY2tpdCB0ZXgtZ3lyZSB0ZXhsaXZlLWJhc2UgdGV4bGl2ZS1iaW5hcmllcw0KICAgdGV4
bGl2ZS1mb250cy1yZWNvbW1lbmRlZCB0ZXhsaXZlLWZvcm1hdHMtZXh0cmEgdGV4bGl2ZS1s
YXRleC1iYXNlDQogICB0ZXhsaXZlLWxhdGV4LWV4dHJhIHRleGxpdmUtbGF0ZXgtcmVjb21t
ZW5kZWQgdGV4bGl2ZS1waWN0dXJlcw0KICAgdGV4bGl2ZS1wbGFpbi1nZW5lcmljIHRleGxp
dmUteGV0ZXggdGlwYQ0KDQowIHVwZ3JhZGVkLCA2NSBuZXdseSBpbnN0YWxsZWQsIDAgdG8g
cmVtb3ZlIGFuZCAxIG5vdCB1cGdyYWRlZC4NCg0KTmVlZCB0byBnZXQgMjE5IE1CIG9mIGFy
Y2hpdmVzLg0KQWZ0ZXIgdGhpcyBvcGVyYXRpb24sIDY0MSBNQiBvZiBhZGRpdGlvbmFsIGRp
c2sgc3BhY2Ugd2lsbCBiZSB1c2VkLg0KRG8geW91IHdhbnQgdG8gY29udGludWU/IFtZL25d
IF8NCi0tLS08c25hcD4tLS0tDQoNCjY0MSBNQiE/IFNlcmlvdXNseT8gSnVzdCB0byBnZW5l
cmF0ZSBtYW4gcGFnZXMgZnJvbSBYTUwgZmlsZXM/DQoqc2lnaCoNCg0KU28gbXkgcXVlc3Rp
b24gaXM6IElzIGl0IHBvc3NpYmxlIHRvIGdldCByaWQgb2YgdGhpcyBkZXBlbmRlbmN5IG9y
IGF0IA0KbGVhc3QgbWFrZSB0aGUgZ2VuZXJhdGlvbiBvZiBtYW4gcGFnZXMgb3B0aW9uYWw/
DQoNCkdyZWV0aW5ncywNCg0KCUxhcnMgUi4NCg==

--------------0JTykWCF0Td0B1fSlGRkVPmS--

--------------5w6p8B5vrBpQ04FxfS7LhnwZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsEBBAABCAAjFiEEgvhNxzjijE7doMajz24L8sM/oJ4FAmWm97MFAwAAAAAACgkQz24L8sM/oJ7I
+wxAkez2h1pf7fSY8KKI2yFzZNjZLFXJZjPpWiZgCt0Wdh8iZ0jletCSxh1vII2toB66OjfklZ5v
jWW4lLYM/TmiuP13q5uPDdVVhxkyBUDKNmVo9RYl7MIIidsPxd2pX8cFCTAEt1oDTcM+sONzkFzO
qPJz3gwT3nUXkMIGbdm2JsyI1YEh8G2csfa6K7sbtnyWl4dFI6Daflyn48w/161k0gRoFsXxuEov
mYLD940HHmUAQwyGBiDRbz9+dy8s8FPGLC/20TySQ2vSHqqFa3t5vrwFJBW0xm0KatgIqDraQshj
MocpbKPgvCh0FUAqJZj7KqOQEpwJ6J4zKTrqyxEg+3n2ytSkZWY6HslxTsYigNXxH/wsYvHMNYoE
137FHaQBWc/PJUEGJTZ5fS3UBGwHAbFcLEOp7TvQnvzWHpf2MiRHifXLgcs1KWeVJkn7IJ4L1mBk
nt0dIZvdYD+SIRLbM3HBGj73KQY4tSwlkGObDZXvbl2Fkubb0cLc6TTLJcy23IRkM/UvgU8=
=VE0q
-----END PGP SIGNATURE-----

--------------5w6p8B5vrBpQ04FxfS7LhnwZ--

