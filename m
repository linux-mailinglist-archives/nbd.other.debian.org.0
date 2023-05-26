Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D198712A2B
	for <lists+nbd@lfdr.de>; Fri, 26 May 2023 18:09:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AE7EE2068D; Fri, 26 May 2023 16:09:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 26 16:09:14 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 62E702068E
	for <lists-other-nbd@bendel.debian.org>; Fri, 26 May 2023 15:53:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fs7K3umIQgDK for <lists-other-nbd@bendel.debian.org>;
	Fri, 26 May 2023 15:53:50 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 4F86820681
	for <nbd@other.debian.org>; Fri, 26 May 2023 15:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685116424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoVBWhcgwgX95HWv0TCCw8XvcvcEMOF1vm/084J05K4=;
	b=ULL7TjqrlowGXRLsmsDeNgGRO06n0xeG0SY1hTnnMYWik8RcKJECmQQvANfh3WhsTO6pVX
	vxcBaljLE1GP7dzi83hy69Paeg8NjzlRUCIalxICiNct+pmrsvtMllmawLwi5bflb8D25t
	AHR6LXDhH+64gDcOOD+KkPdgBsaW5EM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-8SPuTuKdNlqJo1Bt8XZElA-1; Fri, 26 May 2023 11:53:41 -0400
X-MC-Unique: 8SPuTuKdNlqJo1Bt8XZElA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 833DC3C11CD2;
	Fri, 26 May 2023 15:53:41 +0000 (UTC)
Received: from [10.39.193.100] (unknown [10.39.193.100])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7117A7C2A;
	Fri, 26 May 2023 15:53:40 +0000 (UTC)
Message-ID: <1fa92626-e5ac-5e95-f697-88804020ad46@redhat.com>
Date: Fri, 26 May 2023 17:53:38 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 02/22] internal: Refactor layout of
 replies in sbuf
To: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Cc: qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-3-eblake@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230525130108.757242-3-eblake@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-g_EU6BKFPN.A.UEC.qmNckB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2503
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1fa92626-e5ac-5e95-f697-88804020ad46@redhat.com
Resent-Date: Fri, 26 May 2023 16:09:14 +0000 (UTC)

On 5/25/23 15:00, Eric Blake wrote:
> In order to more easily add a third reply type with an even larger
> header, but where the payload will look the same for both structured
> and extended replies, it is nicer if simple and structured replies are
> nested inside the same layer of sbuf.reply.hdr.

This makes sense, and the following, strictly related code change in the
patch body corresponds to the explanation (except for the "__attribute__
((packed))" removal, but more on that later):

-    struct nbd_simple_reply simple_reply;
     struct {
-      struct nbd_structured_reply structured_reply;
+      union {
+        struct nbd_simple_reply simple;
+        struct nbd_structured_reply structured;
+      } hdr;
       union {
         struct nbd_structured_reply_offset_data offset_data;
         struct nbd_structured_reply_offset_hole offset_hole;
         struct nbd_structured_reply_block_status_hdr bs_hdr;
         struct {
           struct nbd_structured_reply_error error;
           char msg[NBD_MAX_STRING]; /* Common to all error types */
           uint64_t offset; /* Only used for NBD_REPLY_TYPE_ERROR_OFFSET */
         } __attribute__ ((packed)) error;
       } payload;
-    }  __attribute__ ((packed)) sr;
+    } reply;

One interesting consequence is that the payload union now becomes
possible after the simple header, which IIUC makes no sense per NBD
spec. But, it doesn't hurt either.

At the same time:

> While at it, note
> that while .or and .sr are structs declared within the overall sbuf
> union, we never read into both halves of those structs at the same
> time, so it does not matter if their two halves are consecutive.

I've been staring at this part for an extremely long time, and I just
can't make any sense of it. My (strongly held) opinion is that this part
of the patch should be split off to a separate patch.

Here's a possible interpretation:

