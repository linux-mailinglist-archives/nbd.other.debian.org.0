Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B09E310B6A
	for <lists+nbd@lfdr.de>; Wed,  1 May 2019 18:35:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8AA732034B; Wed,  1 May 2019 16:35:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May  1 16:35:13 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=4.0 tests=DIGITS_LETTERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AD29E20347
	for <lists-other-nbd@bendel.debian.org>; Wed,  1 May 2019 16:34:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OSUud5Z68vZw for <lists-other-nbd@bendel.debian.org>;
	Wed,  1 May 2019 16:34:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 96EE320348
	for <nbd@other.debian.org>; Wed,  1 May 2019 16:34:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55D75C0528AC
	for <nbd@other.debian.org>; Wed,  1 May 2019 16:34:52 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-15.phx2.redhat.com [10.3.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18E366C766
	for <nbd@other.debian.org>; Wed,  1 May 2019 16:34:52 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH 1/2] doc: Clarify use of EOVERFLOW
Date: Wed,  1 May 2019 11:34:50 -0500
Message-Id: <20190501163451.15506-2-eblake@redhat.com>
In-Reply-To: <20190501163451.15506-1-eblake@redhat.com>
References: <20190501163451.15506-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 01 May 2019 16:34:52 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Rqs0wbeCRXO.A.72.BrcycB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/488
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190501163451.15506-2-eblake@redhat.com
Resent-Date: Wed,  1 May 2019 16:35:13 +0000 (UTC)

The error EOVERFLOW was added as part of the NBD_CMD_FLAG_DF flag for
structured reads. Since NBD errors are not necessarily 1:1 with local
errno values, it is conceivable that a client may not be expecting to
receive this value, so it is better to document that a server should
not send it in situations that older clients were not expecting.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 doc/proto.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/doc/proto.md b/doc/proto.md
index 8aaad96..e446f75 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -2125,6 +2125,9 @@ request is not aligned to advertised minimum block sizes. Finally, it
 SHOULD return `EPERM` if it receives a write or trim request on a
 read-only export.

+The server SHOULD NOT return `EOVERFLOW` except as documented in
+response to `NBD_CMD_READ` when `NBD_CMD_FLAG_DF` is supported.
+
 The server SHOULD return `EINVAL` if it receives an unknown command.

 The server SHOULD return `EINVAL` if it receives an unknown command flag. It
-- 
2.20.1

