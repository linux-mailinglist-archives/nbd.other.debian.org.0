Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 698213F8F42
	for <lists+nbd@lfdr.de>; Thu, 26 Aug 2021 21:54:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 246BA20B37; Thu, 26 Aug 2021 19:54:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 26 19:54:13 2021
Old-Return-Path: <mcgrof@infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD,GMAIL,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CB954209A1
	for <lists-other-nbd@bendel.debian.org>; Thu, 26 Aug 2021 19:37:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.01 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, GMAIL=1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id j1-Y2kjr17xZ for <lists-other-nbd@bendel.debian.org>;
	Thu, 26 Aug 2021 19:37:34 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 635CF20AB6
	for <nbd@other.debian.org>; Thu, 26 Aug 2021 19:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WyP3I9xaRur9Avqkv55WvPFcBK8AIZK47cfJCqNjJUg=; b=g9TAtEwO2Xlsk3gpeJpf2lIy8+
	jdvb4MwmrtwbgGrY92SX4S5A8hMm7W+N1CC7O8nsdeRMG/L2ERF0YeTID2ajPp7XCq1IHMQOquFIC
	n9LFVzCYZ6ILnECRqm66yH9dV39PPqXyeonZL5+P1IVmltg+mqdcdSe0jWBtRE2EYOp88FOHyBqjg
	7ZrgiH6q+VC0/q8fzGkC8bGmGyEgZodHWEj612Idj08Qi+nygzUrJfdNTOdZCjhjMRdrWBaB3KMUg
	VYauoq73KFGngVHITVd68QDhKZvoJ0BpuQe7s22RW8MHYKv0baYb3nCyJigJFgyXSZt6BVbwKDPVR
	RzP8f4mw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJLBo-00AotK-Ez; Thu, 26 Aug 2021 19:37:28 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: nbd@other.debian.org,
	mcgrof@kernel.org
Subject: [PATCH] configure.ac: fix complaint by automake of missing AC_PROG_YACC
Date: Thu, 26 Aug 2021 12:37:27 -0700
Message-Id: <20210826193727.2578866-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uc8vnlq7iMD.A.DHG.lF_JhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1341
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210826193727.2578866-1-mcgrof@kernel.org
Resent-Date: Thu, 26 Aug 2021 19:54:13 +0000 (UTC)

If automake sees you have a Yacc source but YACC is undefined
it will complain.

Makefile.am: error: Yacc source seen but 'YACC' is undefined
Makefile.am:   The usual way to define 'YACC' is to add 'AC_PROG_YACC'
Makefile.am:   to 'configure.ac' and run 'autoconf' again.
autoreconf: automake failed with exit status:

The recommended way to resolve this is to use AC_PROG_YACC on configure.ac,
but that is only if we care for yacc. Since we clearly are not fans of
it and seem to prefer bison, add the missing m4 helper which defines
AX_PROG_BISON().

I've taken this from the mesa project [0].

[0] https://gitlab.collabora.com/spurv/mesa/-/blob/collabora_master/m4/ax_prog_bison.m4

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 configure.ac        |  1 +
 m4/ax_prog_bison.m4 | 71 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 m4/ax_prog_bison.m4

diff --git a/configure.ac b/configure.ac
index c71e7c7..f4d5461 100644
--- a/configure.ac
+++ b/configure.ac
@@ -15,6 +15,7 @@ AM_INIT_AUTOMAKE(foreign dist-xz serial_tests subdir-objects)
 AM_MAINTAINER_MODE([enable])
 AM_SILENT_RULES([yes])
 AC_CONFIG_MACRO_DIR([support])
+m4_include([m4/ax_prog_bison.m4])
 LT_INIT
 
 AC_ARG_ENABLE(
diff --git a/m4/ax_prog_bison.m4 b/m4/ax_prog_bison.m4
new file mode 100644
index 0000000..dae4470
--- /dev/null
+++ b/m4/ax_prog_bison.m4
@@ -0,0 +1,71 @@
+# ===========================================================================
+#       http://www.gnu.org/software/autoconf-archive/ax_prog_bison.html
+# ===========================================================================
+#
+# SYNOPSIS
+#
+#   AX_PROG_BISON(ACTION-IF-TRUE,ACTION-IF-FALSE)
+#
+# DESCRIPTION
+#
+#   Check whether bison is the parser generator. Run ACTION-IF-TRUE if
+#   successful, ACTION-IF-FALSE otherwise
+#
+# LICENSE
+#
+#   Copyright (c) 2009 Francesco Salvestrini <salvestrini@users.sourceforge.net>
+#   Copyright (c) 2010 Diego Elio Petteno` <flameeyes@gmail.com>
+#
+#   This program is free software; you can redistribute it and/or modify it
+#   under the terms of the GNU General Public License as published by the
+#   Free Software Foundation; either version 2 of the License, or (at your
+#   option) any later version.
+#
+#   This program is distributed in the hope that it will be useful, but
+#   WITHOUT ANY WARRANTY; without even the implied warranty of
+#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
+#   Public License for more details.
+#
+#   You should have received a copy of the GNU General Public License along
+#   with this program. If not, see <http://www.gnu.org/licenses/>.
+#
+#   As a special exception, the respective Autoconf Macro's copyright owner
+#   gives unlimited permission to copy, distribute and modify the configure
+#   scripts that are the output of Autoconf when processing the Macro. You
+#   need not follow the terms of the GNU General Public License when using
+#   or distributing such scripts, even though portions of the text of the
+#   Macro appear in them. The GNU General Public License (GPL) does govern
+#   all other use of the material that constitutes the Autoconf Macro.
+#
+#   This special exception to the GPL applies to versions of the Autoconf
+#   Macro released by the Autoconf Archive. When you make and distribute a
+#   modified version of the Autoconf Macro, you may extend this special
+#   exception to the GPL to apply to your modified version as well.
+
+#serial 9
+
+# mattst88:
+#     Modified YACC assignment to remove -o y.tab.c since we're writing
+#     our own .y/.yy rules.
+#
+#     Replaced m4_ifnblank(...) with m4_ifval(m4_normalize(...), ...)
+#     since m4_ifnblank requires autoconf-2.64.
+
+AC_DEFUN([AX_PROG_BISON], [
+  AC_REQUIRE([AC_PROG_YACC])
+  AC_REQUIRE([AC_PROG_EGREP])
+
+  AC_CACHE_CHECK([if bison is the parser generator],[ax_cv_prog_bison],[
+    AS_IF([$YACC --version 2>/dev/null | $EGREP -q '^bison '],
+      [ax_cv_prog_bison=yes], [ax_cv_prog_bison=no])
+  ])
+  AS_IF([test "$ax_cv_prog_bison" = "yes"], [
+      dnl replace the yacc-compatible compiler with the real bison, as
+      dnl otherwise autoconf limits us to the POSIX yacc.
+      dnl We also change the generated filename to the old one, so that
+      dnl automake's ylwrap can deal with it.
+      YACC="${YACC% -y}"
+    ] m4_ifval(m4_normalize([$1]), [[$1]]),
+    m4_ifval(m4_normalize([$2]), [[$2]])
+  )
+])
-- 
2.30.2

