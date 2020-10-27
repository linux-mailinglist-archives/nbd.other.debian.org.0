Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1181829A281
	for <lists+nbd@lfdr.de>; Tue, 27 Oct 2020 03:06:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EFB61203C6; Tue, 27 Oct 2020 02:06:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 27 02:06:18 2020
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 10CD82028C
	for <lists-other-nbd@bendel.debian.org>; Tue, 27 Oct 2020 01:49:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.221 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
	RCVD_IN_MSPIKE_WL=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xv6Jk6b0Dykt for <lists-other-nbd@bendel.debian.org>;
	Tue, 27 Oct 2020 01:49:33 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 36B70202E4
	for <nbd@other.debian.org>; Tue, 27 Oct 2020 01:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603763368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8SrYT8zX0tHJ+L74DDGK2r1FEkedibAS0AWcoEpa4aY=;
	b=g0TyQqP+2bBcJHfc5/uHITt8LRvWVVxmUsso06a3RVbYMvgZtrxKCb7GfG6SWHhMSoIqaP
	9LO9TbZhl61IcUXsjsPFXrcdKXKGTanY+K+yIvmb81ELpQxjlBSlV0JDSQzs6M6ezufDwQ
	uA4Nl/B3T5qVWrm0Vw/00F1IZV8LV5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-OOkJbHEYPKOO7ro1yyiCeg-1; Mon, 26 Oct 2020 21:18:16 -0400
X-MC-Unique: OOkJbHEYPKOO7ro1yyiCeg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36CC51009E27;
	Tue, 27 Oct 2020 01:18:14 +0000 (UTC)
Received: from T590 (ovpn-12-132.pek2.redhat.com [10.72.12.132])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 246455C1BB;
	Tue, 27 Oct 2020 01:18:05 +0000 (UTC)
Date: Tue, 27 Oct 2020 09:18:01 +0800
From: Ming Lei <ming.lei@redhat.com>
To: lining <lining2020x@163.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	nbd@other.debian.org, yunchuan.wen@kylin-cloud.com,
	ceph-users@ceph.io, donglifekernel@126.com
Subject: Re: [bug report] NBD: rbd-nbd + ext4 stuck after nbd resized
Message-ID: <20201027011801.GA1828887@T590>
References: <AA00244F-0E5A-4E52-B358-4F36A3486EBF@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AA00244F-0E5A-4E52-B358-4F36A3486EBF@163.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <V2koyupBzj.A.mYH.aC4lfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1024
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201027011801.GA1828887@T590
Resent-Date: Tue, 27 Oct 2020 02:06:18 +0000 (UTC)

On Wed, Oct 21, 2020 at 09:08:10AM +0800, lining wrote:
> (Sorry for sending this mail again, this one add nbd@other.debian.org)
> 
> Hi kernel、ceph comunity:
> 
> We run into an issue that mainly related to the (kernel) nbd driver and (ceph) rbd-nbd. 
> After some investigations, I found that the root cause of the problem seems to be related to the change in the block size of nbd.
> 
> I am not sure whether it is the nbd driver or rbd-nbd bug, however there is such a problem.
> 
> 
> What happened：
> It will always hang when accessing the mount point of nbd device with ext4 after nbd resized. 
> 
> 
> Environment information:
> - kernel:               v4.19.25 or master
> - rbd-nbd(ceph):  v12.2.0 Luminous or master
> - the fs of nbd:    ext4

Hello lining,

Can you reproduce this issue on v5.9 kernel?


Thanks,
Ming

