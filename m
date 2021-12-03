Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 17807468063
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:31:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0027B2016F; Fri,  3 Dec 2021 23:31:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:31:34 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AC3F520153
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:31:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.93 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KmJ-Wnjv7d7I for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:31:21 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 165E92015F
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/swSY4aIRFkW/igmZfIQDRtVC1IDKdCkhFXOOYZMe8=;
	b=eEM5hFA6YSBhN+XamPiz+oWDTyyj0030kHq2ssgb/REPuwPHraPrZ4Vef9Nk+pFxZZE9qf
	tHlw+bqK5VR2gNQqabFCroA07zY9MnRhfWunS9L3NW8sg/rOwFwT6Um4dalP9NstHnwzTA
	AQZCS+LjVk9qHSv08FGwuthg72hivf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-m1WECe-oNlOg2w4LdB2Y4A-1; Fri, 03 Dec 2021 18:15:49 -0500
X-MC-Unique: m1WECe-oNlOg2w4LdB2Y4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8788285EE62;
	Fri,  3 Dec 2021 23:15:48 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65EE55D9D5;
	Fri,  3 Dec 2021 23:15:40 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: nbd@other.debian.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	libguestfs@redhat.com,
	nsoffer@redhat.com
Subject: [PATCH 00/14] qemu patches for NBD_OPT_EXTENDED_HEADERS
Date: Fri,  3 Dec 2021 17:15:25 -0600
Message-Id: <20211203231539.3900865-1-eblake@redhat.com>
In-Reply-To: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
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
Resent-Message-ID: <2Xs0ZV166OG.A.I3C.WjqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1618
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231539.3900865-1-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:31:35 +0000 (UTC)

Available at https://repo.or.cz/qemu/ericb.git/shortlog/refs/tags/exthdr-v1

Patch 14 is optional; I'm including it now because I tested with it,
but I'm also okay with dropping it based on RFC discussion.

Eric Blake (14):
  nbd/server: Minor cleanups
  qemu-io: Utilize 64-bit status during map
  qemu-io: Allow larger write zeroes under no fallback
  nbd/client: Add safety check on chunk payload length
  nbd/server: Prepare for alternate-size headers
  nbd: Prepare for 64-bit requests
  nbd: Add types for extended headers
  nbd/server: Initial support for extended headers
  nbd/server: Support 64-bit block status
  nbd/client: Initial support for extended headers
  nbd/client: Accept 64-bit hole chunks
  nbd/client: Accept 64-bit block status chunks
  nbd/client: Request extended headers during negotiation
  do not apply: nbd/server: Send 64-bit hole chunk

 docs/interop/nbd.txt                          |   1 +
 include/block/nbd.h                           |  94 +++++--
 nbd/nbd-internal.h                            |   8 +-
 block/nbd.c                                   | 102 +++++--
 nbd/client-connection.c                       |   1 +
 nbd/client.c                                  | 150 +++++++---
 nbd/common.c                                  |  10 +-
 nbd/server.c                                  | 262 +++++++++++++-----
 qemu-io-cmds.c                                |  16 +-
 qemu-nbd.c                                    |   2 +
 block/trace-events                            |   1 +
 nbd/trace-events                              |   9 +-
 tests/qemu-iotests/223.out                    |   4 +
 tests/qemu-iotests/233.out                    |   1 +
 tests/qemu-iotests/241                        |   8 +-
 tests/qemu-iotests/307                        |   2 +-
 tests/qemu-iotests/307.out                    |   5 +
 .../tests/nbd-qemu-allocation.out             |   1 +
 18 files changed, 486 insertions(+), 191 deletions(-)

-- 
2.33.1

