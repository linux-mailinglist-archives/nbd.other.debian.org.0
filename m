Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 698738B0B1D
	for <lists+nbd@lfdr.de>; Wed, 24 Apr 2024 15:37:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 251F320785; Wed, 24 Apr 2024 13:37:50 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 24 13:37:50 2024
Old-Return-Path: <roker@pep-project.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=4.0 tests=FOURLA,KHOP_HELO_FCRDNS,
	LDOSUBSCRIBER,LDO_WHITELIST,PGPSIGNATURE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 559BB20780
	for <lists-other-nbd@bendel.debian.org>; Wed, 24 Apr 2024 13:37:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.899 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, KHOP_HELO_FCRDNS=0.001,
	LDO_WHITELIST=-5, PGPSIGNATURE=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id eX6M-xzZc_lk for <lists-other-nbd@bendel.debian.org>;
	Wed, 24 Apr 2024 13:37:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from pibit.ch (dragon.pibit.ch [185.203.114.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 77D2220781
	for <nbd@other.debian.org>; Wed, 24 Apr 2024 13:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dragon.pibit.ch (Postfix) with ESMTP id 74A6521406AB
	for <nbd@other.debian.org>; Wed, 24 Apr 2024 15:37:27 +0200 (CEST)
Received: from pibit.ch ([127.0.0.1])
 by localhost (dragon.pibit.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDsT3exssOew for <nbd@other.debian.org>;
 Wed, 24 Apr 2024 15:37:27 +0200 (CEST)
Received: from 127.0.0.1 (pd9e54065.dip0.t-ipconnect.de [217.229.64.101])
	by dragon.pibit.ch (Postfix) with ESMTPSA id 4195A2140016
	for <nbd@other.debian.org>; Wed, 24 Apr 2024 15:37:27 +0200 (CEST)
Message-ID: <0c695746-eca2-459f-88b9-0238449578c8@pep-project.org>
Date: Wed, 24 Apr 2024 15:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Updating the NBD assignment at IANA
Content-Language: de-DE
To: nbd@other.debian.org
References: <Zij-Wnsu2F7_HwMZ@pc220518.home.grep.be>
From: Lars Rohwedder <roker@pep-project.org>
Autocrypt: addr=roker@pep-project.org; keydata=
 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
 GIaZVwoJisucuww=
Organization: =?UTF-8?B?8J+Ukg==?=
In-Reply-To: <Zij-Wnsu2F7_HwMZ@pc220518.home.grep.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------n3LfRgGn0K9FXkjhBS0IeB4v"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9o7l9J2qn1G.A.J7.usQKmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2797
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0c695746-eca2-459f-88b9-0238449578c8@pep-project.org
Resent-Date: Wed, 24 Apr 2024 13:37:50 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------n3LfRgGn0K9FXkjhBS0IeB4v
Content-Type: multipart/mixed; boundary="------------NmBl0NfGyho260wZNAh4gN1P";
 protected-headers="v1"
From: Lars Rohwedder <roker@pep-project.org>
To: nbd@other.debian.org
Message-ID: <0c695746-eca2-459f-88b9-0238449578c8@pep-project.org>
Subject: Re: Updating the NBD assignment at IANA
References: <Zij-Wnsu2F7_HwMZ@pc220518.home.grep.be>
In-Reply-To: <Zij-Wnsu2F7_HwMZ@pc220518.home.grep.be>

--------------NmBl0NfGyho260wZNAh4gN1P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQo+IC0gRm9yIHRoZSAiQXNzaWduZWUiLCBJIHdvdWxkIGxpa2UgdG8gYXNrIHRoZW0gdG8g
bWVudGlvbiB0aGlzDQo+ICAgIG1haWxpbmdsaXN0Lg0KPiAgICBb4oCmXQ0KPiAtIEknbGwg
bGVhdmUgdGhlIGNvbnRhY3QgYXMgaXMgZm9yIG5vdy4gUkZDNjMzNSBtZW50aW9ucyAiVGhl
IENvbnRhY3QNCj4gICAgcGVyc29uIGlzIHRoZSByZXNwb25zaWJsZSBwZXJzb24gZm9yIHRo
ZSBJbnRlcm5ldCBjb21tdW5pdHkgdG8gc2VuZA0KPiAgICBxdWVzdGlvbnMgdG8uICBUaGlz
IHBlcnNvbiBpcyBhbHNvIGF1dGhvcml6ZWQgdG8gc3VibWl0IGNoYW5nZXMgb24NCj4gICAg
YmVoYWxmIG9mIHRoZSBBc3NpZ25lZTsgaW4gY2FzZXMgb2YgY29uZmxpY3QgYmV0d2VlbiB0
aGUgQXNzaWduZWUgYW5kDQo+ICAgIHRoZSBDb250YWN0LCB0aGUgQXNzaWduZWUgZGVjaXNp
b25zIHRha2UgcHJlY2VkZW5jZSwiIHdoaWNoIHRvIG1lDQo+ICAgIHJlYWRzIGxpa2UgYSBw
ZXJzb24gaXMgcmVxdWlyZWQgKGFuZCBJJ20gaGFwcHkgdG8gY29udGludWUgZmlsbGluZw0K
PiAgICB0aGlzIHJvbGUpLg0KVGhhdCBtZWFuczogVGhlICJBc3NpZ25lZSIgKHRoZSBNTCkg
aGFzIHByZWNlZGVuY2Ugb3ZlciBkZWNpc2lvbnMgbWFkZSANCmJ5IHRoZSAiQ29udGFjdCIg
KHlvdSkuDQoNCvCfpJQNCg0KPiAtIEZvciB0aGUgZGVzY3JpcHRpb24sIEkgd291bGQgbGlr
ZSB0byBkcm9wIHRoZSAiTGludXgiIHBhcnQgaW4gdGhlDQo+ICAgIGRlc2NyaXB0aW9uLiBU
aGVyZSBhcmUgaW1wbGVtZW50YXRpb25zIG9mIE5CRCB0aGF0IGFyZSB3aG9sbHkNCj4gICAg
dW5yZWxhdGVkIHRvIExpbnV4LCBhbmQgc28gSSBkb24ndCB0aGluayBpdCdzIGVudGlyZWx5
IGFjY3VyYXRlDQo+ICAgIGFueW1vcmUgdG8gcmVmZXIgdG8gTkJEIGFzIGEgIkxpbnV4IiBw
cm90b2NvbC4NCg0KQUNLLg0KDQpJIGFtIGN1cmlvdXM6IEFyZSB0aGVyZSBvdGhlciBPUyAo
QlNEIGZsYXZvdXJzPykgdGhhdCB1c2VzIE5CRCBhdCB0aGUgDQpjbGllbnQgc2lkZT8gSWYg
eWVzLCB0aGV5IHNob3VsZCBiZSBtZW50aW9uZWQgaW4gdGhlIE5CRCdzIHJlYWRtZSwgSSdk
IA0Kc3VnZ2VzdC4NCg0KPiAtIEF0IHRoZSB0aW1lLCB0aGVyZSB3YXMgbm8gcHVibGljIHJl
ZmVyZW5jZSBmb3IgdGhlIE5CRCBwcm90b2NvbCB5ZXQ7IEkNCj4gICAgcGxhbiB0byBhZGQg
dGhlIGxpbmsgdG8gcHJvdG8ubWQgb24gZ2l0aHViIGFzIHRoZSBvZmZpY2lhbCByZWZlcmVu
Y2UuDQo+IA0KPiBUaG91Z2h0cz8NCg0KR28gZm9yIGl0ISA6LSkNCg0KCQlMYXJzIFIuDQoN
Cg==

--------------NmBl0NfGyho260wZNAh4gN1P--

--------------n3LfRgGn0K9FXkjhBS0IeB4v
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsEBBAABCAAjFiEEgvhNxzjijE7doMajz24L8sM/oJ4FAmYpCxMFAwAAAAAACgkQz24L8sM/oJ7/
lww/UupOl3bbtcnAU44RuHkFIfH6sIgS7SjAAKkaAGi7AqRXK0fDn5BcEXOmF7n6heF8hD5XzIpN
aw3Z3WvTKZiZiK1FcJRKjLlC5acZ77U9PuOplUd+ZMuALoq+EdvnPTUJ1GsJJkkDV+GKqRoVBFIZ
BgHwtnOR1fwnQgQv1PClx/pLkcQYpC4Zv9IXfoUkgO/amEhP+4SB1m0IkaLeLypdPCboeQcWKl/a
AFh/dNpAU+8j0oVlV0T9mIp07YLsccytiq7fGm5UkLWnYBCLSDLMdHoeWI+KHY785vC73K5MwPsB
xowwPiYNqAi0mFnvXkZZ9dMTJR+SsUzlBIad2TrYBJS+7fNW0wvOjkZWXGfDcWEo+drU6OQDONad
mq/pEqnyFKikC9rx3khPdhJccJ+BKnGmHSi0AzXT5/0J5dU1CbSFImAXYbE675A66hK+QHLs/HJb
ThE9R2vxDmggovq57a/5gtAw2VCjLTdRPvKBHKsYwEUKgYFKXhc1VltbZtMExomWLE2j+/k=
=lNIH
-----END PGP SIGNATURE-----

--------------n3LfRgGn0K9FXkjhBS0IeB4v--

