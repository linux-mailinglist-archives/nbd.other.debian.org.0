Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C38C273526
	for <lists+nbd@lfdr.de>; Mon, 21 Sep 2020 23:46:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2A41E203E4; Mon, 21 Sep 2020 21:46:48 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 21 21:46:48 2020
Old-Return-Path: <pavel@ucw.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=4.0 tests=CC_TOO_MANY,MURPHY_DRUGS_REL8,
	PGPSIGNATURE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CAD3D203E3
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Sep 2020 21:46:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, MURPHY_DRUGS_REL8=0.02,
	PGPSIGNATURE=-5] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Qh0WLF2OR-U2 for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Sep 2020 21:46:36 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4E3F2203E2
	for <nbd@other.debian.org>; Mon, 21 Sep 2020 21:46:36 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 3E3A31C0B8C; Mon, 21 Sep 2020 23:46:33 +0200 (CEST)
Date: Mon, 21 Sep 2020 23:46:32 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Len Brown <len.brown@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	linux-ide@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org,
	linux-block@vger.kernel.org,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH 11/14] PM: rewrite is_hibernate_resume_dev to not require
 an inode
Message-ID: <20200921214632.GA11006@amd>
References: <20200921071958.307589-1-hch@lst.de>
 <20200921071958.307589-12-hch@lst.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <20200921071958.307589-12-hch@lst.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NNTSskleWaN.A.o9.I9RafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/996
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200921214632.GA11006@amd
Resent-Date: Mon, 21 Sep 2020 21:46:48 +0000 (UTC)


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-09-21 09:19:55, Christoph Hellwig wrote:
> Just check the dev_t to help simplifying the code.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9pHzgACgkQMOfwapXb+vLjrwCgkqX/NkSqeB9h9XmupMxguXKk
HU8An2MYofOY5WFBUrwRO2mqpLwzFEzu
=u07+
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--

