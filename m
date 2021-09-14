Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2B40A8C3
	for <lists+nbd@lfdr.de>; Tue, 14 Sep 2021 10:03:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 504C220455; Tue, 14 Sep 2021 08:03:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 14 08:03:13 2021
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
	by bendel.debian.org (Postfix) with ESMTP id A8B692035E
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Sep 2021 07:46:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.259 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.398,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1q2PWIxrrJof for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Sep 2021 07:46:37 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id E157320355
	for <nbd@other.debian.org>; Tue, 14 Sep 2021 07:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631605591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HViiRnu75I46+r5aoAeD0e3kDx7NMxZUbAuKksyTKDo=;
	b=WCg7Ht5LPChiMl0AUZs8wZVvsaAYmJ1eZXUw68azs4cO1ny4GkDGK8Ewj1eis0U8ksv4F4
	510O/TCvOKN6Iew3TaHmHm37hf8iCOQ7kRA7fE9EPDraogyZS1+ruTm5bOXuvlVkPTx2km
	yfjdiaxSpRC6UXNQviFEGXrQKeCGP7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-EytKr-llMZaAcjwQWjDUtg-1; Tue, 14 Sep 2021 03:46:29 -0400
X-MC-Unique: EytKr-llMZaAcjwQWjDUtg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14FB71017965;
	Tue, 14 Sep 2021 07:46:28 +0000 (UTC)
Received: from T590 (ovpn-13-174.pek2.redhat.com [10.72.13.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D650210016F5;
	Tue, 14 Sep 2021 07:46:19 +0000 (UTC)
Date: Tue, 14 Sep 2021 15:46:28 +0800
From: Ming Lei <ming.lei@redhat.com>
To: "yukuai (C)" <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, hch@infradead.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, yi.zhang@huawei.com
Subject: Re: [PATCH v5 5/6] nbd: convert to use blk_mq_find_and_get_req()
Message-ID: <YUBTVBioqJ7qas2R@T590>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
 <20210909141256.2606682-6-yukuai3@huawei.com>
 <YT/2z4PSeW5oJWMq@T590>
 <c6af73a2-f12d-eeef-616e-ae0cdb4f6f2d@huawei.com>
 <YUBE4BJ7+kN1c4l8@T590>
 <374c6b37-b4b2-fe01-66be-ca2dbbc283e9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <374c6b37-b4b2-fe01-66be-ca2dbbc283e9@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <O9HJALmEAm.A.48H.BdFQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1455
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUBTVBioqJ7qas2R@T590
Resent-Date: Tue, 14 Sep 2021 08:03:13 +0000 (UTC)

On Tue, Sep 14, 2021 at 03:13:38PM +0800, yukuai (C) wrote:
> On 2021/09/14 14:44, Ming Lei wrote:
> > On Tue, Sep 14, 2021 at 11:11:06AM +0800, yukuai (C) wrote:
> > > On 2021/09/14 9:11, Ming Lei wrote:
> > > > On Thu, Sep 09, 2021 at 10:12:55PM +0800, Yu Kuai wrote:
> > > > > blk_mq_tag_to_rq() can only ensure to return valid request in
> > > > > following situation:
> > > > > 
> > > > > 1) client send request message to server first
> > > > > submit_bio
> > > > > ...
> > > > >    blk_mq_get_tag
> > > > >    ...
> > > > >    blk_mq_get_driver_tag
> > > > >    ...
> > > > >    nbd_queue_rq
> > > > >     nbd_handle_cmd
> > > > >      nbd_send_cmd
> > > > > 
> > > > > 2) client receive respond message from server
> > > > > recv_work
> > > > >    nbd_read_stat
> > > > >     blk_mq_tag_to_rq
> > > > > 
> > > > > If step 1) is missing, blk_mq_tag_to_rq() will return a stale
> > > > > request, which might be freed. Thus convert to use
> > > > > blk_mq_find_and_get_req() to make sure the returned request is not
> > > > > freed.
> > > > 
> > > > But NBD_CMD_INFLIGHT has been added for checking if the reply is
> > > > expected, do we still need blk_mq_find_and_get_req() for covering
> > > > this issue? BTW, request and its payload is pre-allocated, so there
> > > > isn't real use-after-free.
> > > 
> > > Hi, Ming
> > > 
> > > Checking NBD_CMD_INFLIGHT relied on the request founded by tag is valid,
> > > not the other way round.
> > > 
> > > nbd_read_stat
> > >   req = blk_mq_tag_to_rq()
> > >   cmd = blk_mq_rq_to_pdu(req)
> > >   mutex_lock(cmd->lock)
> > >   checking NBD_CMD_INFLIGHT
> > 
> > Request and its payload is pre-allocated, and either req->ref or cmd->lock can
> > serve the same purpose here. Once cmd->lock is held, you can check if the cmd is
> > inflight or not. If it isn't inflight, just return -ENOENT. Is there any
> > problem to handle in this way?
> 
> Hi, Ming
> 
> in nbd_read_stat:
> 
> 1) get a request by tag first
> 2) get nbd_cmd by the request
> 3) hold cmd->lock and check if cmd is inflight
> 
> If we want to check if the cmd is inflight in step 3), we have to do
> setp 1) and 2) first. As I explained in patch 0, blk_mq_tag_to_rq()
> can't make sure the returned request is not freed:
> 
> nbd_read_stat
> 			blk_mq_sched_free_requests
> 			 blk_mq_free_rqs
>   blk_mq_tag_to_rq
>   -> get rq before clear mapping
> 			  blk_mq_clear_rq_mapping
> 			  __free_pages -> rq is freed
>   blk_mq_request_started -> UAF

If the above can happen, blk_mq_find_and_get_req() may not fix it too, just
wondering why not take the following simpler way for avoiding the UAF?

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5170a630778d..dfa5cce71f66 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -795,9 +795,13 @@ static void recv_work(struct work_struct *work)
 						     work);
 	struct nbd_device *nbd = args->nbd;
 	struct nbd_config *config = nbd->config;
+	struct request_queue *q = nbd->disk->queue;
 	struct nbd_cmd *cmd;
 	struct request *rq;
 
+	if (!percpu_ref_tryget(&q->q_usage_counter))
+                return;
+
 	while (1) {
 		cmd = nbd_read_stat(nbd, args->index);
 		if (IS_ERR(cmd)) {
@@ -813,6 +817,7 @@ static void recv_work(struct work_struct *work)
 		if (likely(!blk_should_fake_timeout(rq->q)))
 			blk_mq_complete_request(rq);
 	}
+	blk_queue_exit(q);
 	nbd_config_put(nbd);
 	atomic_dec(&config->recv_threads);
 	wake_up(&config->recv_wq);

Thanks,
Ming

