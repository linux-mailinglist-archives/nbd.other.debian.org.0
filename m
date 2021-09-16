Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A465C40D449
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 10:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 29023208A8; Thu, 16 Sep 2021 08:09:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 08:09:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FVGT_m_MULTI_ODD,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DED73208A4
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 07:53:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.259 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iLCSgwjaersS for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 07:53:48 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id DD3EC208A2
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631778822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UbyhDf28XmyZ8Ks2SzbXEg6Z9yAKC+TTkrGxzB0H0wU=;
	b=ar9XU2GsuvxfkWWJAHij/qXTCq97/OHtxckvq5Fmr/vyx7e9B5Shm9piwgWnvekaz9218J
	rumEUZYRKtjky8P4HFGkjv8I615hZE5U9+2g1QA1lqF8izwoCS3YrL5EiVVnJ/Y80JGA6U
	H6+jwubSK9QhYwKBGdTMueVQwYCiL/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-Qq4bf--nM5Gas6cLynZZHQ-1; Thu, 16 Sep 2021 03:53:39 -0400
X-MC-Unique: Qq4bf--nM5Gas6cLynZZHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74734802C8F;
	Thu, 16 Sep 2021 07:53:37 +0000 (UTC)
Received: from T590 (ovpn-12-89.pek2.redhat.com [10.72.12.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08A0A838D9;
	Thu, 16 Sep 2021 07:53:06 +0000 (UTC)
Date: Thu, 16 Sep 2021 15:53:18 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, hch@infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH v7 2/6] nbd: make sure request completion won't concurrent
Message-ID: <YUL37uANjYQbG382@T590>
References: <20210915092010.2087371-1-yukuai3@huawei.com>
 <20210915092010.2087371-3-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210915092010.2087371-3-yukuai3@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WQODzAy5_rB.A.CYH.luvQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1486
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUL37uANjYQbG382@T590
Resent-Date: Thu, 16 Sep 2021 08:09:09 +0000 (UTC)

On Wed, Sep 15, 2021 at 05:20:06PM +0800, Yu Kuai wrote:
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

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming

