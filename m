Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A461E9009
	for <lists+nbd@lfdr.de>; Sat, 30 May 2020 11:27:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4AAF520533; Sat, 30 May 2020 09:27:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 30 09:27:45 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 192BA2051A
	for <lists-other-nbd@bendel.debian.org>; Sat, 30 May 2020 09:27:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 61f8vg7nQdBw for <lists-other-nbd@bendel.debian.org>;
	Sat, 30 May 2020 09:27:28 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id 9C55F204C0
	for <nbd@other.debian.org>; Sat, 30 May 2020 09:27:28 +0000 (UTC)
Old-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590830842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QNCBlcfXesRsi7EHYn/qiLEFZSVhVTbggu1BTv3xExs=;
	b=b2FAE5bsmCQfP6gCz0OWSG2qHMPcZ3jzyxEJsMOXWFig1iw7fJ0KbityaiRXoPWJUDPFYY
	u9ix3/DQ0M7PGnh4mE9mejEjHhMq8UWsYBCwh8WyyrZL7c4jTokFDDw5TdMQNMDsLeJZlJ
	9vgHpC/rPvW+PO0dCYfbtUMNA0wLuBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-divcMtUfP3iseg-lNCdiTw-1; Sat, 30 May 2020 05:27:20 -0400
X-MC-Unique: divcMtUfP3iseg-lNCdiTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECEA7107ACCA;
	Sat, 30 May 2020 09:27:18 +0000 (UTC)
Received: from localhost (ovpn-112-79.ams2.redhat.com [10.36.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 064A978366;
	Sat, 30 May 2020 09:27:15 +0000 (UTC)
Date: Sat, 30 May 2020 10:27:15 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Wheeler <nbd@lists.ewheeler.net>
Cc: Eric Blake <eblake@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Nir Soffer <nsoffer@redhat.com>, libguestfs <libguestfs@redhat.com>,
	nbd@other.debian.org, QEMU <qemu-devel@nongnu.org>
Subject: Re: [Libguestfs] Provide NBD via Browser over Websockets
Message-ID: <20200530092715.GX3888@redhat.com>
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
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.2005292107180.10871@mail.ewheeler.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Uzr4be7-Ck.A.mAB.Rci0eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/891
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200530092715.GX3888@redhat.com
Resent-Date: Sat, 30 May 2020 09:27:45 +0000 (UTC)

On Fri, May 29, 2020 at 09:08:29PM +0000, Eric Wheeler wrote:
> On Fri, 29 May 2020, Richard W.M. Jones wrote:
> > On Fri, May 29, 2020 at 08:58:06AM -0500, Eric Blake wrote:
> > > On 5/29/20 8:50 AM, Daniel P. BerrangÃ© wrote:
> > > 
> > > >>>(2) You need to persuade qemu's NBD client to read from a WebSocket.
> > > >>>I didn't really know anything about WebSockets until today but it
> > > >>>seems as if they are a full-duplex protocol layered on top of HTTP [a].
> > > >>>Is there a WebSocket proxy that turns WS into plain TCP (a bit like
> > > >>>stunnel)?  Google suggests [b].
> > > >>>
> > > >>>[a] https://en.wikipedia.org/wiki/WebSocket#Protocol_handshake
> > > >>>[b] https://github.com/novnc/websockify
> > > >>
> > > >>qemu already knows how to connect as a client to websockets; Dan Berrange
> > > >>knows more about that setup.  I suspect it would not be too difficult to
> > > >>teach the qemu NBD client code to use a WebSocket instead of a Unix or TCP
> > > >>socket as its data source.
> > > >
> > > >Actually the inverse. The QIOChannelWebsocket impl is only the server
> > > >side of the problem, as used by QEMU's VNC server. We've never implemented
> > > >the client side. There is nothing especially stopping us doing that - just
> > > >needs someone motivated with time to work on it.
> > > 
> > > In the meantime, you may still be able to set up something like:
> > > 
> > > local machine:
> > > iso -> NBD server -> Unix socket -> websockify -> WebSocket
> > 
> > I guess the idea is to have a zero-install solution for the browser.
> > As I said in the email earlier this is very common for IPMI-type
> > remote access to blade servers and in my experience is implemented
> > using a Java applet and a proprietary protocol terminated at the BMC
> > (which then emulates a virtual CDROM to the server).  There are some
> > HP blade servers on Red Hat's internal Beaker instance where you can
> > play with this.  For qemu we wouldn't need to invent a new protocol
> > when NBD is available and already implemented (albeit not yet on top
> > of WebSockets).
> > 
> > The NBD server must run inside the browser and therefore be either
> > written from scratch in Javascript, or an existing server
> > cross-compiled to WASM (if that is possible - I don't really know).
> 
> Interesting idea about WASM.  I'll see if I can build one of the simple 
> nbd servers that are around.  Not sure how to link it to the JS file IO, 
> however.

After reading a bit about compiling to WebSockets it sounds like you
can cross-compile a C program, but there's no library support at all.
IOW to port an existing server you'd have to implement enough of POSIX
to make it work.  nbdkit has a liberal license deliberately to make it
possible to chop it up and incorporate it into completely forked
codebases (nbdkit is a plot to make NBD more popular).

But since NBD is pretty simple, a fresh Javascript server might be
easier, especially if you stick to only implementing reads.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

