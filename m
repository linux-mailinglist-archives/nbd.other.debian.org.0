Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A497111D8
	for <lists+nbd@lfdr.de>; Thu, 25 May 2023 19:18:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6F81320650; Thu, 25 May 2023 17:18:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 25 17:18:13 2023
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
	by bendel.debian.org (Postfix) with ESMTP id D6023205AA
	for <lists-other-nbd@bendel.debian.org>; Thu, 25 May 2023 17:02:15 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id i627fQsC4ZAY for <lists-other-nbd@bendel.debian.org>;
	Thu, 25 May 2023 17:02:07 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 3E245204F5
	for <nbd@other.debian.org>; Thu, 25 May 2023 17:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685034122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T6hIxZiwOCkqfLKfgnQWE3Jt13e+IqEDRh4pKO7j/ok=;
	b=RcKfBe6LUfkhXTwNkGSQDYaQHw/OqebZGNCVkTooWL52hvPnN4qxizOFE8tAhe8FWTY5wz
	icr3pzRPX/j6D/OMTYATpHfy+sYBOCJKi7gtCZhmKqqIHdT6I3RV4OGEXtsj0R1rePdEnr
	cngd7WQbvfSbbTE1pGxg1vofuPcgWvw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-09fPqzypMWKHU_8rDbd2fg-1; Thu, 25 May 2023 12:30:39 -0400
X-MC-Unique: 09fPqzypMWKHU_8rDbd2fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 788938032EF;
	Thu, 25 May 2023 16:30:39 +0000 (UTC)
