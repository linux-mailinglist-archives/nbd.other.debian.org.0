Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F8F628D13
	for <lists+nbd@lfdr.de>; Tue, 15 Nov 2022 00:04:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DA6572067F; Mon, 14 Nov 2022 23:04:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 23:04:40 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 8E6B12066B
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 23:04:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.696 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.515, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hYZrK_uPPXL4 for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 23:04:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id B7DCA20545
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 23:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668467058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XRP8SoUQK2UbFrLAVubx17NxzDIvuhaHb/czom7cG6I=;
	b=Q7fRRKsv84fQ/sF/hL8bpkP0umvIje27oCCc2Nf69I66qFzhJltLdhWDG3A7fbUXeeZMYt
	IKGWRzRvU5HJ5ih/4w+Q5pN3i8d8edK+XWieGnwRB7EzPM7lITrTLwBM93nyi9F3vDH4xa
	pJEGDyHZfyOBcNufgq/MAYZMfaMhyHg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-c4HjLoCZOEmVs2jUUNRfvQ-1; Mon, 14 Nov 2022 17:48:52 -0500
X-MC-Unique: c4HjLoCZOEmVs2jUUNRfvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 187FB87B2A1;
	Mon, 14 Nov 2022 22:48:51 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A524340B48EA;
	Mon, 14 Nov 2022 22:48:50 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	nbd@other.debian.org
Subject: [PATCH v2 00/15] qemu patches for 64-bit NBD extensions
Date: Mon, 14 Nov 2022 16:48:33 -0600
Message-Id: <20221114224848.2186298-1-eblake@redhat.com>
In-Reply-To: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1brHmpj3rHC.A.ltD.ImscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2282
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114224848.2186298-1-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 23:04:40 +0000 (UTC)

This series implements the spec changes in a counterpart NBD series,
and has been tested to be interoperable with libnbd implementing the
same spec.  I'm not too happy with the RFC patch at the end, but
implemented it for discussion.  Given the release timing, this would
be qemu 8.0 material if we are happy with the direction the spec is
headed in.

Eric Blake (15):
  nbd/client: Add safety check on chunk payload length
  nbd/server: Prepare for alternate-size headers
  nbd: Prepare for 64-bit request effect lengths
  nbd: Add types for extended headers
  nbd/server: Refactor handling of request payload
  nbd/server: Refactor to pass full request around
  nbd/server: Initial support for extended headers
  nbd/server: Support 64-bit block status
  nbd/client: Initial support for extended headers
  nbd/client: Accept 64-bit block status chunks
  nbd/client: Request extended headers during negotiation
  nbd/server: Prepare for per-request filtering of BLOCK_STATUS
  nbd/server: Add FLAG_PAYLOAD support to CMD_BLOCK_STATUS
  RFC: nbd/client: Accept 64-bit hole chunks
  RFC: nbd/server: Send 64-bit hole chunk

 docs/interop/nbd.txt                          |   1 +
 include/block/nbd.h                           | 163 +++--
 nbd/nbd-internal.h                            |   8 +-
 block/nbd.c                                   | 102 ++-
 nbd/client-connection.c                       |   1 +
 nbd/client.c                                  | 132 +++-
 nbd/common.c                                  |  14 +-
 nbd/server.c                                  | 636 +++++++++++++-----
 qemu-nbd.c                                    |   3 +
 block/trace-events                            |   1 +
 nbd/trace-events                              |  11 +-
 tests/qemu-iotests/223.out                    |  18 +-
 tests/qemu-iotests/233.out                    |   5 +
 tests/qemu-iotests/241.out                    |   3 +
 tests/qemu-iotests/307.out                    |  15 +-
 .../tests/nbd-qemu-allocation.out             |   3 +-
 16 files changed, 797 insertions(+), 319 deletions(-)

-- 
2.38.1

