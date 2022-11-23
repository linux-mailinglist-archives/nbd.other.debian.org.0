Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BF47E636CB3
	for <lists+nbd@lfdr.de>; Wed, 23 Nov 2022 23:01:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 744A420706; Wed, 23 Nov 2022 22:01:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Nov 23 22:01:21 2022
Old-Return-Path: <pavel@ucw.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,PGPSIGNATURE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 88F8B20704
	for <lists-other-nbd@bendel.debian.org>; Wed, 23 Nov 2022 22:01:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	PGPSIGNATURE=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id opg-ChroeY-i for <lists-other-nbd@bendel.debian.org>;
	Wed, 23 Nov 2022 22:01:03 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6B01420703
	for <nbd@other.debian.org>; Wed, 23 Nov 2022 22:01:03 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 91CFD1C09F9; Wed, 23 Nov 2022 23:01:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1669240860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q65EMJnwcuNJS6WHzM0LQX+f1I0sGP+f67KLpa3vbZE=;
	b=IG0Y0wHqiAgKueehtVZeBYE4TV6104FF7i3Cf+qplvTduvnvJ7kiEMEKG+8N8gEXh3jbPa
	d+PdEBWC9aVSxLvk4WtE07IhWHSXhEtx/DUniJVDa/mOZOEAf+51pmgJgAvgIEQHkHsdm3
	EJO31VjUIi8ynXq4xsvYJ9jDiYHzAbI=
Date: Wed, 23 Nov 2022 23:01:00 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Eric Blake <eblake@redhat.com>
Cc: kernel list <linux-kernel@vger.kernel.org>, josef@toxicpanda.com,
	linux-block@vger.kernel.org, nbd@other.debian.org
Subject: Re: nbd: please don't spawn 16 threads when nbd is not even in use
Message-ID: <Y36YHNVmbozzSdxH@duo.ucw.cz>
References: <Y3y4+QqOlF00X9ET@duo.ucw.cz>
 <20221123200845.cuct5euvikqksojm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eZEEPNQ49Z9vZpD+"
Content-Disposition: inline
In-Reply-To: <20221123200845.cuct5euvikqksojm@redhat.com>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oAwHZlozugD.A.o5B.xgpfjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2304
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Y36YHNVmbozzSdxH@duo.ucw.cz
Resent-Date: Wed, 23 Nov 2022 22:01:21 +0000 (UTC)


--eZEEPNQ49Z9vZpD+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > I see this... and it looks like there are 16 workqueues before nbd is
> > even used. Surely there are better ways to do that?
>=20
> Yes, it would be nice to create a pool of workers that only spawns up
> threads when actual parallel requests are made.  Are you willing to
> help write the patch?

I was thinking more "only spawn a workqueue when nbd is opened" or so.

I have 16 of them, and I'm not using nbd. Workqueue per open device is
okay, current situation... not so much.

      	       	    	  	  	    	     		Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--eZEEPNQ49Z9vZpD+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY36YHAAKCRAw5/Bqldv6
8tYzAJ9XeuHxOzeqq2h6cNWDEpX8sxtKMgCcD6V7OICwJACN3mYJp/TZEwnnrV0=
=kZvb
-----END PGP SIGNATURE-----

--eZEEPNQ49Z9vZpD+--

