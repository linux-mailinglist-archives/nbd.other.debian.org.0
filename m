Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 033A1719EF9
	for <lists+nbd@lfdr.de>; Thu,  1 Jun 2023 16:00:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AD90020AE2; Thu,  1 Jun 2023 14:00:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  1 14:00:12 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0F2AE20AD9
	for <lists-other-nbd@bendel.debian.org>; Thu,  1 Jun 2023 13:42:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PCTgATqYxyys for <lists-other-nbd@bendel.debian.org>;
	Thu,  1 Jun 2023 13:42:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id DE79C20ACA
	for <nbd@other.debian.org>; Thu,  1 Jun 2023 13:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685626954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3l0fKMbl4SVAPM+blF3cARUNbv01YDLSpXS19jf2BeM=;
	b=V/ihcMoVyAWUWyVm6LV+0gO+BeRq1iNX3Z2s71oKkpuCoXfe2xFpUiJfSBDNOzwfHeqkCb
	tZMV2ek4pN6ahSMWdoV+2rnFR9jLvdtE3p2UOSRFSZ3okj74BuMXqJwE4QVmbWlP6et56h
	B9v6a2PAejkFDvt/hZVOnlg5SysSNKU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-Y3R6X_UeOcu151IYuc9N5w-1; Thu, 01 Jun 2023 09:42:33 -0400
X-MC-Unique: Y3R6X_UeOcu151IYuc9N5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6D56185A7A5;
	Thu,  1 Jun 2023 13:42:32 +0000 (UTC)
