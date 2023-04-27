Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5EE6F0812
	for <lists+nbd@lfdr.de>; Thu, 27 Apr 2023 17:17:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A56462067E; Thu, 27 Apr 2023 15:17:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr 27 15:17:53 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,
	LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SARE_MSGID_LONG45,SARE_MSGID_LONG50,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DF83F20671
	for <lists-other-nbd@bendel.debian.org>; Thu, 27 Apr 2023 15:17:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.563 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id n3IPWNF3m7OR for <lists-other-nbd@bendel.debian.org>;
	Thu, 27 Apr 2023 15:17:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id B9CBD2066F
	for <nbd@other.debian.org>; Thu, 27 Apr 2023 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682608649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r+17+KTOOVGjge09dstY847TPVDvwXA1kCLuEc8Dqts=;
	b=a0AFTsQ01O0ieae61qX2gnVvECjURK1gfnOmMxDHc+tFWFDzJj6xApcseKKepR/iEgWWux
	ameFQZqWSEoN/iVVAUTcPQ1KrBfuEGT78vt36Q3Jf3gpo9DTX/XABEyiJjZRzdrdyYqJTS
	Fhnyr7OSdTmCLDljQGOqlbg2OOLN0QU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-eDukie4rOsKb8xEVznIMOQ-1; Thu, 27 Apr 2023 11:17:16 -0400
X-MC-Unique: eDukie4rOsKb8xEVznIMOQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EE551C3A074;
	Thu, 27 Apr 2023 15:17:04 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52231492C3E;
	Thu, 27 Apr 2023 15:17:03 +0000 (UTC)
Date: Thu, 27 Apr 2023 10:17:01 -0500
From: Eric Blake <eblake@redhat.com>
To: josef@toxicpanda.com, linux-block@vger.kernel.org, 
	nbd@other.debian.org
Cc: philipp.reisner@linbit.com, lars.ellenberg@linbit.com, 
	christoph.boehmwalder@linbit.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] nbd: s/handle/cookie/
Message-ID: <7xvuavcyhqfygrp3ak3iw5jiatbp3fcrhx6teeyqcrrjhdtjn4@ordpaqvft67k>
References: <20230410180611.1051618-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230410180611.1051618-1-eblake@redhat.com>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gfXIfOk2FPM.A.szH.hIpSkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2456
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/7xvuavcyhqfygrp3ak3iw5jiatbp3fcrhx6teeyqcrrjhdtjn4@ordpaqvft67k
Resent-Date: Thu, 27 Apr 2023 15:17:53 +0000 (UTC)

ping

On Mon, Apr 10, 2023 at 01:06:07PM -0500, Eric Blake wrote:
> v2 was here: https://lkml.org/lkml/2023/3/17/1107
> since then:
> - squash patch 2/5 and 3/5 into 3/4 [Ming]
> - add Josef's R-b
> - tweak commit messages to match commits in userspace NBD (code itself
>   is unchanged, modulo the patch squash)
> 
> Eric Blake (4):
>   uapi nbd: improve doc links to userspace spec
>   uapi nbd: add cookie alias to handle
>   block nbd: use req.cookie instead of req.handle
>   docs nbd: userspace NBD now favors github over sourceforge
> 
>  Documentation/admin-guide/blockdev/nbd.rst |  2 +-
>  drivers/block/nbd.c                        |  6 +++---
>  include/uapi/linux/nbd.h                   | 25 +++++++++++++++++-----
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> 
> base-commit: 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d
> -- 
> 2.39.2
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

