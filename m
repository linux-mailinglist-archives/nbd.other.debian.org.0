Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 972F8186FD7
	for <lists+nbd@lfdr.de>; Mon, 16 Mar 2020 17:18:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7DDF9205CB; Mon, 16 Mar 2020 16:18:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar 16 16:18:20 2020
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B736820539
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Mar 2020 16:02:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KInO8RMEhsgG for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Mar 2020 16:02:06 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by bendel.debian.org (Postfix) with ESMTP id 2AAAE20541
	for <nbd@other.debian.org>; Mon, 16 Mar 2020 16:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g9NYthtSyS0TAEKXo9BxTrSBFRL6EUd/t78j4Okqe78=;
	b=ZGEVBUZ8yBp8fPgyHB3wameB5Lcg83RUXvWXgxOiJedE4jDZSqmjYMvUh8ng9MULWW4njK
	VuxkFYnlAU0LdJ8X90FAQaRj+eTPxy7/koC9SqBGvjvmxsle2A76NEGwvt7pr3ORkWz19Z
	pQn3QnaZYBgdn/IUTSy5qQ5uLNngIxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436--xwhKOgqNiyCSqdkrDohug-1; Mon, 16 Mar 2020 11:31:00 -0400
X-MC-Unique: -xwhKOgqNiyCSqdkrDohug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8D481105616;
	Mon, 16 Mar 2020 15:30:58 +0000 (UTC)
Received: from ming.t460p (ovpn-8-29.pek2.redhat.com [10.72.8.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 307C11CB;
	Mon, 16 Mar 2020 15:30:47 +0000 (UTC)
Date: Mon, 16 Mar 2020 23:30:33 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yufen Yu <yuyufen@huawei.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	nbd@other.debian.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] nbd: make starting request more reasonable
Message-ID: <20200316153033.GA11016@ming.t460p>
References: <20200303130843.12065-1-yuyufen@huawei.com>
 <9cdba8b1-f0e5-a079-8d44-0078478dd4d8@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cdba8b1-f0e5-a079-8d44-0078478dd4d8@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <otyPAtsIvUG.A.7WE.Mb6beB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/855
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200316153033.GA11016@ming.t460p
Resent-Date: Mon, 16 Mar 2020 16:18:20 +0000 (UTC)

On Mon, Mar 16, 2020 at 08:26:35PM +0800, Yufen Yu wrote:
> Ping and Cc to more expert in blk-mq.
> 
> On 2020/3/3 21:08, Yufen Yu wrote:
> > Our test robot reported a warning for refcount_dec trying to decrease
> > value '0'. The reason is that blk_mq_dispatch_rq_list() try to complete
> > the failed request from nbd driver, while the request have finished in
> > nbd timeout handle function. The race as following:
> > 
> > CPU1                             CPU2
> > 
> > //req->ref = 1
> > blk_mq_dispatch_rq_list
> > nbd_queue_rq
> >    nbd_handle_cmd
> >      blk_mq_start_request
> >                                   blk_mq_check_expired
> >                                     //req->ref = 2
> >                                     blk_mq_rq_timed_out
> >                                       nbd_xmit_timeout

This shouldn't happen in reality, given rq->deadline is just updated
in blk_mq_start_request(), suppose you use the default 30 sec timeout.
How can the race be triggered in so short time?

Could you explain a bit your test case?

> >                                         blk_mq_complete_request
> >                                           //req->ref = 1
> >                                           refcount_dec_and_test(&req->ref)
> > 
> >                                     refcount_dec_and_test(&req->ref)
> >                                     //req->ref = 0
> >                                       __blk_mq_free_request(req)
> >    ret = BLK_STS_IOERR
> > blk_mq_end_request
> > // req->ref = 0, req have been free
> > refcount_dec_and_test(&rq->ref)
> > 
> > In fact, the bug also have been reported by syzbot:
> >    https://lkml.org/lkml/2018/12/5/1308
> > 
> > Since the request have been freed by timeout handle, it can be reused
> > by others. Then, blk_mq_end_request() may get the re-initialized request
> > and free it, which is unexpected.
> > 
> > To fix the problem, we move blk_mq_start_request() down until the driver
> > will handle the request actully. If .queue_rq return something error in
> > preparation phase, timeout handle may don't need. Thus, moving start
> > request down may be more reasonable. Then, nbd_queue_rq() will not return
> > BLK_STS_IOERR after starting request.
> > 
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Yufen Yu <yuyufen@huawei.com>
> > ---
> >   drivers/block/nbd.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 78181908f0df..5256e9d02a03 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -541,6 +541,8 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
> >   		return -EIO;
> >   	}
> > +	blk_mq_start_request(req);
> > +
> >   	if (req->cmd_flags & REQ_FUA)
> >   		nbd_cmd_flags |= NBD_CMD_FLAG_FUA;
> > @@ -879,7 +881,6 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
> >   	if (!refcount_inc_not_zero(&nbd->config_refs)) {
> >   		dev_err_ratelimited(disk_to_dev(nbd->disk),
> >   				    "Socks array is empty\n");
> > -		blk_mq_start_request(req);

I think it is fine to not start request in case of failure, given 
__blk_mq_end_request() doesn't check rq's state.



Thanks,
Ming

