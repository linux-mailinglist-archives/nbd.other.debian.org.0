Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDE64F9BF5
	for <lists+nbd@lfdr.de>; Fri,  8 Apr 2022 19:46:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 60719204B2; Fri,  8 Apr 2022 17:46:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr  8 17:46:34 2022
Old-Return-Path: <nsoffer@redhat.com>
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
	by bendel.debian.org (Postfix) with ESMTP id 2C3F720435
	for <lists-other-nbd@bendel.debian.org>; Fri,  8 Apr 2022 17:46:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.889 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Ph8j5WCK6N2O for <lists-other-nbd@bendel.debian.org>;
	Fri,  8 Apr 2022 17:46:21 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id EE4C4202E2
	for <nbd@other.debian.org>; Fri,  8 Apr 2022 17:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649439975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aJXedSXMl/S9lkQh7+mWggURQj8qMxio4IvtsQ4xYc0=;
	b=VfgoCbzdQ+LlwPhkOn+2E5tbDs+S2PyYkyh03l651Rne4/nH9Hq0wGb8xv/gb8LJsvDmbM
	grdR0HNbXaC5jYWQzagoIEnzWLyZjb//jjREtnMHu/U2qUuPqXbq2FITEhuSj0WEKAdVrV
	DjbujEuza4G+M6e4qAJeqE0yoPkZF0g=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-SiHg4J2_NkaNtgMBEqUk3g-1; Fri, 08 Apr 2022 13:46:14 -0400
X-MC-Unique: SiHg4J2_NkaNtgMBEqUk3g-1
Received: by mail-lf1-f69.google.com with SMTP id j12-20020a056512398c00b0044a8067917eso3300736lfu.2
        for <nbd@other.debian.org>; Fri, 08 Apr 2022 10:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJXedSXMl/S9lkQh7+mWggURQj8qMxio4IvtsQ4xYc0=;
        b=5WTz06YY7W78AOoq83gCUah5fg0nxRZYTY9qcNl4Kc4zz904cGNvhtz+tDDyU1X6Kd
         CYynL94emjqyv/qW5l4picusSSQ7mUhxF7j0Ng90TMY7Y5cO+8fkktLzbRilRrvZADva
         WU+P+cwQl6MwWnKJEGXhLeNXaGAYSBcUmWRbwO3iycy3KnSiSrs/7fl7y0qh5C7Tj0Sv
         8W4O7efx7s6XxgMPUT3X5Cg2jfyc+eJXSFh/M1qmRSnlk82akRvPZKv0h6POG1YWllEs
         EyfUxuAOG5Vq6TdsO8dSyPzMje0GJfTAFM84sZwEWS/D2/cq1NrbP+Ccip46PfbzhVta
         Aldg==
X-Gm-Message-State: AOAM530F9lZusLQPb9AWYIHkrmVeuqLy01l7ce78DNbp3kLXuOPlkUlP
	ARfh3qWyn4PD9UtwzbssP0UXqN98UVNzYONXrcCHVycqE8Vtznjgm2Xx9OTSks7tzuY3pAOMiTB
	1UPYqHUEGlP67XJO0heY5VEWGgCz3oQ==
X-Received: by 2002:a05:651c:199f:b0:24b:4aec:ae0d with SMTP id bx31-20020a05651c199f00b0024b4aecae0dmr4150491ljb.249.1649439972876;
        Fri, 08 Apr 2022 10:46:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgNrYiWyxApHl2bwOA3XpHqt+jPzSAAbQE+NY5UGUF0dem2HCs7Xzxy5kDROo9Pj7Nu4bjCB/3lpqJ/dndpzk=
X-Received: by 2002:a05:651c:199f:b0:24b:4aec:ae0d with SMTP id
 bx31-20020a05651c199f00b0024b4aecae0dmr4150473ljb.249.1649439972573; Fri, 08
 Apr 2022 10:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220407213720.250252-1-eblake@redhat.com> <20220407213720.250252-2-eblake@redhat.com>
 <Yk/jTZcHpW5qWsvg@pc181009.grep.be> <20220408115244.GL8021@redhat.com>
 <CAMRbyysweeBoZLm+uNKZZ7QRkHfNNwm4FyGmq+9V7ApLfpQSvQ@mail.gmail.com> <20220408154648.i7fxfgq5ep3uz44h@redhat.com>
