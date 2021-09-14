Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9665140A6BA
	for <lists+nbd@lfdr.de>; Tue, 14 Sep 2021 08:30:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0E93E203A2; Tue, 14 Sep 2021 06:30:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 14 06:30:25 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 2B2CD20345
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Sep 2021 06:14:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.279 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id R_-J8EAX0vXI for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Sep 2021 06:14:33 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 62CA820332
	for <nbd@other.debian.org>; Tue, 14 Sep 2021 06:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631600068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sAmERlnzgu6E6drIi7Ej5aFj4eTItZbD2NbSWsNlmtQ=;
	b=W45M2WCIsq4AmPhInEHsjj881oSdWRJTUssmX7+P6+N8DKs/kT03fg+L4tDLR9UoO6xE7+
	ebLl9E5Wi9vqnTOvRzg3OHDQ+UIIFHY4hFArGMW/g8MCB5iY9Fc3/QjimMfVCIDWQ9hDaq
	e8/bU6gS+k5K0j/XPNVSP+xvSeRB+nU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-AWq1OgyxOhaXC5VvJWxvPQ-1; Mon, 13 Sep 2021 21:11:45 -0400
X-MC-Unique: AWq1OgyxOhaXC5VvJWxvPQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC277802936;
	Tue, 14 Sep 2021 01:11:43 +0000 (UTC)
Received: from T590 (ovpn-12-85.pek2.redhat.com [10.72.12.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9220A60C82;
	Tue, 14 Sep 2021 01:11:34 +0000 (UTC)
Date: Tue, 14 Sep 2021 09:11:43 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, hch@infradead.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, yi.zhang@huawei.com
Subject: Re: [PATCH v5 5/6] nbd: convert to use blk_mq_find_and_get_req()
Message-ID: <YT/2z4PSeW5oJWMq@T590>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
 <20210909141256.2606682-6-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909141256.2606682-6-yukuai3@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9jsHdHma0cO.A.cdC.BGEQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1452
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YT/2z4PSeW5oJWMq@T590
Resent-Date: Tue, 14 Sep 2021 06:30:26 +0000 (UTC)

On Thu, Sep 09, 2021 at 10:12:55PM +0800, Yu Kuai wrote:
> blk_mq_tag_to_rq() can only ensure to return valid request in
> following situation:
> 
> 1) client send request message to server first
> submit_bio
> ...
>  blk_mq_get_tag
>  ...
>  blk_mq_get_driver_tag
>  ...
>  nbd_queue_rq
>   nbd_handle_cmd
>    nbd_send_cmd
> 
> 2) client receive respond message from server
> recv_work
>  nbd_read_stat
>   blk_mq_tag_to_rq
> 
> If step 1) is missing, blk_mq_tag_to_rq() will return a stale
> request, which might be freed. Thus convert to use
> blk_mq_find_and_get_req() to make sure the returned request is not
> freed.

But NBD_CMD_INFLIGHT has been added for checking if the reply is
expected, do we still need blk_mq_find_and_get_req() for covering
this issue? BTW, request and its payload is pre-allocated, so there
isn't real use-after-free.


Thanks,
Ming

