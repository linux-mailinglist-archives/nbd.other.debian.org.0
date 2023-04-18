Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F2F6E6095
	for <lists+nbd@lfdr.de>; Tue, 18 Apr 2023 14:05:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 23F5520C51; Tue, 18 Apr 2023 12:05:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 18 12:05:14 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B80EA20BB3
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 Apr 2023 12:04:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oMwXSNYiFMRN for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 Apr 2023 12:04:50 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 34C3B20C52
	for <nbd@other.debian.org>; Tue, 18 Apr 2023 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dq+34gfiVFwy//SuC7NfwzgRnfEyss4DWeQ1IPNeO+g=; b=Nq9Y+wsu0L28tyCqgWGdOP8ly5
	01DchEmPvIqs4MGfeNKwlq6ZrSuWYarSbAUIIB6+W+IO3MF+/l4wqqAkPgD2ekRaJryST+gPgKFAI
	aZIVFULdRL35E4kaBP45gGwVAEWsvw7TWRCiJ0dNc3+gEzLywj2MY4eBCte7yXUDNGF/njmFKLfhG
	KFGUIdCxEeGuMf+Mfwk/UAcv3fz+Cw4n0sPG2EwnLyTe0VOUMBhw+XDpNh+a+OcGpWT/G+WBpo3bI
	zO+j9P8OwdD9hQ2RfI/o7SROJYDd8Ob+sDOAKePOVlafl1X9Pf+Px6ODC0GOGcC5/dxddms7x+Ans
	DaNqzjOw==;
Received: from [217.111.249.126] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pok4l-00EXuL-AA; Tue, 18 Apr 2023 14:04:46 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pok4f-000Dxz-0d;
	Tue, 18 Apr 2023 14:04:41 +0200
Date: Tue, 18 Apr 2023 14:04:31 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com
Subject: Re: [PATCH v3 3/6] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <ZD6HTxZioiBRvI+6@pc220518.home.grep.be>
References: <20230413220241.1396012-1-eblake@redhat.com>
 <20230413220241.1396012-4-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413220241.1396012-4-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <PQUgcw5w-3N.A.06B.5doPkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2431
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZD6HTxZioiBRvI+6@pc220518.home.grep.be
Resent-Date: Tue, 18 Apr 2023 12:05:14 +0000 (UTC)

On Thu, Apr 13, 2023 at 05:02:38PM -0500, Eric Blake wrote:
> Add a new negotiation feature where the client and server agree to use
> larger packet headers on every packet sent during transmission phase.
> This has two purposes: first, it makes it possible to perform
> operations like trim, write zeroes, and block status on more than 2^32
> bytes in a single command.  While at it, this is a great opportunity
> to declare that any client opting in to extended headers will use
> NBD_OPT_GO instead of the weaker NBD_OPT_EXPORT_NAME.
> 
> Second, when structured replies are active, clients have to deal with
> the difference between 16- and 20-byte headers of simple
> vs. structured replies, which impacts performance if the client must
> perform multiple syscalls to first read the magic before knowing if
> there are even additional bytes to read to learn a payload length.  In
> extended header mode, all headers are the same width and there are no
> simple replies permitted.  The layout of the reply header is more like
> the request header; and including the client's offset in the reply
> makes it easier to convert between absolute and relative offsets for
> replies to NBD_CMD_READ.  Similarly, by having extended mode use a
> power-of-2 sizing, it becomes easier to manipulate arrays of headers
> without worrying about an individual header crossing a cache line.
> However, note that this change only affects the headers; data payloads
> can still be unaligned (for example, a client performing 1-byte reads
> or writes).  We would need to negotiate yet another extension if we
> wanted to ensure that all NBD transmission packets started on an
> 8-byte boundary after option haggling has completed.
> 
> Note that NBD_INFO_BLOCK_SIZE still advertises only a 32-bit value for
> maximum payload size.  As of this patch, it is assumed that most
> clients will still be limiting NBD_CMD_READ requests to a much smaller
> cap of 32M (the portable payload limit if nothing was advertised) or
> 64M (nbdkit chose this limit, and a client may know it is talking to
> an nbdkit server even without explicit advertisement); so keeping a
> 32-bit payload size is still fine even while benefittng from a 64-bit
> effect size.  At any rate, this patch intentionally does not worry
> about a client and server that can mutually agree to a maximum payload
> larger than 4G by some means other than NBD_INFO_BLOCK_SIZE (we can
> standardize it as a future extension if someone demonstrates a use
> case for it); meanwhile, NBD_REPLY_TYPE_OFFSET_DATA will work as-is
> with larger payload (since its length is part of the extended header),
> but for holes, a server would have to either add a 64-bit counterpart
> to NBD_REPLY_TYPE_OFFSET_HOLE or split its hole responses over
> multiple reply chunks.
> 
> But for NBD_CMD_BLOCK_STATUS, it is very useful to be able to report a
> status extent with a size larger than 32-bits, in some cases even if
> the client's request was for an effect length smaller than 32-bits
> (such as when it is known that the entire image is not sparse).
> Consideration was given on whether to require that once extended
> headers are negotiated, only a new 64-bit block status reply type can
> be used; but in proof-of-concept implementations, I found it easy
> enough to have both clients and servers to support both size block
> status replies at all times, rather than being picky about the reply
> type corresponding to whether extended headers were negotiated.
> 
> This spec addition was done in parallel with proof of concept
> implementations in qemu (server and client), libnbd (client), and
> nbdkit (server).
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> 
> ---
> 
> v3: prohibit NBD_OPT_EXPORT_NAME, clarify more regarding
> NBD_REP_ERR_EXT_HEADER_REQD, wording tweaks
> ---
>  doc/proto.md | 502 +++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 371 insertions(+), 131 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 2651f13..9098c42 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -280,36 +280,55 @@ a soft disconnect.
> 
>  ### Transmission
> 
> -There are three message types in the transmission phase: the request,
> -the simple reply, and the structured reply chunk.  The
> +There are two general message types in the transmission phase: the
> +request (simple or extended), and the reply (simple, structured, or
> +extended).  The determination of which message headers to use is
> +determined during handshaking phase, based on whether
> +`NBD_OPT_STRUCTURED_REPLY` or `NBD_OPT_EXTENDED_HEADERS` was requested
> +by the client and given a successful response by the server.  The
>  transmission phase consists of a series of transactions, where the
>  client submits requests and the server sends corresponding replies
>  with either a single simple reply or a series of one or more
> -structured reply chunks per request.  The phase continues until
> -either side terminates transmission; this can be performed cleanly
> -only by the client.
> +structured or extended reply chunks per request.  The phase continues
> +until either side terminates transmission; this can be performed
> +cleanly only by the client.
> 
>  Note that without client negotiation, the server MUST use only simple
>  replies, and that it is impossible to tell by reading the server
>  traffic in isolation whether a data field will be present; the simple
>  reply is also problematic for error handling of the `NBD_CMD_READ`
> -request.  Therefore, structured replies can be used to create a
> -context-free server stream; see below.
> +request.  Therefore, structured or extended replies can be used to
> +create a context-free server stream; see below.
> +
> +The results of client negotiation also determine whether the client
> +and server will utilize only compact requests and replies, or whether
> +both sides will use only extended packets.  Compact messages are the
> +default, but inherently limit single transactions to a 32-bit window
> +starting at a 64-bit offset.  Extended messages make it possible to
> +perform 64-bit transactions (although typically only for commands that
> +do not include a data payload).  Furthermore, when only structured
> +replies have been negotiated, compact messages require the client to
> +perform partial reads to determine which reply packet style (16-byte
> +simple or 20-byte structured) is on the wire before knowing the length
> +of the rest of the reply, which can reduce client performance.  With
> +extended messages, all packet headers have a fixed length of 32 bytes,
> +and although this results in more traffic over the network, the
> +resulting layout is friendlier for performance.
> 
>  Replies need not be sent in the same order as requests (i.e., requests
> -may be handled by the server asynchronously), and structured reply
> -chunks from one request may be interleaved with reply messages from
> -other requests; however, there may be constraints that prevent
> -arbitrary reordering of structured reply chunks within a given reply.
> +may be handled by the server asynchronously), and structured or
> +extended reply chunks from one request may be interleaved with reply
> +messages from other requests; however, there may be constraints that
> +prevent arbitrary reordering of reply chunks within a given reply.
>  Clients SHOULD use a cookie that is distinct from all other currently
>  pending transactions, but MAY reuse cookies that are no longer in
>  flight; cookies need not be consecutive.  In each reply message
> -(whether simple or structured), the server MUST use the same value for
> -cookie as was sent by the client in the corresponding request,
> -treating the cookie as an opaque field.  In this way, the client can
> -correlate which request is receiving a response.  Note that earlier
> -versions of this specification referred to a client's cookie as a
> -handle.
> +(whether simple, structured, or extended), the server MUST use the
> +same value for cookie as was sent by the client in the corresponding
> +request, treating the cookie as an opaque field.  In this way, the
> +client can correlate which request is receiving a response.  Note that
> +earlier versions of this specification referred to a client's cookie
> +as a handle.
> 
>  #### Ordering of messages and writes
> 
> @@ -346,7 +365,10 @@ may be useful.
> 
>  #### Request message
> 
> -The request message, sent by the client, looks as follows:
> +The compact request message is sent by the client when extended
> +transactions are not in use (either the client did not request
> +extended headers during negotiation, or the server responded that
> +`NBD_OPT_EXTENDED_HEADERS` is unsupported), and looks as follows:
> 
>  C: 32 bits, 0x25609513, magic (`NBD_REQUEST_MAGIC`)  
>  C: 16 bits, command flags  
> @@ -356,19 +378,54 @@ C: 64 bits, offset (unsigned)
>  C: 32 bits, length (unsigned)  
>  C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  
> 
> +In the compact style, the client MUST NOT use the
> +`NBD_CMD_FLAG_PAYLOAD_LEN` flag; and the only command where *length*
> +represents payload length instead of effect length is `NBD_CMD_WRITE`.
> +
> +If negotiation agreed on extended transactions with
> +`NBD_OPT_EXTENDED_HEADERS`, the client instead uses extended requests:
> +
> +C: 32 bits, 0x21e41c71, magic (`NBD_EXTENDED_REQUEST_MAGIC`)  
> +C: 16 bits, command flags  
> +C: 16 bits, type  
> +C: 64 bits, cookie  
> +C: 64 bits, offset (unsigned)  
> +C: 64 bits, payload/effect length (unsigned)  
> +C: (*length* bytes of data if *flags* includes `NBD_CMD_FLAG_PAYLOAD_LEN`)  
> +
> +With extended headers, the meaning of the *length* field depends on
> +whether *flags* contains `NBD_CMD_FLAG_PAYLOAD_LEN` (that many
> +additional bytes of payload are present), or if the flag is absent
> +(there is no payload, and *length* instead is an effect length
> +describing how much of the export the request operates on).  The
> +command `NBD_CMD_WRITE` MUST use the flag `NBD_CMD_FLAG_PAYLOAD_LEN`
> +in this mode; while other commands SHOULD avoid the flag if the
> +server has not indicated extension suppport for payloads on that
> +command.  A server SHOULD initiate hard disconnect if a client sets
> +the `NBD_CMD_FLAG_PAYLOAD_LEN` flag and uses a *length* larger than
> +a server's advertised or default maximum payload length (capped at
> +32 bits by the constraints of `NBD_INFO_BLOCK_SIZE`); in all other
> +cases, a server SHOULD gracefully consume *length* bytes of payload
> +(even if it then replies with an `NBD_EINVAL` failure because the
> +particular command was not expecting a payload), and proceed with
> +the next client command.  Thus, only when *length* is used as an
> +effective length will it utilize a full 64-bit value.

