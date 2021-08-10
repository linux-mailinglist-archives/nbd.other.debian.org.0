Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A773E50DE
	for <lists+nbd@lfdr.de>; Tue, 10 Aug 2021 04:06:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1B3F02036E; Tue, 10 Aug 2021 02:06:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 10 02:06:21 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FVGT_m_MULTI_ODD,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D8D942035A
	for <lists-other-nbd@bendel.debian.org>; Tue, 10 Aug 2021 01:49:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.335 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.474,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id t9yV62ihYSNq for <lists-other-nbd@bendel.debian.org>;
	Tue, 10 Aug 2021 01:49:07 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id C3964202BE
	for <nbd@other.debian.org>; Tue, 10 Aug 2021 01:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628560142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G/dSgq/cGf57vOSvcWuPjjmCIcASPDhZxQFXSenWC5Q=;
	b=CDb0HJlYyJHF07uGMSuXFla6M/W0tJeAZ0itE69r4wfM6yjSY0VEgriYHAK0lHLjLbsIwK
	ixtMQ3eVhWyqX/JVR9rkkAcGw/Lw1iK6aaDEfRigMrkwOnHFyGlRxIKMGByKDlwcqlrZfQ
	HahmSC2idxAr2FkmgVJmPDNEjObaF7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-y01V_X30N12RlviB-2aszw-1; Mon, 09 Aug 2021 21:49:01 -0400
X-MC-Unique: y01V_X30N12RlviB-2aszw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFB5787146F;
	Tue, 10 Aug 2021 01:48:59 +0000 (UTC)
Received: from T590 (ovpn-13-190.pek2.redhat.com [10.72.13.190])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B73C210016FB;
	Tue, 10 Aug 2021 01:48:51 +0000 (UTC)
Date: Tue, 10 Aug 2021 09:48:46 +0800
From: Ming Lei <ming.lei@redhat.com>
To: "yukuai (C)" <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, bvanassche@acm.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, yi.zhang@huawei.com
Subject: Re: [PATCH v2 2/2] nbd: convert to use blk_mq_get_rq_by_tag()
Message-ID: <YRHa/keJ4pHP3hnL@T590>
References: <20210809030927.1946162-1-yukuai3@huawei.com>
 <20210809030927.1946162-3-yukuai3@huawei.com>
 <YRDK9tBFscK5ScK8@T590>
 <47e5faa8-f8e5-86db-05a1-559e3b3c04b5@huawei.com>
 <YRD5krmF/C7JxchE@T590>
 <3adf6183-bf40-10cd-b8ed-552120028ca3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3adf6183-bf40-10cd-b8ed-552120028ca3@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <94jUrYTXrdH.A.-NC.d8dEhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1259
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YRHa/keJ4pHP3hnL@T590
Resent-Date: Tue, 10 Aug 2021 02:06:21 +0000 (UTC)

