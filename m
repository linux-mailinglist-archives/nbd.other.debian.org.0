Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3264035AD
	for <lists+nbd@lfdr.de>; Wed,  8 Sep 2021 09:48:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B110F20841; Wed,  8 Sep 2021 07:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  8 07:48:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 873F52083C
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Sep 2021 07:30:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.628 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iiFdAfzbi8kY for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Sep 2021 07:30:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 553F220835
	for <nbd@other.debian.org>; Wed,  8 Sep 2021 07:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631086224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vkqGjkxzxSPrvDa6nFo8JJGNfAA6j1Mj5Wob9D9BFCs=;
	b=W0aGrFkTaQ0VreQmOPtxNzKwYe1fjOOQoq1GHfoIq3rjdy2yH/7Ia81jAx5gy6yz6GeTRk
	yHV5P++KZaItVxvWUd9hPFnLn2rR9bzyCr6AJfVAh5mIp9eC6MbmhRK706B00IEAeYrTW1
	xuOFLL7yf4vde5RjthqqqwytSxy2+o4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-e8Mtu1L4NlapVx1NWYf7Pg-1; Wed, 08 Sep 2021 03:30:23 -0400
X-MC-Unique: e8Mtu1L4NlapVx1NWYf7Pg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A66E6801A92;
	Wed,  8 Sep 2021 07:30:21 +0000 (UTC)
Received: from T590 (ovpn-12-207.pek2.redhat.com [10.72.12.207])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7842D5D9F4;
	Wed,  8 Sep 2021 07:30:12 +0000 (UTC)
Date: Wed, 8 Sep 2021 15:30:14 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	yi.zhang@huawei.com
Subject: Re: [PATCH v4 2/6] nbd: convert to use blk_mq_find_and_get_req()
Message-ID: <YThmhhI1/fZd29b1@T590>
References: <20210907140154.2134091-1-yukuai3@huawei.com>
 <20210907140154.2134091-3-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907140154.2134091-3-yukuai3@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GLhAhHGQlOI.A.sGG.5qGOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1410
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YThmhhI1/fZd29b1@T590
Resent-Date: Wed,  8 Sep 2021 07:48:09 +0000 (UTC)

On Tue, Sep 07, 2021 at 10:01:50PM +0800, Yu Kuai wrote:
> blk_mq_tag_to_rq() can only ensure to return valid request in
> following situation:
> 
> 1) client send request message to server first
> submit_bio
> ...
>  blk_mq_get_tag
>  ...
>  blk_mq_get_driver_tag
>  ...
>  nbd_queue_rq
>   nbd_handle_cmd
>    nbd_send_cmd
> 
> 2) client receive respond message from server
> recv_work
>  nbd_read_stat
>   blk_mq_tag_to_rq
> 
> If step 1) is missing, blk_mq_tag_to_rq() will return a stale
> request, which might be freed. Thus convert to use
> blk_mq_find_and_get_req() to make sure the returned request is not
> freed. However, there are still some problems if the request is
> started, and this will be fixed in next patch.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/block/nbd.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 5170a630778d..920da390635c 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -718,12 +718,13 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
>  	tag = nbd_handle_to_tag(handle);
>  	hwq = blk_mq_unique_tag_to_hwq(tag);
>  	if (hwq < nbd->tag_set.nr_hw_queues)
> -		req = blk_mq_tag_to_rq(nbd->tag_set.tags[hwq],
> -				       blk_mq_unique_tag_to_tag(tag));
> +		req = blk_mq_find_and_get_req(nbd->tag_set.tags[hwq],
> +					      blk_mq_unique_tag_to_tag(tag));
>  	if (!req || !blk_mq_request_started(req)) {
>  		dev_err(disk_to_dev(nbd->disk), "Unexpected reply (%d) %p\n",
>  			tag, req);
> -		return ERR_PTR(-ENOENT);
> +		ret = -ENOENT;
> +		goto put_req;
>  	}
>  	trace_nbd_header_received(req, handle);
>  	cmd = blk_mq_rq_to_pdu(req);
> @@ -785,6 +786,9 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
>  out:
>  	trace_nbd_payload_received(req, handle);
>  	mutex_unlock(&cmd->lock);
> +put_req:
> +	if (req)
> +		blk_mq_put_rq_ref(req);
>  	return ret ? ERR_PTR(ret) : cmd;

After the request's refcnt is dropped, it can be freed immediately, then
one stale command is returned to caller.

Thanks,
Ming

