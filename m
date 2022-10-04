Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE405F4B35
	for <lists+nbd@lfdr.de>; Tue,  4 Oct 2022 23:53:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 050F0203D3; Tue,  4 Oct 2022 21:53:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct  4 21:53:39 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0695220281
	for <lists-other-nbd@bendel.debian.org>; Tue,  4 Oct 2022 21:53:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.863 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.083, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ivx2GSxSkYAj for <lists-other-nbd@bendel.debian.org>;
	Tue,  4 Oct 2022 21:53:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id AB41820278
	for <nbd@other.debian.org>; Tue,  4 Oct 2022 21:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664920395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BQpOJsBfjImNyrlgmVEcpVUvmE8TGlz/ipyCLFVfnZg=;
	b=DN3LytS0521Ve6XuDSvuTnP8UA7GlX67SrAYNiuKG0sFiDmB3PbkfGOLrMMiRdSqyQgPdA
	b07AQPusplnSVWrVvu5ngMsr8O0/5h3bL9s94607CXFNMcFFBkKz6vWB4K4nnpOkm7HbGW
	DkjuME34dP71NmhuBkKLCCvmcq/jaLo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-ytMDyMdON9G8qPc6aXiRkg-1; Tue, 04 Oct 2022 17:21:50 -0400
X-MC-Unique: ytMDyMdON9G8qPc6aXiRkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A14B6185A7A8;
	Tue,  4 Oct 2022 21:21:49 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCDA41121315;
	Tue,  4 Oct 2022 21:21:48 +0000 (UTC)
Date: Tue, 4 Oct 2022 16:21:46 -0500
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, libguestfs@redhat.com,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <20221004212146.ufycpumvmptijwcy@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203231434.3900824-1-eblake@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <KxKgx0CPUJJ.A.LuH.jtKPjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2226
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20221004212146.ufycpumvmptijwcy@redhat.com
Resent-Date: Tue,  4 Oct 2022 21:53:40 +0000 (UTC)

On Fri, Dec 03, 2021 at 05:14:34PM -0600, Eric Blake wrote:
> Add a new negotiation feature where the client and server agree to use
> larger packet headers on every packet sent during transmission phase.
> This has two purposes: first, it makes it possible to perform
> operations like trim, write zeroes, and block status on more than 2^32
> bytes in a single command; this in turn requires that some structured
> replies from the server also be extended to match.  The wording chosen
> here is careful to permit a server to use either flavor in its reply
> (that is, a request less than 32-bits can trigger an extended reply,
> and conversely a request larger than 32-bits can trigger a compact
> reply).

Following up on this original proposal with something that came out of
KVM Forum this year.

> +* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
> +
> +  This chunk type is in the status chunk category.  *length* MUST be
> +  4 + (a positive multiple of 16).  The semantics of this chunk mirror
> +  those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
> +  larger *extent length* field, as well as added padding to ease
> +  alignment.  This chunk type MUST NOT be used unless extended headers
> +  were negotiated with `NBD_OPT_EXTENDED_HEADERS`.
> +
> +  The payload starts with:
> +
> +  32 bits, metadata context ID  
> +
> +  and is followed by a list of one or more descriptors, each with this
> +  layout:
> +
> +  64 bits, length of the extent to which the status below
> +     applies (unsigned, MUST be nonzero)  
> +  32 bits, status flags  
> +  32 bits, padding (MUST be zero)

During KVM Forum, I had several conversations about Zoned Block
Devices (https://zonedstorage.io/docs/linux/zbd-api), and what it
would take to expose ZBD information over NBD.  In particular,
NBD_CMD_BLOCK_STATUS sounds like a great way for advertising
information about zones (by adding several metadata contexts that can
be negotiated during NBD_OPT_SET_META_CONTEXT), except for the fact
that a zone might be larger than 32 bits in size.  So Rich Jones asked
me the question of whether my work on 64-bit extensions to the NBD
protocol could also allow for a server to advertise a metadata context
only to clients that support 64-bit extensions, at which point it can
report 64-bit offsets or lengths as needed, rather than being limited
to 32-bit status flags.

The idea definitely has merit, so I'm working on incorporating that
into my next revision for 64-bit extensions in NBD.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

