Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8CC3E438A
	for <lists+nbd@lfdr.de>; Mon,  9 Aug 2021 12:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2F49C20357; Mon,  9 Aug 2021 10:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug  9 10:03:09 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 0C6D420327
	for <lists-other-nbd@bendel.debian.org>; Mon,  9 Aug 2021 09:47:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.355 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7S0gBvrayL-t for <lists-other-nbd@bendel.debian.org>;
	Mon,  9 Aug 2021 09:47:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 11919 seconds by postgrey-1.36 at bendel; Mon, 09 Aug 2021 09:47:19 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 0CFCC20318
	for <nbd@other.debian.org>; Mon,  9 Aug 2021 09:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628502433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YIzxW1n4ek2sfIW3v4j8n0cb8MmPxkckfn2o3SBMVJk=;
	b=gX6z3SrFcr6OeD6qW2lQuLyqsYx4pZGlgErfWK/DlGDvig3vRUkKGGIG9l9kbirhTBu2JD
	FVb/GJ2e52CY7SovJqX4QeHDBrT47tQJwD0udjBhy7OAKImpd8MiaNt9k9qTSGic0bSTvJ
	9cczNwO9JLNFqp3q/nllsayWe53UjAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-LewsWq59NQC-jFhdWak5mw-1; Mon, 09 Aug 2021 05:47:12 -0400
X-MC-Unique: LewsWq59NQC-jFhdWak5mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8BB61074661;
	Mon,  9 Aug 2021 09:47:10 +0000 (UTC)
Received: from T590 (ovpn-13-190.pek2.redhat.com [10.72.13.190])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3EEC7A8D5;
	Mon,  9 Aug 2021 09:47:03 +0000 (UTC)
Date: Mon, 9 Aug 2021 17:46:58 +0800
From: Ming Lei <ming.lei@redhat.com>
To: "yukuai (C)" <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, bvanassche@acm.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, yi.zhang@huawei.com
Subject: Re: [PATCH v2 2/2] nbd: convert to use blk_mq_get_rq_by_tag()
Message-ID: <YRD5krmF/C7JxchE@T590>
References: <20210809030927.1946162-1-yukuai3@huawei.com>
 <20210809030927.1946162-3-yukuai3@huawei.com>
 <YRDK9tBFscK5ScK8@T590>
 <47e5faa8-f8e5-86db-05a1-559e3b3c04b5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47e5faa8-f8e5-86db-05a1-559e3b3c04b5@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <u0sc4RKoFXO.A.JVB.d1PEhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1257
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YRD5krmF/C7JxchE@T590
Resent-Date: Mon,  9 Aug 2021 10:03:09 +0000 (UTC)

On Mon, Aug 09, 2021 at 03:08:26PM +0800, yukuai (C) wrote:
> On 2021/08/09 14:28, Ming Lei wrote:
> > On Mon, Aug 09, 2021 at 11:09:27AM +0800, Yu Kuai wrote:
> > > blk_mq_tag_to_rq() might return freed request, use
> > > blk_mq_get_rq_by_tag() instead.
> > > 
> > > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > > ---
> > >   drivers/block/nbd.c | 11 ++++++-----
> > >   1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > > index c38317979f74..9e56975a8eee 100644
> > > --- a/drivers/block/nbd.c
> > > +++ b/drivers/block/nbd.c
> > > @@ -713,11 +713,10 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
> > >   	tag = nbd_handle_to_tag(handle);
> > >   	hwq = blk_mq_unique_tag_to_hwq(tag);
> > >   	if (hwq < nbd->tag_set.nr_hw_queues)
> > > -		req = blk_mq_tag_to_rq(nbd->tag_set.tags[hwq],
> > > -				       blk_mq_unique_tag_to_tag(tag));
> > > -	if (!req || !blk_mq_request_started(req)) {
> > > -		dev_err(disk_to_dev(nbd->disk), "Unexpected reply (%d) %p\n",
> > > -			tag, req);
> > > +		req = blk_mq_get_rq_by_tag(nbd->tag_set.tags[hwq],
> > > +					   blk_mq_unique_tag_to_tag(tag));
> > > +	if (!req) {
> > > +		dev_err(disk_to_dev(nbd->disk), "Unexpected reply %d\n", tag);
> > >   		return ERR_PTR(-ENOENT);
> > >   	}
> > >   	trace_nbd_header_received(req, handle);
> > > @@ -779,6 +778,8 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
> > >   	}
> > >   out:
> > >   	trace_nbd_payload_received(req, handle);
> > > +	if (req)
> > > +		blk_mq_put_rq_ref(req);
> > >   	mutex_unlock(&cmd->lock);
> > >   	return ret ? ERR_PTR(ret) : cmd;
> > 
> > After blk_mq_put_rq_ref() returns, this request may have been freed,
> > so the returned 'cmd' may have been freed too.
> > 
> > As I replied in your another thread, it is driver's responsibility to
> > cover race between normal completion and timeout/error handling, that
> > means the caller of blk_mq_tag_to_rq need to make sure that the request
> > represented by the passed 'tag' can't be freed.
> 
> Hi, Ming
> 
> There are two problems here in nbd, both reported by our syzkaller.
> 
> The first is that blk_mq_tag_to_rq() returned a freed request, which is
> because tags->static_rq[] is freed without clearing tags->rq[].
> Syzkaller log shows that a reply package is sent to client without
> the client's request package. And this patch is trying to solve this
> problem.

It is still driver's problem:

->static_rq is freed in blk_mq_free_tag_set() which is called after
blk_cleanup_disk() returns. Once blk_cleanup_disk() returns, there
shouldn't be any driver activity, including calling blk_mq_tag_to_rq()
by passing one invalid tag.


Thanks, 
Ming

