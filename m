Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0701740B213
	for <lists+nbd@lfdr.de>; Tue, 14 Sep 2021 16:51:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 40F4820359; Tue, 14 Sep 2021 14:51:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 14 14:51:20 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 7D23A20487
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Sep 2021 14:33:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.279 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.398,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aNvNpbILc_64 for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Sep 2021 14:33:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id B95952048B
	for <nbd@other.debian.org>; Tue, 14 Sep 2021 14:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631630013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=chATlUeF4N2elSt4fnYjmQllXyvDEPn10NBT5Xpx3Lc=;
	b=bPFtm/39YT0DUCi0Dh7hM3PJaoJcl3JrpSTaQIofS1dg0Mob3dAD1ZzenPEGWHmtxP/3wg
	V6qAWRU3YYndW1L4SCfCf9dcKUmhSDFuAVtmuckyaQCb7PLSk938wGyi06OzbCEuuAqUJI
	A9X0sS9ADRDoDQ+bhbrJlCWwRVkkjNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-xqTRlyvPP4GVeILmnWrUCw-1; Tue, 14 Sep 2021 10:33:31 -0400
X-MC-Unique: xqTRlyvPP4GVeILmnWrUCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 556671060DAB;
	Tue, 14 Sep 2021 14:33:30 +0000 (UTC)
Received: from T590 (ovpn-12-32.pek2.redhat.com [10.72.12.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B65585D9DC;
	Tue, 14 Sep 2021 14:33:22 +0000 (UTC)
Date: Tue, 14 Sep 2021 22:33:32 +0800
From: Ming Lei <ming.lei@redhat.com>
To: "yukuai (C)" <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, hch@infradead.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, yi.zhang@huawei.com
Subject: Re: [PATCH v5 5/6] nbd: convert to use blk_mq_find_and_get_req()
Message-ID: <YUCyvDDG0gOzaFfR@T590>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
 <20210909141256.2606682-6-yukuai3@huawei.com>
 <YT/2z4PSeW5oJWMq@T590>
 <c6af73a2-f12d-eeef-616e-ae0cdb4f6f2d@huawei.com>
 <YUBE4BJ7+kN1c4l8@T590>
 <374c6b37-b4b2-fe01-66be-ca2dbbc283e9@huawei.com>
 <YUBTVBioqJ7qas2R@T590>
 <39e628cc-496c-ba20-b53a-fbeecc1d7e4e@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39e628cc-496c-ba20-b53a-fbeecc1d7e4e@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <b8cxTFFQAbL.A.67B.obLQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1460
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUCyvDDG0gOzaFfR@T590
Resent-Date: Tue, 14 Sep 2021 14:51:20 +0000 (UTC)

On Tue, Sep 14, 2021 at 05:08:00PM +0800, yukuai (C) wrote:
> On 2021/09/14 15:46, Ming Lei wrote:
> > On Tue, Sep 14, 2021 at 03:13:38PM +0800, yukuai (C) wrote:
> > > On 2021/09/14 14:44, Ming Lei wrote:
> > > > On Tue, Sep 14, 2021 at 11:11:06AM +0800, yukuai (C) wrote:
> > > > > On 2021/09/14 9:11, Ming Lei wrote:
> > > > > > On Thu, Sep 09, 2021 at 10:12:55PM +0800, Yu Kuai wrote:
> > > > > > > blk_mq_tag_to_rq() can only ensure to return valid request in
> > > > > > > following situation:
> > > > > > > 
> > > > > > > 1) client send request message to server first
> > > > > > > submit_bio
> > > > > > > ...
> > > > > > >     blk_mq_get_tag
> > > > > > >     ...
> > > > > > >     blk_mq_get_driver_tag
> > > > > > >     ...
> > > > > > >     nbd_queue_rq
> > > > > > >      nbd_handle_cmd
> > > > > > >       nbd_send_cmd
> > > > > > > 
> > > > > > > 2) client receive respond message from server
> > > > > > > recv_work
> > > > > > >     nbd_read_stat
> > > > > > >      blk_mq_tag_to_rq
> > > > > > > 
> > > > > > > If step 1) is missing, blk_mq_tag_to_rq() will return a stale
> > > > > > > request, which might be freed. Thus convert to use
> > > > > > > blk_mq_find_and_get_req() to make sure the returned request is not
> > > > > > > freed.
> > > > > > 
> > > > > > But NBD_CMD_INFLIGHT has been added for checking if the reply is
> > > > > > expected, do we still need blk_mq_find_and_get_req() for covering
> > > > > > this issue? BTW, request and its payload is pre-allocated, so there
> > > > > > isn't real use-after-free.
> > > > > 
> > > > > Hi, Ming
> > > > > 
> > > > > Checking NBD_CMD_INFLIGHT relied on the request founded by tag is valid,
> > > > > not the other way round.
> > > > > 
> > > > > nbd_read_stat
> > > > >    req = blk_mq_tag_to_rq()
> > > > >    cmd = blk_mq_rq_to_pdu(req)
> > > > >    mutex_lock(cmd->lock)
> > > > >    checking NBD_CMD_INFLIGHT
> > > > 
> > > > Request and its payload is pre-allocated, and either req->ref or cmd->lock can
> > > > serve the same purpose here. Once cmd->lock is held, you can check if the cmd is
> > > > inflight or not. If it isn't inflight, just return -ENOENT. Is there any
> > > > problem to handle in this way?
> > > 
> > > Hi, Ming
> > > 
> > > in nbd_read_stat:
> > > 
> > > 1) get a request by tag first
> > > 2) get nbd_cmd by the request
> > > 3) hold cmd->lock and check if cmd is inflight
> > > 
> > > If we want to check if the cmd is inflight in step 3), we have to do
> > > setp 1) and 2) first. As I explained in patch 0, blk_mq_tag_to_rq()
> > > can't make sure the returned request is not freed:
> > > 
> > > nbd_read_stat
> > > 			blk_mq_sched_free_requests
> > > 			 blk_mq_free_rqs
> > >    blk_mq_tag_to_rq
> > >    -> get rq before clear mapping
> > > 			  blk_mq_clear_rq_mapping
> > > 			  __free_pages -> rq is freed
> > >    blk_mq_request_started -> UAF
> > 
> > If the above can happen, blk_mq_find_and_get_req() may not fix it too, just
> 
> Hi, Ming
> 
> Why can't blk_mq_find_and_get_req() fix it? I can't think of any
> scenario that might have problem currently.