Should this not say "effect length" rather than "effective length"?

[...]
>  #### Terminating the transmission phase
> 
>  There are two methods of terminating the transmission phase:
> @@ -843,22 +941,22 @@ client controls the payload length (`NBD_CMD_WRITE`, or `NBD_CMD_READ`
>  with simple replies), the client MUST NOT request a length larger than
>  the maximum payload size. For replies where the payload length is
>  controlled by the server (`NBD_CMD_BLOCK_STATUS` without the flag
> -`NBD_CMD_FLAG_REQ_ONE`, or `NBD_CMD_READ` when structured replies are
> -negotiated), the server MAY exceed the maximum payload by the fixed
> -amount of overhead required in the structured reply (for example, a
> -server that advertises a maximum payload of 2^25 bytes may return
> -2^25+8 payload bytes in a single `NBD_REPLY_TYPE_OFFSET_DATA` chunk,
> -rather than splitting the reply across two chunks), although it MUST
> -honor any additional payload constraints documented for a particular
> -command.  For commands that do not require a payload in either
> -direction (such as `NBD_CMD_TRIM` or `NBD_CMD_WRITE_ZEROES`), the
> -client MAY request an effect length larger than the maximum payload
> -size; the server SHOULD NOT disconnect, but MAY reply with an
> -`NBD_EOVERFLOW` or `NBD_EINVAL` error if the oversize request would
> -require too many server resources when compared to the same command
> -with an effect length limited to the maximum payload size (such as an
> -implementation of `NBD_CMD_WRITE_ZEROES` that utilizes a scratch
> -buffer).
> +`NBD_CMD_FLAG_REQ_ONE`, or `NBD_CMD_READ` when structured replies or
> +extended headers are negotiated), the server MAY exceed the maximum
> +payload by the fixed amount of overhead required in the structured
> +reply (for example, a server that advertises a maximum payload of 2^25
> +bytes may return 2^25+8 payload bytes in a single
> +`NBD_REPLY_TYPE_OFFSET_DATA` chunk, rather than splitting the reply
> +across two chunks), although it MUST honor any additional payload
> +constraints documented for a particular command.  For commands that do
> +not require a payload in either direction (such as `NBD_CMD_TRIM` or
> +`NBD_CMD_WRITE_ZEROES`), the client MAY request an effect length
> +larger than the maximum payload size; the server SHOULD NOT
> +disconnect, but MAY reply with an `NBD_EOVERFLOW` or `NBD_EINVAL`

