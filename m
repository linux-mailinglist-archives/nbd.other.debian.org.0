Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A0E15A940
	for <lists+nbd@lfdr.de>; Wed, 12 Feb 2020 13:37:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 433F9203C6; Wed, 12 Feb 2020 12:37:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 12 12:37:11 2020
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	RCVD_IN_DNSWL_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 693C5203C0
	for <lists-other-nbd@bendel.debian.org>; Wed, 12 Feb 2020 12:37:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.201 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id H38hk79hgvWS for <lists-other-nbd@bendel.debian.org>;
	Wed, 12 Feb 2020 12:36:58 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.7
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by bendel.debian.org (Postfix) with ESMTP id A2B47203B5
	for <nbd@other.debian.org>; Wed, 12 Feb 2020 12:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581511012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CVeZHRsTKZC0u825vtqliPy0X+ycHafuEX0u/5yCXWc=;
	b=P/MikSCzGqcoysv9iDm+arA1H8txowAiNRACc6N1g64QCtGP2mPBglXOR1JAB2vPFKxGYQ
	YUBNGt4+jhpy0HfIrfaUONfuDeXEHwTfItI22f8Dd+qp/7LTsqucGlwKOSzPwhMAT5Rnd1
	SZQuMIBYvaCOZ5L8OZJwcA7ucQVzax4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-jSDNouKfOlCe4nxdjm7AsA-1; Wed, 12 Feb 2020 07:36:44 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C17E0800D48;
	Wed, 12 Feb 2020 12:36:42 +0000 (UTC)
Received: from localhost (unknown [10.36.118.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B8E6226FB6;
	Wed, 12 Feb 2020 12:36:38 +0000 (UTC)
Date: Wed, 12 Feb 2020 12:36:37 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Wouter Verhelst <w@uter.be>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	QEMU <qemu-devel@nongnu.org>,
	"qemu-block@nongnu.org" <qemu-block@nongnu.org>,
	"libguestfs@redhat.com" <libguestfs@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Alberto Garcia <berto@igalia.com>
Subject: Re: Cross-project NBD extension proposal: NBD_INFO_INIT_STATE
Message-ID: <20200212123637.GX3888@redhat.com>
References: <a4394fde-f459-dcb5-1698-013e1e24c388@redhat.com>
 <20200210221234.GH3888@redhat.com>
 <cc6e1e2e-d3a9-c498-354b-d382b5623ca0@redhat.com>
 <20200210225255.GJ3888@redhat.com>
 <20200212072729.GA22254@grep.be>
 <278d29cd-bc0d-19f0-c2a4-0191d16a677f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <278d29cd-bc0d-19f0-c2a4-0191d16a677f@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: jSDNouKfOlCe4nxdjm7AsA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <R35-TYUFUtJ.A.JKB.3F_QeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/819
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200212123637.GX3888@redhat.com
Resent-Date: Wed, 12 Feb 2020 12:37:11 +0000 (UTC)


On Wed, Feb 12, 2020 at 06:09:11AM -0600, Eric Blake wrote:
> On 2/12/20 1:27 AM, Wouter Verhelst wrote:
> >Hi,
> >
> >On Mon, Feb 10, 2020 at 10:52:55PM +0000, Richard W.M. Jones wrote:
> >>But anyway ... could a flag indicating that the whole image is sparse
> >>be useful, either as well as NBD_INIT_SPARSE or instead of it?  You
> >>could use it to avoid an initial disk trim, which is something that
> >>mke2fs does:
> >
> >Yeah, I think that could definitely be useful. I honestly can't see a
> >use for NBD_INIT_SPARSE as defined in this proposal; and I don't think
> >it's generally useful to have a feature if we can't think of a use case
> >for it (that creates added complexity for no benefit).
> >
> >If we can find a reasonable use case for NBD_INIT_SPARSE as defined in
> >this proposal, then just add a third bit (NBD_INIT_ALL_SPARSE or
> >something) that says "the whole image is sparse". Otherwise, I think we
> >should redefine NBD_INIT_SPARSE to say that.
>=20
> Okay, in v2, I will start with just two bits, NBD_INIT_SPARSE
> (entire image is sparse, nothing is allocated) and NBD_INIT_ZERO
> (entire image reads as zero), and save any future bits for later
> additions.  Do we think that 16 bits is sufficient for the amount of
> initial information likely to be exposed?

So as I understand the proposal, the 16 bit limit comes about because
we want a round 4 byte reply, 16 bits are used by NBD_INFO_INIT_STATE
and that leaves 16 bits feature bits.  Therefore the only way to go
from there is to have 32 feature bits but an awkward unaligned 6 byte
structure, or 48 feature bits (8 byte structure).

I guess given those constraints we can stick with 16 feature bits, and
if we ever needed more then we'd have to introduce NBD_INFO_INIT_STATE2.

The only thing I can think of which might be useful is a "fully
preallocated" bit which might be used as an indication that writes are
fast and are unlikely to fail with ENOSPC.

> Are we in agreement that
> my addition of an NBD_INFO_ response to NBD_OPT_GO is the best way
> to expose initial state bits?

Seems reasonable to me.

Rich.

--=20
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjon=
es
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW

