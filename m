Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 822C6867791
	for <lists+nbd@lfdr.de>; Mon, 26 Feb 2024 15:03:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 052F0209B7; Mon, 26 Feb 2024 14:03:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 26 14:03:13 2024
Old-Return-Path: <l.stelmach@samsung.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 149A720757
	for <lists-other-nbd@bendel.debian.org>; Mon, 26 Feb 2024 13:46:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.21 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.002, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Fv_jqG405KzE for <lists-other-nbd@bendel.debian.org>;
	Mon, 26 Feb 2024 13:46:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mailout1.w1.samsung.com", Issuer "DigiCert Global G2 TLS RSA SHA256 2020 CA1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DAD3C20754
	for <nbd@other.debian.org>; Mon, 26 Feb 2024 13:46:37 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20240226134632euoutp01c414d43da8add3981f8708b237ccef24~3bbFsR9321653116531euoutp01E
	for <nbd@other.debian.org>; Mon, 26 Feb 2024 13:46:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20240226134632euoutp01c414d43da8add3981f8708b237ccef24~3bbFsR9321653116531euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1708955192;
	bh=EqiIs6/atOiqARs4fD7uv+avIOz84XHs0sq/FAJgNGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lnIaQ8l9p3tSWXaZg7aMi5PlkEZHizlthdZi1Drx4vztY3q0pyRrZKI3Q21vP2Y9d
	 bs3h3ScOQDNnBFVVw2jsSbkknTq9JMCz30mjUqCn7tRNQeb4+e9O3yJom2wlJCqG3z
	 Zv+/Kkkx2kAKSrXJGQHL/3bEQDO+gwqMNXleR4hw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240226134631eucas1p2a9d74566ad5727dcb53d3ced5342d31c~3bbFTmqV_2904229042eucas1p2W;
	Mon, 26 Feb 2024 13:46:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 94.B7.09814.7369CD56; Mon, 26
	Feb 2024 13:46:31 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20240226134631eucas1p1013ddd203d7b822a28dd58f57ddf3db8~3bbE3XET03016430164eucas1p1S;
	Mon, 26 Feb 2024 13:46:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240226134631eusmtrp1de42a4f477e737f94badf6858b9e99a6~3bbE2rnUp2863028630eusmtrp1G;
	Mon, 26 Feb 2024 13:46:31 +0000 (GMT)
X-AuditID: cbfec7f4-727ff70000002656-bc-65dc9637c634
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 18.42.09146.7369CD56; Mon, 26
	Feb 2024 13:46:31 +0000 (GMT)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20240226134631eusmtip1af2631d788441cb39a5b0db1dc500faa~3bbEtDxRY1875318753eusmtip1G;
	Mon, 26 Feb 2024 13:46:31 +0000 (GMT)
From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To: nbd@other.debian.org, Wouter Verhelst <w@uter.be>, Eric Blake
	<eblake@redhat.com>
Cc: Karol Lewandowski <k.lewandowsk@samsung.com>, jh80.chung@samsung.com,
	m.szyprowski@samsung.com, Marek Pikula <m.pikula@partner.samsung.com>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH] Change the output file name to lowercase
Date: Mon, 26 Feb 2024 14:46:07 +0100
Message-Id: <20240226134607.1795499-1-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <oypijd8r37fjfy.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djP87rm0+6kGjy/b2kx8e16Vosbv9pY
	LRo/zWW2uHloBaPF33lT2SzWHrnLbvH76Vomi839+g4cHle/NTN7HHy3h8nj/b6rbB59W1Yx
	evy9eZ01gDWKyyYlNSezLLVI3y6BK6PhbyNLwR22ikkrLrE2MF5i7WLk4JAQMJG4P12zi5GL
	Q0hgBaPE8Y+HgeKcQM4XRomLp4QhEp8ZJeZduAPXsHW3E0R8OaPEy6/zmSCcF4wSDW+PgHWz
	CThK9C89AWaLCIRLXF/znx2kiFngAqPEod+P2UAmCQtYSty7wgZSwyKgKvH27nWwel4BW4nm
	zoPsEMvkJRY/kAAJcwpYSDReXA5VIihxcuYTFhCbX0BLYk3TdTCbGai8eetsZpBVEgJPOCQu
	XD8AlpAQcJHo39jCCGELS7w6voUdwpaROD25hwWioZ1RounKQlYIZwKjxOeOJiaIKmuJO+d+
	gR3NLKApsX6XPkTYUaJh8Uo2iEP5JG68FYQ4gk9i0rbpzBBhXomONiGIahWJdf17oM6Rkuh9
	tYJxAqPSLCTvzELywiyEXQsYmVcxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEJpzT/45/
	2cG4/NVHvUOMTByMhxglOJiVRHjDZW6mCvGmJFZWpRblxxeV5qQWH2KU5mBREudVTZFPFRJI
	TyxJzU5NLUgtgskycXBKNTCtXJh63Fh91ZQ1yfJMCv+XWq98FFr56Nrzgi2q/DvedN49PrtB
	uEnhTNoO3l2/D5QVJ57afsz15iEfVte8Dv81t/7f9becmsTSU6++96HSpn1zronfYf5ts2qH
	pGcCf9PTHacu+zNz8f08X931Umrp/iffTudlBSf8Y53gU7WrYoX3349tohZ35+buqJoodDt/
	sbJxbp9X9oX7uhM6l3dHbnrc6LNQ0diPY0HsxZMut+vLpA9ySX5n9WyabhCiySTzIXSiRskm
	xUXBC2T0qyedOVrjzbU2eb+moZyxaOravtoDR3y+CS0+eJ3x0905l/lm3Vl/si1wXVuLyhFf
	yf8FWUyGxRUN+ycYsv2S3SupxFKckWioxVxUnAgA6bRurqcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xu7rm0+6kGkydJGMx8e16Vosbv9pY
	LRo/zWW2uHloBaPF33lT2SzWHrnLbvH76Vomi839+g4cHle/NTN7HHy3h8nj/b6rbB59W1Yx
	evy9eZ01gDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI
	3y5BL6PhbyNLwR22ikkrLrE2MF5i7WLk4JAQMJHYutupi5GLQ0hgKaPEv0Nn2SDiUhIr56Z3
	MXICmcISf651sUHUPGOUeH9wBhtIgk3AUaJ/6QlWEFtEIFLi5NlX7CBFzAJXGCUmNr5lAhkk
	LGApce8KWD2LgKrE27vXwep5BWwlmjsPskPskpdY/EACJMwpYCHReHE5WImQgLnEg2v7mSHK
	BSVOznzCAlLOLKAusX6eEEiYX0BLYk3TdRYQmxloSvPW2cwTGIVmIemYhdAxC0nVAkbmVYwi
	qaXFuem5xYZ6xYm5xaV56XrJ+bmbGIHRte3Yz807GOe9+qh3iJGJg/EQowQHs5IIb7jMzVQh
	3pTEyqrUovz4otKc1OJDjKZAj01klhJNzgfGd15JvKGZgamhiZmlgamlmbGSOK9nQUeikEB6
	YklqdmpqQWoRTB8TB6dUA5N0xHJ3H6HPMSETL8/YWBXDI2Veu/H5WYbGpvXnPf4YnUvn3nkp
	jvnN46/pK67yK0yUXhZ4dPfkbYs/dYWuWH2teZHuqXkbHZhL97WzfSoS7fR65/lwvlcn88fJ
	jNG7by9k5PZ90P9M8oZc180JCaImGQXX+7RY7vPs5e75Hqo9J//BkjZbk9U/19ecf/zvTeyP
	ifOuiH04vOBuUpDjO1X5N3q8j6eufLEx1eChwQanvccM3eKVzjtnHGvpO3goeGkik9X/SbO6
	WV5nl/1gf/VAm+uXyumAyMfTzjPeuq7z1jPs7LtT8ZJhfxMfThCweLj5/p9agY7Iy+1KN12Y
	HP7eX1s1Yd77Sbp7GO3+2RWLKbEUZyQaajEXFScCAMX8+k43AwAA
X-CMS-MailID: 20240226134631eucas1p1013ddd203d7b822a28dd58f57ddf3db8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240226134631eucas1p1013ddd203d7b822a28dd58f57ddf3db8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240226134631eucas1p1013ddd203d7b822a28dd58f57ddf3db8
References: <oypijd8r37fjfy.fsf%l.stelmach@samsung.com>
	<CGME20240226134631eucas1p1013ddd203d7b822a28dd58f57ddf3db8@eucas1p1.samsung.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <39Sle5wSZ4B.A.9rB.hoJ3lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2773
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240226134607.1795499-1-l.stelmach@samsung.com
Resent-Date: Mon, 26 Feb 2024 14:03:14 +0000 (UTC)

Fixes: 6ca4b63 ("Simplfy the process of building man pages")
Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
Here it goes. This was trivial.

 man/nbdtab.5.sgml.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/nbdtab.5.sgml.in b/man/nbdtab.5.sgml.in
index 6da7bfe..2163056 100644
--- a/man/nbdtab.5.sgml.in
+++ b/man/nbdtab.5.sgml.in
@@ -19,7 +19,7 @@ manpage.1: manpage.sgml
   <!ENTITY dhsection   "<manvolnum>5</manvolnum>">
   <!ENTITY dhemail     "<email>wouter@debian.org</email>">
   <!ENTITY dhusername  "Wouter Verhelst">
-  <!ENTITY dhucpackage "<refentrytitle>NBDTAB</refentrytitle>">
+  <!ENTITY dhucpackage "<refentrytitle>nbdtab</refentrytitle>">
   <!ENTITY dhpackage   "@MAN_SYSCONFDIR@/nbdtab">
 
   <!ENTITY debian      "<productname>Debian GNU/Linux</productname>">
-- 
2.39.2

