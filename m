Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 305509B248
	for <lists+nbd@lfdr.de>; Fri, 23 Aug 2019 16:41:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D9889204F5; Fri, 23 Aug 2019 14:41:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 23 14:41:10 2019
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A00ED204F6
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Aug 2019 14:41:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HvIti5MOsI6O for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Aug 2019 14:41:01 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1B084204E7
	for <nbd@other.debian.org>; Fri, 23 Aug 2019 14:41:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A874310C0217;
	Fri, 23 Aug 2019 14:40:57 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-234.phx2.redhat.com [10.3.116.234])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4853860126;
	Fri, 23 Aug 2019 14:40:55 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org,
	nbd@other.debian.org
Subject: [nbdkit PATCH 0/3] nbdkit support for new NBD fast zero
Date: Fri, 23 Aug 2019 09:40:51 -0500
Message-Id: <20190823144054.27420-1-eblake@redhat.com>
In-Reply-To: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Fri, 23 Aug 2019 14:40:57 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UB2QHKIB8rC.A.43C.Gs_XdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/641
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190823144054.27420-1-eblake@redhat.com
Resent-Date: Fri, 23 Aug 2019 14:41:10 +0000 (UTC)

See the cross-post cover letter for details:
https://www.redhat.com/archives/libguestfs/2019-August/msg00322.html

Notably, this series did NOT add fast zero support to the file plugin
yet; there, I probably need to do more testing and/or kernel source
code reading to learn whether to mark fallocate() as potentially slow,
as well as to definitely mark ioctl(BLKZEROOUT) as definitely slow.
That will be a followup patch.

Eric Blake (3):
  server: Add internal support for NBDKIT_FLAG_FAST_ZERO
  filters: Add .can_fast_zero hook
  plugins: Add .can_fast_zero hook

 docs/nbdkit-filter.pod                  |  27 ++++--
 docs/nbdkit-plugin.pod                  |  74 +++++++++++---
 docs/nbdkit-protocol.pod                |  11 +++
 filters/delay/nbdkit-delay-filter.pod   |  15 ++-
 filters/log/nbdkit-log-filter.pod       |   2 +-
 filters/nozero/nbdkit-nozero-filter.pod |  41 ++++++--
 plugins/sh/nbdkit-sh-plugin.pod         |  13 ++-
 server/internal.h                       |   2 +
 common/protocol/protocol.h              |  11 ++-
 server/filters.c                        |  33 ++++++-
 server/plugins.c                        |  47 ++++++++-
 server/protocol-handshake.c             |   7 ++
 server/protocol.c                       |  46 +++++++--
 include/nbdkit-common.h                 |   7 +-
 include/nbdkit-filter.h                 |   3 +
 include/nbdkit-plugin.h                 |   2 +
 filters/blocksize/blocksize.c           |  12 +++
 filters/cache/cache.c                   |  20 ++++
 filters/cow/cow.c                       |  20 ++++
 filters/delay/delay.c                   |  28 +++++-
 filters/log/log.c                       |  16 ++--
 filters/nozero/nozero.c                 |  62 +++++++++++-
 filters/truncate/truncate.c             |  15 +++
 plugins/data/data.c                     |  14 ++-
 plugins/full/full.c                     |  12 +--
 plugins/memory/memory.c                 |  14 ++-
 plugins/nbd/nbd.c                       |  28 +++++-
 plugins/null/null.c                     |   8 ++
 plugins/ocaml/ocaml.c                   |  26 ++++-
 plugins/sh/call.c                       |   1 -
 plugins/sh/sh.c                         |  39 ++++++--
 plugins/ocaml/NBDKit.ml                 |  10 +-
 plugins/ocaml/NBDKit.mli                |   2 +
 plugins/rust/src/lib.rs                 |   3 +
 tests/test-eflags.sh                    | 122 +++++++++++++++++++++---
 tests/test-fua.sh                       |   4 +-
 36 files changed, 686 insertions(+), 111 deletions(-)

-- 
2.21.0