- The "sbuf.or" ("option reply") member of the "sbuf" union is a
  structure. It has two members: "sbuf.or.option_reply" (another
  structure) and "sbuf.or.payload" (a union).

  We never read into "sbuf.or.option_reply" and "sbuf.or.payload" at the
  same time (i.e., we never cross the structure field boundary between
  them, with a single recv operation), therefore we can remove the
  "packed" attribute from "sbuf.or". This permits the compiler to insert
  padding between "sbuf.or.option_reply" and "sbuf.or.payload", and/or
  after "sbuf.or".

- Similarly, the "sbuf.sr" ("structured reply") member of the "sbuf"
  union is a structure. It has two members: "sbuf.sr.structured_reply"
  (a structure) and "sbuf.sr.payload" (a union).

  We never read into "sbuf.sr.structured_reply" and "sbuf.sr.payload" at
  the same time (i.e., we never cross the structure field boundary
  between them, with a single recv operation), therefore we can remove
  the "packed" attribute from "sbuf.sr". This permits the compiler to
  insert padding between "sbuf.sr.structured_reply" and
  "sbuf.sr.payload", and/or after "sbuf.sr".

In turn, my problem with this interpretation is that, if we never cross
the struct member boundary within "sbuf.or" (i.e., between
"option_reply" and "payload"), and similarly we never cross the struct
member boundary within "sbuf.sr" (i.e., between "structured_reply" and
"payload"), then *why* are "sbuf.or" and "sbuf.sr" structures in the
first place (and not unions)?

Now, I can imagine that the answer sounds like this: indeed we don't
cross those field boundaries with a single recv, however we still need
the data from both fields *at the same time*, later on.

And this certainly sounds like a valid explanation, and dropping the
"packed" attributes is fine / justified as well, under this
interpreation, but it absolutely must be a separate patch, IMO. I think
I've spent at least half an hour explaining it to myself.

> Dropping the packed notation on those structs means the compiler can
> align .payload more naturally, which may slightly improve performance
> on some platforms, even if it makes the overall union a few bytes
> larger due to padding.
>
> Visually, this patch changes the layout from:
>
>  offset  simple                structured
> +------------------------------------------------------------+
> |     union sbuf                                             |
> |     +---------------------+------------------------------+ |
> |     | struct simple_reply | union sr                     | |
> |     | +-----------------+ | +--------------------------+ | |
> |     | |                 | | | struct structured_reply  | | |
> |     | |                 | | | +----------------------+ | | |
> |  0  | | uint32_t magic  | | | | uint32_t magic       | | | |
> |  4  | | uint32_t error  | | | | uint16_t flags       | | | |
> |  6  | |                 | | | | uint16_t type        | | | |
> |  8  | | uint64_t handle | | | | uint64_t handle      | | | |
> |     | +-----------------+ | | |                      | | | |
> | 16  | [padding]           | | | uint32_t length      | | | |
> |     |                     | | +----------------------+ | | |
> |     |                     | | union payload            | | |
> |     |                     | | +-----------+----------+ | | |
> | 20  |                     | | | ...       | ...      | | | |
> |     |                     | | +-----------+----------+ | | |
> |     |                     | +--------------------------+ | |
> |     +---------------------+------------------------------+ |
> +------------------------------------------------------------+
>
> to:
>
>  offset  simple                structured
> +-------------------------------------------------------------+
> |     union sbuf                                              |
> |     +-----------------------------------------------------+ |
> |     | struct reply                                        | |
> |     | +-------------------------------------------------+ | |
> |     | | union hdr                                       | | |
> |     | | +--------------------+------------------------+ | | |
> |     | | | struct simple      | struct structured      | | | |
> |     | | | +----------------+ | +--------------------+ | | | |
> |  0  | | | | uint32_t magic | | | uint32_t magic     | | | | |
> |  4  | | | | uint32_t error | | | uint16_t flags     | | | | |
> |  6  | | | |                | | | uint16_t type      | | | | |
> |  8  | | | | uint64_t handle| | | uint64_t handle    | | | | |
> |     | | | +----------------+ | |                    | | | | |
> | 16  | | | [padding]          | | uint32_t length    | | | | |
> |     | | |                    | +--------------------+ | | | |
> | 20  | | |                    | [padding]              | | | |
> |     | | +--------------------+------------------------+ | | |
> |     | | union payload                                   | | |
> |     | | +--------------------+------------------------+ | | |
> | 24  | | | ...                | ...                    | | | |
> |     | | +--------------------+------------------------+ | | |
> |     | +-------------------------------------------------+ | |
> |     +-----------------------------------------------------+ |
> +-------------------------------------------------------------+
>
> Technically, whether the payload union offset moves to byte 24 (with
> 20-23 now padding) or stays at 20 depends on compiler ABI; but many
> systems prefer that any struct with a uint64_t provide 8-byte
> alignment to its containing union.
>
> The commit is largely mechanical, and there should be no semantic
> change.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  lib/internal.h                      |  12 ++--
>  generator/states-reply-simple.c     |   4 +-
>  generator/states-reply-structured.c | 103 ++++++++++++++--------------
>  generator/states-reply.c            |  14 ++--
>  4 files changed, 68 insertions(+), 65 deletions(-)
>
> diff --git a/lib/internal.h b/lib/internal.h
> index 25eeea34..c71980ef 100644
> --- a/lib/internal.h
> +++ b/lib/internal.h
> @@ -231,14 +231,16 @@ struct nbd_handle {
>          struct {
>            struct nbd_fixed_new_option_reply_meta_context context;
>            char str[NBD_MAX_STRING];
> -        }  __attribute__ ((packed)) context;
> +        } __attribute__ ((packed)) context;

