Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BA16B5C15
	for <lists+nbd@lfdr.de>; Sat, 11 Mar 2023 14:07:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D407620632; Sat, 11 Mar 2023 13:07:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 11 13:07:45 2023
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,ROLEX autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1AA312062F
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 Mar 2023 13:07:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.73 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, ROLEX=3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id AEVKLhvQQ3dU for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 Mar 2023 13:07:30 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 333782062A
	for <nbd@other.debian.org>; Sat, 11 Mar 2023 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DtE3J2xHNF2uZ7W/Casf67u28bayIKKdro+PhrWy4eM=; b=q9Q70/y6GXruWS+7c0/2LsXkje
	VxSo/QJxBeHAAe36bOupnKXHJsJG4D1IXmqOKSmcU9+/nSae/PfyBdGSiPO3gYJrD19rnhYMJbT5r
	EMy52jtEKeuGOerS7uSXtpDvUKKZcvpMIuuFctMUkbWMXi+8zX7oiAEyo69QEVhpJ5GstoouZIM0i
	brWIMnFxDf6oTdroa1PQlUg2BXXTk4W7dPKeUV4cORivZ0HBKRLXvrLRAsD8dZzgBqVto5MU5eS8B
	efUl206HBNERhvYuzvzofwZYIBrbSwPXKnNTJRtePTp+VqNZMOoQIIw17uqaKLg3r1wNI9Y/MD9ST
	cj61v5sw==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <wouter@grep.be>)
	id 1paywZ-005Ups-6s; Sat, 11 Mar 2023 14:07:27 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <wouter@grep.be>)
	id 1paywQ-0014JL-2K;
	Sat, 11 Mar 2023 15:07:18 +0200
From: w@uter.be
To: nbd@other.debian.org
Cc: Wouter Verhelst <w@uter.be>
Subject: [PATCH 2/4] Add a "confirm_read" call
Date: Sat, 11 Mar 2023 15:07:03 +0200
Message-Id: <20230311130705.253855-3-w@uter.be>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230311130705.253855-1-w@uter.be>
References: <20230311130705.253855-1-w@uter.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <B1vadCHG9gF.A.4sE.h0HDkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2376
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230311130705.253855-3-w@uter.be
Resent-Date: Sat, 11 Mar 2023 13:07:45 +0000 (UTC)

From: Wouter Verhelst <w@uter.be>

This doesn't currently do anything, but we call it when the buffer is
ready to be sent out, so that when we get to structured replies, we can
optionally send out our buffer there.

Signed-off-by: Wouter Verhelst <w@uter.be>
---
 nbd-server.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/nbd-server.c b/nbd-server.c
index 3bfa857..64609f3 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -1301,6 +1301,9 @@ char * find_read_buf(READ_CTX *ctx) {
 	return ctx->buf + ctx->current_offset;
 }
 
+void confirm_read(CLIENT *client, READ_CTX *ctx, size_t len_read) {
+}
+
 void complete_read(CLIENT *client, READ_CTX *ctx, uint32_t error, char *errmsg, uint16_t msglen, bool with_offset, uint64_t err_offset) {
 	uint16_t type;
 	uint64_t offset = 0;
@@ -1364,6 +1367,7 @@ int rawexpread_fully(READ_CTX *ctx, CLIENT *client) {
 		if((ret = rawexpread((off_t)ctx->req->from + (off_t)ctx->current_offset, buf, ctx->current_len, client)) < 0) {
 			return ret;
 		}
+		confirm_read(client, ctx, ret);
 		ctx->current_offset += ret;
 		ctx->current_len -= ret;
 	}
@@ -1470,6 +1474,7 @@ int expread(READ_CTX *ctx, CLIENT *client) {
 			if (pread(client->difffile, buf, rdlen, client->difmap[mapcnt]*DIFFPAGESIZE+offset) != rdlen) {
 				goto fail;
 			}
+			confirm_read(client, ctx, rdlen);
 		} else { /* the block is not there */
 			if ((client->server->flags & F_WAIT) && (client->export == NULL)){
 				DEBUG("Page %llu is not here, and waiting for file\n",
-- 
2.39.2

