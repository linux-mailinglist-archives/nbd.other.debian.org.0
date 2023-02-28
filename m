Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B7E6A5662
	for <lists+nbd@lfdr.de>; Tue, 28 Feb 2023 11:12:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 96AE8207DF; Tue, 28 Feb 2023 10:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 28 10:12:09 2023
Old-Return-Path: <pavel@ucw.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=4.0 tests=AVAILABLENOW,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PGPSIGNATURE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 67576207DE
	for <lists-other-nbd@bendel.debian.org>; Tue, 28 Feb 2023 10:11:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.7 tagged_above=-10000 required=5.3
	tests=[AVAILABLENOW=1, BAYES_05=-1.5, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	PGPSIGNATURE=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id cVGT6QIPziOu for <lists-other-nbd@bendel.debian.org>;
	Tue, 28 Feb 2023 10:11:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 430 seconds by postgrey-1.36 at bendel; Tue, 28 Feb 2023 10:11:55 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4B08B207D2
	for <nbd@other.debian.org>; Tue, 28 Feb 2023 10:11:55 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 4CC051C0AB2; Tue, 28 Feb 2023 11:04:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1677578682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PrbtGwVMliIbWZT0OYnrU2d2yuZ2nEFZOBvI8l29GB8=;
	b=LqaTO24qPrmtGp5ZMzGEt8cgK1Ms7VbDBkUk2qtYeBBhNev75eS7Isvz8bjEk2BBDb3VRW
	1RoA1QirznIw/VA+mIZp+7fG62IJOtiFE6FibiU4CrP7CloStEXSMMA7ixdGOw6I620QWE
	27lHdBAg9ZWzBoUiWqXGyu0pEWSq0z8=
Date: Tue, 28 Feb 2023 11:04:41 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Ming Lei <ming.lei@redhat.com>
Cc: io-uring@vger.kernel.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org
Subject: Re: ublk-nbd: ublk-nbd is avaialbe
Message-ID: <Y/3RuWZKaYrTj/rT@duo.ucw.cz>
References: <Y8lSYBU9q5fjs7jS@T590>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="whO3mXYgpG0S++jq"
Content-Disposition: inline
In-Reply-To: <Y8lSYBU9q5fjs7jS@T590>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <98rRYaw44eH.A.OgC.5Nd_jB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2334
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Y/3RuWZKaYrTj/rT@duo.ucw.cz
Resent-Date: Tue, 28 Feb 2023 10:12:09 +0000 (UTC)


--whO3mXYgpG0S++jq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> ublk-nbd[1] is available now.
>=20
> Basically it is one nbd client, but totally implemented in userspace,
> and wrt. current nbd-client in [2], the transmission phase is done
> by linux block nbd driver.

There is reason nbd-client needs to be in kernel, and the reason is
deadlocks during low memory situations.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--whO3mXYgpG0S++jq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY/3RuQAKCRAw5/Bqldv6
8hAlAJ9tjXVm1Wf/cB3GwYbCq7ktq/mEggCfZcAtI59uSIwUHOgZo3dpRqw+RDc=
=2aTW
-----END PGP SIGNATURE-----

--whO3mXYgpG0S++jq--

