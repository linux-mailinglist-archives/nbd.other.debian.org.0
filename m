Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4551E7F6B
	for <lists+nbd@lfdr.de>; Fri, 29 May 2020 15:58:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 20835205EC; Fri, 29 May 2020 13:58:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 29 13:58:31 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A0B3E205E9
	for <lists-other-nbd@bendel.debian.org>; Fri, 29 May 2020 13:58:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IWvxg5EtDIzx for <lists-other-nbd@bendel.debian.org>;
	Fri, 29 May 2020 13:58:19 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 4069 seconds by postgrey-1.36 at bendel; Fri, 29 May 2020 13:58:18 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by bendel.debian.org (Postfix) with ESMTP id CC9CF205E7
	for <nbd@other.debian.org>; Fri, 29 May 2020 13:58:18 +0000 (UTC)
Old-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590760693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T/x9tO4BQ7uwPwEwbV192uAZ4YFpLY/ahrULk+3N5Bw=;
	b=avBuiXIvNRbT8bX/eVdakc93kPwn0rnYchVrCHGZnAW6yONANh6hPGjhkJ5Uv+DI2l1ENl
	Ler/NWE/Bww+MRFLAE1sNopX6oJru5Uism9w4QYQy61W8gM0VqAjwsiDDI/oEXU+j+Qg54
	iw/ot36IgyR39vXKxn9F/M6tsz28G7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-Edg8FJTbPtKek37W0wA_TA-1; Fri, 29 May 2020 09:58:12 -0400
X-MC-Unique: Edg8FJTbPtKek37W0wA_TA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B705EC1A8;
	Fri, 29 May 2020 13:58:11 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 646D65D9D5;
	Fri, 29 May 2020 13:58:07 +0000 (UTC)
Subject: Re: [Libguestfs] Provide NBD via Browser over Websockets
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
 Eric Wheeler <nbd@lists.ewheeler.net>, Nir Soffer <nsoffer@redhat.com>,
 libguestfs <libguestfs@redhat.com>, nbd@other.debian.org,
 QEMU <qemu-devel@nongnu.org>
References: <alpine.LRH.2.11.1810131833150.18520@mx.ewheeler.net>
 <CAMRbyytcufK8-XdFu7LU+UwO_FRoGJO2FhhBHtH9etf3A2htwQ@mail.gmail.com>
 <alpine.LRH.2.11.2005280014150.13970@mail.ewheeler.net>
 <20200528090443.GN7304@redhat.com>
 <alpine.LRH.2.11.2005282147410.13970@mail.ewheeler.net>
 <20200529093744.GS3888@redhat.com>
 <13571029-5bf4-2dfa-6879-0ad2642afb3f@redhat.com>
 <20200529135042.GJ2755532@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <ff2e7dd1-c8b2-b46c-3c3b-ed88d9ad9689@redhat.com>
Date: Fri, 29 May 2020 08:58:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200529135042.GJ2755532@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gfqQv8tBhhJ.A.w0G.HUR0eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/886
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ff2e7dd1-c8b2-b46c-3c3b-ed88d9ad9689@redhat.com
Resent-Date: Fri, 29 May 2020 13:58:31 +0000 (UTC)

On 5/29/20 8:50 AM, Daniel P. Berrangé wrote:

>>> (2) You need to persuade qemu's NBD client to read from a WebSocket.
>>> I didn't really know anything about WebSockets until today but it
>>> seems as if they are a full-duplex protocol layered on top of HTTP [a].
>>> Is there a WebSocket proxy that turns WS into plain TCP (a bit like
>>> stunnel)?  Google suggests [b].
>>>
>>> [a] https://en.wikipedia.org/wiki/WebSocket#Protocol_handshake
>>> [b] https://github.com/novnc/websockify
>>
>> qemu already knows how to connect as a client to websockets; Dan Berrange
>> knows more about that setup.  I suspect it would not be too difficult to
>> teach the qemu NBD client code to use a WebSocket instead of a Unix or TCP
>> socket as its data source.
> 
> Actually the inverse. The QIOChannelWebsocket impl is only the server
> side of the problem, as used by QEMU's VNC server. We've never implemented
> the client side. There is nothing especially stopping us doing that - just
> needs someone motivated with time to work on it.

In the meantime, you may still be able to set up something like:

local machine:
iso -> NBD server -> Unix socket -> websockify -> WebSocket

remote machine:
WebSocket -> websockify -> Unix socket -> qemu NBD client

Adding websocket client support into qemu would reduce the length of the 
chain slightly (for less data copying) by getting rid of a websockify 
proxy middleman, but would not necessarily improve performance (it's 
hard to say where the latency bottlenecks will be in the chain).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

