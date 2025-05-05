Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAD4AA98C6
	for <lists+nbd@lfdr.de>; Mon,  5 May 2025 18:24:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E32522049B; Mon,  5 May 2025 16:24:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May  5 16:24:40 2025
Old-Return-Path: <berend@deschouwer.co.za>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	PGPSIGNATURE,RCVD_IN_DNSWL_NONE,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SARE_MSGID_LONG40 autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F375E20494
	for <lists-other-nbd@bendel.debian.org>; Mon,  5 May 2025 16:24:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.961 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SARE_MSGID_LONG40=0.637]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id V34nJWyhaKCi for <lists-other-nbd@bendel.debian.org>;
	Mon,  5 May 2025 16:24:22 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -3.5
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "mailout.proton.ch", Issuer "mailout.proton.ch" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4DE8020457
	for <nbd@other.debian.org>; Mon,  5 May 2025 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=deschouwer.co.za;
	s=protonmail3; t=1746462222; x=1746721422;
	bh=2UQER3QNDe1LcOya6BZrc7aMTZtkWEV83SnVgg76+dA=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=CWNbIeezJJeEMdRJfJaBy4zG4m7YpjqYLXMzf7EY+5XSqoCNHs1D1VEgfFs8rnz7o
	 8n7l91bM5WgVDu/jmD4vf1Q1kUrcP9i7+wSgOzz4xbVSatnQd7cka+j140PK6u+mPf
	 OF2DNOQ9vIONbrcdOQMXRDnNUGvLMklwGzJGm3LhJOHVeTm2GgCPMLAbOO4rq2nStD
	 UVlictA/W//+3EY8+KAFMOktwCWelWljcawcH8RV9kZVUNc3w5Z8aCI5gLIU45cHyp
	 YHYfjmQjhwxS8D21uKnQa2vnrzshgc4vEGyxIW5PONfb3+Nn9aL/ZrO9XamnCdFhhU
	 MK0tWZzQzUDIg==
Date: Mon, 05 May 2025 16:23:39 +0000
To: nbd@other.debian.org
From: berend <berend@deschouwer.co.za>
Subject: Re: nbd copy-on-write corruption
Message-ID: <7113227fb3a6a9cd7a3cf13f76ff1119bdc6438a.camel@deschouwer.co.za>
In-Reply-To: <1b35de1e82510f089317f722252ddba8502261c3.camel@deschouwer.co.za>
References: <1b35de1e82510f089317f722252ddba8502261c3.camel@deschouwer.co.za>
Feedback-ID: 50941660:user:proton
X-Pm-Message-ID: 250b8e0cd252fce6615b1228190cc96b1ce73459
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------1f6e4b6d5ab22fecdd1672640de7fb6407a3c7f4e578be6aa9422e8119fe1466"; charset=utf-8
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4zqnTZSMj5C.A.JoHG.IZOGoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3375
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/7113227fb3a6a9cd7a3cf13f76ff1119bdc6438a.camel@deschouwer.co.za
Resent-Date: Mon,  5 May 2025 16:24:40 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------1f6e4b6d5ab22fecdd1672640de7fb6407a3c7f4e578be6aa9422e8119fe1466
Content-Type: multipart/mixed;
 boundary=bba985c1e4365eb34fade835b0f23dce6f20c19b61ea82a8097604b203dd
Message-ID: <7113227fb3a6a9cd7a3cf13f76ff1119bdc6438a.camel@deschouwer.co.za>
Subject: Re: nbd copy-on-write corruption
From: berend <berend@deschouwer.co.za>
To: nbd@other.debian.org
Date: Mon, 05 May 2025 18:23:33 +0200
In-Reply-To: <1b35de1e82510f089317f722252ddba8502261c3.camel@deschouwer.co.za>
References: 
	<1b35de1e82510f089317f722252ddba8502261c3.camel@deschouwer.co.za>
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0

--bba985c1e4365eb34fade835b0f23dce6f20c19b61ea82a8097604b203dd
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8

