Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D328A1E5B6B
	for <lists+nbd@lfdr.de>; Thu, 28 May 2020 11:06:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A39B92049D; Thu, 28 May 2020 09:06:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 28 09:06:35 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E6F272048A
	for <lists-other-nbd@bendel.debian.org>; Thu, 28 May 2020 09:06:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.099 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Gy1VMuuejnzU for <lists-other-nbd@bendel.debian.org>;
	Thu, 28 May 2020 09:06:24 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by bendel.debian.org (Postfix) with ESMTP id B0D3720493
	for <nbd@other.debian.org>; Thu, 28 May 2020 09:06:24 +0000 (UTC)
Old-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590656779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kOoUF2EsyguHgvMWDA1TqiRjKwZKG0rzehjc7qnxGs8=;
	b=AvHVQSQ1kDLre/py71571nJEHDwr3UPHkTrTBpsJ3+8IjktEyTe+CIARpXKuKkX27Sllk0
	xpBqiSX6QBiiYi0JivGbh6NncNpIKLn0RfEPcfP/5Z3GyMYhzWvekl8DTZzeBGd+2YtBMs
	U+XfjCQVTrI7H1xaJWpzBenbPVI53Rs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-16bN8yGZNhm5jrVSrCZNRA-1; Thu, 28 May 2020 05:04:48 -0400
X-MC-Unique: 16bN8yGZNhm5jrVSrCZNRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDC3E100A8F8;
	Thu, 28 May 2020 09:04:47 +0000 (UTC)
Received: from localhost (ovpn-112-79.ams2.redhat.com [10.36.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EEEF7C081;
	Thu, 28 May 2020 09:04:44 +0000 (UTC)
Date: Thu, 28 May 2020 10:04:43 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Wheeler <nbd@lists.ewheeler.net>
Cc: Nir Soffer <nsoffer@redhat.com>, Eric Blake <eblake@redhat.com>,
	libguestfs <libguestfs@redhat.com>, nbd@other.debian.org
Subject: Re: [Libguestfs] Provide NBD via Browser over Websockets
Message-ID: <20200528090443.GN7304@redhat.com>
References: <alpine.LRH.2.11.1810131833150.18520@mx.ewheeler.net>
 <CAMRbyytcufK8-XdFu7LU+UwO_FRoGJO2FhhBHtH9etf3A2htwQ@mail.gmail.com>
 <alpine.LRH.2.11.2005280014150.13970@mail.ewheeler.net>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.2005280014150.13970@mail.ewheeler.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DZkLe61TUBG.A.bfC.b83zeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/882
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200528090443.GN7304@redhat.com
Resent-Date: Thu, 28 May 2020 09:06:35 +0000 (UTC)

On Thu, May 28, 2020 at 12:24:22AM +0000, Eric Wheeler wrote:
> On Mon, 15 Oct 2018, Nir Soffer wrote:
> > On Sat, Oct 13, 2018 at 9:45 PM Eric Wheeler <nbd@lists.ewheeler.net> wrote:
> >       Hello all,
> > 
> >       It might be neat to attach ISOs to KVM guests via websockets.  Basically
> >       the  browser would be the NBD "server" and an NBD client would run on the
> >       hypervisor, then use `virsh change-media vm1 hdc --insert /dev/nbd0` could
> >       use an ISO from my desk to boot from.
> > 
> >       Here's an HTML5 open file example:
> >       https://stackoverflow.com/questions/3582671/how-to-open-a-local-disk-file-with-javascript
> > 
> >       and the NBD protocol looks simple enough to implement in javascript:
> >       https://stackoverflow.com/questions/17295140/where-is-the-network-block-device-format-describled
> > 
> >       What do you think? Does anyone have an interest in doing this?
> > 
> > 
> > HTML File API is very limited:
> > - you cannot access any file except file provided by the user interactively
> > - no support for sparseness or underlying disk block size
> > 
> > So it will be a pretty bad backend for NBD server.
> > 
> > What are you trying to do?
> 
> Hi Nir and Eric,
> 
> I hope you are well!  
> 
> (I'm resurecting this old thread, not sure how I missed the replies.)
> 
> We are interested in attaching a local ISO to a remote VM over http (maybe 
> .qcow's, but ISO is the primary interest).

So this bit is simple, and something we do regularly.  Assuming the
"remote VM" is using qemu as a hypervisor, then qemu has a curl driver
integrated so you can mount remote http:// or https:// resources as
disks on the VM directly.  eg:

  $ qemu-system-x86_64 -m 2048 -cdrom https://download.fedoraproject.org/pub/fedora/linux/releases/32/Server/x86_64/iso/Fedora-Server-dvd-x86_64-32-1.6.iso

(A more realistic example would use libvirt, see the https protocol
in: https://libvirt.org/formatdomain.html#elementsDisks )

You can also bounce the connection through nbdkit-curl-plugin which
gives you a bit more flexibility, eg the ability to transparently
uncompress the remote ISO.  You would be using the NBD client in qemu
to connect (eg. over a Unix domain socket) to a local nbdkit, and
nbdkit's curl plugin to connect to the remote ISO.  More info and a
worked example in these pages:

  http://libguestfs.org/nbdkit-curl-plugin.1.html
  https://rwmj.wordpress.com/2018/11/23/nbdkit-xz-curl/

> This is common for remote KVM (iDRAC/iLO/iKVM/CIMC), so wondering about 
> an http front-end for qemu to do the same.

I'm a bit confused by what you mean by "http front-end for qemu".

> Combining that with a spice JS client or noVNC for VM console access would 
> be neat.

These are separate issues.  qemu has a VNC or SPICE client built in
for the console.

> I also like Eric Blake's idea of direct NBD client integration with qemu 
> instead of using /dev/nbd0.

You shouldn't need to use a loop device for this scenario, assuming
I've understood what you want.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

