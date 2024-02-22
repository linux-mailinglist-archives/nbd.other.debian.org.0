Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id D852485F72A
	for <lists+nbd@lfdr.de>; Thu, 22 Feb 2024 12:35:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 970B8207FF; Thu, 22 Feb 2024 11:35:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 22 11:35:36 2024
Old-Return-Path: <l.stelmach@samsung.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MD5_SHA1_SUM,
	PGPSIGNATURE,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5BD22207EC
	for <lists-other-nbd@bendel.debian.org>; Thu, 22 Feb 2024 11:35:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-13.559 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.451, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, PGPSIGNATURE=-5, RCVD_IN_DNSWL_HI=-5,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id axW9h_bS4b6p for <lists-other-nbd@bendel.debian.org>;
	Thu, 22 Feb 2024 11:35:16 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .samsung. - helo: .mailout2.w1.samsung. - helo-domain: .samsung.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mailout2.w1.samsung.com", Issuer "DigiCert Global G2 TLS RSA SHA256 2020 CA1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0428D207FB
	for <nbd@other.debian.org>; Thu, 22 Feb 2024 11:35:14 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240222113509euoutp02cad7c44789fbddac07a6f57a0064d9ec~2LDPZeQEX2382723827euoutp02b;
	Thu, 22 Feb 2024 11:35:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240222113509euoutp02cad7c44789fbddac07a6f57a0064d9ec~2LDPZeQEX2382723827euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1708601709;
	bh=xKmZmfDPT8NqRrmGH7xvo2zf7Xtx7PMrCNRRacYVt9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tIM/+dSnsu0Ww0x13NSSxOETv5Vhmxv0Tglt7HzT/FXadSwJUeKu5aBnBk/MygDul
	 rDiMOvGIfzBJHlTco00nBNaAp5xqRWbvvX/0SEnuq8NSuKr7l5rodhFuv2CBmBJye5
	 sRjSuKkwlbqd8hjqKd4+rN76POwGKbLJ/WtxL+JU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240222113509eucas1p1c312627c0179a77a2597cdc75c36ae68~2LDPIjuWj1384513845eucas1p1Z;
	Thu, 22 Feb 2024 11:35:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 80.8D.09539.D6137D56; Thu, 22
	Feb 2024 11:35:09 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240222113509eucas1p1f1590778e4d4144d19b6a2d6df65fba5~2LDOnxlA31384513845eucas1p1Y;
	Thu, 22 Feb 2024 11:35:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240222113508eusmtrp1684a80274fa768911332c7984c70fe4c~2LDOnJqKV3205432054eusmtrp1X;
	Thu, 22 Feb 2024 11:35:08 +0000 (GMT)
X-AuditID: cbfec7f2-52bff70000002543-8e-65d7316da78a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 37.10.09146.C6137D56; Thu, 22
	Feb 2024 11:35:08 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240222113508eusmtip2e623e36c077590c3cc2b967339b2124c~2LDObJCQ30817508175eusmtip2R;
	Thu, 22 Feb 2024 11:35:08 +0000 (GMT)
From: Lukasz Stelmach <l.stelmach@samsung.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org,  Karol Lewandowski <k.lewandowsk@samsung.com>,
	=?utf-8?B?7J6s7ZuIIOyglQ==?= <jh80.chung@samsung.com>,  Marek Szyprowski
	<m.szyprowski@samsung.com>, Marek Pikula <m.pikula@partner.samsung.com>
Subject: Re: Fixes after static code analysis
Date: Thu, 22 Feb 2024 12:34:58 +0100
In-Reply-To: <ZdSVsGq3u83Z6w-V@pc220518.home.grep.be> (Wouter Verhelst's
	message of "Tue, 20 Feb 2024 14:06:08 +0200")
