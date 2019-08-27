Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B419E78B
	for <lists+nbd@lfdr.de>; Tue, 27 Aug 2019 14:15:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C4232204A4; Tue, 27 Aug 2019 12:15:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug 27 12:15:06 2019
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6221820468
	for <lists-other-nbd@bendel.debian.org>; Tue, 27 Aug 2019 12:14:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-11.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tQbHdIYX-lPQ for <lists-other-nbd@bendel.debian.org>;
	Tue, 27 Aug 2019 12:14:55 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B2753203D4
	for <nbd@other.debian.org>; Tue, 27 Aug 2019 12:14:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6A3C2F366C;
	Tue, 27 Aug 2019 12:14:50 +0000 (UTC)
Received: from localhost (ovpn-116-117.ams2.redhat.com [10.36.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86B381001B11;
	Tue, 27 Aug 2019 12:14:50 +0000 (UTC)
Date: Tue, 27 Aug 2019 13:14:49 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>,
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>,
	nbd@other.debian.org, libguestfs@redhat.com
Subject: Re: [Libguestfs] cross-project patches: Add NBD Fast Zero support
Message-ID: <20190827121449.GX7304@redhat.com>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Tue, 27 Aug 2019 12:14:50 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Lol-wropnFD.A.buD.K7RZdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/652
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190827121449.GX7304@redhat.com
Resent-Date: Tue, 27 Aug 2019 12:15:06 +0000 (UTC)

On Fri, Aug 23, 2019 at 09:30:36AM -0500, Eric Blake wrote:
> I've run several tests to demonstrate why this is useful, as well as
> prove that because I have multiple interoperable projects, it is worth
> including in the NBD standard.  The original proposal was here:
> https://lists.debian.org/nbd/2019/03/msg00004.html
> where I stated:
> 
> > I will not push this without both:
> > - a positive review (for example, we may decide that burning another
> > NBD_FLAG_* is undesirable, and that we should instead have some sort
> > of NBD_OPT_ handshake for determining when the server supports
> > NBD_CMF_FLAG_FAST_ZERO)
> > - a reference client and server implementation (probably both via qemu,
> > since it was qemu that raised the problem in the first place)

Is the plan to wait until NBD_CMF_FLAG_FAST_ZERO gets into the NBD
protocol doc before doing the rest?  Also I would like to release both
libnbd 1.0 and nbdkit 1.14 before we introduce any large new features.
Both should be released this week, in fact maybe even today or
tomorrow.

[...]
> First, I had to create a scenario where falling back to writes is
> noticeably slower than performing a zero operation, and where
> pre-zeroing also shows an effect.  My choice: let's test 'qemu-img
> convert' on an image that is half-sparse (every other megabyte is a
> hole) to an in-memory nbd destination.  Then I use a series of nbdkit
> filters to force the destination to behave in various manners:
>  log logfile=>(sed ...|uniq -c) (track how many normal/fast zero
> requests the client makes)
>  nozero $params (fine-tune how zero requests behave - the parameters
> zeromode and fastzeromode are the real drivers of my various tests)
>  blocksize maxdata=256k (allows large zero requests, but forces large
> writes into smaller chunks, to magnify the effects of write delays and
> allow testing to provide obvious results with a smaller image)
>  delay delay-write=20ms delay-zero=5ms (also to magnify the effects on a
> smaller image, with writes penalized more than zeroing)
>  stats statsfile=/dev/stderr (to track overall time and a decent summary
> of how much I/O occurred).
>  noextents (forces the entire image to report that it is allocated,
> which eliminates any testing variability based on whether qemu-img uses
> that to bypass a zeroing operation [1])

I can't help thinking that a sh plugin might have been simpler ...

> I hope you enjoyed reading this far, and agree with my interpretation of
> the numbers about why this feature is useful!

Yes it seems reasonable.

The only thought I had is whether the qemu block layer does or should
combine requests in flight so that a write-zero (offset) followed by a
write-data (same offset) would erase the earlier request.  In some
circumstances that might provide a performance improvement without
needing any changes to protocols.

> - NBD should have a way to advertise (probably via NBD_INFO_ during
> NBD_OPT_GO) if the initial image is known to begin life with all zeroes
> (if that is the case, qemu-img can skip the extents calls and
> pre-zeroing pass altogether)

Yes, I really think we should do this one as well.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

