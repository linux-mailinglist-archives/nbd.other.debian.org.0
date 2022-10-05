Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 925CA5F5A95
	for <lists+nbd@lfdr.de>; Wed,  5 Oct 2022 21:27:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 07D67205DC; Wed,  5 Oct 2022 19:27:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct  5 19:27:07 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B9CCC205A0
	for <lists-other-nbd@bendel.debian.org>; Wed,  5 Oct 2022 19:26:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.363 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1,
	DKIMWL_WL_HIGH=-0.083, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id TSQ19sZVBJuc for <lists-other-nbd@bendel.debian.org>;
	Wed,  5 Oct 2022 19:26:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 1997520590
	for <nbd@other.debian.org>; Wed,  5 Oct 2022 19:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664998004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TKZ/5VxN+zrWKP/EWJ278lz8A3zRoVsMKN2k6yL/bu8=;
	b=NOuNgwfIcugrdHp80AR9hDtzCcgkYCAAvTlQBb6eOWWfl2iXaC+4jM1JScHPt6frcbBsbl
	x83CyPbDitemynKrtO4tegMK3kKCQgUp1YoxHJbGEY9V97iJlYFJU59FshKqd+WUR6KYNz
	GYVh7U1hPiUcTeQaF4PHLdB1ZTvbi88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-265-fNbftnX_Ph6pWanBcrJZXg-1; Wed, 05 Oct 2022 15:26:41 -0400
X-MC-Unique: fNbftnX_Ph6pWanBcrJZXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 595C6101A528;
	Wed,  5 Oct 2022 19:26:41 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9315717585;
	Wed,  5 Oct 2022 19:26:40 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: =?UTF-8?q?=E5=90=95=E6=A2=A6=E6=98=AD10286442?= <lv.mengzhao@zte.com.cn>
Subject: [PATCH] tests: Fix typo in recent test change
Date: Wed,  5 Oct 2022 14:26:35 -0500
Message-Id: <20221005192635.2879334-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zkwKj6NNQIC.A.CNB.LqdPjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2233
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221005192635.2879334-1-eblake@redhat.com
Resent-Date: Wed,  5 Oct 2022 19:27:08 +0000 (UTC)

A missing } caused 'make check' to fail.  While at it, use TAB
consistently.

Fixes: af309d8a ("nbd-server: fix bug in auth for v6-mapped IPv4 addresses")
CC: 吕梦昭10286442 <lv.mengzhao@zte.com.cn>
Signed-off-by: Eric Blake <eblake@redhat.com>
---

Pushed as obvious.

 tests/code/clientacl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/code/clientacl.c b/tests/code/clientacl.c
index 3bceb2f..da614fd 100644
--- a/tests/code/clientacl.c
+++ b/tests/code/clientacl.c
@@ -29,8 +29,9 @@ bool do_test(char* address, char* netmask) {
 	while(res) {
 		if((err = getnameinfo((struct sockaddr*)res->ai_addr, res->ai_addrlen, buf,
                                        sizeof (buf), NULL, 0, NI_NUMERICHOST))) {
-                        fprintf(stderr, "E: %s\n", gai_strerror(err));
-                        exit(EXIT_FAILURE);
+			fprintf(stderr, "E: %s\n", gai_strerror(err));
+			exit(EXIT_FAILURE);
+		}

 		printf("Found %s\n", buf);

-- 
2.37.3

