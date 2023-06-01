Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAD47196B6
	for <lists+nbd@lfdr.de>; Thu,  1 Jun 2023 11:21:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2D8C620A35; Thu,  1 Jun 2023 09:21:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  1 09:21:18 2023
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
	by bendel.debian.org (Postfix) with ESMTP id BEECF209F5
	for <lists-other-nbd@bendel.debian.org>; Thu,  1 Jun 2023 09:04:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lo5RbbOAGI13 for <lists-other-nbd@bendel.debian.org>;
	Thu,  1 Jun 2023 09:04:17 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id B22FA20A4C
	for <nbd@other.debian.org>; Thu,  1 Jun 2023 09:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685610252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qGI6XjwZ1MEwbfyDLb2kbLPoY+Gxdr9FX+SfzWTeWiE=;
	b=JvUd4OxRyQ0uNJs2CLXmHRISCfifCiMqFtU6GBInCMrUloaVhvzZhmf+UaWoqekKt2xDBQ
	mwL9bFNkL/iYF3bW+Zt031gg0iPHGsLLMVvctqeqqZ1AosZm/pcYPfL3deP95+Mf7ri035
	I2WTrZRkTp5tQcdIOLd2MYrpfcEcCCU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-xOWi-El0OB-pTjJdBME7Lg-1; Thu, 01 Jun 2023 05:04:08 -0400
X-MC-Unique: xOWi-El0OB-pTjJdBME7Lg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F3CF3C0F423;
	Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from [10.39.194.44] (unknown [10.39.194.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08569112132C;
	Thu,  1 Jun 2023 09:04:06 +0000 (UTC)
Message-ID: <80c36755-eda3-5d04-1418-89f11f825577@redhat.com>
Date: Thu, 1 Jun 2023 11:04:05 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 05/22] states: Prepare to receive
 64-bit replies
To: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Cc: qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-6-eblake@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230525130108.757242-6-eblake@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aV9E-uSAJzK.A.9mE.OMGekB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2520
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/80c36755-eda3-5d04-1418-89f11f825577@redhat.com
Resent-Date: Thu,  1 Jun 2023 09:21:18 +0000 (UTC)

On 5/25/23 15:00, Eric Blake wrote:
> Support receiving headers for 64-bit replies if extended headers were
> negotiated.  We already insist that the server not send us too much
> payload in one reply, so we can exploit that and merge the 64-bit
> length back into a normalized 32-bit field for the rest of the payload
> length calculations.  The NBD protocol specifically documents that
> extended mode takes precedence over structured replies, and that there
> are no simple replies in extended mode.  We can also take advantage
> that the handle field is in the same offset in all the various reply
> types.

(1) We might want to replace "handle" with "cookie" at this point.

>
> Note that if we negotiate extended headers, but a non-compliant server
> replies with a non-extended header, this patch will stall waiting for
> the server to send more bytes

Ah, yes. If we negotiate extended headers, we set "rlen" to "sizeof
extended" in REPLY.START, which is larger than either of "sizeof simple"
and "sizeof structured". Therefore we'll get stuck in REPLY.RECV_REPLY.
Correct?

> rather than noticing that the magic
> number is wrong (for aio operations, you'll get a magic number
> mismatch once you send a second command that elicits a reply; but for
> blocking operations, we basically deadlock).  The easy alternative
> would be to read just the first 4 bytes of magic, then determine how
> many more bytes to expect; but that would require more states and
> syscalls, and not worth it since the typical server will be compliant.

Not liking this "not worth it" argument. But...

> The other alternative is what the next patch implements: teaching
> REPLY.RECV_REPLY to handle short reads that were at least long enough
> to transmit magic to specifically look for magic number mismatch.

... that sounds OK!

>
> At this point, h->extended_headers is permanently false (we can't
> enable it until all other aspects of the protocol have likewise been
> converted).
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  lib/internal.h                      |  1 +
>  generator/states-reply-structured.c | 52 +++++++++++++++++++----------
>  generator/states-reply.c            | 34 ++++++++++++-------
>  3 files changed, 58 insertions(+), 29 deletions(-)

Probably best to reorder the files in this patch for review:

>
> diff --git a/lib/internal.h b/lib/internal.h
> index 8a5f93d4..e4e21a4d 100644
> --- a/lib/internal.h
> +++ b/lib/internal.h
> @@ -243,6 +243,7 @@ struct nbd_handle {
>        union {
>          struct nbd_simple_reply simple;
>          struct nbd_structured_reply structured;
> +        struct nbd_extended_reply extended;
>        } hdr;
>        union {
>          struct nbd_structured_reply_offset_data offset_data;

Seems OK.

> diff --git a/generator/states-reply.c b/generator/states-reply.c
> index 31e4bd2f..4e9f2dde 100644
> --- a/generator/states-reply.c
> +++ b/generator/states-reply.c
> @@ -62,15 +62,19 @@  REPLY.START:
>     */
>    ssize_t r;
>
> -  /* We read all replies initially as if they are simple replies, but
> -   * check the magic in CHECK_SIMPLE_OR_STRUCTURED_REPLY below.
> -   * This works because the structured_reply header is larger.
> +  /* With extended headers, there is only one size to read, so we can do it
> +   * all in one syscall.  But for older structured replies, we don't know if
> +   * we have a simple or structured reply until we read the magic number,
> +   * requiring a two-part read with CHECK_SIMPLE_OR_STRUCTURED_REPLY below.
>     */
>    assert (h->reply_cmd == NULL);
>    assert (h->rlen == 0);
>
>    h->rbuf = &h->sbuf.reply.hdr;
> -  h->rlen = sizeof h->sbuf.reply.hdr.simple;
> +  if (h->extended_headers)
> +    h->rlen = sizeof h->sbuf.reply.hdr.extended;
> +  else
> +    h->rlen = sizeof h->sbuf.reply.hdr.simple;
>
>    r = h->sock->ops->recv (h, h->sock, h->rbuf, h->rlen);
>    if (r == -1) {

The comment "This works because the structured_reply header is larger"
is being removed, which makes the non-ext branch even less
comprehensible than before.

(2) Can we add the STATIC_ASSERT() here, stating that "sizeof simple" is
smaller than "sizeof structured"?

> @@ -116,16 +120,22 @@  REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY:
>    uint64_t cookie;
>
>    magic = be32toh (h->sbuf.reply.hdr.simple.magic);
> -  if (magic == NBD_SIMPLE_REPLY_MAGIC) {
> +  switch (magic) {
> +  case NBD_SIMPLE_REPLY_MAGIC:
> +    if (h->extended_headers)
> +      goto invalid;
>      SET_NEXT_STATE (%SIMPLE_REPLY.START);
> -  }
> -  else if (magic == NBD_STRUCTURED_REPLY_MAGIC) {
> +    break;
> +  case NBD_STRUCTURED_REPLY_MAGIC:
> +  case NBD_EXTENDED_REPLY_MAGIC:
> +    if ((magic == NBD_STRUCTURED_REPLY_MAGIC) == h->extended_headers)

Heh, I love this ((a == b) == c) "equivalence" form! :)

> +      goto invalid;
>      SET_NEXT_STATE (%STRUCTURED_REPLY.START);
> -  }
> -  else {
> -    /* We've probably lost synchronization. */
> -    SET_NEXT_STATE (%.DEAD);
> -    set_error (0, "invalid reply magic 0x%" PRIx32, magic);
> +    break;
> +  default:
> +  invalid:
> +    SET_NEXT_STATE (%.DEAD); /* We've probably lost synchronization. */
> +    set_error (0, "invalid or unexpected reply magic 0x%" PRIx32, magic);
>  #if 0 /* uncomment to see desynchronized data */
>      nbd_internal_hexdump (&h->sbuf.reply.hdr.simple,
>                            sizeof (h->sbuf.reply.hdr.simple),

My apologies, but I find *this* placement of "invalid" terrible. I
thought the "goto invalid" statements were jumping to the end of the
function. Now I see they jump effectively to another case label.

(3) How about this (on top of your patch, to be squashed):

/---------------------
| diff --git a/generator/states-reply.c b/generator/states-reply.c
| index 4e9f2ddeb567..ea7bd4e7db91 100644
| --- a/generator/states-reply.c
| +++ b/generator/states-reply.c
| @@ -133,15 +133,8 @@  REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY:
|      SET_NEXT_STATE (%STRUCTURED_REPLY.START);
|      break;
|    default:
| -  invalid:
| -    SET_NEXT_STATE (%.DEAD); /* We've probably lost synchronization. */
| -    set_error (0, "invalid or unexpected reply magic 0x%" PRIx32, magic);
| -#if 0 /* uncomment to see desynchronized data */
| -    nbd_internal_hexdump (&h->sbuf.reply.hdr.simple,
| -                          sizeof (h->sbuf.reply.hdr.simple),
| -                          stderr);
| -#endif
| -    return 0;
| +    /* We've probably lost synchronization. */
| +    goto invalid:
|    }
|
|    /* NB: This works for both simple and structured replies because the
| @@ -159,6 +152,16 @@  REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY:
|    h->reply_cmd = cmd;
|    return 0;
|
| +invalid:
| +  SET_NEXT_STATE (%.DEAD);
| +  set_error (0, "invalid or unexpected reply magic 0x%" PRIx32, magic);
| +#if 0 /* uncomment to see desynchronized data */
| +  nbd_internal_hexdump (&h->sbuf.reply.hdr.simple,
| +                        sizeof (h->sbuf.reply.hdr.simple),
| +                        stderr);
| +#endif
| +  return 0;
| +
|   REPLY.FINISH_COMMAND:
|    struct command *prev_cmd, *cmd;
|    uint64_t cookie;
\---------------------

... At the same time, even with this "cleanup" for the labels, I find it
relatively confusing (albeit correct, as far as I can tell!) that in
REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY, we first check the magic
number(s) and *then* whether we negotiated extended headers, whereas in
all the other state handlers, the order (= condition nesting) is the
opposite: we first check extended headers, and deal with any other
objects second. This makes the assert()s in REPLY.STRUCTURED_REPLY.START
especially tricky to demonstrate -- I think I've managed to do it, it
looks correct, it's just hard. So that's a half- (or quarter-)hearted
proposal to investigate how REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY
looked if there too, "extended_headers" were the outer check. Anyway, I
don't feel strongly about this. :)

(4) Still in REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY, we have a comment
saying

   /* NB: This works for both simple and structured replies because the
    * handle (our cookie) is stored at the same offset.
    */

The code under it applies to extended headers too, so the comment should
be updated.

(There's a similar comment in REPLY.FINISH_COMMAND, too; I'm not sure if
that state is relevant for extended headers.)

Then:

> diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
> index df509216..c53aed7b 100644
> --- a/generator/states-reply-structured.c
> +++ b/generator/states-reply-structured.c
> @@ -45,14 +45,20 @@ structured_reply_in_bounds (uint64_t offset, uint32_t length,
>
>  STATE_MACHINE {
>   REPLY.STRUCTURED_REPLY.START:
> -  /* We've only read the simple_reply.  The structured_reply is longer,
> -   * so read the remaining part.
> +  /* If we have extended headers, we've already read the entire header.
> +   * Otherwise, we've only read enough for a simple_reply; since structured
> +   * replies are longer, read the remaining part.
>     */

(5) Ah, the word "simple_reply", which this change preserves, is a
leftover. It should be updated in patch#2, "internal: Refactor layout of
replies in sbuf", where the "simple_reply" field is replaced with
"reply.hdr.simple" in "sbuf".

I guess I didn't notice this omission in patch#2 because the context
there only shows the "so read the remaining part" line of the comment,
and "simple_reply" is on the preceding line.

And then this patch too should refer to "reply.hdr.simple", in the new
comment.

Alternatively, perhaps use the type name (struct tag, actually):
"nbd_simple_reply".

> -  h->rbuf = &h->sbuf;
> -  h->rbuf = (char *)h->rbuf + sizeof h->sbuf.reply.hdr.simple;
> -  h->rlen = sizeof h->sbuf.reply.hdr.structured;
> -  h->rlen -= sizeof h->sbuf.reply.hdr.simple;
> -  SET_NEXT_STATE (%RECV_REMAINING);
> +  if (h->extended_headers) {
> +    assert (h->rbuf == sizeof h->sbuf.reply.hdr.extended + (char*)&h->sbuf);
> +    SET_NEXT_STATE (%CHECK);
> +  }
> +  else {
> +    assert (h->rbuf == sizeof h->sbuf.reply.hdr.simple + (char*)&h->sbuf);
> +    h->rlen = sizeof h->sbuf.reply.hdr.structured -
> +      sizeof h->sbuf.reply.hdr.simple;
> +    SET_NEXT_STATE (%RECV_REMAINING);
> +  }
>    return 0;
>
>   REPLY.STRUCTURED_REPLY.RECV_REMAINING:

This looks OK, but can we make it less verbose? How about:

/----------------------
| diff --git a/lib/internal.h b/lib/internal.h
| index e4e21a4d1ffa..a630b2511ff7 100644
| --- a/lib/internal.h
| +++ b/lib/internal.h
| @@ -240,7 +240,7 @@ struct nbd_handle {
|      } or;
|      struct nbd_export_name_option_reply export_name_reply;
|      struct {
| -      union {
| +      union reply_header {
|          struct nbd_simple_reply simple;
|          struct nbd_structured_reply structured;
|          struct nbd_extended_reply extended;
| diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
| index c53aed7bb859..852cb5b6053c 100644
| --- a/generator/states-reply-structured.c
| +++ b/generator/states-reply-structured.c
| @@ -49,14 +49,14 @@  REPLY.STRUCTURED_REPLY.START:
|     * Otherwise, we've only read enough for a simple_reply; since structured
|     * replies are longer, read the remaining part.
|     */
| +  union reply_header *hdr = &h->sbuf.reply.hdr;
|    if (h->extended_headers) {
| -    assert (h->rbuf == sizeof h->sbuf.reply.hdr.extended + (char*)&h->sbuf);
| +    assert (h->rbuf == sizeof hdr->extended + (char*)&h->sbuf);
|      SET_NEXT_STATE (%CHECK);
|    }
|    else {
| -    assert (h->rbuf == sizeof h->sbuf.reply.hdr.simple + (char*)&h->sbuf);
| -    h->rlen = sizeof h->sbuf.reply.hdr.structured -
| -      sizeof h->sbuf.reply.hdr.simple;
| +    assert (h->rbuf == sizeof hdr->simple + (char*)&h->sbuf);
| +    h->rlen = sizeof hdr->structured - sizeof hdr->simple;
|      SET_NEXT_STATE (%RECV_REMAINING);
|    }
|    return 0;
\----------------------

Anyway, feel free to ignore this -- I can see two counter-arguments
myself:

- the rest of the code remains just as verbose,

- one could argue that the addition

    sizeof hdr->simple + (char*)&h->sbuf

  is *more* confusing than

    sizeof h->sbuf.reply.hdr.simple + (char*)&h->sbuf

Then:

> @@ -69,11 +75,18 @@  REPLY.STRUCTURED_REPLY.RECV_REMAINING:
>   REPLY.STRUCTURED_REPLY.CHECK:
>    struct command *cmd = h->reply_cmd;
>    uint16_t flags, type;
> -  uint32_t length;
> +  uint64_t length;
> +  uint64_t offset = -1;

(6) I disagree with initializing the local variable "offset" here.

Below (in the rest of REPLY.STRUCTURED_REPLY.CHECK), we only read
"offset" back if "extended_headers" is set. But if "extended_headers" is
set, we also store a value to "offset", before the read.

Initializing "offset" to -1 suggests that the code might otherwise read
an indeterminate value from "offset" -- but that's not the case.

>
> +  assert (cmd);

(7) What guarantees this?

Is it the lookup code at the end of
REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY?

But that code can set "reply_cmd" to NULL, in case the cookie is not
found; and the cookie lookup there defers to FINISH for diagnosing the
unassociated reply.

>    flags = be16toh (h->sbuf.reply.hdr.structured.flags);
>    type = be16toh (h->sbuf.reply.hdr.structured.type);
> -  length = be32toh (h->sbuf.reply.hdr.structured.length);
> +  if (h->extended_headers) {
> +    length = be64toh (h->sbuf.reply.hdr.extended.length);
> +    offset = be64toh (h->sbuf.reply.hdr.extended.offset);
> +  }
> +  else
> +    length = be32toh (h->sbuf.reply.hdr.structured.length);
>
>    /* Reject a server that replies with too much information, but don't
>     * reject a single structured reply to NBD_CMD_READ on the largest
> @@ -83,13 +96,18 @@  REPLY.STRUCTURED_REPLY.CHECK:
>     * not worth keeping the connection alive.
>     */
>    if (length > MAX_REQUEST_SIZE + sizeof h->sbuf.reply.payload.offset_data) {
> -    set_error (0, "invalid server reply length %" PRIu32, length);
> +    set_error (0, "invalid server reply length %" PRIu64, length);
>      SET_NEXT_STATE (%.DEAD);
>      return 0;
>    }
> +  /* For convenience, we now normalize extended replies into compact,
> +   * doable since we validated that payload length fits in 32 bits.
> +   */
> +  h->sbuf.reply.hdr.structured.length = length;

(8) I'm very confused by this. For an extended reply, this will
overwrite the "offset" field.

I understand we have stolen that field already, above; but that's little
solace, especially without specific comments.

>
>    /* Skip an unexpected structured reply, including to an unknown cookie. */
> -  if (cmd == NULL || !h->structured_replies)
> +  if (cmd == NULL || !h->structured_replies ||
> +      (h->extended_headers && offset != cmd->offset))
>      goto resync;
>
>    switch (type) {

(9) Preserving the (cmd == NULL) sub-condition, plus the reference to
"unkown cookie" in the comment, looks like a logic bug to me: it can
never evaluate to "true", given the assert() I'm questioning above at
(7).

Alternatively, the assert() is wrong.

(10) The comment only talks about "unexpected structured reply", but the
condition now deals with extended headers too, and I don't know how
those relate to each other.

What I'm trying to express is that

(a) checking "structured_replies" *here*, but

(b) checking "extended_headers" against magic numbers in
REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY,

at the same time, seems inconsistent. If we get a structured reply after
*not* having negotiated them, we should be able to catch that in the
exact same location -- i.e., where we check magic numbers -- where we
can also realize that we're getting an extended reply in spite of *not*
having negotiated *those*.

In other words, the treatment differs, and I don't know why: if we get
an unexpected structured reply, we skip it and "resync", whereas if we
get an unexpected extended reply, we move to the DEAD state.

I think it's fine to skip replies that refer to unknown cookies, but
*reply format* violations should be fatal.


Then, this is not a request for an update, just a comment: I don't
understand why the spec introduced the "offset" field at all. It does
not seem to carry additional information beyond the cookie. So we can
certainly check that the response's offset matches the command's offset
(the code looks OK), but the larger purpose is unclear. (And this is
probably also the reason why you get away with corrupting
"nbd_extended_reply.offset" at (8) -- the field is never again needed,
beyond the sanity check performed here.)

> @@ -168,7 +186,7 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR:
>      SET_NEXT_STATE (%.READY);
>      return 0;
>    case 0:
> -    length = be32toh (h->sbuf.reply.hdr.structured.length);
> +    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
>      assert (length >= sizeof h->sbuf.reply.payload.error.error.error);
>      assert (cmd);
>
> @@ -207,7 +225,7 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR_MESSAGE:
>      SET_NEXT_STATE (%.READY);
>      return 0;
>    case 0:
> -    length = be32toh (h->sbuf.reply.hdr.structured.length);
> +    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
>      msglen = be16toh (h->sbuf.reply.payload.error.error.len);
>      type = be16toh (h->sbuf.reply.hdr.structured.type);
>
> @@ -307,7 +325,7 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_DATA:
>      SET_NEXT_STATE (%.READY);
>      return 0;
>    case 0:
> -    length = be32toh (h->sbuf.reply.hdr.structured.length);
> +    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
>      offset = be64toh (h->sbuf.reply.payload.offset_data.offset);
>
>      assert (cmd); /* guaranteed by CHECK */
> @@ -346,7 +364,7 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_DATA_DATA:
>      SET_NEXT_STATE (%.READY);
>      return 0;
>    case 0:
> -    length = be32toh (h->sbuf.reply.hdr.structured.length);
> +    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
>      offset = be64toh (h->sbuf.reply.payload.offset_data.offset);
>
>      assert (cmd); /* guaranteed by CHECK */
> @@ -426,7 +444,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
>      SET_NEXT_STATE (%.READY);
>      return 0;
>    case 0:
> -    length = be32toh (h->sbuf.reply.hdr.structured.length);
> +    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
>
>      assert (cmd); /* guaranteed by CHECK */
>      assert (cmd->type == NBD_CMD_BLOCK_STATUS);
> @@ -460,7 +478,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
>      SET_NEXT_STATE (%.READY);
>      return 0;
>    case 0:
> -    length = be32toh (h->sbuf.reply.hdr.structured.length);
> +    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
>
>      assert (cmd); /* guaranteed by CHECK */
>      assert (cmd->type == NBD_CMD_BLOCK_STATUS);

(11) This is all fallout from (8). The commit message does document it
(in the first paragraph), but I don't understand where we *benefit* from
stuffing "nbd_extended_reply.length" into "nbd_structured_reply.length".

Regarding downsides thereof, I can see two:

- as I mentioned, "nbd_extended_reply.offset" becomes unusable,

- "nbd_structured_reply.length" will no longer be big-endian but
  host-endian, which arguably does not match the other fields'
  endianness in the scratch space (= sbuf).

I feel this back-stuffing brings the stashed header into an inconsistent
state that is specific to a subset of the automaton's states.

I'd rather introduce an entirely new field to "sbuf.reply" -- between
"sbuf.reply.hdr" and "sbuf.reply.payload" --, if we really need to cache
a host-endian length value, regardless of which kind of reply header we
got.

Thanks!
Laszlo

