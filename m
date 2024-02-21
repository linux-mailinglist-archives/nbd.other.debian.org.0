Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B8385E92C
	for <lists+nbd@lfdr.de>; Wed, 21 Feb 2024 21:38:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 86B2B212CA; Wed, 21 Feb 2024 20:38:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 21 20:38:43 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A81942127C
	for <lists-other-nbd@bendel.debian.org>; Wed, 21 Feb 2024 20:38:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.662 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.451, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yJG8WxjWWiIT for <lists-other-nbd@bendel.debian.org>;
	Wed, 21 Feb 2024 20:38:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 66BD0212C5
	for <nbd@other.debian.org>; Wed, 21 Feb 2024 20:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708547897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hjrXa5BUUr7HseZ/5JrLXsoDAt3RD5kX8VGuifzoZ0Q=;
	b=FQOiqiDpy7lTA1WhayvJwYbbX/S2lbaKonwNZB14CZ38zKgjZtGTTJDJQ3AYijcdoYPTYM
	g0hOOWaHnIgwJJmKd9hRR7ZZ7cC7EfIJ+7bP2M9QgaN2QJp5VXCaf/IOj6qRJPkO0psYjL
	MeuB9JDrwm9fqWRMu8WPMxmLaGooYxQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-dDa5VNK4M5OyMZDTO_n9MA-1; Wed,
 21 Feb 2024 15:38:14 -0500
X-MC-Unique: dDa5VNK4M5OyMZDTO_n9MA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D96C729ABA0C;
	Wed, 21 Feb 2024 20:38:13 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.126])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 956282022AAC;
	Wed, 21 Feb 2024 20:38:13 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: guestfs@lists.libguestfs.org
Subject: [RFC PATCH] server: Advertise nicer size for NBD_OPT_INFO
Date: Wed, 21 Feb 2024 14:35:25 -0600
Message-ID: <20240221203813.1776879-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <o7oKyRJdwsI.A.gtC.T9l1lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2763
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240221203813.1776879-1-eblake@redhat.com
Resent-Date: Wed, 21 Feb 2024 20:38:43 +0000 (UTC)

NBD_OPT_GO either advertises the actual size (possibly with an
override from the command line or config file), the value OFFT_MAX (if
multitree or F_WAIT means computing a real size would take too long),
or the value UINT64_MAX (if size_autodetect fails, such as when fd is
non-seekable); the only time it ever advertises a size of 0 is when it
is serving a regular file that really is empty.

On the other hand, NBD_OPT_INFO had been blindly advertising 0 no
matter what.  While we can't always compute a real size, we can do a
lot better by advertising the same sentinels as NBD_OPT_GO.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Rich has already chimed in on my question about what size SHOULD
nbd-server report when NBD_OPT_GO wants to list an indeterminate size;
if we start changing the spec, then this may be incomplete or need
tweaking.  Here, I only tackled the simple case of a single-file (or
block device) export; there are multifile cases where NBD_OPT_GO still
reports a more accurate number than this.  There's also the question
of whether we want to address the information leak (right now, the
code can succeed on NBD_OPT_INFO even when it will later fail for
NBD_OPT_GO because the client is not authorized to used the export).

 nbd-server.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/nbd-server.c b/nbd-server.c
index 875c16f..f1a0d2f 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -2265,6 +2265,43 @@ static void setup_transactionlog(CLIENT *client) {
 	}
 }

+/**
+  * Probe details on the chosen export
+  *
+  * When a client sends NBD_OPT_INFO, we try to determine the export size.
+  * This function could also verify whether the client is allowed access,
+  * but for now, we do not deem the information leak of NBD_OPT_INFO
+  * succeeding where NBD_OPT_GO would fail to be severe.
+  *
+  * @param client the CLIENT structure
+  * @param server the SERVER structure
+  * @return true if the client is allowed access to the export, false
+  * otherwise
+  */
+static bool probe_client(CLIENT* client, SERVER* server) {
+	int fd;
+	gchar* error_string;
+
+	client->exportsize = server->expected_size ?
+		server->expected_size : OFFT_MAX;
+	if(!(server->flags & (F_MULTIFILE | F_TREEFILES | F_TEMPORARY |
+			      F_WAIT))) {
+		DEBUG( "Opening %s\n", server->exportname);
+		fd = open(server->exportname, O_RDONLY);
+		if(fd == -1) {
+			error_string=g_strdup_printf(
+				"Could not open exported file %s: %%m",
+				server->exportname);
+			err_nonfatal(error_string);
+			return server->expected_size > 0;
+		}
+		client->exportsize = size_autodetect(fd);
+		close(fd);
+	}
+	// Is it worth returning false if client is not authorized?
+	return true;
+}
+
 /**
   * Commit to exporting the chosen export
   *
@@ -2612,6 +2649,13 @@ static bool handle_info(CLIENT* client, uint32_t opt, GArray* servers, uint32_t
 			send_reply(client, opt, NBD_REP_ERR_POLICY, -1, "Access denied by server configuration");
 			return false;
 		}
+	} else {
+		if(!probe_client(client, server)) {
+			consume(client, n_requests * sizeof(request), buf,
+				sizeof(buf));
+			send_reply(client, opt, NBD_REP_ERR_POLICY, -1, "Access denied by server configuration");
+			return false;
+		}
 	}
 	for(i=0; i<n_requests; i++) {
 		socket_read(client, &request, sizeof(request));
-- 
2.43.2

