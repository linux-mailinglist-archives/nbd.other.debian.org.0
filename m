Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A5A1E7E89
	for <lists+nbd@lfdr.de>; Fri, 29 May 2020 15:21:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 905392059E; Fri, 29 May 2020 13:21:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 29 13:21:41 2020
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 801492058B
	for <lists-other-nbd@bendel.debian.org>; Fri, 29 May 2020 13:21:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.599 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ROgDOmmpRhSm for <lists-other-nbd@bendel.debian.org>;
	Fri, 29 May 2020 13:21:28 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id 6E0AF20404
	for <nbd@other.debian.org>; Fri, 29 May 2020 13:21:28 +0000 (UTC)
Old-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590758483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nDxvtWUahlSn1Jg1Lr+GkBQonp+hssLkMDl4QJWRldU=;
	b=Ou+3BuMFPl8/RnEkgBRvk4t14SU94LPeqrqUpzkIhXmQyuoMibHOs/HBStCxLNcD5jhwU4
	pLf3SxD4eIEb18Iqy33CMYWW+iqCdFs0pJ5dJ8j61n/Pha0u9JgRLFFJttgR6kF8rbjTfo
	zLg3uHoLS0uLdJhpCk+ZPaMfuT9Owzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-u1YcjyUuPHaTi-_vnChT9Q-1; Fri, 29 May 2020 08:50:19 -0400
X-MC-Unique: u1YcjyUuPHaTi-_vnChT9Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1271F464;
	Fri, 29 May 2020 12:50:18 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C141C19D71;
	Fri, 29 May 2020 12:50:14 +0000 (UTC)
Subject: Re: [Libguestfs] Provide NBD via Browser over Websockets
To: "Richard W.M. Jones" <rjones@redhat.com>,
 Eric Wheeler <nbd@lists.ewheeler.net>
Cc: Nir Soffer <nsoffer@redhat.com>, libguestfs <libguestfs@redhat.com>,
 nbd@other.debian.org, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <alpine.LRH.2.11.1810131833150.18520@mx.ewheeler.net>
 <CAMRbyytcufK8-XdFu7LU+UwO_FRoGJO2FhhBHtH9etf3A2htwQ@mail.gmail.com>
 <alpine.LRH.2.11.2005280014150.13970@mail.ewheeler.net>
 <20200528090443.GN7304@redhat.com>
 <alpine.LRH.2.11.2005282147410.13970@mail.ewheeler.net>
 <20200529093744.GS3888@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <13571029-5bf4-2dfa-6879-0ad2642afb3f@redhat.com>
Date: Fri, 29 May 2020 07:50:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200529093744.GS3888@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <32Hg6gdEMoI.A.-JC.lxQ0eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/885
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/13571029-5bf4-2dfa-6879-0ad2642afb3f@redhat.com
Resent-Date: Fri, 29 May 2020 13:21:41 +0000 (UTC)

[adding qemu list]

On 5/29/20 4:37 AM, Richard W.M. Jones wrote:
> Going back to the original email from 2018:
> 
>> It might be neat to attach ISOs to KVM guests via websockets.Ã‚Â  Basically
>> theÃ‚Â  browser would be the NBD "server" and an NBD client would run on the
>> hypervisor, then use `virsh change-media vm1 hdc --insert /dev/nbd0` could
>> use an ISO from my desk to boot from.
>>
>> Here's an HTML5 open file example:
>> https://stackoverflow.com/questions/3582671/how-to-open-a-local-disk-file-with-javascript
>>
>> and the NBD protocol looks simple enough to implement in javascript:
>> https://stackoverflow.com/questions/17295140/where-is-the-network-block-device-format-describled
> 
> So I think what you mean here is that in a browser you'd open a local
> (eg) ISO, and then that ISO could be shared with a remote VM.  The
> browser runs a Javascript NBD server.  The remote VM is qemu.  Between
> the two is a WebSocket.
> 
> I've seen this being done with an HP blade server of some kind and
> IIRC the client side used a Java applet.  No idea what the protocol
> was but likely something proprietary.  It was nevertheless a useful
> feature, eg to boot the server from an install CD that you have
> locally.
> 
> I guess the problem is two-fold:
> 
> (1) You need to write an NBD server in Javascript.  Not especially
> difficult, particularly if you avoid any complicated features, and I
> guess you only need read support.

Or use an existing NBD server over a Unix socket paired to a WebSocket 
proxy that forwards all traffic from the Unix socket over a WebSocket. 
That may be easier than writing the NBD server itself in Javascript.

> 
> (2) You need to persuade qemu's NBD client to read from a WebSocket.
> I didn't really know anything about WebSockets until today but it
> seems as if they are a full-duplex protocol layered on top of HTTP [a].
> Is there a WebSocket proxy that turns WS into plain TCP (a bit like
> stunnel)?  Google suggests [b].
> 
> [a] https://en.wikipedia.org/wiki/WebSocket#Protocol_handshake
> [b] https://github.com/novnc/websockify

qemu already knows how to connect as a client to websockets; Dan 
Berrange knows more about that setup.  I suspect it would not be too 
difficult to teach the qemu NBD client code to use a WebSocket instead 
of a Unix or TCP socket as its data source.

> 
> ...
> 
>> When qemu is running headless using a VNC or Spice display we can access
>> the display of https+websockets using things like noVNC---which is out of
>> scope to this converstation---but I'm just saying that such an existing
>> web front-end for the display could be extended to have an "Insert CDROM"
>> button and use the javascript file IO for the user to reference a local
>> file and pass it to qemu over nbd, perhaps via nbdkit.
> 
> I'm not sure how nbdkit would be involved, unless it was compiled
> to WASM or something like that.
> 
> But the plan above sounds feasible, albeit a chunk of work.
> 
> Rich.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