Received: from [10.39.194.38] (unknown [10.39.194.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 845057AF5;
	Thu, 25 May 2023 16:30:38 +0000 (UTC)
Message-ID: <6cff3a35-9cbc-4781-f531-b7c651eede9e@redhat.com>
Date: Thu, 25 May 2023 18:30:37 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 01/22] block_status: Refactor array
 storage
To: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Cc: qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-2-eblake@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <20230525130108.757242-2-eblake@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <boygkf7KkHE.A.NVG.Vh5bkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2501
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6cff3a35-9cbc-4781-f531-b7c651eede9e@redhat.com
Resent-Date: Thu, 25 May 2023 17:18:13 +0000 (UTC)

On 5/25/23 15:00, Eric Blake wrote:
> For 32-bit block status, we were able to cheat and use an array with
> an odd number of elements, with array[0] holding the context id, and
> passing &array[1] to the user's callback.  But once we have 64-bit
> extents, we can no longer abuse array element 0 like that, for two
> reasons: 64-bit extents contain uint64_t which might not be
> alignment-compatible with an array of uint32_t on all architectures,
> and the new NBD_REPLY_TYPE_BLOCK_STATUS_EXT adds an additional count
> field before the array.
>
> Split out a new state STRUCTURED_REPLY.BS_HEADER to receive the
> context id (and eventually the new count field for 64-bit replies)
> separately from the extents array, and add another structured_reply
> type in the payload section for tracking it.  No behavioral change,
> other than the rare possibility of landing in the new state.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  lib/internal.h                      |  1 +
>  lib/nbd-protocol.h                  | 17 +++++----
>  generator/state_machine.ml          |  9 ++++-
>  generator/states-reply-structured.c | 56 ++++++++++++++++++++---------
>  4 files changed, 60 insertions(+), 23 deletions(-)
>
> diff --git a/lib/internal.h b/lib/internal.h
> index b155681d..25eeea34 100644
> --- a/lib/internal.h
> +++ b/lib/internal.h
> @@ -242,6 +242,7 @@ struct nbd_handle {
>        union {
>          struct nbd_structured_reply_offset_data offset_data;
>          struct nbd_structured_reply_offset_hole offset_hole;
> +        struct nbd_structured_reply_block_status_hdr bs_hdr;
>          struct {
>            struct nbd_structured_reply_error error;
>            char msg[NBD_MAX_STRING]; /* Common to all error types */
> diff --git a/lib/nbd-protocol.h b/lib/nbd-protocol.h
> index 0217891e..f4640a98 100644
> --- a/lib/nbd-protocol.h
> +++ b/lib/nbd-protocol.h
> @@ -182,12 +182,6 @@ struct nbd_fixed_new_option_reply_meta_context {
>    /* followed by a string */
>  } NBD_ATTRIBUTE_PACKED;
>
> -/* NBD_REPLY_TYPE_BLOCK_STATUS block descriptor. */
> -struct nbd_block_descriptor {
> -  uint32_t length;              /* length of block */
> -  uint32_t status_flags;        /* block type (hole etc) */
> -} NBD_ATTRIBUTE_PACKED;
> -
>  /* Request (client -> server). */
>  struct nbd_request {
>    uint32_t magic;               /* NBD_REQUEST_MAGIC. */
> @@ -224,6 +218,17 @@ struct nbd_structured_reply_offset_hole {
>    uint32_t length;              /* Length of hole. */
>  } NBD_ATTRIBUTE_PACKED;
>
> +/* NBD_REPLY_TYPE_BLOCK_STATUS block descriptor. */
> +struct nbd_block_descriptor {
> +  uint32_t length;              /* length of block */
> +  uint32_t status_flags;        /* block type (hole etc) */
> +} NBD_ATTRIBUTE_PACKED;
> +
> +struct nbd_structured_reply_block_status_hdr {
> +  uint32_t context_id;          /* metadata context ID */
> +  /* followed by array of nbd_block_descriptor extents */
> +} NBD_ATTRIBUTE_PACKED;
> +
>  struct nbd_structured_reply_error {
>    uint32_t error;               /* NBD_E* error number */
>    uint16_t len;                 /* Length of human readable error. */
> diff --git a/generator/state_machine.ml b/generator/state_machine.ml
> index 126159b9..1f0d00b0 100644
> --- a/generator/state_machine.ml
> +++ b/generator/state_machine.ml
> @@ -871,10 +871,17 @@ and
>      external_events = [];
>    };
>
> +  State {
> +    default_state with
> +    name = "RECV_BS_HEADER";
> +    comment = "Receive header of structured reply block-status payload";
> +    external_events = [];
> +  };
> +
>    State {
>      default_state with
>      name = "RECV_BS_ENTRIES";
> -    comment = "Receive a structured reply block-status payload";
> +    comment = "Receive entries array of structured reply block-status payload";
>      external_events = [];
>    };
>
> diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
> index 5aca7262..96182222 100644
> --- a/generator/states-reply-structured.c
> +++ b/generator/states-reply-structured.c
> @@ -126,19 +126,10 @@  REPLY.STRUCTURED_REPLY.CHECK:
>          length < 12 || ((length-4) & 7) != 0)

This is important (the context doesn't show it in full): we're under
NBD_REPLY_TYPE_BLOCK_STATUS here (nested under
REPLY.STRUCTURED_REPLY.CHECK), and we enforce that

  length = be32toh (h->sbuf.sr.structured_reply.length);

contains the context_id (4 bytes), plus a positive integral number of
block descriptor structures (8 bytes each).

>        goto resync;
>      assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
> -    /* We read the context ID followed by all the entries into a
> -     * single array and deal with it at the end.
> -     */
> -    free (h->bs_entries);
> -    h->bs_entries = malloc (length);
> -    if (h->bs_entries == NULL) {
> -      SET_NEXT_STATE (%.DEAD);
> -      set_error (errno, "malloc");
> -      break;
> -    }
> -    h->rbuf = h->bs_entries;
> -    h->rlen = length;
> -    SET_NEXT_STATE (%RECV_BS_ENTRIES);
> +    /* Start by reading the context ID. */
> +    h->rbuf = &h->sbuf.sr.payload.bs_hdr;
> +    h->rlen = sizeof h->sbuf.sr.payload.bs_hdr;
> +    SET_NEXT_STATE (%RECV_BS_HEADER);
>      break;
>
>    default:

Makes sense.

> @@ -424,9 +415,41 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
>    }
>    return 0;
>
> + REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
> +  struct command *cmd = h->reply_cmd;
> +  uint32_t length;
> +
> +  switch (recv_into_rbuf (h)) {
> +  case -1: SET_NEXT_STATE (%.DEAD); return 0;
> +  case 1:
> +    save_reply_state (h);
> +    SET_NEXT_STATE (%.READY);
> +    return 0;
> +  case 0:
> +    length = be32toh (h->sbuf.sr.structured_reply.length);
> +
> +    assert (cmd); /* guaranteed by CHECK */
> +    assert (cmd->type == NBD_CMD_BLOCK_STATUS);
> +    assert (length >= 12);

All of this matches what we have under
REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES *pre-patch*, so OK. (Also matches
what recv_into_rbuf() does.)

We've not copied the CALLBACK_IS_NOT_NULL() assertion or the
h->meta_valid assertion over from RECV_BS_ENTRIES -- are we saying that
we're going to assert those later anyway, in RECV_BS_ENTRIES? Sounds OK.

> +    length -= sizeof h->sbuf.sr.payload.bs_hdr;

Seems OK, relying on the assertion just above, which in turn relies on
the explicit (length < 12) catch under REPLY.STRUCTURED_REPLY.CHECK.

> +
> +    free (h->bs_entries);
> +    h->bs_entries = malloc (length);
> +    if (h->bs_entries == NULL) {
> +      SET_NEXT_STATE (%.DEAD);
> +      set_error (errno, "malloc");
> +      return 0;
> +    }
> +    h->rbuf = h->bs_entries;
> +    h->rlen = length;
> +    SET_NEXT_STATE (%RECV_BS_ENTRIES);
> +  }
> +  return 0;
> +

This preparation for RECV_BS_ENTRIES is being moved from
REPLY.STRUCTURED_REPLY.CHECK; seems OK.

(Importantly, after storing the "length" we've just decreased by 4 bytes
into "h->rlen", "length" ceases to exist, so we have to re-fetch it in
the next state handler, below. Not shown in the context, but it's being
done, under "case 0".)

>   REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
>    struct command *cmd = h->reply_cmd;
>    uint32_t length;
> +  uint32_t count;
>    size_t i;
>    uint32_t context_id;
>
> @@ -445,15 +468,16 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
>      assert (h->bs_entries);
>      assert (length >= 12);
>      assert (h->meta_valid);
> +    count = (length - sizeof h->sbuf.sr.payload.bs_hdr) / sizeof *h->bs_entries;

I have a slight problem with the pre-patch code here. We keep the
existent assertions (good), but I think the pre-patch RECV_BS_ENTRIES
code misses an assertion. Namely, after the size check (i.e., 12+
bytes), the pre-patch code should have said

      assert ((length-4) & 7) == 0);

emphasizing the explicit check under REPLY.STRUCTURED_REPLY.CHECK.

The pre-patch code relies on this (a) silently by expecting (length/4)
to be an integer (in the mathematical sense), and (b) very silently by
expecting (length/4) to be an *odd* integer >= 3.

>
>      /* Need to byte-swap the entries returned, but apart from that we
>       * don't validate them.
>       */
> -    for (i = 0; i < length/4; ++i)
> +    for (i = 0; i < count; ++i)
>        h->bs_entries[i] = be32toh (h->bs_entries[i]);
>
>      /* Look up the context ID. */
> -    context_id = h->bs_entries[0];
> +    context_id = be32toh (h->sbuf.sr.payload.bs_hdr.context_id);
>      for (i = 0; i < h->meta_contexts.len; ++i)
>        if (context_id == h->meta_contexts.ptr[i].context_id)
>          break;
> @@ -464,7 +488,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
>
>        if (CALL_CALLBACK (cmd->cb.fn.extent,
>                           h->meta_contexts.ptr[i].name, cmd->offset,
> -                         &h->bs_entries[1], (length-4) / 4,
> +                         h->bs_entries, count,
>                           &error) == -1)
>          if (cmd->error == 0)
>            cmd->error = error ? error : EPROTO;

Here's what I suggest as an update for this patch (to be squashed):

diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
index da1e46929cd0..6cd4a49baa26 100644
--- a/generator/states-reply-structured.c
+++ b/generator/states-reply-structured.c
@@ -43,6 +43,20 @@ structured_reply_in_bounds (uint64_t offset, uint32_t length,
   return true;
 }

+static bool
+bs_reply_length_ok (uint32_t length)
+{
+  if (length < (sizeof (struct nbd_structured_reply_block_status_hdr) +
+                sizeof (struct nbd_block_descriptor)))
+    return false;
+
+  length -= sizeof (struct nbd_structured_reply_block_status_hdr);
+  if (length % sizeof (struct nbd_block_descriptor) != 0)
+    return false;
+
+  return true;
+}
+
 STATE_MACHINE {
  REPLY.STRUCTURED_REPLY.START:
   /* We've only read the simple_reply.  The structured_reply is longer,
@@ -123,7 +137,7 @@  REPLY.STRUCTURED_REPLY.CHECK:

   case NBD_REPLY_TYPE_BLOCK_STATUS:
     if (cmd->type != NBD_CMD_BLOCK_STATUS ||
-        length < 12 || ((length-4) & 7) != 0)
+        !bs_reply_length_ok (length))
       goto resync;
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
     /* Start by reading the context ID. */
@@ -430,7 +444,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:

     assert (cmd); /* guaranteed by CHECK */
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
-    assert (length >= 12);
+    assert (bs_reply_length_ok (length));
     length -= sizeof h->sbuf.sr.payload.bs_hdr;

     free (h->bs_entries);
@@ -466,8 +480,11 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
     assert (cmd->type == NBD_CMD_BLOCK_STATUS);
     assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
     assert (h->bs_entries);
-    assert (length >= 12);
+    assert (bs_reply_length_ok (length));
     assert (h->meta_valid);
+    STATIC_ASSERT ((sizeof (struct nbd_block_descriptor) %
+                    sizeof *h->bs_entries) == 0,
+                   _block_desc_is_multiple_of_bs_entry);
     count = (length - sizeof h->sbuf.sr.payload.bs_hdr) / sizeof *h->bs_entries;

     /* Need to byte-swap the entries returned, but apart from that we

Laszlo

