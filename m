Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B72E68362C1
	for <lists+nbd@lfdr.de>; Mon, 22 Jan 2024 13:02:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 68B3020784; Mon, 22 Jan 2024 12:02:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan 22 12:02:18 2024
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
	by bendel.debian.org (Postfix) with ESMTP id 993FA20740
	for <lists-other-nbd@bendel.debian.org>; Mon, 22 Jan 2024 12:02:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-15.966 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-2.758, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MD5_SHA1_SUM=-1, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SPTjhZ45kj9d for <lists-other-nbd@bendel.debian.org>;
	Mon, 22 Jan 2024 12:01:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 555 seconds by postgrey-1.36 at bendel; Mon, 22 Jan 2024 12:01:57 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mailout1.w1.samsung.com", Issuer "DigiCert Global G2 TLS RSA SHA256 2020 CA1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DE9772071C
	for <nbd@other.debian.org>; Mon, 22 Jan 2024 12:01:57 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240122115236euoutp015a3bc37ae34ff83d7801463bdde192af~sqSncVH0m1413114131euoutp018;
	Mon, 22 Jan 2024 11:52:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240122115236euoutp015a3bc37ae34ff83d7801463bdde192af~sqSncVH0m1413114131euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1705924356;
	bh=UbRBr/y5QfL7rxUSOfoL88kUwX9KL2ZPAoaESJmdFVI=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Qthss5x7DW1+1a5avqR/JZN9N6INbcVuePndq8QiEAe7t30xiKcvijGailQf5hJ1g
	 9AJA40C4MvEstZNyXWtHrHyvO4Sbhl+KlNW/4t/P2CUxWNIFczR7Bpg7SU38AeCjgx
	 XTH5eLfF1oY0Aw4pLRrz+CVNXw7nlfjk2fW//LGo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240122115235eucas1p2700d557f8bbac64b46e16abcb25f61ea~sqSnP7YPI3041730417eucas1p2H;
	Mon, 22 Jan 2024 11:52:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 93.AA.09814.3075EA56; Mon, 22
	Jan 2024 11:52:35 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240122115235eucas1p1f313da18ba39fa558ccc7ff600d8ea73~sqSmm1WLx0901909019eucas1p1D;
	Mon, 22 Jan 2024 11:52:35 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240122115235eusmtrp15220ec75e227c7c89bc9d5499df7a1ad~sqSmlTiw-2275822758eusmtrp1k;
	Mon, 22 Jan 2024 11:52:35 +0000 (GMT)
X-AuditID: cbfec7f4-711ff70000002656-45-65ae57032407
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 86.49.10702.3075EA56; Mon, 22
	Jan 2024 11:52:35 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240122115235eusmtip2eeebd7882c881fef504efaf631189d6b~sqSmaWd_t2503125031eusmtip2c;
	Mon, 22 Jan 2024 11:52:35 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: nbd@other.debian.org, Wouter Verhelst <w@uter.be>
Cc: Karol Lewandowski <k.lewandowsk@samsung.com>,
	=?utf-8?B?7J6s7ZuIIOyglQ==?= <jh80.chung@samsung.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Marek Pikula <m.pikula@partner.samsung.com>
