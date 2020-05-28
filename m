Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4F1E6FDF
	for <lists+nbd@lfdr.de>; Fri, 29 May 2020 01:01:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 260D82053C; Thu, 28 May 2020 23:01:33 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 28 23:01:33 2020
Old-Return-Path: <nbd@lists.ewheeler.net>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=4.0 tests=FOURLA,KHOP_HELO_FCRDNS,
	LDOSUBSCRIBER,LDO_WHITELIST autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5E422204F4
	for <lists-other-nbd@bendel.debian.org>; Thu, 28 May 2020 23:01:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.624 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, KHOP_HELO_FCRDNS=0.276,
	LDO_WHITELIST=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5iih6GhO97Q4 for <lists-other-nbd@bendel.debian.org>;
	Thu, 28 May 2020 23:01:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mail.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	by bendel.debian.org (Postfix) with ESMTP id BDAA5204E9
	for <nbd@other.debian.org>; Thu, 28 May 2020 23:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.ewheeler.net (Postfix) with ESMTP id CF797A0415;
	Thu, 28 May 2020 23:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mail.ewheeler.net ([127.0.0.1])
	by localhost (mail.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xV-6mNmLjCFt; Thu, 28 May 2020 23:00:44 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.ewheeler.net (Postfix) with ESMTPSA id 969F2A0440;
	Thu, 28 May 2020 23:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ewheeler.net 969F2A0440
Date: Thu, 28 May 2020 23:00:24 +0000 (UTC)
From: Eric Wheeler <nbd@lists.ewheeler.net>
X-X-Sender: lists@mail.ewheeler.net
To: "Richard W.M. Jones" <rjones@redhat.com>
cc: Nir Soffer <nsoffer@redhat.com>, Eric Blake <eblake@redhat.com>, 
    libguestfs <libguestfs@redhat.com>, nbd@other.debian.org
Subject: Re: [Libguestfs] Provide NBD via Browser over Websockets
In-Reply-To: <20200528090443.GN7304@redhat.com>
Message-ID: <alpine.LRH.2.11.2005282147410.13970@mail.ewheeler.net>
References: <alpine.LRH.2.11.1810131833150.18520@mx.ewheeler.net> <CAMRbyytcufK8-XdFu7LU+UwO_FRoGJO2FhhBHtH9etf3A2htwQ@mail.gmail.com> <alpine.LRH.2.11.2005280014150.13970@mail.ewheeler.net> <20200528090443.GN7304@redhat.com>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="1514185278-605175061-1590706839=:13970"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sMOXeLJrcaE.A.leF.NLE0eB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/883
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/alpine.LRH.2.11.2005282147410.13970@mail.ewheeler.net
Resent-Date: Thu, 28 May 2020 23:01:33 +0000 (UTC)

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1514185278-605175061-1590706839=:13970
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Thu, 28 May 2020, Richard W.M. Jones wrote:
> On Thu, May 28, 2020 at 12:24:22AM +0000, Eric Wheeler wrote:
> > On Mon, 15 Oct 2018, Nir Soffer wrote:
> > > On Sat, Oct 13, 2018 at 9:45 PM Eric Wheeler <nbd@lists.ewheeler.net> wrote:
> > >       Hello all,
> > > 
> > >       It might be neat to attach ISOs to KVM guests via websockets.  Basically
> > >       the  browser would be the NBD "server" and an NBD client would run on the
> > >       hypervisor, then use `virsh change-media vm1 hdc --insert /dev/nbd0` could
> > >       use an ISO from my desk to boot from.
> > > 
> > >       Here's an HTML5 open file example:
> > >       https://stackoverflow.com/questions/3582671/how-to-open-a-local-disk-file-with-javascript
> > > 
> > >       and the NBD protocol looks simple enough to implement in javascript:
> > >       https://stackoverflow.com/questions/17295140/where-is-the-network-block-device-format-describled
> > > 
> > >       What do you think? Does anyone have an interest in doing this?
> > > 
> > > 
> > > HTML File API is very limited:
> > > - you cannot access any file except file provided by the user interactively
> > > - no support for sparseness or underlying disk block size
> > > 
> > > So it will be a pretty bad backend for NBD server.
> > > 
> > > What are you trying to do?
> > 
> > Hi Nir and Eric,
> > 
> > I hope you are well!  
> > 
> > (I'm resurecting this old thread, not sure how I missed the replies.)
> > 
> > We are interested in attaching a local ISO to a remote VM over http (maybe 
> > .qcow's, but ISO is the primary interest).
> 
> So this bit is simple, and something we do regularly.  Assuming the
> "remote VM" is using qemu as a hypervisor, then qemu has a curl driver
> integrated so you can mount remote http:// or https:// resources as
> disks on the VM directly.  eg:
> 
>   $ qemu-system-x86_64 -m 2048 -cdrom https://download.fedoraproject.org/pub/fedora/linux/releases/32/Server/x86_64/iso/Fedora-Server-dvd-x86_64-32-1.6.iso
> 
> (A more realistic example would use libvirt, see the https protocol
> in: https://libvirt.org/formatdomain.html#elementsDisks )

Cool feature, I hadn't realized this was an option.

> You can also bounce the connection through nbdkit-curl-plugin which
> gives you a bit more flexibility, eg the ability to transparently
> uncompress the remote ISO.  You would be using the NBD client in qemu
> to connect (eg. over a Unix domain socket) to a local nbdkit, and
> nbdkit's curl plugin to connect to the remote ISO.  More info and a
> worked example in these pages:
> 
>   http://libguestfs.org/nbdkit-curl-plugin.1.html
>   https://rwmj.wordpress.com/2018/11/23/nbdkit-xz-curl/

Looks neat, perhaps we would write a plugin to integrate with a 
webserver (cgi, php, etc) for the JS client instead of implementing the 
whole protocol over websockets.
 
> > This is common for remote KVM (iDRAC/iLO/iKVM/CIMC), so wondering about 
> > an http front-end for qemu to do the same.
> > Combining that with a spice JS client or noVNC for VM console access would 
> > be neat.
> 
> I'm a bit confused by what you mean by "http front-end for qemu".

When qemu is running headless using a VNC or Spice display we can access 
the display of https+websockets using things like noVNC---which is out of 
scope to this converstation---but I'm just saying that such an existing 
web front-end for the display could be extended to have an "Insert CDROM" 
button and use the javascript file IO for the user to reference a local 
file and pass it to qemu over nbd, perhaps via nbdkit.

> > I also like Eric Blake's idea of direct NBD client integration with qemu 
> > instead of using /dev/nbd0.
> 
> You shouldn't need to use a loop device for this scenario, assuming
> I've understood what you want.

True.

-Eric

> Rich.
> 
> -- 
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-p2v converts physical machines to virtual machines.  Boot with a
> live CD or over the network (PXE) and turn machines into KVM guests.
> http://libguestfs.org/virt-v2v
> 
> 
--1514185278-605175061-1590706839=:13970--

