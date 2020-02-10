Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3007F1584E6
	for <lists+nbd@lfdr.de>; Mon, 10 Feb 2020 22:39:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D4367204B3; Mon, 10 Feb 2020 21:39:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Feb 10 21:39:54 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DF62220484
	for <lists-other-nbd@bendel.debian.org>; Mon, 10 Feb 2020 21:39:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.081 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Gt15FqZzpwSz for <lists-other-nbd@bendel.debian.org>;
	Mon, 10 Feb 2020 21:39:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id 2BCDE20473
	for <nbd@other.debian.org>; Mon, 10 Feb 2020 21:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581370778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qNtg8DARJMZwE9dykj0Y8ToV7/rCNOzqwYLoO5AZTNE=;
	b=ICNNSuF4LWJiNJ/7h+gBeD7M73eyoqTk13VvnX46YltV9019b3a3/fVj6y+iUbTrTB9Tec
	reT1UKXlBWCOarABnRpJZEbvWNUWBsPcvrFiLvmB6bEHXjOVAB1YPoCsgxrQ9bZ4IyMoZQ
	M59YmH1k/kBT62VWmX8gOiIiDm4E+R4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-trpCsPy0MryELM6s1nbPpA-1; Mon, 10 Feb 2020 16:39:35 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FC6713E4;
	Mon, 10 Feb 2020 21:39:34 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-180.phx2.redhat.com [10.3.116.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C107B60BF1;
	Mon, 10 Feb 2020 21:39:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: rjones@redhat.com,
	mreitz@redhat.com,
	vsementsov@virtuozzo.com
Subject: [nbd PATCH 1/1] docs: Add NBD_INFO_INIT_STATE protocol extension
Date: Mon, 10 Feb 2020 15:39:33 -0600
Message-Id: <20200210213933.751549-1-eblake@redhat.com>
In-Reply-To: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
References: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: trpCsPy0MryELM6s1nbPpA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fpGDX1jXpzE.A.JQD.q2cQeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/808
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200210213933.751549-1-eblake@redhat.com
Resent-Date: Mon, 10 Feb 2020 21:39:54 +0000 (UTC)

Various algorithms dealing with image files can optimize their
performance if they know that the destination begins life with all
zero content.  While NBD_CMD_BLOCK_STATUS could query this, it can
currently do so only 4G at a time, and only if the block status
"base:allocation" extension is present. Adding a new extension may be
easier for some servers to implement (the query only has to be
accurate at the time the client first connects, rather than something
that tracks the state of the export over time), and clients can use
their optimizations with much less traffic.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 doc/proto.md | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/doc/proto.md b/doc/proto.md
index 61d57b5..e053b17 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -1549,6 +1549,32 @@ during option haggling in the fixed newstyle negotia=
tion.
       - 32 bits, preferred block size =20
       - 32 bits, maximum block size =20

+    * `NBD_INFO_INIT_STATE` (4)
+
+      Represents any properties of the export that are known by the
+      server to be true when the connection is first established, even
+      if these properties might change by later actions.  A server MAY
+      leave a particular property bit unset even if that property is
+      true; and a client SHOULD treat a reply of 0 for all properties
+      the same as if the server had omitted `NBD_INFO_INIT_STATE` in
+      its reply.  A client MUST ignore unknown property bits.  The
+      *length* MUST be 4, and the reply payload is interpreted as:
+
+      - 16 bits, `NBD_INFO_INIT_STATE` =20
+      - 16 bits, bitwise-or of known properties =20
+
+      The following bits represent known properties:
+
+      - bit 0, `NBD_INIT_SPARSE`; the image contains at least one
+        region that is not fully allocated, whether or not the
+        combination of `NBD_CMD_BLOCK_STATUS` with the
+        "base:allocation" meta context would report the same (via
+        `NBD_STATE_HOLE`) for at least one byte.
+      - bit 1, `NBD_INIT_ZERO`; all bytes in the export initially read
+        as zeroes, whether or not the combination of
+        `NBD_CMD_BLOCK_STATUS` with the "base:allocation" meta context
+        would report the same (via `NBD_STATE_ZERO`) over all bytes.
+
 * `NBD_REP_META_CONTEXT` (4)

     A description of a metadata context. Data:
--=20
2.24.1

