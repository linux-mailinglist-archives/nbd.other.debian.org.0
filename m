Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 979FE729EDC
	for <lists+nbd@lfdr.de>; Fri,  9 Jun 2023 17:43:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 72F532053E; Fri,  9 Jun 2023 15:43:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun  9 15:43:08 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SARE_MSGID_LONG45,
	SARE_MSGID_LONG50,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3957C204CA
	for <lists-other-nbd@bendel.debian.org>; Fri,  9 Jun 2023 15:42:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.47 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	SARE_MSGID_LONG45=0.893, SARE_MSGID_LONG50=0.726,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4dMNwa0uHaFO for <lists-other-nbd@bendel.debian.org>;
	Fri,  9 Jun 2023 15:42:38 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id E8C27204ED
	for <nbd@other.debian.org>; Fri,  9 Jun 2023 15:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686325352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1fmPNT/5lPAfucN6yNxCeTLf8WrPZI4/TYfC7PJhFuI=;
	b=UdM8j5pROUtYwqLTN8/v6EhBr/WXpkuo0GdAJo+nN+8PRpQhL8VJWsYZJkNOW0SwoUfDuz
	Mr0YmptYaqzeluG9maz4XGZ9nOC+l4YBDAXhlw5GwbPhT9QhoEsJXeDQSv0iop5oxGuLFQ
	LlBJpCnw+ZhQS9MTvUhwC6xxPsDFuWg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-Dd7qdd1wO9KHIrmdyVYm6A-1; Fri, 09 Jun 2023 11:42:28 -0400
X-MC-Unique: Dd7qdd1wO9KHIrmdyVYm6A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BE67101AA42;
	Fri,  9 Jun 2023 15:42:28 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF3702166B26;
	Fri,  9 Jun 2023 15:42:27 +0000 (UTC)
Date: Fri, 9 Jun 2023 10:42:25 -0500
From: Eric Blake <eblake@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: libguestfs@redhat.com, qemu-block@nongnu.org, nbd@other.debian.org
Subject: Re: [Libguestfs] [libnbd PATCH v3 08/22] block_status: Track 64-bit
 extents internally
Message-ID: <7lprewziqct35pgautpbuzgdrei7h6q36luam4uzkie445fjlm@sn7r4zl3m3pf>
References: <20230525130108.757242-1-eblake@redhat.com>
 <20230525130108.757242-9-eblake@redhat.com>
 <b3c08e33-24f0-2915-c9d1-0cbddf4cf4f0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b3c08e33-24f0-2915-c9d1-0cbddf4cf4f0@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YdNK47swKoM.A.psE.Mi0gkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2551
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/7lprewziqct35pgautpbuzgdrei7h6q36luam4uzkie445fjlm@sn7r4zl3m3pf
Resent-Date: Fri,  9 Jun 2023 15:43:08 +0000 (UTC)

On Fri, Jun 09, 2023 at 11:39:27AM +0200, Laszlo Ersek wrote:
> Fair warning: this patch has made me both very excited and very
> uncomfortable; that's the reason my style might come across as
> needlessly "combative". I don't mean to be combative. It's just how my
> thoughts have come out, and (unfortunately) I need to go pick up my son
> now, and don't have time for further rounds of polishing my style. I
> apologize in advance. Again, it's a consequence of me caring a bit too
> much perhaps, and getting worked up.

The disclaimer is much appreciated.  And I likewise hope my reply is
not seen as combative, although I readily admit it is long-winded.

