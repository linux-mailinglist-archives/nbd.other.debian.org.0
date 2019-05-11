Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B371A7DA
	for <lists+nbd@lfdr.de>; Sat, 11 May 2019 14:40:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9D2F02075B; Sat, 11 May 2019 12:40:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat May 11 12:40:14 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 034D72072E
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 May 2019 12:40:07 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-12 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0c5hcYUANgqR for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 May 2019 12:40:02 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 231E32061D
	for <nbd@other.debian.org>; Sat, 11 May 2019 12:40:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E049283F42
	for <nbd@other.debian.org>; Sat, 11 May 2019 12:39:58 +0000 (UTC)
Received: from localhost (ovpn-116-243.ams2.redhat.com [10.36.116.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 893ED100E9FF;
	Sat, 11 May 2019 12:39:58 +0000 (UTC)
Date: Sat, 11 May 2019 13:39:57 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Cc: nbd@other.debian.org, Eric Blake <eblake@redhat.com>,
	mkletzan@redhat.com
Subject: Re: Requirements for an NBD client library in userspace
Message-ID: <20190511123957.GO9582@redhat.com>
References: <20190430124626.GA11138@redhat.com>
 <CAMRbyytny=8nC1LevEBwYN9cbuzJwG_HjdN5QQsXR-+ROy-MpA@mail.gmail.com>
 <20190511110356.GN9582@redhat.com>
 <CAMRbyyt+1y+E5=oT6ZS1iRwXG+wUvHh0ZKR+3ANAX1GsYHdPpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRbyyt+1y+E5=oT6ZS1iRwXG+wUvHh0ZKR+3ANAX1GsYHdPpg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Sat, 11 May 2019 12:39:58 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <V07eeU0IH7D.A.2YG.uKs1cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/494
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190511123957.GO9582@redhat.com
Resent-Date: Sat, 11 May 2019 12:40:14 +0000 (UTC)

On Sat, May 11, 2019 at 03:28:28PM +0300, Nir Soffer wrote:
> On Sat, May 11, 2019, 14:03 Richard W.M. Jones <rjones@redhat.com> wrote:
> 
> > On Tue, Apr 30, 2019 at 04:43:03PM +0300, Nir Soffer wrote:
> > > On Tue, Apr 30, 2019, 15:46 Richard W.M. Jones <rjones@redhat.com>
> > wrote:
> > >
> > > > I believe there is no simple NBD client library.  Am I wrong about
> > > > this?  Let's assume I'm not for the sake of the rest of this email ...
> > > >
> > > > We do however have at least 4 places this could be consumed if it
> > existed:
> > > >
> > > >  - fio's proposed NBD engine
> > > >    https://www.spinics.net/lists/fio/msg07831.html
> > > >
> > > >  - nbdkit-nbd-plugin
> > > >    https://github.com/libguestfs/nbdkit/tree/master/plugins/nbd
> > > >
> > > >  - Martin K's forthcoming VMware liberation tool
> > > >
> > > >  - qemu, maybe?
> > > >    https://github.com/qemu/qemu/blob/master/block/nbd-client.c
> > >
> > >
> > > oVirt imageio, replacing pure python client, used to implement nbd-http
> > > proxy
> > >
> > https://github.com/oVirt/ovirt-imageio/blob/master/common/ovirt_imageio_common/nbd.py
> >
> > It looks like imageio is Python 2.  I'm trying to write libnbd
> > bindings for Python now, but TBH supporting Python 2 is turning out to
> > be painful, because there are plenty of Python 3 features it would be
> > nice to use ("b" boolean conversions, proper bytes handling and
> > PyUnicode_FSConverter are three particular features).  Do you really
> > need Python 2?  What is the roadmap for using Python 3 with imageio?
> >
> 
> We plan to drop python 2 for 4.4. I don't that anyone care about python 2
> now.

I wrote some initial, very preliminary bindings, see top commit(s) here:

  https://github.com/rwmjones/libnbd

Simple synchronous calls appear to work.  However they don't work for
asynchronous calls because the idiom of:

  char buf[512];

  conn = nbd_get_connection (nbd, 0);
  hid = nbd_aio_pread (conn, buf, sizeof buf, 0);
  /* ... various calls to poll/wait here ... */
  if (nbd_aio_command_completed (conn, hid)) {
    /* now we can use the data in buf ... */
  }

doesn't translate well into Python and passing buffers in and out of C
code.  That's TBD.

The imageio code goes appear to be doing anything asynch if I'm
understanding the code correctly.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

