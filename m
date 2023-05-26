Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED5071275E
	for <lists+nbd@lfdr.de>; Fri, 26 May 2023 15:19:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3AB5C2048C; Fri, 26 May 2023 13:19:45 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May 26 13:19:45 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,SARE_MSGID_LONG45,
	SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DBE472049E
	for <lists-other-nbd@bendel.debian.org>; Fri, 26 May 2023 13:19:33 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.732 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hncYdL9UYYmY for <lists-other-nbd@bendel.debian.org>;
	Fri, 26 May 2023 13:19:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id C45E42047D
	for <nbd@other.debian.org>; Fri, 26 May 2023 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685107160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jth1+/6xCctT8NTYtXHl3+3Z6cOKIsHZtAPXL0t6OKM=;
	b=Lr67m8IUN07CtcR5mThwh6HT7D1UVWkMG4/5k6ZJDCNuV5sVvWRT6ALuyjKbSZe4vNSAgo
	HeK68Fomb8oWKT6mUeXRcRLCCQXBzI/1UioyXFiKwQuREdhCZIEd+fHv1mPwthdWCb7R3n
	KLF5urYcYtvo+eIgvgu5IciJ+HI0SqY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-adYTMACWPmit5T6sLE2jtg-1; Fri, 26 May 2023 09:19:17 -0400
X-MC-Unique: adYTMACWPmit5T6sLE2jtg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB329296A612;
	Fri, 26 May 2023 13:19:16 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E0440C6CCF;
	Fri, 26 May 2023 13:19:16 +0000 (UTC)
Date: Fri, 26 May 2023 08:19:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 01/22] block_status: Refactor
 array storage
Message-ID: <j4t3spjcuw3qefezh4dkd3zi7husbz64rxzq35hd367ovwbbbf@mqurreepuc6w>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-2-eblake@redhat.com>
 <6cff3a35-9cbc-4781-f531-b7c651eede9e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6cff3a35-9cbc-4781-f531-b7c651eede9e@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JLoqBiCbRBM.A.w6G.xHLckB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2502
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/j4t3spjcuw3qefezh4dkd3zi7husbz64rxzq35hd367ovwbbbf@mqurreepuc6w
Resent-Date: Fri, 26 May 2023 13:19:45 +0000 (UTC)

On Thu, May 25, 2023 at 06:30:37PM +0200, Laszlo Ersek wrote:
> On 5/25/23 15:00, Eric Blake wrote:
> > For 32-bit block status, we were able to cheat and use an array with
> > an odd number of elements, with array[0] holding the context id, and
> > passing &array[1] to the user's callback.  But once we have 64-bit
> > extents, we can no longer abuse array element 0 like that, for two
> > reasons: 64-bit extents contain uint64_t which might not be
> > alignment-compatible with an array of uint32_t on all architectures,
> > and the new NBD_REPLY_TYPE_BLOCK_STATUS_EXT adds an additional count
> > field before the array.
> >
> > +++ b/generator/states-reply-structured.c
> > @@ -126,19 +126,10 @@  REPLY.STRUCTURED_REPLY.CHECK:
> >          length < 12 || ((length-4) & 7) != 0)
> 
> This is important (the context doesn't show it in full): we're under
> NBD_REPLY_TYPE_BLOCK_STATUS here (nested under
> REPLY.STRUCTURED_REPLY.CHECK), and we enforce that
> 
>   length = be32toh (h->sbuf.sr.structured_reply.length);
> 
> contains the context_id (4 bytes), plus a positive integral number of
> block descriptor structures (8 bytes each).

And when 64-bit replies are added, there's a counterpart that contains
a header (4+4 bytes) and then a positive integral number of block
descriptors (16 bytes each).

> > @@ -445,15 +468,16 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
> >      assert (h->bs_entries);
> >      assert (length >= 12);
> >      assert (h->meta_valid);
> > +    count = (length - sizeof h->sbuf.sr.payload.bs_hdr) / sizeof *h->bs_entries;
> 
> I have a slight problem with the pre-patch code here. We keep the
> existent assertions (good), but I think the pre-patch RECV_BS_ENTRIES
> code misses an assertion. Namely, after the size check (i.e., 12+
> bytes), the pre-patch code should have said
> 
>       assert ((length-4) & 7) == 0);
> 
> emphasizing the explicit check under REPLY.STRUCTURED_REPLY.CHECK.
> 
> The pre-patch code relies on this (a) silently by expecting (length/4)
> to be an integer (in the mathematical sense), and (b) very silently by
> expecting (length/4) to be an *odd* integer >= 3.

Likewise, once 64-bit replies are added, we will depend on (h->len/8)
being an *odd* integer >= 3, but additionally that the count in the
header match the (h->len-8)/16 computation.

> 
> Here's what I suggest as an update for this patch (to be squashed):
> 
> diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
> index da1e46929cd0..6cd4a49baa26 100644
> --- a/generator/states-reply-structured.c
> +++ b/generator/states-reply-structured.c
> @@ -43,6 +43,20 @@ structured_reply_in_bounds (uint64_t offset, uint32_t length,
>    return true;
>  }
> 
> +static bool
> +bs_reply_length_ok (uint32_t length)
> +{
> +  if (length < (sizeof (struct nbd_structured_reply_block_status_hdr) +
> +                sizeof (struct nbd_block_descriptor)))
> +    return false;
> +
> +  length -= sizeof (struct nbd_structured_reply_block_status_hdr);
> +  if (length % sizeof (struct nbd_block_descriptor) != 0)
> +    return false;
> +
> +  return true;
> +}

This is only valid for the 32-bit reply; but could easily be
generalized to cover the 64-bit reply as well.  I definitely like
wrapping the computation behind a helper function, so that we don't
have to open-code repeat it in multiple spots.

I could even go with doing this sort of cleanup as its own
prerequisite patch instead of squashing it in with this one,
because....

> +
>  STATE_MACHINE {
>   REPLY.STRUCTURED_REPLY.START:
>    /* We've only read the simple_reply.  The structured_reply is longer,
> @@ -123,7 +137,7 @@  REPLY.STRUCTURED_REPLY.CHECK:
> 
>    case NBD_REPLY_TYPE_BLOCK_STATUS:
>      if (cmd->type != NBD_CMD_BLOCK_STATUS ||
> -        length < 12 || ((length-4) & 7) != 0)
> +        !bs_reply_length_ok (length))
>        goto resync;

...that does indeed look easier to read.

> @@ -466,8 +480,11 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
>      assert (cmd->type == NBD_CMD_BLOCK_STATUS);
>      assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
>      assert (h->bs_entries);
> -    assert (length >= 12);
> +    assert (bs_reply_length_ok (length));
>      assert (h->meta_valid);
> +    STATIC_ASSERT ((sizeof (struct nbd_block_descriptor) %
> +                    sizeof *h->bs_entries) == 0,
> +                   _block_desc_is_multiple_of_bs_entry);
>      count = (length - sizeof h->sbuf.sr.payload.bs_hdr) / sizeof *h->bs_entries;

That static assertion also makes sense.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

