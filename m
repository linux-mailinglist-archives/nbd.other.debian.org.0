Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDE099E9FB
	for <lists+nbd@lfdr.de>; Tue, 15 Oct 2024 14:39:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A11B3206E4; Tue, 15 Oct 2024 12:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 15 12:39:09 2024
Old-Return-Path: <minlei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B0E6E206AE
	for <lists-other-nbd@bendel.debian.org>; Tue, 15 Oct 2024 12:22:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.153, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KGU2ejq2yRkj for <lists-other-nbd@bendel.debian.org>;
	Tue, 15 Oct 2024 12:22:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id A5D2C20524
	for <nbd@other.debian.org>; Tue, 15 Oct 2024 12:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728994926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uq/PQF5lEppp30Xz6W2160dKbLoGKnHh5iasCOZ9FEw=;
	b=DHSyQG93t3HvqAZS1mGuIxL+tKF0wApcOwumJXhZBq7lyv3wQdsQLMjZLBIVHX5vjybXQ2
	XULzFODro17Huxpg6KlYJt8gHvGlWgUS4O1lJEzmWeaojyuO+bmlNj1+0z0xIhKszaiQ1p
	+HoT6MrZ38F5myQRFpTzv7WamqPDBeI=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-yvv5z2IUOHypnz-0mQsotg-1; Tue, 15 Oct 2024 08:15:28 -0400
X-MC-Unique: yvv5z2IUOHypnz-0mQsotg-1
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-50d5352c757so399527e0c.2
        for <nbd@other.debian.org>; Tue, 15 Oct 2024 05:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728994528; x=1729599328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq/PQF5lEppp30Xz6W2160dKbLoGKnHh5iasCOZ9FEw=;
        b=a1HTk2lGtHLKObJIGY5kAcnRlT2fSm4124zKfHrXUYHv5ETm9xnY2pDu5AnD3nBmZM
         HQbjK4mPGtKZlW3o6a3EjItIevwEFFJkt99Hig7WVkbDaNfzfw3pb9MmR7guw9HNXfCJ
         UYGOWaSL+K2NuIKhictyjEY/hShmkWYiTWjHmd13vau44PXCA4wpu1yrH4aikHD9Gvf0
         LAMOOyrNG99ZKMLVUrIhMwmRZ2g9DbPjTlnBS9SgnAG03+RWkz8C7YR3F8r02PE6PrhV
         jmupjYdODBCfMHkNTPveT6oGaR3ENqxSmReOmbdpJ6yLBsSvzja53Aj9+T5qhqm1G+wp
         s1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCU82vDvLdbUvxH5+rXvK5wGFN2t8dMLLemd1rmqay44yzm5LXX9F1jvjtA0nWHOT6bsH0o=@other.debian.org
X-Gm-Message-State: AOJu0YzrPTa+OWSM2ev5HAPWraT9JWhW21Xi2O8mFTQdRFcIEm8Of3cf
	O4gA/CyIrkLP90F6j4PCc4RO3DnbWiwWyftdcUYENzCT+pb6TzbOt407hoY+BZuY54w69eojuPO
	dPqXYV6s03rLzP4Bop4lg4xSp9SDK2XtZaCSwYCawt3sbfyc8jr3bg2SiRlh5H+nUUMmERGCsCs
	liWeY5xLOrjP3qIHZ+cUzc9I2fMg==
X-Received: by 2002:a05:6122:88a:b0:50c:4b84:dafb with SMTP id 71dfb90a1353d-50d1f56e07cmr10936265e0c.10.1728994528269;
        Tue, 15 Oct 2024 05:15:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn1pA32UBFCkbb/WQoJDNazzuBco3F3A4TWc8WaKbVDnfzcdcNGxAWSU+Opf1qk6gKxA7vU/zhHsypev0RCbY=
X-Received: by 2002:a05:6122:88a:b0:50c:4b84:dafb with SMTP id
 71dfb90a1353d-50d1f56e07cmr10936241e0c.10.1728994527872; Tue, 15 Oct 2024
 05:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <Zw5CNDIde6xkq_Sf@redhat.com> <CAFj5m9LXwcH7vc2Fk_i+VhfUA+tevzhciJzKc1am49y_5jgC2Q@mail.gmail.com>
 <Zw5b1mwk3aG01NTg@fedora>
