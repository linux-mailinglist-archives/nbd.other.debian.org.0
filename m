Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AA6189BF7
	for <lists+nbd@lfdr.de>; Wed, 18 Mar 2020 13:29:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F362520794; Wed, 18 Mar 2020 12:29:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 18 12:29:26 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 995462078A
	for <lists-other-nbd@bendel.debian.org>; Wed, 18 Mar 2020 12:29:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.101 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NH1voXXKCuUY for <lists-other-nbd@bendel.debian.org>;
	Wed, 18 Mar 2020 12:29:15 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 385 seconds by postgrey-1.36 at bendel; Wed, 18 Mar 2020 12:29:15 UTC
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by bendel.debian.org (Postfix) with ESMTP id 1B0EF2077D
	for <nbd@other.debian.org>; Wed, 18 Mar 2020 12:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584534550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aZWjIRLHGSZYOdLtyBid6ptyM2M5Kis6wHpaqIpml1g=;
	b=FvLbqiDfZta3WPMv09kAW8/D2Q7rA613JXqhXrD56LaMB4+k8TDq/W0Aebv2BED0boeAEZ
	uPli0Vx0ZurLbuP+AifCrFU6xJAyzvvZUYiCHJTaxbni0I0alyYy6rBKOknGrT9EXkaeKQ
	HA6N3EDLCGtB186JmqzojF7BEWtMDB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-En6XKBuyMjWtJ34KJiaoGg-1; Wed, 18 Mar 2020 08:22:43 -0400
X-MC-Unique: En6XKBuyMjWtJ34KJiaoGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5CA118A6EC3;
	Wed, 18 Mar 2020 12:22:41 +0000 (UTC)
Received: from [10.3.112.193] (ovpn-112-193.phx2.redhat.com [10.3.112.193])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A9C58CCE2;
	Wed, 18 Mar 2020 12:22:40 +0000 (UTC)
Subject: Re: [RFC v2] nbd/proto: introduce extended request and 64bit commands
To: Wouter Verhelst <wouter@grep.be>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, w@uter.be,
 nsoffer@redhat.com, den@openvz.org
References: <20200206151547.5812-1-vsementsov@virtuozzo.com>
 <2f56c11f-3380-9b83-6873-2ec8f4c3d07d@virtuozzo.com>
 <20200317161859.GD27056@grep.be>
 <fd6a5d69-36da-bb4f-b67d-44ef80577a88@virtuozzo.com>
 <20200318053337.GE27056@grep.be>
 <49e18291-7e7b-a363-c807-80d4cc589fd8@virtuozzo.com>
 <78efe37b-b54b-cc59-aec2-1ce39ec1676b@virtuozzo.com>
 <20200318080454.GH27056@grep.be>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f4f52b87-5520-4b8c-1b1d-2e681e1ff514@redhat.com>
Date: Wed, 18 Mar 2020 07:22:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200318080454.GH27056@grep.be>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7XPu0eIgaSL.A.J5B.mQhceB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/866
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f4f52b87-5520-4b8c-1b1d-2e681e1ff514@redhat.com
Resent-Date: Wed, 18 Mar 2020 12:29:26 +0000 (UTC)

On 3/18/20 3:04 AM, Wouter Verhelst wrote:
> On Wed, Mar 18, 2020 at 09:19:45AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> OK, understand. Reasonable thing, agreed. I'll resend.
>>
>> Hmm. But we can't read in one go anyway, because we need to distinguish NBD_REQUEST_MAGIC
>> from NBD_EXTENDED_REQUEST_MAGIC..
> 
> Yes, that needs to happen at any rate, indeed. So the difference will be
> two reads rather than three, instead of one read rather than two.
> 
> That's still an advantage.

Not much of one.  You're micro-optimizing the read()s, but in reality, 
the sender will likely send() the entire packet at once, at which point 
the data is in the kernel and the reads will succeed back-to-back, or 
you can even write the client to read into a buffer to minimize syscalls 
and then parse as much as needed out of the buffer.

You've got a LOT more overhead in the TCP packet and network 
transmission time than you do in deciding whether the server has to do 2 
or 3 read()s per client message.

While it might be nice to design a message that doesn't need the server 
to do additional decision points mid-packet in determining how much 
packet remains, that should not be your driving factor. Even with 
current servers, that is already the case (the server has to decide 
mid-packet whether it is handling NBD_CMD_WRITE and thus has more data 
to read).

> 
>> I think, that modern client will use mostly NBD_EXTENDED_REQUEST_MAGIC interface, so it will
>> be great to optimize it. But to read extended request in one go, we should make it
>> shorter than simple request, and it doesn't seem possible.
>>
>> May be we should not support simple and extended requests together? May be better to force
>> using only extended requests if they are negotiated? Then we will read extended request in
>> on go, and we may just define it like

As extended requests already have to be negotiated, and no client nor 
server exists yet that supports them, we can indeed declare that on 
successful handshake of the new feature, a client may ONLY send extended 
requests.  However, a server already has to handle both packet types (if 
the client doesn't request the feature) and a client already has to be 
able to send both packet types (for fallback when talking to a server 
that lacks the feature), so what does it buy us to require that when the 
feature is negotiated, only extended packets may be sent?  I guess it 
boils down to whether the server implementation is simplified or made 
more complex, depending on whether we state that once negotiated both 
packet types are allowed (server must decide on a per-packet basis which 
type it is receiving) or whether only extended packets are allowed 
(server must now be more stateful in order to reject an ill-behaved 
client that sends wrong type).  In fact, I argue that a server that 
replies to an extended packet even when an ill-behaved client that 
forgot to negotiate them is a reasonable server implementation (the 
client can't depend on that behavior, though).

>>
>> C: 32 bits, 0x23876289, magic (`NBD_EXTENDED_REQUEST_MAGIC`)
>> C: 16 bits, flags
>> C: 16 bits, type
>> C: 64 bits, handle
>> C: 32 bits, length of payload (unsigned), MUST be greater or equal to 16
>> C: *length* bytes of payload data (if *length* is nonzero)
>>
>> - so, we'll just read 36 bytes in one go, and then additional payload, if length
>> is more than 16.
> 
> That is, certainly, also an option, although I would define length of
> payload to not include the offset and length bytes.

Agreed - mixing header length into the length of the payload field makes 
life a bit more confusing.  I'd rather have the length field be 0 when 
sending a minimum-sized extended request packet.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

