Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A25818460FD
	for <lists+nbd@lfdr.de>; Thu,  1 Feb 2024 20:31:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6D665205C7; Thu,  1 Feb 2024 19:31:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb  1 19:31:35 2024
Old-Return-Path: <l.stelmach@samsung.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,PGPSIGNATURE,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C88B5205B1
	for <lists-other-nbd@bendel.debian.org>; Thu,  1 Feb 2024 19:31:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-14.772 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.564, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Egu_f4feFdSZ for <lists-other-nbd@bendel.debian.org>;
	Thu,  1 Feb 2024 19:31:13 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mailout1.w1.samsung.com", Issuer "DigiCert Global G2 TLS RSA SHA256 2020 CA1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BBA97205BB
	for <nbd@other.debian.org>; Thu,  1 Feb 2024 19:31:13 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240201193108euoutp01253223fe4999f5bb84703d037ae008c3~v0-05kgmn2631126311euoutp01i;
	Thu,  1 Feb 2024 19:31:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240201193108euoutp01253223fe4999f5bb84703d037ae008c3~v0-05kgmn2631126311euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1706815868;
	bh=OUFAtAB0Zk1c2E7BzKYkPV2d+qQuWblj4Ld8PGJBHdk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:References:From;
	b=N3HveUauiS26S/72ul2/gzDDl2PaWZF1LQdSn1rrIiCqiDdW0xowfLD5PHa3RtyHj
	 dfjhNyDdbYlKNeawZGKttWpSFtFpSbxBm9YagSQONUpSh55jfWpNaKxNkYZW5IDiR0
	 UbwutXnev+YrioKb65MdQUyhehwZkslNb4Rjk+Uo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240201193107eucas1p1dff9e06967df149e72c93685d397665e~v0-0hR3x12072820728eucas1p1d;
	Thu,  1 Feb 2024 19:31:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 1A.2C.09552.B71FBB56; Thu,  1
	Feb 2024 19:31:07 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240201193107eucas1p2a86669add6be2a4ababb691e3cdceb4f~v0-z2ejsk1698616986eucas1p2i;
	Thu,  1 Feb 2024 19:31:07 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240201193107eusmtrp24f7f477ae2136d5b2bf0f6659d3226c1~v0-z19KXw2446924469eusmtrp2o;
	Thu,  1 Feb 2024 19:31:07 +0000 (GMT)
X-AuditID: cbfec7f5-853ff70000002550-8b-65bbf17b9c46
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id BE.F1.10702.B71FBB56; Thu,  1
	Feb 2024 19:31:07 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240201193106eusmtip253ddcc8be24d270821882a3b26cb64c0~v0-zmk7m-1067410674eusmtip2X;
	Thu,  1 Feb 2024 19:31:06 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org,  Karol Lewandowski <k.lewandowsk@samsung.com>,
	=?utf-8?B?7J6s7ZuIIOyglQ==?= <jh80.chung@samsung.com>,  Marek Szyprowski
	<m.szyprowski@samsung.com>, Marek Pikula <m.pikula@partner.samsung.com>
Subject: Re: Fixes after static code analysis
In-Reply-To: <ZbqcASAmWxQMuM4Q@pc220518.home.grep.be> (Wouter Verhelst's
	message of "Wed, 31 Jan 2024 21:14:09 +0200")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 01 Feb 2024 20:30:46 +0100
