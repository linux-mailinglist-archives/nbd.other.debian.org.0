Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D66A210483
	for <lists+nbd@lfdr.de>; Wed,  1 Jul 2020 09:11:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E4F422029F; Wed,  1 Jul 2020 07:11:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jul  1 07:11:10 2020
Old-Return-Path: <josh@joshtriplett.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=4.0 tests=FOURLA,FVGT_m_MULTI_ODD,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6CD6C2025E
	for <lists-other-nbd@bendel.debian.org>; Wed,  1 Jul 2020 07:11:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.558 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id w1iL_Oh3UoGA for <lists-other-nbd@bendel.debian.org>;
	Wed,  1 Jul 2020 07:10:57 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .joshtriplett. - helo: .relay1-d.mail.gandi. - helo-domain: .gandi.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C2EE12029F
	for <nbd@other.debian.org>; Wed,  1 Jul 2020 07:10:57 +0000 (UTC)
X-Originating-IP: 50.39.163.217
Received: from localhost (50-39-163-217.bvtn.or.frontiernet.net [50.39.163.217])
	(Authenticated sender: josh@joshtriplett.org)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 56BA6240079
	for <nbd@other.debian.org>; Wed,  1 Jul 2020 07:10:53 +0000 (UTC)
Date: Wed, 1 Jul 2020 00:10:51 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: nbd@other.debian.org
Subject: [PATCH 2/2] Support preinitialized NBD connections
Message-ID: <20200701071051.GB301687@localhost>
References: <6b15660680e86c133abe1375e645aad9f51ebfb4.1593581099.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b15660680e86c133abe1375e645aad9f51ebfb4.1593581099.git.josh@joshtriplett.org>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ryRmJoTprpK.A.eNF.OcD_eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/914
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200701071051.GB301687@localhost
Resent-Date: Wed,  1 Jul 2020 07:11:10 +0000 (UTC)

Add an option to skip negotiation. Add an option to specify the device
size, required if using preinit.
---
 man/nbd-client.8.in.sgml | 26 +++++++++++++++++++++++
 nbd-client.c             | 45 ++++++++++++++++++++++++++++++++++------
 2 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/man/nbd-client.8.in.sgml b/man/nbd-client.8.in.sgml
index cd4dacd..7138809 100644
--- a/man/nbd-client.8.in.sgml
+++ b/man/nbd-client.8.in.sgml
@@ -66,7 +66,9 @@ manpage.1: manpage.sgml
       <arg>-nonetlink</arg>
       <arg>-systemd-mark</arg>
       <arg>-readonly</arg>
+      <arg>-preinit</arg>
       <arg>-block-size <replaceable>block size</replaceable></arg>
+      <arg>-size <replaceable>bytes</replaceable></arg>
       <arg>-timeout <replaceable>seconds</replaceable></arg>
       <arg>-name <replaceable>name</replaceable></arg>
       <arg>-certfile <replaceable>certfile</replaceable></arg>
@@ -86,7 +88,9 @@ manpage.1: manpage.sgml
       <arg>-nonetlink</arg>
       <arg>-systemd-mark</arg>
       <arg>-readonly</arg>
+      <arg>-preinit</arg>
       <arg>-block-size <replaceable>block size</replaceable></arg>
+      <arg>-size <replaceable>bytes</replaceable></arg>
       <arg>-timeout <replaceable>seconds</replaceable></arg>
       <arg>-name <replaceable>name</replaceable></arg>
     </cmdsynopsis>
@@ -266,6 +270,18 @@ manpage.1: manpage.sgml
 	    server or something similar.</para>
 	</listitem>
       </varlistentry>
+      <varlistentry>
+        <term><option>-preinit</option></term>
+        <term><option>-P</option></term>
+        <listitem>
+          <para>When this option is specified, &dhpackage; will skip
+            the usual negotiation with the server, and hand the socket
+            to the kernel immediately after connecting. Only use this
+            when connecting to specialized NBD servers specifically
+            designed for it. This requires specifying the size of the
+            device via the -B option, and does not support TLS.</para>
+        </listitem>
+      </varlistentry>
       <varlistentry>
         <term><option>-readonly</option></term>
         <term><option>-R</option></term>
@@ -275,6 +291,16 @@ manpage.1: manpage.sgml
             would allow writes.</para>
         </listitem>
       </varlistentry>
+      <varlistentry>
+	<term><option>-size <replaceable>bytes</replaceable></option></term>
+	<term><option>-B <replaceable>bytes</replaceable></option></term>
+	<listitem>
+          <para>Force the device size to the specified number of bytes,
+            rather than using the value from server negotiation. Must
+            be a multiple of the block size. If using preinit (-P) to
+            skip negotiation, this option is required.</para>
+	</listitem>
+      </varlistentry>
       <varlistentry>
         <term><option>-sdp</option></term>
 	<term><option>-S</option></term>
diff --git a/nbd-client.c b/nbd-client.c
index 2023962..aa314df 100644
--- a/nbd-client.c
+++ b/nbd-client.c
@@ -896,9 +896,9 @@ void usage(char* errmsg, ...) {
 		fprintf(stderr, "%s version %s\n", PROG_NAME, PACKAGE_VERSION);
 	}
 #if HAVE_NETLINK
-	fprintf(stderr, "Usage: nbd-client -name|-N name host [port] nbd_device\n\t[-block-size|-b block size] [-timeout|-t timeout] [-swap|-s] [-sdp|-S]\n\t[-persist|-p] [-nofork|-n] [-systemd-mark|-m] [-nonetlink|-L]\n\t[-readonly|-R]\n");
+	fprintf(stderr, "Usage: nbd-client -name|-N name host [port] nbd_device\n\t[-block-size|-b block size] [-timeout|-t timeout] [-swap|-s] [-sdp|-S]\n\t[-persist|-p] [-nofork|-n] [-systemd-mark|-m] [-nonetlink|-L]\n\t[-readonly|-R] [-size|-B bytes] [-preinit|-P]\n");
 #else
