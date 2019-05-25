Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5142A5B3
	for <lists+nbd@lfdr.de>; Sat, 25 May 2019 19:05:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1C2DF207FF; Sat, 25 May 2019 17:05:38 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 25 17:05:38 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C12F7207FA
	for <lists-other-nbd@bendel.debian.org>; Sat, 25 May 2019 17:05:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id FhasLmMCWU-x for <lists-other-nbd@bendel.debian.org>;
	Sat, 25 May 2019 17:05:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3A999207F7
	for <nbd@other.debian.org>; Sat, 25 May 2019 17:05:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 62A68308A9BE;
	Sat, 25 May 2019 17:05:22 +0000 (UTC)
Received: from foo.home.annexia.org (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFD966013D;
	Sat, 25 May 2019 17:05:20 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: nbd@other.debian.org
Cc: w@uter.be,
	eblake@redhat.com,
	nsoffer@redhat.com,
	berrange@redhat.com,
	mkletzan@redhat.com
Subject: [PATCH for discussion] doc: Define a standard URI syntax for NBD URIs.
Date: Sat, 25 May 2019 18:05:18 +0100
Message-Id: <20190525170518.4799-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Sat, 25 May 2019 17:05:22 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3WeItpZZ08I.A.i_B.iXX6cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/520
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190525170518.4799-1-rjones@redhat.com
Resent-Date: Sat, 25 May 2019 17:05:38 +0000 (UTC)

For further information about discussion around this standard, see
this thread on the mailing list:
https://lists.debian.org/nbd/2019/05/msg00013.html

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 doc/Makefile.am |   2 +-
 doc/uri.md      | 124 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/doc/Makefile.am b/doc/Makefile.am
index 7f0284c..fa8a4b0 100644
--- a/doc/Makefile.am
+++ b/doc/Makefile.am
@@ -1 +1 @@
-EXTRA_DIST = README proto.md todo.txt
+EXTRA_DIST = README proto.md todo.txt uri.md
diff --git a/doc/uri.md b/doc/uri.md
new file mode 100644
index 0000000..143954c
--- /dev/null
+++ b/doc/uri.md
@@ -0,0 +1,124 @@
+# The NBD Uniform Resource Indicator (URI) format
+
+## Introduction
+
+This document describes the standard URI format that clients may use
+to refer to an export located on an NBD server.
+
+## Convention
+
+"NBD" stands for Network Block Device and refers to the protocol
+described in the adjacent protocol document also available online at
+<https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#the-nbd-protocol>
+
+"URI" stands for Uniform Resource Indicator and refers to the standard
+introduced in [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt) and
+subsequent IETF standards.
+
+The key words "MUST", "MUST NOT", "REQUIRED", "SHALL",
+"SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED",
+"MAY", and "OPTIONAL" in this document are to be interpreted as
+described in [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).
+The same words in lower case carry their natural meaning.
+
+## Related standards
+
+All NBD URIs MUST also be valid URIs as described in
+[RFC 3986](https://www.ietf.org/rfc/rfc3986.txt) and any subsequent
+IETF standards describing URIs.  This means that any parsing, quoting
+or encoding issues that may arise when making or parsing an NBD URI
+must be answered by consulting IETF standards.
+
+## NBD URI components
+
+An NBD URI consists of the following components:
+
+     +------- Scheme (required)
+     |
+     |            +------- Authority (optional)
+     |            |
+     |            |           +------- Export name (optional)
+     |            |           |
+     v            v           v
+    nbd://example.com:10809/export
+    
+    nbd+unix:///export?socket=nbd.sock
+                           ^
+                           |
+                           +---- Query parameters
+
+## NBD URI scheme
+
+One of the following scheme names SHOULD be used to indicate an NBD URI:
+
+* `nbd`: NBD over an unencrypted or opportunistically encrypted TCP/IP
+  connection.
+
+* `nbds`: NBD over an encrypted TCP/IP connection.  If encryption
+  cannot be negotiated then the connection MUST fail.
+
+* `nbd+unix`: NBD over a Unix domain socket.  The query parameters
+  MUST include a parameter called `socket` which refers to the name of
+  the Unix domain socket.
+
+Other URI scheme names MAY be used but not all NBD clients will
+understand them or even recognize that they refer to NBD.
+
+## NBD URI authority
+
+The authority field SHOULD be used for TCP/IP connections and SHOULD
+NOT be used for Unix domain socket connections.
+
+The authority field MAY contain the `userinfo`, `host` and/or `port`
+fields as defined in [RFC 3986](https://www.ietf.org/rfc/rfc3986.txt)
+section 3.2.
+
+The `host` field may be a host name or IP address.  Literal IPv6
+addresses MUST be formatted in the way specified by
+[RFC 2732](https://www.ietf.org/rfc/rfc2732.txt).
+
+If the `port` field is not present then it MUST default to the NBD
+port number assigned by IANA (10809).
+
+The `userinfo` field is used to supply a username for TLS
+authentication.  If the `userinfo` field is not present then it SHOULD
+default to a local operating system credential if one is available.
+
+It is up to the NBD client what should happen if the authority field
+is not present for TCP/IP connections, or present for Unix domain
+socket connections.  Options might include failing with an error,
+ignoring it, or using defaults.
+
+## NBD URI export name
+
+The path part of the URI except for the leading `/` character MAY be
+passed to the server as the export name.
+
+For example:
+
+    NBD URI                          export name
+    ----------------------------------------------------
+    nbd://example.com/disk           disk
+    nbd+unix:///disk                 disk
+    nbd://example.com/               (empty string)
+    nbd://example.com                (empty string)
+    nbd://example.com//disk          /disk
+    nbd://example.com/hello%20world  hello world
+
+Note that export names are not usually paths, they are free text
+strings.  In particular they do not usually start with a `/`
+character, they may be an empty string, and they may contain any
+Unicode character.
+
+NBD servers MAY restrict the export names they are able to parse (for
+example by only accepting 7 bit ASCII names).  The reader should refer
+to the NBD protocol.
+
+## NBD URI query parameters
+
+The query part of the URI is used when connecting to Unix domain
+sockets (when the scheme name is `nbd+unix`).  In this case it MUST
+include a `socket` key, referring to the Unix domain socket which on
+Unix-like systems is usually a special file on the local disk.
+
+Query parameters other than `socket` SHOULD be ignored by the parser.
-- 
2.21.0