Message-ID: <oypijdplxgm17d.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFKsWRmVeSWpSXmKPExsWy7djPc7rVH3enGtx9Y2px41cbq0Xjp7nM
	Fn/nTWWzWHvkLrvF76drmSw29+s7sHlc/dbM7HHw3R4mj74tqxg9/t68zhrAEsVlk5Kak1mW
	WqRvl8CV0dy9kbHgqXRFx4nSBsYN4l2MHBwSAiYS7+aLdDFycQgJrGCUODGphRnC+cIoMff8
	XBYI5zOjxKtTs4EcTrCOuSufsEEkljNKbP73hw0kISTwglHichcTyFg2AT2JtWsjQMIiAvIS
	i1tvgZUwC9xllFhzJwjEFhbQlbi/byIbSDmnQIXEpJfcIGFRAUuJ41vbwcpZBFQlpp5tZQKx
	eQXMJV7u+MkKYQtKnJz5hAViZK7EzPNvGEHOkRB4wCFxsfMp1J0uEntPzWCGsIUlXh3fwg5h
	y0j83zmfCaKhnVGi6cpCVghnAqPE544mJogqa4k7536xQdiOEh+utDJDwotP4sZbQYjNfBKT
	tk2HCvNKdLQJQVSrSKzr3wN1g5RE76sVjBC2h8TkHzvYIeHWwSgxs/8M2wRGhVlIHpqF5KFZ
	QGOZBTQl1u/ShwhrSyxb+JoZwraVWLfuPcsCRtZVjOKppcW56anFxnmp5XrFibnFpXnpesn5
	uZsYgUno9L/jX3cwrnj1Ue8QIxMH4yFGFaDmRxtWX2CUYsnLz0tVEuFdKbczVYg3JbGyKrUo
	P76oNCe1+BCjNAeLkjivaop8qpBAemJJanZqakFqEUyWiYNTqoFJuev2jDvhWwpOPPYy3BG7
	bCejmi+Hz7VvP8XTFnxM31N5U2D+pX8N0nse5YYbhFUtqZ1d8ifGbhLHG96ioNw0lri1pTb+
	6cyrs4/2OJ7PCU5/E1//8d2imeKcSxol9TeZ2luubD/58sEON6PmGA6eN0dOSMvqH9dZ5vlj
	g/7sdibT/uqW+bVGeYd2NW5N4ba8ZnNvcqEv38Tou59u24ft7+7Vmb7grGrO/AmLD0n3zYlb
	mO+Yt/ubWS3DgylLZCQ3xwWHsaqY7H0b2qZxIe7DOdsmKTXtF2sSr3xuWq0mEHKsdv2C6ecd
	SyxvxNzPUHt8vOKOBy8L05ptRudeXF2g/cj04tqTN2tfPN9medhSiaU4I9FQi7moOBEAkjjL
	ir0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRmVeSWpSXmKPExsVy+t/xe7rVH3enGmx9wGJx41cbq0Xjp7nM
	Fn/nTWWzWHvkLrvF76drmSw29+s7sHlc/dbM7HHw3R4mj74tqxg9/t68zhrAEqVnU5RfWpKq
	kJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX0dy9kbHgqXRFx4nS
	BsYN4l2MnBwSAiYSc1c+Yeti5OIQEljKKNE2dyFzFyMHUEJKYuXcdIgaYYk/17qgap4xSpxf
	fJgNpIZNQE9i7doIkBoRAXmJxa23wGqYBR4ySty8fZoFJCEsoCtxf99EsHpOgQqJSS+5QcJC
	QHvv/F/JBGKLClhKHN/azgZiswioSkw92woW5xUwl3i54ycrhC0ocXLmE7CRzALZEl9XP2ee
	wCgwC0lqFpLULKBtzAKaEut36UOEtSWWLXzNDGHbSqxb955lASPrKkaR1NLi3PTcYiO94sTc
	4tK8dL3k/NxNjMAI2nbs55YdjCtffdQ7xMjEwXiIUQWo89GG1RcYpVjy8vNSlUR4V8rtTBXi
	TUmsrEotyo8vKs1JLT7EaAr0wkRmKdHkfGBs55XEG5oZmBqamFkamFqaGSuJ83oWdCQKCaQn
	lqRmp6YWpBbB9DFxcEo1MK1ff9a786isv/kUvf3Od0y35dhJfIpK+qZ2rrY6xGGl5+UT9UZT
	9Fct9WRU/+v+6ca9W5kW2ifmO7H15P3a+/2/Iu/iYw8Nmew9n+n5+wg/mezoKnZIoqy9cpLd
	xR1V7y7KvlZ9Z7KF5dWprih2+epNXVNkK1ke9J118X3d9iA5tqdKZYpLoHBGcX+Z4z7mw27n
	i91nxYaLXj6za/6h92fbuwMlvryRq9/0/8CaHwKlzdudTQxy7I8q+LpyGb1M239nGsOmD8In
	7tq8ktspw7Sm9mfjrROz3iadd0vxVZ+U7Hx5tuYTi9aJqb+e9pbo699tMhfT23m9SHrKN8F1
	M6SXf7kS2fT8ZY3pHPOVwkosxRmJhlrMRcWJAKG/8jo1AwAA
