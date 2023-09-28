Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9197B16F2
	for <lists+nbd@lfdr.de>; Thu, 28 Sep 2023 11:15:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D5BB7204EB; Thu, 28 Sep 2023 09:15:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 28 09:15:12 2023
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 64889205D8
	for <lists-other-nbd@bendel.debian.org>; Thu, 28 Sep 2023 08:59:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.801 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gQSt8l230mWe for <lists-other-nbd@bendel.debian.org>;
	Thu, 28 Sep 2023 08:59:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 71591205B9
	for <nbd@other.debian.org>; Thu, 28 Sep 2023 08:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695891541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1w2p4pUjtxxoV1R5cJrguGHA5IKS39OopmDiYZUaHe4=;
	b=LlYUIpPYSBw8Dlu6NAR2LFegY4DjH9j7Gc+1dbhdNB2NxviNfzqbrrXDBIpU4SQ7xQ0+Bc
	Fipm5K7ref6icMb9E6MXwNIXM+vRE09+GcQAOdAF+9fnENwdIyjjZ80bjNmCiflP14TA/e
	mUxY8zEVk4HgX0Dj7EplAolvl5w8PzQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-tFs_Zc5kPXmsCExnX1VLSg-1; Thu, 28 Sep 2023 04:57:28 -0400
X-MC-Unique: tFs_Zc5kPXmsCExnX1VLSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7E42811E8D;
	Thu, 28 Sep 2023 08:57:27 +0000 (UTC)
Received: from fedora (unknown [10.72.120.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F27028FE;
	Thu, 28 Sep 2023 08:57:20 +0000 (UTC)
Date: Thu, 28 Sep 2023 16:57:16 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: linan666@huaweicloud.com, josef@toxicpanda.com, axboe@kernel.dk,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, linan122@huawei.com,
	yi.zhang@huawei.com, houtao1@huawei.com, yangerkun@huawei.com,
	"yukuai (C)" <yukuai3@huawei.com>
Subject: Re: [PATCH] nbd: pass nbd_sock to nbd_read_reply() instead of index
Message-ID: <ZRU/7Bx1ZJSX3Qg3@fedora>
References: <20230911023308.3467802-1-linan666@huaweicloud.com>
 <ZRT7cVFcE6QMHfie@fedora>
 <47669fb6-3700-e327-11af-93a92b0984a0@huaweicloud.com>
 <ZRUt/vAQNGNp6Ugx@fedora>
 <41161d21-299c-3657-6020-0a3a9cf109ec@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41161d21-299c-3657-6020-0a3a9cf109ec@huaweicloud.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <eE2r2C6VpCO.A.CRC.gQUFlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2651
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZRU/7Bx1ZJSX3Qg3@fedora
Resent-Date: Thu, 28 Sep 2023 09:15:12 +0000 (UTC)

On Thu, Sep 28, 2023 at 04:55:03PM +0800, Yu Kuai wrote:
> Hi,
> 
> 在 2023/09/28 15:40, Ming Lei 写道:
> > On Thu, Sep 28, 2023 at 02:03:28PM +0800, Yu Kuai wrote:
> > > Hi,
> > > 
> > > 在 2023/09/28 12:05, Ming Lei 写道:
> > > > On Mon, Sep 11, 2023 at 10:33:08AM +0800, linan666@huaweicloud.com wrote:
> > > > > From: Li Nan <linan122@huawei.com>
> > > > > 
> > > > > If a socket is processing ioctl 'NBD_SET_SOCK', config->socks might be
> > > > > krealloc in nbd_add_socket(), and a garbage request is received now, a UAF
> > > > > may occurs.
> > > > > 
> > > > >     T1
> > > > >     nbd_ioctl
> > > > >      __nbd_ioctl
> > > > >       nbd_add_socket
> > > > >        blk_mq_freeze_queue
> > > > > 				T2
> > > > >     				recv_work
> > > > >     				 nbd_read_reply
> > > > >     				  sock_xmit
> > > > >        krealloc config->socks
> > > > > 				   def config->socks
> > > > > 
> > > > > Pass nbd_sock to nbd_read_reply(). And introduce a new function
> > > > > sock_xmit_recv(), which differs from sock_xmit only in the way it get
> > > > > socket.
> > > > > 
> > > > 
> > > > I am wondering why not grab queue usage counter before calling nbd_read_reply()
> > > > for avoiding such issue, something like the following change:
> > > > 
> > > > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > > > index df1cd0f718b8..09215b605b12 100644
> > > > --- a/drivers/block/nbd.c
> > > > +++ b/drivers/block/nbd.c
> > > > @@ -837,9 +837,6 @@ static void recv_work(struct work_struct *work)
> > > >    	while (1) {
> > > >    		struct nbd_reply reply;
> > > > -		if (nbd_read_reply(nbd, args->index, &reply))
> > > > -			break;
> > > > -
> > > >    		/*
> > > >    		 * Grab .q_usage_counter so request pool won't go away, then no
> > > >    		 * request use-after-free is possible during nbd_handle_reply().
> > > > @@ -852,6 +849,9 @@ static void recv_work(struct work_struct *work)
> > > >    			break;
> > > >    		}
> > > 
> > > This break how nbd works, if there is no reply yet, recv_work() will
> > > wait for reply in:
> > > 
> > > nbd_read_reply
> > >   sock_xmit
> > >    sock_recvmsg
> > > 
> > > After this change, recv_work() will just return if there is no io.
> > 
> > OK, got it, thanks for the input.
> > 
> > But I feel it isn't necessary & fragile to store one extra reference of nsock in
> > `recv_thread_args`.
> > 
> > Just run a quick look, the only potential UAF on config->socks should be recv_work(),
> > so you can retrieve the `nsock` reference at the entry of recv_work(),
> 
> I don't understand what you mean retrieve the 'nsock', is following what
> you expected?
> 
> blk_queue_enter() -> prevent concurrent with nbd_add_socket
> nsock = config->socks[args->index]
> blk_queue_exit()

Yeah, turns out you do understand, :-)

Thanks,
Ming

