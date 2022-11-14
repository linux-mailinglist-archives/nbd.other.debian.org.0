Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8E9628C76
	for <lists+nbd@lfdr.de>; Mon, 14 Nov 2022 23:59:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1EE2420684; Mon, 14 Nov 2022 22:59:02 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov 14 22:59:02 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B18E22067E
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Nov 2022 22:58:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.596 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.515, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Wi1iaKiQv_Nu for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Nov 2022 22:58:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id B27F320545
	for <nbd@other.debian.org>; Mon, 14 Nov 2022 22:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668466698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ngcXD27AEj6AUFTargWKnxPC2tw6mUXN6suLoL8CxiI=;
	b=f34zjVeQctg2UQBGmgReNO2wNeMRlc29t2QWLv4Sm8fI7OQxC6AttNrmGNUZ4IWfPYRqAq
	NSPkI+77IIDZ2m29jlTcZp+A/omEaWcjwyvaMBa+LYkZkN2K0992pf6XcIQ6GUR8LtL5R+
	qhF4GM4j88BUcgo97V78gzlQTBv2oZA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-EUkHWdQUMmGGGOzBtpdYMQ-1; Mon, 14 Nov 2022 17:52:02 -0500
X-MC-Unique: EUkHWdQUMmGGGOzBtpdYMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D56F687B2A1;
	Mon, 14 Nov 2022 22:52:01 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66CE240E9786;
	Mon, 14 Nov 2022 22:52:01 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 00/23] libnbd 64-bit NBD extensions
Date: Mon, 14 Nov 2022 16:51:35 -0600
Message-Id: <20221114225158.2186742-1-eblake@redhat.com>
In-Reply-To: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gdIgVmrta7J.A.IQB.2gscjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2253
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221114225158.2186742-1-eblake@redhat.com
Resent-Date: Mon, 14 Nov 2022 22:59:02 +0000 (UTC)

This series is posted alongside a spec change to NBD, and
interoperable with changes posted to qemu-nbd/qemu-storage-daemon.
The RFC patch at the end is optional; ineroperability with qemu works
only when either both projects omit the RFC patch, or when both
projects include it (if only one of the two RFC projects include it,
the protocol is incompatible between the two, but at least client and
server gracefully detect the bug rather than SEGV'ing).

Eric Blake (23):
  block_status: Refactor array storage
  internal: Refactor layout of replies in sbuf
  protocol: Add definitions for extended headers
  states: Prepare to send 64-bit requests
  states: Prepare to receive 64-bit replies
  states: Break deadlock if server goofs on extended replies
  generator: Add struct nbd_extent in prep for 64-bit extents
  block_status: Track 64-bit extents internally
  block_status: Accept 64-bit extents during block status
  api: Add [aio_]nbd_block_status_64
  api: Add several functions for controlling extended headers
  copy: Update nbdcopy to use 64-bit block status
  dump: Update nbddump to use 64-bit block status
  info: Expose extended-headers support through nbdinfo
  info: Update nbdinfo --map to use 64-bit block status
  examples: Update copy-libev to use 64-bit block status
  ocaml: Add example for 64-bit extents
  generator: Actually request extended headers
  api: Add nbd_[aio_]opt_extended_headers()
  interop: Add test of 64-bit block status
  api: Add nbd_can_block_status_payload()
  api: Add nbd_[aio_]block_status_filter()
  RFC: pread: Accept 64-bit holes

 docs/libnbd.pod                               |  18 +-
 info/nbdinfo.pod                              |  21 +-
 sh/nbdsh.pod                                  |   2 +-
 lib/internal.h                                |  42 +-
 lib/nbd-protocol.h                            | 120 ++--
 generator/API.ml                              | 532 +++++++++++++++---
 generator/API.mli                             |   1 +
 generator/C.ml                                |  24 +-
 generator/GoLang.ml                           |  24 +
 generator/Makefile.am                         |   3 +-
 generator/OCaml.ml                            |  18 +-
 generator/Python.ml                           |  20 +-
 generator/state_machine.ml                    |  50 +-
 generator/states-issue-command.c              |  33 +-
 .../states-newstyle-opt-extended-headers.c    | 110 ++++
 generator/states-newstyle-opt-starttls.c      |   7 +-
 .../states-newstyle-opt-structured-reply.c    |   3 +-
 generator/states-newstyle.c                   |   3 +
 generator/states-reply-simple.c               |   4 +-
 generator/states-reply-structured.c           | 279 ++++++---
 generator/states-reply.c                      |  57 +-
 lib/aio.c                                     |   7 +-
 lib/flags.c                                   |  11 +
 lib/handle.c                                  |  25 +-
 lib/opt.c                                     |  44 ++
 lib/rw.c                                      | 250 +++++++-
 python/t/110-defaults.py                      |   1 +
 python/t/120-set-non-defaults.py              |   2 +
 python/t/465-block-status-64.py               |  56 ++
 ocaml/examples/Makefile.am                    |   3 +-
 ocaml/examples/extents64.ml                   |  42 ++
 ocaml/helpers.c                               |  20 +
 ocaml/nbd-c.h                                 |   3 +-
 ocaml/tests/Makefile.am                       |   1 +
 ocaml/tests/test_110_defaults.ml              |   2 +
 ocaml/tests/test_120_set_non_defaults.ml      |   3 +
 ocaml/tests/test_465_block_status_64.ml       |  58 ++
 tests/Makefile.am                             |   4 +
 tests/meta-base-allocation.c                  | 111 +++-
 tests/pwrite-extended.c                       | 112 ++++
 examples/copy-libev.c                         |  21 +-
 examples/server-flags.c                       |   7 +-
 interop/Makefile.am                           |  18 +
 interop/block-status-payload.c                | 241 ++++++++
 interop/block-status-payload.sh               |  80 +++
 interop/large-status.c                        | 186 ++++++
 interop/large-status.sh                       |  49 ++
 interop/opt-extended-headers.c                | 153 +++++
 interop/opt-extended-headers.sh               |  29 +
 .gitignore                                    |   4 +
 copy/nbd-ops.c                                |  22 +-
 dump/dump.c                                   |  27 +-
 fuzzing/libnbd-fuzz-wrapper.c                 |  22 +-
 golang/Makefile.am                            |   1 +
 golang/handle.go                              |   8 +-
 golang/libnbd_110_defaults_test.go            |   8 +
 golang/libnbd_120_set_non_defaults_test.go    |  12 +
 golang/libnbd_465_block_status_64_test.go     | 119 ++++
 info/can.c                                    |  14 +
 info/info-can.sh                              |  30 +
 info/info-packets.sh                          |  17 +-
 info/main.c                                   |   7 +-
 info/map.c                                    |  67 +--
 info/show.c                                   |   9 +-
 64 files changed, 2920 insertions(+), 357 deletions(-)
 create mode 100644 generator/states-newstyle-opt-extended-headers.c
 create mode 100644 python/t/465-block-status-64.py
 create mode 100644 ocaml/examples/extents64.ml
 create mode 100644 ocaml/tests/test_465_block_status_64.ml
 create mode 100644 tests/pwrite-extended.c
 create mode 100644 interop/block-status-payload.c
 create mode 100755 interop/block-status-payload.sh
 create mode 100644 interop/large-status.c
 create mode 100755 interop/large-status.sh
 create mode 100644 interop/opt-extended-headers.c
 create mode 100755 interop/opt-extended-headers.sh
 create mode 100644 golang/libnbd_465_block_status_64_test.go

-- 
2.38.1

