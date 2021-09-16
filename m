Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFBF40D609
	for <lists+nbd@lfdr.de>; Thu, 16 Sep 2021 11:24:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D512D208CF; Thu, 16 Sep 2021 09:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 16 09:24:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DD2C0207DB
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Sep 2021 09:06:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.279 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.398,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id co4NEEbDLC6o for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Sep 2021 09:06:40 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 20B88208BB
	for <nbd@other.debian.org>; Thu, 16 Sep 2021 09:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631783195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8rrH0qSkzh8u2B3UN1r9mEqfLYmg3T2yxndwb+Uj150=;
	b=cQUdVwcvtaaP3X6PP6zlEyIT6aSNwjthoagQ4nZSQuKMzmEE0Kp4FwjvEJAz73mh1H0xGR
	+vWBsVywg9shl4wJDR182ODOd552pCzG5yX4/y5FW6wNQjwGUrrW7LKnpwIHCuU/YGcorx
	RTpc0d4TvHeVBTBa5X6O8T2cPmwjBIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-t57okoG8MEi0M8lGaFpNlA-1; Thu, 16 Sep 2021 05:06:33 -0400
X-MC-Unique: t57okoG8MEi0M8lGaFpNlA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F7141084684;
	Thu, 16 Sep 2021 09:06:32 +0000 (UTC)
Received: from T590 (ovpn-12-89.pek2.redhat.com [10.72.12.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E89C460583;
	Thu, 16 Sep 2021 09:06:24 +0000 (UTC)
Date: Thu, 16 Sep 2021 17:06:36 +0800
From: Ming Lei <ming.lei@redhat.com>
To: "yukuai (C)" <yukuai3@huawei.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, hch@infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH v7 6/6] nbd: fix uaf in nbd_handle_reply()
Message-ID: <YUMJHPa5o74G+RS9@T590>
References: <20210915092010.2087371-1-yukuai3@huawei.com>
 <20210915092010.2087371-7-yukuai3@huawei.com>
 <YUL6gJhaNy58Il3v@T590>
 <cb03c008-432e-2b4c-c675-ea2e8f9105dd@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb03c008-432e-2b4c-c675-ea2e8f9105dd@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SQZn0yqGTIK.A.0_H.50wQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1493
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUMJHPa5o74G+RS9@T590
Resent-Date: Thu, 16 Sep 2021 09:24:09 +0000 (UTC)

On Thu, Sep 16, 2021 at 04:47:08PM +0800, yukuai (C) wrote:
> On 2021/09/16 16:04, Ming Lei wrote:
> > On Wed, Sep 15, 2021 at 05:20:10PM +0800, Yu Kuai wrote:
> > > There is a problem that nbd_handle_reply() might access freed request:
> > > 
> > > 1) At first, a normal io is submitted and completed with scheduler:
> > > 
> > > internel_tag = blk_mq_get_tag -> get tag from sched_tags
> > >   blk_mq_rq_ctx_init
> > >    sched_tags->rq[internel_tag] = sched_tag->static_rq[internel_tag]
> > > ...
> > > blk_mq_get_driver_tag
> > >   __blk_mq_get_driver_tag -> get tag from tags
> > >   tags->rq[tag] = sched_tag->static_rq[internel_tag]
> > > 
> > > So, both tags->rq[tag] and sched_tags->rq[internel_tag] are pointing
> > > to the request: sched_tags->static_rq[internal_tag]. Even if the
> > > io is finished.
> > > 
> > > 2) nbd server send a reply with random tag directly:
> > > 
> > > recv_work
> > >   nbd_handle_reply
> > >    blk_mq_tag_to_rq(tags, tag)
> > >     rq = tags->rq[tag]
> > > 
> > > 3) if the sched_tags->static_rq is freed:
> > > 
> > > blk_mq_sched_free_requests
> > >   blk_mq_free_rqs(q->tag_set, hctx->sched_tags, i)
> > >    -> step 2) access rq before clearing rq mapping
> > >    blk_mq_clear_rq_mapping(set, tags, hctx_idx);
> > >    __free_pages() -> rq is freed here
> > > 
> > > 4) Then, nbd continue to use the freed request in nbd_handle_reply
> > > 
> > > Fix the problem by get 'q_usage_counter' before blk_mq_tag_to_rq(),
> > > thus request is ensured not to be freed because 'q_usage_counter' is
> > > not zero.
> > > 
> > > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > > ---
> > >   drivers/block/nbd.c | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > > 
> > > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > > index 9a7bbf8ebe74..3e8b70b5d4f9 100644
> > > --- a/drivers/block/nbd.c
> > > +++ b/drivers/block/nbd.c
> > > @@ -824,6 +824,7 @@ static void recv_work(struct work_struct *work)
> > >   						     work);
> > >   	struct nbd_device *nbd = args->nbd;
> > >   	struct nbd_config *config = nbd->config;
> > > +	struct request_queue *q = nbd->disk->queue;
> > >   	struct nbd_sock *nsock;
> > >   	struct nbd_cmd *cmd;
> > >   	struct request *rq;
> > > @@ -834,7 +835,24 @@ static void recv_work(struct work_struct *work)
> > >   		if (nbd_read_reply(nbd, args->index, &reply))
> > >   			break;
> > > +		/*
> > > +		 * Grab ref of q_usage_counter can prevent request being freed
> > > +		 * during nbd_handle_reply(). If q_usage_counter is zero, then
> > > +		 * no request is inflight, which means something is wrong since
> > > +		 * we expect to find a request to complete here.
> > > +		 */
> > 
> > The above comment is wrong, the purpose is simply for avoiding request
> > pool freed, such as elevator switching won't happen once
> > ->q_usage_counter is grabbed. So no any request UAF can be triggered
> > when calling into nbd_handle_reply().
> 
> Do you mean the comment about q_usage_counter is zero is wrong ?

How about the following words?

/*
 * Grab .q_usage_counter so request pool won't go away, then no request
 * use-after-free is possible during nbd_handle_reply(). If queue is frozen,
 * there won't be any inflight requests, we needn't to handle the incoming
 * garbage message
 */

Thanks,
Ming

