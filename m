Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B475CC6B186
	for <lists+nbd@lfdr.de>; Tue, 18 Nov 2025 19:06:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 96B2B20514; Tue, 18 Nov 2025 18:06:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 18 18:06:19 2025
Old-Return-Path: <pavel@ucw.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,PGPSIGNATURE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 28B58204FA
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 Nov 2025 18:06:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.098 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, PGPSIGNATURE=-5,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id o5DAApLhflUQ for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 Nov 2025 18:06:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 565 seconds by postgrey-1.36 at bendel; Tue, 18 Nov 2025 18:06:04 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8173D204D0
	for <nbd@other.debian.org>; Tue, 18 Nov 2025 18:06:04 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id F07181C008F; Tue, 18 Nov 2025 18:56:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1763488596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B60GSdZ3ZLwb5RwYNK/6Y5TS9j/ssMyxcD+Zg0X+hcU=;
	b=MH7EnokquyyfGAXphMgN/Lf+iik76ecs1OcyItQ/M/IZNygyROV13ScCkDIrq2mAuBC93D
	AOItBqWS9ZKj8iWtIrZ7AD3cCOzH3uQG49erotfHR/N5F8UTpQavtMWhD/7/9XbuUUf4un
	cwVcIdqh0AmD76zrXoWN7+SYDY2ZnUc=
Date: Tue, 18 Nov 2025 18:56:33 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Eric Dumazet <edumazet@google.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-kernel <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org,
	Eric Dumazet <eric.dumazet@gmail.com>,
	syzbot+e1cd6bd8493060bd701d@syzkaller.appspotmail.com,
	Mike Christie <mchristi@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Yu Kuai <yukuai1@huaweicloud.com>, linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: Re: [PATCH] nbd: restrict sockets to TCP and UDP
Message-ID: <aRyzUc/WndKJBAz0@duo.ucw.cz>
References: <20250909132243.1327024-1-edumazet@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K4L5bQUTPLUWipwC"
Content-Disposition: inline
In-Reply-To: <20250909132243.1327024-1-edumazet@google.com>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <r8uIFx1YSPC.A.W69G.bWLHpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3473
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aRyzUc/WndKJBAz0@duo.ucw.cz
Resent-Date: Tue, 18 Nov 2025 18:06:19 +0000 (UTC)


--K4L5bQUTPLUWipwC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Recently, syzbot started to abuse NBD with all kinds of sockets.
>=20
> Commit cf1b2326b734 ("nbd: verify socket is supported during setup")
> made sure the socket supported a shutdown() method.
>=20
> Explicitely accept TCP and UNIX stream sockets.

Note that running nbd server and client on same machine is not safe in
read-write mode. It may deadlock under low memory conditions.

Thus I'm not sure if we should accept UNIX sockets.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--K4L5bQUTPLUWipwC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaRyzUQAKCRAw5/Bqldv6
8tyOAKCF3uzSNUZFstOM2a3oNq/GuSt5dACgvt2eK+xctfVYARwjKgQ5MLSpl+U=
=Jlm+
-----END PGP SIGNATURE-----

--K4L5bQUTPLUWipwC--