Received: from [10.39.194.44] (unknown [10.39.194.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2B562166B27;
	Thu,  1 Jun 2023 13:42:31 +0000 (UTC)
Message-ID: <04cf2539-f262-22e1-5739-41d34c1230f3@redhat.com>
Date: Thu, 1 Jun 2023 15:42:30 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 06/22] states: Break deadlock if
 server goofs on extended replies
To: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Cc: qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-7-eblake@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230525130108.757242-7-eblake@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XVEkyqdA-tJ.A.RLD.sRKekB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2522
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/04cf2539-f262-22e1-5739-41d34c1230f3@redhat.com
Resent-Date: Thu,  1 Jun 2023 14:00:12 +0000 (UTC)

On 5/25/23 15:00, Eric Blake wrote:
> One of the benefits of extended replies is that we can do a
> fixed-length read for the entire header of every server reply, which
> is fewer syscalls than the split-read approach required by structured
> replies.

(Totally tangential comment: recvmsg() could scatter the incoming
traffic into non-contiguous fields of a non-packed structure. But I
don't know if TLS has anything similar. The current "linear receive"
approach is probably the least demanding of the underlying socket
abstractions. At the same time it requires us to use packed structs,
and/or multiple syscalls.)

> But one of the drawbacks of doing a large read is that if
> the server is non-compliant (not a problem for normal servers, but
> something I hit rather more than I'd like to admit while developing
> extended header support in servers),

Haha, so this is where it's coming from! :) I can totally relate.

> nbd_pwrite() and friends will
> deadlock if the server replies with the wrong header.  Add in some
> code to catch that failure mode and move the state machine to DEAD
> sooner, to make it easier to diagnose the fault in the server.
> 
> Unlike in the case of an unexpected simply reply from a structured

(1) s/simply/simple/

> server (where we never over-read, and can therefore

(2) At this point my English parser gets thrown off:

> commit b31e7bac
> can merely fail the command with EPROTO and successfully move on to
> the next server reply),

resync here:

> in this case we really do have to move to
> DEAD: in addition to having already read the 16 or 20 bytes that the
> server sent in its (short) reply for this command, we may have already
> read the initial bytes of the server's next reply, but we have no way
> to push those extra bytes back onto our read stream for parsing on our
> next pass through the state machine.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  generator/states-reply.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/generator/states-reply.c b/generator/states-reply.c
> index 4e9f2dde..d4710d91 100644
> --- a/generator/states-reply.c
> +++ b/generator/states-reply.c
> @@ -109,7 +109,28 @@  REPLY.START:
>   REPLY.RECV_REPLY:
>    switch (recv_into_rbuf (h)) {
>    case -1: SET_NEXT_STATE (%.DEAD); return 0;
> -  case 1: SET_NEXT_STATE (%.READY); return 0;
> +  case 1: SET_NEXT_STATE (%.READY);
> +    /* Special case: if we have a short read, but got at least far
> +     * enough to decode the magic number, we can check if the server
> +     * is matching our expectations. This lets us avoid deadlocking if
> +     * a buggy server sends only 16 bytes of a simple reply, and is
> +     * waiting for our next command, while we are blocked waiting for
> +     * the server to send 32 bytes of an extended reply.
> +     */

(4) Slight inconsistency between commit message and code comment: the
former mentions "20 bytes", but the latter doesn't mention "structured
reply".

> +    if (h->extended_headers &&
> +        (char *)h->rbuf >= (char *)&h->sbuf.reply.hdr.extended.flags) {

(.) I wonder if (address-of-magic + size-of magic) might be more
readable / greppable. Just in case.

Feel free to ignore.

> +      uint32_t magic = be32toh (h->sbuf.reply.hdr.extended.magic);
> +      if (magic != NBD_EXTENDED_REPLY_MAGIC) {
> +        SET_NEXT_STATE (%.DEAD); /* We've probably lost synchronization. */
> +        set_error (0, "invalid or unexpected reply magic 0x%" PRIx32, magic);
> +#if 0 /* uncomment to see desynchronized data */
> +        nbd_internal_hexdump (&h->sbuf.reply.hdr.extended.flags,
> +                              sizeof (h->sbuf.reply.hdr.extended.flags),
> +                              stderr);
> +#endif
> +      }
> +    }
> +    return 0;

(5) This could be factored out to a helper function, to share the
"invalid:" label logic with the previous patch.

(6) Commencing a dump from "flags" onward looks questionable. At this
point, the "flags" field need not to be complete, or even started -- all
we know is that the "magic" field *before" "flags" is complete.

I think we should dump "h->sbuf.reply.hdr.simple", like in patch#5.

(.) Side comment (so no bullet number assigned): because we can take
multiple iterations on RECV_REPLY, we may end up checking the "magic"
field multiple times. Not very costly, just something to be aware of.

(7) Assume that we have a short read first, but then complete
REPLY.RECV_REPLY successfully, and move to
REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY.

Then, the following condition will have been caught (excluded) under
RECV_REPLY:

  (extended_headers && magic != NBD_EXTENDED_REPLY_MAGIC)     [1]

Consequently, the same condition will never hold in
REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY.

Now consider REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY, from the previous
patch:

   magic = be32toh (h->sbuf.reply.hdr.simple.magic);
   switch (magic) {
   case NBD_SIMPLE_REPLY_MAGIC:
     if (h->extended_headers)
       goto invalid;

This branch becomes dead code. The condition

  h->extended_headers && magic == NBD_SIMPLE_REPLY_MAGIC

would satisfy [1], therefore it can't happen here.

Further:

     SET_NEXT_STATE (%SIMPLE_REPLY.START);
     break;
   case NBD_STRUCTURED_REPLY_MAGIC:
   case NBD_EXTENDED_REPLY_MAGIC:
     if ((magic == NBD_STRUCTURED_REPLY_MAGIC) == h->extended_headers)
       goto invalid;

While this lovely condition is satisfied by "true == true", that is, by:

  h->extended_headers && magic == NBD_STRUCTURED_REPLY_MAGIC    [2]

the same condition [2] satisfies [1] too, and therefore it can never occur.

The only way for satisfying this

  (magic == NBD_STRUCTURED_REPLY_MAGIC) == h->extended_headers

condition would be the "false == false" case, that is:

  !h->extended_headers && magic == NBD_EXTENDED_REPLY_MAGIC    [3]

(note that (magic != NBD_STRUCTURED_REPLY_MAGIC) is equivalent to (magic
== NBD_EXTENDED_REPLY_MAGIC) due to how the switch statement is structured,)

and then we should use that expression, i.e., [3], because it is more
readable than the double-equality (i.e., equivalence) form.

*HOWEVER*! :) If we do *not* see some short-but-together-long-enough
reads first, but see a full read at once, then our "pre-check" in
RECV_REPLY does not get activated at all! And then all the conditions in
CHECK_SIMPLE_OR_STRUCTURED_REPLY remain necessary.

So this is my long-winded way to ask that:

>    case 0: SET_NEXT_STATE (%CHECK_SIMPLE_OR_STRUCTURED_REPLY);
>    }
>    return 0;

you please consider adding a comment here, saying that, while the short
read special case *does* short-circuit a number of checks under
CHECK_SIMPLE_OR_STRUCTURED_REPLY, all the checks in
CHECK_SIMPLE_OR_STRUCTURED_REPLY remain required if under RECV_REPLY we
get a full read immediately.

Thanks!
Laszlo

