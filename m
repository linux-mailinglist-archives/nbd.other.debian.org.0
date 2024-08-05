Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 690F0947B48
	for <lists+nbd@lfdr.de>; Mon,  5 Aug 2024 14:53:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 53FD1205FC; Mon,  5 Aug 2024 12:53:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug  5 12:53:12 2024
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SARE_MSGID_LONG45,SARE_MSGID_LONG50 autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F1E3E205E9
	for <lists-other-nbd@bendel.debian.org>; Mon,  5 Aug 2024 12:53:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.58 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Q-qbxhnfqu6D for <lists-other-nbd@bendel.debian.org>;
	Mon,  5 Aug 2024 12:52:58 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 4E44F204D9
	for <nbd@other.debian.org>; Mon,  5 Aug 2024 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722862373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wg5uEtaKzzmeOJAOD80NwwJkOITcZMlBczYm/4JZgkM=;
	b=StaDBLV5rPmtUyOhQzG9+EJ8OUXPtnSYvOEkC5MnC2ewIeQcsKabDprlo4eF9rRyFzVdbm
	NJJHDUSRlxZ1wJ47ngvJVxYOZQBK0LEaI6uXAfO7kPik47PH3Fc1iqYvI6YJ5FzFpo7YjH
	sg8qEHhTARKT+RpzGDMEd6w+dfTOBaY=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-609-KaKSC-31OV-NDoQoT0NnNg-1; Mon,
 05 Aug 2024 08:52:49 -0400
X-MC-Unique: KaKSC-31OV-NDoQoT0NnNg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C2AD11955D4C;
	Mon,  5 Aug 2024 12:52:47 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.20])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 28F3219560AE;
	Mon,  5 Aug 2024 12:52:44 +0000 (UTC)
Date: Mon, 5 Aug 2024 07:52:42 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, nbd@other.debian.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] nbd: implement the WRITE_ZEROES command
Message-ID: <f2kaityrjmmstzvqq7xu755ikstida2hcnnng634oeo6fxjfbj@zrgbeik6fwz6>
References: <20240803130432.5952-1-w@uter.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240803130432.5952-1-w@uter.be>
User-Agent: NeoMutt/20240425
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hDNDdrRdRHH.A.S6NG.4sMsmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3119
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f2kaityrjmmstzvqq7xu755ikstida2hcnnng634oeo6fxjfbj@zrgbeik6fwz6
Resent-Date: Mon,  5 Aug 2024 12:53:12 +0000 (UTC)

On Sat, Aug 03, 2024 at 03:04:30PM GMT, Wouter Verhelst wrote:
> The NBD protocol defines a message for zeroing out a region of an export
> 
> Add support to the kernel driver for that message.
> 
> Signed-off-by: Wouter Verhelst <w@uter.be>
> ---
>  drivers/block/nbd.c      | 8 ++++++++
>  include/uapi/linux/nbd.h | 5 ++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 5b1811b1ba5f..215e7ea9a3c3 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -352,6 +352,8 @@ static int __nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
>  	}
>  	if (nbd->config->flags & NBD_FLAG_ROTATIONAL)
>  		lim.features |= BLK_FEAT_ROTATIONAL;
> +	if (nbd->config->flags & NBD_FLAG_SEND_WRITE_ZEROES)
> +		lim.max_write_zeroes_sectors = UINT_MAX;

Is that number accurate, when the kernel has not yet been taught to
use 64-bit transactions and can therefore only request a 32-bit byte
length on any one transaction?  Would a better limit be
UINT_MAX/blksize?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