Message-ID: <oypijdcysohgv1.fsf%l.stelmach@samsung.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
	protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7djP87q5htdTDTb9lrW48auN1aLx01xm
	i7/zprJZrD1yl93i99O1TBab+/Ud2Dyufmtm9jj4bg+TR9+WVYwef29eZw1gieKySUnNySxL
	LdK3S+DK2P3kIVvBI5WKncufMDUwzpLvYuTkkBAwkWjqmcPWxcjFISSwglGiad4kRgjnC6PE
	wda9zBDOZ0aJ+Z9vsMO0fDn+igUisZxR4u7+uUwQzgtGiQmX24CGcXCwCehJrF0bAdIgIiAv
	sbj1FhuIzSxwl1FizZ0gEFtYQFfi/r6JYHEWAVWJJ2s2M4PYnAIVEv8aToDZvALmEl/ndbGC
	2KIClhLHt7azQcQFJU7OfMICMTNXYub5N2BnSwg84ZDYuHsGC8SlLhLLf0E0SAgIS7w6vgXq
	AxmJ05N7WCAa2oGevrKQFcKZwCjxuaOJCaLKWuLOuV9g30gIOEos7RSDMPkkbrwVhFjMJzFp
	23RmiDCvREebEESjisS6/j1QJ0hJ9L5awQhR4iHx6pYsJKg6GCX2nZvLPIFRYRaSd2YheWcW
	UAuzgKbE+l36EGFtiWULXzND2LYS69a9Z1nAyLqKUTy1tDg3PbXYMC+1XK84Mbe4NC9dLzk/
	dxMjMBGd/nf80w7Gua8+6h1iZOJgPMSoAtT8aMPqC4xSLHn5ealKIrws5VdShXhTEiurUovy
	44tKc1KLDzFKc7AoifOqpsinCgmkJ5akZqemFqQWwWSZODilGpgcdqU27ttlNDtY4NSNRZlv
	Vh141DD5tZpXcMrSjx+ld/iGrlTqcZZc+WHvsuKDq9gjqxsLXee+sX7IenZ9yXFTa8WpbjtS
	XwQF/An3etY08fQ9swMCrIu0L+vZFev8/Xrq2NMfR47lBYXvnbE63eRBocGsyvS3y3+LGax4
	5Rgl3NL3afdaiWsfp+TGbzgj53ZMP0xK76zZB5bY6Lk+xpWRS8Sjgw1Mk73lLVIeHdF/ZB5m
	VXol6+MxCb/VgZa1C59Laf98ZDLxtXrqN3m9RQHRs26n9szTVPq1K2uV2Hd2hnrWiqezWr7r
	7uM0abl9IpJfYKqo5MOeiCT2/0a8ydeiFXZUGFSaau363f/nvJMSS3FGoqEWc1FxIgAIeTWq
	vwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xe7o5htdTDe6uN7e48auN1aLx01xm
	i7/zprJZrD1yl93i99O1TBab+/Ud2Dyufmtm9jj4bg+TR9+WVYwef29eZw1gidKzKcovLUlV
	yMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DL2P3kIVvBI5WKncuf
	MDUwzpLvYuTkkBAwkfhy/BVLFyMXh5DAUkaJpbv3snYxcgAlpCRWzk2HqBGW+HOtiw2i5hmj
	xI8/t8Bq2AT0JNaujQCpERGQl1jcegushlngIaPEzdunWUASwgK6Evf3TWQDsYWAlq19+Rws
	ziKgKvFkzWZmEJtToELiX8MJMJtXwFzi67wuVhBbVMBS4vjWdjaIuKDEyZlPwHqZBbIlvq5+
	zjyBUWAWktQsJKlZQOcxC2hKrN+lDxHWlli28DUzhG0rsW7de5YFjKyrGEVSS4tz03OLDfWK
	E3OLS/PS9ZLzczcxAqNo27Gfm3cwznv1Ue8QIxMH4yFGFaDORxtWX2CUYsnLz0tVEuFlKb+S
	KsSbklhZlVqUH19UmpNafIjRFOi1icxSosn5wPjOK4k3NDMwNTQxszQwtTQzVhLn9SzoSBQS
	SE8sSc1OTS1ILYLpY+LglGpg2m6u3TLtT73GV9Y0AS+VdR++ryhquSEWcz++aqLp6s+OS1xV
	6q8teaS+0PSXkTa3UX/l1Fd9yr61rxKu7rZzfhgf/X3SiqMBq1f+2iq7RmuFSO2nOYxceUlC
	fF0bRFgrewwbuVofh7zZcLL7TxuPwDWxrwvm8+7JUGC9pn98b23ZahWrwGb2KW6MlnfPsn2p
	3CDBqyz5uMj+fn/kZn6OB3efXjRcKGOs+l27c/vLBWfvsMhP6r/321pASnaj1S21GZk7eTcc
	f9e3irHug/X+J7Uy0ZFflp2W8BOdaXykdqGKgLrTsfKjB3LmTg9075E/vqy0sVVm+7SDJyZG
	r/zpFNImLLducYcRg/L3tceuK7EUZyQaajEXFScCAPrvrWo3AwAA
X-CMS-MailID: 20240222113509eucas1p1f1590778e4d4144d19b6a2d6df65fba5
X-Msg-Generator: CA
X-RootMTR: 20240222113509eucas1p1f1590778e4d4144d19b6a2d6df65fba5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240222113509eucas1p1f1590778e4d4144d19b6a2d6df65fba5
References: <ZdSVsGq3u83Z6w-V@pc220518.home.grep.be>
	<CGME20240222113509eucas1p1f1590778e4d4144d19b6a2d6df65fba5@eucas1p1.samsung.com>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tOTzsri1gJG.A.URC.IGz1lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2764
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/oypijdcysohgv1.fsf%l.stelmach@samsung.com
Resent-Date: Thu, 22 Feb 2024 11:35:36 +0000 (UTC)

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Wouter,