Should we perhaps encourage NBD_EOVERFLOW over NBD_EINVAL here? Overflow
seems clearer on what the reason is for the rejection.

[...]
> @@ -1852,6 +2043,43 @@ small amount of fixed-length overhead inherent in the chunk type).
>    extent information at the first offset not covered by a
>    reduced-length reply.
> 
> +* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
> +
> +  This chunk type is in the status chunk category.  *length* MUST be
> +  8 + (a positive multiple of 16).  The semantics of this chunk mirror
> +  those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
> +  larger *extent length* field, added padding in each descriptor to
> +  ease alignment, and the addition of a *descriptor count* field that
> +  can be used for easier client processing.  This chunk type MUST NOT
> +  be used unless extended headers were negotiated with
> +  `NBD_OPT_EXTENDED_HEADERS`.
> +
> +  If the *descriptor count* field contains 0, the number of subsequent
> +  descriptors is determined solely by the *length* field of the reply
> +  header.  However, the server MAY populate the *descriptor count*
> +  field with the number of descriptors that follow; when doing this,
> +  the server MUST ensure that the header *length* is equal to
> +  *descriptor count* * 16 + 8.

This feels superfluous to me.

Descriptor count may be zero, in which case the length is relevant. If
descriptor count is not zero, then length is *also* relevant, because we
need to check the payload length anyway.

So why do we have descriptor count in the first place? I don't see the
benefit. A client cannot ignore the length, because some servers may not
send a descriptor count to begin with. If a client receives a message
with a descriptor count that does not match the length it received, it
cannot send an error to the server, and there would be little point in
doing so anyway. The most it can do is abort the connection for what
would be a bug in the server, and/or tell the user.

I think the only thing this will do is introduce a potential for errors.
Do we need it? Personally, I don't think we do. Am I missing something?

I think a descriptor count is useful if we guarantee that it will always
be there. Otherwise, I'm not convinced it's worth adding.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

