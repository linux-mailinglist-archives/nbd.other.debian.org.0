Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 097859D30EC
	for <lists+nbd@lfdr.de>; Wed, 20 Nov 2024 00:31:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ECF142064D; Tue, 19 Nov 2024 23:31:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 19 23:31:31 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD,
	LDOSUBSCRIBER,LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0642320645
	for <lists-other-nbd@bendel.debian.org>; Tue, 19 Nov 2024 23:31:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.419 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ud23EPeZ66kk for <lists-other-nbd@bendel.debian.org>;
	Tue, 19 Nov 2024 23:31:09 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id D023E2064B
	for <nbd@other.debian.org>; Tue, 19 Nov 2024 23:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732059064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7d9YwG/cZ1sHp+4BuWTRlyHVV7rrIsHD7SGdyaukA8Q=;
	b=B8yK7CnZfHscNX9ugnfk2XfRoRkduyMICrpbOTxk8+fCdxmADP7HJ0Dzl0ubQViN0llvfq
	lxyjyiAIUwWFh/MhKvYa5i8bnhuPK4nralMcymuZNPnRIb1Fg62ZZKqMqKedfZGP/nNpyF
	pmDNdtydwe33djZ8S87Ipac8Kz/Icr0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-q6fJZy7_Mt-yG1piV-3STg-1; Tue,
 19 Nov 2024 18:31:02 -0500
X-MC-Unique: q6fJZy7_Mt-yG1piV-3STg-1
X-Mimecast-MFC-AGG-ID: q6fJZy7_Mt-yG1piV-3STg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B504119560B5
	for <nbd@other.debian.org>; Tue, 19 Nov 2024 23:31:01 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.76])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EBE2D1956086;
	Tue, 19 Nov 2024 23:31:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: stefanha@redhat.com
Subject: [PATCH 2/2] nbd-client: Add support for setting /sys/block/nbdN/backend
Date: Tue, 19 Nov 2024 17:27:29 -0600
Message-ID: <20241119233057.2248038-3-eblake@redhat.com>
In-Reply-To: <20241119233057.2248038-1-eblake@redhat.com>
References: <20241119233057.2248038-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bj2YeF2yipitbgIW6UVSuKszKt852k6ziKceuh0Mm5I_1732059061
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <oLKf1G_-LbB.A.ekIL.T_RPnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3193
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20241119233057.2248038-3-eblake@redhat.com
Resent-Date: Tue, 19 Nov 2024 23:31:31 +0000 (UTC)

In order for userspace apps to idempotently ensure that a
netlink-managed NBD device corresponds to the device that the app is
expecting, kernel 5.14 added a netlink backend string identifier.
Expose the ability for setting this identifier when binding to a
device; the user can then check with /sys/block/nbdN/backend to see if
the contents match expectations.

Signed-off-by: Eric Blake <eblake@redhat.com>

---

Given the syntax error present in nbd-client.8.sgml.in before my patch
(a </varlistentry without closing >), I'm not sure how to test that my
man page changes are correct.
---
 man/nbd-client.8.sgml.in | 24 +++++++++++++++++++++++-
 nbd-client.c             | 26 +++++++++++++++++++++-----
 nbd-netlink.h            |  7 +++++--
 3 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/man/nbd-client.8.sgml.in b/man/nbd-client.8.sgml.in
index c1f18624..b9478502 100644
--- a/man/nbd-client.8.sgml.in
+++ b/man/nbd-client.8.sgml.in
@@ -260,7 +260,29 @@ manpage.1: manpage.sgml
 	  <emphasis>require</emphasis> the use of netlink, but it has
 	  not yet been decided when that will be the case.</para>
         </listitem>
-      </varlistentry
+      </varlistentry>
+      <varlistentry>
+        <term><option>-identifier <replaceable>ident</replaceable></option></term>
+        <term><option>-i</option></term>
+        <listitem>
+	  <para>Added in 3.27, this tells &dhpackage; to set the
+	  netlink identifier (requires kernel 5.14 or newer), which
+	  can later be viewed
+	  at <command>/sys/block/nbdN/backend</command>. This prevents
+	  any process from using netlink to silently reconfigure the
+	  device to a different backend, making it easier to write
+	  idempotent code that is safe in the presence of
+	  configuration races.
+	  </para>
+	  <para>This option is only available if &dhpackage; was
+	  compiled against libnl-genl. If that is not the case,
+	  nbd-client will only be able to use the ioctl interface (and
+	  the option will not be available).</para>
+	  <para>Note that a future version of &dhpackage; will
+	  <emphasis>require</emphasis> the use of netlink, but it has
+	  not yet been decided when that will be the case.</para>
+        </listitem>
+      </varlistentry>
       <varlistentry>
 	<term><option>-persist</option></term>
 	<term><option>-p</option></term>
