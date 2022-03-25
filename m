Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBD64E7A8D
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 20:58:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1A9B320443; Fri, 25 Mar 2022 19:58:54 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 19:58:54 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1671220425
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 19:58:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.605 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.517, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rzILN0F74XDb for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 19:58:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id D0BF920424
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 19:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648238314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9SmzHOZk5bqAeLVMRBdUPXDm+0oI7XaoAe+4Z5EDQXY=;
	b=IuhcMyiTJHxddPlRrB5hTDlT92Em+KyJgUA9L5aO4ScbNMSsAMiovIAIxK4WWPtsLAQ0ow
	UCtb+DRrWaoEraMUW7BUDEpyCHK1nH+308BBpszicd53B+Tv6BBfShIjnhGLIeDr6BW0n7
	SBDV4aVi38G5uqGMdY9mXyqvmsD8W4c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-g6EyZg9cNZmeAxh3-2xj2g-1; Fri, 25 Mar 2022 15:58:30 -0400
X-MC-Unique: g6EyZg9cNZmeAxh3-2xj2g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 600883C01DA7;
	Fri, 25 Mar 2022 19:58:30 +0000 (UTC)
Received: from localhost (unknown [10.39.192.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1E3D1454559;
	Fri, 25 Mar 2022 19:58:29 +0000 (UTC)
Date: Fri, 25 Mar 2022 19:58:29 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, v.sementsov-og@mail.ru, libguestfs@redhat.com,
	qemu-block@nongnu.org
Subject: Re: [Libguestfs] [PATCH v2 1/3] docs: Clarify NBD_REPLY_TYPE_ERROR
 lengths
Message-ID: <20220325195829.GS8021@redhat.com>
References: <20220325124102.921017-1-eblake@redhat.com>
 <20220325124102.921017-2-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220325124102.921017-2-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hrYBLR-2TZD.A.BrH.-7hPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1809
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220325195829.GS8021@redhat.com
Resent-Date: Fri, 25 Mar 2022 19:58:54 +0000 (UTC)

On Fri, Mar 25, 2022 at 07:41:00AM -0500, Eric Blake wrote:
> Add explicit mention that human-readable error message strings must
> comply with the overall NBD string limits.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  doc/proto.md | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 81ac755..bfebb5a 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -1824,7 +1824,9 @@ remaining structured fields at the end.
>    be at least 6.  This chunk represents that an error occurred,
>    and the client MAY NOT make any assumptions about partial
>    success. This type SHOULD NOT be used more than once in a
> -  structured reply.  Valid as a reply to any request.
> +  structured reply.  Valid as a reply to any request.  Note that
> +  *message length* MUST NOT exceed the 4096 bytes string length
> +  limit.

ACK

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

