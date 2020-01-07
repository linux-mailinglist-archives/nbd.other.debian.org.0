Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CDD1330E7
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2020 21:54:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8ADDC20CCC; Tue,  7 Jan 2020 20:54:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 20:54:25 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EAF6B20C9C
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2020 20:54:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id qTyJtUDzW337 for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2020 20:54:07 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.7
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by bendel.debian.org (Postfix) with ESMTP id E425520C91
	for <nbd@other.debian.org>; Tue,  7 Jan 2020 20:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578430441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5REKIZFozuoTOXJVLhOacnqH0z2hRNREzOOkYmduK0=;
	b=g5VEkz2Y3KT/EPq3xepfjrXwNFQAaUoNlqvdvoJ0K1LXE5pDaoTehcWXDEcjD5kaDkSVwP
	WjsoYYKvCA3fmbykEEq9PDkOhhccagQ3chzOQAy8jJsB/C4YSoR5vdIPRSpIcT/8BGsjGM
	v2mi933qMXfj+w6Se1dM0q3lgI5afbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-b2o2cTrGNMaOir30W86x0w-1; Tue, 07 Jan 2020 15:22:21 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFD76107ACC4;
	Tue,  7 Jan 2020 20:22:20 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AE2B7C009;
	Tue,  7 Jan 2020 20:22:20 +0000 (UTC)
Subject: Re: [PATCH] proto: document use of NBD_REP_ERR_PLATFORM
To: Wouter Verhelst <wouter@grep.be>, nbd@other.debian.org
References: <20191231155916.GC24908@grep.be>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <69ca04cf-0b99-64e5-fc31-57ee778bf3d3@redhat.com>
Date: Tue, 7 Jan 2020 14:22:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191231155916.GC24908@grep.be>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: b2o2cTrGNMaOir30W86x0w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Du7dY5bTpaM.A.cX.BAPFeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/768
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/69ca04cf-0b99-64e5-fc31-57ee778bf3d3@redhat.com
Resent-Date: Tue,  7 Jan 2020 20:54:25 +0000 (UTC)

On 12/31/19 9:59 AM, Wouter Verhelst wrote:
> Hi,
> 
> When I implemented TLS support into nbd-server, I made it send
> NBD_REP_ERR_PLATFORM to the client if it asked for TLS support and that
> was disabled at compile time. I think this is a valid use for that error
> message (which is otherwise not ever used), and I think I should update
> the docs to account for it.
> 
> What do other people think?
> 

> +++ b/doc/proto.md
> @@ -1582,7 +1582,8 @@ case that data is an error message string suitable for display to the user.
>   * `NBD_REP_ERR_PLATFORM` (2^31 + 4)
>   
>       The option sent by the client is not supported on the platform on
> -    which the server is running. Not currently used.
> +    which the server is running, or requires compile-time options that
> +    were disabled, e.g., upon trying to use TLS.

Looks reasonable to me.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