diff --git a/nbd-client.c b/nbd-client.c
index e9a42009..2be3a4bc 100644
--- a/nbd-client.c
+++ b/nbd-client.c
@@ -164,7 +164,7 @@ static struct nl_sock *get_nbd_socket(int *driver_id) {

 static void netlink_configure(int index, int *sockfds, int num_connects,
 			      u64 size64, int blocksize, uint16_t flags,
-			      int timeout) {
+			      int timeout, const char *identifier) {
 	struct nl_sock *socket;
 	struct nlattr *sock_attr;
 	struct nl_msg *msg;
@@ -185,6 +185,8 @@ static void netlink_configure(int index, int *sockfds, int num_connects,
 	NLA_PUT_U64(msg, NBD_ATTR_SERVER_FLAGS, flags);
 	if (timeout)
 		NLA_PUT_U64(msg, NBD_ATTR_TIMEOUT, timeout);
+	if (identifier)
+		NLA_PUT_STRING(msg, NBD_ATTR_BACKEND_IDENTIFIER, identifier);

 	sock_attr = nla_nest_start(msg, NBD_ATTR_SOCKETS);
 	if (!sock_attr)
@@ -242,7 +244,7 @@ nla_put_failure:
 #else
 static void netlink_configure(int index, int *sockfds, int num_connects,
 			      u64 size64, int blocksize, uint16_t flags,
-			      int timeout)
+			      int timeout, const char *identifier)
 {
 }

@@ -871,7 +873,7 @@ void usage(char* errmsg, ...) {
 		fprintf(stderr, "%s version %s\n", PROG_NAME, PACKAGE_VERSION);
 	}
 #if HAVE_NETLINK
-	fprintf(stderr, "Usage: nbd-client -name|-N name host [port] nbd_device\n\t[-block-size|-b block size] [-timeout|-t timeout] [-swap|-s]\n\t[-persist|-p] [-nofork|-n] [-systemd-mark|-m] [-nonetlink|-L]\n\t[-readonly|-R] [-size|-B bytes] [-preinit|-P]\n");
+	fprintf(stderr, "Usage: nbd-client -name|-N name host [port] nbd_device\n\t[-block-size|-b block size] [-timeout|-t timeout] [-swap|-s]\n\t[-persist|-p] [-nofork|-n] [-systemd-mark|-m] [-i ident|-nonetlink|-L]\n\t[-readonly|-R] [-size|-B bytes] [-preinit|-P]\n");
 #else
 	fprintf(stderr, "Usage: nbd-client -name|-N name host [port] nbd_device\n\t[-block-size|-b block size] [-timeout|-t timeout] [-swap|-s]\n\t[-persist|-p] [-nofork|-n] [-systemd-mark|-m]\n\t[-readonly|-R] [-size|-B bytes] [-preinit|-P]\n");
 #endif
@@ -910,7 +912,7 @@ void disconnect(char* device) {

 static const char *short_opts = "-B:b:c:d:gH:hlnN:PpRSst:uVxy:"
 #if HAVE_NETLINK
-	"L"
+	"i:L"
 #endif
 #if HAVE_GNUTLS
 	"A:C:F:K:"
@@ -931,6 +933,7 @@ int main(int argc, char *argv[]) {
 	uint32_t opts=0;
 	sigset_t block, old;
 	struct sigaction sa;
+	char *identifier = NULL;
 	int netlink = HAVE_NETLINK;
 	int need_disconnect = 0;
 	int *sockfds;
@@ -945,6 +948,9 @@ int main(int argc, char *argv[]) {
 		{ "no-optgo", no_argument, NULL, 'g' },
 		{ "help", no_argument, NULL, 'h' },
 		{ "tlshostname", required_argument, NULL, 'H' },
+#if HAVE_NETLINK
+		{ "identifier", required_argument, NULL, 'i' },
+#endif
 		{ "keyfile", required_argument, NULL, 'K' },
 		{ "list", no_argument, NULL, 'l' },
 #if HAVE_NETLINK
@@ -1049,6 +1055,11 @@ int main(int argc, char *argv[]) {
 		case 'h':
 			usage(NULL);
 			exit(EXIT_SUCCESS);
+#if HAVE_NETLINK
+		case 'i':
+			identifier = optarg;
+			break;
+#endif
 		case 'l':
 			needed_flags |= NBD_FLAG_FIXED_NEWSTYLE;
 			opts |= NBDC_DO_LIST;
@@ -1176,6 +1187,10 @@ int main(int argc, char *argv[]) {

 	if (netlink)
 		nofork = 1;
+	else if (identifier) {
+		fprintf(stderr, "E: identifier is only useful with netlink\n");
+		exit(EXIT_FAILURE);
+	}

 	if((cur_client->force_size64 % cur_client->bs) != 0) {
 		fprintf(stderr, "E: size (%" PRIu64 " bytes) is not a multiple of blocksize (%d)!\n", cur_client->force_size64, cur_client->bs);
@@ -1242,7 +1257,8 @@ int main(int argc, char *argv[]) {
 				err("Invalid nbd device target\n");
 		}
 		netlink_configure(index, sockfds, cur_client->nconn,
-				  cur_client->size64, cur_client->bs, flags, cur_client->timeout);
+				  cur_client->size64, cur_client->bs, flags, cur_client->timeout,
+				  identifier);
 		return 0;
 	}
 	/* Go daemon */
diff --git a/nbd-netlink.h b/nbd-netlink.h
index a9e68024..2d0b9096 100644
--- a/nbd-netlink.h
+++ b/nbd-netlink.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
  * Copyright (C) 2017 Facebook.  All rights reserved.
  *
@@ -18,8 +19,9 @@
 #ifndef _UAPILINUX_NBD_NETLINK_H
 #define _UAPILINUX_NBD_NETLINK_H

-#define NBD_GENL_FAMILY_NAME	"nbd"
-#define NBD_GENL_VERSION	0x1
+#define NBD_GENL_FAMILY_NAME		"nbd"
+#define NBD_GENL_VERSION		0x1
+#define NBD_GENL_MCAST_GROUP_NAME	"nbd_mc_group"

 /* Configuration policy attributes, used for CONNECT */
 enum {
@@ -33,6 +35,7 @@ enum {
 	NBD_ATTR_SOCKETS,
 	NBD_ATTR_DEAD_CONN_TIMEOUT,
 	NBD_ATTR_DEVICE_LIST,
+	NBD_ATTR_BACKEND_IDENTIFIER,
 	__NBD_ATTR_MAX,
 };
 #define NBD_ATTR_MAX (__NBD_ATTR_MAX - 1)
-- 
2.47.0