T24gTW9uLCAyMDI1LTA1LTA1IGF0IDE4OjE5ICswMjAwLCBiZXJlbmQgd3JvdGU6Cj4gRmlyc3Qg
cGF0Y2g6Cj4gCj4gZGlmZiAtLWdpdCBhL25iZC1vcmlnL25iZC1zZXJ2ZXIuYyBiL25iZC1wYXRj
aGVkL25iZC1zZXJ2ZXIuYwo+IGluZGV4IDkyZmQxNDEuLmQxZDQ1YjIgMTAwNjQ0Cj4gLS0tIGEv
bmJkLW9yaWcvbmJkLXNlcnZlci5jCj4gKysrIGIvbmJkLXBhdGNoZWQvbmJkLXNlcnZlci5jCj4g
QEAgLTE1ODMsNiArMTU4Myw3IEBAIGludCBleHByZWFkKFJFQURfQ1RYICpjdHgsIENMSUVOVCAq
Y2xpZW50KSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZ290byBmYWlsOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29uZmlybV9yZWFkKGNsaWVudCwgY3R4LCByZGxlbik7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN0eC0+Y3VycmVudF9vZmZz
ZXQgKz0gcmRsZW47Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7IC8q
IHRoZSBibG9jayBpcyBub3QgdGhlcmUgKi8KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmICgoY2xpZW50LT5zZXJ2ZXItPmZsYWdzICYgRl9XQUlUKSAm
Jgo+IChjbGllbnQtPmV4cG9ydCA9PSBOVUxMKSl7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgREVCVUcoIlBhZ2UgJWxsdSBp
cyBub3QgaGVyZSwgYW5kCj4gd2FpdGluZyBmb3IgZmlsZVxuIiwKCgouLi4gYW5kIEkgc3dhcHBl
ZCB0aGUgbGluZXMsIHNvIEkgaGF2ZSB0byByZXNwb25kIHRvIG15IG93biBtYWlsIC4uLgoKZGlm
ZiAtLWdpdCBhL25iZC1vcmlnL25iZC1zZXJ2ZXIuYyBiL25iZC1wYXRjaGVkL25iZC1zZXJ2ZXIu
YwppbmRleCA5MmZkMTQxLi4xOGU1ZGRkIDEwMDY0NAotLS0gYS9uYmQtb3JpZy9uYmQtc2VydmVy
LmMKKysrIGIvbmJkLXBhdGNoZWQvbmJkLXNlcnZlci5jCkBAIC0xNTgyLDYgKzE1ODIsNyBAQCBp
bnQgZXhwcmVhZChSRUFEX0NUWCAqY3R4LCBDTElFTlQgKmNsaWVudCkgewogICAgICAgICAgICAg
ICAgICAgICAgICBpZiAocHJlYWQoY2xpZW50LT5kaWZmZmlsZSwgYnVmLCByZGxlbiwgY2xpZW50
LQo+ZGlmbWFwW21hcGNudF0qRElGRlBBR0VTSVpFK29mZnNldCkgIT0gcmRsZW4pIHsKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGZhaWw7CiAgICAgICAgICAgICAgICAgICAg
ICAgIH0KKyAgICAgICAgICAgICAgICAgICAgICAgY3R4LT5jdXJyZW50X29mZnNldCArPSByZGxl
bjsKICAgICAgICAgICAgICAgICAgICAgICAgY29uZmlybV9yZWFkKGNsaWVudCwgY3R4LCByZGxl
bik7CiAgICAgICAgICAgICAgICB9IGVsc2UgeyAvKiB0aGUgYmxvY2sgaXMgbm90IHRoZXJlICov
CiAgICAgICAgICAgICAgICAgICAgICAgIGlmICgoY2xpZW50LT5zZXJ2ZXItPmZsYWdzICYgRl9X
QUlUKSAmJgooY2xpZW50LT5leHBvcnQgPT0gTlVMTCkpewoKCg==
--bba985c1e4365eb34fade835b0f23dce6f20c19b61ea82a8097604b203dd
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - Berend De Schouwer -
 0x128CD671.asc"; name="publickey - Berend De Schouwer - 0x128CD671.asc"
Content-Type: application/pgp-keys; filename="publickey - Berend De Schouwer
 - 0x128CD671.asc"; name="publickey - Berend De Schouwer - 0x128CD671.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuOC4yCgp4c0ZOQkZXS2tVRUJFQURYdWlFWVcx