Whitespace fixup, tolerable as a part of this patch.

>          char err_msg[NBD_MAX_STRING];
>        } payload;
> -    }  __attribute__ ((packed)) or;
> +    } or;

So I disagree with doing this here. I'd like it to be its own patch.

>      struct nbd_export_name_option_reply export_name_reply;
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

Yes, fine (although formatting it with a much larger context would have
helped -- anyway I'm reviewing the series with -W in my local clone).

> @@ -249,7 +251,7 @@ struct nbd_handle {
>            uint64_t offset; /* Only used for NBD_REPLY_TYPE_ERROR_OFFSET */
>          } __attribute__ ((packed)) error;
>        } payload;
> -    }  __attribute__ ((packed)) sr;
> +    } reply;
>      uint16_t gflags;
>      uint32_t cflags;
>      uint32_t len;

Here too, the __attribute__ ((packed)) removal shoould be in a separate
patch. Renaming "sr" to "reply" is "in scope", of course.

> diff --git a/generator/states-reply-simple.c b/generator/states-reply-simple.c
> index 8fd9f62a..e6f1ee23 100644
> --- a/generator/states-reply-simple.c
> +++ b/generator/states-reply-simple.c
> @@ -23,7 +23,7 @@  REPLY.SIMPLE_REPLY.START:
>    struct command *cmd = h->reply_cmd;
>    uint32_t error;
>
> -  error = be32toh (h->sbuf.simple_reply.error);
> +  error = be32toh (h->sbuf.reply.hdr.simple.error);
>
>    if (cmd == NULL) {
>      /* Unexpected reply.  If error was set or we have structured

Yes.

> @@ -39,7 +39,7 @@  REPLY.SIMPLE_REPLY.START:
>      if (error || h->structured_replies)
>        SET_NEXT_STATE (%^FINISH_COMMAND);
>      else {
> -      uint64_t cookie = be64toh (h->sbuf.simple_reply.handle);
> +      uint64_t cookie = be64toh (h->sbuf.reply.hdr.simple.handle);
>        SET_NEXT_STATE (%.DEAD);
>        set_error (EPROTO,
>                   "no matching cookie %" PRIu64 " found for server reply, "

Yes; same thing, just different name.

> diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
> index 96182222..6f96945a 100644
> --- a/generator/states-reply-structured.c
> +++ b/generator/states-reply-structured.c
> @@ -49,9 +49,9 @@  REPLY.STRUCTURED_REPLY.START:
>     * so read the remaining part.
>     */
>    h->rbuf = &h->sbuf;
> -  h->rbuf = (char *)h->rbuf + sizeof h->sbuf.simple_reply;
> -  h->rlen = sizeof h->sbuf.sr.structured_reply;
> -  h->rlen -= sizeof h->sbuf.simple_reply;
> +  h->rbuf = (char *)h->rbuf + sizeof h->sbuf.reply.hdr.simple;
> +  h->rlen = sizeof h->sbuf.reply.hdr.structured;
> +  h->rlen -= sizeof h->sbuf.reply.hdr.simple;
>    SET_NEXT_STATE (%RECV_REMAINING);
>    return 0;
>

Here I disagree with the mechanical approach.

I even take issue with the pre-patch code. Pre-patch, we fill in
"h->sbuf.simple_reply" (in "generator/states-reply.c"), i.e., one member
of the top-level "sbuf" union, but then continue filling a member of a
*different* member (i.e., "sr.structured_reply") of the "sbuf" union
here. This looks undefined by the C standard, but even if it's not
undefined, it's supremely confusing.

Now, if structure "nbd_simple_reply" were the first member of
"nbd_structured_reply", maybe we could salvage this somehow -- but
that's not the case.

... Right, in "generator/states-reply.c", we have:

  /* We read all replies initially as if they are simple replies, but
   * check the magic in CHECK_SIMPLE_OR_STRUCTURED_REPLY below.
   * This works because the structured_reply header is larger.
   */

This is precisely my problem.  The common initial subsequence is only
the "uint32_t magic" field. Therefore the code in
"generator/states-reply.c" should only read the magic field at first,
and then branch to simple vs. structured reply.

Post-patch, the sbuf.reply.hdr union actually reflects this well! The
structure members of that union all begin with the common subsequence
"uint32_t magic", so using the special guarantee from the C standard,
it's fine to fill in "magic" via one union member, and read it back via
another. Pre-patch, the guarantee doesn't apply, because
"sbuf.simple_reply" and "sbuf.sr.structured_reply" are not members of
the same union.

However, even with this patch applied (i.e., with "sbuf.reply.hdr"
existing), the code performing the reading continues making me
uncomfortable. We effectively have this sequence:

- take address of "h->sbuf.reply.hdr"

- read "sizeof h->sbuf.reply.hdr.simple" bytes into it

- (at this point we can safely access "h->sbuf.reply.hdr.simple", *and*
   "h->sbuf.reply.hdr.structured.magic" as well -- but not the rest of
   "h->sbuf.reply.hdr.structured"!)

- take the address of "h->sbuf.reply.hdr.structured.length" -- but not
  by name; instead, only by virtue of the previous read having filled in
  "magic", "flags", "type", and "handle", as a *happenstance*, via
  populating "h->sbuf.reply.hdr.simple"

- read as many bytes as necessary in order to complete
  "h->sbuf.reply.hdr.structured", from that point onward.

This smells to me.

Optimally, the simple reply and the structured reply should look like
this:

  struct nbd_reply_header {
    uint32_t magic;
    union {
      struct {
        uint32_t error;
        uint64_t handle;
      } simple;
      struct {
        uint16_t flags;
        uint16_t type;
        uint64_t handle;
        uint32_t length;
      } structured;
    } magic_specific;
  };

and we should have separate automaton states for reading
"magic_specific.simple" and "magic_specific.structured".

In REPLY.START, we should only read "magic".

We should have a sepate state called REPLY.SIMPLE_REPLY.START, for
reading "magic_specific.simple".

In REPLY.STRUCTURED_REPLY.START, we should point h->rbuf at
"magic_specific.structured", and read "sizeof magic_specific.structured"
bytes.

I'll stop here because there's already much to discuss.

Thanks,
Laszlo

