Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ECF3CA72
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2019 13:54:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C9A56203BF; Tue, 11 Jun 2019 11:54:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 11:54:02 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8002F20382
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2019 11:53:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id g6cHpOzmx_q9 for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2019 11:53:51 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B26C8203BF
	for <nbd@other.debian.org>; Tue, 11 Jun 2019 11:53:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D32DEC18B2DF;
	Tue, 11 Jun 2019 11:53:38 +0000 (UTC)
Received: from foo.home.annexia.org (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A9BE5D721;
	Tue, 11 Jun 2019 11:53:37 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: nbd@other.debian.org
Cc: w@uter.be,
	eblake@redhat.com,
	berrange@redhat.com,
	mkletzan@redhat.com
Subject: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
Date: Tue, 11 Jun 2019 12:53:30 +0100
Message-Id: <20190611115330.6842-2-rjones@redhat.com>
In-Reply-To: <20190611115330.6842-1-rjones@redhat.com>
References: <20190611115330.6842-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 11 Jun 2019 11:53:38 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <IjhP-gnt1lE.A.0cD.aZ5_cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/569
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190611115330.6842-2-rjones@redhat.com
Resent-Date: Tue, 11 Jun 2019 11:54:02 +0000 (UTC)

For further information about discussion around this standard, see
this thread on the mailing list:
https://lists.debian.org/nbd/2019/05/msg00013.html

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 doc/Makefile.am |   2 +-
 doc/uri.md      | 171 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/doc/Makefile.am b/doc/Makefile.am
index 7f0284c..fa8a4b0 100644
--- a/doc/Makefile.am
+++ b/doc/Makefile.am
@@ -1 +1 @@
-EXTRA_DIST = README proto.md todo.txt
+EXTRA_DIST = README proto.md todo.txt uri.md
diff --git a/doc/uri.md b/doc/uri.md
new file mode 100644
index 0000000..e06cec5
--- /dev/null
+++ b/doc/uri.md
@@ -0,0 +1,171 @@
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
+This standard defers any question about how the NBD protocol works to
+the NBD protocol document available online at
+<https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#the-nbd-protocol>
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
+* `nbd`: NBD over an unencrypted or opportunistically TLS encrypted
+  TCP/IP connection.
+
+* `nbds`: NBD over a TLS encrypted TCP/IP connection.  If encryption
+  cannot be negotiated then the connection MUST fail.
+
+* `nbd+unix`: NBD over a Unix domain socket.  The query parameters
+  MUST include a parameter called `socket` which refers to the name of
+  the Unix domain socket.
+
+* `nbds+unix`: NBD over a TLS encrypted Unix domain socket.  If
+  encryption cannot be negotiated then the connection MUST fail.  The
+  query parameters MUST include a parameter called `socket` which
+  refers to the name of the Unix domain socket.
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
+The `userinfo` field is used to supply a username for certain less
+common sorts of TLS authentication.  If the `userinfo` field is not
+present but is needed by the client for TLS authentication then it
+SHOULD default to a local operating system credential if one is
+available.
+
+It is up to the NBD client what should happen if the authority field
+is not present for TCP/IP connections, or present for Unix domain
+socket connections.  Options might include failing with an error,
+ignoring it, or using defaults.
+
+## NBD URI export name
+
+If the version of the NBD protocol in use needs an export name, then
+the path part of the URI except for the leading `/` character MUST be
+passed to the server as the export name.
+
+For example:
+
+    NBD URI                          Export name
+    ----------------------------------------------------
+    nbd://example.com/disk           disk
+    nbd+unix:///disk?socket=sock     disk
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
+## NBD URI socket parameter
+
+If the scheme name indicates a Unix domain socket then the query
+parameters MUST include a `socket` key, referring to the Unix domain
+socket which on Unix-like systems is usually a special file on the
+local disk.
+
+On platforms which support Unix domain sockets in the abstract
+namespace, and if the client supports this, the `socket` parameter MAY
+begin with an ASCII NUL character.  When the URI is properly encoded
+it will look like this:
+
+    nbd+unix:///?socket=%00/abstract
+
+## NBD URI query parameters related to TLS
+
+If TLS encryption is to be negotiated then the following query
+parameters MAY be present:
+
+* `tls-type`: Possible values include `anon`, `x509` or `psk`.  This
+  specifies the desired TLS authentication method.
+
+* `tls-hostname`: The optional TLS hostname to use for certificate
+  verification.  This can be used when connecting over a Unix domain
+  socket since there is no hostname available in the URI authority
+  field; or when DNS does not properly resolve the server's hostname.
+
+* `tls-verify-peer`: This optional parameter may be `0` or `1` to
+  control whether the client verifies the server's identity.  By
+  default clients SHOULD verify the server's identity if TLS is
+  negotiated and if a suitable Certificate Authorty is available.
+
+## Other NBD URI query parameters
+
+Clients SHOULD prefix experimental query parameters using `x-`.  This
+SHOULD NOT be used for query parameters which are expected to be
+widely used.
+
+Any other query parameters which the client does not understand SHOULD
+be ignored by the parser.
+
+## Clients which do not support TLS
+
+Wherever this document refers to encryption, authentication and TLS,
+clients which do not support TLS SHOULD give an error when
+encountering an NBD URI that requires TLS (such as one with a scheme
+name `nbds` or `nbds+unix`).
-- 
2.22.0

