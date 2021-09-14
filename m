Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F13B40A684
	for <lists+nbd@lfdr.de>; Tue, 14 Sep 2021 08:12:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 06AD920416; Tue, 14 Sep 2021 06:12:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 14 06:12:33 2021
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
	by bendel.debian.org (Postfix) with ESMTP id D221320411
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Sep 2021 05:56:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.279 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CYsfiSgK5wPk for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Sep 2021 05:56:34 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 4BDCA20415
	for <nbd@other.debian.org>; Tue, 14 Sep 2021 05:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631598988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BJecgffscZyS8jybTRNi6LBusFI022jT9cPdy4rCZas=;
	b=PwYcSHgnLX0ZlIrcnB0JxzAeedduKNztEmpE6pcDsS4fiWLXb6AKu8rW+MLMTzJ5dQceV2
	kNzf3ZnvDT8Twh+UBWm5lJTG3qnxQy1yyyl+OhPVWPx0ytUgCjYbWmnRke0ay+cjIT3Yf+
	BeIGbFQTVR8vSj0su7k1o1b+MypBWXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-I0hSVFWSPi-u5Rp1IxLG4w-1; Mon, 13 Sep 2021 20:54:29 -0400
X-MC-Unique: I0hSVFWSPi-u5Rp1IxLG4w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AB20835DE1;
	Tue, 14 Sep 2021 00:54:28 +0000 (UTC)
Received: from T590 (ovpn-12-85.pek2.redhat.com [10.72.12.85])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F01FA7A5CE;
	Tue, 14 Sep 2021 00:54:18 +0000 (UTC)
Date: Tue, 14 Sep 2021 08:54:27 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, hch@infradead.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, yi.zhang@huawei.com
Subject: Re: [PATCH v5 1/6] nbd: don't handle response without a
 corresponding request message
Message-ID: <YT/yw3QomdPgHx6m@T590>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
 <20210909141256.2606682-2-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909141256.2606682-2-yukuai3@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <HxUI1dP4GOG.A.MTF.R1DQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1450
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YT/yw3QomdPgHx6m@T590
Resent-Date: Tue, 14 Sep 2021 06:12:34 +0000 (UTC)

On Thu, Sep 09, 2021 at 10:12:51PM +0800, Yu Kuai wrote:
> While handling a response message from server, nbd_read_stat() will
> try to get request by tag, and then complete the request. However,
> this is problematic if nbd haven't sent a corresponding request
> message:
> 
> t1                      t2
>                         submit_bio
>                          nbd_queue_rq
>                           blk_mq_start_request
> recv_work
>  nbd_read_stat
>   blk_mq_tag_to_rq
>  blk_mq_complete_request
>                           nbd_send_cmd
> 
> Thus add a new cmd flag 'NBD_CMD_INFLIGHT', it will be set in
> nbd_send_cmd() and checked in nbd_read_stat().
> 
> Noted that this patch can't fix that blk_mq_tag_to_rq() might
> return a freed request, and this will be fixed in following
> patches.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Looks fine:

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming

