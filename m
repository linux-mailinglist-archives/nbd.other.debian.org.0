Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD3D1877EF
	for <lists+nbd@lfdr.de>; Tue, 17 Mar 2020 03:57:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BE83120546; Tue, 17 Mar 2020 02:57:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 17 02:57:08 2020
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 836D520495
	for <lists-other-nbd@bendel.debian.org>; Tue, 17 Mar 2020 02:41:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1LDneD4nljZZ for <lists-other-nbd@bendel.debian.org>;
	Tue, 17 Mar 2020 02:41:36 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 40227 seconds by postgrey-1.36 at bendel; Tue, 17 Mar 2020 02:41:36 UTC
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by bendel.debian.org (Postfix) with ESMTP id 1C1412048D
	for <nbd@other.debian.org>; Tue, 17 Mar 2020 02:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584412890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57TLYf096cNbZro5W6SRKhJY1rLLrbuxcJRHBqezJMY=;
	b=B4yVw+L6JP5kJTVXi8ljvsuyGLg++0fiHzsRdnGQHLG7WnyfJmlY+OEiiDkQdxWvWCjTze
	JJkmu2nA8zC2WjqG4K1WKqKiuq9AXABOQTBbDstlXrxZk0z5yajzm1lWMsMIM6vgOSGeOy
	IDRKlZySbLfSgUWvSRpaalwQne03o1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-K6xeDi6cNh6RAwZKMc5pNg-1; Mon, 16 Mar 2020 22:41:25 -0400
X-MC-Unique: K6xeDi6cNh6RAwZKMc5pNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DC301804544;
	Tue, 17 Mar 2020 02:41:24 +0000 (UTC)
Received: from ming.t460p (ovpn-8-26.pek2.redhat.com [10.72.8.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44D575D9C9;
	Tue, 17 Mar 2020 02:41:16 +0000 (UTC)
Date: Tue, 17 Mar 2020 10:41:12 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Keith Busch <kbusch@kernel.org>
Cc: Yufen Yu <yuyufen@huawei.com>, josef@toxicpanda.com, axboe@kernel.dk,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] nbd: make starting request more reasonable
Message-ID: <20200317024112.GD28478@ming.t460p>
References: <20200303130843.12065-1-yuyufen@huawei.com>
 <9cdba8b1-f0e5-a079-8d44-0078478dd4d8@huawei.com>
 <20200316153033.GA11016@ming.t460p>
 <20200316160227.GA1069861@dhcp-10-100-145-180.wdl.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316160227.GA1069861@dhcp-10-100-145-180.wdl.wdc.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Oyd5PVBvGuB.A.R2D.EyDceB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/857
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200317024112.GD28478@ming.t460p
Resent-Date: Tue, 17 Mar 2020 02:57:08 +0000 (UTC)

On Mon, Mar 16, 2020 at 09:02:27AM -0700, Keith Busch wrote:
> On Mon, Mar 16, 2020 at 11:30:33PM +0800, Ming Lei wrote:
> > On Mon, Mar 16, 2020 at 08:26:35PM +0800, Yufen Yu wrote:
> > > > +	blk_mq_start_request(req);
> > > > +
> > > >   	if (req->cmd_flags & REQ_FUA)
> > > >   		nbd_cmd_flags |= NBD_CMD_FLAG_FUA;
> > > > @@ -879,7 +881,6 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
> > > >   	if (!refcount_inc_not_zero(&nbd->config_refs)) {
> > > >   		dev_err_ratelimited(disk_to_dev(nbd->disk),
> > > >   				    "Socks array is empty\n");
> > > > -		blk_mq_start_request(req);
> > 
> > I think it is fine to not start request in case of failure, given 
> > __blk_mq_end_request() doesn't check rq's state.
> 
> Not only is it fine to not start it, blk-mq expects the low level
> driver will not tell it to start a request that the lld doesn't
> actually start.

Yeah, in theory, driver should do in this way.

> A started request should be completed through
> blk_mq_complete_request(). Returning an error from your queue_rq()
> doesn't do that, and starting it will have blk-mq track the request as
> an in-flight request.

However, error still can happen when lld is starting to queue the command
to hardware, and there are lots of such usage in drivers. I guess this
way won't be avoided completely.


Thanks,
Ming

