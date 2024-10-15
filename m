Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D35799E9E5
	for <lists+nbd@lfdr.de>; Tue, 15 Oct 2024 14:33:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 065CC206D9; Tue, 15 Oct 2024 12:33:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 15 12:33:31 2024
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
	by bendel.debian.org (Postfix) with ESMTP id A3A0A206B3
	for <lists-other-nbd@bendel.debian.org>; Tue, 15 Oct 2024 12:17:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.153, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xSX0OZXAyVyh for <lists-other-nbd@bendel.debian.org>;
	Tue, 15 Oct 2024 12:17:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 788EF206A5
	for <nbd@other.debian.org>; Tue, 15 Oct 2024 12:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728994641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wU8cdLwyvTrF+rHqLCsTDBJ07XOTLiGXwc0WAS/2LmE=;
	b=XrU24ZfFa36KIwctwXyZf/e2Z5cMMu2ojo22478JdjIRj/JiQwSluiICK8dGIutQRebm/N
	T/vrokjszWOhBIzxobTE9+51U9nYEZJ5WWGYGdzo9P9JacgI5GMAmMTxwNF1lYWGERz+7J
	kLr1rghfAD6847CDr/j68tWbAEYrlc4=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-QA4UDD4jMjK-FOPuxMc7yw-1; Tue, 15 Oct 2024 08:01:56 -0400
X-MC-Unique: QA4UDD4jMjK-FOPuxMc7yw-1
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-50c7cbc2485so1193105e0c.3
        for <nbd@other.debian.org>; Tue, 15 Oct 2024 05:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728993715; x=1729598515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wU8cdLwyvTrF+rHqLCsTDBJ07XOTLiGXwc0WAS/2LmE=;
        b=foPnK47W3gw6+fLa888c/pYXrEdjvr+2zL+0b+wObYrdqiABiJtcbGm3Th2xs/xej7
         v+DEoEqRIKO/4o1QHThwMEIc96VGdD8kEsdUTYynEvhgOigxXNFQ/ICiM8mJD1rgVCSu
         Tt5p+u5EfvCshe+QO/F/staIPzrXW+DbneHYkemKpSGCoH31dhnLQwj+NadTI9nEVEgn
         Y0DBdp9Bh0i7RKoL459bqseHmSar36LlrhgJJrdQEM6b3AZ98hnGlFXJF8TdNoyzWsUz
         zZRDyCTnpPYDIEcHsJLLfJtlOHQE78cZmyTbdua0Mecm0TPgJmfze9r3ttknWWz28h+G
         cQDg==
X-Forwarded-Encrypted: i=1; AJvYcCUXqFxSUPZYhLWdhpLOsM4x0RKfSshm4Iq7YUraaLg1VnDOta+/6bErANtKQfmV8jPKG8s=@other.debian.org
X-Gm-Message-State: AOJu0YzTxbd/GDdDrDnV7Ofrl6m5+1UG8ga5sX9GbS45zbTQ3imYHSro
	5JkeSPt7mZWhoThAwMFGcseAamxpOUqea/RbN/gxRxEJu7hwVt646dcEDpctx8oqd4iLs5qkzlP
	3JuTZ81uXYOYkmoFphvfDAGaFgqzdYXf/ulNLx9ScrX0BM7rCkh7dh05LK9I4pS3gPK6pJsY0Fm
	pZbfqlMToFg6H12OYrf7eZ1IS0sQ==
X-Received: by 2002:a05:6122:1806:b0:50d:66e1:826c with SMTP id 71dfb90a1353d-50d66e18bc3mr4635261e0c.11.1728993715051;
        Tue, 15 Oct 2024 05:01:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY9moZmYa4OxScIx+qlWeWary99ll+sUXMmuoKJvUOuDyTsB1cplqv8slY88hUZimrfDZiaEvs4AQrit04Tbw=
X-Received: by 2002:a05:6122:1806:b0:50d:66e1:826c with SMTP id
 71dfb90a1353d-50d66e18bc3mr4635183e0c.11.1728993714514; Tue, 15 Oct 2024
 05:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <Zw5CNDIde6xkq_Sf@redhat.com>
In-Reply-To: <Zw5CNDIde6xkq_Sf@redhat.com>
From: Ming Lei <ming.lei@redhat.com>
Date: Tue, 15 Oct 2024 20:01:43 +0800
Message-ID: <CAFj5m9LXwcH7vc2Fk_i+VhfUA+tevzhciJzKc1am49y_5jgC2Q@mail.gmail.com>
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
Resent-Message-ID: <YUVpIeQHmrE.A.T-4.bEmDnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3163
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAFj5m9LXwcH7vc2Fk_i+VhfUA+tevzhciJzKc1am49y_5jgC2Q@mail.gmail.com
Resent-Date: Tue, 15 Oct 2024 12:33:32 +0000 (UTC)

On Tue, Oct 15, 2024 at 6:22=E2=80=AFPM Kevin Wolf <kwolf@redhat.com> wrote=
:
>
> Hi all,
>
> the other day I was running some benchmarks to compare different QEMU
> block exports, and one of the scenarios I was interested in was
> exporting NBD from qemu-storage-daemon over a unix socket and attaching
> it as a block device using the kernel NBD client. I would then run a VM
> on top of it and fio inside of it.
>
> Unfortunately, I couldn't get any numbers because the connection always
> aborted with messages like "Double reply on req ..." or "Unexpected
> reply ..." in the host kernel log.
>
> Yesterday I found some time to have a closer look why this is happening,
> and I think I have a rough understanding of what's going on now. Look at
> these trace events:
>
>         qemu-img-51025   [005] ..... 19503.285423: nbd_header_sent: nbd t=
ransport event: request 000000002df03708, handle 0x0000150c0000005a
> [...]
>         qemu-img-51025   [008] ..... 19503.285500: nbd_payload_sent: nbd =
transport event: request 000000002df03708, handle 0x0000150c0000005d
> [...]
>    kworker/u49:1-47350   [004] ..... 19503.285514: nbd_header_received: n=
bd transport event: request 00000000b79e7443, handle 0x0000150c0000005a
>
> This is the same request, but the handle has changed between
> nbd_header_sent and nbd_payload_sent! I think this means that we hit one
> of the cases where the request is requeued, and then the next time it
> is executed with a different blk-mq tag, which is something the nbd
> driver doesn't seem to expect.
>
> Of course, since the cookie is transmitted in the header, the server
> replies with the original handle that contains the tag from the first
> call, while the kernel is only waiting for a handle with the new tag and
> is confused by the server response.
>
> I'm not sure yet which of the following options should be considered the
> real problem here, so I'm only describing the situation without trying
> to provide a patch:
>
> 1. Is it that blk-mq should always re-run the request with the same tag?
>    I don't expect so, though in practice I was surprised to see that it
>    happens quite often after nbd requeues a request that it actually
>    does end up with the same cookie again.

No.

request->tag will change, but we may take ->internal_tag(sched) or
->tag(none), which won't change.

I guess was_interrupted() in nbd_send_cmd() is triggered, then the payload
is sent with a different tag.

I will try to cook one patch soon.

Thanks,
Ming