On Mon, Aug 09, 2021 at 10:04:32PM +0800, yukuai (C) wrote:
> On 2021/08/09 17:46, Ming Lei wrote:
> > On Mon, Aug 09, 2021 at 03:08:26PM +0800, yukuai (C) wrote:
> > > On 2021/08/09 14:28, Ming Lei wrote:
> > > > On Mon, Aug 09, 2021 at 11:09:27AM +0800, Yu Kuai wrote:
> > > > > blk_mq_tag_to_rq() might return freed request, use
> > > > > blk_mq_get_rq_by_tag() instead.
> > > > > 
> > > > > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > > > > ---
> > > > >    drivers/block/nbd.c | 11 ++++++-----
> > > > >    1 file changed, 6 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > > > > index c38317979f74..9e56975a8eee 100644
> > > > > --- a/drivers/block/nbd.c
> > > > > +++ b/drivers/block/nbd.c
> > > > > @@ -713,11 +713,10 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
> > > > >    	tag = nbd_handle_to_tag(handle);
> > > > >    	hwq = blk_mq_unique_tag_to_hwq(tag);
> > > > >    	if (hwq < nbd->tag_set.nr_hw_queues)
> > > > > -		req = blk_mq_tag_to_rq(nbd->tag_set.tags[hwq],
> > > > > -				       blk_mq_unique_tag_to_tag(tag));
> > > > > -	if (!req || !blk_mq_request_started(req)) {
> > > > > -		dev_err(disk_to_dev(nbd->disk), "Unexpected reply (%d) %p\n",
> > > > > -			tag, req);
> > > > > +		req = blk_mq_get_rq_by_tag(nbd->tag_set.tags[hwq],
> > > > > +					   blk_mq_unique_tag_to_tag(tag));
> > > > > +	if (!req) {
> > > > > +		dev_err(disk_to_dev(nbd->disk), "Unexpected reply %d\n", tag);
> > > > >    		return ERR_PTR(-ENOENT);
> > > > >    	}
> > > > >    	trace_nbd_header_received(req, handle);
> > > > > @@ -779,6 +778,8 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
> > > > >    	}
> > > > >    out:
> > > > >    	trace_nbd_payload_received(req, handle);
> > > > > +	if (req)
> > > > > +		blk_mq_put_rq_ref(req);
> > > > >    	mutex_unlock(&cmd->lock);
> > > > >    	return ret ? ERR_PTR(ret) : cmd;
> > > > 
> > > > After blk_mq_put_rq_ref() returns, this request may have been freed,
> > > > so the returned 'cmd' may have been freed too.
> > > > 
> > > > As I replied in your another thread, it is driver's responsibility to
> > > > cover race between normal completion and timeout/error handling, that
> > > > means the caller of blk_mq_tag_to_rq need to make sure that the request
> > > > represented by the passed 'tag' can't be freed.
> > > 
> > > Hi, Ming
> > > 
> > > There are two problems here in nbd, both reported by our syzkaller.
> > > 
> > > The first is that blk_mq_tag_to_rq() returned a freed request, which is
> > > because tags->static_rq[] is freed without clearing tags->rq[].
> > > Syzkaller log shows that a reply package is sent to client without
> > > the client's request package. And this patch is trying to solve this
> > > problem.
> > 
> > It is still driver's problem:
> > 
> > ->static_rq is freed in blk_mq_free_tag_set() which is called after
> > blk_cleanup_disk() returns. Once blk_cleanup_disk() returns, there
> > shouldn't be any driver activity, including calling blk_mq_tag_to_rq()
> > by passing one invalid tag.
> > 
> 
> Hi, Ming
> 
> I understand if static_rq is freed through blk_mq_free_tag_set(),
> drivers should not use static_rq anymore.
> 
> By the way, I was thinking about another path:
> 
> blk_mq_update_nr_requests
>  if (!hctx->sched_tags) -> if this is true
>   ret = blk_mq_tag_update_depth(hctx, &hctx->tags, nr, false)
>    blk_mq_free_rqs -> static_rq is freed here
> 
> If this path concurrent with nbd_read_stat(), nbd_read_stat() can
> get a freed request by blk_mq_tag_to_rq(), since tags->lock is not
> held.
> 
> t1: nbd_read_stat	  t2: blk_mq_update_nr_requests
> rq = blk_mq_tag_to_rq()
> 			  blk_mq_free_rqs

t1 isn't supposed to happen when t2 is running.

blk_mq_update_nr_requests() is only called by nbd_start_device().

nbd_start_device():
	        if (nbd->task_recv)
                return -EBUSY;
			...
			nbd->recv_workq = alloc_workqueue()

That means nbd_config_put() has been called and ->config_refs has
dropped to zero, so socket has been shutdown, and ->recv_workq has
been destroyed, so t1 isn't supposed to happen when t2 is running.

> 
> By holding tags->lock, we can check that rq state is idle, and it's
> ref is 0.

Firstly tags->lock can't fix the race[1], secondly it should be addressed
in driver.

[1] https://lore.kernel.org/linux-block/20210809030927.1946162-2-yukuai3@huawei.com/T/#m6651289c5718b45a8ae8a7efc889248f8cb904a3


Thanks,
Ming

