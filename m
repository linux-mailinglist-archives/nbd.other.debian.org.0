Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C30D91E79A6
	for <lists+nbd@lfdr.de>; Fri, 29 May 2020 11:45:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 909F520587; Fri, 29 May 2020 09:45:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 29 09:45:20 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AE24B204FC
	for <lists-other-nbd@bendel.debian.org>; Fri, 29 May 2020 09:45:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NSv7LchPebaj for <lists-other-nbd@bendel.debian.org>;
	Fri, 29 May 2020 09:45:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id D116F204DF
	for <nbd@other.debian.org>; Fri, 29 May 2020 09:45:07 +0000 (UTC)
Old-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590745502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Li/3khEQvEAUMDgQVjoA0G8R1wUp6TmL4gj3qc3TkXI=;
	b=cn1GGpYhOWfC9M+2LwlSF8BiezGVIMtzmP0OU6nKQWSu/JTgAkd4JaNTpN//e2g9so4Z+b
	OueGn6McBWaogxI2mfjWmo3SIybN+HGNthHBoylmai2vhYAB8/u15v52MNteIXXYv6ljGk
	tt4KpTKhDVhuA+PMFluqEh4ehYcphxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-9WQEil8sN4WabBxE8xrtOA-1; Fri, 29 May 2020 05:37:49 -0400
X-MC-Unique: 9WQEil8sN4WabBxE8xrtOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3246461;
	Fri, 29 May 2020 09:37:48 +0000 (UTC)
Received: from localhost (ovpn-112-79.ams2.redhat.com [10.36.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8CB27A8CD;
	Fri, 29 May 2020 09:37:45 +0000 (UTC)
Date: Fri, 29 May 2020 10:37:44 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Wheeler <nbd@lists.ewheeler.net>
Cc: Nir Soffer <nsoffer@redhat.com>, Eric Blake <eblake@redhat.com>,
	libguestfs <libguestfs@redhat.com>, nbd@other.debian.org
Subject: Re: [Libguestfs] Provide NBD via Browser over Websockets
Message-ID: <20200529093744.GS3888@redhat.com>
References: <alpine.LRH.2.11.1810131833150.18520@mx.ewheeler.net>
 <CAMRbyytcufK8-XdFu7LU+UwO_FRoGJO2FhhBHtH9etf3A2htwQ@mail.gmail.com>
 <alpine.LRH.2.11.2005280014150.13970@mail.ewheeler.net>
 <20200528090443.GN7304@redhat.com>
 <alpine.LRH.2.11.2005282147410.13970@mail.ewheeler.net>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.2005282147410.13970@mail.ewheeler.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tzqaixEQxtP.A.A0D.wmN0eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/884
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200529093744.GS3888@redhat.com
Resent-Date: Fri, 29 May 2020 09:45:20 +0000 (UTC)

Going back to the original email from 2018:

> It might be neat to attach ISOs to KVM guests via websockets.Â  Basically
> theÂ  browser would be the NBD "server" and an NBD client would run on the
> hypervisor, then use `virsh change-media vm1 hdc --insert /dev/nbd0` could
> use an ISO from my desk to boot from.
> 
> Here's an HTML5 open file example:
> https://stackoverflow.com/questions/3582671/how-to-open-a-local-disk-file-with-javascript
> 
> and the NBD protocol looks simple enough to implement in javascript:
> https://stackoverflow.com/questions/17295140/where-is-the-network-block-device-format-describled

So I think what you mean here is that in a browser you'd open a local
(eg) ISO, and then that ISO could be shared with a remote VM.  The
browser runs a Javascript NBD server.  The remote VM is qemu.  Between
the two is a WebSocket.

I've seen this being done with an HP blade server of some kind and
IIRC the client side used a Java applet.  No idea what the protocol
was but likely something proprietary.  It was nevertheless a useful
feature, eg to boot the server from an install CD that you have
locally.

I guess the problem is two-fold:

(1) You need to write an NBD server in Javascript.  Not especially
difficult, particularly if you avoid any complicated features, and I
guess you only need read support.

(2) You need to persuade qemu's NBD client to read from a WebSocket.
I didn't really know anything about WebSockets until today but it
seems as if they are a full-duplex protocol layered on top of HTTP [a].
Is there a WebSocket proxy that turns WS into plain TCP (a bit like
stunnel)?  Google suggests [b].

[a] https://en.wikipedia.org/wiki/WebSocket#Protocol_handshake
[b] https://github.com/novnc/websockify

...

> When qemu is running headless using a VNC or Spice display we can access 
> the display of https+websockets using things like noVNC---which is out of 
> scope to this converstation---but I'm just saying that such an existing 
> web front-end for the display could be extended to have an "Insert CDROM" 
> button and use the javascript file IO for the user to reference a local 
> file and pass it to qemu over nbd, perhaps via nbdkit.

I'm not sure how nbdkit would be involved, unless it was compiled
to WASM or something like that.

But the plan above sounds feasible, albeit a chunk of work.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

