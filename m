Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4911E8989
	for <lists+nbd@lfdr.de>; Fri, 29 May 2020 23:09:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9CF0A204C8; Fri, 29 May 2020 21:09:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 29 21:09:18 2020
Old-Return-Path: <nbd@lists.ewheeler.net>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=4.0 tests=FOURLA,KHOP_HELO_FCRDNS,
	LDOSUBSCRIBER,LDO_WHITELIST autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8FFF9204A0
	for <lists-other-nbd@bendel.debian.org>; Fri, 29 May 2020 21:09:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.624 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, KHOP_HELO_FCRDNS=0.276,
	LDO_WHITELIST=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1VrHg9kNd7cR for <lists-other-nbd@bendel.debian.org>;
	Fri, 29 May 2020 21:09:05 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mail.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	by bendel.debian.org (Postfix) with ESMTP id 594E22049A
	for <nbd@other.debian.org>; Fri, 29 May 2020 21:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.ewheeler.net (Postfix) with ESMTP id E9CB5A0415;
	Fri, 29 May 2020 21:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mail.ewheeler.net ([127.0.0.1])
	by localhost (mail.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dzMYA0b7eKmB; Fri, 29 May 2020 21:08:35 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.ewheeler.net (Postfix) with ESMTPSA id 85FA5A0633;
	Fri, 29 May 2020 21:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ewheeler.net 85FA5A0633
Date: Fri, 29 May 2020 21:08:29 +0000 (UTC)
From: Eric Wheeler <nbd@lists.ewheeler.net>
X-X-Sender: lists@mail.ewheeler.net
To: "Richard W.M. Jones" <rjones@redhat.com>
cc: Eric Blake <eblake@redhat.com>, 
    =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
    Nir Soffer <nsoffer@redhat.com>, libguestfs <libguestfs@redhat.com>, 
    nbd@other.debian.org, QEMU <qemu-devel@nongnu.org>
Subject: Re: [Libguestfs] Provide NBD via Browser over Websockets
In-Reply-To: <20200529141315.GU3888@redhat.com>
Message-ID: <alpine.LRH.2.11.2005292107180.10871@mail.ewheeler.net>
References: <alpine.LRH.2.11.1810131833150.18520@mx.ewheeler.net> <CAMRbyytcufK8-XdFu7LU+UwO_FRoGJO2FhhBHtH9etf3A2htwQ@mail.gmail.com> <alpine.LRH.2.11.2005280014150.13970@mail.ewheeler.net> <20200528090443.GN7304@redhat.com> <alpine.LRH.2.11.2005282147410.13970@mail.ewheeler.net>
 <20200529093744.GS3888@redhat.com> <13571029-5bf4-2dfa-6879-0ad2642afb3f@redhat.com> <20200529135042.GJ2755532@redhat.com> <ff2e7dd1-c8b2-b46c-3c3b-ed88d9ad9689@redhat.com> <20200529141315.GU3888@redhat.com>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="1514185278-310523577-1590786510=:10871"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <unriFomlydF.A.PdD.-nX0eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/890
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/alpine.LRH.2.11.2005292107180.10871@mail.ewheeler.net
Resent-Date: Fri, 29 May 2020 21:09:18 +0000 (UTC)

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1514185278-310523577-1590786510=:10871
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Fri, 29 May 2020, Richard W.M. Jones wrote:
> On Fri, May 29, 2020 at 08:58:06AM -0500, Eric Blake wrote:
> > On 5/29/20 8:50 AM, Daniel P. Berrangé wrote:
> > 
> > >>>(2) You need to persuade qemu's NBD client to read from a WebSocket.
> > >>>I didn't really know anything about WebSockets until today but it
> > >>>seems as if they are a full-duplex protocol layered on top of HTTP [a].
> > >>>Is there a WebSocket proxy that turns WS into plain TCP (a bit like
> > >>>stunnel)?  Google suggests [b].
> > >>>
> > >>>[a] https://en.wikipedia.org/wiki/WebSocket#Protocol_handshake
> > >>>[b] https://github.com/novnc/websockify
> > >>
> > >>qemu already knows how to connect as a client to websockets; Dan Berrange
> > >>knows more about that setup.  I suspect it would not be too difficult to
> > >>teach the qemu NBD client code to use a WebSocket instead of a Unix or TCP
> > >>socket as its data source.
> > >
> > >Actually the inverse. The QIOChannelWebsocket impl is only the server
> > >side of the problem, as used by QEMU's VNC server. We've never implemented
> > >the client side. There is nothing especially stopping us doing that - just
> > >needs someone motivated with time to work on it.
> > 
> > In the meantime, you may still be able to set up something like:
> > 
> > local machine:
> > iso -> NBD server -> Unix socket -> websockify -> WebSocket
> 
> I guess the idea is to have a zero-install solution for the browser.
> As I said in the email earlier this is very common for IPMI-type
> remote access to blade servers and in my experience is implemented
> using a Java applet and a proprietary protocol terminated at the BMC
> (which then emulates a virtual CDROM to the server).  There are some
> HP blade servers on Red Hat's internal Beaker instance where you can
> play with this.  For qemu we wouldn't need to invent a new protocol
> when NBD is available and already implemented (albeit not yet on top
> of WebSockets).
> 
> The NBD server must run inside the browser and therefore be either
> written from scratch in Javascript, or an existing server
> cross-compiled to WASM (if that is possible - I don't really know).

Interesting idea about WASM.  I'll see if I can build one of the simple 
nbd servers that are around.  Not sure how to link it to the JS file IO, 
however.

--
Eric Wheeler


> > remote machine:
> > WebSocket -> websockify -> Unix socket -> qemu NBD client
> > 
> > Adding websocket client support into qemu would reduce the length of
> > the chain slightly (for less data copying) by getting rid of a
> > websockify proxy middleman, but would not necessarily improve
> > performance (it's hard to say where the latency bottlenecks will be
> > in the chain).
> 
> Rich.
> 
> -- 
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> libguestfs lets you edit virtual machines.  Supports shell scripting,
> bindings from many languages.  http://libguestfs.org
> 
> 
--1514185278-310523577-1590786510=:10871--

