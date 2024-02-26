Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A31867663
	for <lists+nbd@lfdr.de>; Mon, 26 Feb 2024 14:24:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CAFBC20BDB; Mon, 26 Feb 2024 13:24:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 26 13:24:11 2024
Old-Return-Path: <l.stelmach@samsung.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,PGPSIGNATURE,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4CB6820BCE
	for <lists-other-nbd@bendel.debian.org>; Mon, 26 Feb 2024 13:23:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12.11 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.002, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8pMl-b0pXPNw for <lists-other-nbd@bendel.debian.org>;
	Mon, 26 Feb 2024 13:23:47 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mailout2.w1.samsung.com", Issuer "DigiCert Global G2 TLS RSA SHA256 2020 CA1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0C44320BC5
	for <nbd@other.debian.org>; Mon, 26 Feb 2024 13:23:46 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240226132342euoutp0257b9a2c6d715e8f430afe5a9dddb5d18~3bHJ7ZpNA2807728077euoutp02c;
	Mon, 26 Feb 2024 13:23:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240226132342euoutp0257b9a2c6d715e8f430afe5a9dddb5d18~3bHJ7ZpNA2807728077euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1708953822;
	bh=0k6JQiGjg34THS1EO/qXYDwonVLP1ccLrA43kVQkiAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JaF9libeQJgg9RdbQCo5uV++HiT1cePZ/k0jXrVfkUlT3Sx48xItF9ge0KPOmU40s
	 ShLa1K7LWPvkam4li7+E0ifbV8V1rDENJDGVkoBbCObGK1GPSdavMHeZ9+W+FkFN+/
	 FF67foG0Vb1VHydmMS/OZeeeqx0h5TnT7MymKlUA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240226132342eucas1p1408fc4f7792768f427c1121bd46251ce~3bHJmGUnN2610826108eucas1p1I;
	Mon, 26 Feb 2024 13:23:42 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 1B.01.09539.ED09CD56; Mon, 26
	Feb 2024 13:23:42 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240226132341eucas1p2ed1082f0a9a3b244be07df2ef943ca35~3bHJIyodl1057010570eucas1p29;
	Mon, 26 Feb 2024 13:23:41 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240226132341eusmtrp1983038b75a936884f67399e3f559b51e~3bHJIFtYg1359513595eusmtrp1t;
	Mon, 26 Feb 2024 13:23:41 +0000 (GMT)
X-AuditID: cbfec7f2-515ff70000002543-1e-65dc90de7ea5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id D6.ED.09146.DD09CD56; Mon, 26
	Feb 2024 13:23:41 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240226132341eusmtip24f584513b8972efef199e58c2555eea7~3bHI_NBrJ1302013020eusmtip2D;
	Mon, 26 Feb 2024 13:23:41 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: Eric Blake <eblake@redhat.com>
Cc: Wouter Verhelst <w@uter.be>,  nbd@other.debian.org,  Karol Lewandowski
	<k.lewandowsk@samsung.com>,  =?utf-8?B?7J6s7ZuIIOyglQ==?=
	<jh80.chung@samsung.com>,  Marek Szyprowski <m.szyprowski@samsung.com>, 
	Marek Pikula <m.pikula@partner.samsung.com>
