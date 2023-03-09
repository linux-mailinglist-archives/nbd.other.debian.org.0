Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DC86B2F40
	for <lists+nbd@lfdr.de>; Thu,  9 Mar 2023 22:06:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D984E2066A; Thu,  9 Mar 2023 21:06:51 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  9 21:06:51 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5B2CA20668
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Mar 2023 21:06:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Vp1ST7hTrc3g for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Mar 2023 21:06:34 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id F2B5920663
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678395989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5pd1Db8AbK1O+xDTtfJYUynK64yM0NBJagnoGwDckJI=;
	b=KqMicAWr46nuLlKSygHZvCtxgO4Y+9CRIwjlzpEJa5wBH04SsbAtwAA2qKInjCecq2NQ4w
	OvdYlFcGl9cuOK/ipfUL51RAcowg3Kv3YY1226cTxXf/IkNbAuaSoqIXvZp7ZOTQrdPC/o
	nIRavoZBAdKznZ6iJJ2wALE+BIX+/TA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-vYdK8Uw8MCiqIQ5SXcofvg-1; Thu, 09 Mar 2023 16:06:25 -0500
X-MC-Unique: vYdK8Uw8MCiqIQ5SXcofvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7751138173CE
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:06:24 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 447F01121330
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:06:24 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: [PATCH v2 0/3] Prefer 'cookie' over 'handle'
Date: Thu,  9 Mar 2023 15:06:20 -0600
Message-Id: <20230309210623.2238671-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SBFQKcJKQz.A.wlE.rpkCkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2359
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230309210623.2238671-1-eblake@redhat.com
Resent-Date: Thu,  9 Mar 2023 21:06:51 +0000 (UTC)

In v2 - tweak the docs to add the tie back to our old use of 'handle',
and then take the advice to heart by actually using the preferred name
in the code base.

Eric Blake (3):
  docs: Prefer 'cookie' over 'handle'
  nbd: s/handle/cookie/g when referring to opaque client id
  nbd: Use uint64_t instead of char[8] for cookie

 doc/proto.md                  | 24 ++++++-----
 nbd-server.c                  |  4 +-
 nbd-trdump.c                  | 12 +++---
 nbd-trplay.c                  | 12 +++---
 nbd.h                         |  4 +-
 tests/run/nbd-tester-client.c | 75 +++++++++++++++++------------------
 6 files changed, 65 insertions(+), 66 deletions(-)

-- 
2.39.2