It was <2024-02-20 wto 14:06>, when Wouter Verhelst wrote:
> On Thu, Feb 01, 2024 at 08:30:46PM +0100, Lukasz Stelmach wrote:
>> It was <2024-01-31 =C5=9Bro 21:14>, when Wouter Verhelst wrote:
>>> On Mon, Jan 22, 2024 at 12:52:23PM +0100, Lukasz Stelmach wrote:
>>>>=20
>>>> Last year we decided to include nbd package in Tizen. Every package we
>>>> use gets a periodic treatment with static analysis tools (Coverity,
>>>> SVACE). There were some problems detected in nbd and we've developed a
>>>> number of patches[1] to fix them. Please take a look at them as well as
>>>> the eariler patch[1] I posted.
>>>>=20
>>>> [1] https://git.tizen.org/cgit/platform/upstream/nbd/log/?h=3Dtizen&id=
=3D2c54e25b0cea8d30f7958fa2d17c67b91867aff6
>>>
>>> Is this available in some public repository that I can just pull from? I
>>> tried  https://git.tizen.org/platform/upstream/nbd,  which seemed the
>>> most obvious, but that didn't work.
>>=20
>> That's
>>=20
>>     git fetch https://git.tizen.org/cgit/platform/upstream/nbd 2c54e25b0=
cea8d30f7958fa2d17c67b91867aff6
>>=20
>> with "/cgit/" between ".org" and "platform".
>>=20
>>> I didn't like this because there are some autoconf variables that (by
>>> default) have other variables in them, in ways that expose them as shell
>>> variables; e.g., the default setting for sysconfdir is "${prefix}/etc",
>>> which means that if you run "./configure" with no arguments,
>>> nbd-server(5) will mention that the configuration file is
>>> "${prefix}/etc/nbd-server/config", which I think is a bit ugly.
>>=20
>> It is indeed, but I believe it's not the case.
>>=20
>>> That's why I did it that way.
>>>
>>> I don't think your version does that? But I could be wrong, of course;
>>> in which case, please explain :)
>>=20
>> I wrote the patch some time ago (-; but I believe I haven't seen such
>> effect. Let me try. I run:
>>=20
>> git checkout e0a7534c74e7e21fe0be2ad55e4cbe35cef21a07
>> ../autogen.sh
>> configure
>> grep nbd-server/config -- man/nbd-server.5.sgml
>>=20
>>   <!ENTITY dhpackage   "/usr/local/etc/nbd-server/config">
>>       <filename>/usr/local/etc/nbd-server/config</filename> is the defau=
lt
>>=20
>> Next
>>=20
>> make -C man/ nbd-server.5
>> grep nbd-server/config -- man/nbd-server.5
>>=20
>> /usr/local/etc/nbd-server/config \- configuration file for nbd-server
>> \fB/usr/local/etc/nbd-server/config \fR
>> \fI/usr/local/etc/nbd-server/config\fR is the default
>>=20
>> If there are any problems, would you mind, responding to that patch and
>> pointing them out? I'd like to fix them.
>
> I finally had time to have a look at your patches. Unfortunately, they
> break the test suite; if you run "make check", the result is fairly
> depressing :)
>
> Can you have a look at what's going wrong?

I "fixed" one too many memory leaks reported by Coverity. I'd reverted[1]
it and it helped

=2D-8<---------------cut here---------------start------------->8---
$ make check
make  check-recursive
[=E2=80=A6]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All 5 tests passed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[=E2=80=A6]
./inetd
Error: inetd mode not supported without syslog support
SKIP: inetd
[=E2=80=A6]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All 18 tests passed
(1 test was not run)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=2D-8<---------------cut here---------------end--------------->8---

>> PS. I received thee more bug reports to handle. I'll review them when I
>> get back from FOSDEM, so you don't need to hurry with these.

Below the revert there are two more commits ("Fix out-of-bounds access")
I created after 2c54e25b0c we talked about last time.

[1] https://git.tizen.org/cgit/platform/upstream/nbd/log/?id=3D9e25a0751733=
45410de58ac9406a464fce929531

Kind regards,
=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmXXMWIACgkQsK4enJil
gBDKxgf7Bzq2/niIsKHNO9uIBMYsTlUdU022JTJAi5pyp5Yv6+70k0F4CAeFI0g0
vvEMqAo+EGdoZpOWa9LsT5/S/T5xnf3U5ECXGpw91edkNNYrGqKJNLmWUCR31TaU
kfnuFTIxbczMFapoN6Y7QM5850wCF5GGMacubjr/LW/cw8k0Nl/uu7tr/8VfSNKR
KL6D5CHmyuMAwm1tHxq/a8RS/VT5Wl9smFqf5mQOyBjmB+DojxsrWLMl3mdZ2+YV
QGcVOUMN5VWkvl/yuqhDv9Xsz10qSqt96zoUJWNCeFKubtVxdd06CidrL16j8jYb
Lg4TUomE5lHUQ+UivR7xhMg5VGScVA==
=oDrF
-----END PGP SIGNATURE-----
--=-=-=--