Subject: Re: Fixes after static code analysis
Date: Mon, 26 Feb 2024 14:23:29 +0100
In-Reply-To: <sckh6gmkef4ujvrzasopaat5ezz6pkvocmgkwkl6jcfbzek6gf@ahwc3iwsbcoy>
	(Eric Blake's message of "Fri, 23 Feb 2024 10:10:24 -0600")
Message-ID: <oypijd8r37fjfy.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djPc7r3JtxJNbh1kt1i4tv1rBY3frWx
	WjR+msts8XfeVDaLtUfuslv8frqWyWJzv74Du8fVb83MHgff7WHyeL/vKptH35ZVjB5/b15n
	DWCN4rJJSc3JLEst0rdL4MpY3sZT0CJc8f3SFfYGxt/8XYycHBICJhJXJ51k7WLk4hASWMEo
	sX7NK3YI5wujxK3JbWwQzmdGiW+f2hhhWtpPvYVKLGeU2L60kR0kISTwglFi652CLkYODjYB
	PYm1ayNAwiICShLTlzWCTWUW+M8o0d4/nRkkISygK3F/30Q2EJtFQFViwt9PYEWcAj2MEjtO
	LADbxitgLnF82TuwBaIClhLHt7azQcQFJU7OfMICYjML5ErMPP+GEaRZQuADh8S5XX1Qp7pI
	7Lh0iwnCFpZ4dXwLO4QtI3F6cg8LREM7o0TTlYWsEM4ERonPHU1QHdYSd879YoOwHSXa3i9j
	AvlNQoBP4sZbQYjNfBKTtoG8AxLmlehoE4KoVpFY17+HBcKWkuh9tQLqHg+J359vQYNuITC0
	3i1im8CoMAvJQ7OQPDQLaCyzgKbE+l36EGFtiWULXzND2LYS69a9Z1nAyLqKUTy1tDg3PbXY
	MC+1XK84Mbe4NC9dLzk/dxMjMEGd/nf80w7Gua8+6h1iZOJgPMSoAtT8aMPqC4xSLHn5ealK
	IrzhMjdThXhTEiurUovy44tKc1KLDzFKc7AoifOqpsinCgmkJ5akZqemFqQWwWSZODilGpi6
	uP56nJzCUcvpqvo2w93uOMMN/j/XH3/edoLbsGqHydoXctt+s5sqGDq2V7e8mtCiys9Z1jN7
	vuupdbHK/kq/Ph4sWLk2L6L1ya2ulwqCzS/feP55ukhFIV3kmXbCx+2arIWymsFZgS1Tcy2a
	gw/HCqkWnG5nLnnSFtA19ffqo1Mmdhere+QG/m48F+MdGjRF68q6g7r17YEOwRNL35ydGP6V
	O7529+ELv9sMwh/o231j5NjH+v3tDqMtk/1/3ujdqnXS8feBZ9sWLtv5Tmb2Om2HU28iVh3w
	87W+tao4UEZtXme1HN+j5Y8aVjD6xbmIZIpckQm6pKTz/dtZe3m7bsXi24Ulcy4Llv/rDlFi
	Kc5INNRiLipOBAAPytQrywMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xe7p3J9xJNZi+S91i4tv1rBY3frWx
	WjR+msts8XfeVDaLtUfuslv8frqWyWJzv74Du8fVb83MHgff7WHyeL/vKptH35ZVjB5/b15n
	DWCN0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0MtY
	3sZT0CJc8f3SFfYGxt/8XYycHBICJhLtp96ygdhCAksZJT5NjO5i5ACKS0msnJsOUSIs8eda
	F1AJF1DJM0aJz+cnsYHUsAnoSaxdGwFSIyKgJDF9WSM7SA2zQCOTRNeDG+wgCWEBXYn7+yZC
	zfeVaH+2lRHEZhFQlZjw9xNYA6dAD6PEjhMLwBK8AuYSx5e9A2sWFbCUOL61nQ0iLihxcuYT
	FhCbWSBb4uvq58wTGAVmIUnNQpKaBXQfs4CmxPpd+hBhbYllC18zQ9i2EuvWvWdZwMi6ilEk
	tbQ4Nz232FCvODG3uDQvXS85P3cTIzCuth37uXkH47xXH/UOMTJxMB5iVAHqfLRh9QVGKZa8
	/LxUJRHecJmbqUK8KYmVValF+fFFpTmpxYcYTYF+m8gsJZqcD4z4vJJ4QzMDU0MTM0sDU0sz
	YyVxXs+CjkQhgfTEktTs1NSC1CKYPiYOTqkGpp11p4t54sKCbqqZH/onJ/26VPanFoPUCd+s
	n4cPn9rqEHrukvq194Wztq1OXJfgbHXohLn63qDMz9mvnIukXodqfajaxFXPyPdjG+sywyy3
	r/5zrZjFev8s+zrbij3V6YDlBedrx15vsL+ySPqAIv+kGVfMN74ukJhS33910TPGwGlfXuSE
	MKkWnT6Te6/R98UlXfc5HFrPKow2HvBmidLI6F9qfOBzvavuNquCrOsRyY17C5kazLnKu3Zs
	1Dqo+2PJSubZC845S1deUJ97TrN4wn027qoMJQP/Nco8GvHWf/fsbUk3FfxqlCTqwPaqSeuZ
	37vogBj74JxJKq98P1V9ORPfXz73/Lf9D1fuUGIpzkg01GIuKk4EAJGEZi1AAwAA
X-CMS-MailID: 20240226132341eucas1p2ed1082f0a9a3b244be07df2ef943ca35
X-Msg-Generator: CA
X-RootMTR: 20240226132341eucas1p2ed1082f0a9a3b244be07df2ef943ca35
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240226132341eucas1p2ed1082f0a9a3b244be07df2ef943ca35
References: <sckh6gmkef4ujvrzasopaat5ezz6pkvocmgkwkl6jcfbzek6gf@ahwc3iwsbcoy>
	<CGME20240226132341eucas1p2ed1082f0a9a3b244be07df2ef943ca35@eucas1p2.samsung.com>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zYfCsg1Kn8I.A.uJC.7DJ3lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2772
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/oypijd8r37fjfy.fsf%l.stelmach@samsung.com
Resent-Date: Mon, 26 Feb 2024 13:24:11 +0000 (UTC)

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2024-02-23 pi=C4=85 10:10>, when Eric Blake wrote:
> On Fri, Feb 23, 2024 at 09:08:49AM -0600, Eric Blake wrote:
>> On Fri, Feb 23, 2024 at 10:55:20AM +0200, Wouter Verhelst wrote:
>> > Hi Lukasz,
>> >=20
>> >=20
>> > I've merged your branch, but removed those two commits (the original a=
nd
>> > the revert).
>>=20
>> FWIW, your branch temporarily broke the doc/proto.md rendering by
>> removing trailing whitespace that was essential to a correct Markdown
>> rendering; I've reverted that portion of your changes.  (Why markdown
>> treats trailing whitespace as essential is beyond me - using something
>> that is not visible to affect the ultimate visual layout is
>> mind-boggling.)
>
> Another side-effect of your series: after 'make', I'm now left with a
> 'man/NBDTAB.5' file not under version control; according to
> .gitignore, we used to have man/nbdtab.5.  Creating files that differ
> only in case is a recipe for disaster when building on a FAT or HFS
> filesystem.  What's more, people really do want to do 'man nbdtab',
> not 'man NBDTAB'.  It looks like commit 6ca4b637 is to blame; can you
> provide a followup patch that restores the man page generation to
> create the correct filename?

That's my fault. I've created the patch to move the building of man
pages out of the bootstrap page, so we could build the package (without
man pages) without docbook. We discussed it with Wouter and it wasn't
meant to be merged yet. My mistake is that I didn't warn Wouter that the
patch had been on the branch he merged.

Wouter, will you revert the patch or should I prepare fixes Eric
requests?

Kind regards,=20
=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmXckNEACgkQsK4enJil
gBBGdggApw1JYxhLiH7OLRlEw1uYp3FsY+9qBIqDL6T9C4RQo8YT71HXVNlxz7Jt
DBEriVuDN2Ub5Byj7y+2SE9+eDmdO+LXMsu6+wmZKRwyhQvUL6/DwTR7x9l3sjIv
ABn+xXi902oj/SmzYLbzvgKCf4bc800mINs2/IaDq6DjDFPygzFi+4sKt2KF/9J8
NBa5fiSKWL/G0ospskqCXGq2zgJ9aOz5DcyCM8KjWjIaIjv3FwpP7+45S3j/kMgA
G3rO72Z7F2Pm+vQDwD5udBYU9UBcn47HIzl35PQPuMBghYkSVQyPCY2VX/qjwLzb
nsM8TCrVe8rU7tQmTLtcazrxvxSsXA==
=mCQI
-----END PGP SIGNATURE-----
--=-=-=--

