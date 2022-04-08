Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AE74F97E2
	for <lists+nbd@lfdr.de>; Fri,  8 Apr 2022 16:20:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2BFCB204D4; Fri,  8 Apr 2022 14:20:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr  8 14:20:41 2022
Old-Return-Path: <nsoffer@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 54A812044E
	for <lists-other-nbd@bendel.debian.org>; Fri,  8 Apr 2022 14:20:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.789 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DXtpLMea-DLc for <lists-other-nbd@bendel.debian.org>;
	Fri,  8 Apr 2022 14:20:26 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 937702044A
	for <nbd@other.debian.org>; Fri,  8 Apr 2022 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649427621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vHnhOjBTmlpSQZYtM+4Q0GTphQVmtNfsrlRs8eZXGKI=;
	b=LI3/f1yZV3iQ7WJV8HXymUWbI6DbRudCgvC3hmegpJXOUjMYPRJuDrs5owbrunlcIpy7JG
	U3/BJNE5xJmMM0JQ4UchzAZN9uPuoitDISE8I6s+UbtvkmY4SSddtvlfuUuOHCVEv8W7VP
	AHRmFGYmSa4vqcIkCCEGgZHpbVMQh9A=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-wj0sQenVOj2qkmgoEWd9ug-1; Fri, 08 Apr 2022 09:49:17 -0400
X-MC-Unique: wj0sQenVOj2qkmgoEWd9ug-1
Received: by mail-lj1-f198.google.com with SMTP id q129-20020a2e5c87000000b0024b505ca589so567428ljb.10
        for <nbd@other.debian.org>; Fri, 08 Apr 2022 06:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vHnhOjBTmlpSQZYtM+4Q0GTphQVmtNfsrlRs8eZXGKI=;
        b=1AkqQ45uey73dGiBFsTuYGDYHsdBECzeQWS6Pz1EyzwiEI5AYBvkN9iHUYINLxN6EE
         9YLd1fYQEUrs0HMkw+PgerWKT8otxjwicCd6V5iGvY4H8A+ynVMHWzIrJS1rLh2jGS/1
         SkaSpcyRU5Og8dPTZXy5JUUlHaV/Je5fx91HhIK1HCCztYDmVjhwjHOwcFQ+gWzqK7R+
         +em7AG4klJ5EOfEb1aDLoVVDrhiRvCHhWIR0tF4AxEJyu1SHIX9mrQvlFFSPnQA15Sn+
         kcKXG53nVAzn5f3XiLCdA/TUgC+Zdd2e0/S0GBqDtiphlxc3q2cGJgzmRnKkjuwZYUEZ
         u1zQ==
X-Gm-Message-State: AOAM531yWXhnqFOlVpF3l2Zc6yqMgWXnBSny2Xk/GIC2YaH7ddOI5j0t
	HUPrK3WDxpSlQ+vVjvOueJt/FM/A3NDyH1HtQVvAADEe1dt71QeimWJAxgYETBcWodbRG9xN0md
	07atremTzI6USUdEmTcGJ5jhpNVWAzA==
X-Received: by 2002:ac2:5448:0:b0:46b:877e:9c1e with SMTP id d8-20020ac25448000000b0046b877e9c1emr1685102lfn.326.1649425755910;
        Fri, 08 Apr 2022 06:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8A9vdAsQaBOHkVi6lTLf7TMn86vd5kjqbkiEgPaeXJCa7QwxyYNG2DyHGMJbMZkpJKXwz4E+lzTDVU0IUQfs=
X-Received: by 2002:ac2:5448:0:b0:46b:877e:9c1e with SMTP id
 d8-20020ac25448000000b0046b877e9c1emr1685087lfn.326.1649425755593; Fri, 08
 Apr 2022 06:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220407213720.250252-1-eblake@redhat.com> <20220407213720.250252-2-eblake@redhat.com>
 <Yk/jTZcHpW5qWsvg@pc181009.grep.be> <20220408115244.GL8021@redhat.com>
In-Reply-To: <20220408115244.GL8021@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Fri, 8 Apr 2022 16:48:59 +0300
Message-ID: <CAMRbyysweeBoZLm+uNKZZ7QRkHfNNwm4FyGmq+9V7ApLfpQSvQ@mail.gmail.com>
Subject: Re: [Libguestfs] [PATCH 1/2] spec: Recommend cap on
 NBD_REPLY_TYPE_BLOCK_STATUS length
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, v.sementsov-og@mail.ru, Eric Blake <eblake@redhat.com>, 
	libguestfs@redhat.com, qemu-block <qemu-block@nongnu.org>, nbd@other.debian.org
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zqe0_nFaMh.A.QIE.5SEUiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1929
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/CAMRbyysweeBoZLm+uNKZZ7QRkHfNNwm4FyGmq+9V7ApLfpQSvQ@mail.gmail.com
Resent-Date: Fri,  8 Apr 2022 14:20:41 +0000 (UTC)

