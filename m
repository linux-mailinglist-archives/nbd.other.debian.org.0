Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C365780C7D
	for <lists+nbd@lfdr.de>; Fri, 18 Aug 2023 15:27:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E3F4821BAD; Fri, 18 Aug 2023 13:27:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 18 13:27:17 2023
Old-Return-Path: <l.stelmach@samsung.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	ATTENDEES_DBSPAM_BODY6,ATTENDEES_DBSPAM_BODY7,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,GENDER,
	PAGE_LINK_SPAM_BODY,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1C91921B85
	for <lists-other-nbd@bendel.debian.org>; Fri, 18 Aug 2023 13:10:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.381 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, ATTENDEES_DBSPAM_BODY6=1,
	ATTENDEES_DBSPAM_BODY7=1, BAYES_00=-2, DKIMWL_WL_HIGH=-0.021,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, GENDER=0.5, PAGE_LINK_SPAM_BODY=5,
	RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nqlDgugIEv-m for <lists-other-nbd@bendel.debian.org>;
	Fri, 18 Aug 2023 13:10:01 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 459 seconds by postgrey-1.36 at bendel; Fri, 18 Aug 2023 13:10:01 UTC
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mailout2.w1.samsung.com", Issuer "DigiCert Global G2 TLS RSA SHA256 2020 CA1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3F5B921AE4
	for <nbd@other.debian.org>; Fri, 18 Aug 2023 13:09:59 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20230818130213euoutp024b185c3dfe178022a6d25de13bc806e5~8e9l6syah3097330973euoutp02m
	for <nbd@other.debian.org>; Fri, 18 Aug 2023 13:02:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20230818130213euoutp024b185c3dfe178022a6d25de13bc806e5~8e9l6syah3097330973euoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1692363734;
	bh=tcLbntPMc67KvC6vczfw54d2FnYimq0a/oWlvfeaJ9g=;
	h=From:To:Cc:Subject:Date:References:From;
	b=AgH6zTfiboNeOv4xYh1PGPLB7/qj8zICtzdoydr4Ayt9e3gM2OBOr8grzQDA1B9FU
	 0ljxN+W6kfm6POLGv5gIAkxWH5IQ7hL1yxV3SSmORF+wYMLA0orcYBJdEXgFBYgB+h
	 GG+/1uxJJ+OLSTLeuJB7paT+EIK27vLuPqArwP2c=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20230818130212eucas1p2ec9f53be66f76769c1efdef3c453dbf1~8e9kgE4c31478614786eucas1p2H;
	Fri, 18 Aug 2023 13:02:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id F7.FD.42423.4DB6FD46; Fri, 18
	Aug 2023 14:02:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230818130212eucas1p2c38d1890f2eb064b03ccec8271dbc918~8e9kFPTAh1255212552eucas1p2K;
	Fri, 18 Aug 2023 13:02:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230818130212eusmtrp1a774db5d869087da28aed6b02d0f6485~8e9kEw1f43117731177eusmtrp1W;
	Fri, 18 Aug 2023 13:02:12 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-c3-64df6bd44256
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id A3.44.10549.3DB6FD46; Fri, 18
	Aug 2023 14:02:11 +0100 (BST)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20230818130211eusmtip191112f9a3c2be715676fceabea2b071a~8e9j4XGwh1331013310eusmtip1y;
	Fri, 18 Aug 2023 13:02:11 +0000 (GMT)
From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
To: nbd@other.debian.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	=?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
Subject: [PATCH] Simplfy the process of building man pages
Date: Fri, 18 Aug 2023 15:01:40 +0200
Message-Id: <20230818130140.620790-1-l.stelmach@samsung.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Samsung R&D Institute Poland
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsWy7djPc7pXsu+nGEyeLW5x89AKRou1R+6y
	W/x+upbJgdnj6rdmZo++LasYA5iiuGxSUnMyy1KL9O0SuDJWz/7JWNCdXjG9YSZrA+Oa0C5G
	Tg4JAROJDVsWMnYxcnEICaxglJjUMAvK+cIo0fJ4KxOE85lR4tTD3awwLXse34VKLGeU2LWs
	gwXCecEo0Tj/BxNIFZuAo0T/0hNgHSICEhIbLzxhBrGZBfIk9sw9D1YjLGAl8XbKRzYQm0VA
	VeLakWZ2EJtXwEbi0pmlQEM5gLbJSyx+IAERFpQ4OfMJC4jNL6AlsabpOgvESHmJ5q2zmUFu
	kBCYyCFxas0yZohLXSQm3mllhLCFJV4d38IOYctInJ7cwwLR0M4o0XRlISuEM4FR4nNHExNE
	lbXEnXO/2ECuYBbQlFi/Sx8i7Cix6/waNojj+CRuvBWEOIJPYtK26cwQYV6JjjYhiGoViXX9
	e1ggbCmJ3lcrGCFKPCQ2r46cwKg4C8lns5B8Mwth7QJG5lWM4qmlxbnpqcWGeanlesWJucWl
	eel6yfm5mxiBaeL0v+OfdjDOffVR7xAjEwfjIUYJDmYlEV4LpnspQrwpiZVVqUX58UWlOanF
	hxilOViUxHm1bU8mCwmkJ5akZqemFqQWwWSZODilGpgWR6yfuKC+PU9CQX6tU0ng/cs3z6Rv
	+eL/U6Bvp3pli1rG3Rzp6OLEZ6ffWzhL1t8NCfgv1DphXsrSQu+W5mXWTh4y2a65y75p1ebs
	0ClI2V+gKTpn+kuHBkc//WCP7l0MPdwv/Xeurq88M3/rjot1wjwrd++2kYyv3Xx6ftoX5Ym1
	0mK33A8+DE6awDelVuzWTvbeTGv1zMl/JFIOXcvkSbS4di6n5CNjpQ1jxSyvX5lcVaqhij+q
	XuiLh7u8+W6U2BTGfe/yqytrTl5nq1j/9duSvAaZNzbfVYT7b7/TcLBqSDtgPz36Yu89w/R9
	i9quzIr49nUVr/dLyfquGUUpwnw9J6RWlj57ufj7HCWW4oxEQy3mouJEAFQfGZ2CAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGLMWRmVeSWpSXmKPExsVy+t/xu7qXs++nGMy6bm5x89AKRou1R+6y
	W/x+upbJgdnj6rdmZo++LasYA5ii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62M
	TJX07WxSUnMyy1KL9O0S9DJWz/7JWNCdXjG9YSZrA+Oa0C5GTg4JAROJPY/vMnUxcnEICSxl
	lDj07QdjFyMHUEJKYuXcdIgaYYk/17rYIGqeMUps336UESTBJuAo0b/0BCuILSIgIbHxwhNm
	EJtZIE9iz9zzTCC2sICVxNspH9lAbBYBVYlrR5rZQWxeARuJS2eWskDskpdY/EACIiwocXLm
	E7Aws4C6xPp5QiBhfgEtiTVN11kgpstLNG+dzTyBUWAWko5ZCB2zkFQtYGRexSiSWlqcm55b
	bKhXnJhbXJqXrpecn7uJERjg24793LyDcd6rj3qHGJk4GA8xSnAwK4nwWjDdSxHiTUmsrEot
	yo8vKs1JLT7EaAr0wERmKdHkfGCM5ZXEG5oZmBqamFkamFqaGSuJ83oWdCQKCaQnlqRmp6YW
	pBbB9DFxcEo1MDWUPJk5KXaGW2vRnIL/p/9WFosULxdcxT93l77nlUdvlWyPrU+6oByv09Ty
	4sBmsbRl0VvOZ/LEBXeEdJvfOeAbmBSyin2LTEBj8xSDR2Zb7I/27zC8fu6m2YfFldd4vjkK
	Su+yXs2y8r1P1ZKq2mOru85psdzpL3gl0B1+73H9fc2PMxKdviyZ/IBhSTpvftzPvQd5bvK2
	tmuITone/dfek1XgQzKvodItx5zb+1ju/w9/WmnzUiO0c/O+tAdfnrZfOJoRuoFdOHzlwSe/
	2LZUnA/e2aCps3OHzdK6n41XqucrevxSPHvrzsPJhqtu7b3czfrMc72Kauz/CWeYLA7dsjsV
	dPeACkOsT1yfzVElluKMREMt5qLiRABitIQh+QIAAA==
