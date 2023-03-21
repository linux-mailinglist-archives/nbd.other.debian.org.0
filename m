Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A126C3387
	for <lists+nbd@lfdr.de>; Tue, 21 Mar 2023 14:59:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 91147205E3; Tue, 21 Mar 2023 13:59:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 21 13:59:31 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0B32C204AD
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Mar 2023 13:59:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.082 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 1N7q1OIWjDVG for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Mar 2023 13:59:12 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id ED500204A8
	for <nbd@other.debian.org>; Tue, 21 Mar 2023 13:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679407144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g424voK5fQvBZkp82ZC/xQcTlf9Zd9Qmzk9MdruItK8=;
	b=ciOFhJSNtyIgnu8r7Q7XI0pS0QlTauDopza3whjRX47SUa6G2Rzeo6Dq1qIdbsAmIga2zz
	YP04ZujhBE07NWtz16avk4Vf8n9iSRk7M/kf62ovSoYsmt/DyHOPgxrS6SzLPPiS11rKa9
	5WgWgmXQMSDe8p3W6QzdAYwIyP7JnU0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-mhkTREkhMBaZkgUqgtF8kw-1; Tue, 21 Mar 2023 09:59:03 -0400
X-MC-Unique: mhkTREkhMBaZkgUqgtF8kw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF41B100DEB6;
	Tue, 21 Mar 2023 13:59:02 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2D5C40C83A9;
	Tue, 21 Mar 2023 13:59:01 +0000 (UTC)
Date: Tue, 21 Mar 2023 08:59:00 -0500
From: Eric Blake <eblake@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: josef@toxicpanda.com, linux-block@vger.kernel.org, nbd@other.debian.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] block nbd: send handle in network order
Message-ID: <20230321135900.ni4w5ichvjba7s4u@redhat.com>
References: <20230317202749.419094-1-eblake@redhat.com>
 <20230317202749.419094-3-eblake@redhat.com>
 <ZBjqQckL7d5EJPlh@ovpn-8-29.pek2.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBjqQckL7d5EJPlh@ovpn-8-29.pek2.redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UhfsX4ZvX2N.A.y-F.DhbGkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2402
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230321135900.ni4w5ichvjba7s4u@redhat.com
Resent-Date: Tue, 21 Mar 2023 13:59:31 +0000 (UTC)

On Tue, Mar 21, 2023 at 07:20:33AM +0800, Ming Lei wrote:
> On Fri, Mar 17, 2023 at 03:27:46PM -0500, Eric Blake wrote:
> > The NBD spec says the client handle (or cookie) is opaque on the
> > server, and therefore it really doesn't matter what endianness we use;
> > to date, the use of memcpy() between u64 and a char[8] has exposed
> > native endianness when treating the handle as a 64-bit number.
> 
> No, memcpy() works fine for char[8], which doesn't break endianness.

I didn't say memcpy() breaks endianness, I said it preserves it.  By
using memcpy(), you are exposing native endianness over the wire.
Thus, even though a server should not be making any decisions based on
the content of the handle (it is an opaque value handed back to the
client unchanged), the current kernel client code DOES leak through
information about whether the client is big- or little-endian; in
contrast to the NBD protocol saying that ALL data is
network-byte-order.

> 
> > However, since NBD protocol documents that everything else is in
> > network order, and tools like Wireshark will dump even the contents of
> > the handle as seen over the network, it's worth using a consistent
> > ordering regardless of the native endianness.
> > 
> > Plus, using a consistent endianness now allows an upcoming patch to
> > simplify this to directly use integer assignment instead of memcpy().
> 
> It isn't necessary, given ->handle is actually u64, which is handled by
> nbd client only.

No, re-read the whole series.  ->handle is actually char[8].  Later in
the series adds ->cookie as __be64 as an alias to ->handle, precisely
so that we are converting the u64 'handle' in kernel code into a
big-endian value on the wire, regardless of the host type, and making
it impossible for a server to inspect the wire data and learn the
kernel's endianness.

> 
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > 
> > ---
> > v2: new patch
> > ---
> >  drivers/block/nbd.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 592cfa8b765a..8a9487e79f1c 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -560,6 +560,7 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
> >  	unsigned long size = blk_rq_bytes(req);
> >  	struct bio *bio;
> >  	u64 handle;
> > +	__be64 tmp;
> >  	u32 type;
> >  	u32 nbd_cmd_flags = 0;
> >  	int sent = nsock->sent, skip = 0;
> > @@ -606,7 +607,8 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
> >  		request.len = htonl(size);
> >  	}
> >  	handle = nbd_cmd_handle(cmd);
> > -	memcpy(request.handle, &handle, sizeof(handle));
> > +	tmp = cpu_to_be64(handle);
> > +	memcpy(request.handle, &tmp, sizeof(tmp));
> 
> This way copies handle two times, really not fun.

Indeed.  And as mentioned in the commit message, it is temporary; the
second copy goes away later in the series once we can use direct
integer assignment.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