X-CMS-MailID: 20240201193107eucas1p2a86669add6be2a4ababb691e3cdceb4f
X-Msg-Generator: CA
X-RootMTR: 20240201193107eucas1p2a86669add6be2a4ababb691e3cdceb4f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240201193107eucas1p2a86669add6be2a4ababb691e3cdceb4f
References: <ZbqcASAmWxQMuM4Q@pc220518.home.grep.be>
	<CGME20240201193107eucas1p2a86669add6be2a4ababb691e3cdceb4f@eucas1p2.samsung.com>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wGyL1kSln_E.A.Q4E.XG_ulB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2725
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/oypijdplxgm17d.fsf%l.stelmach@samsung.com
Resent-Date: Thu,  1 Feb 2024 19:31:35 +0000 (UTC)

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2024-01-31 =C5=9Bro 21:14>, when Wouter Verhelst wrote:
> On Mon, Jan 22, 2024 at 12:52:23PM +0100, Lukasz Stelmach wrote:
>> Hi,
>>=20
>> Last year we decided to include nbd package in Tizen. Every package we
>> use gets a periodic treatment with static analysis tools (Coverity,
>> SVACE). There were some problems detected in nbd and we've developed a
>> number of patches[1] to fix them. Please take a look at them as well as
>> the eariler patch[1] I posted.
>>=20
>> [1]
>> https://git.tizen.org/cgit/platform/upstream/nbd/log/?h=3Dtizen&id=3D2c5=
4e25b0cea8d30f7958fa2d17c67b91867aff6
>
> Is this available in some public repository that I can just pull from? I
> tried
> "https://git.tizen.org/platform/upstream/nbd",
> which seemed the
> most obvious, but that didn't work.

That's

    git fetch https://git.tizen.org/cgit/platform/upstream/nbd 2c54e25b0cea=
8d30f7958fa2d17c67b91867aff6

with "/cgit/" between ".org" and "platform".

>> [2] https://lists.debian.org/nbd/2023/08/msg00046.html
>
> I looked at that when you sent it, didn't like it, was going to reply,
> but then apparently forgot to do that. Sorry about that.

NP.

> I didn't like this because there are some autoconf variables that (by
> default) have other variables in them, in ways that expose them as shell
> variables; e.g., the default setting for sysconfdir is "${prefix}/etc",
> which means that if you run "./configure" with no arguments,
> nbd-server(5) will mention that the configuration file is
> "${prefix}/etc/nbd-server/config", which I think is a bit ugly.

It is indeed, but I believe it's not the case.

> That's why I did it that way.
>
> I don't think your version does that? But I could be wrong, of course;
> in which case, please explain :)

I wrote the patch some time ago (-; but I believe I haven't seen such
effect. Let me try. I run:

git checkout e0a7534c74e7e21fe0be2ad55e4cbe35cef21a07
./autogen.sh
configure
grep nbd-server/config -- man/nbd-server.5.sgml

  <!ENTITY dhpackage   "/usr/local/etc/nbd-server/config">
      <filename>/usr/local/etc/nbd-server/config</filename> is the default

Next

make -C man/ nbd-server.5
grep nbd-server/config -- man/nbd-server.5

/usr/local/etc/nbd-server/config \- configuration file for nbd-server
\fB/usr/local/etc/nbd-server/config \fR
\fI/usr/local/etc/nbd-server/config\fR is the default

If there are any problems, would you mind, responding to that patch and
pointing them out? I'd like to fix them.

PS. I received thee more bug reports to handle. I'll review them when I
get back from FOSDEM, so you don't need to hurry with these.

PPS. If you happen to be around, Wouter, and would like to meet, try
reaching me via Matrix @steelman:matrix.org
=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmW78WYACgkQsK4enJil
gBCWYAgAirzN01aGn7mWKZZH+Kso0vbkXhJru4gsjU2ky3gJ0MOIUOadiqC6jUfV
RLHZjWqEa8aCiGK9QzDufqGPwQjrxrpKCVsYp1RDQDLaHM1tWqBeUN/wBfyZm+ot
/TJgSZvYDwN4Yh97GExV/NO095mumf2Ee4KVdbjeTFjrRTriqF/WkQKBU/KSNgwo
/LgQ5zDD5INLbzFgm89YYG9VQYXVZBu+tZOvAtM01ETJ7WPJvSLHHeXBy5KDnkU5
vsvibEKD2qwicYvUpVrlAqSB8j5SvcTtCIcsa4KLjIlh/uzVKw+KqWgrL7kbRtcx
4eDPLUmf3BB5gI6BxVTSOa41zzVHSQ==
=P/Rq
-----END PGP SIGNATURE-----
--=-=-=--

