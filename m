Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7293540D457
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 10:15:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 200BD208A4; Thu, 16 Sep 2021 08:15:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 08:15:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 202AE208A4
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 07:58:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.279 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.398,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8RAfC98JX_gT for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 07:58:17 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 813DD208A2
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 07:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631779092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uvbPPHBe4uDamGnbtgpBoxF6WY3akfmnUvBaR8S67eU=;
	b=LoTqRDOymyXBK+NYefhvx1CQBmScpsNSkJ7mDAaWV+jTPnYK1teFV4J9nC2vfjdJbrfNxZ
	7m4fueoM17PQu7vdXLFbLljjyEiFbKq5bkMBWHCSgFROItU46VQflZjGafGI4NAjytnny/
	kOd/cjRqbqBbJ3FP+CifZj3LfQ5GB2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-UjMk8IPxNUucFDsjvcqvxQ-1; Thu, 16 Sep 2021 03:58:09 -0400
X-MC-Unique: UjMk8IPxNUucFDsjvcqvxQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58A7B1023F75;
	Thu, 16 Sep 2021 07:58:02 +0000 (UTC)
Received: from T590 (ovpn-12-89.pek2.redhat.com [10.72.12.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3A60100164C;
	Thu, 16 Sep 2021 07:57:57 +0000 (UTC)
Date: Thu, 16 Sep 2021 15:58:10 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, hch@infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH v7 4/6] nbd: don't start request if nbd_queue_rq() failed
Message-ID: <YUL5EqT6eA0shjJZ@T590>
References: <20210915092010.2087371-1-yukuai3@huawei.com>
 <20210915092010.2087371-5-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915092010.2087371-5-yukuai3@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5dLUwtds_3M.A.P4B.N0vQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1487
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUL5EqT6eA0shjJZ@T590
Resent-Date: Thu, 16 Sep 2021 08:15:09 +0000 (UTC)

On Wed, Sep 15, 2021 at 05:20:08PM +0800, Yu Kuai wrote:
> Currently, blk_mq_end_request() will be called if nbd_queue_rq()
> failed, thus start request in such situation is useless.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/nbd.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index c724a5bd7fa4..22c91d8901f6 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -934,7 +934,6 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
>  	if (!refcount_inc_not_zero(&nbd->config_refs)) {
>  		dev_err_ratelimited(disk_to_dev(nbd->disk),
>  				    "Socks array is empty\n");
> -		blk_mq_start_request(req);
>  		return -EINVAL;
>  	}
>  	config = nbd->config;
> @@ -943,7 +942,6 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
>  		dev_err_ratelimited(disk_to_dev(nbd->disk),
>  				    "Attempted send on invalid socket\n");
>  		nbd_config_put(nbd);
> -		blk_mq_start_request(req);
>  		return -EINVAL;
>  	}
>  	cmd->status = BLK_STS_OK;
> @@ -967,7 +965,6 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
>  			 */
>  			sock_shutdown(nbd);
>  			nbd_config_put(nbd);
> -			blk_mq_start_request(req);
>  			return -EIO;
>  		}

It is basically a partial revert of the following fix, care to add commit log
about why removing these blk_mq_start_request() is safe?

commit 6a468d5990ecd1c2d07dd85f8633bbdd0ba61c40
Author: Josef Bacik <jbacik@fb.com>
Date:   Mon Nov 6 16:11:58 2017 -0500

    nbd: don't start req until after the dead connection logic



Thanks, 
Ming

