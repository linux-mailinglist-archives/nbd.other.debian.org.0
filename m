Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE05386F06
	for <lists+nbd@lfdr.de>; Tue, 18 May 2021 03:18:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C8F5C20566; Tue, 18 May 2021 01:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 18 01:18:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0A80F20556
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 May 2021 01:01:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.779 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mMoqZlkkocDN for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 May 2021 01:01:17 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 7BD5120555
	for <nbd@other.debian.org>; Tue, 18 May 2021 01:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621299672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xCtpJl5wAKagxb9hM9Z4VWmYK67Am2vQEsG/WsS00BA=;
	b=JkHSaXp7HoWcNczGJURmnRjhjWiG3mZnbwgtYm5zA/5cf+WtbCOQxBbBmx513syJykCZwZ
	2l0yFtrWgizLLpSLKDT8Dsa2C923TzsP9WO7RxxWchcibkRtfyu847h/WtLe5Jt6QVFgRk
	IoqPWxjSVNrvtDLGarOgFrzlzkwFAbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-Kv5nR3XBNRWIwn1qWCLM3g-1; Mon, 17 May 2021 20:29:58 -0400
X-MC-Unique: Kv5nR3XBNRWIwn1qWCLM3g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A92601A8A61;
	Tue, 18 May 2021 00:29:56 +0000 (UTC)
Received: from T590 (ovpn-12-90.pek2.redhat.com [10.72.12.90])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F99860C25;
	Tue, 18 May 2021 00:29:45 +0000 (UTC)
Date: Tue, 18 May 2021 08:29:40 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Prasanna Kumar Kalever <prasanna.kalever@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, josef@toxicpanda.com, axboe@kernel.dk,
	idryomov@redhat.com, xiubli@redhat.com,
	Matteo Croce <mcroce@linux.microsoft.com>
Subject: Re: [PATCH] nbd: provide a way for userspace processes to identify
 device backends
Message-ID: <YKMKdHPFCNhR1SXx@T590>
References: <20210429102828.31248-1-prasanna.kalever@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429102828.31248-1-prasanna.kalever@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <FK22tV-1f9N.A.GFH.RXxogB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1160
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YKMKdHPFCNhR1SXx@T590
Resent-Date: Tue, 18 May 2021 01:18:09 +0000 (UTC)

Hello Prasanna,

On Thu, Apr 29, 2021 at 03:58:28PM +0530, Prasanna Kumar Kalever wrote:
> Problem:
> On reconfigure of device, there is no way to defend if the backend
> storage is matching with the initial backend storage.
> 
> Say, if an initial connect request for backend "pool1/image1" got
> mapped to /dev/nbd0 and the userspace process is terminated. A next
> reconfigure request within NBD_ATTR_DEAD_CONN_TIMEOUT is allowed to
> use /dev/nbd0 for a different backend "pool1/image2"
> 
> For example, an operation like below could be dangerous:

Can you explain a bit why it is dangerous?

> 
> $ sudo rbd-nbd map --try-netlink rbd-pool/ext4-image
> /dev/nbd0
> $ sudo blkid /dev/nbd0
> /dev/nbd0: UUID="bfc444b4-64b1-418f-8b36-6e0d170cfc04" TYPE="ext4"
> $ sudo pkill -9 rbd-nbd
> $ sudo rbd-nbd attach --try-netlink --device /dev/nbd0 rbd-pool/xfs-image
> /dev/nbd0
> $ sudo blkid /dev/nbd0
> /dev/nbd0: UUID="d29bf343-6570-4069-a9ea-2fa156ced908" TYPE="xfs"
> 
> Solution:
> Provide a way for userspace processes to keep some metadata to identify
> between the device and the backend, so that when a reconfigure request is
> made, we can compare and avoid such dangerous operations.
> 
> With this solution, as part of the initial connect request, backend
> path can be stored in the sysfs per device config, so that on a reconfigure
> request it's easy to check if the backend path matches with the initial
> connect backend path.
> 
> Please note, ioctl interface to nbd will not have these changes, as there
> won't be any reconfigure.

BTW, loop has similar issue, and patch of 'block: add a sequence number to disks'
is added for addressing this issue, what do you think of that generic
approach wrt. this nbd's issue? such as used the exposed sysfs sequence number
for addressing this issue?

https://lore.kernel.org/linux-block/YH81n34d2G3C4Re+@gardel-login/#r

Thanks,
Ming