X-CMS-MailID: 20230818130212eucas1p2c38d1890f2eb064b03ccec8271dbc918
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230818130212eucas1p2c38d1890f2eb064b03ccec8271dbc918
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230818130212eucas1p2c38d1890f2eb064b03ccec8271dbc918
References: <CGME20230818130212eucas1p2c38d1890f2eb064b03ccec8271dbc918@eucas1p2.samsung.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <72GyEB-BHzO.A.v-G.1G33kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2631
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230818130140.620790-1-l.stelmach@samsung.com
Resent-Date: Fri, 18 Aug 2023 13:27:17 +0000 (UTC)

Remove the shell template stage and build man pages directly from
SGML files. Add man-specific variables in configure.ac.

Signed-off-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
 .gitignore                                    |  3 +-
 autogen.sh                                    |  1 -
 configure.ac                                  | 28 ++++++-----
 man/Makefile.am                               |  8 ++--
 man/mans.mk                                   | 48 -------------------
 ...-client.8.in.sgml => nbd-client.8.sgml.in} |  2 +-
 ...-server.1.in.sgml => nbd-server.1.sgml.in} |  6 +--
 ...-server.5.in.sgml => nbd-server.5.sgml.in} | 12 ++---
 ...-trdump.1.in.sgml => nbd-trdump.1.sgml.in} |  2 +-
 ...-trplay.1.in.sgml => nbd-trplay.1.sgml.in} |  2 +-
 man/{nbdtab.5.in.sgml => nbdtab.5.sgml.in}    |  2 +-
 11 files changed, 34 insertions(+), 80 deletions(-)
 delete mode 100644 man/mans.mk
 rename man/{nbd-client.8.in.sgml => nbd-client.8.sgml.in} (99%)
 rename man/{nbd-server.1.in.sgml => nbd-server.1.sgml.in} (98%)
 rename man/{nbd-server.5.in.sgml => nbd-server.5.sgml.in} (99%)
 rename man/{nbd-trdump.1.in.sgml => nbd-trdump.1.sgml.in} (98%)
 rename man/{nbd-trplay.1.in.sgml => nbd-trplay.1.sgml.in} (97%)
 rename man/{nbdtab.5.in.sgml => nbdtab.5.sgml.in} (99%)

diff --git a/.gitignore b/.gitignore
index 994a8fa..048c6fd 100644
--- a/.gitignore
+++ b/.gitignore
@@ -39,8 +39,7 @@ INSTALL
 depcomp
 install-sh
 configure
