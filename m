Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE5B719FE3
	for <lists+nbd@lfdr.de>; Thu,  1 Jun 2023 16:27:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6B16020AE1; Thu,  1 Jun 2023 14:27:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  1 14:27:16 2023
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
	by bendel.debian.org (Postfix) with ESMTP id B4FA120AA3
	for <lists-other-nbd@bendel.debian.org>; Thu,  1 Jun 2023 14:11:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.251 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NLPsrJEYBH2g for <lists-other-nbd@bendel.debian.org>;
	Thu,  1 Jun 2023 14:11:41 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 2464620A89
	for <nbd@other.debian.org>; Thu,  1 Jun 2023 14:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685628696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HPaSdTlzMrbwJSjAbzRR3qSXNZ9W3gTgKDLxhtFgdc0=;
	b=Q31CzYcABqyAvo8sSP74WEvuISMCD6mFPwLQAM+CYOnuHLVBq/1mpxKQjQSWlDPJnxv0uS
	K02MXABRXH6/Zb8fDXvzQxfoQGRJAttCioqh+0x5OgJl1XAs6ribWipRkdnD7Wci2K2U+i
	ersSSU9uBjVgM3pNoV0KEBBM58GJmmo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-z_kmmKEqPOGUV1v6P3gofw-1; Thu, 01 Jun 2023 10:11:34 -0400
X-MC-Unique: z_kmmKEqPOGUV1v6P3gofw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 66AC7185A78E;
	Thu,  1 Jun 2023 14:11:34 +0000 (UTC)
