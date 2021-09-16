Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CF140D4B1
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 10:39:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D8034208B3; Thu, 16 Sep 2021 08:39:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 08:39:20 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5DF00208A4
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 08:23:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.398,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SyG6db9aXxdk for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 08:23:48 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 2CD4420644
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 08:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631780623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2gYTVUstSGum8vCgM4ToltbBv2THH4KeZDSf5iCyLvY=;
	b=KjsfIadX5w/jO30t6Pjqn1hQ8v8nuIaoYEiYK1B2vBUrsBub1dFKqEaYQPueARsF0Y3jiu
	WFPqIdXwL3x4XX3HmRGa/0wMK/94FDpX5OGgrJ/LpTyl2VOPTFqrdVR866voqQRn6VbEoW
	VIVKfufusKI4/Kg4CbV5bMZj3f70xCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-TUBi5zIKMy-P7na6kgC6Ug-1; Thu, 16 Sep 2021 04:23:40 -0400
X-MC-Unique: TUBi5zIKMy-P7na6kgC6Ug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08DCF835DE2;
	Thu, 16 Sep 2021 08:23:39 +0000 (UTC)
Received: from T590 (ovpn-12-89.pek2.redhat.com [10.72.12.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0635C6D982;
	Thu, 16 Sep 2021 08:23:28 +0000 (UTC)
Date: Thu, 16 Sep 2021 16:23:40 +0800
From: Ming Lei <ming.lei@redhat.com>
To: pkalever@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, josef@toxicpanda.com, axboe@kernel.dk,
	idryomov@redhat.com, xiubli@redhat.com,
	Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
Subject: Re: [PATCH v1 2/2] nbd: reset the queue/io_timeout to default on
 disconnect
Message-ID: <YUL/DGZiUnQQGHVX@T590>
References: <20210806142914.70556-1-pkalever@redhat.com>
 <20210806142914.70556-3-pkalever@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210806142914.70556-3-pkalever@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <auQa2fxFC-C.A.7oC.4KwQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1491
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUL/DGZiUnQQGHVX@T590
Resent-Date: Thu, 16 Sep 2021 08:39:20 +0000 (UTC)

On Fri, Aug 06, 2021 at 07:59:14PM +0530, pkalever@redhat.com wrote:
> From: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
> 
> Without any changes to NBD_ATTR_TIMEOUT (default is 30 secs),
> $ rbd-nbd map rbd-pool/image0 --try-netlink
> /dev/nbd0
> $ cat /sys/block/nbd0/queue/io_timeout
> 30000
> $ rbd-nbd unmap /dev/nbd0
> $ cat /sys/block/nbd0/queue/io_timeout
> 30000
> 
> Now user sets NBD_ATTR_TIMEOUT to 60,
> $ rbd-nbd map rbd-pool/image0 --try-netlink --io-timeout 60
> /dev/nbd0
> $ cat /sys/block/nbd0/queue/io_timeout
> 60000
> $ rbd-nbd unmap /dev/nbd0
> $ cat /sys/block/nbd0/queue/io_timeout
> 60000
> 
> Now user doesn't alter NBD_ATTR_TIMEOUT, but sysfs still shows it as 60,
> $ rbd-nbd map rbd-pool/image0 --try-netlink
> /dev/nbd0
> $ cat /sys/block/nbd0/queue/io_timeout
> 60000
> $ rbd-nbd unmap /dev/nbd0
> $ cat /sys/block/nbd0/queue/io_timeout
> 60000
> 
> The problem exists with ioctl interface too.
> 
> Signed-off-by: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
> ---
>  drivers/block/nbd.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 16a1a14b1fd1..a45aabc4914b 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -158,6 +158,7 @@ static void nbd_connect_reply(struct genl_info *info, int index);
>  static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info);
>  static void nbd_dead_link_work(struct work_struct *work);
>  static void nbd_disconnect_and_put(struct nbd_device *nbd);
> +static void nbd_set_cmd_timeout(struct nbd_device *nbd, u64 timeout);
>  
>  static inline struct device *nbd_to_dev(struct nbd_device *nbd)
>  {
> @@ -1250,7 +1251,7 @@ static void nbd_config_put(struct nbd_device *nbd)
>  			destroy_workqueue(nbd->recv_workq);
>  		nbd->recv_workq = NULL;
>  
> -		nbd->tag_set.timeout = 0;
> +		nbd_set_cmd_timeout(nbd, 0);
>  		nbd->disk->queue->limits.discard_granularity = 0;
>  		nbd->disk->queue->limits.discard_alignment = 0;
>  		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
> @@ -2124,6 +2125,10 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
>  	if (ret)
>  		goto out;
>  
> +	/*
> +	 * On reconfigure, if NBD_ATTR_TIMEOUT is not provided, we will
> +	 * continue to use the cmd timeout provided with connect initially.
> +	 */
>  	if (info->attrs[NBD_ATTR_TIMEOUT])
>  		nbd_set_cmd_timeout(nbd,
>  				    nla_get_u64(info->attrs[NBD_ATTR_TIMEOUT]));
> -- 
> 2.31.1
> 

Looks fine:

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming

