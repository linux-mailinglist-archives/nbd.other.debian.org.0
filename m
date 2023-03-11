Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A067B6B5C16
	for <lists+nbd@lfdr.de>; Sat, 11 Mar 2023 14:07:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 846802062F; Sat, 11 Mar 2023 13:07:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 11 13:07:49 2023
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 52E4E205C3
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 Mar 2023 13:07:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.73 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xX-OACK9-XoQ for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 Mar 2023 13:07:30 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3176920625
	for <nbd@other.debian.org>; Sat, 11 Mar 2023 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xHsPwz3YFNc4/9nUBXBNdZMPYf39Bz6Tf0FEVsuhKw8=; b=OKvB+Jnp2MeZSBQMjG83xkH7eE
	5C4shUxB67E2ZypsLLt9vk9A7ICCRCVcICWfQMTC97gw6M2h7zKpRxPbXhX8eYdp5nGEbuO/rBUYI
	apLwnskSgFcvBbfFVb3xZWMK0KoBSdGeeya2xn7hbShw6FePzUzwQdHzkBf/Bdouvot0clEl/GMeU
	3QmNjAJ9UIvHsheA+4FobMC6SD6wOgErO0oyhcgfvosd8eHwc2IMuuP1y6uo+/K1KgiUX+B1UhYxR
	LrQcOx7N3NXwtp1t71IOaw0ecjhhqIrAMpvtwZVzv8Y2tLINqYVulToZlt3uwST0YbR8xmKn/tjB3
	RNW3cIpA==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <wouter@grep.be>)
	id 1paywZ-005Upv-6s; Sat, 11 Mar 2023 14:07:27 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <wouter@grep.be>)
	id 1paywQ-0014JT-2q;
	Sat, 11 Mar 2023 15:07:18 +0200
From: w@uter.be
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>
Subject: [PATCH 4/4] Implement negotiation of structured replies
Date: Sat, 11 Mar 2023 15:07:05 +0200
Message-Id: <20230311130705.253855-5-w@uter.be>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230311130705.253855-1-w@uter.be>
References: <20230311130705.253855-1-w@uter.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SUnsO2-9lHO.A.FlF.l0HDkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2377
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230311130705.253855-5-w@uter.be
Resent-Date: Sat, 11 Mar 2023 13:07:49 +0000 (UTC)

From: Wouter Verhelst <w@uter.be>

This should make it possible for us to use structured replies!

Signed-off-by: Wouter Verhelst <w@uter.be>
---
 cliserv.h    | 13 +++++++------
 nbd-server.c | 28 ++++++++++++++++++++++++++++
 nbd.h        |  1 +
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/cliserv.h b/cliserv.h
index 1333802..8a89c04 100644
--- a/cliserv.h
+++ b/cliserv.h
@@ -95,12 +95,13 @@ int writeit(int f, void *buf, size_t len);
 					 * served */
 
 /* Options that the client can select to the server */
-#define NBD_OPT_EXPORT_NAME	(1)	/**< Client wants to select a named export (is followed by name of export) */
-#define NBD_OPT_ABORT		(2)	/**< Client wishes to abort negotiation */
-#define NBD_OPT_LIST		(3)	/**< Client request list of supported exports (not followed by data) */
-#define NBD_OPT_STARTTLS	(5)	/**< Client wishes to initiate TLS */
-#define NBD_OPT_INFO		(6)	/**< Client wants information about the given export */
-#define NBD_OPT_GO		(7)	/**< Client wants to select the given and move to the transmission phase */
+#define NBD_OPT_EXPORT_NAME	 (1)	/**< Client wants to select a named export (is followed by name of export) */
+#define NBD_OPT_ABORT		 (2)	/**< Client wishes to abort negotiation */
+#define NBD_OPT_LIST		 (3)	/**< Client request list of supported exports (not followed by data) */
+#define NBD_OPT_STARTTLS	 (5)	/**< Client wishes to initiate TLS */
+#define NBD_OPT_INFO		 (6)	/**< Client wants information about the given export */
+#define NBD_OPT_GO		 (7)	/**< Client wants to select the given and move to the transmission phase */
+#define NBD_OPT_STRUCTURED_REPLY (8)	/**< Client wants to see structured replies */
 
 /* Replies the server can send during negotiation */
 #define NBD_REP_ACK		(1)	/**< ACK a request. Data: option number to be acked */
