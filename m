Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F224740A6FC
	for <lists+nbd@lfdr.de>; Tue, 14 Sep 2021 09:00:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0B2C620454; Tue, 14 Sep 2021 07:00:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 14 07:00:17 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0685220271
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Sep 2021 06:45:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.279 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wbBgERbscCJ6 for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Sep 2021 06:45:02 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 2FAFC201F8
	for <nbd@other.debian.org>; Tue, 14 Sep 2021 06:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631601896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fYK5sEmID0j5qcEt2Vje6PqJTkmVq5tCDNx2hY9LSLA=;
	b=jInGc9wIYxrTG3x9f5d6mgql0puuwwbrxK/529rsADtoEpnEyKac1zkWmT8qPiSYT2WzEb
	X8xjbTRod8Vg4Vy+5DX7WyfgTrbzBsbjYAgOx2DFECDsi7Pe2WY7YfUMDcoDTuwFEyjwWw
	0fi6kXc3Qm2BhqWi/qOmLe8EuU8CdDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-h85728iKOd6eWWcC3sOHSA-1; Tue, 14 Sep 2021 02:44:52 -0400
X-MC-Unique: h85728iKOd6eWWcC3sOHSA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2524835DE0;
	Tue, 14 Sep 2021 06:44:50 +0000 (UTC)
Received: from T590 (ovpn-13-174.pek2.redhat.com [10.72.13.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD6EB10016F5;
	Tue, 14 Sep 2021 06:44:42 +0000 (UTC)
Date: Tue, 14 Sep 2021 14:44:48 +0800
From: Ming Lei <ming.lei@redhat.com>
To: "yukuai (C)" <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, hch@infradead.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, yi.zhang@huawei.com
Subject: Re: [PATCH v5 5/6] nbd: convert to use blk_mq_find_and_get_req()
Message-ID: <YUBE4BJ7+kN1c4l8@T590>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
 <20210909141256.2606682-6-yukuai3@huawei.com>
 <YT/2z4PSeW5oJWMq@T590>
 <c6af73a2-f12d-eeef-616e-ae0cdb4f6f2d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6af73a2-f12d-eeef-616e-ae0cdb4f6f2d@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Jebxt2vOoqL.A.r1B.BiEQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1453
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUBE4BJ7+kN1c4l8@T590
Resent-Date: Tue, 14 Sep 2021 07:00:18 +0000 (UTC)

On Tue, Sep 14, 2021 at 11:11:06AM +0800, yukuai (C) wrote:
> On 2021/09/14 9:11, Ming Lei wrote:
> > On Thu, Sep 09, 2021 at 10:12:55PM +0800, Yu Kuai wrote:
> > > blk_mq_tag_to_rq() can only ensure to return valid request in
> > > following situation:
> > > 
> > > 1) client send request message to server first
> > > submit_bio
> > > ...
> > >   blk_mq_get_tag
> > >   ...
> > >   blk_mq_get_driver_tag
> > >   ...
> > >   nbd_queue_rq
> > >    nbd_handle_cmd
> > >     nbd_send_cmd
> > > 
> > > 2) client receive respond message from server
> > > recv_work
> > >   nbd_read_stat
> > >    blk_mq_tag_to_rq
> > > 
> > > If step 1) is missing, blk_mq_tag_to_rq() will return a stale
> > > request, which might be freed. Thus convert to use
> > > blk_mq_find_and_get_req() to make sure the returned request is not
> > > freed.
> > 
> > But NBD_CMD_INFLIGHT has been added for checking if the reply is
> > expected, do we still need blk_mq_find_and_get_req() for covering
> > this issue? BTW, request and its payload is pre-allocated, so there
> > isn't real use-after-free.
> 
> Hi, Ming
> 
> Checking NBD_CMD_INFLIGHT relied on the request founded by tag is valid,
> not the other way round.
> 
> nbd_read_stat
>  req = blk_mq_tag_to_rq()
>  cmd = blk_mq_rq_to_pdu(req)
>  mutex_lock(cmd->lock)
>  checking NBD_CMD_INFLIGHT

Request and its payload is pre-allocated, and either req->ref or cmd->lock can
serve the same purpose here. Once cmd->lock is held, you can check if the cmd is
inflight or not. If it isn't inflight, just return -ENOENT. Is there any
problem to handle in this way?


Thanks,
Ming

