Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 763248675B2
	for <lists+nbd@lfdr.de>; Mon, 26 Feb 2024 13:55:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4615020ACE; Mon, 26 Feb 2024 12:55:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 26 12:55:15 2024
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
	by bendel.debian.org (Postfix) with ESMTP id D3FB420ACC
	for <lists-other-nbd@bendel.debian.org>; Mon, 26 Feb 2024 12:55:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12.11 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.002, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0t6IJodzsa9i for <lists-other-nbd@bendel.debian.org>;
	Mon, 26 Feb 2024 12:54:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mailout2.w1.samsung.com", Issuer "DigiCert Global G2 TLS RSA SHA256 2020 CA1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0077520ACA
	for <nbd@other.debian.org>; Mon, 26 Feb 2024 12:54:52 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240226125447euoutp022913589b087cfaec09748fa4ea7a8847~3at6SExwc2998329983euoutp02W;
	Mon, 26 Feb 2024 12:54:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240226125447euoutp022913589b087cfaec09748fa4ea7a8847~3at6SExwc2998329983euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1708952087;
	bh=p+cRB47Os+jLssj0WyoVXRLdrfEOXhf56f76wXIGw7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qjgVdq0YOh7dw9elZZCHqCh6exkIsum4tZ+mHuFcTYWmiUlA4gFcBE89O5MHkRcUt
	 ANVGiVA87vN4A0kVgp3W2hpd3bfLsVvkLQN57BvyL+aY//ICMIB4aKpy+tTfudXIqZ
	 qGDTetO4/kUXqeKTJ+aEfowzcYNVZ52mWO6ceeiE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240226125447eucas1p2edaa860040ef4417882307d80eba9bf0~3at57fJJx0707107071eucas1p2z;
	Mon, 26 Feb 2024 12:54:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 63.14.09552.71A8CD56; Mon, 26
	Feb 2024 12:54:47 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240226125446eucas1p1dba3fe14743c2fdc2c1ee3b9c4189197~3at5hLihs2874628746eucas1p1k;
	Mon, 26 Feb 2024 12:54:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240226125446eusmtrp2941f94fe696062c9a1eeba3102395e1c~3at5gVEls2006720067eusmtrp2c;
	Mon, 26 Feb 2024 12:54:46 +0000 (GMT)
X-AuditID: cbfec7f5-853ff70000002550-9d-65dc8a179412
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 28.88.09146.61A8CD56; Mon, 26
	Feb 2024 12:54:46 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240226125446eusmtip24a84ac4ca5e14d0a43f1be436f00ae0a~3at5RqRG-1905719057eusmtip2B;
	Mon, 26 Feb 2024 12:54:46 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org,  Karol Lewandowski <k.lewandowsk@samsung.com>,
	=?utf-8?B?7J6s7ZuIIOyglQ==?= <jh80.chung@samsung.com>,  Marek Szyprowski
	<m.szyprowski@samsung.com>, Marek Pikula <m.pikula@partner.samsung.com>
Subject: Re: Fixes after static code analysis
Date: Mon, 26 Feb 2024 13:54:16 +0100
In-Reply-To: <ZdhdeAVU9u1ZWnI4@pc220518.home.grep.be> (Wouter Verhelst's
	message of "Fri, 23 Feb 2024 10:55:20 +0200")
