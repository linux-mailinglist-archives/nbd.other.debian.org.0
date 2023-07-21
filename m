Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A8675C729
	for <lists+nbd@lfdr.de>; Fri, 21 Jul 2023 14:51:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ACABD20569; Fri, 21 Jul 2023 12:51:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jul 21 12:51:25 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SARE_MSGID_LONG45,
	SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F010220554
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Jul 2023 12:51:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.47 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3wfome1h4Doj for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Jul 2023 12:51:05 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id B75A320484
	for <nbd@other.debian.org>; Fri, 21 Jul 2023 12:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689943860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ua2smTJpsucUrqCJ7ObhYovzNc3akdtzrn/uTjspY0c=;
	b=K/s9iOi6kqX3uRgBr4uEkBYtQVs1BouLS9/tmSxwJT43Ivgzf7MTV/pAlVZlx2kkBbYRC3
	cucAAkYMR6tp+BQL5W7kH4mZuQbGW7Z0qeDiPyGMejqC0q+3nBiHzhw9ng4FV/kqWGvfSr
	Mi5duOiJuoJWbJRcTc/TKACfNaAaY+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-qhxctbKWNPeWnhH3QyrbpQ-1; Fri, 21 Jul 2023 08:50:59 -0400
X-MC-Unique: qhxctbKWNPeWnhH3QyrbpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9C148F185D;
	Fri, 21 Jul 2023 12:50:58 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.86])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57A804094DC0;
	Fri, 21 Jul 2023 12:50:58 +0000 (UTC)
Date: Fri, 21 Jul 2023 07:50:56 -0500
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 06/22] states: Break deadlock if
 server goofs on extended replies
Message-ID: <sy4lylmzdmv3aiuf5fobsc36khlrqyoijgi4et3fpygubnzlah@htklkvf4hvjt>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-7-eblake@redhat.com>
 <04cf2539-f262-22e1-5739-41d34c1230f3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <04cf2539-f262-22e1-5739-41d34c1230f3@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RSUCZOsZeU.A.lXC.N9nukB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2573
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/sy4lylmzdmv3aiuf5fobsc36khlrqyoijgi4et3fpygubnzlah@htklkvf4hvjt
Resent-Date: Fri, 21 Jul 2023 12:51:25 +0000 (UTC)

On Thu, Jun 01, 2023 at 03:42:30PM +0200, Laszlo Ersek wrote:
> On 5/25/23 15:00, Eric Blake wrote:
> > One of the benefits of extended replies is that we can do a
> > fixed-length read for the entire header of every server reply, which
> > is fewer syscalls than the split-read approach required by structured
> > replies.
> 
> (Totally tangential comment: recvmsg() could scatter the incoming
> traffic into non-contiguous fields of a non-packed structure. But I
> don't know if TLS has anything similar. The current "linear receive"
> approach is probably the least demanding of the underlying socket
> abstractions. At the same time it requires us to use packed structs,
> and/or multiple syscalls.)
> 
> > But one of the drawbacks of doing a large read is that if
> > the server is non-compliant (not a problem for normal servers, but
> > something I hit rather more than I'd like to admit while developing
> > extended header support in servers),
> 
> Haha, so this is where it's coming from! :) I can totally relate.
> 
> > nbd_pwrite() and friends will
> > deadlock if the server replies with the wrong header.  Add in some
> > code to catch that failure mode and move the state machine to DEAD
> > sooner, to make it easier to diagnose the fault in the server.
> > 
> > Unlike in the case of an unexpected simply reply from a structured
> 
> (1) s/simply/simple/

Yep.

> 
> > server (where we never over-read, and can therefore
> 
> (2) At this point my English parser gets thrown off:
> 
> > commit b31e7bac
> > can merely fail the command with EPROTO and successfully move on to
> > the next server reply),

Fixing the parenthetical as follows:

