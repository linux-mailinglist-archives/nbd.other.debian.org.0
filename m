Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5B06E1EF3
	for <lists+nbd@lfdr.de>; Fri, 14 Apr 2023 11:04:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0D4DA20587; Fri, 14 Apr 2023 09:04:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr 14 09:04:42 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	LONGWORD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7BBF620573
	for <lists-other-nbd@bendel.debian.org>; Fri, 14 Apr 2023 09:04:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, LONGWORD=2, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rzgH-TVLKezr for <lists-other-nbd@bendel.debian.org>;
	Fri, 14 Apr 2023 09:04:25 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 0E56220571
	for <nbd@other.debian.org>; Fri, 14 Apr 2023 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681463059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JfN+XW7mChh1Cha+AVGDUbcTtIFI7Mdt5FCnwXOuumQ=;
	b=TeM7Na9hiXpkbnLIUgXHL+8e/re0GDnl/ojfTUlSAAoP/vUMLglU8ok0mt5OCtw9gUisIF
	8LTQo5HrFrA3IQZZsUFyN4VkQ2Uat75iSDxhqX/Y9KdIy6hWsFy0dwz2ARvLgzwyVFaihf
	VHY5xROa8jA4Tg1Nfp2H+/1A+k+0xZc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-LTUpCAvrOm2_PDjuqSxE_g-1; Fri, 14 Apr 2023 05:04:18 -0400
X-MC-Unique: LTUpCAvrOm2_PDjuqSxE_g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CED4C29DD990;
	Fri, 14 Apr 2023 09:04:17 +0000 (UTC)
Received: from localhost (unknown [10.39.192.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87831492B00;
	Fri, 14 Apr 2023 09:04:17 +0000 (UTC)
Date: Fri, 14 Apr 2023 10:04:16 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, libguestfs@redhat.com, qemu-block@nongnu.org
Subject: Re: [Libguestfs] [PATCH v3 6/6] RFC: spec: Introduce
 NBD_REPLY_TYPE_OFFSET_HOLE_EXT
Message-ID: <20230414090416.GQ7773@redhat.com>
References: <20230413220241.1396012-1-eblake@redhat.com>
 <20230413220241.1396012-7-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230413220241.1396012-7-eblake@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LP03qVD_hVI.A.d_G.qcROkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2429
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230414090416.GQ7773@redhat.com
Resent-Date: Fri, 14 Apr 2023 09:04:43 +0000 (UTC)


So I read through the whole series this morning and it all seems
reasonable.  Therefore:

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