Subject: Fixes after static code analysis
Date: Mon, 22 Jan 2024 12:52:23 +0100
Message-ID: <oypijdplxttwjs.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfyyUcRjf933fe73Ozl6Xuie1lKWV1im79LZ0S2vt2lpp64cZyy3fUJx2
	R5LWDy3HFVdU5lJLJaI7Smh+TUpyjKwIpfVD50Ja6AeiuFdb/32ez+f5PJ/n+e7LkOJsgQsT
	rorGapUywo0WUqVPR5tXkHtMeGWiRcp1jCUKuFNDV0lu4tolmjM+6bbjxj8ZCa5Y77mBVrT9
	OE0qHg1WEorUB/lIMdH5SuBHBQh9QnBE+GGs9pQHC8MqBuceOiM8Yv7cT59EvxgdsmeAlUHb
	hV6BDgkZMZuH4EVBO+KLEQQ37lXMKMMIKjuNdv8sT82FBC/kIiga185YrAjysqooHWIYmpWC
	0eg/bXBmV0P62SZbD8nWIehOS6emhVnsMjBZ7qJpTLHu0PbinS1BxK4BS8mwjZ/NroX6Ei3N
	807QkNlj85JsJGS2DNiGAtvEQIm5meTX2wRv6rspHs+CvvoHM2vPh8b0cxRv0CJIeJkt4Ivz
	CIaTEgi+ax28aR6jeewLKVXZtnOAdYSOL058siOklWaQPC2CpEQx370YTPrKmVwXSOnLQzxW
	wOUms40Xs0Hw/edj+jxyNfx3j+G/ewxTU8mpdyks9+Tp5XA7u5/k8Xowmb5S15EgH0lwjCYy
	FGu8VDhWqlFGamJUodJ9UZH30dTPaZysH3mIcvu+SWsRwaBatHjK/KGo4DlyoVRRKuzmLOqY
	a8JiUYgy7ihWR+1Vx0RgTS2ax1BuEpF7iCsWs6HKaHwQ40NY/U8lGHuXk0TuRrX+zoDld3mr
	Vs6dlvmSjTnEvS6Nd3/gvMkF5vZL273iW5iut/OL/F1HEqrJUEvZEqJuQjfaE+a6pjrZr3eH
	tQzL23N8JU41Va27rL9QYAHlc72wfF1xT8FYym2HhXPqYpP2W/V2zzyeWz/vbIjzs4TIlAfO
	xSUOyj02dqZO7uM+Mr47du9Kex1EnVjdoi0rPZvsfUt0s0VecuzZ+6Fto1fvSCwNdYuG+gx/
	Dgz1DlL5W3VePlrd0i2yhxmZwUde1tB20SnF7u2xhH6bc/yZtia9OTlrgEu4ohwpjZ9MlQQf
	hwDZZvuteof7fjnjH/MyHFoHBKcuWh0N/ZLlGW6UJky5yoNUa5R/AbCzVFW0AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeLIzCtJLcpLzFFi42I5/e/4PV3m8HWpBud/sVvc+NXGatH4aS6z
	xd95U9ks1h65y27x++laJovN/foObB5XvzUzexx8t4fJo2/LKkaPvzevswawROnZFOWXlqQq
	ZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehl7H4nWdDKVXHq5Wu2
	BsYfHF2MnBwSAiYSx06tZ+pi5OIQEljKKHFn9yzWLkYOoISUxMq56RA1whJ/rnWxgdhCAs+A
	ap7rgpSwCehJrF0bARIWETCVmNx9hhFkDLPAcUaJzhuXwOqFBTQl1j1bwwhiswioSly9/IAd
	xOYVMJd4tvUzWFxUwFLi+NZ2Noi4oMTJmU9YQGxmgWyJr6ufM09g5JuFJDULSWoW0BnMQCvW
	79KHCGtLLFv4mhnCtpVYt+49ywJG1lWMIqmlxbnpucVGesWJucWleel6yfm5mxiBEbHt2M8t
	OxhXvvqod4iRiYPxEKMKUOejDasvMEqx5OXnpSqJ8N6QXJcqxJuSWFmVWpQfX1Sak1p8iNEU
	6J2JzFKiyfnAWM0riTc0MzA1NDGzNDC1NDNWEuf1LOhIFBJITyxJzU5NLUgtgulj4uCUamAS
	/qUcEsTiJy4c8Xh19j2rFR4VU1IemOjwLW2bfM56nrH90fnn3tdaZF5RO3dgTpu/dZjz7Ilp
	FpUv3wf9MTzqKiShfLIrd+Vd9WtnVi1d/CI4RO244bvHoQ/n/5X4/ypnivSuxvVhE99EveRS
	O/pV82RojViG7Bn751eM1OZK7r6yXFol8arYxdcvvy1Xqrx3YuYqKZb+z6oVHvKzvib8lsq0
	7zp30aZtkZ1uz+5DfY8Psi/yNWL+s2iJim1JYv3pCAkVrzjLlowtuybL/D0g9qaj6p78L+YZ
	4Ydjsx75yU4It49ItGN99MF2p7vtwvsHGgonthbq+Sk3rnSwuM/14ItH8bIk87ZPsu+eOW9T
	YinOSDTUYi4qTgQAcRoVFx0DAAA=
X-CMS-MailID: 20240122115235eucas1p1f313da18ba39fa558ccc7ff600d8ea73
X-Msg-Generator: CA
X-RootMTR: 20240122115235eucas1p1f313da18ba39fa558ccc7ff600d8ea73
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240122115235eucas1p1f313da18ba39fa558ccc7ff600d8ea73
References: <CGME20240122115235eucas1p1f313da18ba39fa558ccc7ff600d8ea73@eucas1p1.samsung.com>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rg87g4qOQ6M.A.N5D.KllrlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2715
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/oypijdplxttwjs.fsf%l.stelmach@samsung.com
Resent-Date: Mon, 22 Jan 2024 12:02:18 +0000 (UTC)

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Last year we decided to include nbd package in Tizen. Every package we
use gets a periodic treatment with static analysis tools (Coverity,
SVACE). There were some problems detected in nbd and we've developed a
number of patches[1] to fix them. Please take a look at them as well as
the eariler patch[1] I posted.

[1] https://git.tizen.org/cgit/platform/upstream/nbd/log/?h=3Dtizen&id=3D2c=
54e25b0cea8d30f7958fa2d17c67b91867aff6
[2] https://lists.debian.org/nbd/2023/08/msg00046.html

Kind regards,
=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmWuVvcACgkQsK4enJil
gBBtlQgAlvhGWcPx95/y6ZGvjRq2QP+dLCxB4kdW2D55+5kXSGMWgbEqClLS3tBN
qwm+lzoOxp45z2z5vtci6t4QfDF+bMUaeN4x6pmmrpMt693nXnHij/HXGuTLICob
rkh/V7aSruuXBX7EXR8ZuKT8qJWvRy0/hTZkvNRaEIJu0aF5AHzgsPeuin6z1WwU
nW+1/Jkq8cymgL/wzwsyo8gMRutC+TkcBwl0urtbgid1upR+mSGIv760NgAu2zM7
DF/WvSZ8SV4HXfa+mJCSE/l3AzvrVZ19z3obJCO8ilzN6jbMzWTFSw0kfWm3IlhO
320HIVQVL4adJZHAVtDk+CPo0PZZ0g==
=LVNg
-----END PGP SIGNATURE-----
--=-=-=--

