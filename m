Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B151468075
	for <lists+nbd@lfdr.de>; Sat,  4 Dec 2021 00:33:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4D9752016C; Fri,  3 Dec 2021 23:33:37 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec  3 23:33:37 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,URIBL_DBL_SPAM autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3B27B20160
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Dec 2021 23:33:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.427 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, URIBL_DBL_SPAM=2.5]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LNGr6as10QMu for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Dec 2021 23:33:24 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 9916420153
	for <nbd@other.debian.org>; Fri,  3 Dec 2021 23:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638574398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddU8sKSfHn9SWFTU2J+B/O09+Qc7onLR5QWM+HKGoFc=;
	b=OqVMRg9+c8G8+CxscLhZLbu7nzKHal/z9WqTIZE14pEXaeSJhwpZaFvON2OHB2cn+DP1t5
	g35OWzLQTIKyLIdbMDO1x1X/fSLkDSXwjYQboWXumBoEBbXftLwIUP6Fuf512+v5Uq6e0/
	orOx7NF8Y/y6GqlYZXTR0wN07QznxD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-XJxfkzQjMp69cXw4d5-r_Q-1; Fri, 03 Dec 2021 18:17:54 -0500
X-MC-Unique: XJxfkzQjMp69cXw4d5-r_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50F4F801B10;
	Fri,  3 Dec 2021 23:17:52 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 555705DF2B;
	Fri,  3 Dec 2021 23:17:42 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: nbd@other.debian.org,
	qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	vsementsov@virtuozzo.com,
	nsoffer@redhat.com
Subject: [libnbd PATCH 00/13] libnbd patches for NBD_OPT_EXTENDED_HEADERS
Date: Fri,  3 Dec 2021 17:17:28 -0600
Message-Id: <20211203231741.3901263-1-eblake@redhat.com>
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
Resent-Message-ID: <NyzDSFC1jbF.A.hQD.RlqqhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1632
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211203231741.3901263-1-eblake@redhat.com
Resent-Date: Fri,  3 Dec 2021 23:33:37 +0000 (UTC)

Available here: https://repo.or.cz/libnbd/ericb.git/shortlog/refs/tags/exthdr-v1

I also want to do followup patches to teach 'nbdinfo --map' and
'nbdcopy' to utilize 64-bit extents.

Eric Blake (13):
  golang: Simplify nbd_block_status callback array copy
  block_status: Refactor array storage
  protocol: Add definitions for extended headers
  protocol: Prepare to send 64-bit requests
  protocol: Prepare to receive 64-bit replies
  protocol: Accept 64-bit holes during pread
  generator: Add struct nbd_extent in prep for 64-bit extents
  block_status: Track 64-bit extents internally
  block_status: Accept 64-bit extents during block status
  api: Add [aio_]nbd_block_status_64
  api: Add three functions for controlling extended headers
  generator: Actually request extended headers
  interop: Add test of 64-bit block status

 lib/internal.h                                |  31 ++-
 lib/nbd-protocol.h                            |  61 ++++-
 generator/API.ml                              | 237 ++++++++++++++++--
 generator/API.mli                             |   3 +-
 generator/C.ml                                |  24 +-
 generator/GoLang.ml                           |  35 ++-
 generator/Makefile.am                         |   3 +-
 generator/OCaml.ml                            |  20 +-
 generator/Python.ml                           |  29 ++-
 generator/state_machine.ml                    |  52 +++-
 generator/states-issue-command.c              |  31 ++-
 .../states-newstyle-opt-extended-headers.c    |  90 +++++++
 generator/states-newstyle-opt-starttls.c      |  10 +-
 generator/states-reply-structured.c           | 220 ++++++++++++----
 generator/states-reply.c                      |  31 ++-
 lib/handle.c                                  |  27 +-
 lib/rw.c                                      | 105 +++++++-
 python/t/110-defaults.py                      |   3 +-
 python/t/120-set-non-defaults.py              |   4 +-
 python/t/465-block-status-64.py               |  56 +++++
 ocaml/helpers.c                               |  22 +-
 ocaml/nbd-c.h                                 |   3 +-
 ocaml/tests/Makefile.am                       |   5 +-
 ocaml/tests/test_110_defaults.ml              |   4 +-
 ocaml/tests/test_120_set_non_defaults.ml      |   5 +-
 ocaml/tests/test_465_block_status_64.ml       |  58 +++++
 tests/meta-base-allocation.c                  | 111 +++++++-
 interop/Makefile.am                           |   6 +
 interop/large-status.c                        | 186 ++++++++++++++
 interop/large-status.sh                       |  49 ++++
 .gitignore                                    |   1 +
 golang/Makefile.am                            |   3 +-
 golang/handle.go                              |   6 +
 golang/libnbd_110_defaults_test.go            |   8 +
 golang/libnbd_120_set_non_defaults_test.go    |  12 +
 golang/libnbd_465_block_status_64_test.go     | 119 +++++++++
 36 files changed, 1511 insertions(+), 159 deletions(-)
 create mode 100644 generator/states-newstyle-opt-extended-headers.c
 create mode 100644 python/t/465-block-status-64.py
 create mode 100644 ocaml/tests/test_465_block_status_64.ml
 create mode 100644 interop/large-status.c
 create mode 100755 interop/large-status.sh
 create mode 100644 golang/libnbd_465_block_status_64_test.go

-- 
2.33.1

