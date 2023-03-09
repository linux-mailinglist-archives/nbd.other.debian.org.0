Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 982056B2F82
	for <lists+nbd@lfdr.de>; Thu,  9 Mar 2023 22:25:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 78F9820606; Thu,  9 Mar 2023 21:25:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar  9 21:25:14 2023
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
	by bendel.debian.org (Postfix) with ESMTP id F08A02066B
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Mar 2023 21:25:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id H-oFtO38Wbyb for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Mar 2023 21:24:56 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 5B4A120606
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678397091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WUjMOZ8G+UhjDeQhf/iWizfSwHQhuZHRbZUSUtffJx8=;
	b=LEgrtLfn3DKzwiOicKpa+QMnEaD1499viOEkuUiXqmR2m0pbwjcTErKQZo0PnUjiJ4Z0AY
	who0NKajcROZvgcW77dEjyZN7OgMaNU3LliN+ETU3DOgQTmuWXoF4ByL9gic9ZSXyAVaAt
	wpubPasgdJDlbU+JKS+jNnWKvBJHvkE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-v3r3P9Q3OtS5guq6jLuAjA-1; Thu, 09 Mar 2023 16:24:50 -0500
X-MC-Unique: v3r3P9Q3OtS5guq6jLuAjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB88319705A8
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:24:49 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.147])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89D9740C1106
	for <nbd@other.debian.org>; Thu,  9 Mar 2023 21:24:49 +0000 (UTC)
Date: Thu, 9 Mar 2023 15:24:47 -0600
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Subject: Re: [PATCH v2 3/3] nbd: Use uint64_t instead of char[8] for cookie
Message-ID: <20230309212447.kncdfctmsff66vav@redhat.com>
References: <20230309210623.2238671-1-eblake@redhat.com>
 <20230309210623.2238671-4-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230309210623.2238671-4-eblake@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <h7dub0pVOpJ.A.ZmG.66kCkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2364
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230309212447.kncdfctmsff66vav@redhat.com
Resent-Date: Thu,  9 Mar 2023 21:25:14 +0000 (UTC)

On Thu, Mar 09, 2023 at 03:06:23PM -0600, Eric Blake wrote:
> Type-punning *(uint64_t*)(char[8]) is unsafe if the pointer is not
> aligned per the requirements of the hardware (x86_64 has 1-byte
> alignment, but other hardware exists that will give a SIGBUS).  In
> practice, it didn't matter - 'struct nbd_request' was already 64-bit
> aligned for 'from' (even before the recent change in commit 739f7121
> to pack it), and 'struct nbd_reply' being packed means the compiler
> emits code to deal with 1-byte alignment despite hardware.  But since
> the cookie is already opaque on the server side, we might as well
> treat it as an 8-byte integer instead of a character array, with no
> visible semantic changes to the client.

Sheesh - not sure why my git setup failed me.  If it helps:

Signed-off-by: Eric Blake <eblake@redhat.com>

> --- a/tests/run/nbd-tester-client.c
> +++ b/tests/run/nbd-tester-client.c

> @@ -720,8 +720,8 @@ int read_packet_check_header(int sock, size_t datasize, long long int curcookie)
>  			 "Received package with incorrect reply_magic. Index of sent packages is %lld (0x%llX), received cookie is %lld (0x%llX). Received magic 0x%lX, expected 0x%lX",
>  			 (long long int)curcookie,
>  			 (long long unsigned int)curcookie,
> -			 (long long int)*((u64 *) rep.cookie),
> -			 (long long unsigned int)*((u64 *) rep.cookie),
> +			 (long long int)rep.cookie,
> +			 (long long unsigned int)rep.cookie,

Is it worth using PRIX64 to cut out the need for casts in these
printf's?  That's a separate cleanup, if desired.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

