Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 897E848F10F
	for <lists+nbd@lfdr.de>; Fri, 14 Jan 2022 21:31:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6F7642058B; Fri, 14 Jan 2022 20:31:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 14 20:31:39 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4A25520577
	for <lists-other-nbd@bendel.debian.org>; Fri, 14 Jan 2022 20:31:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.827 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gnnQKrN5BL_H for <lists-other-nbd@bendel.debian.org>;
	Fri, 14 Jan 2022 20:31:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 21C7C203CB
	for <nbd@other.debian.org>; Fri, 14 Jan 2022 20:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642192280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pPEAX7ZO3onUa77ohQdjqv/HAldxvh7x4X8BwDK9w0I=;
	b=XSRRQVUg5nw8VdM2tLbwuws9oO5jzyhP7A5Sux4tcvqnVwuQgCQNBsJhP0H/s/xhoU9OF5
	bGH/Ix//ZXSWLfy5MP+mf4pQzJ3Q2GUimYoDLEYnjQX7bsKzsC0mKWOsBzfU5rlZnIpYHd
	bpwMuvP0+lgv7KMe0VjBmCv3gMTOkVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-jojorEHjNTCbUyYFlNmwYA-1; Fri, 14 Jan 2022 15:31:13 -0500
X-MC-Unique: jojorEHjNTCbUyYFlNmwYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD484839A43;
	Fri, 14 Jan 2022 20:31:11 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.226])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 864DA4ABAF;
	Fri, 14 Jan 2022 20:31:10 +0000 (UTC)
Date: Fri, 14 Jan 2022 14:31:08 -0600
From: Eric Blake <eblake@redhat.com>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: nbd@other.debian.org, Wouter Verhelst <w@uter.be>,
	Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: Re: [PATCH 1/2] nbd-trdump: Add support for all commands
Message-ID: <20220114203108.lgh2xncmizcd7oal@redhat.com>
References: <20220114132923.15528-1-manfred@colorfullife.com>
 <20220114132923.15528-2-manfred@colorfullife.com>
MIME-Version: 1.0
In-Reply-To: <20220114132923.15528-2-manfred@colorfullife.com>
User-Agent: NeoMutt/20211029-182-90c72c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <09xXcUMVkAB.A.pbD.r2d4hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1690
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220114203108.lgh2xncmizcd7oal@redhat.com
Resent-Date: Fri, 14 Jan 2022 20:31:39 +0000 (UTC)

On Fri, Jan 14, 2022 at 02:29:22PM +0100, Manfred Spraul wrote:
> Support for pretty-printing NBD_CMD_TRIM and NBD_CMD_WRITE_ZEROES is
> missing in nbd-trdump.
> In addition, only the commands right now implemented in nbd-server
> are supported, instead of all commands defined in the protocol.
> 
> Thus:
> - move the existing getcommandname() helper function into a new
>   nbd-helper.h header file.
> - use the helper function in nbd-trdump
> - add all commands from proto.md.
> - in nbd-trdump: change ctest from "char *" to "const char *"
>   and increase number of characters in printf statement.
> 
> Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
> ---
>  nbd-helper.h | 31 +++++++++++++++++++++++++++++++
>  nbd-server.c | 26 +-------------------------
>  nbd-trdump.c | 24 +++++-------------------
>  nbd.h        |  5 ++++-
>  4 files changed, 41 insertions(+), 45 deletions(-)
>  create mode 100644 nbd-helper.h
> 
> diff --git a/nbd-helper.h b/nbd-helper.h

> +/**
> + * Translate a command name into human readable form
> + *
> + * @param command The command number (after applying NBD_CMD_MASK_COMMAND)
> + * @return pointer to the command name
> + **/
> +#define ENUM2STR(x)	case x: return #x
> +static inline const char * getcommandname(uint32_t command) {
> +	switch (command) {
> +	ENUM2STR(NBD_CMD_READ);
> +	ENUM2STR(NBD_CMD_WRITE);
> +	ENUM2STR(NBD_CMD_DISC);
> +	ENUM2STR(NBD_CMD_FLUSH);
> +	ENUM2STR(NBD_CMD_TRIM);
> +	ENUM2STR(NBD_CMD_WRITE_ZEROES);

Missing ENUM2STR(NBD_CMD_CACHE) between TRIM and WRITE_ZEROES.

> +	ENUM2STR(NBD_CMD_BLOCK_STATUS);
> +	ENUM2STR(NBD_CMD_RESIZE);
> +	default:
> +		return "UNKNOWN";
> +	}

> +++ b/nbd.h
> @@ -35,7 +35,10 @@ enum {
>  	NBD_CMD_DISC = 2,
>  	NBD_CMD_FLUSH = 3,
>  	NBD_CMD_TRIM = 4,
> -	NBD_CMD_WRITE_ZEROES = 6
> +	NBD_CMD_CACHE = 5,
> +	NBD_CMD_WRITE_ZEROES = 6,
> +	NBD_CMD_BLOCK_STATUS = 7,
> +	NBD_CMD_RESIZE = 8
>  };

Absent any strong reason for avoiding trailing commas (such as
insisting on C89 compliance), my personal preference is to use it, so
that future changes can touch one fewer line of code when extending
the enum.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

