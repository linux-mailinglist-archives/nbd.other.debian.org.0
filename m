Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B37A725B3B
	for <lists+nbd@lfdr.de>; Wed,  7 Jun 2023 12:01:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ED109204F5; Wed,  7 Jun 2023 10:01:04 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  7 10:01:04 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 29F5E20526
	for <lists-other-nbd@bendel.debian.org>; Wed,  7 Jun 2023 10:00:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.091 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 91_9-9ZjFkbk for <lists-other-nbd@bendel.debian.org>;
	Wed,  7 Jun 2023 10:00:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id ABFCB20522
	for <nbd@other.debian.org>; Wed,  7 Jun 2023 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686132041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V7hYlQ4b56+v8STVoKfqN9CmYxKmLYcH/ztLKtnfjUw=;
	b=HPwzQRe59/lPVWRNWbDpXhs+fVn5rIwi+YrXMhAZZgqrBF0iFLgXXIUWOAhRnPMFwLryS/
	qn6ylPnPjhaEeRHkeV1JhYECuVvVb60SpAMeAaXAi/AB5Swz/BTjvyyYLwFSFS4APYENA4
	/16YG5kSICZ//XMNzlb4Guv/rP3RsVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-ZIovTTsVP8iKFRd9eaeQAQ-1; Wed, 07 Jun 2023 06:00:37 -0400
X-MC-Unique: ZIovTTsVP8iKFRd9eaeQAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75448811E8D;
	Wed,  7 Jun 2023 10:00:37 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6C75407DEC0;
	Wed,  7 Jun 2023 10:00:36 +0000 (UTC)
Date: Wed, 7 Jun 2023 11:00:36 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, Eric Blake <eblake@redhat.com>,
	qemu-block@nongnu.org, libguestfs@redhat.com, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 03/22] protocol: Add definitions
 for extended headers
Message-ID: <20230607100036.GD7773@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-4-eblake@redhat.com>
 <2b98a2ca-62d5-c87b-2a37-1a49af89b4b4@redhat.com>
 <ZHYOgQAL3ELxr1S9@pc220518.home.grep.be>
 <7f186cd0-b42e-7a20-2946-39ffecd23383@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7f186cd0-b42e-7a20-2946-39ffecd23383@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9WQAPIuZ2kE.A.2FG.gVFgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2526
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230607100036.GD7773@redhat.com
Resent-Date: Wed,  7 Jun 2023 10:01:04 +0000 (UTC)

On Tue, May 30, 2023 at 05:48:25PM +0200, Laszlo Ersek wrote:
> BTW I'm foreseeing a problem: if the extended block descriptor can
> provide an unsigned 64-bit length, we're going to have trouble exposing
> that in OCaml, because OCaml only has signed 64-bit integers. So that's
> going to reproduce the same issue, only for OCaml callers of the *new* API.
> 
> I can see Eric's series includes patches like "ocaml: Add example for
> 64-bit extents" -- I've not looked at those yet; for now I'm just
> wondering what tricks we might need in the bindings generator. The
> method seen in the "middle patch" above won't work; we don't have a
> native OCaml "i128" type for example that we could use as an escape
> hatch, for representing C's uint64_t.

I think that's OK because disk sizes are already limited to
2^63 - 1 by the kernel (and for qemu even less than that).
The OCaml bindings return a (signed) int64 for NBD.get_size.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

