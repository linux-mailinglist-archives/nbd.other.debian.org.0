Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 535D446806F
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:32:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 27C3D20166; Fri,  3 Dec 2021 23:32:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:32:33 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D22E920154
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:32:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.927 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.049,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uX7mSfkf72Yu for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:32:14 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 9FF30200E5
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XPqO+0QHBfaom4pEhnAk5AqXR/f6poXPR218L1xFEEU=;
	b=fiBLI2jS10aiRw0L4aQQt3ieSEZrt12DxYejxToTeoX2/8Xixw2wLi5JBcmjvnpCJ0pP21
	mo1GCnA1N5UvJsIm5gCai93fhkK0QmIz1aAn5A1+YIhPUCPgA059Oir7IJCpvSaTY5gqiW
	y4qWJBAE0id5S7NcGHMMlvuHy12mlqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-Wu5-ZOztPPmUtYSDDt4rjg-1; Fri, 03 Dec 2021 18:15:53 -0500
X-MC-Unique: Wu5-ZOztPPmUtYSDDt4rjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0924585EE61;
	Fri,  3 Dec 2021 23:15:52 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 209255D9D5;
	Fri,  3 Dec 2021 23:15:51 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	libguestfs@redhat.com,
	nsoffer@redhat.com
Subject: [PATCH 01/14] nbd/server: Minor cleanups
Date: Fri,  3 Dec 2021 17:15:26 -0600
Message-Id: <20211203231539.3900865-2-eblake@redhat.com>
In-Reply-To: <20211203231539.3900865-1-eblake@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231539.3900865-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0JuZPKczbsI.A.rGD.RkqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1628
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231539.3900865-2-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:32:33 +0000 (UTC)

Spelling fixes, grammar improvements and consistent spacing, noticed
while preparing other patches in this file.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 4630dd732250..f302e1cbb03e 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2085,11 +2085,10 @@ static void nbd_extent_array_convert_to_be(NBDExtentArray *ea)
  * Add extent to NBDExtentArray. If extent can't be added (no available space),
  * return -1.
  * For safety, when returning -1 for the first time, .can_add is set to false,
- * further call to nbd_extent_array_add() will crash.
- * (to avoid the situation, when after failing to add an extent (returned -1),
- * user miss this failure and add another extent, which is successfully added
- * (array is full, but new extent may be squashed into the last one), then we
- * have invalid array with skipped extent)
+ * and further calls to nbd_extent_array_add() will crash.
+ * (this avoids the situation where a caller ignores failure to add one extent,
+ * where adding another extent that would squash into the last array entry
+ * would result in an incorrect range reported to the client)
  */
 static int nbd_extent_array_add(NBDExtentArray *ea,
                                 uint32_t length, uint32_t flags)
@@ -2288,7 +2287,7 @@ static int nbd_co_receive_request(NBDRequestData *req, NBDRequest *request,
     assert(client->recv_coroutine == qemu_coroutine_self());
     ret = nbd_receive_request(client, request, errp);
     if (ret < 0) {
-        return  ret;
+        return ret;
     }

     trace_nbd_co_receive_request_decode_type(request->handle, request->type,
@@ -2648,7 +2647,7 @@ static coroutine_fn void nbd_trip(void *opaque)
     }

     if (ret < 0) {
-        /* It wans't -EIO, so, according to nbd_co_receive_request()
+        /* It wasn't -EIO, so, according to nbd_co_receive_request()
          * semantics, we should return the error to the client. */
         Error *export_err = local_err;

-- 
2.33.1