(where, since commit b31e7bac, we can merely fail the command with
EPROTO and successfully move on to the next server reply, because we
didn't read too many bytes yet)

> 
> resync here:
> 
> > in this case we really do have to move to
> > DEAD: in addition to having already read the 16 or 20 bytes that the
> > server sent in its (short) reply for this command, we may have already
> > read the initial bytes of the server's next reply, but we have no way
> > to push those extra bytes back onto our read stream for parsing on our
> > next pass through the state machine.
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >  generator/states-reply.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git a/generator/states-reply.c b/generator/states-reply.c
> > index 4e9f2dde..d4710d91 100644
> > --- a/generator/states-reply.c
> > +++ b/generator/states-reply.c
> > @@ -109,7 +109,28 @@  REPLY.START:
> >   REPLY.RECV_REPLY:
> >    switch (recv_into_rbuf (h)) {
> >    case -1: SET_NEXT_STATE (%.DEAD); return 0;
> > -  case 1: SET_NEXT_STATE (%.READY); return 0;
> > +  case 1: SET_NEXT_STATE (%.READY);
> > +    /* Special case: if we have a short read, but got at least far
> > +     * enough to decode the magic number, we can check if the server
> > +     * is matching our expectations. This lets us avoid deadlocking if
> > +     * a buggy server sends only 16 bytes of a simple reply, and is
> > +     * waiting for our next command, while we are blocked waiting for
> > +     * the server to send 32 bytes of an extended reply.
> > +     */
> 
> (4) Slight inconsistency between commit message and code comment: the
> former mentions "20 bytes", but the latter doesn't mention "structured
> reply".

Did I miss (3)?  But yes, I can improve this comment.

> 
> > +    if (h->extended_headers &&
> > +        (char *)h->rbuf >= (char *)&h->sbuf.reply.hdr.extended.flags) {
> 
> (.) I wonder if (address-of-magic + size-of magic) might be more
> readable / greppable. Just in case.
> 
> Feel free to ignore.

Actually, I agree that it is nicer (although a bit longer).

> 
> > +      uint32_t magic = be32toh (h->sbuf.reply.hdr.extended.magic);
> > +      if (magic != NBD_EXTENDED_REPLY_MAGIC) {
> > +        SET_NEXT_STATE (%.DEAD); /* We've probably lost synchronization. */
> > +        set_error (0, "invalid or unexpected reply magic 0x%" PRIx32, magic);
> > +#if 0 /* uncomment to see desynchronized data */
> > +        nbd_internal_hexdump (&h->sbuf.reply.hdr.extended.flags,
> > +                              sizeof (h->sbuf.reply.hdr.extended.flags),
> > +                              stderr);
> > +#endif
> > +      }
> > +    }
> > +    return 0;
> 
> (5) This could be factored out to a helper function, to share the
> "invalid:" label logic with the previous patch.
> 
> (6) Commencing a dump from "flags" onward looks questionable. At this
> point, the "flags" field need not to be complete, or even started -- all
> we know is that the "magic" field *before" "flags" is complete.
> 
> I think we should dump "h->sbuf.reply.hdr.simple", like in patch#5.

Yep, I noticed that while addressing your point (4), just before
reading your point (6).  Bug dumping the full hdr.simple is also too
much; really, given the preconditions above, all we can dump is
hdr.magic.  At which point, the hexdump is not providing us any
further information than what the set_error() call already output.
I'm just deleting the #if 0 segment, which in turn eliminates the need
to address point (5), as the two invalid: labels are no longer
identical.

> 
> (.) Side comment (so no bullet number assigned): because we can take
> multiple iterations on RECV_REPLY, we may end up checking the "magic"
> field multiple times. Not very costly, just something to be aware of.

Indeed.  In the common case, short reads are rare, and even when they
do happen, it is even more rare to hit it more than once per packet.
I wonder if nc or similar has a way to force a server's response to be
flushed after every byte, to see the performance impact of maximum
network overhead.

But your observation means you are correctly aware of a larger design
aspect of the state machine: all code handling short reads (case 1 of
recv_into_rbuf) must be re-startable (no messing with h->rbuf, for
example).  Stateful changes can only occur when the read is complete
(case 0) or irretrievably failed (case -1).

> 
> (7) Assume that we have a short read first, but then complete
> REPLY.RECV_REPLY successfully, and move to
> REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY.
...
> 
> *HOWEVER*! :) If we do *not* see some short-but-together-long-enough
> reads first, but see a full read at once, then our "pre-check" in
> RECV_REPLY does not get activated at all! And then all the conditions in
> CHECK_SIMPLE_OR_STRUCTURED_REPLY remain necessary.
> 
> So this is my long-winded way to ask that:
> 
> >    case 0: SET_NEXT_STATE (%CHECK_SIMPLE_OR_STRUCTURED_REPLY);
> >    }
> >    return 0;
> 
> you please consider adding a comment here, saying that, while the short
> read special case *does* short-circuit a number of checks under
> CHECK_SIMPLE_OR_STRUCTURED_REPLY, all the checks in
> CHECK_SIMPLE_OR_STRUCTURED_REPLY remain required if under RECV_REPLY we
> get a full read immediately.

Good idea.  Added for v4.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org