WUlnTm5yYXpFby8wemVsVHp4YkhDRy93V3huN0FTdWQ4eEhMMWpxWks1CnF4UVMvNldSYm5RdjVj
NURQdmsxT2Y2RS8yWFZzRlVRSmdSMVlGeEd0TnQxUUFsNVIwdmo3cnZyOG5CYmVRaGMKbUhzdndH
cFQ3YWJrZXZXRnZtY0hiTktmWGJjL3NmRHJDTW90UkZRQm9oYzdveW8rTnpPSk9RcEpxQ2J6d2sr
awpWbVZoVkhwdzhZenZuRDJzVkRxYlFPeHRXbXJjb2ZtOURiMjhORTBOY04yUDlBQmJOSnV0MVFV
Wld0WjFsbVc2CnJ5aGdLckM0dXhTei9ZTmNjNXpzMlo3NjFTR0tPU1k4UFZ6dlZrTGJLOWZiZFk3
amNnR0NGZDZHUllPQjJJM0IKN0NPOXVhZnVUb0NEeWhscWx1Z1dYcEdvQTVCN28vYTRaMWI3cWxO
c0VtcWxHaCtlRDk0SDhNL0xXOGR3WU5SSQpvVU5ZSWF5UkYxT1FwcmM1UHozaUN4YW9ub0lpR2Z4
R1pxTktUOVFXb0lnOHJPQzA4dGNyOHVqNG0xUmpKcnN6ClNqdGt3c29tMFV3cEJ5Z0hlLzNCcDR4
WlN4Z2FmTXc2ZEdTS1JzRFRBSGoyRkpGV2N0Tmx1WTRqdnhSWDdDdVcKNTlRMzVKSUU4bStPZ1li
Z0xrR1FmRWRVeWhjUnFCMCtWUjJXUmxYNXNLVVprV2cxQWhnY0w3RmltTmxsM2YwNgp5ZS91emJy
YVVZSFg3eGMzdjVDSjJaNnd4Nk1waFp6aGh4dUJxTGNZSkViTjlmTnNldlRPWWtFUUlzR0M3Tldv
ClQyaHkzdWplWUJQajNjbzJOZDRpV085dHB5c0xaOGdLMTUvZE5qTUJUc3ByUys5UlBxZ3o1QnRG
bXdBUkFRQUIKelN4Q1pYSmxibVFnUkdVZ1UyTm9iM1YzWlhJZ1BHSmxjbVZ1WkVCa1pYTmphRzkx
ZDJWeUxtTnZMbnBoUHNMQgplQVFUQVFJQUlnVUNWWXFSUVFJYkF3WUxDUWdIQXdJR0ZRZ0NDUW9M
QkJZQ0F3RUNIZ0VDRjRBQUNna1EyMjdnCmNaT0FvT25YZGcvOUVGZFJyL1h0T1liQmVsdGIwc05I
YVNQN1M0dmtscWNBdE9udFRZVjN5TUZOdjlYQlhYdkYKU0thR2wwbTVMaGVOQWtJdS9ZYkFkR1h5
U3pOVWQ3V3NmeWIrMjNpcTVVS0d0K3dEK1JvY0xaWTA5NHVBS2NRUQpUWndKS1R3NHRLSWdONHFC
dE9hTmlKd0x1cnNOWllBUDdKSUpGUFFZNTVwYSt5ZWMzanhmVFgwYTdydWllY29zCm16YXZRMTgy
VitMZGV2Mmtvckd2WTFjejQzclA4eGlMMURqdGNCVW5laWdiajUrTjBaOFVsam5SNlFrU1J1YWoK
ZHNHQkFYSG1rT3NCVi9vOE04dkZXYThOODN1czFHa3k1SzU0eFFPYVZ5TlJWclI0RUlTdjh5MGkz
M3J3R1l2UApCRCtSS2FMYWN1S2I4KzhLTlZ1UTVNMHYrNHBHci9GZVhwUCtuUHpWRGZiWlpoWDFp
d2VRMDY5TEthOXJlZjhxCkV3NFZWdDdBdVlGU3dlSFZNSUNBMFpHeUtKNWhaejdMZEkwdkFGQU55
VXQwS29XZWVLNjl4aWs4cnZGNzVlbzQKZnovV0p0Zi9BZG5DdVlwNjBvYm94L3NKQTdLclpyV1FO
YkRjbEplZmlTWlY3dHVIaDdqTEpxUXVma201RDVnbwp3QUFvNWdyTS82V0FOSFZ3NWlvak0vVUc2
ZjArdEZaWGdGTXlrMkpaeTljMnM4VlFnSTJVenJiVThKc0N0ZERqCkJVU1RDNjRSN2tsdlY1Ymt1
MzFBbTNSUEMyOWwxaGZZKzNVTGc0dzhtbXBKMjhwcSsvejBvS0g4Q3d5aWN1RlAKRkJHOTVsbi83
dHRlNGlmV2tmek1MOE9oMmJwdUtFYjJQV1I0NHNRMVpxOCtJQWpTMlh3TDQ1N093VTBFVllxUgpR
UUVRQUtYYUwvaEhueXdzRnlVUVVHNVdxYm9xSHRWODNTNEc5aEpMQ25MOWhnU0J2Z2twbTRjNi85
Mmt6Lzh5CmdvRTRjUjNHSmZsZm40OHRUNFkvWDZzTkZiSXY5VkhpWVo4aW9YVUc0bHBhMFIyN3pk
MVZZT1pXUStvS3RjRnoKb1djVlViOHQrT1BoM2tuME5WQWxFRnlya0k5YWdUc0p1OFJ0alNpMEV6
Wi9iQ0xaTStFMU9UQnpZUzFuelZlcgp1NVVid1FWbXAzbUlzS2JSVTRRbnpZSElWVGNFeDF5SGxC
M1ZkZFd6M0pnenVsWlF4SDdRREVGaTVBaDhjcUVDCjJSZ2w2K2JkdVBqYnJBK2RwV2VaTGtvUGhH
d0xZcVM0YnJxN0ZBbmtMMjFSTGVGQzkvY203dTNaMnozd1o5QXkKZWt2bmtPNnhxdGlqcDB2Y0RD
V3kxbldiV0tpN2Y5K1NQWW5xTTNKVFBqWnlobk9CQ2pWTFhUcnlYQ3BhRGFCYgpnWGZRSlpMOWwx
bTRqVzBoQjNEdlU5eGQ2Zi8zdW1vODMzS1BnMm5XenpnZ0tRODREUUd3L0hYdkFSdDVtR0ZTCmQv
REtkMlliTHc5QjJKSlpqb2kzc2VGWlN6YVZKZ0FWZk9neUk0NHRnN3pJSlVUZDk2VzVpeEE3SEVP
TkV4cG0KQ0JrZ3ArMmswZEg1SU84c1lXd1o0c3lXQk5kZ1cxeGd2Qzc1dm94TmZTZGJmcGRhMG91
YU5xYVR0YjdzcnlVZApsTFZ3bExZZkV4NU9EeFFVY1VyNHRKUDhsR1I4dkEwemhGSEJhTEdCcjBa
SU16UU5TcS9jS3NrNnNESXI0Wms1ClZMT0VVN3R3SFRrZjQ3bXpWTExCQmZ6alJJc2hXRnJvNnBj
NDFBaGk5Y3ArQ3hLYkFCRUJBQUhDd1Y4RUdBRUMKQUFrRkFsV0trVUVDR3d3QUNna1EyMjdnY1pP
QW9PbXkzUkFBdGpNMGtPQjN1OTZ0S0pieGpERnlUTjZhTk9WLwo5WXk2V2doRjJITldvN0hzbk55
dnNRTkF1cHhWMndBTGF0UGVjUFgrL04vdWVGUUtyQTMvd3FVUTkwMkw0VXhWCnJMa1d5a2RZb09P
cGd4TUxkUXB6Z2NRT1RTV1BDdlAwVi9jVnNYY1dKaVZFRGg5VGp1SzBLc1loRm1XR2E2bmUKNHVS
MVY2VkJ5SUtaay9vRGthSVhCanJaU1ZUT1M2ZzZWRi9XaWhHKy9NL0MyZU94eEJZMzdqWm5xREpR
bjNxWApoWTJjVE4wbTlrTFFQdjJqUE9LcjAzUHIvbFdIV1Rpc1EzRkNWbG1ZUTBJSUcyRlpKSmNS
RGNELzhOOGpoMWVhCnpFQmowK1lSMitMUUxzVWN6bDBQSkM0TGV4eERTUVg4MlRlV21nUklXc3Mv
UTM2VUNIOVNyOFl6Sk9BSkxWWEYKNUJMQXgybFlVQWk4bmN0cjhIMmdML0RQOHlOT3hBZ05QSVhy
QjNnQk9XYTF4MmNROHNOeDMvVXVYZFIyNXQyYgo3eGpseFdlWmM5ejJnTzlyZUVKRWt6a21HVjhR
Sk1QSFAvejZRdTZIUVlqUFlyL3I0T1FSSGFpN1RMSkZsTFBNCkJLQTJGVWlZNzFaTUxZWHRXUms1
WG85SnVGL0F0dncwU3JxcFoyRE5PeUtLZmJzMTRNOS84RXkzUUFVTklTSXQKUDQyMlJNQUQxdzha
WGcxWlBqSEo4TGo3Qms3RTJGN0YzVlUwSXFCSVVsc1J5eUJvMUs3SDdRT1pwdmJFeERRSgpnMWx4
YlhhS1lrRFEwREdhb2FnT3pVYVo5ckxCdkpFNHo3QzBTZ3BjWFpaMHJuT3lkdm5GMGhCWG93djdX
YkYrCmk0WlB5REJjM242OHJxcz0KPTlTWGwKLS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0st
LS0tLQ==
--bba985c1e4365eb34fade835b0f23dce6f20c19b61ea82a8097604b203dd--

