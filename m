Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9893740A69F
	for <lists+nbd@lfdr.de>; Tue, 14 Sep 2021 08:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 54EE8203FF; Tue, 14 Sep 2021 06:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 14 06:18:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FVGT_m_MULTI_ODD,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3B071204DB
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Sep 2021 06:00:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.259 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.398,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VOWnoCoZEIlK for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Sep 2021 06:00:25 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id BF43B203FC
	for <nbd@other.debian.org>; Tue, 14 Sep 2021 06:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631599219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SS7/FhncPXhi3voNRWPd1aP8SGBMDiJ0bi0FjQH7ipo=;
	b=dy7GzxTWrvRfH3cu7RZpVFX23tHz0Ex+Ts9j71VxKx1HHBAKRMgBEh1v2SKM7G52fGvss8
	cn7Gtk5RubbuODidoSWfnW4HPQhiPviygXvwz1RHN6PhE1MmoH3btaSAEo6QILIV2MT4wG
	Pbuacdk8w/NHwekKkm8sWu6zVzN765Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-ZKbsjLAUP9aqnZaVL-D-Pg-1; Mon, 13 Sep 2021 20:57:52 -0400
X-MC-Unique: ZKbsjLAUP9aqnZaVL-D-Pg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54E99802929;
	Tue, 14 Sep 2021 00:57:51 +0000 (UTC)
Received: from T590 (ovpn-12-85.pek2.redhat.com [10.72.12.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FDDF5C23A;
	Tue, 14 Sep 2021 00:57:44 +0000 (UTC)
Date: Tue, 14 Sep 2021 08:57:53 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, hch@infradead.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, yi.zhang@huawei.com
Subject: Re: [PATCH v5 2/6] nbd: make sure request completion won't concurrent
Message-ID: <YT/zkdoXG+awaVbm@T590>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
 <20210909141256.2606682-3-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909141256.2606682-3-yukuai3@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <B3Crx5suX4O.A.SSG.h6DQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1451
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YT/zkdoXG+awaVbm@T590
Resent-Date: Tue, 14 Sep 2021 06:18:09 +0000 (UTC)

On Thu, Sep 09, 2021 at 10:12:52PM +0800, Yu Kuai wrote:
> commit cddce0116058 ("nbd: Aovid double completion of a request")
> try to fix that nbd_clear_que() and recv_work() can complete a
> request concurrently. However, the problem still exists:
> 
> t1                    t2                     t3
> 
> nbd_disconnect_and_put
>  flush_workqueue
>                       recv_work
>                        blk_mq_complete_request
>                         blk_mq_complete_request_remote -> this is true
>                          WRITE_ONCE(rq->state, MQ_RQ_COMPLETE)
>                           blk_mq_raise_softirq
>                                              blk_done_softirq
>                                               blk_complete_reqs
>                                                nbd_complete_rq
>                                                 blk_mq_end_request
>                                                  blk_mq_free_request
>                                                   WRITE_ONCE(rq->state, MQ_RQ_IDLE)
>   nbd_clear_que
>    blk_mq_tagset_busy_iter
>     nbd_clear_req
>                                                    __blk_mq_free_request
>                                                     blk_mq_put_tag
>      blk_mq_complete_request -> complete again
> 
> There are three places where request can be completed in nbd:
> recv_work(), nbd_clear_que() and nbd_xmit_timeout(). Since they
> all hold cmd->lock before completing the request, it's easy to
> avoid the problem by setting and checking a cmd flag.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/block/nbd.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 04861b585b62..550c8dc438ac 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -406,7 +406,11 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>  	if (!mutex_trylock(&cmd->lock))
>  		return BLK_EH_RESET_TIMER;
>  
> -	__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
> +	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
> +		mutex_unlock(&cmd->lock);
> +		return BLK_EH_DONE;
> +	}
> +
>  	if (!refcount_inc_not_zero(&nbd->config_refs)) {
>  		cmd->status = BLK_STS_TIMEOUT;
>  		mutex_unlock(&cmd->lock);
> @@ -842,7 +846,10 @@ static bool nbd_clear_req(struct request *req, void *data, bool reserved)
>  
>  	mutex_lock(&cmd->lock);
>  	cmd->status = BLK_STS_IOERR;
> -	__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
> +	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
> +		mutex_unlock(&cmd->lock);
> +		return true;
> +	}
>  	mutex_unlock(&cmd->lock);

If this request has completed from other code paths, ->status shouldn't be
updated here, maybe it is done successfully.

-- 
Ming

