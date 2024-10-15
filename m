Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEEC99E523
	for <lists+nbd@lfdr.de>; Tue, 15 Oct 2024 13:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A27F3206BA; Tue, 15 Oct 2024 11:09:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 15 11:09:09 2024
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
	by bendel.debian.org (Postfix) with ESMTP id F1AD1206BA
	for <lists-other-nbd@bendel.debian.org>; Tue, 15 Oct 2024 10:53:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.084 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.153, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL_CSS=3.335]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HKfaMZUKrI8Y for <lists-other-nbd@bendel.debian.org>;
	Tue, 15 Oct 2024 10:53:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 9452F206B6
	for <nbd@other.debian.org>; Tue, 15 Oct 2024 10:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728989589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=bh+Ir/j3gUT3OWFj/tNxfK3IIX6mfHtdP5FI1CZ59vE=;
	b=OrAPbTohmKSgd/6y8gXbwwiFNZCKGbBdhN98ciwCMb5aX+3hvUnwmztyJ3EXSDH9XNvw1m
	iES7qI0kj4OBhdiPp3DHSu+DgGCJiPfq2tOa+tMZzBoANA3XDAlJ9r3uUhd5FRwUBdVm3u
	DHB7ZjAI6YmxXGUBWMal4YO3YR04GfQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-mAb97BP8MGuxHYZ7yVKARQ-1; Tue,
 15 Oct 2024 06:21:47 -0400
X-MC-Unique: mAb97BP8MGuxHYZ7yVKARQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8FA1319560BE;
	Tue, 15 Oct 2024 10:21:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9800219560A2;
	Tue, 15 Oct 2024 10:21:43 +0000 (UTC)
Date: Tue, 15 Oct 2024 12:21:40 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: josef@toxicpanda.com
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
	eblake@redhat.com
Subject: Kernel NBD client waits on wrong cookie, aborts connection
Message-ID: <Zw5CNDIde6xkq_Sf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VJ-UcW8mdiG.A.gwG.V1kDnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3162
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Zw5CNDIde6xkq_Sf@redhat.com
Resent-Date: Tue, 15 Oct 2024 11:09:09 +0000 (UTC)

Hi all,

the other day I was running some benchmarks to compare different QEMU
block exports, and one of the scenarios I was interested in was
exporting NBD from qemu-storage-daemon over a unix socket and attaching
it as a block device using the kernel NBD client. I would then run a VM
on top of it and fio inside of it.

Unfortunately, I couldn't get any numbers because the connection always
aborted with messages like "Double reply on req ..." or "Unexpected
reply ..." in the host kernel log.

Yesterday I found some time to have a closer look why this is happening,
and I think I have a rough understanding of what's going on now. Look at
these trace events:

        qemu-img-51025   [005] ..... 19503.285423: nbd_header_sent: nbd transport event: request 000000002df03708, handle 0x0000150c0000005a
[...]
        qemu-img-51025   [008] ..... 19503.285500: nbd_payload_sent: nbd transport event: request 000000002df03708, handle 0x0000150c0000005d
[...]
   kworker/u49:1-47350   [004] ..... 19503.285514: nbd_header_received: nbd transport event: request 00000000b79e7443, handle 0x0000150c0000005a

This is the same request, but the handle has changed between
nbd_header_sent and nbd_payload_sent! I think this means that we hit one
of the cases where the request is requeued, and then the next time it
is executed with a different blk-mq tag, which is something the nbd
driver doesn't seem to expect.

Of course, since the cookie is transmitted in the header, the server
replies with the original handle that contains the tag from the first
call, while the kernel is only waiting for a handle with the new tag and
is confused by the server response.

I'm not sure yet which of the following options should be considered the
real problem here, so I'm only describing the situation without trying
to provide a patch:

1. Is it that blk-mq should always re-run the request with the same tag?
   I don't expect so, though in practice I was surprised to see that it
   happens quite often after nbd requeues a request that it actually
   does end up with the same cookie again.

2. Is it that nbd should use cookies that don't depend on the tag?
   Maybe, but then we lose an easy way to identify the request from the
   server response.

3. Is it that it should never requeue requests after already starting to
   send data for them? This sounds most likely to me, but also like the
   biggest change to make in nbd.

4. Or something else entirely?

I tested this with the 6.10.12 kernel from Fedora 40, but a quick git
diff on nbd.c doesn't suggest that anything related has changed since
then. This is how I reproduced it for debugging (without a VM):

$ qemu-storage-daemon --blockdev null-co,size=$((16*(1024**3))),node-name=data --nbd-server addr.type=unix,addr.path=/tmp/nbd.sock --export nbd,id=exp0,node-name=data,writable=on
# nbd-client -unix -N data /tmp/nbd.sock /dev/nbd0
# qemu-img bench -f host_device -w -s 4k -c 1000000 -t none -i io_uring /dev/nbd0

I couldn't trigger the problem with TCP or without the io_uring backend
(i.e. using Linux AIO or the thread pool) for 'qemu-img bench'.

Kevin