In-Reply-To: <20220408154648.i7fxfgq5ep3uz44h@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Fri, 8 Apr 2022 20:45:56 +0300
Message-ID: <CAMRbyyt_1rxTyzSpewTozJUoNJtsaAZZfxCi1rhipYD9Cowe+g@mail.gmail.com>
Subject: Re: [Libguestfs] [PATCH 1/2] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
To: Eric Blake <eblake@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, Wouter Verhelst <w@uter.be>, v.sementsov-og@mail.ru, 
	libguestfs@redhat.com, qemu-block <qemu-block@nongnu.org>, nbd@other.debian.org
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <396IOSNMIiL.A.9qB.6THUiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1931
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyyt_1rxTyzSpewTozJUoNJtsaAZZfxCi1rhipYD9Cowe+g@mail.gmail.com
Resent-Date: Fri,  8 Apr 2022 17:46:34 +0000 (UTC)

On Fri, Apr 8, 2022 at 6:47 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Fri, Apr 08, 2022 at 04:48:59PM +0300, Nir Soffer wrote:
...
> > > BTW attached is an nbdkit plugin that creates an NBD server that
> > > responds with massive numbers of byte-granularity extents, in case
> > > anyone wants to test how nbdkit and/or clients respond:
> > >
> > > $ chmod +x /var/tmp/lots-of-extents.py
> > > $ /var/tmp/lots-of-extents.py -f
> > >
> > > $ nbdinfo --map nbd://localhost | head
> > >          0           1    3  hole,zero
> > >          1           1    0  data
> > >          2           1    3  hole,zero
> > >          3           1    0  data
> > >          4           1    3  hole,zero
> > >          5           1    0  data
> > >          6           1    3  hole,zero
> > >          7           1    0  data
> > >          8           1    3  hole,zero
> > >          9           1    0  data
> > > $ nbdinfo --map --totals nbd://localhost
> > >     524288  50.0%   0 data
> > >     524288  50.0%   3 hole,zero
> >
> > This is a malicious server. A good client will drop the connection when
> > receiving the first 1 byte chunk.
>
> Depends on the server.  Most servers don't serve 1-byte extents, and
> the NBD spec even recommends that extents be at least 512 bytes in
> size, and requires that extents be a multiple of any minimum block
> size if one was advertised by the server.
>
> But even though most servers don't have 1-byte extents does not mean
> that the NBD protocol must forbid them.

Forbidding this simplifies clients without limiting real world use cases.

What is a reason to allow this?

> > The real issue here is not enforcing or suggesting a limit on the number of
> > extent the server returns, but enforcing a limit on the minimum size of
> > a chunk.
> >
> > Since this is the network *block device* protocol it should not allow chunks
> > smaller than the device block size, so anything smaller than 512 bytes
> > should be invalid response from the server.
>
> No, not an invalid response, but merely a discouraged one - and that
> text is already present in the wording of NBD_CMD_BLOCK_STATUS.

My suggestion is to make it an invalid response, because there are no block
devices that can return such a response.

> > Even the last chunk should not be smaller than 512 bytes. The fact that you
> > can serve a file with size that is not aligned to 512 bytes does not mean that
> > the export size can be unaligned to the logical block size. There are no real
> > block devices that have such alignment so the protocol should not allow this.
> > A good server will round the file size down the logical block size to avoid this
> > issue.
> >
> > How about letting the client set a minimum size of a chunk? This way we
> > avoid the issue of limiting the number of chunks. Merging small chunks
> > is best done on the server side instead of wasting bandwidth and doing
> > this on the client side.
>
> The client can't set the minimum block size, but the server can
> certainly advertise one, and must obey that advertisement.  Or are you
> asking for a new extension where the client mandates what the minimum
> granularity must be from the server in responses to NBD_CMD_READ and
> NBD_CMD_BLOCK_STATUS, when the client wants a larger granularity than
> what the server advertises?  That's a different extension than this
> patch, but may be worth considering.

Yes, this should really be discussed in another thread.

Nir

