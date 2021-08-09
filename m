Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 784493E40C0
	for <lists+nbd@lfdr.de>; Mon,  9 Aug 2021 09:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5ABD220335; Mon,  9 Aug 2021 07:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug  9 07:18:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 61E92203B4
	for <lists-other-nbd@bendel.debian.org>; Mon,  9 Aug 2021 07:00:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.355 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WiEkwL-nLLhg for <lists-other-nbd@bendel.debian.org>;
	Mon,  9 Aug 2021 07:00:21 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 6AD64203A4
	for <nbd@other.debian.org>; Mon,  9 Aug 2021 07:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628492416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XSB+qsiXiDt/LtGYRnCraHlctWmbZ6sfAQg7VcuKR9M=;
	b=I+/ugay+cv3JrWFaTuW5flI784MwHppvBGp2mcv5B853kd8zJDXUNA50PDK8Ya+jSJYicq
	aJRS7MGWWIpX2r9QUtM7V01PEYyIOqphmPePfLorNoxWvy/v0Y7OzS3eEkDvjw0OD55e2d
	TRwOGdhL4gtILEUNkWCb56OpUvqJGFA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-PUrK1CkgPYeY80-D0WG0jA-1; Mon, 09 Aug 2021 02:28:33 -0400
X-MC-Unique: PUrK1CkgPYeY80-D0WG0jA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C79C48B5DC4;
	Mon,  9 Aug 2021 06:28:15 +0000 (UTC)
Received: from T590 (ovpn-13-190.pek2.redhat.com [10.72.13.190])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE60F10013C1;
	Mon,  9 Aug 2021 06:28:10 +0000 (UTC)
Date: Mon, 9 Aug 2021 14:28:06 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, bvanassche@acm.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, yi.zhang@huawei.com
Subject: Re: [PATCH v2 2/2] nbd: convert to use blk_mq_get_rq_by_tag()
Message-ID: <YRDK9tBFscK5ScK8@T590>
References: <20210809030927.1946162-1-yukuai3@huawei.com>
 <20210809030927.1946162-3-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809030927.1946162-3-yukuai3@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Db9fwkJWcmH.A.x9D.xaNEhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1255
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YRDK9tBFscK5ScK8@T590
Resent-Date: Mon,  9 Aug 2021 07:18:09 +0000 (UTC)

On Mon, Aug 09, 2021 at 11:09:27AM +0800, Yu Kuai wrote:
> blk_mq_tag_to_rq() might return freed request, use
> blk_mq_get_rq_by_tag() instead.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/block/nbd.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index c38317979f74..9e56975a8eee 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -713,11 +713,10 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
>  	tag = nbd_handle_to_tag(handle);
>  	hwq = blk_mq_unique_tag_to_hwq(tag);
>  	if (hwq < nbd->tag_set.nr_hw_queues)
> -		req = blk_mq_tag_to_rq(nbd->tag_set.tags[hwq],
> -				       blk_mq_unique_tag_to_tag(tag));
> -	if (!req || !blk_mq_request_started(req)) {
> -		dev_err(disk_to_dev(nbd->disk), "Unexpected reply (%d) %p\n",
> -			tag, req);
> +		req = blk_mq_get_rq_by_tag(nbd->tag_set.tags[hwq],
> +					   blk_mq_unique_tag_to_tag(tag));
> +	if (!req) {
> +		dev_err(disk_to_dev(nbd->disk), "Unexpected reply %d\n", tag);
>  		return ERR_PTR(-ENOENT);
>  	}
>  	trace_nbd_header_received(req, handle);
> @@ -779,6 +778,8 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
>  	}
>  out:
>  	trace_nbd_payload_received(req, handle);
> +	if (req)
> +		blk_mq_put_rq_ref(req);
>  	mutex_unlock(&cmd->lock);
>  	return ret ? ERR_PTR(ret) : cmd;

After blk_mq_put_rq_ref() returns, this request may have been freed,
so the returned 'cmd' may have been freed too.

As I replied in your another thread, it is driver's responsibility to
cover race between normal completion and timeout/error handling, that
means the caller of blk_mq_tag_to_rq need to make sure that the request
represented by the passed 'tag' can't be freed.

I'd suggest to understand why nbd_read_stat()/blk_mq_tag_to_rq() may return
one freed request first, who frees the request and how when calling
blk_mq_tag_to_rq() before figuring out solutions.



Thanks,
Ming

