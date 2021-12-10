Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED646FD4D
	for <lists+nbd@lfdr.de>; Fri, 10 Dec 2021 10:03:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A1AF820488; Fri, 10 Dec 2021 09:03:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec 10 09:03:10 2021
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2D10B20499
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Dec 2021 08:47:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.93 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jo0qVZ1byAJj for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Dec 2021 08:47:21 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id D57E120498
	for <nbd@other.debian.org>; Fri, 10 Dec 2021 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639126035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BtVKI6bTUkHVwXDC+LLV0tCgs1vUuOx16hxfyLsVNaI=;
	b=bzEtRH4yRzvmU2dBUKqrCOu+J47ZC0ePxJHCwsFV2fl6Va2EeHfRq5fKE+RB47o+QVUyb1
	lDkeG/tfiV9pQEONQ0Ie+tzNbJq9gkCPPfEYHZgbx3z8NVdJnij1+HpjRQZnLYatW7Q0vE
	snZPQ4vMY/QYbOkUL+fCDql96bc7Aro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-19xnA-cSN1Oto6Ij-zpsZQ-1; Fri, 10 Dec 2021 03:16:27 -0500
X-MC-Unique: 19xnA-cSN1Oto6Ij-zpsZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EE98802CBB;
	Fri, 10 Dec 2021 08:16:26 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.165])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EACB71000180;
	Fri, 10 Dec 2021 08:16:04 +0000 (UTC)
Subject: Re: [Libguestfs] [libnbd PATCH 00/13] libnbd patches for
 NBD_OPT_EXTENDED_HEADERS
To: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Cc: vsementsov@virtuozzo.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 nbd@other.debian.org
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231741.3901263-1-eblake@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <81612544-c1ce-8fc7-5446-c6205b99680b@redhat.com>
Date: Fri, 10 Dec 2021 09:16:02 +0100
MIME-Version: 1.0
In-Reply-To: <20211203231741.3901263-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7LfmOv5IS9K.A.m3C.OfxshB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1656
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/81612544-c1ce-8fc7-5446-c6205b99680b@redhat.com
Resent-Date: Fri, 10 Dec 2021 09:03:10 +0000 (UTC)

On 12/04/21 00:17, Eric Blake wrote:
> Available here: https://repo.or.cz/libnbd/ericb.git/shortlog/refs/tags/exthdr-v1
> 
> I also want to do followup patches to teach 'nbdinfo --map' and
> 'nbdcopy' to utilize 64-bit extents.
> 
> Eric Blake (13):
>   golang: Simplify nbd_block_status callback array copy
>   block_status: Refactor array storage
>   protocol: Add definitions for extended headers
>   protocol: Prepare to send 64-bit requests
>   protocol: Prepare to receive 64-bit replies
>   protocol: Accept 64-bit holes during pread
>   generator: Add struct nbd_extent in prep for 64-bit extents
>   block_status: Track 64-bit extents internally
>   block_status: Accept 64-bit extents during block status
>   api: Add [aio_]nbd_block_status_64
>   api: Add three functions for controlling extended headers
>   generator: Actually request extended headers
>   interop: Add test of 64-bit block status
> 
>  lib/internal.h                                |  31 ++-
>  lib/nbd-protocol.h                            |  61 ++++-
>  generator/API.ml                              | 237 ++++++++++++++++--
>  generator/API.mli                             |   3 +-
>  generator/C.ml                                |  24 +-
>  generator/GoLang.ml                           |  35 ++-
>  generator/Makefile.am                         |   3 +-
>  generator/OCaml.ml                            |  20 +-
>  generator/Python.ml                           |  29 ++-
>  generator/state_machine.ml                    |  52 +++-
>  generator/states-issue-command.c              |  31 ++-
>  .../states-newstyle-opt-extended-headers.c    |  90 +++++++
>  generator/states-newstyle-opt-starttls.c      |  10 +-
>  generator/states-reply-structured.c           | 220 ++++++++++++----
>  generator/states-reply.c                      |  31 ++-
>  lib/handle.c                                  |  27 +-
>  lib/rw.c                                      | 105 +++++++-
>  python/t/110-defaults.py                      |   3 +-
>  python/t/120-set-non-defaults.py              |   4 +-
>  python/t/465-block-status-64.py               |  56 +++++
>  ocaml/helpers.c                               |  22 +-
>  ocaml/nbd-c.h                                 |   3 +-
>  ocaml/tests/Makefile.am                       |   5 +-
>  ocaml/tests/test_110_defaults.ml              |   4 +-
>  ocaml/tests/test_120_set_non_defaults.ml      |   5 +-
>  ocaml/tests/test_465_block_status_64.ml       |  58 +++++
>  tests/meta-base-allocation.c                  | 111 +++++++-
>  interop/Makefile.am                           |   6 +
>  interop/large-status.c                        | 186 ++++++++++++++
>  interop/large-status.sh                       |  49 ++++
>  .gitignore                                    |   1 +
>  golang/Makefile.am                            |   3 +-
>  golang/handle.go                              |   6 +
>  golang/libnbd_110_defaults_test.go            |   8 +
>  golang/libnbd_120_set_non_defaults_test.go    |  12 +
>  golang/libnbd_465_block_status_64_test.go     | 119 +++++++++
>  36 files changed, 1511 insertions(+), 159 deletions(-)
>  create mode 100644 generator/states-newstyle-opt-extended-headers.c
>  create mode 100644 python/t/465-block-status-64.py
>  create mode 100644 ocaml/tests/test_465_block_status_64.ml
>  create mode 100644 interop/large-status.c
>  create mode 100755 interop/large-status.sh
>  create mode 100644 golang/libnbd_465_block_status_64_test.go
> 

I figured I should slowly / gradually review this series, and as a
*pre-requisite* for it, first apply the spec patch, and then read
through the spec with something like

$ git show --color -U1000

In other words, read the whole spec, just highlight the new additions.

Now, I see Vladimir has made several comments on the spec patch; will
those comments necessitate a respin of the libnbd series? If so, how
intrusive are the changes going to be? I'm hesitant to start my review
if significant changes are already foreseen.

Thanks,
Laszlo

