Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 603C2712EAE
	for <lists+nbd@lfdr.de>; Fri, 26 May 2023 23:07:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2AE75206CC; Fri, 26 May 2023 21:07:07 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 26 21:07:07 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	REMOVEDOT,SARE_MSGID_LONG45,SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 67F8320648
	for <lists-other-nbd@bendel.debian.org>; Fri, 26 May 2023 21:06:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.632 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001, REMOVEDOT=3,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PDEJhPdUCgyA for <lists-other-nbd@bendel.debian.org>;
	Fri, 26 May 2023 21:06:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 01DB420487
	for <nbd@other.debian.org>; Fri, 26 May 2023 21:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685135197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6Q3AHtX0KSwfi2/XPAE8lnsDXzNjVfc+izIZUB2EwWM=;
	b=MxXq1EADqtL4RX9FC/dgeGH30supnG3op7a6PMRJxSmhPyslkLNlPWFW4TMXu+nN0lX3u5
	nULtmS20gQESmTucvP3V/ZaJrzfVgVzqWc70JO+2K1jzsAR5wYLbvnR8pDe7dGgUDYpP5z
	STrx2c/3jLUycGe//nBCaQS8/n44cVI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-RKK20imzNnGuu6C5bjf_FQ-1; Fri, 26 May 2023 17:06:32 -0400
X-MC-Unique: RKK20imzNnGuu6C5bjf_FQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05E1C8032F1;
	Fri, 26 May 2023 21:06:32 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.124])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A86E52166B2B;
	Fri, 26 May 2023 21:06:29 +0000 (UTC)
Date: Fri, 26 May 2023 16:06:27 -0500
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 02/22] internal: Refactor layout
 of replies in sbuf
Message-ID: <4whjuq2zatnxltmrz4tjq2qey3yl5a3z42ac7vykffem47u4yr@4mmvwm2vlqaj>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-3-eblake@redhat.com>
 <1fa92626-e5ac-5e95-f697-88804020ad46@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1fa92626-e5ac-5e95-f697-88804020ad46@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <180RYXoSEq.A.o3C.79RckB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2505
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4whjuq2zatnxltmrz4tjq2qey3yl5a3z42ac7vykffem47u4yr@4mmvwm2vlqaj
Resent-Date: Fri, 26 May 2023 21:07:07 +0000 (UTC)

On Fri, May 26, 2023 at 05:53:38PM +0200, Laszlo Ersek wrote:
> On 5/25/23 15:00, Eric Blake wrote:
> > In order to more easily add a third reply type with an even larger
> > header, but where the payload will look the same for both structured
> > and extended replies, it is nicer if simple and structured replies are
> > nested inside the same layer of sbuf.reply.hdr.
> 
> This makes sense, and the following, strictly related code change in the
> patch body corresponds to the explanation (except for the "__attribute__
> ((packed))" removal, but more on that later):
> 
> -    struct nbd_simple_reply simple_reply;
>      struct {
> -      struct nbd_structured_reply structured_reply;
> +      union {
> +        struct nbd_simple_reply simple;
> +        struct nbd_structured_reply structured;
> +      } hdr;
>        union {
>          struct nbd_structured_reply_offset_data offset_data;
>          struct nbd_structured_reply_offset_hole offset_hole;
>          struct nbd_structured_reply_block_status_hdr bs_hdr;
>          struct {
>            struct nbd_structured_reply_error error;
>            char msg[NBD_MAX_STRING]; /* Common to all error types */
>            uint64_t offset; /* Only used for NBD_REPLY_TYPE_ERROR_OFFSET */
>          } __attribute__ ((packed)) error;
>        } payload;
> -    }  __attribute__ ((packed)) sr;
> +    } reply;
> 
> One interesting consequence is that the payload union now becomes
> possible after the simple header, which IIUC makes no sense per NBD
> spec. But, it doesn't hurt either.

