Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F162692C5
	for <lists+nbd@lfdr.de>; Mon, 14 Sep 2020 19:15:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AF2D620172; Mon, 14 Sep 2020 17:15:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 14 17:15:26 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9217820120
	for <lists-other-nbd@bendel.debian.org>; Mon, 14 Sep 2020 17:15:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.329 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id i9oj1Sq8t4Bq for <lists-other-nbd@bendel.debian.org>;
	Mon, 14 Sep 2020 17:15:14 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 2435 seconds by postgrey-1.36 at bendel; Mon, 14 Sep 2020 17:15:14 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by bendel.debian.org (Postfix) with ESMTP id 04F2D2012D
	for <nbd@other.debian.org>; Mon, 14 Sep 2020 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600103708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pG1UWbRUrjzwEW+eGKT9lwNAwEjx7C3FgAI3nM4EQPo=;
	b=VspNWQ9wMpccwa9mfcZSHs91vjR0aVBQJDUPP5rlLwRcY09hODv+qabpYJcGv20/rUpomV
	aHZvQRb70H/7MYlLs9wKPmx9bIBoE0MsbjyRdgKYUcf10bvZw/jL/I3DRZU1kTS+fcIM3X
	fQ52Dg3pn8sqUsv+t4EtmNZ4QgDAXlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-gkH58FqGM_iOJx4ULBpigw-1; Mon, 14 Sep 2020 13:15:01 -0400
X-MC-Unique: gkH58FqGM_iOJx4ULBpigw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3569D1800D4A;
	Mon, 14 Sep 2020 17:15:00 +0000 (UTC)
Received: from [10.3.113.68] (ovpn-113-68.phx2.redhat.com [10.3.113.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 024C560C0F;
	Mon, 14 Sep 2020 17:14:59 +0000 (UTC)
Subject: Re: Mounting from multiple devices
To: Gregor Haas <gregorhaas1997@gmail.com>, nbd@other.debian.org
References: <CAMqWt3oixWoLuHUUxeRZDPAJGoF_M0sOZtVNfbiaaSq8KxjN0g@mail.gmail.com>
 <166c6457-0ad7-cb3d-d1d3-83c8e6de35a7@redhat.com>
 <CAMqWt3pwsozO145PagT+uEAGKReABMmVfinFURojaoyGJCn-dw@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b5b17845-4ffd-c432-597f-69881f5ca73c@redhat.com>
Date: Mon, 14 Sep 2020 12:14:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMqWt3pwsozO145PagT+uEAGKReABMmVfinFURojaoyGJCn-dw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YyMbVQr9K2L.A.-9C.uU6XfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/980
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b5b17845-4ffd-c432-597f-69881f5ca73c@redhat.com
Resent-Date: Mon, 14 Sep 2020 17:15:26 +0000 (UTC)

On 9/14/20 11:47 AM, Gregor Haas wrote:
> Hi Eric,
> 
> Thank you for the quick response. I'm still pretty new to playing with
> filesystems
> so thank you also for the information about clustered filesystems. I'll be
> looking
> into these for my use case.
> 
> So essentially, any synchronization for parallel clients would have to
> happen at
> the filesystem layer -- NBD has no mechanisms in place for that, and simply
> exports a raw block device. Is my understanding of that correct?

Correct - NBD is _just_ block storage, and has no synchronization 
primitives beyond NBD_CMD_FLUSH (which flushes all prior writes) or 
NBD_CMD_FLAG_FUA (which flushes the current write), where even those 
primitives are optional.  (There may be other forked implementations of 
the NBD protocol that have added further primitives as additional 
extensions, but no one has proposed adding such extensions into the 
upstream NBD protocol documentation yet for interoperability between 
implementations).

How you use the block storage (whether as a building block to larger 
storage arrays, as swap space, as a file system, etc) is up to higher 
layers of software.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

