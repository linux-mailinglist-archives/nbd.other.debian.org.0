Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9D86375EB
	for <lists+nbd@lfdr.de>; Thu, 24 Nov 2022 11:06:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CF5D3204BA; Thu, 24 Nov 2022 10:06:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov 24 10:06:34 2022
Old-Return-Path: <pavel@ucw.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,PGPSIGNATURE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B186E204A0
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Nov 2022 10:06:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, PGPSIGNATURE=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5pyHKEBttWBs for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Nov 2022 10:06:17 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B0B712049E
	for <nbd@other.debian.org>; Thu, 24 Nov 2022 10:06:17 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id D5B641C09DB; Thu, 24 Nov 2022 11:06:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1669284374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=capoMoyAoTRj+QhymNjy9DjDy54aOgbbJqtTNS98/nQ=;
	b=apDGjOxrfVjgw3aF/04OkmIsnhtrCyjo6MrJ4rcit4SWicJfR1qXNVdIuE6asqhticv22R
	M+VmZTXsmk7cSwRVDVSlbmb2xXp1Td3LXsEkJpqnka+yXADMcqikuw2OuYNZNWBDy/WNeW
	VVjbKXbc45uomNEG2UQd2yoHFVcLJxw=
Date: Thu, 24 Nov 2022 11:06:14 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Eric Blake <eblake@redhat.com>,
	kernel list <linux-kernel@vger.kernel.org>, josef@toxicpanda.com,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	"yukuai (C)" <yukuai3@huawei.com>
Subject: Re: nbd: please don't spawn 16 threads when nbd is not even in use
Message-ID: <Y39CFnRwNGBGIsCH@duo.ucw.cz>
References: <Y3y4+QqOlF00X9ET@duo.ucw.cz>
 <20221123200845.cuct5euvikqksojm@redhat.com>
 <Y36YHNVmbozzSdxH@duo.ucw.cz>
 <ccee0ff5-309c-b430-09c7-8d2081c9981d@huaweicloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HZjYMFTE2RCR7pyM"
Content-Disposition: inline
In-Reply-To: <ccee0ff5-309c-b430-09c7-8d2081c9981d@huaweicloud.com>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0ELuFYi0KjH.A.1fG.qI0fjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2306
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Y39CFnRwNGBGIsCH@duo.ucw.cz
Resent-Date: Thu, 24 Nov 2022 10:06:34 +0000 (UTC)


--HZjYMFTE2RCR7pyM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2022-11-24 09:17:51, Yu Kuai wrote:
> Hi,
>=20
> =E5=9C=A8 2022/11/24 6:01, Pavel Machek =E5=86=99=E9=81=93:
> > Hi!
> >=20
> > > > I see this... and it looks like there are 16 workqueues before nbd =
is
> > > > even used. Surely there are better ways to do that?
> > >=20
> > > Yes, it would be nice to create a pool of workers that only spawns up
> > > threads when actual parallel requests are made.  Are you willing to
> > > help write the patch?
> >=20
> > I was thinking more "only spawn a workqueue when nbd is opened" or so.
> >=20
> > I have 16 of them, and I'm not using nbd. Workqueue per open device is
> > okay, current situation... not so much.
>=20
> You can take a look at this commit:
>=20
> e2daec488c57 ("nbd: Fix hungtask when nbd_config_put")
>=20
> Allocation of recv_workq is moved from start device to alloc device to
> fix hungtask. You might need to be careful if you want to move this.

Can we get that reverted?

That is rather obscure bug (how many GFP_KERNEL failures do you
normally see?) and it costs, dunno, 100KB? of unswappable memory.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--HZjYMFTE2RCR7pyM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY39CFgAKCRAw5/Bqldv6
8vWYAJ9yQ6drFnNpEutVeHvEesUcP4FckgCgvgMVBq1JANQNm02eRF+IlRzW0uc=
=IyCl
-----END PGP SIGNATURE-----

--HZjYMFTE2RCR7pyM--

