Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 731BC3E952A
	for <lists+nbd@lfdr.de>; Wed, 11 Aug 2021 17:57:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 00C9A203A3; Wed, 11 Aug 2021 15:57:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 11 15:57:39 2021
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 29AB620398
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Aug 2021 15:57:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.355 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WE-o8evSY-9G for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Aug 2021 15:57:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 5964A2038A
	for <nbd@other.debian.org>; Wed, 11 Aug 2021 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628697441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mvyHhawaRzRMFx4I0d/1C6dsA+Cy0FuldCgc1kqA1Cw=;
	b=AjZvTjV0ybrxR2WLOBLWXutpG7zLEmgQv9sygFmo2VBa6Dz/PD/xWN3sPAOgzP/hvSGLCz
	aBxriu+AFjzN8TGnQY4/PFYRfmVm0jBBcQg/7q6JlRXmEaBSYnTJNV4M48tz1ZJn74FcKv
	mOpZldmOCM1bg9b9H2kLxSpQhxcQT00=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-O_R_k4HJOziua5LqGKLZMw-1; Wed, 11 Aug 2021 11:57:17 -0400
X-MC-Unique: O_R_k4HJOziua5LqGKLZMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0C471853028;
	Wed, 11 Aug 2021 15:57:15 +0000 (UTC)
Received: from redhat.com (ovpn-112-138.phx2.redhat.com [10.3.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A57B77701;
	Wed, 11 Aug 2021 15:57:15 +0000 (UTC)
Date: Wed, 11 Aug 2021 10:57:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	Hou Tao <houtao1@huawei.com>
Subject: Re: [PATCH 6/6] nbd: reduce the nbd_index_mutex scope
Message-ID: <20210811155713.ym4duw4va7vo3yrc@redhat.com>
References: <20210811124428.2368491-1-hch@lst.de>
 <20210811124428.2368491-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811124428.2368491-7-hch@lst.de>
User-Agent: NeoMutt/20210205-687-0ed190
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qhaXH9UDIeB.A.Y5B.zN_EhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1271
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210811155713.ym4duw4va7vo3yrc@redhat.com
Resent-Date: Wed, 11 Aug 2021 15:57:39 +0000 (UTC)

On Wed, Aug 11, 2021 at 02:44:28PM +0200, Christoph Hellwig wrote:
> nbd_index_mutex is currently held over add_disk and inside ->open, which
> leads to lock order reversals.  Refactor the device creation code path
> so that nbd_dev_add is called without nbd_index_mutex lock held and
> only takes it for the IDR insertation.

insertion

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/nbd.c | 55 +++++++++++++++++++++++----------------------
>  1 file changed, 28 insertions(+), 27 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

