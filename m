Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 691BD1EB1A1
	for <lists+nbd@lfdr.de>; Tue,  2 Jun 2020 00:20:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 396CD20404; Mon,  1 Jun 2020 22:20:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun  1 22:20:31 2020
Old-Return-Path: <alex@king.net.nz>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RDNS_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 26E9820346
	for <lists-other-nbd@bendel.debian.org>; Mon,  1 Jun 2020 22:20:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.307 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	RDNS_NONE=0.793] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DWlGi_V46e_q for <lists-other-nbd@bendel.debian.org>;
	Mon,  1 Jun 2020 22:20:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 2341 seconds by postgrey-1.36 at bendel; Mon, 01 Jun 2020 22:20:19 UTC
Received: from bob.king.net.nz (unknown [103.250.230.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9817D2032C
	for <nbd@other.debian.org>; Mon,  1 Jun 2020 22:20:18 +0000 (UTC)
Old-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=king.net.nz
	; s=s1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Dk/UMaRH6oRXaETwW6fZir1XvAPItDeuaWBULsDwmg4=; b=AlDw2zOOWmwZUMDAgbfRLjddUN
	4AB2Hpz2LWVFX6Rz8Cytm/EtDQnhoCgl9KptZ8B6cD5Gh1NvS9DeucOE4GhWAuk7thHjaygnF3EPl
	AfgB2+S0SLc0YlHm4dXShIj9/R2zxJ3+WcPKyYevdHXPn6sfIrLgcAwT584NaGdKj/DU=;
Received: from 115-189-99-233.mobile.spark.co.nz ([115.189.99.233]:42187 helo=[0.0.0.0])
	by juliet.king.net.nz with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <alex@king.net.nz>)
	id 1jfsBC-0004zZ-H0
	for nbd@other.debian.org; Tue, 02 Jun 2020 09:41:10 +1200
Subject: Re: [Libguestfs] Provide NBD via Browser over Websockets
To: nbd@other.debian.org
References: <CAMRbyytcufK8-XdFu7LU+UwO_FRoGJO2FhhBHtH9etf3A2htwQ@mail.gmail.com>
 <alpine.LRH.2.11.2005280014150.13970@mail.ewheeler.net>
 <20200528090443.GN7304@redhat.com>
 <alpine.LRH.2.11.2005282147410.13970@mail.ewheeler.net>
 <20200529093744.GS3888@redhat.com>
 <13571029-5bf4-2dfa-6879-0ad2642afb3f@redhat.com>
 <20200529135042.GJ2755532@redhat.com>
 <ff2e7dd1-c8b2-b46c-3c3b-ed88d9ad9689@redhat.com>
 <20200529141315.GU3888@redhat.com>
 <alpine.LRH.2.11.2005292107180.10871@mail.ewheeler.net>
 <20200530092715.GX3888@redhat.com>
 <alpine.LRH.2.11.2006012002380.10871@mail.ewheeler.net>
From: Alex King <alex@king.net.nz>
Message-ID: <01747dce-300b-d36f-b483-de00a7133b0d@king.net.nz>
Date: Tue, 2 Jun 2020 09:41:09 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.2006012002380.10871@mail.ewheeler.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DdUgv6oTy4G.A.r1D.v8X1eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/897
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/01747dce-300b-d36f-b483-de00a7133b0d@king.net.nz
Resent-Date: Mon,  1 Jun 2020 22:20:31 +0000 (UTC)

I started writing an NBD server in rust as a learning project a while 
back, which I why I subscribed to the list.  I understand rust can be 
compiled into webassembly although it's not something I've done. If 
there were others also interested in doing that I'd be interested.  I 
haven't checked lately to see if there is a rust server published now, 
there may be.

Thanks,
Alex

On 2/06/20 8:04 am, Eric Wheeler wrote:
> On Sat, 30 May 2020, Richard W.M. Jones wrote:
>> On Fri, May 29, 2020 at 09:08:29PM +0000, Eric Wheeler wrote:
>>> On Fri, 29 May 2020, Richard W.M. Jones wrote:
>>>> On Fri, May 29, 2020 at 08:58:06AM -0500, Eric Blake wrote:
>>>>> On 5/29/20 8:50 AM, Daniel P. BerrangÃ?Â© wrote:
>>>>>
>>>>>>>> (2) You need to persuade qemu's NBD client to read from a WebSocket.
>>>>>>>> I didn't really know anything about WebSockets until today but it
>>>>>>>> seems as if they are a full-duplex protocol layered on top of HTTP [a].
>>>>>>>> Is there a WebSocket proxy that turns WS into plain TCP (a bit like
>>>>>>>> stunnel)?  Google suggests [b].
>>>>>>>>
>>>>>>>> [a] https://en.wikipedia.org/wiki/WebSocket#Protocol_handshake
>>>>>>>> [b] https://github.com/novnc/websockify
>>>>>>> qemu already knows how to connect as a client to websockets; Dan Berrange
>>>>>>> knows more about that setup.  I suspect it would not be too difficult to
>>>>>>> teach the qemu NBD client code to use a WebSocket instead of a Unix or TCP
>>>>>>> socket as its data source.
>>>>>> Actually the inverse. The QIOChannelWebsocket impl is only the server
>>>>>> side of the problem, as used by QEMU's VNC server. We've never implemented
>>>>>> the client side. There is nothing especially stopping us doing that - just
>>>>>> needs someone motivated with time to work on it.
>>>>> In the meantime, you may still be able to set up something like:
>>>>>
>>>>> local machine:
>>>>> iso -> NBD server -> Unix socket -> websockify -> WebSocket
>>>> I guess the idea is to have a zero-install solution for the browser.
>>>> As I said in the email earlier this is very common for IPMI-type
>>>> remote access to blade servers and in my experience is implemented
>>>> using a Java applet and a proprietary protocol terminated at the BMC
>>>> (which then emulates a virtual CDROM to the server).  There are some
>>>> HP blade servers on Red Hat's internal Beaker instance where you can
>>>> play with this.  For qemu we wouldn't need to invent a new protocol
>>>> when NBD is available and already implemented (albeit not yet on top
>>>> of WebSockets).
>>>>
>>>> The NBD server must run inside the browser and therefore be either
>>>> written from scratch in Javascript, or an existing server
>>>> cross-compiled to WASM (if that is possible - I don't really know).
>>> Interesting idea about WASM.  I'll see if I can build one of the simple
>>> nbd servers that are around.  Not sure how to link it to the JS file IO,
>>> however.
>> After reading a bit about compiling to WebSockets it sounds like you
>> can cross-compile a C program, but there's no library support at all.
>> IOW to port an existing server you'd have to implement enough of POSIX
>> to make it work.  nbdkit has a liberal license deliberately to make it
>> possible to chop it up and incorporate it into completely forked
>> codebases (nbdkit is a plot to make NBD more popular).
>>
>> But since NBD is pretty simple, a fresh Javascript server might be
>> easier, especially if you stick to only implementing reads.
> Good point, I'll wait on trying WASM.
>
> If anyone plans to implement NBD in JS let me know, otherwise I'll
> probably implement a stripped down verion to integrate as an nbdkit plugin
> to avoid re-writing all the handshake and version bits.
>
> --
> Eric Wheeler
>
>> Rich.
>>
>> -- 
>> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
>> Read my programming and virtualization blog: http://rwmj.wordpress.com
>> virt-top is 'top' for virtual machines.  Tiny program with many
>> powerful monitoring features, net stats, disk stats, logging, etc.
>> http://people.redhat.com/~rjones/virt-top
>>