Indeed.  'union sbuf' is mostly used as a dumping grounds for "give me
enough scratch storage that I can have a place to read in all places
of interest across multiple recv() calls; I don't need the resulting
storage to match wire format, but any time multiple pieces of
information are needed at once, they must reside in non-overlapping
portions of sbuf, via a sub-struct.  But where we know we will not be
accessing disjoint regions of sbuf, we can use further nested unions
to compress the overall memory taken by sbuf".  While we will never
have a simple header used with a reply payload (because the only reply
with payload for a simple header is NBD_CMD_READ, and we read that
directly into the user's buffer instead of into sbuf), it doesn't hurt
that union sbuf has reserved that much space (because we do need that
much space for handilng a structured reply, and soon to handle an
extended reply).

> 
> At the same time:
> 
> > While at it, note
> > that while .or and .sr are structs declared within the overall sbuf
> > union, we never read into both halves of those structs at the same
> > time, so it does not matter if their two halves are consecutive.
> 
> I've been staring at this part for an extremely long time, and I just
> can't make any sense of it. My (strongly held) opinion is that this part
> of the patch should be split off to a separate patch.

Can do.  Looks like I'll be spinning a v4, but I'll let you get
further along in the review process to minimize list churn before I
start posting updates.

> 
> Here's a possible interpretation:
> 
> - The "sbuf.or" ("option reply") member of the "sbuf" union is a
>   structure. It has two members: "sbuf.or.option_reply" (another
>   structure) and "sbuf.or.payload" (a union).
> 
>   We never read into "sbuf.or.option_reply" and "sbuf.or.payload" at the
>   same time (i.e., we never cross the structure field boundary between
>   them, with a single recv operation), therefore we can remove the
>   "packed" attribute from "sbuf.or". This permits the compiler to insert
>   padding between "sbuf.or.option_reply" and "sbuf.or.payload", and/or
>   after "sbuf.or".

Correct, and since option replies are distinct from server replies, I
agree with your argument of splitting removal of the
attribute((packed)) into a separate patch.

> 
> - Similarly, the "sbuf.sr" ("structured reply") member of the "sbuf"
>   union is a structure. It has two members: "sbuf.sr.structured_reply"
>   (a structure) and "sbuf.sr.payload" (a union).
> 
>   We never read into "sbuf.sr.structured_reply" and "sbuf.sr.payload" at
>   the same time (i.e., we never cross the structure field boundary
>   between them, with a single recv operation), therefore we can remove
>   the "packed" attribute from "sbuf.sr". This permits the compiler to
>   insert padding between "sbuf.sr.structured_reply" and
>   "sbuf.sr.payload", and/or after "sbuf.sr".

Also correct. While it happens to more directly touch the rest of the
layout update in this patch, it is still a better fit logically to
remove the attribute to both sub-structs at the same time,
independently from reflowing the layout of sbuf.simple_reply and sbuf.sr.

> 
> In turn, my problem with this interpretation is that, if we never cross
> the struct member boundary within "sbuf.or" (i.e., between
> "option_reply" and "payload"), and similarly we never cross the struct
> member boundary within "sbuf.sr" (i.e., between "structured_reply" and
> "payload"), then *why* are "sbuf.or" and "sbuf.sr" structures in the
> first place (and not unions)?

'union sbuf' is already a union.  If we didn't need or.option_reply
and or.payload at the same time, then it would need make sense to just
have:

union sbuf {
  ...
  struct nbd_fixed_new_option_reply option_reply;
  struct nbd_fixed_ne
    struct nbd_fixed_new_option_reply_server server;
    char str[NBD_MAX_STRING * 2 + 1]; /* name, description, NUL */
  } __attribute__ ((packed)) or_payload_server;
  struct nbd_fixed_new_option_reply_info_export or_payload_export;
  ...
};

But because we DO need access to both or.option_reply and or.payload
at the same time (for example, see
generator/states-newstyle.c:handle_reply_error() called after both
pieces of sbuf.or have been populated), we instead packaged the entire
option reply into a nested struct, while still recognizing that the
distinct payload types can overlap via a nested union:

union sbuf {
  ...
  struct {
    struct nbd_fixed_new_option_reply option_reply;
    union {
      struct nbd_fixed_ne
        struct nbd_fixed_new_option_reply_server server;
        char str[NBD_MAX_STRING * 2 + 1]; /* name, description, NUL */
      } __attribute__ ((packed)) server;
      struct nbd_fixed_new_option_reply_info_export export;
      ...
    } payload;
  } or;
  ...
};

And referring back to your earlier insight, or.payload.server is a
nested struct that DOES need __attribute__((packed)), because that is
a case where we DO use a single recv() to populate two distinct C
types into guaranteed-adjacent memory, and don't want the compiler
throwing in any padding that might mess with us.

