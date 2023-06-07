Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F33A6726366
	for <lists+nbd@lfdr.de>; Wed,  7 Jun 2023 16:55:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AB971204F1; Wed,  7 Jun 2023 14:55:24 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun  7 14:55:24 2023
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0B207204DA
	for <lists-other-nbd@bendel.debian.org>; Wed,  7 Jun 2023 14:55:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.191 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MQwU9q4NPyDI for <lists-other-nbd@bendel.debian.org>;
	Wed,  7 Jun 2023 14:55:10 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 310C5204C4
	for <nbd@other.debian.org>; Wed,  7 Jun 2023 14:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686149705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AMts748U10Cjx+Zc8oeEw9432YBzlRvJzmeSleKcN58=;
	b=fxisIpLueS6a+Sqs+6EfV5iOOyiHu3pLY9bJXCqcG4cahyXhVnJ9bUJLPm7x5IbG3WjtNi
	WVeMpbodFYUG+G/g8bAIhos0HfZVMxlt3i7eH4AU5UNYLCM6kg/g5M1IkIu4arA6WjmaKi
	zJD//5vADgsG0Q4oMu/C21dB/K46Eiw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-paWrONp8PkmQm2Zfk0J96Q-1; Wed, 07 Jun 2023 10:55:01 -0400
X-MC-Unique: paWrONp8PkmQm2Zfk0J96Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96890811E88;
	Wed,  7 Jun 2023 14:55:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 54F82477F61;
	Wed,  7 Jun 2023 14:55:01 +0000 (UTC)
Date: Wed, 7 Jun 2023 15:55:00 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com,
	qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 05/22] states: Prepare to receive
 64-bit replies
Message-ID: <20230607145500.GG7773@redhat.com>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-6-eblake@redhat.com>
 <80c36755-eda3-5d04-1418-89f11f825577@redhat.com>
MIME-Version: 1.0
In-Reply-To: <80c36755-eda3-5d04-1418-89f11f825577@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ikNH8gmVTFN.A.SxH.cpJgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2530
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230607145500.GG7773@redhat.com
Resent-Date: Wed,  7 Jun 2023 14:55:24 +0000 (UTC)

On Thu, Jun 01, 2023 at 11:04:05AM +0200, Laszlo Ersek wrote:
> On 5/25/23 15:00, Eric Blake wrote:
> > @@ -69,11 +75,18 @@  REPLY.STRUCTURED_REPLY.RECV_REMAINING:
> >   REPLY.STRUCTURED_REPLY.CHECK:
> >    struct command *cmd = h->reply_cmd;
> >    uint16_t flags, type;
> > -  uint32_t length;
> > +  uint64_t length;
> > +  uint64_t offset = -1;
> 
> (6) I disagree with initializing the local variable "offset" here.
> 
> Below (in the rest of REPLY.STRUCTURED_REPLY.CHECK), we only read
> "offset" back if "extended_headers" is set. But if "extended_headers" is
> set, we also store a value to "offset", before the read.
> 
> Initializing "offset" to -1 suggests that the code might otherwise read
> an indeterminate value from "offset" -- but that's not the case.

You may find that the compiler will give a warning.  It's usually not
good about dealing with the case where a variable being initialized +
used depends on another variable being true.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

