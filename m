Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001772960A
	for <lists+nbd@lfdr.de>; Fri,  9 Jun 2023 11:57:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A9C48204B0; Fri,  9 Jun 2023 09:57:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun  9 09:57:14 2023
Old-Return-Path: <lersek@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4F4E32049C
	for <lists-other-nbd@bendel.debian.org>; Fri,  9 Jun 2023 09:39:53 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.089 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id U4-e7qnY3Z3f for <lists-other-nbd@bendel.debian.org>;
	Fri,  9 Jun 2023 09:39:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 4764320498
	for <nbd@other.debian.org>; Fri,  9 Jun 2023 09:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686303577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JRrOp4wTfTLd1cllsORu6CCgqzCrvIgT2tMaUKuktLo=;
	b=bOFEhYmb319NO8+l/5kxRgV2qo7Qq84ITzvyDEteZKBPP9Mu1b5uYNphZtBOdX45Vm/hSY
	4k6A4Sw2Dgl8X1nZ0uMVN5hTAFmnX+euh0C7QwiND73HY9Ypc6HiTMA3emy4when1Qflgl
	5tawwRdrxlNrwL44nnduoZdby33JdCo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-ikg5d3R2NXWUdDAFLNcP0Q-1; Fri, 09 Jun 2023 05:39:33 -0400
X-MC-Unique: ikg5d3R2NXWUdDAFLNcP0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12B3828EA6F1;
	Fri,  9 Jun 2023 09:39:33 +0000 (UTC)
