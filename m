Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A47F81AB9A
	for <lists+nbd@lfdr.de>; Sun, 12 May 2019 12:07:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7E82D2059F; Sun, 12 May 2019 10:07:51 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May 12 10:07:51 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EA3472059A
	for <lists-other-nbd@bendel.debian.org>; Sun, 12 May 2019 10:07:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ia7VjDhYwdMs for <lists-other-nbd@bendel.debian.org>;
	Sun, 12 May 2019 10:07:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 21F662040B
	for <nbd@other.debian.org>; Sun, 12 May 2019 10:07:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2481A81F1B
	for <nbd@other.debian.org>; Sun, 12 May 2019 10:07:35 +0000 (UTC)
Received: from localhost (ovpn-116-243.ams2.redhat.com [10.36.116.243])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B735160148;
	Sun, 12 May 2019 10:07:34 +0000 (UTC)
Date: Sun, 12 May 2019 11:07:33 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Cc: nbd@other.debian.org, Eric Blake <eblake@redhat.com>,
	Martin Kletzander <mkletzan@redhat.com>
Subject: Re: Requirements for an NBD client library in userspace
Message-ID: <20190512100733.GP9582@redhat.com>
References: <20190430124626.GA11138@redhat.com>
 <CAMRbyytny=8nC1LevEBwYN9cbuzJwG_HjdN5QQsXR-+ROy-MpA@mail.gmail.com>
 <20190511110356.GN9582@redhat.com>
 <CAMRbyyt+1y+E5=oT6ZS1iRwXG+wUvHh0ZKR+3ANAX1GsYHdPpg@mail.gmail.com>
 <20190511123957.GO9582@redhat.com>
 <CAMRbyyurc0wF0=HOicVVEhLte7Oy=oHDGnxHOQH5afN=CVO6+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRbyyurc0wF0=HOicVVEhLte7Oy=oHDGnxHOQH5afN=CVO6+A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Sun, 12 May 2019 10:07:35 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <m9iiquJqumG.A.o1.3B_1cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/497
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190512100733.GP9582@redhat.com
Resent-Date: Sun, 12 May 2019 10:07:51 +0000 (UTC)

On Sat, May 11, 2019 at 06:48:15PM +0300, Nir Soffer wrote:
> On Sat, May 11, 2019, 15:39 Richard W.M. Jones <rjones@redhat.com> wrote:
> 
> > On Sat, May 11, 2019 at 03:28:28PM +0300, Nir Soffer wrote:
> > > On Sat, May 11, 2019, 14:03 Richard W.M. Jones <rjones@redhat.com>
> > wrote:
> > >
> > > > On Tue, Apr 30, 2019 at 04:43:03PM +0300, Nir Soffer wrote:
> > > > > On Tue, Apr 30, 2019, 15:46 Richard W.M. Jones <rjones@redhat.com>
> > > > wrote:
> > > > >
> > > > > > I believe there is no simple NBD client library.  Am I wrong about
> > > > > > this?  Let's assume I'm not for the sake of the rest of this email
> > ...
> > > > > >
> > > > > > We do however have at least 4 places this could be consumed if it
> > > > existed:
> > > > > >
> > > > > >  - fio's proposed NBD engine
> > > > > >    https://www.spinics.net/lists/fio/msg07831.html
> > > > > >
> > > > > >  - nbdkit-nbd-plugin
> > > > > >    https://github.com/libguestfs/nbdkit/tree/master/plugins/nbd
> > > > > >
> > > > > >  - Martin K's forthcoming VMware liberation tool
> > > > > >
> > > > > >  - qemu, maybe?
> > > > > >    https://github.com/qemu/qemu/blob/master/block/nbd-client.c
> > > > >
> > > > >
> > > > > oVirt imageio, replacing pure python client, used to implement
> > nbd-http
> > > > > proxy
> > > > >
> > > >
> > https://github.com/oVirt/ovirt-imageio/blob/master/common/ovirt_imageio_common/nbd.py
> > > >
> > > > It looks like imageio is Python 2.  I'm trying to write libnbd
> > > > bindings for Python now, but TBH supporting Python 2 is turning out to
> > > > be painful, because there are plenty of Python 3 features it would be
> > > > nice to use ("b" boolean conversions, proper bytes handling and
> > > > PyUnicode_FSConverter are three particular features).  Do you really
> > > > need Python 2?  What is the roadmap for using Python 3 with imageio?
> > > >
> > >
> > > We plan to drop python 2 for 4.4. I don't that anyone care about python 2
> > > now.
> >
> > I wrote some initial, very preliminary bindings, see top commit(s) here:
> >
> >   https://github.com/rwmjones/libnbd
> >
> > Simple synchronous calls appear to work.  However they don't work for
> > asynchronous calls because the idiom of:
> >
> >   char buf[512];
> 
> 
> >   conn = nbd_get_connection (nbd, 0);
> >   hid = nbd_aio_pread (conn, buf, sizeof buf, 0);
> >   /* ... various calls to poll/wait here ... */
> >   if (nbd_aio_command_completed (conn, hid)) {
> >     /* now we can use the data in buf ... */
> >   }
> >
> > doesn't translate well into Python and passing buffers in and out of C
> > code.  That's TBD.
> >
> 
> buf can come from the python layer, using the buffer protocol.
> 
>     Py_buffer b;
> 
>     if (!PyArg_ParseTuple(args, "s*", &b))
>         return NULL;
> 
>     nbd_pread(h, &b.buf, b.len, offset);
> 
>     PyBuffer_Release(&b);
> 
> The argument on the python side can be bytearray(), mmap(), or memoryview().
> 
> If you want to provide the simplest interface returning bytes:
> 
>    pread(offset, length) -> bytes

This is how the synchronous version works already.  The problem is
binding the AIO version where the caller must pass in a buf pointer
that persists while the command is being run across multiple API
calls.

But if imageio doesn't need AIO then it's not urgent to address this.

> You can add a version receiving a buffer:
> 
>     pread_into(offset, buf) -> n
> 
> Like socket.recv(), socket.recv_into().
> 
> In imageio nbd client we implement read() and readinto().
> 
> Adding readinfo() to imageio show 12% improvement, see:
> https://github.com/oVirt/ovirt-imageio/commit/dbc3463349128357030903addb3f5d1ad464f30b
> 
> Buffer size is also important, another reason to let the client provide the
> buffer. See:
> https://github.com/oVirt/ovirt-imageio/commit/d9ad5ea75013598074e07587c6902767fcbcb4a2
> 
> 
> > The imageio code goes appear to be doing anything asynch if I'm
> > understanding the code correctly.
> >
> 
> imageio is using only synchronous code. I'm not sure how are we going to map
> http to nbd using async api.
> 
> It will be interesting to compare libnbd with imageio pure python nbd
> client.
> We can use imageio example nbd-client:
> https://github.com/oVirt/ovirt-imageio/blob/91609bf5b56e1e9a85bf1edae4b916659514c7fd/examples/nbd-client#L72

libnbd can't do structured replies or read allocation status at the
moment.  Also TBD.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

