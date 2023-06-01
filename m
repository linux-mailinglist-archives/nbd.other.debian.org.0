Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B7F71917E
	for <lists+nbd@lfdr.de>; Thu,  1 Jun 2023 05:51:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0CE46209CB; Thu,  1 Jun 2023 03:51:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  1 03:51:12 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8A25320A5F
	for <lists-other-nbd@bendel.debian.org>; Thu,  1 Jun 2023 03:33:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.161, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JuVy5wywFZfe for <lists-other-nbd@bendel.debian.org>;
	Thu,  1 Jun 2023 03:33:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id AE8E020A6F
	for <nbd@other.debian.org>; Thu,  1 Jun 2023 03:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685590407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gjHHvLtn01/n9Es9Irj9zKZ7KBpy4iBjrfb3QGK8w/8=;
	b=at2Noqdlazt09sqJU7q8q3F2wllxg0ikLJ/wd5jo5Mpt/tXMo7DlRcXN8d+TfWEIzqW+Re
	7+WArrgdoOnuSoG9e9Usw9YzVyQv5MO9w28vAklyTmHJcjaGjYVbNNG21SDrxgpnYPIRC+
	tQNp+8brhhxiJI+3oTp6FHoXMqyVUNs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-aDzUm9xRNimeIbXl9Hk5NA-1; Wed, 31 May 2023 23:33:23 -0400
X-MC-Unique: aDzUm9xRNimeIbXl9Hk5NA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D46791C05AEB;
	Thu,  1 Jun 2023 03:33:22 +0000 (UTC)
Received: from [10.39.192.48] (unknown [10.39.192.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E57DE112132C;
	Thu,  1 Jun 2023 03:33:21 +0000 (UTC)
Message-ID: <f640bebb-28fc-24ae-5fc6-8d474f719b34@redhat.com>
Date: Thu, 1 Jun 2023 05:33:20 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 03/22] protocol: Add definitions
 for extended headers
To: Eric Blake <eblake@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, libguestfs@redhat.com,
 qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-4-eblake@redhat.com>
 <2b98a2ca-62d5-c87b-2a37-1a49af89b4b4@redhat.com>
 <ZHYOgQAL3ELxr1S9@pc220518.home.grep.be>
 <7f186cd0-b42e-7a20-2946-39ffecd23383@redhat.com>
 <5w3fbetyz62qb7rdiqu5xxpfbdhezlmkk24nvuxe6p4sem2j4w@c5lxwuc5yukh>
 <3dba1488-9b41-bd30-dd9d-f8b0402769a1@redhat.com>
 <gdrdshhhjqzmhwdwvum6vahnex4d4ei5rgvxxucbwwrwidvmuy@zg2ceuzzqmah>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <gdrdshhhjqzmhwdwvum6vahnex4d4ei5rgvxxucbwwrwidvmuy@zg2ceuzzqmah>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NH8SD2n4_oL.A.byC.wWBekB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2519
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f640bebb-28fc-24ae-5fc6-8d474f719b34@redhat.com
Resent-Date: Thu,  1 Jun 2023 03:51:13 +0000 (UTC)

On 5/31/23 18:04, Eric Blake wrote:
> On Wed, May 31, 2023 at 01:29:30PM +0200, Laszlo Ersek wrote:
>>>> Putting aside alignment even, I don't understand why reducing "count" to
>>>> uint16_t would be reasonable. With the current 32-bit-only block
>>>> descriptor, we already need to write loops in libnbd clients, because we
>>>> can't cover the entire remote image in one API call [*]. If I understood
>>>> Eric right earlier, the 64-bit extensions were supposed to remedy that
>>>> -- but as it stands, clients will still need loops ("chunking") around
>>>> block status fetching; is that right?
>>>
>>> While the larger extents reduce the need for looping, it does not
>>> entirely eliminate it.  For example, just because the server can now
>>> tell you that an image is entirely data in just one reply does not
>>> mean that it will actually do so - qemu in particular limits block
>>> status of a qcow2 file to reporting just one cluster at a time for
>>> consistency reasons, where even if you use the maximum size of 2M
>>> clusters, you can never get more than (2M/16)*2M = 256G status
>>> reported in a single request.
>>
>> I don't understand the calculation. I can imagine the following
>> interpretation:
>>
>> - QEMU never sends more than 128K block descriptors, and each descriptor
>> covers one 2MB sized cluster --> 256 GB of the disk covered in one go.
>>
>> But I don't understand where the (2M/16) division comes from, even
>> though the quotient is 128K.
> 
> Ah, I need to provide more backstory on the qcow2 format.  A qcow2
> image has a fixed cluster size, chosen between between 512 and 2M
> bytes.  A smaller cluster size has less wasted space for small images,
> but uses more overhead.  Each cluster has to be stored in an L1 map,
> where pages of the map are also a cluster in length, with 16 bytes per
> map entry.  So if you pick a cluster size of 512, you get 512/16 or 32
> entries per L1 page; if you pick a cluster size of 2M, you get 2M/16
> or 128k entries per L1 page.  When reporting block status, qemu reads
> at most one L1 page to then say how each cluster referenced from that
> page is mapped.
> 
> https://gitlab.com/qemu-project/qemu/-/blob/master/docs/interop/qcow2.txt#L491
> 
>>
>> I can connect the constant "128K", and
>> <https://github.com/NetworkBlockDevice/nbd/commit/926a51df>, to your
>> paragraph [*] above, but not the division.
> 
> In this case, the qemu limit on reporting block status of at most one
> L1 map page at a time happens to have no relationship to the NBD
> constant of limiting block status reports to no more than 1M extents
> (8M bytes) in a single reply, nor the fact that qemu picked a cap of
> 1M bytes (128k extents) on its NBD reply regardless of whether the
> underlying image is qcow2 or some other format.

Thanks!

[...]

Laszlo