In-Reply-To: <Zw5b1mwk3aG01NTg@fedora>
From: Ming Lei <ming.lei@redhat.com>
Date: Tue, 15 Oct 2024 20:15:17 +0800
Message-ID: <CAFj5m9+x+tiAAKj3dX_WcFczkdSNaR6nguDHm9FXuYjQHd8YcA@mail.gmail.com>
Subject: Re: Kernel NBD client waits on wrong cookie, aborts connection
To: Kevin Wolf <kwolf@redhat.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org, 
	nbd@other.debian.org, eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aIzRe98mGxI.A.EL6.tJmDnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3164
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAFj5m9+x+tiAAKj3dX_WcFczkdSNaR6nguDHm9FXuYjQHd8YcA@mail.gmail.com
Resent-Date: Tue, 15 Oct 2024 12:39:09 +0000 (UTC)

On Tue, Oct 15, 2024 at 8:11=E2=80=AFPM Ming Lei <ming.lei@redhat.com> wrot=
e:
>
> On Tue, Oct 15, 2024 at 08:01:43PM +0800, Ming Lei wrote:
> > On Tue, Oct 15, 2024 at 6:22=E2=80=AFPM Kevin Wolf <kwolf@redhat.com> w=
rote:
> > >
> > > Hi all,
> > >
> > > the other day I was running some benchmarks to compare different QEMU
> > > block exports, and one of the scenarios I was interested in was
> > > exporting NBD from qemu-storage-daemon over a unix socket and attachi=
ng
> > > it as a block device using the kernel NBD client. I would then run a =
VM
> > > on top of it and fio inside of it.
> > >
> > > Unfortunately, I couldn't get any numbers because the connection alwa=
ys
> > > aborted with messages like "Double reply on req ..." or "Unexpected
> > > reply ..." in the host kernel log.
> > >
> > > Yesterday I found some time to have a closer look why this is happeni=
ng,
> > > and I think I have a rough understanding of what's going on now. Look=
 at
> > > these trace events:
> > >
> > >         qemu-img-51025   [005] ..... 19503.285423: nbd_header_sent: n=
bd transport event: request 000000002df03708, handle 0x0000150c0000005a
> > > [...]
> > >         qemu-img-51025   [008] ..... 19503.285500: nbd_payload_sent: =
nbd transport event: request 000000002df03708, handle 0x0000150c0000005d
> > > [...]
> > >    kworker/u49:1-47350   [004] ..... 19503.285514: nbd_header_receive=
d: nbd transport event: request 00000000b79e7443, handle 0x0000150c0000005a
> > >
> > > This is the same request, but the handle has changed between
> > > nbd_header_sent and nbd_payload_sent! I think this means that we hit =
one
> > > of the cases where the request is requeued, and then the next time it
> > > is executed with a different blk-mq tag, which is something the nbd
> > > driver doesn't seem to expect.
> > >
> > > Of course, since the cookie is transmitted in the header, the server
> > > replies with the original handle that contains the tag from the first
> > > call, while the kernel is only waiting for a handle with the new tag =
and
> > > is confused by the server response.
> > >
> > > I'm not sure yet which of the following options should be considered =
the
> > > real problem here, so I'm only describing the situation without tryin=
g
> > > to provide a patch:
> > >
> > > 1. Is it that blk-mq should always re-run the request with the same t=
ag?
> > >    I don't expect so, though in practice I was surprised to see that =
it
> > >    happens quite often after nbd requeues a request that it actually
> > >    does end up with the same cookie again.
> >
> > No.
> >
> > request->tag will change, but we may take ->internal_tag(sched) or
> > ->tag(none), which won't change.
> >
> > I guess was_interrupted() in nbd_send_cmd() is triggered, then the payl=
oad
> > is sent with a different tag.
> >
> > I will try to cook one patch soon.
>
> Please try the following patch:

Oops, please ignore the patch, it can't work since
nbd_handle_reply() doesn't know static tag.

Thanks,

