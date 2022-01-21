Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B970F4964A7
	for <lists+nbd@lfdr.de>; Fri, 21 Jan 2022 18:58:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9F0F0204EB; Fri, 21 Jan 2022 17:58:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 21 17:58:06 2022
Old-Return-Path: <manfred@colorfullife.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,GENDER,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2466720518
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Jan 2022 17:57:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.38 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, GENDER=0.5, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id F8IavFFYSk8r for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Jan 2022 17:57:33 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0D51F20508
	for <nbd@other.debian.org>; Fri, 21 Jan 2022 17:57:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s4so176215wrb.0
        for <nbd@other.debian.org>; Fri, 21 Jan 2022 09:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorfullife-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mNHuL48Vk6wYnrwy8zygBw5ylxywCYMTHCbl6hi+tHI=;
        b=SDt7l3CVPjh+elURzwsM2SlDCCayN6Ctq7hOaVAHfDKMPVGDLXvX5jgnQ8il4PHW0n
         O0ABo/1T1O6L6cB8qTfRQivP18wPLOaIz8lUWeYKo/CNKW2Xq9S3k6uXMipVtYHiTT0a
         uUfrcfwUf0M/zOZqe7Vt70Jz47paBXQJEekEIX6LPSm3T7Eotnd1JlxcR+TT6XXIn1dN
         H+UOMkCgVliafff2GnFzffDLqsKeiHycW9241A4TD6opueN/lhPrfNT3lJ5F2V4Tf6l9
         EvOLdA2gcRVYnExXiW0SoM9XhrEHSzq+slNS+qlP/L8XTVgNKmzc7v+yF9H4scVyxs4f
         BmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mNHuL48Vk6wYnrwy8zygBw5ylxywCYMTHCbl6hi+tHI=;
        b=QwtfYfEo6pEFh65XS2a3bMSljBLCNPCWYVbLb1wM72LXJULV3qqVi9sWwxorFd+OZl
         hosYQ1SMYP9snlUQorv1qU0XBsaKbZ4llqGa23xkTdwJ1fk5KMi41vinT0DTWMxi2gcD
         uwqXgChkyVhFiMXk5OipvjgX1rsbV5Og7l6AGp5BORT5DLKqWylDttSzfIYD6AzZF/Zm
         /jGPX3RBc8glYlHxMkcZOGdo4wqYPhfblqR0HRYFnRGntxQWMrsPMITYTqz7UjZ0yONb
         8vdP7fg3+rP5uxQWiBHzXPAFyDIzb4bArwVMnB634Ldfzk/J4S1TVX6YmOX/pXJsH7HS
         ammA==
X-Gm-Message-State: AOAM531xn5F9wLeeUC/adCvwhAuS6UGNggmICOq3VuSd1mJfwW9qakhv
	QXpojf9X02FgBKtp7t3doi7+l9fI0cIsMYpw
X-Google-Smtp-Source: ABdhPJwOPtTeqq7KFoXbB84NqSc4yG74Gvjvdc7g86sHkV1ZOgKKKYmhuG5+Bc2cNT71zOypaCrJpg==
X-Received: by 2002:a5d:68c6:: with SMTP id p6mr4731354wrw.701.1642787850319;
        Fri, 21 Jan 2022 09:57:30 -0800 (PST)
Received: from localhost.localdomain (p200300d997063800e3418724bb165e30.dip0.t-ipconnect.de. [2003:d9:9706:3800:e341:8724:bb16:5e30])
        by smtp.googlemail.com with ESMTPSA id g4sm7166329wrd.12.2022.01.21.09.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 09:57:30 -0800 (PST)
From: Manfred Spraul <manfred@colorfullife.com>
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>,
	Eric Blake <eblake@redhat.com>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: [PATCH 9/9] Initial man page for nbd-trplay.
Date: Fri, 21 Jan 2022 18:57:11 +0100
Message-Id: <20220121175711.5083-10-manfred@colorfullife.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121175711.5083-1-manfred@colorfullife.com>
References: <20220121175711.5083-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UDQ9uKo8crM.A.MpC.uQv6hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1699
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220121175711.5083-10-manfred@colorfullife.com
Resent-Date: Fri, 21 Jan 2022 17:58:06 +0000 (UTC)

From: Manfred Spraul <manfred.spraul@de.bosch.com>

Just as a starting point, especially:
The command line parameters must be added to the man page.

Questions:
- Did I update the right files?
- Is the .in.sgml file written manually or are there tools that
  should be used?

Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
---
 autogen.sh               |  2 +-
 configure.ac             |  2 +
 man/Makefile.am          |  8 ++--
 man/mans.mk              |  8 ++++
 man/nbd-trplay.1.in.sgml | 99 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 114 insertions(+), 5 deletions(-)
 create mode 100644 man/nbd-trplay.1.in.sgml