Received: from [10.39.194.44] (unknown [10.39.194.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACD75C154D7;
	Thu,  1 Jun 2023 14:11:32 +0000 (UTC)
Message-ID: <417aabfe-181b-25e7-5e7e-bea74bdcfa85@redhat.com>
Date: Thu, 1 Jun 2023 16:11:31 +0200
MIME-Version: 1.0
Subject: Re: [Libguestfs] [libnbd PATCH v3 05/22] states: Prepare to receive
 64-bit replies
To: Eric Blake <eblake@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-6-eblake@redhat.com>
 <80c36755-eda3-5d04-1418-89f11f825577@redhat.com>
 <ygzx2g4abau6gaarr4ju2e76jtlobe5z5sw7bqwhglthcy722m@auoe5uw2anv7>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <ygzx2g4abau6gaarr4ju2e76jtlobe5z5sw7bqwhglthcy722m@auoe5uw2anv7>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GjpEb2zKYdK.A.JsF.ErKekB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2523
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/417aabfe-181b-25e7-5e7e-bea74bdcfa85@redhat.com
Resent-Date: Thu,  1 Jun 2023 14:27:16 +0000 (UTC)

On 6/1/23 15:00, Eric Blake wrote:
> On Thu, Jun 01, 2023 at 11:04:05AM +0200, Laszlo Ersek wrote:

>> Probably best to reorder the files in this patch for review:
> 
> I see what you mean: because of the state hierarchy, it is probably
> worth tweaking the git orderfile to favor files nearer the top of the
> state tree first, rather than strict alphabetical ordering of *.c.  I
> may just push a patch for that without needing review, as it doesn't
> affect library semantics at all.

Ouch, I'm sorry, I meant that *I* should rearrange the hunks in the
patch for review! I didn't mean to ask you for any orderfile changes! :)

Of course if you can do that: high five! :)

> 
> ...
>>> +++ b/generator/states-reply.c
>>> @@ -62,15 +62,19 @@  REPLY.START:
>>>     */
>>>    ssize_t r;
>>>
>>> -  /* We read all replies initially as if they are simple replies, but
>>> -   * check the magic in CHECK_SIMPLE_OR_STRUCTURED_REPLY below.
>>> -   * This works because the structured_reply header is larger.
>>> +  /* With extended headers, there is only one size to read, so we can do it
>>> +   * all in one syscall.  But for older structured replies, we don't know if
>>> +   * we have a simple or structured reply until we read the magic number,
>>> +   * requiring a two-part read with CHECK_SIMPLE_OR_STRUCTURED_REPLY below.
>>>     */
>>>    assert (h->reply_cmd == NULL);
>>>    assert (h->rlen == 0);
>>>
>>>    h->rbuf = &h->sbuf.reply.hdr;
>>> -  h->rlen = sizeof h->sbuf.reply.hdr.simple;
>>> +  if (h->extended_headers)
>>> +    h->rlen = sizeof h->sbuf.reply.hdr.extended;
>>> +  else
>>> +    h->rlen = sizeof h->sbuf.reply.hdr.simple;
>>>
>>>    r = h->sock->ops->recv (h, h->sock, h->rbuf, h->rlen);
>>>    if (r == -1) {
>>
>> The comment "This works because the structured_reply header is larger"
>> is being removed, which makes the non-ext branch even less
>> comprehensible than before.
>>
>> (2) Can we add the STATIC_ASSERT() here, stating that "sizeof simple" is
>> smaller than "sizeof structured"?
> 
> Yep, I'm already rebasing onto some additional asserts along those
> lines, based on your reviews earlier in the series.
> 
>>
>>> @@ -116,16 +120,22 @@  REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY:
>>>    uint64_t cookie;
>>>
>>>    magic = be32toh (h->sbuf.reply.hdr.simple.magic);
>>> -  if (magic == NBD_SIMPLE_REPLY_MAGIC) {
>>> +  switch (magic) {
>>> +  case NBD_SIMPLE_REPLY_MAGIC:
>>> +    if (h->extended_headers)
>>> +      goto invalid;
>>>      SET_NEXT_STATE (%SIMPLE_REPLY.START);
>>> -  }
>>> -  else if (magic == NBD_STRUCTURED_REPLY_MAGIC) {
>>> +    break;
>>> +  case NBD_STRUCTURED_REPLY_MAGIC:
>>> +  case NBD_EXTENDED_REPLY_MAGIC:
>>> +    if ((magic == NBD_STRUCTURED_REPLY_MAGIC) == h->extended_headers)
>>
>> Heh, I love this ((a == b) == c) "equivalence" form! :)
> 
> I still do a double-take every time I see 'a < b < c' in languages
> (like python) that support it as shorthand for 'a < b && b < c'.  Even
> weirder is when you see 'a < b > c'.  But yes, C's non-transitive ==
> can be a surprise for the uninitiated.
> 
>>
>>> +      goto invalid;
>>>      SET_NEXT_STATE (%STRUCTURED_REPLY.START);
>>> -  }
>>> -  else {
>>> -    /* We've probably lost synchronization. */
>>> -    SET_NEXT_STATE (%.DEAD);
>>> -    set_error (0, "invalid reply magic 0x%" PRIx32, magic);
>>> +    break;
>>> +  default:
>>> +  invalid:
>>> +    SET_NEXT_STATE (%.DEAD); /* We've probably lost synchronization. */
>>> +    set_error (0, "invalid or unexpected reply magic 0x%" PRIx32, magic);
>>>  #if 0 /* uncomment to see desynchronized data */
>>>      nbd_internal_hexdump (&h->sbuf.reply.hdr.simple,
>>>                            sizeof (h->sbuf.reply.hdr.simple),
>>
>> My apologies, but I find *this* placement of "invalid" terrible. I
>> thought the "goto invalid" statements were jumping to the end of the
>> function. Now I see they jump effectively to another case label.
>>
>> (3) How about this (on top of your patch, to be squashed):
> 
> That part of the patch pre-dates other reviews I've seen from you on
> the same topic (this patch series has been percolating on my local
> builds for a long time), so I'm not surprised by your request, and I'm
> happy to squash in your improvement.  I may have copied from other
> similar code in the generator/states-*.c files, if so, I'll probably
> do a separate cleanup patch first.
> 
>>
>> ... At the same time, even with this "cleanup" for the labels, I find it
>> relatively confusing (albeit correct, as far as I can tell!) that in
>> REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY, we first check the magic
>> number(s) and *then* whether we negotiated extended headers, whereas in
>> all the other state handlers, the order (= condition nesting) is the
>> opposite: we first check extended headers, and deal with any other
>> objects second. This makes the assert()s in REPLY.STRUCTURED_REPLY.START
>> especially tricky to demonstrate -- I think I've managed to do it, it
>> looks correct, it's just hard. So that's a half- (or quarter-)hearted
>> proposal to investigate how REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY
>> looked if there too, "extended_headers" were the outer check. Anyway, I
>> don't feel strongly about this. :)
>>
>> (4) Still in REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY, we have a comment
>> saying
>>
>>    /* NB: This works for both simple and structured replies because the
>>     * handle (our cookie) is stored at the same offset.
>>     */
>>
>> The code under it applies to extended headers too, so the comment should
>> be updated.
>>
>> (There's a similar comment in REPLY.FINISH_COMMAND, too; I'm not sure if
>> that state is relevant for extended headers.)
> 
> Indeed, when rebasing, I need to remember to grep (to cover comments)
> rather than merely relying on the compiler (which only covers code)
> for renames.
> 
>>
>> Then:
>>
>>> diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
>>> index df509216..c53aed7b 100644
>>> --- a/generator/states-reply-structured.c
>>> +++ b/generator/states-reply-structured.c
>>> @@ -45,14 +45,20 @@ structured_reply_in_bounds (uint64_t offset, uint32_t length,
>>>
>>>  STATE_MACHINE {
>>>   REPLY.STRUCTURED_REPLY.START:
>>> -  /* We've only read the simple_reply.  The structured_reply is longer,
>>> -   * so read the remaining part.
>>> +  /* If we have extended headers, we've already read the entire header.
>>> +   * Otherwise, we've only read enough for a simple_reply; since structured
>>> +   * replies are longer, read the remaining part.
>>>     */
>>
>> (5) Ah, the word "simple_reply", which this change preserves, is a
>> leftover. It should be updated in patch#2, "internal: Refactor layout of
>> replies in sbuf", where the "simple_reply" field is replaced with
>> "reply.hdr.simple" in "sbuf".
>>
>> I guess I didn't notice this omission in patch#2 because the context
>> there only shows the "so read the remaining part" line of the comment,
>> and "simple_reply" is on the preceding line.
>>
>> And then this patch too should refer to "reply.hdr.simple", in the new
>> comment.
>>
>> Alternatively, perhaps use the type name (struct tag, actually):
>> "nbd_simple_reply".
> 
> Will fix in the appropriate place(s).
> 
>>
>>> -  h->rbuf = &h->sbuf;
>>> -  h->rbuf = (char *)h->rbuf + sizeof h->sbuf.reply.hdr.simple;
>>> -  h->rlen = sizeof h->sbuf.reply.hdr.structured;
>>> -  h->rlen -= sizeof h->sbuf.reply.hdr.simple;
>>> -  SET_NEXT_STATE (%RECV_REMAINING);
>>> +  if (h->extended_headers) {
>>> +    assert (h->rbuf == sizeof h->sbuf.reply.hdr.extended + (char*)&h->sbuf);
>>> +    SET_NEXT_STATE (%CHECK);
>>> +  }
>>> +  else {
>>> +    assert (h->rbuf == sizeof h->sbuf.reply.hdr.simple + (char*)&h->sbuf);
>>> +    h->rlen = sizeof h->sbuf.reply.hdr.structured -
>>> +      sizeof h->sbuf.reply.hdr.simple;
>>> +    SET_NEXT_STATE (%RECV_REMAINING);
>>> +  }
>>>    return 0;
>>>
>>>   REPLY.STRUCTURED_REPLY.RECV_REMAINING:
>>
>> This looks OK, but can we make it less verbose? How about:
>>
>> /----------------------
>> | diff --git a/lib/internal.h b/lib/internal.h
>> | index e4e21a4d1ffa..a630b2511ff7 100644
>> | --- a/lib/internal.h
>> | +++ b/lib/internal.h
>> | @@ -240,7 +240,7 @@ struct nbd_handle {
>> |      } or;
>> |      struct nbd_export_name_option_reply export_name_reply;
>> |      struct {
>> | -      union {
>> | +      union reply_header {
> 
> Oh cool.  I keep forgetting that you can declare a type name usable at
> the top level even while declaring a nested struct.  Yeah, doing that
> probably has some nice line length improvements.
> 
>> |          struct nbd_simple_reply simple;
>> |          struct nbd_structured_reply structured;
>> |          struct nbd_extended_reply extended;
>> | diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
>> | index c53aed7bb859..852cb5b6053c 100644
>> | --- a/generator/states-reply-structured.c
>> | +++ b/generator/states-reply-structured.c
>> | @@ -49,14 +49,14 @@  REPLY.STRUCTURED_REPLY.START:
>> |     * Otherwise, we've only read enough for a simple_reply; since structured
>> |     * replies are longer, read the remaining part.
>> |     */
>> | +  union reply_header *hdr = &h->sbuf.reply.hdr;
>> |    if (h->extended_headers) {
>> | -    assert (h->rbuf == sizeof h->sbuf.reply.hdr.extended + (char*)&h->sbuf);
>> | +    assert (h->rbuf == sizeof hdr->extended + (char*)&h->sbuf);
>> |      SET_NEXT_STATE (%CHECK);
>> |    }
>> |    else {
>> | -    assert (h->rbuf == sizeof h->sbuf.reply.hdr.simple + (char*)&h->sbuf);
>> | -    h->rlen = sizeof h->sbuf.reply.hdr.structured -
>> | -      sizeof h->sbuf.reply.hdr.simple;
>> | +    assert (h->rbuf == sizeof hdr->simple + (char*)&h->sbuf);
>> | +    h->rlen = sizeof hdr->structured - sizeof hdr->simple;
>> |      SET_NEXT_STATE (%RECV_REMAINING);
>> |    }
>> |    return 0;
>> \----------------------
>>
>> Anyway, feel free to ignore this -- I can see two counter-arguments
>> myself:
>>
>> - the rest of the code remains just as verbose,
>>
> 
> Not necessarily - once I add in more STATIC_ASSERTs, being able to
> refer to individual nested types without having to go all the way
> through struct nbd_handle or union sbuf will be shorter.
> 
>> - one could argue that the addition
>>
>>     sizeof hdr->simple + (char*)&h->sbuf
>>
>>   is *more* confusing than
>>
>>     sizeof h->sbuf.reply.hdr.simple + (char*)&h->sbuf
> 
> That argument still remains - it's easier to see that we expect a
> particular offset from sbuf when the use of sbuf in the offset
> calculation is not hidden several lines away in the intermediate
> initialization.   I'll think about it for this line.
> 
>>
>> Then:
>>
>>> @@ -69,11 +75,18 @@  REPLY.STRUCTURED_REPLY.RECV_REMAINING:
>>>   REPLY.STRUCTURED_REPLY.CHECK:
>>>    struct command *cmd = h->reply_cmd;
>>>    uint16_t flags, type;
>>> -  uint32_t length;
>>> +  uint64_t length;
>>> +  uint64_t offset = -1;
>>
>> (6) I disagree with initializing the local variable "offset" here.
>>
>> Below (in the rest of REPLY.STRUCTURED_REPLY.CHECK), we only read
>> "offset" back if "extended_headers" is set. But if "extended_headers" is
>> set, we also store a value to "offset", before the read.
>>
>> Initializing "offset" to -1 suggests that the code might otherwise read
>> an indeterminate value from "offset" -- but that's not the case.
> 
> I'll have to double-check; I thought that offset was read even for
> structured replies (where there really isn't an offset read from the
> wire), but my rebasing efforts may have changed that.
> 
>>
>>>
>>> +  assert (cmd);
>>
>> (7) What guarantees this?
>>
>> Is it the lookup code at the end of
>> REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY?
>>
>> But that code can set "reply_cmd" to NULL, in case the cookie is not
>> found; and the cookie lookup there defers to FINISH for diagnosing the
>> unassociated reply.
> 
> Hmmm.  Reading ahead, I see what you wrote in (9).  This may have been
> something I copied from other states, but I'll have to double check
> whether it still makes sense.
> 
>>
>>>    flags = be16toh (h->sbuf.reply.hdr.structured.flags);
>>>    type = be16toh (h->sbuf.reply.hdr.structured.type);
>>> -  length = be32toh (h->sbuf.reply.hdr.structured.length);
>>> +  if (h->extended_headers) {
>>> +    length = be64toh (h->sbuf.reply.hdr.extended.length);
>>> +    offset = be64toh (h->sbuf.reply.hdr.extended.offset);
>>> +  }
>>> +  else
>>> +    length = be32toh (h->sbuf.reply.hdr.structured.length);
>>>
>>>    /* Reject a server that replies with too much information, but don't
>>>     * reject a single structured reply to NBD_CMD_READ on the largest
>>> @@ -83,13 +96,18 @@  REPLY.STRUCTURED_REPLY.CHECK:
>>>     * not worth keeping the connection alive.
>>>     */
>>>    if (length > MAX_REQUEST_SIZE + sizeof h->sbuf.reply.payload.offset_data) {
>>> -    set_error (0, "invalid server reply length %" PRIu32, length);
>>> +    set_error (0, "invalid server reply length %" PRIu64, length);
>>>      SET_NEXT_STATE (%.DEAD);
>>>      return 0;
>>>    }
>>> +  /* For convenience, we now normalize extended replies into compact,
>>> +   * doable since we validated that payload length fits in 32 bits.
>>> +   */
>>> +  h->sbuf.reply.hdr.structured.length = length;
>>
>> (8) I'm very confused by this. For an extended reply, this will
>> overwrite the "offset" field.
> 
> At one point, I considered normalizing in the opposite direction (take
> structured replies and widen them into the extended header form); it
> required touching more lines of code, so I didn't pursue it at the
> time.  But I can see how compressing things down (intentionally
> throwing away information we will no longer reference) can be
> confusing without good comments, so at a minimum, I will be adding
> comments, if not outright going with the widening rather than
> narrowing approach.
> 
>>
>> I understand we have stolen that field already, above; but that's little
>> solace, especially without specific comments.
>>
>>>
>>>    /* Skip an unexpected structured reply, including to an unknown cookie. */
>>> -  if (cmd == NULL || !h->structured_replies)
>>> +  if (cmd == NULL || !h->structured_replies ||
>>> +      (h->extended_headers && offset != cmd->offset))
>>>      goto resync;
>>>
>>>    switch (type) {
>>
>> (9) Preserving the (cmd == NULL) sub-condition, plus the reference to
>> "unkown cookie" in the comment, looks like a logic bug to me: it can
>> never evaluate to "true", given the assert() I'm questioning above at
>> (7).
>>
>> Alternatively, the assert() is wrong.
> 
> Off-hand, I think the assert is correct and I do have a dead condition
> here; but I'll have to convince myself of that.  Since the condition
> is pre-existing, it may be worth a separate patch adding just the
> assertion and removing the 'cmd == NULL' check here, if it is correct.
> 
>>
>> (10) The comment only talks about "unexpected structured reply", but the
>> condition now deals with extended headers too, and I don't know how
>> those relate to each other.
>>
>> What I'm trying to express is that
>>
>> (a) checking "structured_replies" *here*, but
>>
>> (b) checking "extended_headers" against magic numbers in
>> REPLY.CHECK_SIMPLE_OR_STRUCTURED_REPLY,
>>
>> at the same time, seems inconsistent. If we get a structured reply after
>> *not* having negotiated them, we should be able to catch that in the
>> exact same location -- i.e., where we check magic numbers -- where we
>> can also realize that we're getting an extended reply in spite of *not*
>> having negotiated *those*.
>>
>> In other words, the treatment differs, and I don't know why: if we get
>> an unexpected structured reply, we skip it and "resync", whereas if we
>> get an unexpected extended reply, we move to the DEAD state.
>>
>> I think it's fine to skip replies that refer to unknown cookies, but
>> *reply format* violations should be fatal.
> 
> I think this all stems from me trying to be as generous as possible
> with bad servers: if we get a wrong reply type per the protocol but it
> is a reply type we know how to handle, AND we haven't consumed too
> many bytes for the size of that reply, then we can tolerate the
> server's bug.  If it is the wrong type, and we already read too many
> bytes for what the right type would be, we can't (easily) undo the
> fact that we read too much.
> 
> If we did not negotiate extended headers, we start by reading the
> length of a simple header; if the magic says it was instead an
> extended header, we can tolerate the server's mistake by reading the
> rest of that packet.  But I definitely see your point about
> consolidating the decisions to be local to one state, rather than
> split across two files, and aiming for consistent handling.

Right, I found your note about commit b31e7bac in patch#6, and I found
it hard to agree with the motivation behind it :) When reading patch#6,
I immediately felt it was somehow related to my point (10) here, under
patch#5. I couldn't figure out how exactly though, as the affected files
were different!

> 
> I'm liking your idea earlier in the series about reworking the state
> engine to FULLY parse the header (whether simple, structured, or
> extended) in states-reply.c, and only then move to
> states-reply-structured.c if the header was structured or extended,
> rather than splitting the header parse across two files.

I don't want to generate unnecessary work for you, but you too might
find future maintenance easier this way. From my perspective, I already
have to ping-pong between these two C files; not easy. :)

> 
>>
>>
>> Then, this is not a request for an update, just a comment: I don't
>> understand why the spec introduced the "offset" field at all. It does
>> not seem to carry additional information beyond the cookie. So we can
>> certainly check that the response's offset matches the command's offset
>> (the code looks OK), but the larger purpose is unclear. (And this is
>> probably also the reason why you get away with corrupting
>> "nbd_extended_reply.offset" at (8) -- the field is never again needed,
>> beyond the sanity check performed here.)
> 
> The evolution of that field: in my first draft, I wanted power-of-2
> sizing to the reply header (both request and reply having a header of
> exactly 32 bytes); this left dead space in the reply packet, which I
> originally tried to mandate to be zero-filled.  But when looking at
> the types again, I noticed that if the 'offset' field occupies the
> same relative place in the request and reply struct, a server can
> rewrite the reply in the same memory as it had saved for the request
> (I don't know that I actually implemented it that way in qemu as
> server, but it is possible for some other server).
> 
> There's also NBD_REPLY_TYPE_OFFSET_DATA and NBD_REPLY_TYPE_OFFSET_HOLE
> (used in response to NBD_CMD_READ), which each return an offset field
> in order to handle the case where a single client read request was
> split across multiple server replies.  When we first specified
> structured replies, the spec was ambiguous: if I issue
> NBD_CMD_READ(length=1k, offset=0) but the server replies with the pair
> OFFSET_DATA(length=512, offset=0) and OFFSET_HOLE(length=512,
> offset=512), it's obvious how to reconstruct the original buffer (read
> into the first 512 bytes, memset the second 512 bytes).  But if I
> issue NBD_CMD_READ(length=1k, offset=512), should the server reply
> OFFSET_DATA(length=512, offset=512) and OFFSET_HOLE(length=512,
> offset=1k) (that is, the reply offsets are absolute to the overall
> image), or with OFFSET_DATA(length=512, offset=0) and
> OFFSET_HOLE(length=512, offset=512) (that is, the reply offsets are
> relative to the start of the 1k buffer of the read request)?  The
> initial implementations of qemu and nbdkit disagreed, and the spec
> ended up settling in favor of the former (see nbd.git commit
> 587ba722).

Interesting: while reading your comparison, I immediately found the read
request relative reply offsets far-fetched and cumbersome, and the
absolute reply offsets "natural". :)

> 
> As a result, when receiving an absolute offset in a data reply, the
> client has to place the data into buffer + (reply_offset -
> request_offset) (that is, convert the server's absolute offset back
> into a buffer-relative offset), which requires knowing what the
> reqeust offset was; having the server return this offset in extended
> replies may make it easier to implement a client that doesn't have to
> store its request offset separately.  Since libnbd also handles
> non-extended headers (and has to hang on to the request offset for
> those), you are right that we end up merely validating that the
> server's reply offset was expected, and then throwing it away as it
> didn't add anything further than a validation that we haven't lost
> sync with the server.

Thanks for clarifying! So a less "legacy compatible" NBD client could
insist on extended headers (refuse working with servers not providing
extended headers), and then such a client might need the "offset" field
for real.

(On a tangent: I wonder if it were *secure* to trust the server's
"offset" field in the reply, for addressing client memory!)

> 
>>
>>> @@ -168,7 +186,7 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR:
>>>      SET_NEXT_STATE (%.READY);
>>>      return 0;
>>>    case 0:
>>> -    length = be32toh (h->sbuf.reply.hdr.structured.length);
>>> +    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
>>>      assert (length >= sizeof h->sbuf.reply.payload.error.error.error);
>>>      assert (cmd);
>>>
>>> @@ -207,7 +225,7 @@  REPLY.STRUCTURED_REPLY.RECV_ERROR_MESSAGE:
>>>      SET_NEXT_STATE (%.READY);
>>>      return 0;
>>>    case 0:
>>> -    length = be32toh (h->sbuf.reply.hdr.structured.length);
>>> +    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
>>>      msglen = be16toh (h->sbuf.reply.payload.error.error.len);
>>>      type = be16toh (h->sbuf.reply.hdr.structured.type);
>>>
>>> @@ -307,7 +325,7 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_DATA:
>>>      SET_NEXT_STATE (%.READY);
>>>      return 0;
>>>    case 0:
>>> -    length = be32toh (h->sbuf.reply.hdr.structured.length);
>>> +    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
>>>      offset = be64toh (h->sbuf.reply.payload.offset_data.offset);
>>>
>>>      assert (cmd); /* guaranteed by CHECK */
>>> @@ -346,7 +364,7 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_DATA_DATA:
>>>      SET_NEXT_STATE (%.READY);
>>>      return 0;
>>>    case 0:
>>> -    length = be32toh (h->sbuf.reply.hdr.structured.length);
>>> +    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
>>>      offset = be64toh (h->sbuf.reply.payload.offset_data.offset);
>>>
>>>      assert (cmd); /* guaranteed by CHECK */
>>> @@ -426,7 +444,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
>>>      SET_NEXT_STATE (%.READY);
>>>      return 0;
>>>    case 0:
>>> -    length = be32toh (h->sbuf.reply.hdr.structured.length);
>>> +    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
>>>
>>>      assert (cmd); /* guaranteed by CHECK */
>>>      assert (cmd->type == NBD_CMD_BLOCK_STATUS);
>>> @@ -460,7 +478,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
>>>      SET_NEXT_STATE (%.READY);
>>>      return 0;
>>>    case 0:
>>> -    length = be32toh (h->sbuf.reply.hdr.structured.length);
>>> +    length = h->sbuf.reply.hdr.structured.length; /* normalized in CHECK */
>>>
>>>      assert (cmd); /* guaranteed by CHECK */
>>>      assert (cmd->type == NBD_CMD_BLOCK_STATUS);
>>
>> (11) This is all fallout from (8). The commit message does document it
>> (in the first paragraph), but I don't understand where we *benefit* from
>> stuffing "nbd_extended_reply.length" into "nbd_structured_reply.length".
> 
> The benefit is that all later code only has to deal with
> nbd_structured_reply (rather than adding yet more 'if
> (h->extended_reply)' in all subsequent states).  Conversely, if I had
> widened instead of narrowed, then all later code would only need to
> doea with nbd_extended_reply.

Hmmm. That's a good point. I guess I didn't think of it because it would
mean (for example) handling extended block descriptors in a payload that
*seemingly* followed a structured (not extended) reply header.

I've not yet gotten used to the idea that header and payload are going
to be treated independently, after initial consistency checks.

> 
>>
>> Regarding downsides thereof, I can see two:
>>
>> - as I mentioned, "nbd_extended_reply.offset" becomes unusable,
>>
>> - "nbd_structured_reply.length" will no longer be big-endian but
>>   host-endian, which arguably does not match the other fields'
>>   endianness in the scratch space (= sbuf).
>>
>> I feel this back-stuffing brings the stashed header into an inconsistent
>> state that is specific to a subset of the automaton's states.
>>
>> I'd rather introduce an entirely new field to "sbuf.reply" -- between
>> "sbuf.reply.hdr" and "sbuf.reply.payload" --, if we really need to cache
>> a host-endian length value, regardless of which kind of reply header we
>> got.
> 
> You may be on to something.  Leaving the wire reply ALWAYS in network
> endian order, and adding a few bytes to nbd_reply to stash a
> normalized host-endian decoded value, would certainly be less
> confusing than having to figure out "which parts of my wire reply are
> still network-endian vs. natively converted".  It may make the overall
> structure a few bytes larger, but that's probably in the noise (since
> our nbd_handle already accomodatese maximum-length NBD strings of 4k,
> adding up to another 32 bytes for fully-normalized host-endian form
> isn't bad).  I'll keep that in mind for v4 (this is not the only place
> that needs normalization; handling 32- vs. 64-bit block status replies
> also needs normalization; the tradeoff between minimal storage by
> normalizing in place vs. maintainability by normalizing into a copy
> has interesting implications).
> 

Thanks!
Laszlo

