Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A17B11C4
	for <lists+nbd@lfdr.de>; Thu, 28 Sep 2023 06:54:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9B825205A4; Thu, 28 Sep 2023 04:54:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep 28 04:54:13 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 7E2712064B
	for <lists-other-nbd@bendel.debian.org>; Thu, 28 Sep 2023 04:36:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.801 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JYVCy06jwO5l for <lists-other-nbd@bendel.debian.org>;
	Thu, 28 Sep 2023 04:36:25 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id CBE4720632
	for <nbd@other.debian.org>; Thu, 28 Sep 2023 04:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695875779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrLjkHF0/HwoOXQ2UetFuy9QaHx8cXgataUvrO0ObDQ=;
	b=BgMZs1yEl2dukGMn/5aVdl5uIPNAFan+Ac07gI4DaceFzEVpHlHv4pSQw8b87yCI6HDT48
	jOZuJPEmlhpoySTZ0Cq/3Jpj8srdWRyFgcCPtYILo2fekpqKr84S6fpDsqL8W6na5H4hH2
	8MD0+8YGUm7emZvH4hQwG3QeZygwjoU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-T1n3Zf0xOJ-gjUrloG85LQ-1; Thu, 28 Sep 2023 00:05:17 -0400
X-MC-Unique: T1n3Zf0xOJ-gjUrloG85LQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F85E85A5BD;
	Thu, 28 Sep 2023 04:05:17 +0000 (UTC)
Received: from fedora (unknown [10.72.120.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6A03C15BB8;
	Thu, 28 Sep 2023 04:05:10 +0000 (UTC)
Date: Thu, 28 Sep 2023 12:05:05 +0800
From: Ming Lei <ming.lei@redhat.com>
To: linan666@huaweicloud.com
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	linan122@huawei.com, yukuai3@huawei.com, yi.zhang@huawei.com,
	houtao1@huawei.com, yangerkun@huawei.com, ming.lei@redhat.com
Subject: Re: [PATCH] nbd: pass nbd_sock to nbd_read_reply() instead of index
Message-ID: <ZRT7cVFcE6QMHfie@fedora>
References: <20230911023308.3467802-1-linan666@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911023308.3467802-1-linan666@huaweicloud.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <EJXIoGFd_f.A.KxH.1bQFlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2643
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZRT7cVFcE6QMHfie@fedora
Resent-Date: Thu, 28 Sep 2023 04:54:13 +0000 (UTC)

On Mon, Sep 11, 2023 at 10:33:08AM +0800, linan666@huaweicloud.com wrote:
> From: Li Nan <linan122@huawei.com>
> 
> If a socket is processing ioctl 'NBD_SET_SOCK', config->socks might be
> krealloc in nbd_add_socket(), and a garbage request is received now, a UAF
> may occurs.
> 
>   T1
>   nbd_ioctl
>    __nbd_ioctl
>     nbd_add_socket
>      blk_mq_freeze_queue
> 				T2
>   				recv_work
>   				 nbd_read_reply
>   				  sock_xmit
>      krealloc config->socks
> 				   def config->socks
> 
> Pass nbd_sock to nbd_read_reply(). And introduce a new function
> sock_xmit_recv(), which differs from sock_xmit only in the way it get
> socket.
> 

I am wondering why not grab queue usage counter before calling nbd_read_reply()
for avoiding such issue, something like the following change:

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index df1cd0f718b8..09215b605b12 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -837,9 +837,6 @@ static void recv_work(struct work_struct *work)
 	while (1) {
 		struct nbd_reply reply;
 
-		if (nbd_read_reply(nbd, args->index, &reply))
-			break;
-
 		/*
 		 * Grab .q_usage_counter so request pool won't go away, then no
 		 * request use-after-free is possible during nbd_handle_reply().
@@ -852,6 +849,9 @@ static void recv_work(struct work_struct *work)
 			break;
 		}
 
+		if (nbd_read_reply(nbd, args->index, &reply))
+			break;
+
 		cmd = nbd_handle_reply(nbd, args->index, &reply);
 		if (IS_ERR(cmd)) {
 			percpu_ref_put(&q->q_usage_counter);

Thanks,
Ming

