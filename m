Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E3899F2A3
	for <lists+nbd@lfdr.de>; Tue, 15 Oct 2024 18:24:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D005120702; Tue, 15 Oct 2024 16:24:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 15 16:24:11 2024
Old-Return-Path: <kwolf@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BA4B02064E
	for <lists-other-nbd@bendel.debian.org>; Tue, 15 Oct 2024 16:06:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.084 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.153, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL_CSS=3.335]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PC61M1UJU0Hu for <lists-other-nbd@bendel.debian.org>;
	Tue, 15 Oct 2024 16:06:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 20673 seconds by postgrey-1.36 at bendel; Tue, 15 Oct 2024 16:06:27 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 471C920559
	for <nbd@other.debian.org>; Tue, 15 Oct 2024 16:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729008381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iojyARjeXN8Q5+UMphGbYbxc6rgrJQPAjTgYzn/WhPs=;
	b=Zap7vfq3D/ZVoxf6M5QzvoX9L3PdDkCZvZMsmOM206rrVfLYBtJad4BfkrX7eQyGTwb3Ji
	S76LTkk3V2VkRkC50Igyyqxq4474CWwYustOGkNk+HjnEtXe/bcPvIpokU3hHwC8Nk+zaT
	01GHFNKkPjP2J8tg1dqeK3+2ICWdtj0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-390-TANJWY-JO6-vvKVYDGmSfQ-1; Tue,
 15 Oct 2024 12:06:16 -0400
X-MC-Unique: TANJWY-JO6-vvKVYDGmSfQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3849B19560AE;
	Tue, 15 Oct 2024 16:06:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.132])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C0C11956086;
	Tue, 15 Oct 2024 16:06:11 +0000 (UTC)
Date: Tue, 15 Oct 2024 18:06:01 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	nbd@other.debian.org, eblake@redhat.com
Subject: Re: Kernel NBD client waits on wrong cookie, aborts connection
Message-ID: <Zw6S6RoKWzUnNVpu@redhat.com>
References: <Zw5CNDIde6xkq_Sf@redhat.com>
 <CAFj5m9LXwcH7vc2Fk_i+VhfUA+tevzhciJzKc1am49y_5jgC2Q@mail.gmail.com>
 <Zw5b1mwk3aG01NTg@fedora>
 <CAFj5m9+x+tiAAKj3dX_WcFczkdSNaR6nguDHm9FXuYjQHd8YcA@mail.gmail.com>
 <Zw5nMQoPrSIq9axl@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zw5nMQoPrSIq9axl@fedora>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4Ss_SmRSmHI.A.pZ2D.rcpDnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3167
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Zw6S6RoKWzUnNVpu@redhat.com
Resent-Date: Tue, 15 Oct 2024 16:24:11 +0000 (UTC)

Am 15.10.2024 um 14:59 hat Ming Lei geschrieben:
> On Tue, Oct 15, 2024 at 08:15:17PM +0800, Ming Lei wrote:
> > On Tue, Oct 15, 2024 at 8:11 PM Ming Lei <ming.lei@redhat.com> wrote:
> > >
> > > On Tue, Oct 15, 2024 at 08:01:43PM +0800, Ming Lei wrote:
> > > > On Tue, Oct 15, 2024 at 6:22 PM Kevin Wolf <kwolf@redhat.com> wrote:
> > > > >
> > > > > Hi all,
> > > > >
> > > > > the other day I was running some benchmarks to compare different QEMU
> > > > > block exports, and one of the scenarios I was interested in was
> > > > > exporting NBD from qemu-storage-daemon over a unix socket and attaching
> > > > > it as a block device using the kernel NBD client. I would then run a VM
> > > > > on top of it and fio inside of it.
> > > > >
> > > > > Unfortunately, I couldn't get any numbers because the connection always
> > > > > aborted with messages like "Double reply on req ..." or "Unexpected
> > > > > reply ..." in the host kernel log.
> > > > >
> > > > > Yesterday I found some time to have a closer look why this is happening,
> > > > > and I think I have a rough understanding of what's going on now. Look at
> > > > > these trace events:
> > > > >
> > > > >         qemu-img-51025   [005] ..... 19503.285423: nbd_header_sent: nbd transport event: request 000000002df03708, handle 0x0000150c0000005a
> > > > > [...]
> > > > >         qemu-img-51025   [008] ..... 19503.285500: nbd_payload_sent: nbd transport event: request 000000002df03708, handle 0x0000150c0000005d
> > > > > [...]
> > > > >    kworker/u49:1-47350   [004] ..... 19503.285514: nbd_header_received: nbd transport event: request 00000000b79e7443, handle 0x0000150c0000005a
> > > > >
> > > > > This is the same request, but the handle has changed between
> > > > > nbd_header_sent and nbd_payload_sent! I think this means that we hit one
> > > > > of the cases where the request is requeued, and then the next time it
> > > > > is executed with a different blk-mq tag, which is something the nbd
> > > > > driver doesn't seem to expect.
> > > > >
> > > > > Of course, since the cookie is transmitted in the header, the server
> > > > > replies with the original handle that contains the tag from the first
> > > > > call, while the kernel is only waiting for a handle with the new tag and
> > > > > is confused by the server response.
> > > > >
> > > > > I'm not sure yet which of the following options should be considered the
> > > > > real problem here, so I'm only describing the situation without trying
> > > > > to provide a patch:
> > > > >
> > > > > 1. Is it that blk-mq should always re-run the request with the same tag?
> > > > >    I don't expect so, though in practice I was surprised to see that it
> > > > >    happens quite often after nbd requeues a request that it actually
> > > > >    does end up with the same cookie again.
> > > >
> > > > No.
> > > >
> > > > request->tag will change, but we may take ->internal_tag(sched) or
> > > > ->tag(none), which won't change.
> > > >
> > > > I guess was_interrupted() in nbd_send_cmd() is triggered, then the payload
> > > > is sent with a different tag.
> > > >
> > > > I will try to cook one patch soon.
> > >
> > > Please try the following patch:
> > 
> > Oops, please ignore the patch, it can't work since
> > nbd_handle_reply() doesn't know static tag.
> 
> Please try the v2:

It doesn't fully work, though it replaced the bug with a different one.
Now I get "Unexpected request" for the final flush request.

Anyway, before talking about specific patches, would this even be the
right solution or would it only paper over a bigger issue?

Is getting a different tag the only thing that can go wrong if you
handle a request partially and then requeue it?

Kevin

