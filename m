Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5547285E8CA
	for <lists+nbd@lfdr.de>; Wed, 21 Feb 2024 21:07:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1100520CB1; Wed, 21 Feb 2024 20:07:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 21 20:07:15 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 170FB20CA0
	for <lists-other-nbd@bendel.debian.org>; Wed, 21 Feb 2024 20:07:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.559 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.451, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ScopmIit8z-I for <lists-other-nbd@bendel.debian.org>;
	Wed, 21 Feb 2024 20:06:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 789E920C81
	for <nbd@other.debian.org>; Wed, 21 Feb 2024 20:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708546012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FrCatiejHz8KTc2APurLOkD/jXujZjAijxoR7zuwv8s=;
	b=AvzQLN1nyK+rLUmZ0pexNjp/0+Kn+doMCuBgfKC5fqaJsKAE8ZyT0OygM7ImOLz3XQkHth
	1LfpEzgTJVURAESEiASnKfZO9NrD9RkqRzPmJ1bQwbNnbz77cTozQp/7zqd8QxKi6m2dSb
	NwKl81r8rq8FtSpnu1guDbZCQtLQ8CI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-k0-Ik2LnMua6lSzk0f1Ing-1; Wed, 21 Feb 2024 15:06:50 -0500
X-MC-Unique: k0-Ik2LnMua6lSzk0f1Ing-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E593106D103
	for <nbd@other.debian.org>; Wed, 21 Feb 2024 20:06:50 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.126])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A3751C060AF
	for <nbd@other.debian.org>; Wed, 21 Feb 2024 20:06:50 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH] server: Avoid sync bug when NBD_OPT_GO fails with ERR_POLICY
Date: Wed, 21 Feb 2024 14:05:28 -0600
Message-ID: <20240221200649.1770849-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yaZiFoH8-HI.A.w2.zfl1lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2762
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240221200649.1770849-1-eblake@redhat.com
Resent-Date: Wed, 21 Feb 2024 20:07:16 +0000 (UTC)

It is imperative that all client data is consumed when replying with
error to NBD_OPT_GO, so that the server will still be in sync if the
client attempts another NBD_OPT_* command.  We got this right a couple
lines earlier when server is NULL, but leave unread client data when
commit_client() fails.

Fixes: e6b56c12 ("Merge branch 'extension-info'", 3.16)
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd-server.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/nbd-server.c b/nbd-server.c
index 216eb00..875c16f 100644
--- a/nbd-server.c
+++ b/nbd-server.c
@@ -2607,6 +2607,8 @@ static bool handle_info(CLIENT* client, uint32_t opt, GArray* servers, uint32_t
 	if (opt == NBD_OPT_GO) {
 		client->clientfeats = cflags;
 		if(!commit_client(client, server)) {
+			consume(client, n_requests * sizeof(request), buf,
+				sizeof(buf));
 			send_reply(client, opt, NBD_REP_ERR_POLICY, -1, "Access denied by server configuration");
 			return false;
 		}
-- 
2.43.2