> 
> Now, I can imagine that the answer sounds like this: indeed we don't
> cross those field boundaries with a single recv, however we still need
> the data from both fields *at the same time*, later on.

Bingo.  On the wire, the two portions of the reply message happen to
be adjacent, and we need both portions of the reply in memory to
decipher the reply.  But there is no reason why our in-memory
representation has to be packed to match the wire layout.  And
allowing the compiler to insert padding can sometimes improve
performance.

> 
> And this certainly sounds like a valid explanation, and dropping the
> "packed" attributes is fine / justified as well, under this
> interpreation, but it absolutely must be a separate patch, IMO. I think
> I've spent at least half an hour explaining it to myself.

And convinced me of it likewise.  A half hour well spent.

> 
> > Dropping the packed notation on those structs means the compiler can
> > align .payload more naturally, which may slightly improve performance
> > on some platforms, even if it makes the overall union a few bytes
> > larger due to padding.
> >
> > Visually, this patch changes the layout from:
> >
> >  offset  simple                structured
> > +------------------------------------------------------------+
> > |     union sbuf                                             |
> > |     +---------------------+------------------------------+ |
> > |     | struct simple_reply | union sr                     | |

This line is wrong.  Pre-patch, it is 'struct sr', not 'union sr'.

> > |     | +-----------------+ | +--------------------------+ | |
> > |     | |                 | | | struct structured_reply  | | |
> > |     | |                 | | | +----------------------+ | | |
> > |  0  | | uint32_t magic  | | | | uint32_t magic       | | | |
> > |  4  | | uint32_t error  | | | | uint16_t flags       | | | |
> > |  6  | |                 | | | | uint16_t type        | | | |
> > |  8  | | uint64_t handle | | | | uint64_t handle      | | | |
> > |     | +-----------------+ | | |                      | | | |
> > | 16  | [padding]           | | | uint32_t length      | | | |
> > |     |                     | | +----------------------+ | | |
> > |     |                     | | union payload            | | |
> > |     |                     | | +-----------+----------+ | | |
> > | 20  |                     | | | ...       | ...      | | | |
> > |     |                     | | +-----------+----------+ | | |
> > |     |                     | +--------------------------+ | |
> > |     +---------------------+------------------------------+ |
> > +------------------------------------------------------------+
> >
> > to:
> >
> >  offset  simple                structured
> > +-------------------------------------------------------------+
> > |     union sbuf                                              |
> > |     +-----------------------------------------------------+ |
> > |     | struct reply                                        | |
> > |     | +-------------------------------------------------+ | |
> > |     | | union hdr                                       | | |
> > |     | | +--------------------+------------------------+ | | |
> > |     | | | struct simple      | struct structured      | | | |
> > |     | | | +----------------+ | +--------------------+ | | | |
> > |  0  | | | | uint32_t magic | | | uint32_t magic     | | | | |
> > |  4  | | | | uint32_t error | | | uint16_t flags     | | | | |
> > |  6  | | | |                | | | uint16_t type      | | | | |
> > |  8  | | | | uint64_t handle| | | uint64_t handle    | | | | |
> > |     | | | +----------------+ | |                    | | | | |
> > | 16  | | | [padding]          | | uint32_t length    | | | | |
> > |     | | |                    | +--------------------+ | | | |
> > | 20  | | |                    | [padding]              | | | |
> > |     | | +--------------------+------------------------+ | | |
> > |     | | union payload                                   | | |
> > |     | | +--------------------+------------------------+ | | |
> > | 24  | | | ...                | ...                    | | | |
> > |     | | +--------------------+------------------------+ | | |
> > |     | +-------------------------------------------------+ | |
> > |     +-----------------------------------------------------+ |
> > +-------------------------------------------------------------+
> >
> > Technically, whether the payload union offset moves to byte 24 (with
> > 20-23 now padding) or stays at 20 depends on compiler ABI; but many
> > systems prefer that any struct with a uint64_t provide 8-byte
> > alignment to its containing union.
> >
> > The commit is largely mechanical, and there should be no semantic
> > change.
> >
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >  lib/internal.h                      |  12 ++--
> >  generator/states-reply-simple.c     |   4 +-
> >  generator/states-reply-structured.c | 103 ++++++++++++++--------------
> >  generator/states-reply.c            |  14 ++--
> >  4 files changed, 68 insertions(+), 65 deletions(-)
> >
> > diff --git a/lib/internal.h b/lib/internal.h
> > index 25eeea34..c71980ef 100644
> > --- a/lib/internal.h
> > +++ b/lib/internal.h
> > @@ -231,14 +231,16 @@ struct nbd_handle {
> >          struct {
> >            struct nbd_fixed_new_option_reply_meta_context context;
> >            char str[NBD_MAX_STRING];
> > -        }  __attribute__ ((packed)) context;
> > +        } __attribute__ ((packed)) context;
> 
> Whitespace fixup, tolerable as a part of this patch.
> 
> >          char err_msg[NBD_MAX_STRING];
> >        } payload;
> > -    }  __attribute__ ((packed)) or;
> > +    } or;
> 
> So I disagree with doing this here. I'd like it to be its own patch.
> 
> >      struct nbd_export_name_option_reply export_name_reply;
> > -    struct nbd_simple_reply simple_reply;
> >      struct {
> > -      struct nbd_structured_reply structured_reply;
> > +      union {
> > +        struct nbd_simple_reply simple;
> > +        struct nbd_structured_reply structured;
> > +      } hdr;
> >        union {
> >          struct nbd_structured_reply_offset_data offset_data;
> >          struct nbd_structured_reply_offset_hole offset_hole;
> 
> Yes, fine (although formatting it with a much larger context would have
> helped -- anyway I'm reviewing the series with -W in my local clone).

I should indeed try harder to follow your useful example of generating
specific patches with more than the default 3 lines of context, when
it would make review easier.  Alas, 'git format-patch' doesn't seem to
have an easy way to pick a different context size on a per-patch
basis, so this basically implies writing (or finding and reusing
existing) wrapper tooling to automate that.

> 
> > @@ -249,7 +251,7 @@ struct nbd_handle {
> >            uint64_t offset; /* Only used for NBD_REPLY_TYPE_ERROR_OFFSET */
> >          } __attribute__ ((packed)) error;
> >        } payload;
> > -    }  __attribute__ ((packed)) sr;
> > +    } reply;
> >      uint16_t gflags;
> >      uint32_t cflags;
> >      uint32_t len;
> 
> Here too, the __attribute__ ((packed)) removal shoould be in a separate
> patch. Renaming "sr" to "reply" is "in scope", of course.
> 
> > diff --git a/generator/states-reply-simple.c b/generator/states-reply-simple.c
> > index 8fd9f62a..e6f1ee23 100644
> > --- a/generator/states-reply-simple.c
> > +++ b/generator/states-reply-simple.c
> > @@ -23,7 +23,7 @@  REPLY.SIMPLE_REPLY.START:
> >    struct command *cmd = h->reply_cmd;
> >    uint32_t error;
> >
> > -  error = be32toh (h->sbuf.simple_reply.error);
> > +  error = be32toh (h->sbuf.reply.hdr.simple.error);
> >
> >    if (cmd == NULL) {
> >      /* Unexpected reply.  If error was set or we have structured
> 
> Yes.
> 
> > @@ -39,7 +39,7 @@  REPLY.SIMPLE_REPLY.START:
> >      if (error || h->structured_replies)
> >        SET_NEXT_STATE (%^FINISH_COMMAND);
> >      else {
> > -      uint64_t cookie = be64toh (h->sbuf.simple_reply.handle);
> > +      uint64_t cookie = be64toh (h->sbuf.reply.hdr.simple.handle);
> >        SET_NEXT_STATE (%.DEAD);
> >        set_error (EPROTO,
> >                   "no matching cookie %" PRIu64 " found for server reply, "
> 
> Yes; same thing, just different name.
> 
> > diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
> > index 96182222..6f96945a 100644
> > --- a/generator/states-reply-structured.c
> > +++ b/generator/states-reply-structured.c
> > @@ -49,9 +49,9 @@  REPLY.STRUCTURED_REPLY.START:
> >     * so read the remaining part.
> >     */
> >    h->rbuf = &h->sbuf;
> > -  h->rbuf = (char *)h->rbuf + sizeof h->sbuf.simple_reply;
> > -  h->rlen = sizeof h->sbuf.sr.structured_reply;
> > -  h->rlen -= sizeof h->sbuf.simple_reply;
> > +  h->rbuf = (char *)h->rbuf + sizeof h->sbuf.reply.hdr.simple;
> > +  h->rlen = sizeof h->sbuf.reply.hdr.structured;
> > +  h->rlen -= sizeof h->sbuf.reply.hdr.simple;
> >    SET_NEXT_STATE (%RECV_REMAINING);
> >    return 0;
> >
> 
> Here I disagree with the mechanical approach.
> 
> I even take issue with the pre-patch code. Pre-patch, we fill in
> "h->sbuf.simple_reply" (in "generator/states-reply.c"), i.e., one member
> of the top-level "sbuf" union, but then continue filling a member of a
> *different* member (i.e., "sr.structured_reply") of the "sbuf" union
> here. This looks undefined by the C standard, but even if it's not
> undefined, it's supremely confusing.

It happens to work, but I agree with you that we are probably
stretching aliasing rules about memory effective types that it is
shaky ground to begin with.  Even adding a STATIC_ASSERT that
offsetof(struct simple_reply, handle) == offsetof(struct
structured_reply, handle) would be helpful to show that we depend on
that.

> 
> Now, if structure "nbd_simple_reply" were the first member of
> "nbd_structured_reply", maybe we could salvage this somehow -- but
> that's not the case.
> 
> ... Right, in "generator/states-reply.c", we have:
> 
>   /* We read all replies initially as if they are simple replies, but
>    * check the magic in CHECK_SIMPLE_OR_STRUCTURED_REPLY below.
>    * This works because the structured_reply header is larger.
>    */
> 
> This is precisely my problem.  The common initial subsequence is only
> the "uint32_t magic" field. Therefore the code in
> "generator/states-reply.c" should only read the magic field at first,
> and then branch to simple vs. structured reply.

While both structs share only a common prefix of uint32_t magic, they
intentionally DO share uint64_t handle at the SAME offset of 8 bytes
in.  The commit message tries to show that visually both pre- and
post-patch.

(Oh, that reminds me; I need to do a patch to s/handle/cookie/ to
match my recent patch to the NBD spec.)

> 
> Post-patch, the sbuf.reply.hdr union actually reflects this well! The
> structure members of that union all begin with the common subsequence
> "uint32_t magic", so using the special guarantee from the C standard,
> it's fine to fill in "magic" via one union member, and read it back via
> another. Pre-patch, the guarantee doesn't apply, because
> "sbuf.simple_reply" and "sbuf.sr.structured_reply" are not members of
> the same union.
> 
> However, even with this patch applied (i.e., with "sbuf.reply.hdr"
> existing), the code performing the reading continues making me
> uncomfortable. We effectively have this sequence:
> 
> - take address of "h->sbuf.reply.hdr"
> 
> - read "sizeof h->sbuf.reply.hdr.simple" bytes into it
> 
> - (at this point we can safely access "h->sbuf.reply.hdr.simple", *and*
>    "h->sbuf.reply.hdr.structured.magic" as well -- but not the rest of
>    "h->sbuf.reply.hdr.structured"!)
> 
> - take the address of "h->sbuf.reply.hdr.structured.length" -- but not
>   by name; instead, only by virtue of the previous read having filled in
>   "magic", "flags", "type", and "handle", as a *happenstance*, via
>   populating "h->sbuf.reply.hdr.simple"
> 
> - read as many bytes as necessary in order to complete
>   "h->sbuf.reply.hdr.structured", from that point onward.
> 
> This smells to me.
> 
> Optimally, the simple reply and the structured reply should look like
> this:
> 
>   struct nbd_reply_header {
>     uint32_t magic;
>     union {
>       struct {
>         uint32_t error;
>         uint64_t handle;
>       } simple;
>       struct {
>         uint16_t flags;
>         uint16_t type;
>         uint64_t handle;
>         uint32_t length;
>       } structured;
>     } magic_specific;
>   };

Hmm.  As long as this resides only in sbuf, it makes sense for libnbd.
But if we also touch the structs in lib/nbd-protocol.h, then it is
code that is shared with nbdkit and has an even wider ripple effect.

My initial problem with THIS proposal is that it REQUIRES the use of
multiple __attribute__((packed)) if we intend to read in multiple
fields in one recv: for example the struct for nbd_reply_header.simple
starts with uint32_t followed by uint64_t, so many ABIs want to align
it as:

offsets 0-3 error
offsets 4-7 padding
offsets 8-15 handle

and when thrown in the larger nbd_reply_header, you now have a natural
alignment that prefers:

offsets 0-3 magic
offsets 4-7 padding
offsets 8-11 error
offsets 12-15 padding
offsets 16-23 handle

Note that in lib/nbd-protocol.h, 'struct nbd_simple_reply' is already
marked packed; but even if it weren't, the sizings of the member
fields HAPPEN to be naturally aligned, for both simple and structured
replies (I can't speak to the design of the simple reply since that
pre-dates my involvement in Linux, but as I was the one that added
structured replies to the NBD spec, it was intentional on my part to
pick sizes that filled in all space assuming alignment matches sizing,
and where magic and handle both overlap).  But a STATIC_ASSERT
wouldn't hurt, showing that we want:

offsets 0-3 magic
offsets 4-7 error OR offsets 4-5 flags, offsets 6-7 type
offsets 8-15 handle

(Hmm - another thing I should consider: why do we use
NBD_ATTRIBUTE_PACKED in nbd-protocol.h but open-code
__attribute__((packed)) in internal.h? Consistent spelling would be
nice.)

A secondary problem with this proposal is what happens later in the
series when adding extended headers.  When we added structured
replies, we were forced to do (at least) two partial reads (which type
of reply packet is on the wire, followed by reading the rest of the
packet).  But with extended headers, we know a priori that all
expected responses will have a 32-byte header, and can do a single
recv() for all 32 bytes.  And for a server that does not support
structured replies, always reading 16 bytes happens to work for simple
replies (it is only when we have structured replies that the
difference of 16 vs. 20 bytes of recv() is dependent on magic).  Thus,
having the state machine try to favor as few recv() as possible is
still a worthwhile goal.

But having said all that, maybe I could live with:

struct nbd_reply_header {
  uint32_t magic;
  union {
    uint32_t simple_error;
    struct {
      uint16_t flags;
      uint16_t type;
    } structured;
  } middle;
  uint64_t handle;
  uint32_t length; /* only used for structured */
};

although once extended headers are in play, it would end up looking
more like

struct nbd_reply_header {
  uint32_t magic;
  union {
    uint32_t simple_error;
    struct {
      uint16_t flags;
      uint16_t type;
    } structured; /* including extended */
  } middle;
  uint64_t handle;
  union {
    /* unused for simple */
    uint32_t structured_length;
    struct {
      uint64_t offset;
      uint64_t length;
    } extended;
  } tail;
};

At any rate, as written there, natural alignment still works for the
struct prefix (no 64-bit entities in struct middle.structured, so the
overall union middle has only 4-byte alignment and 4-byte size).
Okay, natural alignment says the overall struct nbd_reply_header would
be 24 bytes, even though structured replies only take 20 bytes
(because of the 8-byte handle, the compiler inserts four bytes of
padding after length), so we may still want __attribute__((packed)) or
at a bare minimum STATIC_ASSERT to show that we insist on handle being
at offset 8.


> 
> and we should have separate automaton states for reading
> "magic_specific.simple" and "magic_specific.structured".
> 
> In REPLY.START, we should only read "magic".
> 
> We should have a sepate state called REPLY.SIMPLE_REPLY.START, for
> reading "magic_specific.simple".

If we weren't guaranteed that 'handle' overlaps between the two types,
I might agree.  But my argument is that the wire protocol DOES intend
for handle to be at the same offset, regardless of the interpretation
of the middle bytes, and forcing multiple recv() is just more syscalls
for something that we know we'll eventually need to interpret
according to magic.  Even if we just read into a char[] and then
reinterpret into simple or structured, rather than reading a prefix
into simple and then reading more bytes into a tail of structured, is
at least fewer syscalls, and also less likely to run foul of C's
effective type rules (I've recently had to refamiliarize myself with
C17 section 6.5 paragraph 7 as part of working on how POSIX should
specify intentional aliasing occuring in struct sockaddr and friends,
https://austingroupbugs.net/view.php?id=1641).

> 
> In REPLY.STRUCTURED_REPLY.START, we should point h->rbuf at
> "magic_specific.structured", and read "sizeof magic_specific.structured"
> bytes.
> 
> I'll stop here because there's already much to discuss.
> 
> Thanks,
> Laszlo
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

