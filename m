Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 660AA8BD571
	for <lists+nbd@lfdr.de>; Mon,  6 May 2024 21:30:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4B19C204B8; Mon,  6 May 2024 19:30:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May  6 19:30:16 2024
Old-Return-Path: <roker@pep-project.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=4.0 tests=FOURLA,KHOP_HELO_FCRDNS,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,PGPSIGNATURE,
	WORD_WITHOUT_VOWELS autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3EBF420448
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 May 2024 19:30:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.831 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, KHOP_HELO_FCRDNS=0.069,
	LDO_WHITELIST=-5, MD5_SHA1_SUM=-1, PGPSIGNATURE=-5,
	WORD_WITHOUT_VOWELS=1] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kj0caBpdfpwG for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 May 2024 19:29:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from pibit.ch (dragon.pibit.ch [185.203.114.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E36A8204B8
	for <nbd@other.debian.org>; Mon,  6 May 2024 19:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dragon.pibit.ch (Postfix) with ESMTP id 416CE21409F0
	for <nbd@other.debian.org>; Mon,  6 May 2024 21:29:51 +0200 (CEST)
Received: from pibit.ch ([127.0.0.1])
 by localhost (dragon.pibit.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YVQ_3HtcLG0S for <nbd@other.debian.org>;
 Mon,  6 May 2024 21:29:51 +0200 (CEST)
Received: from 127.0.0.1 (pd9e54845.dip0.t-ipconnect.de [217.229.72.69])
	by dragon.pibit.ch (Postfix) with ESMTPSA id 0E0B121408C7
	for <nbd@other.debian.org>; Mon,  6 May 2024 21:29:51 +0200 (CEST)
Message-ID: <4d483dbd-3198-49c1-824f-b92756697682@pep-project.org>
Date: Mon, 6 May 2024 21:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: nbd@other.debian.org
From: Lars Rohwedder <roker@pep-project.org>
Subject: [PATCH] buffer is 'const void*' in output functions, as in write(2),,
 fwrite(3) etc.
Autocrypt: addr=roker@pep-project.org; keydata=
 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
 GIaZVwoJisucuww=
Organization: =?UTF-8?B?8J+Ukg==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kvFHBUCi5LJoN7DITHMJjf4Y"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <V6D9Ht_eC7G.A.8v.I_SOmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2802
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4d483dbd-3198-49c1-824f-b92756697682@pep-project.org
Resent-Date: Mon,  6 May 2024 19:30:16 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kvFHBUCi5LJoN7DITHMJjf4Y
Content-Type: multipart/mixed; boundary="------------NubLuHBGti7zzKAr0tK35wT3";
 protected-headers="v1"
From: Lars Rohwedder <roker@pep-project.org>
To: nbd@other.debian.org
Message-ID: <4d483dbd-3198-49c1-824f-b92756697682@pep-project.org>
Subject: [PATCH] buffer is 'const void*' in output functions, as in write(2),,
 fwrite(3) etc.

--------------NubLuHBGti7zzKAr0tK35wT3
Content-Type: multipart/mixed; boundary="------------xa7xnwZ9VxRK1cPYkFaUssgX"

--------------xa7xnwZ9VxRK1cPYkFaUssgX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UmVhc29uOiBmb3IgY29uc2lzdGVuY3kgd2l0aCBleGlzdGluZyBvdXRwdXQgZnVuY3Rpb25z
IGluIHRoZSBDIHN0ZCANCmxpYnJhcnkgYW5kIGJldHRlciBDKysgaW50ZWdyYXRpb24gc3Vw
cG9ydC4NCg0KDQpPciBhcHBseSBHaXRodWIgcHVsbCByZXF1ZXN0Og0KDQpodHRwczovL2dp
dGh1Yi5jb20vTmV0d29ya0Jsb2NrRGV2aWNlL25iZC9wdWxsLzE2Mw0KDQpUaGFuayB5b3Uh
IDotKQ0KDQoJTGFycyAicm9rZXIiIFIuDQo=
--------------xa7xnwZ9VxRK1cPYkFaUssgX
Content-Type: text/plain; charset=UTF-8;
 name="0001-buffer-is-const-void-in-output-functions-as-in-write.patch"
Content-Disposition: attachment;
 filename*0="0001-buffer-is-const-void-in-output-functions-as-in-write.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBhYjQ0MWE3MGRjODM4YWMyMDI1MmZlNDBmZmVhMzlmZTJhM2FlNjcwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiAiTGFycyBILiBSb2h3ZWRkZXIiIDxSb2tlckhST0B1
c2Vycy5ub3JlcGx5LmdpdGh1Yi5jb20+CkRhdGU6IE1vbiwgNiBNYXkgMjAyNCAyMToxOTox
NSArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIGJ1ZmZlciBpcyAnY29uc3Qgdm9pZConIGluIG91
dHB1dCBmdW5jdGlvbnMsIGFzIGluIHdyaXRlKDIpLAogZndyaXRlKDMpIGV0Yy4KCi0tLQog
Y2xpc2Vydi5jICAgIHwgMiArLQogY2xpc2Vydi5oICAgIHwgMiArLQogbmJkLXNlcnZlci5j
IHwgNiArKystLS0KIG5iZHNydi5oICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NsaXNlcnYuYyBi
L2NsaXNlcnYuYwppbmRleCA0NmE3OTBlLi45MzQxZTYwIDEwMDY0NAotLS0gYS9jbGlzZXJ2
LmMKKysrIGIvY2xpc2Vydi5jCkBAIC0xMzksNyArMTM5LDcgQEAgaW50IHJlYWRpdChpbnQg
Ziwgdm9pZCAqYnVmLCBzaXplX3QgbGVuKSB7CiAgKiBAcGFyYW0gbGVuIHRoZSBudW1iZXIg
b2YgYnl0ZXMgdG8gYmUgd3JpdHRlbgogICogQHJldHVybiAwIG9uIHN1Y2Nlc3MsIG9yIC0x
IGlmIHRoZSBzb2NrZXQgd2FzIGNsb3NlZAogICoqLwotaW50IHdyaXRlaXQoaW50IGYsIHZv
aWQgKmJ1Ziwgc2l6ZV90IGxlbikgeworaW50IHdyaXRlaXQoaW50IGYsIGNvbnN0IHZvaWQg
KmJ1Ziwgc2l6ZV90IGxlbikgewogCXNzaXplX3QgcmVzOwogCXdoaWxlIChsZW4gPiAwKSB7
CiAJCURFQlVHKCIrIik7CmRpZmYgLS1naXQgYS9jbGlzZXJ2LmggYi9jbGlzZXJ2LmgKaW5k
ZXggOGE4OWMwNC4uYjhlNzk3OCAxMDA2NDQKLS0tIGEvY2xpc2Vydi5oCisrKyBiL2NsaXNl
cnYuaApAQCAtODksNyArODksNyBAQCB1aW50NjRfdCBudG9obGwodWludDY0X3QgYSk7CiAj
ZW5kaWYKIAogaW50IHJlYWRpdChpbnQgZiwgdm9pZCAqYnVmLCBzaXplX3QgbGVuKTsKLWlu
dCB3cml0ZWl0KGludCBmLCB2b2lkICpidWYsIHNpemVfdCBsZW4pOworaW50IHdyaXRlaXQo
aW50IGYsIGNvbnN0IHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbik7CiAKICNkZWZpbmUgTkJEX0RF
RkFVTFRfUE9SVAkiMTA4MDkiCS8qIFBvcnQgb24gd2hpY2ggbmFtZWQgZXhwb3J0cyBhcmUK
IAkJCQkJICogc2VydmVkICovCmRpZmYgLS1naXQgYS9uYmQtc2VydmVyLmMgYi9uYmQtc2Vy
dmVyLmMKaW5kZXggMzc0OWI3NC4uYzUyOTRhYyAxMDA2NDQKLS0tIGEvbmJkLXNlcnZlci5j
CisrKyBiL25iZC1zZXJ2ZXIuYwpAQCAtMzAxLDcgKzMwMSw3IEBAIHN0cnVjdCBnZW5lcmlj
X2NvbmYgewogfTsKIAogI2lmIEhBVkVfR05VVExTCi1zdGF0aWMgaW50IHdyaXRlaXRfdGxz
KGdudXRsc19zZXNzaW9uX3Qgcywgdm9pZCAqYnVmLCBzaXplX3QgbGVuKSB7CitzdGF0aWMg
aW50IHdyaXRlaXRfdGxzKGdudXRsc19zZXNzaW9uX3QgcywgY29uc3Qgdm9pZCAqYnVmLCBz
aXplX3QgbGVuKSB7CiAJX2NsZWFudXBfZ19mcmVlXyBjaGFyICptID0gTlVMTDsKIAlzc2l6
ZV90IHJlczsKIAl3aGlsZShsZW4gPiAwKSB7CkBAIC0zNDUsNyArMzQ1LDcgQEAgc3RhdGlj
IGludCBzb2NrZXRfcmVhZF90bHMoQ0xJRU5UKiBjbGllbnQsIHZvaWQgKmJ1Ziwgc2l6ZV90
IGxlbikgewogCXJldHVybiByZWFkaXRfdGxzKCooKGdudXRsc19zZXNzaW9uX3QqKWNsaWVu
dC0+dGxzX3Nlc3Npb24pLCBidWYsIGxlbik7CiB9CiAKLXN0YXRpYyBpbnQgc29ja2V0X3dy
aXRlX3RscyhDTElFTlQqIGNsaWVudCwgdm9pZCAqYnVmLCBzaXplX3QgbGVuKSB7CitzdGF0
aWMgaW50IHNvY2tldF93cml0ZV90bHMoQ0xJRU5UKiBjbGllbnQsIGNvbnN0IHZvaWQgKmJ1
Ziwgc2l6ZV90IGxlbikgewogCXJldHVybiB3cml0ZWl0X3RscygqKChnbnV0bHNfc2Vzc2lv
bl90KiljbGllbnQtPnRsc19zZXNzaW9uKSwgYnVmLCBsZW4pOwogfQogI2VuZGlmIC8vIEhB
VkVfR05VVExTCkBAIC0zNTQsNyArMzU0LDcgQEAgc3RhdGljIGludCBzb2NrZXRfcmVhZF9u
b3RscyhDTElFTlQqIGNsaWVudCwgdm9pZCAqYnVmLCBzaXplX3QgbGVuKSB7CiAJcmV0dXJu
IHJlYWRpdChjbGllbnQtPm5ldCwgYnVmLCBsZW4pOwogfQogCi1zdGF0aWMgaW50IHNvY2tl
dF93cml0ZV9ub3RscyhDTElFTlQqIGNsaWVudCwgdm9pZCAqYnVmLCBzaXplX3QgbGVuKSB7
CitzdGF0aWMgaW50IHNvY2tldF93cml0ZV9ub3RscyhDTElFTlQqIGNsaWVudCwgY29uc3Qg
dm9pZCAqYnVmLCBzaXplX3QgbGVuKSB7CiAJcmV0dXJuIHdyaXRlaXQoY2xpZW50LT5uZXQs
IGJ1ZiwgbGVuKTsKIH0KIApkaWZmIC0tZ2l0IGEvbmJkc3J2LmggYi9uYmRzcnYuaAppbmRl
eCA4YWVlYzgzLi40NTkwYzg2IDEwMDY0NAotLS0gYS9uYmRzcnYuaAorKysgYi9uYmRzcnYu
aApAQCAtNzgsNyArNzgsNyBAQCB0eXBlZGVmIHN0cnVjdCBfY2xpZW50IHsKIAl2b2lkICp0
bHNfc2Vzc2lvbjsJLyoqPCBUTFMgc2Vzc2lvbiBjb250ZXh0LiBJcyBOVUxMIHVubGVzcyBT
VEFSVFRMUwogCQkJCSAgICAgaGFzIGJlZW4gbmVnb3RpYXRlZC4gKi8KIAlpbnQgKCpzb2Nr
ZXRfcmVhZCkoc3RydWN0IF9jbGllbnQqLCB2b2lkKiBidWYsIHNpemVfdCBsZW4pOwotCWlu
dCAoKnNvY2tldF93cml0ZSkoc3RydWN0IF9jbGllbnQqLCB2b2lkKiBidWYsIHNpemVfdCBs
ZW4pOworCWludCAoKnNvY2tldF93cml0ZSkoc3RydWN0IF9jbGllbnQqLCBjb25zdCB2b2lk
KiBidWYsIHNpemVfdCBsZW4pOwogCXZvaWQgKCpzb2NrZXRfY2xvc2VkKShzdHJ1Y3QgX2Ns
aWVudCopOwogfSBDTElFTlQ7CiAKLS0gCjIuMzkuMgoK

--------------xa7xnwZ9VxRK1cPYkFaUssgX--

--------------NubLuHBGti7zzKAr0tK35wT3--

--------------kvFHBUCi5LJoN7DITHMJjf4Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsEBBAABCAAjFiEEgvhNxzjijE7doMajz24L8sM/oJ4FAmY5L64FAwAAAAAACgkQz24L8sM/oJ7f
ZQw/cHUYqtylj90kTW3uaMvzCJAm2G8z8vphotv+GccTClpk+H4yx6hIet22mps0sk96FR7Lh0OY
MOhC3qXav5ICJ71XG2XLFu6CtpA7oVFO2x37uA+2rn8Tn35IJNXnrQ+UOkNTx+SBFCOqSHc/KMid
xb3ynkdCojDz7LK+CjXsxn9de7Ne54XbLVSt+C3WT1aXTMtXzsUbik9ogWT6z6OAo1DmWUC/wg1q
X6+ZKSHzvSF8NK2o6inL4BpNiMji3BCfNsFeSV7oJuDwSpCkBlW9QVdb1ek8F/BfUAeEq1dpFvUO
xFMhD6aQYnMsHG+NCp7w0aKocAcxFE53hjbXwMrQYw+7IocETPvQBqM46ca6Atq1BvtEVABSAzNY
W7UbE71mEDiuYSJKfxZ8l2Ur0HjKVBw8/I9TfpEMPNa8kxnZEmi1so2v7dHXFMACORRp8dseyAse
BekPtW0dIfzNOPJfam/1o4/gTK0FdJUtyKY+G8aJ7CTI51vO5FDSUye/qHMPBDozmuVd1mQ=
=6hKd
-----END PGP SIGNATURE-----

--------------kvFHBUCi5LJoN7DITHMJjf4Y--

