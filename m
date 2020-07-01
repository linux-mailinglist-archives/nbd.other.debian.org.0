Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EE92F210482
	for <lists+nbd@lfdr.de>; Wed,  1 Jul 2020 09:10:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8CC9A202C3; Wed,  1 Jul 2020 07:10:57 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul  1 07:10:57 2020
Old-Return-Path: <josh@joshtriplett.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=4.0 tests=FOURLA,FVGT_m_MULTI_ODD,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DE6822029F
	for <lists-other-nbd@bendel.debian.org>; Wed,  1 Jul 2020 07:10:49 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.561 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VtZmJgDFxNcr for <lists-other-nbd@bendel.debian.org>;
	Wed,  1 Jul 2020 07:10:45 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .joshtriplett. - helo: .relay5-d.mail.gandi. - helo-domain: .gandi.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4C5972025E
	for <nbd@other.debian.org>; Wed,  1 Jul 2020 07:10:44 +0000 (UTC)
X-Originating-IP: 50.39.163.217
Received: from localhost (50-39-163-217.bvtn.or.frontiernet.net [50.39.163.217])
	(Authenticated sender: josh@joshtriplett.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AFDD41C0015
	for <nbd@other.debian.org>; Wed,  1 Jul 2020 07:10:41 +0000 (UTC)
Date: Wed, 1 Jul 2020 00:10:38 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: nbd@other.debian.org
Subject: [PATCH 1/2] Add option to treat device as read-only
Message-ID: <20200701071038.GA301687@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <97grca3FaVJ.A.2KF.BcD_eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/913
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200701071038.GA301687@localhost
Resent-Date: Wed,  1 Jul 2020 07:10:57 +0000 (UTC)

This allows forcing the block device to be read-only even if the server
would allow writes.
---
 man/nbd-client.8.in.sgml | 11 +++++++++++
 nbd-client.c             | 15 +++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/man/nbd-client.8.in.sgml b/man/nbd-client.8.in.sgml
index a294868..cd4dacd 100644
--- a/man/nbd-client.8.in.sgml
+++ b/man/nbd-client.8.in.sgml
@@ -65,6 +65,7 @@ manpage.1: manpage.sgml
       <arg>-nofork</arg>
       <arg>-nonetlink</arg>
       <arg>-systemd-mark</arg>
+      <arg>-readonly</arg>
       <arg>-block-size <replaceable>block size</replaceable></arg>
       <arg>-timeout <replaceable>seconds</replaceable></arg>
       <arg>-name <replaceable>name</replaceable></arg>
@@ -84,6 +85,7 @@ manpage.1: manpage.sgml
       <arg>-nofork</arg>
       <arg>-nonetlink</arg>
       <arg>-systemd-mark</arg>
+      <arg>-readonly</arg>
       <arg>-block-size <replaceable>block size</replaceable></arg>
       <arg>-timeout <replaceable>seconds</replaceable></arg>
       <arg>-name <replaceable>name</replaceable></arg>
@@ -264,6 +266,15 @@ manpage.1: manpage.sgml
 	    server or something similar.</para>
 	</listitem>
       </varlistentry>
+      <varlistentry>
+        <term><option>-readonly</option></term>
+        <term><option>-R</option></term>
+        <listitem>
+          <para>When this option is specified, &dhpackage; will tell the
+            kernel to treat the device as read-only, even if the server
+            would allow writes.</para>
+        </listitem>
+      </varlistentry>
       <varlistentry>
         <term><option>-sdp</option></term>
 	<term><option>-S</option></term>
diff --git a/nbd-client.c b/nbd-client.c
index 9403588..2023962 100644
--- a/nbd-client.c
+++ b/nbd-client.c
@@ -896,9 +896,9 @@ void usage(char* errmsg, ...) {
 		fprintf(stderr, "%s version %s\n", PROG_NAME, PACKAGE_VERSION);
 	}
 #if HAVE_NETLINK
-	fprintf(stderr, "Usage: nbd-client -name|-N name host [port] nbd_device\n\t[-block-size|-b block size] [-timeout|-t timeout] [-swap|-s] [-sdp|-S]\n\t[-persist|-p] [-nofork|-n] [-systemd-mark|-m] [-nonetlink|-L]\n");
+	fprintf(stderr, "Usage: nbd-client -name|-N name host [port] nbd_device\n\t[-block-size|-b block size] [-timeout|-t timeout] [-swap|-s] [-sdp|-S]\n\t[-persist|-p] [-nofork|-n] [-systemd-mark|-m] [-nonetlink|-L]\n\t[-readonly|-R]\n");
 #else
-	fprintf(stderr, "Usage: nbd-client -name|-N name host [port] nbd_device\n\t[-block-size|-b block size] [-timeout|-t timeout] [-swap|-s] [-sdp|-S]\n\t[-persist|-p] [-nofork|-n] [-systemd-mark|-m]\n");
+	fprintf(stderr, "Usage: nbd-client -name|-N name host [port] nbd_device\n\t[-block-size|-b block size] [-timeout|-t timeout] [-swap|-s] [-sdp|-S]\n\t[-persist|-p] [-nofork|-n] [-systemd-mark|-m]\n\t[-readonly|-R]\n");
 #endif
 	fprintf(stderr, "Or   : nbd-client -u (with same arguments as above)\n");
 	fprintf(stderr, "Or   : nbd-client nbdX\n");
@@ -934,9 +934,9 @@ void disconnect(char* device) {
 }
 
 #if HAVE_NETLINK
-static const char *short_opts = "-A:b:c:C:d:gH:hK:LlnN:pSst:uVx";
+static const char *short_opts = "-A:b:c:C:d:gH:hK:LlnN:pRSst:uVx";
 #else
-static const char *short_opts = "-A:b:c:C:d:gH:hK:lnN:pSst:uVx";
+static const char *short_opts = "-A:b:c:C:d:gH:hK:lnN:pRSst:uVx";
 #endif
 
 int main(int argc, char *argv[]) {
@@ -953,6 +953,7 @@ int main(int argc, char *argv[]) {
 	pid_t main_pid;
 	u64 size64;
 	uint16_t flags = 0;
+	bool force_read_only = false;
 	int c;
 	int nonspecial=0;
 	int b_unix=0;
@@ -990,6 +991,7 @@ int main(int argc, char *argv[]) {
 		{ "nofork", no_argument, NULL, 'n' },
 		{ "name", required_argument, NULL, 'N' },
 		{ "persist", no_argument, NULL, 'p' },
+		{ "readonly", no_argument, NULL, 'R' },
 		{ "sdp", no_argument, NULL, 'S' },
 		{ "swap", no_argument, NULL, 's' },
 		{ "timeout", required_argument, NULL, 't' },
@@ -1095,6 +1097,9 @@ int main(int argc, char *argv[]) {
 		case 'p':
 			cont=1;
 			break;
+		case 'R':
+			force_read_only = true;
+			break;
 		case 's':
 			swap=1;
 			break;
@@ -1207,6 +1212,8 @@ int main(int argc, char *argv[]) {
 			exit(EXIT_FAILURE);
 
 		negotiate(&sock, &size64, &flags, name, needed_flags, cflags, opts, certfile, keyfile, cacertfile, tlshostname, tls, can_opt_go);
+		if (force_read_only)
+			flags |= NBD_FLAG_READ_ONLY;
 		if (netlink) {
 			sockfds[i] = sock;
 			continue;
-- 
2.27.0