> 
> On 5/25/23 15:00, Eric Blake wrote:
> > When extended headers are in use, the server is required to use a
> > response that can include 64-bit extent lengths and flags (even if it
> > chooses to keep the extent length under 4G, and even for metacontexts
> > like "base:allocation" where the flags never need more than 32 bits).
> 
> Yes. Per spec, negotiating NBD_OPT_EXTENDED_HEADERS is equivalent to the
> server sending NBD_REPLY_TYPE_BLOCK_STATUS_EXT, as opposed to
> NBD_REPLY_TYPE_BLOCK_STATUS.
> 
> > For maximum flexibility, we are better off storing 64-bit data
> > internally, with a goal of letting the client's 32-bit interface work
> > as much as possible, and for a future API addition of a 64-bit
> > interface to work even with older servers that only give 32-bit
> > results.
> 
> I agree that a 64-bit-only internal representation makes sense. Once
> corresponding code part (quoting out of order for discussion's sake) is:
> 
> > diff --git a/lib/internal.h b/lib/internal.h
> > index e4e21a4d..11186e24 100644
> > --- a/lib/internal.h
> > +++ b/lib/internal.h
> > @@ -80,7 +80,7 @@ struct export {
> >
> >  struct command_cb {
> >    union {
> > -    nbd_extent_callback extent;
> > +    nbd_extent64_callback extent;
> >      nbd_chunk_callback chunk;
> >      nbd_list_callback list;
> >      nbd_context_callback context;
> 
> and that looks good to me.
> 
> > For backwards compatibility, a client that never negotiates a 64-bit
> > status context can be handled without errors by truncating any 64-bit
> > lengths down to just under 4G; so the old 32-bit interface will
> > continue to work in most cases.
> 
> I absolutely don't follow this. The spec is clear.
> NBD_OPT_EXTENDED_HEADERS corresponds to NBD_REPLY_TYPE_BLOCK_STATUS_EXT,
> and (!NBD_OPT_EXTENDED_HEADERS) corresponds to
> NBD_REPLY_TYPE_BLOCK_STATUS. If NBD_OPT_EXTENDED_HEADERS is negotiated
> (which means both client and server agree to it), then the client
> interface is 64-bit clean, so there's no need to truncate anything. If
> NBD_OPT_EXTENDED_HEADERS is *not* negotiated, then our internal 64-bit
> clean representation will never be filled with information that doesn't
> fit into 32-bits (due to the reply type being restricted to
> NBD_REPLY_TYPE_BLOCK_STATUS), so there is again no need to (observably)
> truncate anything (technically there would be a uint64_t to uint32_t
> conversion, but it would be value-preserving).
> 
> The spec also says that, if a client wants to query a particular
> metadata context that is known to use 64-bit values, then the client
> must first negotiate NBD_OPT_EXTENDED_HEADERS.

Maybe I can improve my wording in that part of the commit message.
But first, let's step back and see the big picture.

For the sake of argument, let's suppose there are two NBD servers in
play; server A that does not know extended headers but supports
"base:allocation" (a good set of servers today), and server B that has
implemented extended headers and has added a new metacontext (let's
call it "x-new:big") that returns 64-bit status flags, but is willing
to also accept older clients.  (I hope that someday I can get nbdkit
to be such a server, but doing that requires adding a v3 protocol for
nbdkit plugins; the current v2 plugin protocol can ONLY provide
"base:allocation", but being able to let a plugin provide its own
metacontexts will add some nice expressive power to nbdkit).

Clients compiled against libnbd 1.16 do NOT have access to
nbd_block_status_64() (the API did not exist yet); they expect that
nbd_block_status() (which returns responses constrained to 32-bit
lengths, by its API contract) will work.  When run with the .so for
libnbd 1.16 (currently named libnbd.so.0.0.0, because we have never
broken ABI compatibility across version updates - everything has been
additions-only), the client does not request extended headers (that
was not part of the code base), so we can reasonably state that if
such a client requests "x-new:big" during negotiation with server B, a
compliant server will reply with NBD_REP_ERR_EXT_HEADER_REQD; libnbd
1.16 doesn't recognize that constant, but does recognize it as an
error reply, and will gracefully proceed by telling the client it
cannot access "x-new:big", so there are never any 64-bit flag values
to worry about.  You are also right that if that same app requests
"base:allocation", the server will accept the negotiation, and reply
with NBD_REPLY_TYPE_BLOCK_STATUS where lengths are inherently capped
at 32 bits for a status flag value that never exceeds 32 bits.

But now what happens when you upgrade your system to libnbd 1.18?  I
see at least three plausible designs:

1. We keep the .so version unchanged and state that libnbd blindly
defaults to older behavior, where extended headers require explicit
opt-in (for example, where you used to use 'h = nbd_create();
nbd_connect_uri(h, uri);', you now have to edit your code to add
'nbd_set_request_extended_headers(h, true);' in between).  In this
scenario, backwards-compatibility is easy: the app compiled against
1.16 maintains the same behavior, and newer apps can write conditional
code that guards the call to nbd_set_request_extended_headers() by
#ifdef LIBNBD_HAVE_NBD_SET_REQUEST_EXTENDED_HEADERS to compile against
old and new libnbd.  However, over time, as more and more servers
support extended headers, we've actively made it harder for newer
applications to quickly connect to the full power of such servers: the
boilerplate for connection with maximal features has to be repeated in
every client, which does not scale.

2. We keep the .so version unchanged (or maybe bump the micro to
denote new APIs were added - but we haven't been doing that - I'm not
sure if we are correctly following libtool-recommended practice on how
to number our .so), and state that libnbd blindly defaults to
requesting extended headers but you can now explicitly opt-out.  The
existence of nbd_set_request_extended_headers(h, false) is the escape
valve that new code can use to guarantee behavior that 1.16 provided,
and #ifdef LIBNBD_HAVE_NBD_SET_REQUEST_EXTENDED_HEADERS lets you write
code compatible to either set of headers.  The common case of
connecting to a server with as many features as possible remains as
short as possible when writing a client.

3. We take a hybrid approach, bump the .so version, and figure out
some way to make the behavior determined by what version of the
headers you compiled/linked against.  For example, maybe have some
linker magic where you export both nbd_create@@1_16 which starts a
handle with request_eh=false, and nbd_create@@1_18 which starts a
handle with request_eh=true; apps compiled against 1.16 will have
nbd_create() resolve to nbd_create@@1_16 and never see a change in
behavior, while apps compiled against 1.18 will have nbd_create()
resolve to nbd_create@@1_18.  This adds a lot of complexity to our
build scripts (glibc does this sort of backwards-compatibility, but it
can be very tricky to get right, and very few other libraries do it).

This series went with option 2: default to new behavior, while bending
over backwards to avoid scenarios in older clients that already
worked.

Now, what are the implications of that change?  Back to the example I
started earlier:

If I write a new client against libnbd 1.18, and request "x-new:big"
from server B, I don't have to do anything special for the negotiation
to work: libnbd negotiated extended headers automatically, so the
server allows my request.  But when I want to get block status, I have
two interfaces exposed: nbd_block_status() and nbd_block_status_64().
Presumably, because I just wrote the client against libnbd 1.18, the
documentation hints are good enough that I should use
nbd_block_status_64(), and all is well in the world (the server can
send 64-bit lengths and 64-bit flags, and I can see them, with no
munging required).  What's more, even when I ask for
"base:allocation", even though I never need 64-bit flags, I
automatically benefit from 64-bit lengths when I use
nbd_block_status_64() (patches 12-17 in this series show what is
required to make an app use the new interfaces - it's boilerplate that
has to be copied to every client written against older libnbd, but it
is not too bad, and scaling is less of a concern because there are
only a finite number of older apps).

If that same client now talks to server A, the request for extended
headers will fail, and the request for "x-new:big" will fail (the
server doesn't support it); but the request for "base:allocation" will
succeed.  But we've already written the new client to call
nbd_block_status_64() which reports 64-bit lengths; this works because
under the hood, even though server A is sending us
NBD_REPLY_TYPE_BLOCK_STATUS with 32-bit lengths, it is easy to widen
that into our 64-bit internal representation, which we then hand to
the client app.  The app could also choose to explicitly check
nbd_get_extended_headers_negotiated() in order to make a runtime
decision of whether to call nbd_block_status() or
nbd_block_status_64() based on what the server supports, but that's a
lot of boilerplate unlikely to be used in most new clients.  Thus, I
prefer my decision to normalize to a 64-bit internal representation as
soon as possible (at the risk of having to convert it back to 32-bits
if the client made a conscious choice to use the old interface),
rather than bending over backwards to store the server's response
as-is as long as possible (and only convert it to the other width if
the client called the API opposite from what the server negotiated).

But back to my old client compiled against 1.16 and now dynamically
loading the 1.18 .so.  When talking to server A, the new .so defaults
result in the old client now requesting (but not getting) get extended
headers, and then calls to nbd_block_status() (the only API available
at the time the app was compiled) will see server A's
NBD_REPLY_TYPE_BLOCK_STATUS with 32-bit answers, temporarly widened
into our 64-bit internal representation, and then the shim narrows it
back to 32 bits for presentation to the client application, with no
loss of information.  Because of the double conversion, this may be
slightly slower than it was with the 1.16 .so, but it is not an
obvious behavior change.

But the final combination is where the fun enters in. The old client
talking to server B using the 1.18 .so defaults to requesting extended
headers, and the server honors that request.  However, the old client
does not have access to the nbd_block_status_64() API (it was not
around at the time of compilation), so it WILL be using the 32-bit
interface nbd_block_status().  Whereas with the 1.16 .so an attempt to
request "x-new:big" was rejected during negotiation, that request is
now honored, and so we really do risk a flags value that we have to
represent to the client as an EOVERFLOW error (an early failure is now
a late failure; fortunately, this behavior change is not common in
practice - other than clients like nbdsh that really do allow you to
decide at runtime which metacontext(s) you want to request, most
applications know in advance what they want from the server, and won't
be asking for "x-new:big").  But more importantly, our request for
"base:allocation" is STILL granted, and the server is now replying
with NBD_REPLY_TYPE_BLOCK_STATUS_EXT.  Even though the flags values
will never exceed 32 bits, the server _can_ now give us lengths larger
than 4G for an extent.  We do _not_ want to fail the request with
EOVERFLOW just because the server was now permitted to answer us with
a larger extent than before, but we can take advantage of the NBD
spec, which says that as long as the reply to NBD_CMD_BLOCK_STATUS
makes progress, it does NOT have to go as far as possible - even
though the server gave us a length larger than 4G over the wire, we
are still compliant to the spec from the client's point of view if we
truncate that response to being less than 4G - it still made progress,
and just as with server A, the client can then ask for block status at
the next byte after where the current answer ended.

The tl;dr summary of the above discourse:
There are two orthogonal communications going on:

libnbd <-> server  choice of NBD_REPLY_TYPE_BLOCK_STATUS{,_EXT}
app <-> libnbd     choice of nbd_block_status() or nbd_block_status_64()

and all four combinations are easy to encounter when loading the .so
for libnbd 1.18:

32 x 32 (app compiled against libnbd 1.16 to server A)
64 x 32 (app compiled against libnbd 1.16 to server B)
32 x 64 (app compiled against libnbd 1.18 to server A)
64 x 64 (app compiled against libnbd 1.18 to server B)

and we want all four combinations to work insofar as possible.  32x32
and 64x64 obviously work, as does 32x64 (widening the server's
responses never fails); for 32x64 (using the 32-bit nbd_block_status()
API to access a server's response through 64-bit
NBD_REPLY_TYPE_BLOCK_STATUS), accessing a metacontext with large flags
changes from fail early to fail late; and accessing a metacontext with
32-bit flags but now potential 64-bit lengths obeys overall NBD
semantics that a block status response can be truncated as long as it
makes progress (the app shouldn't care whether it was the server or
libnbd that did the truncation).

> 
> > A server should not advertise a
> > metacontext that requires flags larger than 32 bits unless the client
> > negotiated extended headers; but if such a client still tries to use
> > the 32-bit interface, the code now reports EOVERFLOW for a server
> > response with a flags value that cannot be represented without using
> > the future API for 64-bit extent queries.
> 
> Again, I don't follow. Whenever the client issues an
> NBD_CMD_BLOCK_STATUS command (which can only occur after negotiation):
> 
> - the client must have set at least one metacontext with
>   NBD_OPT_SET_META_CONTEXT during negotiation,
> 
> - the client may or may not have agreed upon with the server on
>   NBD_OPT_EXTENDED_HEADERS.
> 
> Therefore, when the server receives the NBD_CMD_BLOCK_STATUS command, it
> can immediately decide whether there is *any* configured metacontext for
> which *lack* of extended headers could be too restrictive. If only
> 32-bit metacontexts have been requested, this is not a problem. If
> ext-hdrs have been negotiated, also not a problem. If there is at least
> one 64-bit metacontext (regarding *either* status flags *or* lengths)
> *and* ext-hdrs have not been negotiated, the server should immediately
> fail (reject) the request.

I think I see where you missed something.  The decision of whether a
metacontext can have 64-bit flag content is dependent on the
metacontext, and therefore something that can be fully decided at the
time of NBD_OPT_SET_META_CONTEXT and/or NBD_OPT_GO (it is not a
decision that needs to wait until NBD_CMD_BLOCK_STATUS).  Either the
metacontext has the potential for 64-bit flags (and the server will
have failed with NBD_REP_ERR_EXT_HEADER_REQD if the client did not
request extended headers), or it does not.  But the decision of
whether a metacontext can have 64-bit lengths is NOT dependent on the
metacontext, but rather on the image size and our ability to make
large queries.  If we have a 5G image that is known to be all data, we
HAVE to truncate our reply to less than 4G for a client that did not
request extended headers, and then the client asks for a second block
status at the point where it left off.  But once extended headers are
negotiated, we can give a single reply stating that the entire image
is a single all-data extent.  The server does not know at the time of
NBD_CMD_BLOCK_STATUS whether the client is using 32-bit
nbd_block_status or 64-bit nbd_block_status_64().

It is this distinction between length and flags that explains why I
want nbd_block_status_64() to return a struct, rather than an array of
uint64_t.  Even though the wire representation of the extent is a pair
of uint64_t values, the interpretation of those values is vastly
different: length should never exceed 63 bits (because of off_t or
other limitations) but can easily exceed 4G; while flags could be a
full 64 bits, or in the case of "base:allocation" will never be more
than 2 bits.  The definition of flags is context-dependent, but the
definition of length is not.

> 
> Now, peeking a bit forward, I can see patch#10: "api: Add
> [aio_]nbd_block_status_64". That means we can reject a 32-bit-only
> nbd_block_status() API call on the client side immediately, if the
> client has negotiated ext-hdrs.

We can, but that breaks backwards compatibility.  We do not want an
app compiled against libnbd 1.16 to stop working merely because it is
now loading the 1.18 .so.

> That is, if the client is smart enough
> to ask for extended headers, it can be smart enough to use the 64-bit
> API, and then it can accept everything the server throws at it. If the
> client never even asks for extended headers, then it is permitted to
> stick with the 32-bit-only API, but then the server must never respond
> with NBD_REPLY_TYPE_BLOCK_STATUS_EXT [*], so actually 64-bit values are
> never going to be present in our internal representation.
> 
> [*] If it still does, then the server is buggy, and we should realize
>     that as soon as we parse the generic reply magic, or the specific
>     reply type code.

It is indeed a bug if a server replies with
NBD_REPLY_TYPE_BLOCK_STATUS_EXT for a client that did not request
extended headers.  But it is also a bug if a server replise with
NBD_REPLY_TYPE_BLOCK_STATUS for a client that did request extended
headers, even if the reply does not need more than 32 bits for either
the length or the flags.

> 
> I simply fail to see the *possibility* truncating the internal 64-bit
> representation to 32-bit such that it would make a difference for the
> caller.
> 
> Speaking in terms of code:
> 
> > diff --git a/lib/rw.c b/lib/rw.c
> > index 8b2bd4cc..58b05a4b 100644
> > --- a/lib/rw.c
> > +++ b/lib/rw.c
> > @@ -42,6 +42,61 @@ wait_for_command (struct nbd_handle *h, int64_t cookie)
> >    return r == -1 ? -1 : 0;
> >  }
> >
> > +/* Convert from 64-bit to 32-bit extent callback. */
> > +static int
> > +nbd_convert_extent (void *data, const char *metacontext, uint64_t offset,
> > +                    nbd_extent *entries, size_t nr_entries, int *error)
> > +{
> > +  nbd_extent_callback *cb = data;
> > +  uint32_t *array = malloc (nr_entries * 2 * sizeof *array);
> 
> Side question: what guarantees that the multiplication won't overflow?

The fact that we cap all incoming server replies to at most 64M (see
pre-series REPLY.STRUCTURED_REPLY.CHECK which rejects payloads larger
than MAX_REQUEST_SIZE).  Even though the NBD spec only recommends
(rather than requires) that a server should not send more than 2M
extents in a single block status reply, we will have entered the DEAD
state if the server sent more extents than fit in MAX_REQUEST_SIZE.

> 
> If we have a guarantee, we should document it, and (preferably) assert
> it.

Yes, I can add 'assert (nr_entries < SIZE_MAX / 2 / sizeof *array);' or
similar, along with a comment pointing to the MAX_REQUEST_SIZE check.

> 
> > +  size_t i;
> > +  int ret;
> > +  bool fail = false;
> > +
> > +  if (array == NULL) {
> > +    set_error (*error = errno, "malloc");
> > +    return -1;
> > +  }
> > +
> > +  for (i = 0; i < nr_entries; i++) {
> > +    array[i * 2] = entries[i].length;
> > +    array[i * 2 + 1] = entries[i].flags;
> > +    /* If an extent is larger than 32 bits, silently truncate the rest
> > +     * of the server's response; the client can then make progress
> > +     * instead of needing to see failure.  Rather than track the
> > +     * connection's alignment, just clamp the large extent to 4G-64M.
> > +     * However, if flags doesn't fit in 32 bits, it's better to inform
> > +     * the caller of an EOVERFLOW failure.
> > +     *
> > +     * Technically, a server with 64-bit answers is non-compliant if
> > +     * the client did not negotiate extended headers - contexts that
> > +     * include 64-bit flags should not have been negotiated in that
> > +     * case.
> 
> Yes, and we should absolutely enforce that.
> 
> Don't we break off the connection (or at least abort the request) when
> we get the wrong reply magic from the server, or else if we do get the
> right reply magic, but an NBD_REPLY_TYPE_BLOCK_STATUS_EXT reply type
> code inside, without having negotiated extended headers?

Yes, the code is set up to gracefully ignore server replies sent with
the wrong reply type (the code does try hard to keep the connection
alive when possible, by using payload lengths to skip to the next
viable reply header; but moves to the DEAD state when it was not
viable - either way, nbd_block_status() cannot succeed if the server
uses the wrong reply type).

> 
> This compatibility goo creates a big maintenance and debugging burden.
>

Yes, backwards compatibility is always something that requires careful
design.

> > +     */
> > +    if (entries[i].length > UINT32_MAX) {
> > +      array[i++ * 2] = -MAX_REQUEST_SIZE;
> > +      break;
> > +    }
> > +    if (entries[i].flags > UINT32_MAX) {
> > +      *error = EOVERFLOW;
> > +      fail = true;
> > +      break;
> > +    }
> > +  }
> > +
> > +  ret = CALL_CALLBACK (*cb, metacontext, offset, array, i * 2, error);
> > +  free (array);
> > +  return fail ? -1 : ret;
> > +}
> 
> Back to the commit message:
> 
> >
> > Note that the existing 32-bit nbd_block_status() API is now slightly
> > slower, particularly when talking with a server that lacks extended
> > headers: we are doing two size conversions (32 to 64 internally, 64
> > back to 32 to the user).  But this speed penalty is likely in the
> > noise compared to the network delays, and ideally clients will switch
> > over to the new 64-bit interfaces as more and more servers start
> > supporting extended headers.
> 
> I'm not worried about the speed penalty, but at this point (and looking
> at the rest of the patch) I'm actually changing my mind, and questioning
> whether we are better off with the unified, 64-bit only internal
> representation. It's not just about converting back and forth (and hence
> code complexity): we're introducing further malloc()s, and those are all
> new failure points. Even if we do handle memory allocation failures
> everywhere correctly, they still introduce pontential *late* breaking
> points for the client.

Okay, I see what you are getting at.  We do one malloc() in response
to whether the server sent NBD_REPLY_TYPE_BLOCK_STATUS or
NBD_REPLY_TYPE_BLOCK_STATUS_EXT, and then another malloc() if the
client called nbd_block_status().  You are worried that having two
malloc()s doubles the chance of hitting a failure at an odd point,
making it harder to give correct responses to the user's callbacks.

Here's a strawman idea for a different internal representation: what
if we store BOTH 32- and 64-bit data in a single malloc()?  That is,
in highly-abbreviated code sketch (doing it without abusing type
aliases will obviously take more lines of code):

REPLY.STRUCTURED_REPLY.CHECK:
...
  case NBD_REPLY_TYPE_BLOCK_STATUS:
    compute nr_entries; // number of uint32_t pairs
    char *bs_entries = malloc (6 * nr_entries); // relies on malloc being 8-byte aligned
    rbuf = bs_entries + nr_entries * 4 * sizeof(uint32_t);
    break;
  case NBD_REPLY_TYPE_BLOCK_STATUS_EXT:
    compute nr_entries; // number of uint64_t pairs
    char *bs_entries = malloc (nr_entries * 3);
    rbuf = bs_entries;
    break;
...
REPLY.STRUCTURED_REPLY.BS_ENTRIES:
...
  if (type == NBD_REPLY_TYPE_BLOCK_STATUS) {
    // widen 32-bit entries in last third into 64-bit entries in first two-thirds
    for (i = 0; i < nr_entries * 2; i++)
      *(uint64_t*)bs_entries[i*sizeof(uint64_t)] = *(uint32_t*)bs_entries[(i+nr_entries*4)*sizeof(uint32_t)]
  }
  else /* type == NBD_REPLY_TYPE_BLOCK_STATUS_EXT) {
    // narrow 64-bit entries in first two-thirds into 32-bit entries in last third
    for (i = 0; i < nr_entries; i++) {
      // check for overflow or truncation as needed
    }
  }
  if (/* user called nbd_block_status */)
    CALL_CALLBACK (cmd->cb.fn.extent32 (..., nr_entries*2, (uint32_t*)&bs_entries[nr_entries * 4 * sizeof(uint32_t)] ...)
  else /* user called nbd_block_status_64 */
    CALL_CALLBACK (cmd->cb.fn.extent64 (..., nr_entries, (nbd_extent*)&bs_entries[0] ...)

In this approach, no shims are needed (both 32- and 64-bit
nbd_block_status* API calls natively call into the applications
callback with the correct typing), and we have fewer malloc() calls,
but need more memory reserved per the duration of a callback, and
waste time on conversion for every API call.  Or add even more
complicated code to only do the conversion when we compare the user's
API call to the server's response type.

Just because it is a possible approach doesn't mean it is more
appealing.  Then again, you are right that having a shim makes life
harder on verifying that we are doing correct memory management on all
code paths, and coding things so that no shim is required might make
the code easier to reason about despite its complexity in managing
more memory.

> 
> >
> > One of the trickier aspects of this patch is auditing that both the
> > user's extent and our malloc'd shim get cleaned up once on all
> > possible paths, so that there is neither a leak nor a double free.
> 
> Right, and I happen to disagree with your implementation; more on that
> below.
> 
> >
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> >  lib/internal.h                      |  8 +++-
> >  generator/states-reply-structured.c | 30 ++++++++-----
> >  lib/handle.c                        |  2 +-
> >  lib/rw.c                            | 70 ++++++++++++++++++++++++++++-
> >  4 files changed, 95 insertions(+), 15 deletions(-)
> >
> > diff --git a/lib/internal.h b/lib/internal.h
> > index e4e21a4d..11186e24 100644
> > --- a/lib/internal.h
> > +++ b/lib/internal.h
> > @@ -303,7 +303,11 @@ struct nbd_handle {
> >    size_t querynum;
> >
> >    /* When receiving block status, this is used. */
> > -  uint32_t *bs_entries;
> > +  union {
> > +    char *storage;      /* malloc's view */
> > +    nbd_extent *normal; /* Our 64-bit preferred internal form; n slots */
> > +    uint32_t *narrow;   /* 32-bit NBD_REPLY_TYPE_BLOCK_STATUS form; n*2 slots */
> > +  } bs_entries;
> >
> >    /* Commands which are waiting to be issued [meaning the request
> >     * packet is sent to the server].  This is used as a simple linked
> 
> Now this could be a good approach in my opinion; however, I disagree
> with how it's being used (the in-place conversion below, which IMO
> arguably runs afoul of the effective type rules in C).

Vladimir also didn't like my attempts to do in-place conversions in
the qemu counterpart code (see
https://listman.redhat.com/archives/libguestfs/2023-May/031685.html),
in part because you MUST be careful about index directions
(incrementing when narrowing, decrementing when widening).

So yet another approach is to read the server's memory as-is, then
copy into the form passed to the user (rather than doing in-place
conversions), regardless of whether that copy widens or narrows.
That's back to two malloc's per reply (one to get the server's bytes,
another for what to hand to the callback), but may be easier to reason
about.


> 
> > diff --git a/generator/states-reply-structured.c b/generator/states-reply-structured.c
> > index c53aed7b..784adb78 100644
> > --- a/generator/states-reply-structured.c
> > +++ b/generator/states-reply-structured.c
> > @@ -436,6 +436,7 @@  REPLY.STRUCTURED_REPLY.RECV_OFFSET_HOLE:
> >   REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
> >    struct command *cmd = h->reply_cmd;
> >    uint32_t length;
> > +  uint32_t count;
> >
> >    switch (recv_into_rbuf (h)) {
> >    case -1: SET_NEXT_STATE (%.DEAD); return 0;
> > @@ -450,15 +451,19 @@  REPLY.STRUCTURED_REPLY.RECV_BS_HEADER:
> >      assert (cmd->type == NBD_CMD_BLOCK_STATUS);
> >      assert (length >= 12);
> >      length -= sizeof h->sbuf.reply.payload.bs_hdr;
> > +    count = length / (2 * sizeof (uint32_t));
> 
> This division will work as expected, but it's hard to see why. After my
> request under patch#1, for introducing bs_reply_length_ok(), and
> asserting it here, it will be easier to understand.
> 
> I do dislike the open-coded "sizeof (uint32_t)" though, we should say
> "sizeof *h->bs_entries.narrow".

Yes, I'm still working to rebase on your earlier comments (the helper
function bs_reply_length_ok() idea made sense), and naming the actual
variable rather than having to check that the correct type is doable
(even though it makes for longer lines and possibly more line breaks).

> 
> >
> > -    free (h->bs_entries);
> > -    h->bs_entries = malloc (length);
> > -    if (h->bs_entries == NULL) {
> > +    /* Read raw data into a subset of h->bs_entries, then expand it
> > +     * into place later during byte-swapping.
> > +     */
> > +    free (h->bs_entries.storage);
> > +    h->bs_entries.storage = malloc (count * sizeof *h->bs_entries.normal);
> > +    if (h->bs_entries.storage == NULL) {
> >        SET_NEXT_STATE (%.DEAD);
> >        set_error (errno, "malloc");
> >        return 0;
> >      }
> > -    h->rbuf = h->bs_entries;
> > +    h->rbuf = h->bs_entries.narrow;
> >      h->rlen = length;
> >      SET_NEXT_STATE (%RECV_BS_ENTRIES);
> >    }
> > @@ -470,6 +475,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
> >    uint32_t count;
> >    size_t i;
> >    uint32_t context_id;
> > +  uint32_t *raw;
> >
> >    switch (recv_into_rbuf (h)) {
> >    case -1: SET_NEXT_STATE (%.DEAD); return 0;
> > @@ -483,17 +489,21 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
> >      assert (cmd); /* guaranteed by CHECK */
> >      assert (cmd->type == NBD_CMD_BLOCK_STATUS);
> >      assert (CALLBACK_IS_NOT_NULL (cmd->cb.fn.extent));
> > -    assert (h->bs_entries);
> > +    assert (h->bs_entries.normal);
> >      assert (length >= 12);
> >      assert (h->meta_valid);
> >      count = (length - sizeof h->sbuf.reply.payload.bs_hdr) /
> > -      sizeof *h->bs_entries;
> > +      (2 * sizeof (uint32_t));
> >
> >      /* Need to byte-swap the entries returned, but apart from that we
> > -     * don't validate them.
> > +     * don't validate them.  Reverse order is essential, since we are
> > +     * expanding in-place from narrow to wider type.
> >       */
> > -    for (i = 0; i < count; ++i)
> > -      h->bs_entries[i] = be32toh (h->bs_entries[i]);
> > +    raw = h->bs_entries.narrow;
> > +    for (i = count; i-- > 0; ) {
> > +      h->bs_entries.normal[i].flags = be32toh (raw[i * 2 + 1]);
> > +      h->bs_entries.normal[i].length = be32toh (raw[i * 2]);
> > +    }
> >
> >      /* Look up the context ID. */
> >      context_id = be32toh (h->sbuf.reply.payload.bs_hdr.context_id);
> 
> So I find this way too clever; worse, it almost certainly breaks the
> effective type rules in C.
> 
> First, I would be OK with storing pointers in the bs_entries union, if
> our only purpose with the union were to only handle one of those
> pointers at any given time. However, we're type punning the pointers
> back and forth, and relying on their representation being identical.
> (Pointer to structure vs. pointer to char vs. pointer to uint32_t.) Not
> catastrophic, but not nice (and IMO not even necessary, see below).
> 
> Second, after reading the effective type rules very carefully, the code
> might break them minimally (I think) when "i" equals zero, and the
> "length" field is assigned. In that instance, you are reading the same
> memory location as a uint32_t and writing it as a uint64_t, and not
> going through a union.
> 
> I'd prefer one of the two following options:
> 
> - bs_entries should indeed be the union that you recommend, but used
>   differently. First, "storage" should be allocated, and filled. When
>   the reading completes, a new uint32_t array should be allocated,
>   populated via byte-swapping, "storage" should be released, and the new
>   (now byte-order-correct) array should be recorded in "narrow". Same
>   approach for the future "normal" population. The advantages of this
>   approach are: (a) not reading a pointer-to-type-X value as a
>   pointer-to-type-Y value (reinterpreting the bit pattern) via the
>   union, as we should always know what reply type we're dealing with,
>   (b) any allocated array would only be accessed with a singular element
>   type at any point in time. A kind of "double buffering".

Aha - now that I've read this far, you are steering towards the same
solution I started reaching above.  Use two malloc()s, but be more
specific about which types are represented.  Your idea of releasing
'storage' and reassigning with 'wide' or 'narrow' is clever, but
definitely nicer type-wise than in-place reinterpretation of a single
malloc() across different types where (during the conversion) there is
no single type that properly describes the overall storage.

> 
> - Better yet: drop the "storage" field from the union, and only have
>   "narrow" and "normal" in it. Treat them entirely separately. For the
>   32-bit case, simply rename the field references (from bs_normal to
>   bs_normal.narrow), no need to change the existent logic. For the
>   64-bit case, duplicate and widen the 32-bit case (the byte swapping
>   etc), using bs_entries.normal.
> 
> > @@ -507,7 +517,7 @@  REPLY.STRUCTURED_REPLY.RECV_BS_ENTRIES:
> >
> >        if (CALL_CALLBACK (cmd->cb.fn.extent,
> >                           h->meta_contexts.ptr[i].name, cmd->offset,
> > -                         h->bs_entries, count,
> > +                         h->bs_entries.normal, count,
> >                           &error) == -1)
> >          if (cmd->error == 0)
> >            cmd->error = error ? error : EPROTO;
> > diff --git a/lib/handle.c b/lib/handle.c
> > index 0f11bee5..fba6d1c4 100644
> > --- a/lib/handle.c
> > +++ b/lib/handle.c
> > @@ -130,7 +130,7 @@ nbd_close (struct nbd_handle *h)
> >    nbd_unlocked_clear_debug_callback (h);
> >
> >    string_vector_empty (&h->querylist);
> > -  free (h->bs_entries);
> > +  free (h->bs_entries.storage);
> >    nbd_internal_reset_size_and_flags (h);
> >    for (i = 0; i < h->meta_contexts.len; ++i)
> >      free (h->meta_contexts.ptr[i].name);
> 
> [empty line here due to earlier out-of-order quoting]
> 
> > diff --git a/lib/rw.c b/lib/rw.c
> > index 8b2bd4cc..58b05a4b 100644
> > --- a/lib/rw.c
> > +++ b/lib/rw.c
> > +static void
> > +nbd_convert_extent_free (void *data)
> > +{
> > +  nbd_extent_callback *cb = data;
> > +  FREE_CALLBACK (*cb);
> > +  free (cb);
> > +}
> > +
> 
> For better readability, "data" should be "user_data" IMO, and "cb"
> should be "shim".
> 
> >  /* Issue a read command and wait for the reply. */
> >  int
> >  nbd_unlocked_pread (struct nbd_handle *h, void *buf,
> > @@ -487,12 +542,23 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
> >                                 nbd_completion_callback *completion,
> >                                 uint32_t flags)
> >  {
> > -  struct command_cb cb = { .fn.extent = *extent,
> > +  nbd_extent_callback *shim = malloc (sizeof *shim);
> > +  struct command_cb cb = { .fn.extent.callback = nbd_convert_extent,
> > +                           .fn.extent.user_data = shim,
> > +                           .fn.extent.free = nbd_convert_extent_free,
> >                             .completion = *completion };
> >
> > +  if (shim == NULL) {
> > +    set_error (errno, "malloc");
> > +    return -1;
> > +  }
> > +  *shim = *extent;
> > +  SET_CALLBACK_TO_NULL (*extent);
> > +
> >    if (h->strict & LIBNBD_STRICT_COMMANDS) {
> >      if (!h->structured_replies) {
> >        set_error (ENOTSUP, "server does not support structured replies");
> > +      FREE_CALLBACK (cb.fn.extent);
> >        return -1;
> >      }
> >
> > @@ -500,11 +566,11 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
> >        set_error (ENOTSUP, "did not negotiate any metadata contexts, "
> >                   "either you did not call nbd_add_meta_context before "
> >                   "connecting or the server does not support it");
> > +      FREE_CALLBACK (cb.fn.extent);
> >        return -1;
> >      }
> >    }
> >
> > -  SET_CALLBACK_TO_NULL (*extent);
> >    SET_CALLBACK_TO_NULL (*completion);
> >    return nbd_internal_command_common (h, flags, NBD_CMD_BLOCK_STATUS, offset,
> >                                        count, EINVAL, NULL, &cb);
> 
> I disagree with this order of operations. (Note, I'm not saying there
> are leaks or double free's.)
> 
> Consider the nbd_unlocked_aio_block_status() call site in
> nbd_aio_block_status():
> 
> > int64_t
> > nbd_aio_block_status (
> >   struct nbd_handle *h, uint64_t count, uint64_t offset,
> >   nbd_extent_callback extent_callback,
> >   nbd_completion_callback completion_callback, uint32_t flags
> > )
> > {
> >   /* ... */
> >   ret = nbd_unlocked_aio_block_status (h, count, offset, &extent_callback,
> >                                        &completion_callback, flags);
> >   /* ... */
> >   FREE_CALLBACK (extent_callback);
> >   FREE_CALLBACK (completion_callback);
> >   /* ... */
> > }
> 
> If that call succeeds (returns a value different from (-1)), then we
> expect nbd_unlocked_aio_block_status() to have taken ownership of both
> "extent_callback" and "completion_callback", by emptying them. That way,
> the FREE_CALLBACK()s at the end of the function decay to NOPs. If the
> call fails OTOH, we expect the call to have left "extent_callback" and
> "completion_callback" untouched, and the FREE_CALLBACK()s at the end to
> have "fangs" -- perform actual freeing.
> 
> Pre-patch, nbd_unlocked_aio_block_status() conforms to this interface
> contract quite well. It first goes through all possible local error
> branches, and if all of those pass, only then does it zero the callback
> structures (i.e., takes ownership of them).
> 
> This patch changes that; we take ownershop of "extent_callback" (by
> copying it to "shim" and nulling it) before we check our local error
> conditions, such as structured_replies and metadata context validity.
> That breaks the interface contract, and so we cannot rely on
> nbd_aio_block_status() for freeing "extent_callback" when we fail in one
> of those local error conditions -- this is why we have to go through
> FREE_CALLBACK (cb.fn.extent) on each of those error paths, for freeing
> *both* "shim" and the "extent_callback" internals. And (most importantly
> to me) then we return to the caller, namely nbd_aio_block_status(), in
> such a way that (a) we fail, yet (b) we have already destroyed
> "extent_callback" (but not "completion_callback"). The caller copes with
> this (due to how FREE_CALLBACK() works), but it's unclean. If
> nbd_unlocked_aio_block_status() fails, it shouldn't have messed with
> "extent_callback".
> 
> (I notice a *slight* inconsistency with this requirement of mine in the
> pre-patch code as well, BTW: pre-patch, we null both callback structures
> *before* calling nbd_internal_command_common(); if the latter fails, we
> get into the same situation. So I actually tend to disagree with that
> too.)
> 
> Anyway, I would suggest (on top of your patch):
> 
> > diff --git a/lib/rw.c b/lib/rw.c
> > index 58b05a4b5529..1913cbb11813 100644
> > --- a/lib/rw.c
> > +++ b/lib/rw.c
> > @@ -552,26 +552,28 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
> >      set_error (errno, "malloc");
> >      return -1;
> >    }
> > -  *shim = *extent;
> > -  SET_CALLBACK_TO_NULL (*extent);
> >
> >    if (h->strict & LIBNBD_STRICT_COMMANDS) {
> >      if (!h->structured_replies) {
> >        set_error (ENOTSUP, "server does not support structured replies");
> > -      FREE_CALLBACK (cb.fn.extent);
> > -      return -1;
> > +      goto free_shim;
> >      }
> >
> >      if (!h->meta_valid || h->meta_contexts.len == 0) {
> >        set_error (ENOTSUP, "did not negotiate any metadata contexts, "
> >                   "either you did not call nbd_add_meta_context before "
> >                   "connecting or the server does not support it");
> > -      FREE_CALLBACK (cb.fn.extent);
> > -      return -1;
> > +      goto free_shim;
> >      }
> >    }
> >
> > +  *shim = *extent;
> > +  SET_CALLBACK_TO_NULL (*extent);
> >    SET_CALLBACK_TO_NULL (*completion);
> >    return nbd_internal_command_common (h, flags, NBD_CMD_BLOCK_STATUS, offset,
> >                                        count, EINVAL, NULL, &cb);
> > +
> > +free_shim:
> > +  free (shim);
> > +  return -1;
> >  }
> 
> Which, after squashing, would result in a patch like:
> 
> > @@ -487,25 +542,38 @@ nbd_unlocked_aio_block_status (struct nbd_handle *h,
> >                                 nbd_completion_callback *completion,
> >                                 uint32_t flags)
> >  {
> > -  struct command_cb cb = { .fn.extent = *extent,
> > +  nbd_extent_callback *shim = malloc (sizeof *shim);
> > +  struct command_cb cb = { .fn.extent.callback = nbd_convert_extent,
> > +                           .fn.extent.user_data = shim,
> > +                           .fn.extent.free = nbd_convert_extent_free,
> >                             .completion = *completion };
> >
> > +  if (shim == NULL) {
> > +    set_error (errno, "malloc");
> > +    return -1;
> > +  }
> > +
> >    if (h->strict & LIBNBD_STRICT_COMMANDS) {
> >      if (!h->structured_replies) {
> >        set_error (ENOTSUP, "server does not support structured replies");
> > -      return -1;
> > +      goto free_shim;
> >      }
> >
> >      if (!h->meta_valid || h->meta_contexts.len == 0) {
> >        set_error (ENOTSUP, "did not negotiate any metadata contexts, "
> >                   "either you did not call nbd_add_meta_context before "
> >                   "connecting or the server does not support it");
> > -      return -1;
> > +      goto free_shim;
> >      }
> >    }
> >
> > +  *shim = *extent;
> >    SET_CALLBACK_TO_NULL (*extent);
> >    SET_CALLBACK_TO_NULL (*completion);
> >    return nbd_internal_command_common (h, flags, NBD_CMD_BLOCK_STATUS, offset,
> >                                        count, EINVAL, NULL, &cb);
> > +
> > +free_shim:
> > +  free (shim);
> > +  return -1;
> >  }
> 
> But, to repeat myself -- I'm not convinced any more we benefit from the
> 64-bit-only internal representation. We should always be able to tell
> precisely which one of the 32-bit and the 64-bit internal
> representations we need. We should handle each separately, and then we
> don't need the conversions + shim.

We always know what width the server send, and what width the caller
requested.  But since the two are orthonal, and we must support all
four combinations, two of those pairing need a conversion.  You are
right that we can do conversions only when needed, and even set it up
so that we do not need a shim.  I'll play with ideas mentioned in this
review (probably leaning towards the double-buffering idea: we have to
read in the server's bytes, and have to do byte swapping - but how we
do the byte-swapping can either be in-place when no widening or
narrowing is needed, or double-buffered if we also have to adjust to
match the caller's size choice).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