-	fprintf(stderr, "Usage: nbd-client -name|-N name host [port] nbd_device\n\t[-block-size|-b block size] [-timeout|-t timeout] [-swap|-s] [-sdp|-S]\n\t[-persist|-p] [-nofork|-n] [-systemd-mark|-m]\n\t[-readonly|-R]\n");
+	fprintf(stderr, "Usage: nbd-client -name|-N name host [port] nbd_device\n\t[-block-size|-b block size] [-timeout|-t timeout] [-swap|-s] [-sdp|-S]\n\t[-persist|-p] [-nofork|-n] [-systemd-mark|-m]\n\t[-readonly|-R] [-size|-B bytes] [-preinit|-P]\n");
 #endif
 	fprintf(stderr, "Or   : nbd-client -u (with same arguments as above)\n");
 	fprintf(stderr, "Or   : nbd-client nbdX\n");
@@ -934,9 +934,9 @@ void disconnect(char* device) {
 }
 
 #if HAVE_NETLINK
-static const char *short_opts = "-A:b:c:C:d:gH:hK:LlnN:pRSst:uVx";
+static const char *short_opts = "-A:B:b:c:C:d:gH:hK:LlnN:PpRSst:uVx";
 #else
-static const char *short_opts = "-A:b:c:C:d:gH:hK:lnN:pRSst:uVx";
+static const char *short_opts = "-A:B:b:c:C:d:gH:hK:lnN:PpRSst:uVx";
 #endif
 
 int main(int argc, char *argv[]) {
@@ -951,9 +951,11 @@ int main(int argc, char *argv[]) {
 	int sdp=0;
 	int G_GNUC_UNUSED nofork=0; // if -dNOFORK
 	pid_t main_pid;
-	u64 size64;
+	u64 size64 = 0;
+	u64 force_size64 = 0;
 	uint16_t flags = 0;
 	bool force_read_only = false;
+	bool preinit = false;
 	int c;
 	int nonspecial=0;
 	int b_unix=0;
@@ -975,6 +977,7 @@ int main(int argc, char *argv[]) {
 	struct option long_options[] = {
 		{ "cacertfile", required_argument, NULL, 'A' },
 		{ "block-size", required_argument, NULL, 'b' },
+		{ "size", required_argument, NULL, 'B' },
 		{ "check", required_argument, NULL, 'c' },
 		{ "connections", required_argument, NULL, 'C'},
 		{ "disconnect", required_argument, NULL, 'd' },
@@ -991,6 +994,7 @@ int main(int argc, char *argv[]) {
 		{ "nofork", no_argument, NULL, 'n' },
 		{ "name", required_argument, NULL, 'N' },
 		{ "persist", no_argument, NULL, 'p' },
+		{ "preinit", no_argument, NULL, 'P' },
 		{ "readonly", no_argument, NULL, 'R' },
 		{ "sdp", no_argument, NULL, 'S' },
 		{ "swap", no_argument, NULL, 's' },
@@ -1060,6 +1064,13 @@ int main(int argc, char *argv[]) {
 				exit(EXIT_FAILURE);
 			}
 			break;
+		case 'B':
+			force_size64=(u64)strtoull(optarg, NULL, 0);
+			if(force_size64 == 0) {
+				fprintf(stderr, "E: Invalid size\n");
+				exit(EXIT_FAILURE);
+			}
+			break;
 		case 'c':
 			return check_conn(optarg, 1);
 		case 'C':
@@ -1097,6 +1108,9 @@ int main(int argc, char *argv[]) {
 		case 'p':
 			cont=1;
 			break;
+		case 'P':
+			preinit = true;
+			break;
 		case 'R':
 			force_read_only = true;
 			break;
@@ -1181,12 +1195,28 @@ int main(int argc, char *argv[]) {
 		tls = true;
 	}
 
+	if (preinit) {
+		if (tls) {
+			fprintf(stderr, "E: preinit connection cannot be used with TLS\n");
+			exit(EXIT_FAILURE);
+		}
+		if (!force_size64) {
+			fprintf(stderr, "E: preinit connection requires specifying size\n");
+			exit(EXIT_FAILURE);
+		}
+	}
+
         if (!tlshostname && hostname)
                 tlshostname = strdup(hostname);
 
 	if (netlink)
 		nofork = 1;
 
+	if((force_size64 % blocksize) != 0) {
+		fprintf(stderr, "E: size (" PRIu64 " bytes) is not a multiple of blocksize (%d)!\n", force_size64, blocksize);
+		exit(EXIT_FAILURE);
+	}
+
 	if(strlen(name)==0 && !(opts & NBDC_DO_LIST)) {
 		printf("Warning: the oldstyle protocol is no longer supported.\nThis method now uses the newstyle protocol with a default export\n");
 	}
@@ -1211,9 +1241,12 @@ int main(int argc, char *argv[]) {
 		if (sock < 0)
 			exit(EXIT_FAILURE);
 
-		negotiate(&sock, &size64, &flags, name, needed_flags, cflags, opts, certfile, keyfile, cacertfile, tlshostname, tls, can_opt_go);
+		if (!preinit)
+			negotiate(&sock, &size64, &flags, name, needed_flags, cflags, opts, certfile, keyfile, cacertfile, tlshostname, tls, can_opt_go);
 		if (force_read_only)
 			flags |= NBD_FLAG_READ_ONLY;
+		if (force_size64)
+			size64 = force_size64;
 		if (netlink) {
 			sockfds[i] = sock;
 			continue;
-- 
2.27.0

