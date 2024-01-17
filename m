Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EE3830F0E
	for <lists+nbd@lfdr.de>; Wed, 17 Jan 2024 23:06:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 847D3205FA; Wed, 17 Jan 2024 22:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan 17 22:06:09 2024
Old-Return-Path: <roker@pep-project.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=4.0 tests=KHOP_HELO_FCRDNS,
	LDOSUBSCRIBER,LDO_WHITELIST,PGPSIGNATURE,PLING_QUERY,
	SARE_HEAD_8BIT_SPAM,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6CBFE205F2
	for <lists-other-nbd@bendel.debian.org>; Wed, 17 Jan 2024 22:05:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.021 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, KHOP_HELO_FCRDNS=0.001, LDO_WHITELIST=-5,
	PGPSIGNATURE=-5, PLING_QUERY=0.1, SARE_HEAD_8BIT_SPAM=0.888,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rlBHq00-aZQP for <lists-other-nbd@bendel.debian.org>;
	Wed, 17 Jan 2024 22:05:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from pibit.ch (dragon.pibit.ch [185.203.114.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2ADB4205E2
	for <nbd@other.debian.org>; Wed, 17 Jan 2024 22:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dragon.pibit.ch (Postfix) with ESMTP id 848B02143980
	for <nbd@other.debian.org>; Wed, 17 Jan 2024 23:05:47 +0100 (CET)
Received: from pibit.ch ([127.0.0.1])
 by localhost (dragon.pibit.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZafBI2EyGob for <nbd@other.debian.org>;
 Wed, 17 Jan 2024 23:05:47 +0100 (CET)
Received: from 127.0.0.1 (pd9e55c12.dip0.t-ipconnect.de [217.229.92.18])
	by dragon.pibit.ch (Postfix) with ESMTPSA id 5EDC52142AAC
	for <nbd@other.debian.org>; Wed, 17 Jan 2024 23:05:47 +0100 (CET)
Message-ID: <17bccae2-5e7e-4b00-879f-3d57d4778257@pep-project.org>
Date: Wed, 17 Jan 2024 23:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_Can_dependency_to_=22docbook-utils=22_be_made_optio?=
 =?UTF-8?Q?nal=3F_=E2=80=94_Thank_you_for_the_fixes!?=
Content-Language: de-DE
To: nbd@other.debian.org
References: <19b8472a-305c-4f23-a985-c5567a10b5df@pep-project.org>
 <ZaeZXU9HZx3IAMvS@pc220518.home.grep.be>
From: Lars Rohwedder <roker@pep-project.org>
Autocrypt: addr=roker@pep-project.org; keydata=
 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
 GIaZVwoJisucuww=
Organization: =?UTF-8?B?8J+Ukg==?=
In-Reply-To: <ZaeZXU9HZx3IAMvS@pc220518.home.grep.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eNoa1kBatG8B6Utkwh0N08S8"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5nENDv-vTaE.A.pg.R9EqlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2713
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/17bccae2-5e7e-4b00-879f-3d57d4778257@pep-project.org
Resent-Date: Wed, 17 Jan 2024 22:06:09 +0000 (UTC)

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eNoa1kBatG8B6Utkwh0N08S8
Content-Type: multipart/mixed; boundary="------------NhaUsXzAvEUo09OIyEIGUaN8";
 protected-headers="v1"
From: Lars Rohwedder <roker@pep-project.org>
To: nbd@other.debian.org
Message-ID: <17bccae2-5e7e-4b00-879f-3d57d4778257@pep-project.org>
Subject: =?UTF-8?Q?Re=3A_Can_dependency_to_=22docbook-utils=22_be_made_optio?=
 =?UTF-8?Q?nal=3F_=E2=80=94_Thank_you_for_the_fixes!?=
References: <19b8472a-305c-4f23-a985-c5567a10b5df@pep-project.org>
 <ZaeZXU9HZx3IAMvS@pc220518.home.grep.be>
In-Reply-To: <ZaeZXU9HZx3IAMvS@pc220518.home.grep.be>

--------------NhaUsXzAvEUo09OIyEIGUaN8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQpUaGFuayB5b3UgZm9yIGFsbCB0aGUgZml4ZXMgeW91IG1hZGUgcmVjZW50bHkhDQoNCvCf
kY0NCg0KTC4NCg==

--------------NhaUsXzAvEUo09OIyEIGUaN8--

--------------eNoa1kBatG8B6Utkwh0N08S8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsEBBAABCAAjFiEEgvhNxzjijE7doMajz24L8sM/oJ4FAmWoTzgFAwAAAAAACgkQz24L8sM/oJ6G
zQxAr3dGiTcAUSnFKb2YcIGWM9mjYS+3z9m41a21wZ3Ovt4QqLd4A2vA6dWpfRlXBY3+vBX7ESrr
yiJMa8oiM4KBfxf24NP2TVxn5sHeLHke8kn2AYhUZjvxdk9qL5+xRCQ50goRQmCk2HB4X7pvT+yu
sjR1KaEvcfyyZDOvsZgDtP2XM2P5+w8dy0eMoVJRa0shvGLUQit1hAyG+dlrys1pyObl4eHO8+5H
RzvoR3UFxjZ9G6B5AJ/PFqenHCJfs9i8pag4FIIMuJouQ4Utg7Ig5RJ072kGSuQtPw9UQ+/CGC5I
74aUAnF3rihIGjFtmeZcp0txaGVLPWxKMUDERUyykwt6SusPRHR+p6VvGV1wcQ+CGoxe4ZdKrVcD
jNy+rjqg2yA2D1Gc3GlpnirUtJm7kyDGqk7Sw0zAKFbRF3OEgtD0e7yGZ1YqiMRqYiHhZxHLOIxi
zaH/ycEy1j3Jiga/14YKGoFrsKVzf8WPysQ5TIBcsBzdN99qorjX0o3hMyncxuS7yARfjh0=
=RFOx
-----END PGP SIGNATURE-----

--------------eNoa1kBatG8B6Utkwh0N08S8--

