Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCAC186FFD
	for <lists+nbd@lfdr.de>; Mon, 16 Mar 2020 17:27:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4EC10205D5; Mon, 16 Mar 2020 16:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar 16 16:27:09 2020
Old-Return-Path: <kbusch@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 092B320595
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Mar 2020 16:09:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.181 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1v07vifUR6zA for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Mar 2020 16:09:16 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
X-Greylist: delayed 403 seconds by postgrey-1.36 at bendel; Mon, 16 Mar 2020 16:09:16 UTC
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A6E28204EB
	for <nbd@other.debian.org>; Mon, 16 Mar 2020 16:09:16 +0000 (UTC)
Received: from dhcp-10-100-145-180.wdl.wdc.com (unknown [199.255.45.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 219E020736;
	Mon, 16 Mar 2020 16:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584374549;
	bh=F3uFtZA2u8ZRQ54n1OuUoE9Ws/+UJuLW87tZNfqbDos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqz3GvQqTBL2dU+QJb2MnA1FFWV/CZV4h+o8R7j7teKy/OCVNsG562uC14dWiMYge
	 +YpMv1Bi2ZL/Wy5jIHygei+WetIpfjxtMmLere6GrFeZC2fL67fqi1qYsSJLxR5AKe
	 R8zCSrCShvusq04uEtBmq+7zQ5MgOreeT9txK5Rk=
Date: Mon, 16 Mar 2020 09:02:27 -0700
From: Keith Busch <kbusch@kernel.org>
To: Ming Lei <ming.lei@redhat.com>
Cc: Yufen Yu <yuyufen@huawei.com>, josef@toxicpanda.com, axboe@kernel.dk,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] nbd: make starting request more reasonable
Message-ID: <20200316160227.GA1069861@dhcp-10-100-145-180.wdl.wdc.com>
References: <20200303130843.12065-1-yuyufen@huawei.com>
 <9cdba8b1-f0e5-a079-8d44-0078478dd4d8@huawei.com>
 <20200316153033.GA11016@ming.t460p>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316153033.GA11016@ming.t460p>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YLWyywjTJ9F.A.AIF.dj6beB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/856
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200316160227.GA1069861@dhcp-10-100-145-180.wdl.wdc.com
Resent-Date: Mon, 16 Mar 2020 16:27:09 +0000 (UTC)

On Mon, Mar 16, 2020 at 11:30:33PM +0800, Ming Lei wrote:
> On Mon, Mar 16, 2020 at 08:26:35PM +0800, Yufen Yu wrote:
> > > +	blk_mq_start_request(req);
> > > +
> > >   	if (req->cmd_flags & REQ_FUA)
> > >   		nbd_cmd_flags |= NBD_CMD_FLAG_FUA;
> > > @@ -879,7 +881,6 @@ static int nbd_handle_cmd(struct nbd_cmd *cmd, int index)
> > >   	if (!refcount_inc_not_zero(&nbd->config_refs)) {
> > >   		dev_err_ratelimited(disk_to_dev(nbd->disk),
> > >   				    "Socks array is empty\n");
> > > -		blk_mq_start_request(req);
> 
> I think it is fine to not start request in case of failure, given 
> __blk_mq_end_request() doesn't check rq's state.

Not only is it fine to not start it, blk-mq expects the low level
driver will not tell it to start a request that the lld doesn't
actually start. A started request should be completed through
blk_mq_complete_request(). Returning an error from your queue_rq()
doesn't do that, and starting it will have blk-mq track the request as
an in-flight request.