Message-ID: <oypijdfrxffksn.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7djP87riXXdSDXZPF7a48auN1aLx01xm
	i7/zprJZrD1yl93i99O1TBab+/Ud2Dyufmtm9jj4bg+TR9+WVYwef29eZw1gieKySUnNySxL
	LdK3S+DK2PVzMWPBF+GK67sXMTUwtgl2MXJySAiYSDROfsHUxcjFISSwglFixtXV7BDOF0aJ
	5d/PQ2U+M0q8/vaFBabl74wbYLaQwHJGidOLoyGKXjBKfH17iLWLkYODTUBPYu3aCJAaEQF5
	icWtt9hAbGaBu4wSa+4EgdjCAroS9/dNBIuzCKhKrFn6gQnE5hSokPh4uh3M5hUwl1j09AMj
	iC0qYClxfGs7G0RcUOLkzCcsEDNzJWaef8MIcoOEwAsOiR+rnzNBHOoisfxdHxuELSzx6vgW
	dghbRuL/zvlMEA3tjBJNVxayQjgTGCU+dzRBdVtL3Dn3C6rbUWLS3+tsIJ9JCPBJ3HgrCLGZ
	T2LStunMEGFeiY42IYhqFYl1/XuggSUl0ftqBSOE7SGx6/dSaMB1MEpsfM82gVFhFpJ/ZiH5
	ZxbQVGYBTYn1u/QhwtoSyxa+ZoawbSXWrXvPsoCRdRWjeGppcW56arFxXmq5XnFibnFpXrpe
	cn7uJkZgIjr97/jXHYwrXn3UO8TIxMF4iFEFqPnRhtUXGKVY8vLzUpVEeMNlbqYK8aYkVlal
	FuXHF5XmpBYfYpTmYFES51VNkU8VEkhPLEnNTk0tSC2CyTJxcEo1MBXYTCt86BfW/mjP11XT
	F9q2zzr5YedV1vbfwl+uzDuw1D75WsUnQ5ljm0N2uBmlylmL+pbMC5se+cqlZNWh9a+u2u7k
	6lBIevXB9Ulkw7qT/3faTXJTbpmmcYM1q3ZFQ7Y6q6Oz56/4GUst/bfUGEp+XiC7x+Xk2xWP
	Qiwu/T/ypXOCIdPKr2ZXtFWZPx77/2pl14zSpUsfPV5bmWSZuHnvkvbvh/6un336RvRPUYWt
	Z7lDTlpHOp2OufBPNcpTJY5B9Kul017JhDdarPrzzGbsenEl2utg8Q55U91AjsAZbTPTGSN3
	7d8wge/RD0GtRaXu4WlvvH7ynjswhdOyfMG7jRMvaptky0bpzV61ehOnEktxRqKhFnNRcSIA
	aOT2FL8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xe7piXXdSDSZtNLS48auN1aLx01xm
	i7/zprJZrD1yl93i99O1TBab+/Ud2Dyufmtm9jj4bg+TR9+WVYwef29eZw1gidKzKcovLUlV
	yMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL2PVzMWPBF+GK67sX
	MTUwtgl2MXJySAiYSPydcYOli5GLQ0hgKaPEup+LWLsYOYASUhIr56ZD1AhL/LnWxQZR84xR
	4umq1SwgNWwCehJr10aA1IgIyEssbr0FVsMs8JBR4ubt0ywgCWEBXYn7+yaygdhCQMvW7lnB
	DmKzCKhKrFn6gQnE5hSokPh4uh3M5hUwl1j09AMjiC0qYClxfGs7G0RcUOLkzCdgM5kFsiW+
	rn7OPIFRYBaS1CwkqVlA5zELaEqs36UPEdaWWLbwNTOEbSuxbt17lgWMrKsYRVJLi3PTc4sN
	9YoTc4tL89L1kvNzNzECo2jbsZ+bdzDOe/VR7xAjEwfjIUYVoM5HG1ZfYJRiycvPS1US4Q2X
	uZkqxJuSWFmVWpQfX1Sak1p8iNEU6LWJzFKiyfnA+M4riTc0MzA1NDGzNDC1NDNWEuf1LOhI
	FBJITyxJzU5NLUgtgulj4uCUamBS+nv/41F3Y/nGqzv+zHgbVLBvtpXtzuOay/68zFh3z8b0
	V23Jgt3r3Zd11k/fKP/6k/n18AfhS/8w6/Clfd/Ecdl141JXls1SyneVX4hsWREjXxOoHvK8
	T7JlX8uJEq/rzraV5zS3q+lvvzBlv+bcmt1TzitrZM+6sO7wp2UVTNsve1yKqjRaYbst4srL
	LvZZ8hEhZslfeYN4jge+upj7rW3feT8pJYbk0q8vGI/2/fEPargVUndj+e/l1WUb97XPK5+n
	5a7wjVOs3kFO4P0K3x9bKl56OX+aGFV+9tCCzpbp5x0aznx8tvRPqkla1V7+FSvsZNY3Rxx0
	/Jlexfzra/C6uZsVu+3eLbL8YPM+VomlOCPRUIu5qDgRAKHb66o3AwAA
