Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CDF3E195F
	for <lists+nbd@lfdr.de>; Thu,  5 Aug 2021 18:21:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 11611204AC; Thu,  5 Aug 2021 16:21:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug  5 16:21:08 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DDAA520410
	for <lists-other-nbd@bendel.debian.org>; Thu,  5 Aug 2021 16:20:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.352 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.474,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bv9ADcBwZGiF for <lists-other-nbd@bendel.debian.org>;
	Thu,  5 Aug 2021 16:20:55 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 14766204AC
	for <nbd@other.debian.org>; Thu,  5 Aug 2021 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628180450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBq22qCt0vTioV8uoJVFfE3aNxsV4C6kvXFGv17EYKo=;
	b=LnWDzljMfDtJuRvnKaZb+Dta1sBOPKGJnV4wPEAjkd5BoALI8dFxM82TFAzf42byK2Ctyo
	ngaTpNnNp/3jxVTgLdM8F/eVPssTh9KKIopK1Z3mGCPY0a3W49lsMxBVhlAO8kaiHM1lh+
	AKTXeXhlRlRPiZQ9amOYfW/JBJsBUa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-FtQ83V1CPNGdAYXpQsBiyQ-1; Thu, 05 Aug 2021 11:50:08 -0400
X-MC-Unique: FtQ83V1CPNGdAYXpQsBiyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B35FD107BEF6;
	Thu,  5 Aug 2021 15:50:06 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01F755D9DE;
	Thu,  5 Aug 2021 15:50:05 +0000 (UTC)
Date: Thu, 5 Aug 2021 10:50:04 -0500
From: Eric Blake <eblake@redhat.com>
To: Hou Tao <houtao1@huawei.com>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org
Subject: Re: [PATCH] nbd: call genl_unregister_family() first in nbd_cleanup()
Message-ID: <20210805155004.6l4gxrniih6vxisr@redhat.com>
References: <20210805021946.978686-1-houtao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805021946.978686-1-houtao1@huawei.com>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kDnTDyjMHMK.A.jhH.0_ADhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1239
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210805155004.6l4gxrniih6vxisr@redhat.com
Resent-Date: Thu,  5 Aug 2021 16:21:08 +0000 (UTC)

On Thu, Aug 05, 2021 at 10:19:46AM +0800, Hou Tao wrote:
> Else there may be race between module removal and handling of
> netlink command and will lead to oops as shown below:

Grammar suggestion:

Otherwise, there is a race between module removal and the handling of
a netlink command, which can lead to the oops shown below:

> 
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  drivers/block/nbd.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 9a7c9a425ab0..0993d108d868 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -2492,6 +2492,12 @@ static void __exit nbd_cleanup(void)
>  	struct nbd_device *nbd;
>  	LIST_HEAD(del_list);
>  
> +	/*
> +	 * Unregister netlink interface first to waiting
> +	 * for the completion of netlink commands.

Grammar suggestion: s/first/prior/

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