diff --git a/nbd-server.c b/nbd-server.c
index 8c84f93..0b269d7 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -2181,6 +2181,8 @@ void send_export_info(CLIENT* client, SERVER* server, bool maybe_zeroes) {
 		flags |= NBD_FLAG_SEND_TRIM;
 	if (!(server->flags & F_COPYONWRITE))
 		flags |= NBD_FLAG_CAN_MULTI_CONN;
+	if (client->clientflags & F_STRUCTURED)
+		flags |= NBD_FLAG_SEND_DF;
 	flags = htons(flags);
 	socket_write(client, &flags, sizeof(flags));
 	if (!(glob_flags & F_NO_ZEROES) && maybe_zeroes) {
@@ -2521,6 +2523,27 @@ exit:
 }
 #endif
 
+/**
+  * Handle an NBD_OPT_STRUCTURED_REPLY message
+  */
+static void handle_structured_reply(CLIENT *client, uint32_t opt, GArray *servers, uint32_t cflags) {
+	uint32_t len;
+	int i;
+
+	socket_read(client, &len, sizeof(len));
+	len = ntohl(len);
+	if(len) {
+		send_reply(client, opt, NBD_REP_ERR_INVALID, -1, "NBD_OPT_STRUCTURED_REPLY with nonzero data length is not a valid request");
+		char buf[1024];
+		consume(client, len, buf, sizeof buf);
+	}
+	if(client->clientflags & F_STRUCTURED) {
+		send_reply(client, opt, NBD_REP_ERR_INVALID, -1, "NBD_OPT_STRUCTURED_REPLY has already been called");
+	}
+	client->clientflags |= F_STRUCTURED;
+	send_reply(client, opt, NBD_REP_ACK, 0, NULL);
+}
+
 /**
   * Handle an NBD_OPT_INFO or NBD_OPT_GO request.
   */
@@ -2700,6 +2723,8 @@ CLIENT* negotiate(int net, GArray* servers, struct generic_conf *genconf) {
 				// can't recover from failed TLS negotiation.
 				goto handler_err;
 			}
+			// once TLS has been negotiated, any state must be cleared
+			client->clientflags = 0;
 #endif
 			break;
 		case NBD_OPT_GO:
@@ -2708,6 +2733,9 @@ CLIENT* negotiate(int net, GArray* servers, struct generic_conf *genconf) {
 				return client;
 			}
 			break;
+		case NBD_OPT_STRUCTURED_REPLY:
+			handle_structured_reply(client, opt, servers, cflags);
+			break;
 		default:
 			consume_len(client);
 			send_reply(client, opt, NBD_REP_ERR_UNSUP, -1, "The given option is unknown to this server implementation");
diff --git a/nbd.h b/nbd.h
index 4cf692a..4985e51 100644
--- a/nbd.h
+++ b/nbd.h
@@ -55,6 +55,7 @@ enum {
 #define NBD_FLAG_ROTATIONAL	(1 << 4)	/* Use elevator algorithm - rotational media */
 #define NBD_FLAG_SEND_TRIM	(1 << 5)	/* Send TRIM (discard) */
 #define NBD_FLAG_SEND_WRITE_ZEROES (1 << 6) 	/* Send NBD_CMD_WRITE_ZEROES */
+#define NBD_FLAG_SEND_DF	(1 << 7)	/* Send NBD_CMD_FLAG_DF */
 #define NBD_FLAG_CAN_MULTI_CONN	(1 << 8)	/* multiple connections are okay */
 
 #define nbd_cmd(req) ((req)->cmd[0])
-- 
2.39.2