diff --git a/autogen.sh b/autogen.sh
index 49e5a27..a518857 100755
--- a/autogen.sh
+++ b/autogen.sh
@@ -1,5 +1,5 @@
 #!/bin/sh
 set -ex
-make -C man -f mans.mk nbd-server.1.sh.in nbd-server.5.sh.in nbd-client.8.sh.in nbd-trdump.1.sh.in nbdtab.5.sh.in
+make -C man -f mans.mk nbd-server.1.sh.in nbd-server.5.sh.in nbd-client.8.sh.in nbd-trdump.1.sh.in nbd-trplay.1.sh.in nbdtab.5.sh.in
 make -C systemd -f Makefile.am nbd@.service.sh.in
 exec autoreconf -f -i
diff --git a/configure.ac b/configure.ac
index 0c960b4..8f58fb6 100644
--- a/configure.ac
+++ b/configure.ac
@@ -354,6 +354,7 @@ AS_IF([test "x$enable_manpages" != "xno"], [
 		man/nbd-server.5.sh \
 		man/nbd-server.1.sh \
 		man/nbd-trdump.1.sh \
+		man/nbd-trplay.1.sh \
 		man/nbdtab.5.sh \
 		"])
 	])
@@ -381,6 +382,7 @@ AC_CONFIG_FILES([Makefile
                  man/nbd-server.5.sh
                  man/nbd-server.1.sh
                  man/nbd-trdump.1.sh
+                 man/nbd-trplay.1.sh
                  man/nbdtab.5.sh
 		 systemd/Makefile
 		 systemd/nbd@.service.sh
diff --git a/man/Makefile.am b/man/Makefile.am
index c800bd1..1e543ae 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -1,9 +1,9 @@
 if MANPAGES
-man_MANS = nbd-server.1 nbd-server.5 nbd-client.8 nbd-trdump.1 nbdtab.5
+man_MANS = nbd-server.1 nbd-server.5 nbd-client.8 nbd-trdump.1 nbd-trplay.1 nbdtab.5
 CLEANFILES = manpage.links manpage.refs
-DISTCLEANFILES = nbd-server.1 nbd-client.8 nbd-server.5 nbd-trdump.1 nbdtab.5
-MAINTAINERCLEANFILES = nbd-server.1.sh.in nbd-client.8.sh.in nbd-server.5.sh.in nbd-trdump.1.sh.in nbdtab.5.sh.in
-EXTRA_DIST = nbd-server.1.in.sgml nbd-client.8.in.sgml nbd-server.5.in.sgml nbd-trdump.1.in.sgml nbdtab.5.in.sgml nbd-server.1.sh.in nbd-server.5.sh.in nbd-client.8.sh.in nbd-trdump.1.sh.in nbdtab.5.sh.in sh.tmpl
+DISTCLEANFILES = nbd-server.1 nbd-client.8 nbd-server.5 nbd-trdump.1 nbd-trplay.1 nbdtab.5
+MAINTAINERCLEANFILES = nbd-server.1.sh.in nbd-client.8.sh.in nbd-server.5.sh.in nbd-trdump.1.sh.in nbd-trplay.1.sh.in nbdtab.5.sh.in
+EXTRA_DIST = nbd-server.1.in.sgml nbd-client.8.in.sgml nbd-server.5.in.sgml nbd-trdump.1.in.sgml nbd-trplay.1.in.sgml nbdtab.5.in.sgml nbd-server.1.sh.in nbd-server.5.sh.in nbd-client.8.sh.in nbd-trdump.1.sh.in nbd-trdump.1.sh.in nbdtab.5.sh.in sh.tmpl
 
 include $(srcdir)/mans.mk
 endif
diff --git a/man/mans.mk b/man/mans.mk
index fdfc266..e22c9c1 100644
--- a/man/mans.mk
+++ b/man/mans.mk
@@ -6,6 +6,8 @@ nbd-client.8: nbd-client.8.sh
 	sh nbd-client.8.sh > nbd-client.8
 nbd-trdump.1: nbd-trdump.1.sh
 	sh nbd-trdump.1.sh > nbd-trdump.1
+nbd-trplay.1: nbd-trplay.1.sh
+	sh nbd-trplay.1.sh > nbd-trplay.1
 nbdtab.5: nbdtab.5.sh
 	sh nbdtab.5.sh > nbdtab.5
 nbd-server.1.sh.in: nbd-server.1.in.sgml sh.tmpl
@@ -32,6 +34,12 @@ nbd-trdump.1.sh.in: nbd-trdump.1.in.sgml sh.tmpl
 	cat NBD-TRDUMP.1 >> nbd-trdump.1.sh.in
 	echo "EOF" >> nbd-trdump.1.sh.in
 	rm NBD-TRDUMP.1
+nbd-trplay.1.sh.in: nbd-trplay.1.in.sgml sh.tmpl
+	LC_ALL=C docbook2man nbd-trplay.1.in.sgml
+	cat sh.tmpl > nbd-trplay.1.sh.in
+	cat NBD-TRPLAY.1 >> nbd-trplay.1.sh.in
+	echo "EOF" >> nbd-trplay.1.sh.in
+	rm NBD-TRPLAY.1
 nbdtab.5.sh.in: nbdtab.5.in.sgml sh.tmpl
 	LC_ALL=C docbook2man nbdtab.5.in.sgml
 	cat sh.tmpl > nbdtab.5.sh.in
diff --git a/man/nbd-trplay.1.in.sgml b/man/nbd-trplay.1.in.sgml
new file mode 100644
index 0000000..f713131
--- /dev/null
+++ b/man/nbd-trplay.1.in.sgml
@@ -0,0 +1,99 @@
+<!doctype refentry PUBLIC "-//OASIS//DTD DocBook V4.5//EN" [
+
+<!-- Process this file with docbook-to-man to generate an nroff manual
+     page: `docbook-to-man manpage.sgml > manpage.1'.  You may view
+     the manual page with: `docbook-to-man manpage.sgml | nroff -man |
+     less'.  A typical entry in a Makefile or Makefile.am is:
+
+manpage.1: manpage.sgml
+	docbook-to-man $< > $@
+  -->
+
+  <!-- Fill in your name for FIRSTNAME and SURNAME. -->
+  <!ENTITY dhfirstname "<firstname>Manfred</firstname>">
+  <!ENTITY dhsurname   "<surname>Spraul</surname>">
+  <!-- Please adjust the date whenever revising the manpage. -->
+  <!ENTITY dhdate      "<date>$Date$</date>">
+  <!-- SECTION should be 1-8, maybe w/ subsection other parameters are
+       allowed: see man(7), man(1). -->
+  <!ENTITY dhsection   "<manvolnum>1</manvolnum>">
+  <!ENTITY dhemail     "<email>manfred@de.bosch.com</email>">
+  <!ENTITY dhusername  "Manfred Spraul">
+  <!ENTITY dhucpackage "<refentrytitle>NBD-TRPLAY</refentrytitle>">
+  <!ENTITY dhpackage   "nbd-trplay">
+
+  <!ENTITY debian      "<productname>Debian GNU/Linux</productname>">
+  <!ENTITY gnu         "<acronym>GNU</acronym>">
+]>
+
+<refentry>
+  <refentryinfo>
+    <address>
+      &dhemail;
+    </address>
+    <author>
+      &dhfirstname;
+      &dhsurname;
+    </author>
+    <copyright>
+      <year>2001</year>
+      <holder>&dhusername;</holder>
+    </copyright>
+    &dhdate;
+  </refentryinfo>
+  <refmeta>
+    &dhucpackage;
+
+    &dhsection;
+  </refmeta>
+  <refnamediv>
+    <refname>&dhpackage;</refname>
+
+    <refpurpose>replay all or parts of an nbd transaction log</refpurpose>
+  </refnamediv>
+  <refsynopsisdiv>
+    <cmdsynopsis>
+      <command>&dhpackage;</command>
+    </cmdsynopsis>
+  </refsynopsisdiv>
+  <refsect1>
+    <title>DESCRIPTION</title>
+
+    <para><command>&dhpackage;</command> replays all or parts of
+    a transaction log produced by <command>nbd-server</command>
+    (specifically by the <command>transactionlog</command>
+    configuration directive with the option <command>datalog
+    </command>).</para>
+
+    <para>See nbd-trplay --help for the command line parameters.
+    </para>
+  </refsect1>
+  <refsect1>
+    <title>OUTPUT</title>
+
+    <para>The file updates the image provided via -i.</para>
+
+  </refsect1>
+  <refsect1>
+    <title>SEE ALSO</title>
+
+    <para>nbd-server (1).</para>
+
+  </refsect1>
+  <refsect1>
+    <title>AUTHOR</title>
+    <para>The NBD kernel module and the NBD tools have been written by
+    Pavel Macheck (pavel@ucw.cz).</para>
+
+    <para>The kernel module is now maintained by Paul Clements
+    (Paul.Clements@steeleye.com), while the userland tools are maintained by
+    Wouter Verhelst (wouter@debian.org)</para>
+
+    <para>This manual page was written by &dhusername; (&dhemail;) for
+    the &debian; system (but may be used by others).  Permission is
+    granted to copy, distribute and/or modify this document under the
+    terms of the <acronym>GNU</acronym> General Public License,
+    version 2, as published by the Free Software Foundation.</para>
+
+  </refsect1>
+</refentry>
-- 
2.34.1