X-CMS-MailID: 20240226125446eucas1p1dba3fe14743c2fdc2c1ee3b9c4189197
X-Msg-Generator: CA
X-RootMTR: 20240226125446eucas1p1dba3fe14743c2fdc2c1ee3b9c4189197
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240226125446eucas1p1dba3fe14743c2fdc2c1ee3b9c4189197
References: <ZdhdeAVU9u1ZWnI4@pc220518.home.grep.be>
	<CGME20240226125446eucas1p1dba3fe14743c2fdc2c1ee3b9c4189197@eucas1p1.samsung.com>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Ha1j_EfpQ-M.A.KeG.zoI3lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2771
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/oypijdfrxffksn.fsf%l.stelmach@samsung.com
Resent-Date: Mon, 26 Feb 2024 12:55:15 +0000 (UTC)

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Wouter,

It was <2024-02-23 pi=C4=85 10:55>, when Wouter Verhelst wrote:
> On Thu, Feb 22, 2024 at 12:34:58PM +0100, Lukasz Stelmach wrote:
>> It was <2024-02-20 wto 14:06>, when Wouter Verhelst wrote:
>>> I finally had time to have a look at your patches. Unfortunately, they
>>> break the test suite; if you run "make check", the result is fairly
>>> depressing :)
>>>
>>> Can you have a look at what's going wrong?
>>=20
>> I "fixed" one too many memory leaks reported by Coverity. I'd reverted[1]
>> it and it helped
>>=20
>> --8<---------------cut here---------------start------------->8---
>> $ make check
>> make  check-recursive
>> [=E2=80=A6]
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> All 5 tests passed
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [=E2=80=A6]
>> ../inetd
>> Error: inetd mode not supported without syslog support
>> SKIP: inetd
>> [=E2=80=A6]
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> All 18 tests passed
>> (1 test was not run)
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --8<---------------cut here---------------end--------------->8---
>
> Thanks.
>
> I've merged your branch, but removed those two commits (the original and
> the revert).

Great :-) We will be deploying NBD on our testing rig sometime soon, so
if we find anything else, we'll share patches.

Ouch, it's probably my fault, because I didn't warn you, but at the
bottom the branch there were two commits adding our packaging directory
with nbd.spec file for Tizen (this doesn't break anything from your
point of view, but it's garbage) and the commit and the commit that
changes documentation building process you weren't sure about.

Kind regards,
=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmXcifgACgkQsK4enJil
gBB8Zgf+MAhp75Kvx4I+MygMCGEMZgDHDTQ53Xydmwb4EEQXgcXkB9/TCFMdaybC
zRwUobj45dG1+jRsW8ZnS53LibdU+aC0d1qxdtLuzVfVJlEKieyBcSr9JtEbwxuz
3SelzP/r/crT+00AjYhUjOKBGMZjh0DJv7DAetKrrjwivCOYCQKNjRUGgXUxwmNS
ZiYeR0H+PAHJf+C6H0JubMqtqlLRypwPlcSx7Q+Xv89ou8bO/8eJGGrKSbeQBy2n
32k6ZnxOWWYIVu0ls7luqXLuX+5J8s/wSd76lIaE4trlUKHBzKtOVn6SxfQN2ua6
FZIvWFagOI0C9Sn8JbZ+KsTEhF7WQw==
=3dVj
-----END PGP SIGNATURE-----
--=-=-=--

