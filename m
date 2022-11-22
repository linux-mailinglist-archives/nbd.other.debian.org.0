Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2BB633BFD
	for <lists+nbd@lfdr.de>; Tue, 22 Nov 2022 13:03:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 79209207D4; Tue, 22 Nov 2022 12:03:03 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 22 12:03:03 2022
Old-Return-Path: <pavel@ucw.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,PGPSIGNATURE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4857A207CF
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Nov 2022 12:02:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.7 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PGPSIGNATURE=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Dr16ig4dzE3M for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Nov 2022 12:02:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 360 seconds by postgrey-1.36 at bendel; Tue, 22 Nov 2022 12:02:45 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 50C102079C
	for <nbd@other.debian.org>; Tue, 22 Nov 2022 12:02:45 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 24B071C09DB; Tue, 22 Nov 2022 12:56:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1669118202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=bLu/KvzJPCTB/Xa7S7YY3MbbLXv7uV0njFU8uvir2CM=;
	b=EDHX+WnCmFMJzNVMipcOujGTEfG4y2dPEqZGEmYyyTFEzrhRwKwVpL+cN/UP3CC5OUPF97
	qKfjzGpjBNGhmY4NmP8tNeoM6DwV2ah3XjObU60xPt4g3p1wSct8jluvAB5O3M+rMzWnJe
	w9jN9XGLem7jr/QogEzlCixGhfV0H+U=
Date: Tue, 22 Nov 2022 12:56:41 +0100
From: Pavel Machek <pavel@ucw.cz>
To: kernel list <linux-kernel@vger.kernel.org>, josef@toxicpanda.com,
	linux-block@vger.kernel.org, nbd@other.debian.org
Subject: nbd: please don't spawn 16 threads when nbd is not even in use
Message-ID: <Y3y4+QqOlF00X9ET@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xPdvxnZFnwXOEoiz"
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nfeC75JJ7oE.A.6xE.3pLfjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2301
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Y3y4+QqOlF00X9ET@duo.ucw.cz
Resent-Date: Tue, 22 Nov 2022 12:03:03 +0000 (UTC)


--xPdvxnZFnwXOEoiz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I see this... and it looks like there are 16 workqueues before nbd is
even used. Surely there are better ways to do that?

Best regards,
								Pavel

    257 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd0=
-recv                                             =20
    260 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd1=
-recv                                             =20
    263 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd2=
-recv                                             =20
    266 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd3=
-recv                                             =20
    269 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd4=
-recv                                             =20
    272 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd5=
-recv                                             =20
    275 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd6=
-recv                                             =20
    278 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd7=
-recv                                             =20
    281 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd8=
-recv                                             =20
    284 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd9=
-recv                                             =20
    287 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd1=
0-recv                                            =20
    290 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd1=
1-recv                                            =20
    293 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd1=
2-recv                                            =20
    296 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd1=
3-recv                                            =20
    299 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd1=
4-recv                                            =20
    302 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 nbd1=
5-recv                                            =20


--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--xPdvxnZFnwXOEoiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY3y4+QAKCRAw5/Bqldv6
8hPjAKCzzoppkzpcMQzHpbLeYPjW5+/pfgCgn+QgASwdXiGIGIJSvP7peIs5mLo=
=5DEI
-----END PGP SIGNATURE-----

--xPdvxnZFnwXOEoiz--

