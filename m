Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198454C662
	for <lists+nbd@lfdr.de>; Wed, 15 Jun 2022 12:41:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E3646204E4; Wed, 15 Jun 2022 10:41:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jun 15 10:41:36 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_LOW,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B7C8A20498
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 Jun 2022 10:41:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.057 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.147, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_LOW=-0.7, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VFG1B2JMiqKc for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 Jun 2022 10:41:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 372 seconds by postgrey-1.36 at bendel; Wed, 15 Jun 2022 10:41:23 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 8785320485
	for <nbd@other.debian.org>; Wed, 15 Jun 2022 10:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655289678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NvCFJozpcbkfiMJa933SFhmaNqjxAIq0tChE4kar+BQ=;
	b=HPYaAa7GLpnnbQWiUbuimZ1JRsgN/yQs85yLkrSznV4LhLXMj0PIFZnCfJap7m8OUGN6Vt
	gmUOHNr4nmLSP/6HyoGr3BSw49D0vWbJtRJsw20taQmELlc+4U61h2KiWPzE6VeQlzfhNe
	0RD0wDnOfsXtRlEf0Zd20liP7RX/y0g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-CgxVp6KUNUazqy6uwAEQBg-1; Wed, 15 Jun 2022 06:35:04 -0400
X-MC-Unique: CgxVp6KUNUazqy6uwAEQBg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F1983C0ED42
	for <nbd@other.debian.org>; Wed, 15 Jun 2022 10:35:04 +0000 (UTC)
Received: from localhost (unknown [10.39.192.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F3AA3492CA5;
	Wed, 15 Jun 2022 10:35:03 +0000 (UTC)
Date: Wed, 15 Jun 2022 11:35:03 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>, nbd@other.debian.org,
	libguestfs@redhat.com
Subject: Re: Kernel driver I/O block size hinting
Message-ID: <20220615103503.GB5720@redhat.com>
References: <20220614143819.GX8021@redhat.com>
 <87bkuv59h4.fsf@vostro.rath.org>
 <20220615100931.GS1127@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220615100931.GS1127@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mv-rRDwOl6P.A.r4G.gdbqiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2140
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220615103503.GB5720@redhat.com
Resent-Date: Wed, 15 Jun 2022 10:41:36 +0000 (UTC)

On Wed, Jun 15, 2022 at 11:09:31AM +0100, Richard W.M. Jones wrote:
> This kernel setting limits the maximum request size on the queue.
> 
> In my testing reading and writing files with the default [above] the
> kernel never got anywhere near sending multi-megabyte requests.  In
> fact the largest request it sent was 128K, even when I did stuff like:
> 
> # dd if=/dev/zero of=/tmp/mnt/zero bs=100M count=10
> 
> 128K happens to be 2 x blk_queue_io_opt, but I need to do more testing
> to see if that relationship always holds.

The answer is apparently no.  With minimum_io_size == 64K and
optimal_io_size == 256K, the server still only sees at most 128K
requests.

Although I still think we need to make these changes to nbd.ko, I
don't think this is going to solve the original problem of trying to
aggregate requests into the very large block sizes favoured by S3.
(nbdkit blocksize filter + a layer of caching seems like the way to go
for that)

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

