Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1F84F9C3B
	for <lists+nbd@lfdr.de>; Fri,  8 Apr 2022 20:05:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 226F820493; Fri,  8 Apr 2022 18:05:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr  8 18:05:28 2022
Old-Return-Path: <rjones@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 75D0F20445
	for <lists-other-nbd@bendel.debian.org>; Fri,  8 Apr 2022 18:05:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.889 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Awuah3ZEGCxX for <lists-other-nbd@bendel.debian.org>;
	Fri,  8 Apr 2022 18:05:14 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id F2EA920486
	for <nbd@other.debian.org>; Fri,  8 Apr 2022 18:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649441108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fDUc3j4gdzLV72AHmrkiFBazx9IheylM+eOC0PTb/Hc=;
	b=EoEjuLvQq4VzeHinDBEsnaBox7jLz4Y7OvWe8yT+S14FCTRRegOogrnax1s7sbwKupuhSS
	Vcs/pTQKt+RfrSxODLqt0Rdmhzri1vM/hs86GZxqMhM6DQu3NcBAgAXH2Z07w2/6Ny5Pjg
	rgFBYVLAmBQ0rwbfWs4JfnZTrrzVFZs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-MRZorcRvMN-9-e7plM1kDg-1; Fri, 08 Apr 2022 14:05:03 -0400
X-MC-Unique: MRZorcRvMN-9-e7plM1kDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64D711C12DE8;
	Fri,  8 Apr 2022 18:05:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0183E1415101;
	Fri,  8 Apr 2022 18:05:02 +0000 (UTC)
Date: Fri, 8 Apr 2022 19:05:02 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Nir Soffer <nsoffer@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, Wouter Verhelst <w@uter.be>,
	v.sementsov-og@mail.ru, libguestfs@redhat.com,
	qemu-block <qemu-block@nongnu.org>, nbd@other.debian.org
Subject: Re: [Libguestfs] [PATCH 1/2] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
Message-ID: <20220408180502.GE1127@redhat.com>
References: <20220407213720.250252-1-eblake@redhat.com>
 <20220407213720.250252-2-eblake@redhat.com>
 <Yk/jTZcHpW5qWsvg@pc181009.grep.be>
 <20220408115244.GL8021@redhat.com>
 <CAMRbyysweeBoZLm+uNKZZ7QRkHfNNwm4FyGmq+9V7ApLfpQSvQ@mail.gmail.com>
 <20220408154648.i7fxfgq5ep3uz44h@redhat.com>
 <CAMRbyyt_1rxTyzSpewTozJUoNJtsaAZZfxCi1rhipYD9Cowe+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRbyyt_1rxTyzSpewTozJUoNJtsaAZZfxCi1rhipYD9Cowe+g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gb-3twfhLKE.A.orE.olHUiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1932
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220408180502.GE1127@redhat.com
Resent-Date: Fri,  8 Apr 2022 18:05:28 +0000 (UTC)

On Fri, Apr 08, 2022 at 08:45:56PM +0300, Nir Soffer wrote:
> On Fri, Apr 8, 2022 at 6:47 PM Eric Blake <eblake@redhat.com> wrote:
> >
> > On Fri, Apr 08, 2022 at 04:48:59PM +0300, Nir Soffer wrote:
> ...
> > > > BTW attached is an nbdkit plugin that creates an NBD server that
> > > > responds with massive numbers of byte-granularity extents, in case
> > > > anyone wants to test how nbdkit and/or clients respond:
> > > >
> > > > $ chmod +x /var/tmp/lots-of-extents.py
> > > > $ /var/tmp/lots-of-extents.py -f
> > > >
> > > > $ nbdinfo --map nbd://localhost | head
> > > >          0           1    3  hole,zero
> > > >          1           1    0  data
> > > >          2           1    3  hole,zero
> > > >          3           1    0  data
> > > >          4           1    3  hole,zero
> > > >          5           1    0  data
> > > >          6           1    3  hole,zero
> > > >          7           1    0  data
> > > >          8           1    3  hole,zero
> > > >          9           1    0  data
> > > > $ nbdinfo --map --totals nbd://localhost
> > > >     524288  50.0%   0 data
> > > >     524288  50.0%   3 hole,zero
> > >
> > > This is a malicious server. A good client will drop the connection when
> > > receiving the first 1 byte chunk.
> >
> > Depends on the server.  Most servers don't serve 1-byte extents, and
> > the NBD spec even recommends that extents be at least 512 bytes in
> > size, and requires that extents be a multiple of any minimum block
> > size if one was advertised by the server.
> >
> > But even though most servers don't have 1-byte extents does not mean
> > that the NBD protocol must forbid them.
> 
> Forbidding this simplifies clients without limiting real world use cases.

I'm not even sure this is true.  Clients are quite free to only make
requests on 512 byte block boundaries if they want, and refuse to deal
with servers which offer non-aligned disk sizes or extents.

If clients are doing this and still have problems they ought to be
fixed, although I don't know what those would be.

> What is a reason to allow this?

Because you don't always want to serve things which are exactly disk
images, or which make assumptions related to modern PCs (256 byte
sectors were used into the 90s).

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