Received: from [10.39.193.66] (unknown [10.39.193.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C34A8400E400;
	Fri,  9 Jun 2023 09:39:28 +0000 (UTC)
Message-ID: <b3c08e33-24f0-2915-c9d1-0cbddf4cf4f0@redhat.com>
Date: Fri, 9 Jun 2023 11:39:27 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 08/22] block_status: Track 64-bit
 extents internally
To: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Cc: qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-9-eblake@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230525130108.757242-9-eblake@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gy4f8RbmsyO.A.xBH.6dvgkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2550
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b3c08e33-24f0-2915-c9d1-0cbddf4cf4f0@redhat.com
Resent-Date: Fri,  9 Jun 2023 09:57:14 +0000 (UTC)

Fair warning: this patch has made me both very excited and very
uncomfortable; that's the reason my style might come across as
needlessly "combative". I don't mean to be combative. It's just how my
thoughts have come out, and (unfortunately) I need to go pick up my son
now, and don't have time for further rounds of polishing my style. I
apologize in advance. Again, it's a consequence of me caring a bit too
much perhaps, and getting worked up.

On 5/25/23 15:00, Eric Blake wrote:
> When extended headers are in use, the server is required to use a
> response that can include 64-bit extent lengths and flags (even if it
> chooses to keep the extent length under 4G, and even for metacontexts
> like "base:allocation" where the flags never need more than 32 bits).

Yes. Per spec, negotiating NBD_OPT_EXTENDED_HEADERS is equivalent to the
server sending NBD_REPLY_TYPE_BLOCK_STATUS_EXT, as opposed to
NBD_REPLY_TYPE_BLOCK_STATUS.

> For maximum flexibility, we are better off storing 64-bit data
> internally, with a goal of letting the client's 32-bit interface work
> as much as possible, and for a future API addition of a 64-bit
> interface to work even with older servers that only give 32-bit
> results.

I agree that a 64-bit-only internal representation makes sense. Once
corresponding code part (quoting out of order for discussion's sake) is:

> diff --git a/lib/internal.h b/lib/internal.h
> index e4e21a4d..11186e24 100644
> --- a/lib/internal.h
> +++ b/lib/internal.h
> @@ -80,7 +80,7 @@ struct export {
>
>  struct command_cb {
>    union {
> -    nbd_extent_callback extent;
> +    nbd_extent64_callback extent;
>      nbd_chunk_callback chunk;
>      nbd_list_callback list;
>      nbd_context_callback context;

and that looks good to me.

> For backwards compatibility, a client that never negotiates a 64-bit
> status context can be handled without errors by truncating any 64-bit
> lengths down to just under 4G; so the old 32-bit interface will
> continue to work in most cases.

I absolutely don't follow this. The spec is clear.
NBD_OPT_EXTENDED_HEADERS corresponds to NBD_REPLY_TYPE_BLOCK_STATUS_EXT,
and (!NBD_OPT_EXTENDED_HEADERS) corresponds to
NBD_REPLY_TYPE_BLOCK_STATUS. If NBD_OPT_EXTENDED_HEADERS is negotiated
(which means both client and server agree to it), then the client
interface is 64-bit clean, so there's no need to truncate anything. If
NBD_OPT_EXTENDED_HEADERS is *not* negotiated, then our internal 64-bit
clean representation will never be filled with information that doesn't
fit into 32-bits (due to the reply type being restricted to
NBD_REPLY_TYPE_BLOCK_STATUS), so there is again no need to (observably)
truncate anything (technically there would be a uint64_t to uint32_t
conversion, but it would be value-preserving).

The spec also says that, if a client wants to query a particular
metadata context that is known to use 64-bit values, then the client
must first negotiate NBD_OPT_EXTENDED_HEADERS.

> A server should not advertise a
> metacontext that requires flags larger than 32 bits unless the client
> negotiated extended headers; but if such a client still tries to use
> the 32-bit interface, the code now reports EOVERFLOW for a server
> response with a flags value that cannot be represented without using
> the future API for 64-bit extent queries.

Again, I don't follow. Whenever the client issues an
NBD_CMD_BLOCK_STATUS command (which can only occur after negotiation):

- the client must have set at least one metacontext with
  NBD_OPT_SET_META_CONTEXT during negotiation,

- the client may or may not have agreed upon with the server on
  NBD_OPT_EXTENDED_HEADERS.

Therefore, when the server receives the NBD_CMD_BLOCK_STATUS command, it
can immediately decide whether there is *any* configured metacontext for
which *lack* of extended headers could be too restrictive. If only
32-bit metacontexts have been requested, this is not a problem. If
ext-hdrs have been negotiated, also not a problem. If there is at least
one 64-bit metacontext (regarding *either* status flags *or* lengths)
*and* ext-hdrs have not been negotiated, the server should immediately
fail (reject) the request.

Now, peeking a bit forward, I can see patch#10: "api: Add
[aio_]nbd_block_status_64". That means we can reject a 32-bit-only
nbd_block_status() API call on the client side immediately, if the
client has negotiated ext-hdrs. That is, if the client is smart enough
to ask for extended headers, it can be smart enough to use the 64-bit
API, and then it can accept everything the server throws at it. If the
client never even asks for extended headers, then it is permitted to
stick with the 32-bit-only API, but then the server must never respond
with NBD_REPLY_TYPE_BLOCK_STATUS_EXT [*], so actually 64-bit values are
never going to be present in our internal representation.

[*] If it still does, then the server is buggy, and we should realize
    that as soon as we parse the generic reply magic, or the specific
    reply type code.

I simply fail to see the *possibility* truncating the internal 64-bit
representation to 32-bit such that it would make a difference for the
caller.

Speaking in terms of code:

> diff --git a/lib/rw.c b/lib/rw.c
> index 8b2bd4cc..58b05a4b 100644
> --- a/lib/rw.c
> +++ b/lib/rw.c
> @@ -42,6 +42,61 @@ wait_for_command (struct nbd_handle *h, int64_t cookie)
>    return r == -1 ? -1 : 0;
>  }
>
> +/* Convert from 64-bit to 32-bit extent callback. */
> +static int
> +nbd_convert_extent (void *data, const char *metacontext, uint64_t offset,
> +                    nbd_extent *entries, size_t nr_entries, int *error)
> +{
> +  nbd_extent_callback *cb = data;
> +  uint32_t *array = malloc (nr_entries * 2 * sizeof *array);

Side question: what guarantees that the multiplication won't overflow?

If we have a guarantee, we should document it, and (preferably) assert
it.

> +  size_t i;
> +  int ret;
> +  bool fail = false;
> +
> +  if (array == NULL) {
> +    set_error (*error = errno, "malloc");
> +    return -1;
> +  }
> +
> +  for (i = 0; i < nr_entries; i++) {
> +    array[i * 2] = entries[i].length;
> +    array[i * 2 + 1] = entries[i].flags;
> +    /* If an extent is larger than 32 bits, silently truncate the rest
> +     * of the server's response; the client can then make progress
> +     * instead of needing to see failure.  Rather than track the
> +     * connection's alignment, just clamp the large extent to 4G-64M.
> +     * However, if flags doesn't fit in 32 bits, it's better to inform
> +     * the caller of an EOVERFLOW failure.
> +     *
> +     * Technically, a server with 64-bit answers is non-compliant if
> +     * the client did not negotiate extended headers - contexts that
> +     * include 64-bit flags should not have been negotiated in that
> +     * case.

Yes, and we should absolutely enforce that.

Don't we break off the connection (or at least abort the request) when
we get the wrong reply magic from the server, or else if we do get the
right reply magic, but an NBD_REPLY_TYPE_BLOCK_STATUS_EXT reply type
code inside, without having negotiated extended headers?

This compatibility goo creates a big maintenance and debugging burden.

> +     */
> +    if (entries[i].length > UINT32_MAX) {
> +      array[i++ * 2] = -MAX_REQUEST_SIZE;
> +      break;
> +    }
> +    if (entries[i].flags > UINT32_MAX) {
> +      *error = EOVERFLOW;
> +      fail = true;
> +      break;
> +    }
> +  }
> +
> +  ret = CALL_CALLBACK (*cb, metacontext, offset, array, i * 2, error);
> +  free (array);
> +  return fail ? -1 : ret;
> +}

Back to the commit message:

>
> Note that the existing 32-bit nbd_block_status() API is now slightly
> slower, particularly when talking with a server that lacks extended
> headers: we are doing two size conversions (32 to 64 internally, 64
> back to 32 to the user).  But this speed penalty is likely in the
> noise compared to the network delays, and ideally clients will switch
> over to the new 64-bit interfaces as more and more servers start
> supporting extended headers.

I'm not worried about the speed penalty, but at this point (and looking
at the rest of the patch) I'm actually changing my mind, and questioning
whether we are better off with the unified, 64-bit only internal
representation. It's not just about converting back and forth (and hence
code complexity): we're introducing further malloc()s, and those are all
new failure points. Even if we do handle memory allocation failures
everywhere correctly, they still introduce pontential *late* breaking
points for the client.

>
> One of the trickier aspects of this patch is auditing that both the
> user's extent and our malloc'd shim get cleaned up once on all
> possible paths, so that there is neither a leak nor a double free.

Right, and I happen to disagree with your implementation; more on that
below.

>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  lib/internal.h                      |  8 +++-
>  generator/states-reply-structured.c | 30 ++++++++-----
>  lib/handle.c                        |  2 +-
>  lib/rw.c                            | 70 ++++++++++++++++++++++++++++-
>  4 files changed, 95 insertions(+), 15 deletions(-)
>
> diff --git a/lib/internal.h b/lib/internal.h
> index e4e21a4d..11186e24 100644
> --- a/lib/internal.h
> +++ b/lib/internal.h
> @@ -303,7 +303,11 @@ struct nbd_handle {
>    size_t querynum;
>
>    /* When receiving block status, this is used. */
> -  uint32_t *bs_entries;
> +  union {
> +    char *storage;      /* malloc's view */
> +    nbd_extent *normal; /* Our 64-bit preferred internal form; n slots */
> +    uint32_t *narrow;   /* 32-bit NBD_REPLY_TYPE_BLOCK_STATUS form; n*2 slots */
> +  } bs_entries;
>
>    /* Commands which are waiting to be issued [meaning the request
>     * packet is sent to the server].  This is used as a simple linked

Now this could be a good approach in my opinion; however, I disagree
with how it's being used (the in-place conversion below, which IMO
arguably runs afoul of the effective type rules in C).

> diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
> index c53aed7b..784adb78 100644
> --- a/generator/states-reply-structured.c
> +++ b/generator/states-reply-structured.c
> @@ -436,6 +436,7 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
>   REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
>    struct command *cmd = h->reply_cmd;
>    uint32_t length;
> +  uint32_t count;
>
>    switch (recv_into_rbuf (h)) {
>    case -1: SET_NEXT_STATE (%.DEAD); return 0;
> @@ -450,15 +451,19 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
>      assert (cmd->type == NBD_CMD_BLOCK_STATUS);
>      assert (length >= 12);
>      length -= sizeof h->sbuf.reply.payload.bs_hdr;
> +    count = length / (2 * sizeof (uint32_t));

This division will work as expected, but it's hard to see why. After my
request under patch#1, for introducing bs_reply_length_ok(), and
asserting it here, it will be easier to understand.

I do dislike the open-coded "sizeof (uint32_t)" though, we should say
"sizeof *h->bs_entries.narrow".

>
> -    free (h->bs_entries);
> -    h->bs_entries = malloc (length);
> -    if (h->bs_entries == NULL) {
> +    /* Read raw data into a subset of h->bs_entries, then expand it
> +     * into place later during byte-swapping.
> +     */
> +    free (h->bs_entries.storage);
> +    h->bs_entries.storage = malloc (count * sizeof *h->bs_entries.normal);
> +    if (h->bs_entries.storage == NULL) {
>        SET_NEXT_STATE (%.DEAD);
>        set_error (errno, "malloc");
>        return 0;
>      }
> -    h->rbuf = h->bs_entries;
> +    h->rbuf = h->bs_entries.narrow;
>      h->rlen = length;
>      SET_NEXT_STATE (%RECV_BS_ENTRIES);
>    }
> @@ -470,6 +475,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
>    uint32_t count;
>    size_t i;
>    uint32_t context_id;
> +  uint32_t *raw;
>
>    switch (recv_into_rbuf (h)) {
>    case -1: SET_NEXT_STATE (%.DEAD); return 0;
> @@ -483,17 +489,21 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
>      assert (cmd); /* guaranteed by CHECK */
>      assert (cmd->type == NBD_CMD_BLOCK_STATUS);
>      assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
> -    assert (h->bs_entries);
> +    assert (h->bs_entries.normal);
>      assert (length >= 12);
>      assert (h->meta_valid);
>      count = (length - sizeof h->sbuf.reply.payload.bs_hdr) /
> -      sizeof *h->bs_entries;
> +      (2 * sizeof (uint32_t));
>
>      /* Need to byte-swap the entries returned, but apart from that we
> -     * don't validate them.
> +     * don't validate them.  Reverse order is essential, since we are
> +     * expanding in-place from narrow to wider type.
>       */
> -    for (i = 0; i < count; ++i)
> -      h->bs_entries[i] = be32toh (h->bs_entries[i]);
> +    raw = h->bs_entries.narrow;
> +    for (i = count; i-- > 0; ) {
> +      h->bs_entries.normal[i].flags = be32toh (raw[i * 2 + 1]);
> +      h->bs_entries.normal[i].length = be32toh (raw[i * 2]);
> +    }
>
>      /* Look up the context ID. */
>      context_id = be32toh (h->sbuf.reply.payload.bs_hdr.context_id);

So I find this way too clever; worse, it almost certainly breaks the
effective type rules in C.

First, I would be OK with storing pointers in the bs_entries union, if
our only purpose with the union were to only handle one of those
pointers at any given time. However, we're type punning the pointers
back and forth, and relying on their representation being identical.
(Pointer to structure vs. pointer to char vs. pointer to uint32_t.) Not
catastrophic, but not nice (and IMO not even necessary, see below).

Second, after reading the effective type rules very carefully, the code
might break them minimally (I think) when "i" equals zero, and the
"length" field is assigned. In that instance, you are reading the same
memory location as a uint32_t and writing it as a uint64_t, and not
going through a union.

I'd prefer one of the two following options:

- bs_entries should indeed be the union that you recommend, but used
  differently. First, "storage" should be allocated, and filled. When
  the reading completes, a new uint32_t array should be allocated,
  populated via byte-swapping, "storage" should be released, and the new
  (now byte-order-correct) array should be recorded in "narrow". Same
  approach for the future "normal" population. The advantages of this
  approach are: (a) not reading a pointer-to-type-X value as a
  pointer-to-type-Y value (reinterpreting the bit pattern) via the
  union, as we should always know what reply type we're dealing with,
  (b) any allocated array would only be accessed with a singular element
  type at any point in time. A kind of "double buffering".

- Better yet: drop the "storage" field from the union, and only have
  "narrow" and "normal" in it. Treat them entirely separately. For the
  32-bit case, simply rename the field references (from bs_normal to
  bs_normal.narrow), no need to change the existent logic. For the
  64-bit case, duplicate and widen the 32-bit case (the byte swapping
  etc), using bs_entries.normal.

> @@ -507,7 +517,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
>
>        if (CALL_CALLBACK (cmd->cb.fn.extent,
>                           h->meta_contexts.ptr[i].name, cmd->offset,
> -                         h->bs_entries, count,
> +                         h->bs_entries.normal, count,
>                           &error) == -1)
>          if (cmd->error == 0)
>            cmd->error = error ? error : EPROTO;
> diff --git a/lib/handle.c b/lib/handle.c
> index 0f11bee5..fba6d1c4 100644
> --- a/lib/handle.c
> +++ b/lib/handle.c
> @@ -130,7 +130,7 @@ nbd_close (struct nbd_handle *h)
>    nbd_unlocked_clear_debug_callback (h);
>
>    string_vector_empty (&h->querylist);
> -  free (h->bs_entries);
> +  free (h->bs_entries.storage);
>    nbd_internal_reset_size_and_flags (h);
>    for (i = 0; i < h->meta_contexts.len; ++i)
>      free (h->meta_contexts.ptr[i].name);

[empty line here due to earlier out-of-order quoting]

> diff --git a/lib/rw.c b/lib/rw.c
> index 8b2bd4cc..58b05a4b 100644
> --- a/lib/rw.c
> +++ b/lib/rw.c
> +static void
> +nbd_convert_extent_free (void *data)
> +{
> +  nbd_extent_callback *cb = data;
> +  FREE_CALLBACK (*cb);
> +  free (cb);
> +}
> +

For better readability, "data" should be "user_data" IMO, and "cb"
should be "shim".

>  /* Issue a read command and wait for the reply. */
>  int
>  nbd_unlocked_pread (struct nbd_handle *h, void *buf,
> @@ -487,12 +542,23 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
>                                 nbd_completion_callback *completion,
>                                 uint32_t flags)
>  {
> -  struct command_cb cb = { .fn.extent = *extent,
> +  nbd_extent_callback *shim = malloc (sizeof *shim);
> +  struct command_cb cb = { .fn.extent.callback = nbd_convert_extent,
> +                           .fn.extent.user_data = shim,
> +                           .fn.extent.free = nbd_convert_extent_free,
>                             .completion = *completion };
>
> +  if (shim == NULL) {
> +    set_error (errno, "malloc");
> +    return -1;
> +  }
> +  *shim = *extent;
> +  SET_CALLBACK_TO_NULL (*extent);
> +
>    if (h->strict & LIBNBD_STRICT_COMMANDS) {
>      if (!h->structured_replies) {
>        set_error (ENOTSUP, "server does not support structured replies");
> +      FREE_CALLBACK (cb.fn.extent);
>        return -1;
>      }
>
> @@ -500,11 +566,11 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
>        set_error (ENOTSUP, "did not negotiate any metadata contexts, "
>                   "either you did not call nbd_add_meta_context before "
>                   "connecting or the server does not support it");
> +      FREE_CALLBACK (cb.fn.extent);
>        return -1;
>      }
>    }
>
> -  SET_CALLBACK_TO_NULL (*extent);
>    SET_CALLBACK_TO_NULL (*completion);
>    return nbd_internal_command_common (h, flags, NBD_CMD_BLOCK_STATUS, offset,
>                                        count, EINVAL, NULL, &cb);

I disagree with this order of operations. (Note, I'm not saying there
are leaks or double free's.)

Consider the nbd_unlocked_aio_block_status() call site in
nbd_aio_block_status():

> int64_t
> nbd_aio_block_status (
>   struct nbd_handle *h, uint64_t count, uint64_t offset,
>   nbd_extent_callback extent_callback,
>   nbd_completion_callback completion_callback, uint32_t flags
> )
> {
>   /* ... */
>   ret = nbd_unlocked_aio_block_status (h, count, offset, &extent_callback,
>                                        &completion_callback, flags);
>   /* ... */
>   FREE_CALLBACK (extent_callback);
>   FREE_CALLBACK (completion_callback);
>   /* ... */
> }

If that call succeeds (returns a value different from (-1)), then we
expect nbd_unlocked_aio_block_status() to have taken ownership of both
"extent_callback" and "completion_callback", by emptying them. That way,
the FREE_CALLBACK()s at the end of the function decay to NOPs. If the
call fails OTOH, we expect the call to have left "extent_callback" and
"completion_callback" untouched, and the FREE_CALLBACK()s at the end to
have "fangs" -- perform actual freeing.

Pre-patch, nbd_unlocked_aio_block_status() conforms to this interface
contract quite well. It first goes through all possible local error
branches, and if all of those pass, only then does it zero the callback
structures (i.e., takes ownership of them).

This patch changes that; we take ownershop of "extent_callback" (by
copying it to "shim" and nulling it) before we check our local error
conditions, such as structured_replies and metadata context validity.
That breaks the interface contract, and so we cannot rely on
nbd_aio_block_status() for freeing "extent_callback" when we fail in one
of those local error conditions -- this is why we have to go through
FREE_CALLBACK (cb.fn.extent) on each of those error paths, for freeing
*both* "shim" and the "extent_callback" internals. And (most importantly
to me) then we return to the caller, namely nbd_aio_block_status(), in
such a way that (a) we fail, yet (b) we have already destroyed
"extent_callback" (but not "completion_callback"). The caller copes with
this (due to how FREE_CALLBACK() works), but it's unclean. If
nbd_unlocked_aio_block_status() fails, it shouldn't have messed with
"extent_callback".

(I notice a *slight* inconsistency with this requirement of mine in the
pre-patch code as well, BTW: pre-patch, we null both callback structures
*before* calling nbd_internal_command_common(); if the latter fails, we
get into the same situation. So I actually tend to disagree with that
too.)

Anyway, I would suggest (on top of your patch):

> diff --git a/lib/rw.c b/lib/rw.c
> index 58b05a4b5529..1913cbb11813 100644
> --- a/lib/rw.c
> +++ b/lib/rw.c
> @@ -552,26 +552,28 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
>      set_error (errno, "malloc");
>      return -1;
>    }
> -  *shim = *extent;
> -  SET_CALLBACK_TO_NULL (*extent);
>
>    if (h->strict & LIBNBD_STRICT_COMMANDS) {
>      if (!h->structured_replies) {
>        set_error (ENOTSUP, "server does not support structured replies");
> -      FREE_CALLBACK (cb.fn.extent);
> -      return -1;
> +      goto free_shim;
>      }
>
>      if (!h->meta_valid || h->meta_contexts.len == 0) {
>        set_error (ENOTSUP, "did not negotiate any metadata contexts, "
>                   "either you did not call nbd_add_meta_context before "
>                   "connecting or the server does not support it");
> -      FREE_CALLBACK (cb.fn.extent);
> -      return -1;
> +      goto free_shim;
>      }
>    }
>
> +  *shim = *extent;
> +  SET_CALLBACK_TO_NULL (*extent);
>    SET_CALLBACK_TO_NULL (*completion);
>    return nbd_internal_command_common (h, flags, NBD_CMD_BLOCK_STATUS, offset,
>                                        count, EINVAL, NULL, &cb);
> +
> +free_shim:
> +  free (shim);
> +  return -1;
>  }

Which, after squashing, would result in a patch like:

> @@ -487,25 +542,38 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
>                                 nbd_completion_callback *completion,
>                                 uint32_t flags)
>  {
> -  struct command_cb cb = { .fn.extent = *extent,
> +  nbd_extent_callback *shim = malloc (sizeof *shim);
> +  struct command_cb cb = { .fn.extent.callback = nbd_convert_extent,
> +                           .fn.extent.user_data = shim,
> +                           .fn.extent.free = nbd_convert_extent_free,
>                             .completion = *completion };
>
> +  if (shim == NULL) {
> +    set_error (errno, "malloc");
> +    return -1;
> +  }
> +
>    if (h->strict & LIBNBD_STRICT_COMMANDS) {
>      if (!h->structured_replies) {
>        set_error (ENOTSUP, "server does not support structured replies");
> -      return -1;
> +      goto free_shim;
>      }
>
>      if (!h->meta_valid || h->meta_contexts.len == 0) {
>        set_error (ENOTSUP, "did not negotiate any metadata contexts, "
>                   "either you did not call nbd_add_meta_context before "
>                   "connecting or the server does not support it");
> -      return -1;
> +      goto free_shim;
>      }
>    }
>
> +  *shim = *extent;
>    SET_CALLBACK_TO_NULL (*extent);
>    SET_CALLBACK_TO_NULL (*completion);
>    return nbd_internal_command_common (h, flags, NBD_CMD_BLOCK_STATUS, offset,
>                                        count, EINVAL, NULL, &cb);
> +
> +free_shim:
> +  free (shim);
> +  return -1;
>  }

But, to repeat myself -- I'm not convinced any more we benefit from the
64-bit-only internal representation. We should always be able to tell
precisely which one of the 32-bit and the 64-bit internal
representations we need. We should handle each separately, and then we
don't need the conversions + shim.

Laszlo