-man/*.sh
-man/*.sh.in
+man/*.[1-9].sgml
 man/manpage.log
 make-integrityhuge
 nbd-trdump
diff --git a/autogen.sh b/autogen.sh
index a518857..807283a 100755
--- a/autogen.sh
+++ b/autogen.sh
@@ -1,5 +1,4 @@
 #!/bin/sh
 set -ex
-make -C man -f mans.mk nbd-server.1.sh.in nbd-server.5.sh.in nbd-client.8.sh.in nbd-trdump.1.sh.in nbd-trplay.1.sh.in nbdtab.5.sh.in
 make -C systemd -f Makefile.am nbd@.service.sh.in
 exec autoreconf -f -i
diff --git a/configure.ac b/configure.ac
index ed2aaf5..e413fff 100644
--- a/configure.ac
+++ b/configure.ac
@@ -329,14 +329,23 @@ AC_ARG_ENABLE([manpages],
 AM_CONDITIONAL(MANPAGES, test "x$enable_manpages" != "xno")
 AS_IF([test "x$enable_manpages" != "xno"], [
 	AC_SUBST([MAN_CONFIG_FILES],["\
-		man/nbd-client.8.sh \
-		man/nbd-server.5.sh \
-		man/nbd-server.1.sh \
-		man/nbd-trdump.1.sh \
-		man/nbd-trplay.1.sh \
-		man/nbdtab.5.sh \
+		man/nbd-client.8.sgml \
+		man/nbd-server.5.sgml \
+		man/nbd-server.1.sgml \
+		man/nbd-trdump.1.sgml \
+		man/nbd-trplay.1.sgml \
+		man/nbdtab.5.sgml \
 		"])
 	])
+MAN_PREFIX="$prefix"
+test "x$MAN_PREFIX" = "xNONE" && MAN_PREFIX="$ac_default_prefix"
+AC_SUBST([MAN_PREFIX])
+MAN_EXEC_PREFIX=$(eval echo "$exec_prefix")
+test "x$MAN_EXEC_PREFIX" = "xNONE" && MAN_EXEC_PREFIX="$MAN_PREFIX"
+AC_SUBST([MAN_EXEC_PREFIX])
+MAN_SYSCONFDIR=$(eval echo "$sysconfdir")
+test "x$MAN_SYSCONFDIR" = "xNONE/etc" && MAN_SYSCONFDIR="$MAN_PREFIX/etc"
+AC_SUBST([MAN_SYSCONFDIR])
 
 AC_HEADER_SYS_WAIT
 AC_TYPE_OFF_T
@@ -357,12 +366,7 @@ AC_CONFIG_FILES([Makefile
 		 tests/code/Makefile
 		 tests/run/Makefile
 		 tests/parse/Makefile
-                 man/nbd-client.8.sh
-                 man/nbd-server.5.sh
-                 man/nbd-server.1.sh
-                 man/nbd-trdump.1.sh
-                 man/nbd-trplay.1.sh
-                 man/nbdtab.5.sh
+		 $MAN_CONFIG_FILES
 		 systemd/Makefile
 		 systemd/nbd@.service.sh
 		])
diff --git a/man/Makefile.am b/man/Makefile.am
index 1e543ae..737a680 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -1,9 +1,9 @@
 if MANPAGES
 man_MANS = nbd-server.1 nbd-server.5 nbd-client.8 nbd-trdump.1 nbd-trplay.1 nbdtab.5
 CLEANFILES = manpage.links manpage.refs
-DISTCLEANFILES = nbd-server.1 nbd-client.8 nbd-server.5 nbd-trdump.1 nbd-trplay.1 nbdtab.5
-MAINTAINERCLEANFILES = nbd-server.1.sh.in nbd-client.8.sh.in nbd-server.5.sh.in nbd-trdump.1.sh.in nbd-trplay.1.sh.in nbdtab.5.sh.in
-EXTRA_DIST = nbd-server.1.in.sgml nbd-client.8.in.sgml nbd-server.5.in.sgml nbd-trdump.1.in.sgml nbd-trplay.1.in.sgml nbdtab.5.in.sgml nbd-server.1.sh.in nbd-server.5.sh.in nbd-client.8.sh.in nbd-trdump.1.sh.in nbd-trdump.1.sh.in nbdtab.5.sh.in sh.tmpl
+DISTCLEANFILES = nbd-server.1 nbd-server.1.sgml nbd-client.8 nbd-client.8.sgml nbd-server.5 nbd-server.5.sgml nbd-trdump.1 nbd-trdump.1.sgml nbd-trplay.1 nbd-trplay.1.sgml nbdtab.5 nbdtab.5.sgml
+EXTRA_DIST = nbd-server.1.sgml.in nbd-client.8.sgml.in nbd-server.5.sgml.in nbd-trdump.1.sgml.in nbd-trplay.1.sgml.in nbdtab.5.sgml.in
 
-include $(srcdir)/mans.mk
+%: %.sgml
+	docbook2man $<
 endif
diff --git a/man/mans.mk b/man/mans.mk
deleted file mode 100644
index e22c9c1..0000000
--- a/man/mans.mk
+++ /dev/null
@@ -1,48 +0,0 @@
-nbd-server.1: nbd-server.1.sh
-	sh nbd-server.1.sh > nbd-server.1
-nbd-server.5: nbd-server.5.sh
-	sh nbd-server.5.sh > nbd-server.5
-nbd-client.8: nbd-client.8.sh
-	sh nbd-client.8.sh > nbd-client.8
-nbd-trdump.1: nbd-trdump.1.sh
-	sh nbd-trdump.1.sh > nbd-trdump.1
-nbd-trplay.1: nbd-trplay.1.sh
-	sh nbd-trplay.1.sh > nbd-trplay.1
-nbdtab.5: nbdtab.5.sh
-	sh nbdtab.5.sh > nbdtab.5
-nbd-server.1.sh.in: nbd-server.1.in.sgml sh.tmpl
-	LC_ALL=C docbook2man nbd-server.1.in.sgml
-	cat sh.tmpl > nbd-server.1.sh.in
-	cat NBD-SERVER.1 >> nbd-server.1.sh.in
-	echo "EOF" >> nbd-server.1.sh.in
-	rm NBD-SERVER.1
-nbd-client.8.sh.in: nbd-client.8.in.sgml sh.tmpl
-	LC_ALL=C docbook2man nbd-client.8.in.sgml
-	cat sh.tmpl > nbd-client.8.sh.in
-	cat NBD-CLIENT.8 >> nbd-client.8.sh.in
-	echo "EOF" >> nbd-client.8.sh.in
-	rm NBD-CLIENT.8
-nbd-server.5.sh.in: nbd-server.5.in.sgml sh.tmpl
-	LC_ALL=C docbook2man nbd-server.5.in.sgml
-	cat sh.tmpl > nbd-server.5.sh.in
-	cat NBD-SERVER.5 >> nbd-server.5.sh.in
-	echo "EOF" >> nbd-server.5.sh.in
-	rm NBD-SERVER.5
-nbd-trdump.1.sh.in: nbd-trdump.1.in.sgml sh.tmpl
-	LC_ALL=C docbook2man nbd-trdump.1.in.sgml
-	cat sh.tmpl > nbd-trdump.1.sh.in
-	cat NBD-TRDUMP.1 >> nbd-trdump.1.sh.in
-	echo "EOF" >> nbd-trdump.1.sh.in
-	rm NBD-TRDUMP.1
-nbd-trplay.1.sh.in: nbd-trplay.1.in.sgml sh.tmpl
-	LC_ALL=C docbook2man nbd-trplay.1.in.sgml
-	cat sh.tmpl > nbd-trplay.1.sh.in
-	cat NBD-TRPLAY.1 >> nbd-trplay.1.sh.in
-	echo "EOF" >> nbd-trplay.1.sh.in
-	rm NBD-TRPLAY.1
-nbdtab.5.sh.in: nbdtab.5.in.sgml sh.tmpl
-	LC_ALL=C docbook2man nbdtab.5.in.sgml
-	cat sh.tmpl > nbdtab.5.sh.in
-	cat NBDTAB.5 >> nbdtab.5.sh.in
-	echo "EOF" >> nbdtab.5.sh.in
-	rm NBDTAB.5
diff --git a/man/nbd-client.8.in.sgml b/man/nbd-client.8.sgml.in
similarity index 99%
rename from man/nbd-client.8.in.sgml
rename to man/nbd-client.8.sgml.in
index d8106e4..4b15d8c 100644
--- a/man/nbd-client.8.in.sgml
+++ b/man/nbd-client.8.sgml.in
@@ -19,7 +19,7 @@ manpage.1: manpage.sgml
   <!ENTITY dhsection   "<manvolnum>8</manvolnum>">
   <!ENTITY dhemail     "<email>wouter@debian.org</email>">
   <!ENTITY dhusername  "Wouter Verhelst">
-  <!ENTITY dhucpackage "<refentrytitle>NBD-CLIENT</refentrytitle>">
+  <!ENTITY dhucpackage "<refentrytitle>nbd-client</refentrytitle>">
   <!ENTITY dhpackage   "nbd-client">
 
   <!ENTITY debian      "<productname>Debian GNU/Linux</productname>">
diff --git a/man/nbd-server.1.in.sgml b/man/nbd-server.1.sgml.in
similarity index 98%
rename from man/nbd-server.1.in.sgml
rename to man/nbd-server.1.sgml.in
index 612f9a5..bfdd74d 100644
--- a/man/nbd-server.1.in.sgml
+++ b/man/nbd-server.1.sgml.in
@@ -19,7 +19,7 @@ manpage.1: manpage.sgml
   <!ENTITY dhsection   "<manvolnum>1</manvolnum>">
   <!ENTITY dhemail     "<email>wouter@debian.org</email>">
   <!ENTITY dhusername  "Wouter Verhelst">
-  <!ENTITY dhucpackage "<refentrytitle>NBD-SERVER</refentrytitle>">
+  <!ENTITY dhucpackage "<refentrytitle>nbd-server</refentrytitle>">
   <!ENTITY dhpackage   "nbd-server">
 
   <!ENTITY debian      "<productname>Debian GNU/Linux</productname>">
@@ -86,7 +86,7 @@ manpage.1: manpage.sgml
     were a local filesystem.</para>
 
     <para><command>&dhpackage;</command> implements some security
-    through a file called "$sysconfdir/nbd-server/allow" (by default; a
+    through a file called "@MAN_SYSCONFDIR@/nbd-server/allow" (by default; a
     different file can be chosen with the '-l' option or through a
     config file specification). This file must list the IP-addresses or
     network masks of clients that are allowed to connect. If it does not
@@ -204,7 +204,7 @@ manpage.1: manpage.sgml
 	<listitem>
 	  <para>Specify configuration file. The default configuration
 	    file, if this parameter is not specified, is
-	    <filename>$sysconfdir/nbd-server/config</filename>.</para>
+	    <filename>@MAN_SYSCONFDIR@/nbd-server/config</filename>.</para>
 	  <para>Note that the configuration file is always parsed and
 	    the entries in the file used, even if an extra server is
 	    specified on the command line. To disable the configuration
diff --git a/man/nbd-server.5.in.sgml b/man/nbd-server.5.sgml.in
similarity index 99%
rename from man/nbd-server.5.in.sgml
rename to man/nbd-server.5.sgml.in
index 48e2740..581e351 100644
--- a/man/nbd-server.5.in.sgml
+++ b/man/nbd-server.5.sgml.in
@@ -19,8 +19,8 @@ manpage.1: manpage.sgml
   <!ENTITY dhsection   "<manvolnum>5</manvolnum>">
   <!ENTITY dhemail     "<email>wouter@debian.org</email>">
   <!ENTITY dhusername  "Wouter Verhelst">
-  <!ENTITY dhucpackage "<refentrytitle>NBD-SERVER</refentrytitle>">
-  <!ENTITY dhpackage   "$sysconfdir/nbd-server/config">
+  <!ENTITY dhucpackage "<refentrytitle>nbd-server</refentrytitle>">
+  <!ENTITY dhpackage   "@MAN_SYSCONFDIR@/nbd-server/config">
 
   <!ENTITY debian      "<productname>Debian GNU/Linux</productname>">
   <!ENTITY gnu         "<acronym>GNU</acronym>">
@@ -63,7 +63,7 @@ manpage.1: manpage.sgml
     <para>This file allows to configure the nbd-server.</para>
 
     <para>While
-      <filename>$sysconfdir/nbd-server/config</filename> is the default
+      <filename>@MAN_SYSCONFDIR@/nbd-server/config</filename> is the default
       configuration file, this can be varied with the <option>-C</option>
       option to <command>nbd-server</command>(1).
     </para>
@@ -421,7 +421,7 @@ manpage.1: manpage.sgml
 	  <para>Corresponds to the <option>-l</option> option on the
 	    command line. However, note that for the command line, the
 	    default is
-	    <filename>$sysconfdir/nbd-server/allow</filename>.
+	    <filename>@MAN_SYSCONFDIR@/nbd-server/allow</filename>.
 	  </para>
 	</listitem>
       </varlistentry>
@@ -1064,9 +1064,9 @@ manpage.1: manpage.sgml
           group = nbd
       [export]
           exportname = /export/blkdev
-          authfile = $sysconfdir/nbd-server/allow
+          authfile = @MAN_SYSCONFDIR@/nbd-server/allow
     </programlisting>
-    <para>With $sysconfdir/nbd-server/allow containing the following:</para>
+    <para>With @MAN_SYSCONFDIR@/nbd-server/allow containing the following:</para>
     <programlisting>
       127.0.0.1
       192.168.0.0/8
diff --git a/man/nbd-trdump.1.in.sgml b/man/nbd-trdump.1.sgml.in
similarity index 98%
rename from man/nbd-trdump.1.in.sgml
rename to man/nbd-trdump.1.sgml.in
index 75d2dc9..dfc9135 100644
--- a/man/nbd-trdump.1.in.sgml
+++ b/man/nbd-trdump.1.sgml.in
@@ -19,7 +19,7 @@ manpage.1: manpage.sgml
   <!ENTITY dhsection   "<manvolnum>1</manvolnum>">
   <!ENTITY dhemail     "<email>wouter@debian.org</email>">
   <!ENTITY dhusername  "Wouter Verhelst">
-  <!ENTITY dhucpackage "<refentrytitle>NBD-TRDUMP</refentrytitle>">
+  <!ENTITY dhucpackage "<refentrytitle>nbd-trdump</refentrytitle>">
   <!ENTITY dhpackage   "nbd-trdump">
 
   <!ENTITY debian      "<productname>Debian GNU/Linux</productname>">
diff --git a/man/nbd-trplay.1.in.sgml b/man/nbd-trplay.1.sgml.in
similarity index 97%
rename from man/nbd-trplay.1.in.sgml
rename to man/nbd-trplay.1.sgml.in
index f713131..297f3eb 100644
--- a/man/nbd-trplay.1.in.sgml
+++ b/man/nbd-trplay.1.sgml.in
@@ -19,7 +19,7 @@ manpage.1: manpage.sgml
   <!ENTITY dhsection   "<manvolnum>1</manvolnum>">
   <!ENTITY dhemail     "<email>manfred@de.bosch.com</email>">
   <!ENTITY dhusername  "Manfred Spraul">
-  <!ENTITY dhucpackage "<refentrytitle>NBD-TRPLAY</refentrytitle>">
+  <!ENTITY dhucpackage "<refentrytitle>nbd-trplay</refentrytitle>">
   <!ENTITY dhpackage   "nbd-trplay">
 
   <!ENTITY debian      "<productname>Debian GNU/Linux</productname>">
diff --git a/man/nbdtab.5.in.sgml b/man/nbdtab.5.sgml.in
similarity index 99%
rename from man/nbdtab.5.in.sgml
rename to man/nbdtab.5.sgml.in
index 806803c..dde75bb 100644
--- a/man/nbdtab.5.in.sgml
+++ b/man/nbdtab.5.sgml.in
@@ -20,7 +20,7 @@ manpage.1: manpage.sgml
   <!ENTITY dhemail     "<email>wouter@debian.org</email>">
   <!ENTITY dhusername  "Wouter Verhelst">
   <!ENTITY dhucpackage "<refentrytitle>NBDTAB</refentrytitle>">
-  <!ENTITY dhpackage   "$sysconfdir/nbdtab">
+  <!ENTITY dhpackage   "@MAN_SYSCONFDIR@/nbdtab">
 
   <!ENTITY debian      "<productname>Debian GNU/Linux</productname>">
   <!ENTITY gnu         "<acronym>GNU</acronym>">
-- 
2.39.2