On Fri, Apr 8, 2022 at 2:52 PM Richard W.M. Jones <rjones@redhat.com> wrote:
>
> On Fri, Apr 08, 2022 at 09:25:01AM +0200, Wouter Verhelst wrote:
> > Hi Eric,
> >
> > On Thu, Apr 07, 2022 at 04:37:19PM -0500, Eric Blake wrote:
> > > The spec was silent on how many extents a server could reply with.
> > > However, both qemu and nbdkit (the two server implementations known to
> > > have implemented the NBD_CMD_BLOCK_STATUS extension) implement a hard
> > > cap, and will truncate the amount of extents in a reply to avoid
> > > sending a client a reply larger than the maximum NBD_CMD_READ response
> > > they are willing to tolerate:
> > >
> > > When qemu first implemented NBD_CMD_BLOCK_STATUS for the
> > > base:allocation context (qemu commit e7b1948d51, Mar 2018), it behaved
> > > as if NBD_CMD_FLAG_REQ_ONE were always passed by the client, and never
> > > responded with more than one extent.  Later, when adding its
> > > qemu:dirty-bitmap:XXX context extension (qemu commit 3d068aff16, Jun
> > > 2018), it added a cap to 128k extents (1M+4 bytes), and that cap was
> > > applied to base:allocation once qemu started sending multiple extents
> > > for that context as well (qemu commit fb7afc797e, Jul 2018).  Qemu
> > > extents are never smaller than 512 bytes (other than an exception at
> > > the end of a file whose size is not aligned to 512), but even so, a
> > > request for just under 4G of block status could produce 8M extents,
> > > resulting in a reply of 64M if it were not capped smaller.
> > >
> > > When nbdkit first implemented NBD_CMD_BLOCK_STATUS (nbdkit 4ca66f70a5,
> > > Mar 2019), it did not impose any restriction on the number of extents
> > > in the reply chunk.  But because it allows extents as small as one
> > > byte, it is easy to write a server that can amplify a client's request
> > > of status over 1M of the image into a reply over 8M in size, and it
> > > was very easy to demonstrate that a hard cap was needed to avoid
> > > crashing clients or otherwise killing the connection (a bad server
> > > impacting the client negatively); unique to nbdkit's situation is the
> > > fact that because it is designed for plugin server implementations,
> > > not capping the length of extent also posed a problem to nbdkit as the
> > > server (a client requesting large block status could cause the server
> > > to run out of memory depending on the plugin providing the server
> > > callbacks).  So nbdkit enforced a bound of 1M extents (8M+4 bytes,
> > > nbdkit commit 6e0dc839ea, Jun 2019).
> > >
> > > Since the limit chosen by these two implementations is different, and
> > > since nbdkit has versions that were not limited, add this as a SHOULD
> > > NOT instead of MUST NOT constraint on servers implementing block
> > > status.  It does not matter that qemu picked a smaller limit that it
> > > truncates to, since we have already documented that the server may
> > > truncate for other reasons (such as it being inefficient to collect
> > > that many extents in the first place).  But documenting the limit now
> > > becomes even more important in the face of a future addition of 64-bit
> > > requests, where a client's request is no longer bounded to 4G and
> > > could thereby produce even more than 8M extents for the corner case
> > > when every 512 bytes is a new extent, if it were not for this
> > > recommendation.
> >
> > It feels backwards to me to make this a restriction on the server side.
> > You're saying there are server implementations that will be inefficient
> > if there are more than 2^20 extents, and therefore no server should send
> > more than those, even if it can do so efficiently.
> >
> > Isn't it up to the server implementation to decide what can be done
> > efficiently?
> >
> > Perhaps we can make the language about possibly reducing length of
> > extens a bit stronger; but I don't think adding explicit limits for a
> > server's own protection is necessary.
>
> I agree, but for a different reason.
>
> I think Eric should add language that servers can consider limiting
> response sizes in order to prevent possible amplification issues
> and/or simply overwhelming the client with work (bad server DoS
> attacks against clients are a thing!), but I don't think it's
> necessarily a "SHOULD" issue.
>
> BTW attached is an nbdkit plugin that creates an NBD server that
> responds with massive numbers of byte-granularity extents, in case
> anyone wants to test how nbdkit and/or clients respond:
>
> $ chmod +x /var/tmp/lots-of-extents.py
> $ /var/tmp/lots-of-extents.py -f
>
> $ nbdinfo --map nbd://localhost | head
>          0           1    3  hole,zero
>          1           1    0  data
>          2           1    3  hole,zero
>          3           1    0  data
>          4           1    3  hole,zero
>          5           1    0  data
>          6           1    3  hole,zero
>          7           1    0  data
>          8           1    3  hole,zero
>          9           1    0  data
> $ nbdinfo --map --totals nbd://localhost
>     524288  50.0%   0 data
>     524288  50.0%   3 hole,zero

This is a malicious server. A good client will drop the connection when
receiving the first 1 byte chunk.

The real issue here is not enforcing or suggesting a limit on the number of
extent the server returns, but enforcing a limit on the minimum size of
a chunk.

Since this is the network *block device* protocol it should not allow chunks
smaller than the device block size, so anything smaller than 512 bytes
should be invalid response from the server.

Even the last chunk should not be smaller than 512 bytes. The fact that you
can serve a file with size that is not aligned to 512 bytes does not mean that
the export size can be unaligned to the logical block size. There are no real
block devices that have such alignment so the protocol should not allow this.
A good server will round the file size down the logical block size to avoid this
issue.

How about letting the client set a minimum size of a chunk? This way we
avoid the issue of limiting the number of chunks. Merging small chunks
is best done on the server side instead of wasting bandwidth and doing
this on the client side.

Nir

