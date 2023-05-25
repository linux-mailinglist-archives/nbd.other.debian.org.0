Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C641B710CFE
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 15:07:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A8F7F20504; Thu, 25 May 2023 13:07:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 13:07:54 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CA71A204FA
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 13:07:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.351 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kt3KQ5YGUdwA for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 13:07:34 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 3BD2A2046E
	for <nbd@other.debian.org>; Thu, 25 May 2023 13:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685020049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+2KlzAh6kWohizsxZ6kuBu22kJlQJyJot1T5HFH0VKU=;
	b=SUPpWYJlTGQj6qn91IPhKoddet7A4U2Ku6OvGvnuxwEORjAannSg/mpj7eJ3q0uIYl5eZw
	flLqzMcC3KHkroUH00xRhHHmWNTvwAFgCj0F/6WF+PqC/8OyAAM5BvcjwnaFvRmIJmNsKG
	9yxwpxLatOBmFTh2BDBOfdcK+lFG79E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-F-b6wSnSNjOi-8wZLSQmqw-1; Thu, 25 May 2023 09:01:12 -0400
X-MC-Unique: F-b6wSnSNjOi-8wZLSQmqw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFC78101A585;
	Thu, 25 May 2023 13:01:08 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98AC1492B0B;
	Thu, 25 May 2023 13:01:08 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v3 00/22] NBD 64-bit extensions (libnbd portion)
Date: Thu, 25 May 2023 08:00:46 -0500
Message-Id: <20230525130108.757242-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JKv0k09_W5N.A.bEG.q21bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2498
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230525130108.757242-1-eblake@redhat.com
Resent-Date: Thu, 25 May 2023 13:07:54 +0000 (UTC)

v2 was here:
https://listman.redhat.com/archives/libguestfs/2022-November/030292.html

For v3, there are now approved specs to code to:
https://listman.redhat.com/archives/libguestfs/2023-April/031251.html
visible on an upstream branch at
https://github.com/NetworkBlockDevice/nbd/blob/extension-ext-header/doc/proto.md
(upstream leaves extensions in a branch state until there are multiple
implementations that comply with that extension)

as well as interoperability with counterpart qemu patches:
https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg03607.html
also available at
https://repo.or.cz/qemu/ericb.git/shortlog/refs/tags/exthdr-v3

I'm still working on adding extended header support into nbdkit, which
will involve adding a v3 protocol for plugins; that work is probably
much further out.

Changes since v2:
001/22:[0002] [FC] 'block_status: Refactor array storage'
002/22:[0016] [FC] 'internal: Refactor layout of replies in sbuf'
003/22:[0002] [FC] 'protocol: Add definitions for extended headers'
004/22:[0006] [FC] 'states: Prepare to send 64-bit requests'
005/22:[0013] [FC] 'states: Prepare to receive 64-bit replies'
006/22:[0007] [FC] 'states: Break deadlock if server goofs on extended replies'
007/22:[0021] [FC] 'generator: Add struct nbd_extent in prep for 64-bit extents'
008/22:[----] [-C] 'block_status: Track 64-bit extents internally'
009/22:[0012] [FC] 'block_status: Accept 64-bit extents during block status'
010/22:[0063] [FC] 'api: Add [aio_]nbd_block_status_64'
011/22:[0006] [FC] 'api: Add several functions for controlling extended headers'
012/22:[----] [--] 'copy: Update nbdcopy to use 64-bit block status'
013/22:[0004] [FC] 'dump: Update nbddump to use 64-bit block status'
014/22:[----] [--] 'info: Expose extended-headers support through nbdinfo'
015/22:[0006] [FC] 'info: Update nbdinfo --map to use 64-bit block status'
016/22:[----] [-C] 'examples: Update copy-libev to use 64-bit block status'
017/22:[0002] [FC] 'ocaml: Add example for 64-bit extents'
018/22:[0004] [FC] 'generator: Actually request extended headers'
019/22:[0008] [FC] 'api: Add nbd_[aio_]opt_extended_headers()'
020/22:[0004] [FC] 'interop: Add test of 64-bit block status'
021/22:[0011] [FC] 'api: Add nbd_can_block_status_payload()'
022/22:[0004] [FC] 'api: Add nbd_[aio_]block_status_filter()'

The changes are mostly fallout from rebasing on top of style cleanups
that Laszlo has been working on, but also deal with some changes with
the spec compared to how it was proposed in v2 (for example, upstream
decided that for NBD_CMD_BLOCK_STATUS, the server should always use
64-bit replies, rather than making the client support both 32- and
64-bit replies).

Eric Blake (22):
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

 docs/libnbd.pod                               |  18 +-
 info/nbdinfo.pod                              |  21 +-
 sh/nbdsh.pod                                  |   2 +-
 lib/internal.h                                |  41 +-
 lib/nbd-protocol.h                            | 112 +++-
 generator/API.mli                             |   1 +
 generator/API.ml                              | 534 +++++++++++++++---
 generator/C.ml                                |  24 +-
 generator/GoLang.ml                           |  24 +
 generator/Makefile.am                         |   1 +
 generator/OCaml.ml                            |  23 +-
 generator/Python.ml                           |  20 +-
 generator/state_machine.ml                    |  50 +-
 generator/states-issue-command.c              |  33 +-
 .../states-newstyle-opt-extended-headers.c    | 110 ++++
 generator/states-newstyle-opt-starttls.c      |   7 +-
 .../states-newstyle-opt-structured-reply.c    |   3 +-
 generator/states-newstyle.c                   |   3 +
 generator/states-reply-simple.c               |   4 +-
 generator/states-reply-structured.c           | 253 ++++++---
 generator/states-reply.c                      |  69 ++-
 lib/aio.c                                     |   7 +-
 lib/flags.c                                   |  12 +
 lib/handle.c                                  |  25 +-
 lib/opt.c                                     |  44 ++
 lib/rw.c                                      | 250 +++++++-
 python/t/110-defaults.py                      |   1 +
 python/t/120-set-non-defaults.py              |   2 +
 python/t/465-block-status-64.py               |  56 ++
 ocaml/examples/Makefile.am                    |   1 +
 ocaml/examples/extents64.ml                   |  42 ++
 ocaml/helpers.c                               |  20 +
 ocaml/nbd-c.h                                 |   1 +
 ocaml/tests/Makefile.am                       |   1 +
 ocaml/tests/test_110_defaults.ml              |   2 +
 ocaml/tests/test_120_set_non_defaults.ml      |   3 +
 ocaml/tests/test_465_block_status_64.ml       |  58 ++
 tests/Makefile.am                             |   4 +
 tests/meta-base-allocation.c                  | 104 +++-
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
 fuzzing/libnbd-fuzz-wrapper.c                 |  20 +-
 golang/Makefile.am                            |   1 +
 golang/handle.go                              |   6 +
 golang/libnbd_110_defaults_test.go            |   8 +
 golang/libnbd_120_set_non_defaults_test.go    |  12 +
 golang/libnbd_465_block_status_64_test.go     | 119 ++++
 info/can.c                                    |  14 +
 info/info-can.sh                              |  30 +
 info/info-packets.sh                          |  17 +-
 info/main.c                                   |   7 +-
 info/map.c                                    |  65 ++-
 info/show.c                                   |   9 +-
 64 files changed, 2892 insertions(+), 351 deletions(-)
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


base-commit: 17d0bc6a71bbc67f3d7707d129bec4acf7e7a382
-- 
2.40.1