--------1f6e4b6d5ab22fecdd1672640de7fb6407a3c7f4e578be6aa9422e8119fe1466
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsGpBAEBCABdBYJoGOYKCZDbbuBxk4Cg6TUUAAAAAAAcABBzYWx0QG5vdGF0
aW9ucy5vcGVucGdwanMub3JnHaUspD/2kz5WimZe9fmtHBYhBBKM1nGLSON6
q6UFAttu4HGTgKDpAACbphAApCOk9N0DGqt9OL2gDZe65zWd938DeRqMLJlh
UXVMdWukNejzkgLkEcxcIVaFqZVMMyGn/G4tV6BiYSgTiOXIfKca4Lz1QU+O
krsrY5Xp2QtUNn+MDqJ00mSN1xns79zsyhHbIJFMDI4MDYOQiSPtF5uG10SQ
gyhYsNDQ11qsN8431O2kUlCvOOlULOuzVIv4RdRvmGIACpmW1tTgCAqlQg/K
5BMwexfBItzVnfLvr1Cy2CZujH7CHfzDb7jAF/eqtZx6oVJtwrjS7WxO4ORs
OcfmOfWZkxjeYOErsksetCGm2B5FxeHA0yTJxNYckp0EvUfpgHPF3FZn/bTj
SvUlTyBs885rZ0HVejIH2M6lUJDLPq4KXh/w+eO5zfWehVTJkzTaR1j+cAuL
X0tgJq5uUPtyzZbZDcuIqNvQKCQGmRbiJao6Q1lYk0l9YZghWfzjgcPh3Qkn
yu2AOSL8qFmRcTu2Aqg4fV92hPmBBFYi7CU1l7ilHscqOQXFdeDjqT+1Vi4M
3trLrRN1UvFkd2JGX+z0N5TJxVwubCalsITr5x1d5zFKRsp+DegRQFryzxq3
PvaTbWjy5ROZtITrxHb9u/jlXk1W5yf5XvNao7vUwd8e5Odio2Ll3VYqTGu8
8UNMGhS3MgEk/m0W7BzCOB1ByWv3akypoZ2xOXHacvl7Zt8=
=YXlu
-----END PGP SIGNATURE-----


--------1f6e4b6d5ab22fecdd1672640de7fb6407a3c7f4e578be6aa9422e8119fe1466--

