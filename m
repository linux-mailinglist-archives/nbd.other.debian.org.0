Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ACE7168A2
	for <lists+nbd@lfdr.de>; Tue, 30 May 2023 18:06:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1643E207B8; Tue, 30 May 2023 16:06:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 30 16:06:13 2023
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
	by bendel.debian.org (Postfix) with ESMTP id 7BAE12079B
	for <lists-other-nbd@bendel.debian.org>; Tue, 30 May 2023 15:48:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yD-LvVb8wgWv for <lists-other-nbd@bendel.debian.org>;
	Tue, 30 May 2023 15:48:36 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id D46F7206EE
	for <nbd@other.debian.org>; Tue, 30 May 2023 15:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685461710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsoS4BpG17PWCrclm03swQfPiUFnDJP0GMa+GN9JW6M=;
	b=VJ1AdFCx8otINBHxautKy9HycJTtvlRLVfEPt/20WHWQ29ffJpDKcPl6vK10sMHm7+YoF0
	CRUONCjx5gt9BqlGGPAc7rZnA89Il0eec+4bZwyZujJy59q45QPKsTOUcfLUb6pzUQ1eUm
	6xH1rogXplwAdWnc6KtGlG1uxqY/hk0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-o3_-g-MFOk-VTgqbg4vkgw-1; Tue, 30 May 2023 11:48:27 -0400
X-MC-Unique: o3_-g-MFOk-VTgqbg4vkgw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8101C8039CC;
	Tue, 30 May 2023 15:48:27 +0000 (UTC)
Received: from [10.39.195.136] (unknown [10.39.195.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E3C92166B25;
	Tue, 30 May 2023 15:48:26 +0000 (UTC)
Message-ID: <7f186cd0-b42e-7a20-2946-39ffecd23383@redhat.com>
Date: Tue, 30 May 2023 17:48:25 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 03/22] protocol: Add definitions
 for extended headers
To: Wouter Verhelst <w@uter.be>
Cc: Eric Blake <eblake@redhat.com>, libguestfs@redhat.com,
 qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-4-eblake@redhat.com>
 <2b98a2ca-62d5-c87b-2a37-1a49af89b4b4@redhat.com>
 <ZHYOgQAL3ELxr1S9@pc220518.home.grep.be>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <ZHYOgQAL3ELxr1S9@pc220518.home.grep.be>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <SuvTM5U7ggD.A.WVF.07hdkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2512
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/7f186cd0-b42e-7a20-2946-39ffecd23383@redhat.com
Resent-Date: Tue, 30 May 2023 16:06:13 +0000 (UTC)

On 5/30/23 16:56, Wouter Verhelst wrote:
> On Tue, May 30, 2023 at 01:50:59PM +0200, Laszlo Ersek wrote:
>> On 5/25/23 15:00, Eric Blake wrote:

>>> +struct nbd_structured_reply_block_status_ext_hdr {
>>> +  uint32_t context_id;          /* metadata context ID */
>>> +  uint32_t count;               /* length of following array */
>>
>> (1) I think that "length of following array" is confusing here. Per
>> spec, this is "descriptor count" -- that's clearer. "Length" could be
>> mistaken for "number of bytes".
>>
>> Also, what was the justification for *not* making "count" uint64_t?
>> (Just asking.) I do understand a server is permitted to respond with a
>> block status reply that covers less than the requested range, so I
>> understand a server, if it needs to, *can* truncate its response for the
>> sake of fitting "count" into a uint32_t.
> 
> This is, as you say, the number of block descriptor messages we are
> going to send to the client. Each such message is at 8 bytes long.

16 bytes, isn't it? (uint64_t length, uint64_t status_flags)

> That would mean that by the time you overflow a uint32_t with the number
> of extents that are to be sent, you'll be promising to send 2^32 * 8
> (i.e., 2^36) bytes of data, or 32 GiB.

(Or 64 GiB if we agree that sizeof(nbd_block_descriptor_ext)=16.)

But... yes, I'm aware this is exorbitant, practically speaking.

My concern was that "practical considerations" must have been what led
to the original 32-bit-only:

struct nbd_block_descriptor {
  uint32_t length;              /* length of block */
  uint32_t status_flags;        /* block type (hole etc) */
} NBD_ATTRIBUTE_PACKED;

which is now proving too restrictive (being the basis for this entire
work, IIUC).

A 2^(32+9) B = 2 TB image is not unthinkable. If the image used 512B
sectors, and sectors alternated between being a hole and being
allocated, then 2^32 extended descriptors would be justified.

May not be practical, but that's "policy"; the "mechanism" could still
exist (if it doesn't come with undesirable costs).

> That would be a ridiculously amount of data, and no user is going to
> wait for a client to finish parsing that amount of data without a hard
> reboot of their client.

Over a 10gbit/s connection, transferring 64GB should take on the order
of a minute.

... *parsing* 4.3 billion entries is a different matter, of course ;)

OK!

> The only change that would be reasonable here is to reduce the size of
> this field 16 to bits, rather than increasing it (but then we lose
> alignment, so that's also not a good idea)

Putting aside alignment even, I don't understand why reducing "count" to
uint16_t would be reasonable. With the current 32-bit-only block
descriptor, we already need to write loops in libnbd clients, because we
can't cover the entire remote image in one API call [*]. If I understood
Eric right earlier, the 64-bit extensions were supposed to remedy that
-- but as it stands, clients will still need loops ("chunking") around
block status fetching; is that right?

Let me emphasize again that I'm not challenging the spec; also I don't
secretly wish for the patches to do more than required by the spec. I
guess I'd like to understand the intent of the spec, plus the
consequences for client applications.

[*] References (in this order!):

- https://github.com/libguestfs/virt-v2v/commit/27c056cdc6aa0
- https://gitlab.com/nbdkit/libnbd/-/commit/0e714a6e06e6
- https://github.com/libguestfs/virt-v2v/commit/a2afed32d8b1f

To be less cryptic, the first commit added "chunked" block status
fetching to virt-v2v. Because our OCaml language libnbd mappings weren't
proper at the time, that loop could move backwards and get stuck. We
fixed that in the second commit (regarding the bindings) and then
adapted virt-v2v's loop to the fixed bindings in the thirds commit. I've
been hoping that such complexities could be eliminated in the future by
virtue of not having to "chunk" the block status fetching.

(

BTW I'm foreseeing a problem: if the extended block descriptor can
provide an unsigned 64-bit length, we're going to have trouble exposing
that in OCaml, because OCaml only has signed 64-bit integers. So that's
going to reproduce the same issue, only for OCaml callers of the *new* API.

I can see Eric's series includes patches like "ocaml: Add example for
64-bit extents" -- I've not looked at those yet; for now I'm just
wondering what tricks we might need in the bindings generator. The
method seen in the "middle patch" above won't work; we don't have a
native OCaml "i128" type for example that we could use as an escape
hatch, for representing C's uint64_t.

)

Thanks!
Laszlo