The principle behind blk_mq_find_and_get_req() is that if one request's
ref is grabbed, the queue's usage counter is guaranteed to be grabbed,
and this way isn't straight-forward.

Yeah, it can fix the issue, but I don't think it is good to call it in
fast path cause tags->lock is required.

> 
> > wondering why not take the following simpler way for avoiding the UAF?
> > 
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 5170a630778d..dfa5cce71f66 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -795,9 +795,13 @@ static void recv_work(struct work_struct *work)
> >   						     work);
> >   	struct nbd_device *nbd = args->nbd;
> >   	struct nbd_config *config = nbd->config;
> > +	struct request_queue *q = nbd->disk->queue;
> >   	struct nbd_cmd *cmd;
> >   	struct request *rq;
> > +	if (!percpu_ref_tryget(&q->q_usage_counter))
> > +                return;
> > +
> 
> We can't make sure freeze_queue is called before this, thus this approch
> can't fix the problem, right?
>  nbd_read_stat
>     blk_mq_tag_to_rq
> 			elevator_switch
> 			 blk_mq_freeze_queue(q);
> 			 elevator_switch_mq
> 			  elevator_exit
> 			   blk_mq_sched_free_requests
>     blk_mq_request_started -> UAF

No, blk_mq_freeze_queue() waits until .q_usage_counter becomes zero, so
there won't be any concurrent nbd_read_stat() during switching elevator
if ->q_usage_counter is grabbed in recv_work().

Thanks,
Ming

