Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A535C945ED9
	for <lists+nbd@lfdr.de>; Fri,  2 Aug 2024 15:46:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 75DAB2056F; Fri,  2 Aug 2024 13:46:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug  2 13:46:42 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EDA55204C9
	for <lists-other-nbd@bendel.debian.org>; Fri,  2 Aug 2024 13:46:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ab6mqBe8fTV1 for <lists-other-nbd@bendel.debian.org>;
	Fri,  2 Aug 2024 13:46:27 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 481 seconds by postgrey-1.36 at bendel; Fri, 02 Aug 2024 13:46:27 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 5879E2049E
	for <nbd@other.debian.org>; Fri,  2 Aug 2024 13:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722606382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=76X2gLmSh91Q7+zu1kNaeBaPwdxCniEJ0/G6OTn3N1o=;
	b=dvEzXesjRHgrAzCg4ybQie/UiGs4NXDqoTBn2V+pj9/1e7YnrfRt12po+xUyUrvE73hoUH
	F/Mq6ov4n1fz9W/zdQ45M3yCAyNRlqyAoEQKLKYMJOngf9NAI4feYoX4DD3PavVJcsYygg
	U1WGxPG8pTtyuizGpfrfdR3KA8Sl9Zg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-688-KRCKrrK1OCKyeIlraDWx0Q-1; Fri,
 02 Aug 2024 09:38:18 -0400
X-MC-Unique: KRCKrrK1OCKyeIlraDWx0Q-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 718691944B30;
	Fri,  2 Aug 2024 13:38:16 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.72])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B13F1195605A;
	Fri,  2 Aug 2024 13:38:15 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org
Subject: [PATCH] docs: Tweak location of qemu nbd extensions
Date: Fri,  2 Aug 2024 08:36:43 -0500
Message-ID: <20240802133811.2001029-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gKN373o-r5F.A.vL-P.CNOrmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3114
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240802133811.2001029-1-eblake@redhat.com
Resent-Date: Fri,  2 Aug 2024 13:46:42 +0000 (UTC)

Upstream QEMU is moving the location of its NBD docs, as of its commit
XXXX[1].  Instead of pointing to the raw git source file, point to the
rendered html version built from rST.

CC: qemu-devel@nongnu.org
Signed-off-by: Eric Blake <eblake@redhat.com>

---

[1] Commit id TBD, I will update this patch to match reality once
qemu's patch lands, and only push this once the new link actually
exists.  See also
https://lists.gnu.org/archive/html/qemu-devel/2024-08/msg00223.html

---
 doc/proto.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/proto.md b/doc/proto.md
index cf1f60f..565fbeb 100644
--- a/doc/proto.md
+++ b/doc/proto.md
@@ -963,7 +963,7 @@ Namespaces MUST be consist of one of the following:
 Third-party implementations can register additional namespaces by
 simple request to the mailing-list. The following additional
 third-party namespaces are currently registered:
-* `qemu`, maintained by [qemu.org](https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/nbd.txt)
+* `qemu`, maintained by [qemu.org](https://www.qemu.org/docs/master/interop/nbd.html)

 Save in respect of the `base:` namespace described below, this specification
 requires no specific semantics of metadata contexts, except that all the
-- 
2.45.2

