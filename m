Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCD86E6870
	for <lists+nbd@lfdr.de>; Tue, 18 Apr 2023 17:42:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A8AE920C04; Tue, 18 Apr 2023 15:42:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 18 15:42:58 2023
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SARE_MSGID_LONG45,SARE_MSGID_LONG50,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 230C220BFF
	for <lists-other-nbd@bendel.debian.org>; Tue, 18 Apr 2023 15:42:46 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.463 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H2=-0.001, SARE_MSGID_LONG45=0.893,
	SARE_MSGID_LONG50=0.726] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GZOg7-jGbM9S for <lists-other-nbd@bendel.debian.org>;
	Tue, 18 Apr 2023 15:42:41 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id D914C2042B
	for <nbd@other.debian.org>; Tue, 18 Apr 2023 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681832555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0SJ5FuvwagiJ0aGfjMy9jYzn5uI93jRc6nCHzFJUqxg=;
	b=a2TxqRbv7Fyakad+yEZWApFm35/xybut8wmov1Y3JzisweqyhWxuj5CIy7O+xZEM2O2Eb+
	osMmj/n9rJPuh42iYkZ/rVbqRJPiCGvVcu+Mh/1SzrKlgiAZnJbBjFr47zk+G9wYosn5x8
	3Tfivgp1fvMwH+uJAh8YKzlVpUbaqFM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-O4CcVqI8PaaL7NnhyqJ82A-1; Tue, 18 Apr 2023 11:42:34 -0400
X-MC-Unique: O4CcVqI8PaaL7NnhyqJ82A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA6FF101A553;
	Tue, 18 Apr 2023 15:42:33 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.177])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3DF91121314;
	Tue, 18 Apr 2023 15:42:15 +0000 (UTC)
Date: Tue, 18 Apr 2023 10:42:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com
Subject: Re: [PATCH v3 3/6] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <hl3dmu7uire3sj2is4jjwlshgciwn2q3jxiosru6cj5huwu7m3@gf6k6v6wrmwj>
References: <20230413220241.1396012-1-eblake@redhat.com>
 <20230413220241.1396012-4-eblake@redhat.com>
 <ZD6HTxZioiBRvI+6@pc220518.home.grep.be>
MIME-Version: 1.0
In-Reply-To: <ZD6HTxZioiBRvI+6@pc220518.home.grep.be>
User-Agent: NeoMutt/20230407
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rPMKiHa5GQG.A.w0C.CqrPkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2436
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/hl3dmu7uire3sj2is4jjwlshgciwn2q3jxiosru6cj5huwu7m3@gf6k6v6wrmwj
Resent-Date: Tue, 18 Apr 2023 15:42:58 +0000 (UTC)

On Tue, Apr 18, 2023 at 02:04:31PM +0200, Wouter Verhelst wrote:
> On Thu, Apr 13, 2023 at 05:02:38PM -0500, Eric Blake wrote:
> > Add a new negotiation feature where the client and server agree to use
> > larger packet headers on every packet sent during transmission phase.
> > This has two purposes: first, it makes it possible to perform
> > operations like trim, write zeroes, and block status on more than 2^32
> > bytes in a single command.  While at it, this is a great opportunity
> > to declare that any client opting in to extended headers will use
> > NBD_OPT_GO instead of the weaker NBD_OPT_EXPORT_NAME.
> > 
> > +If negotiation agreed on extended transactions with
> > +`NBD_OPT_EXTENDED_HEADERS`, the client instead uses extended requests:
> > +
> > +C: 32 bits, 0x21e41c71, magic (`NBD_EXTENDED_REQUEST_MAGIC`)  
> > +C: 16 bits, command flags  
> > +C: 16 bits, type  
> > +C: 64 bits, cookie  
> > +C: 64 bits, offset (unsigned)  
> > +C: 64 bits, payload/effect length (unsigned)  
> > +C: (*length* bytes of data if *flags* includes `NBD_CMD_FLAG_PAYLOAD_LEN`)  
> > +
> > +With extended headers, the meaning of the *length* field depends on
> > +whether *flags* contains `NBD_CMD_FLAG_PAYLOAD_LEN` (that many
> > +additional bytes of payload are present), or if the flag is absent
> > +(there is no payload, and *length* instead is an effect length
> > +describing how much of the export the request operates on).  The
> > +command `NBD_CMD_WRITE` MUST use the flag `NBD_CMD_FLAG_PAYLOAD_LEN`
> > +in this mode; while other commands SHOULD avoid the flag if the
> > +server has not indicated extension suppport for payloads on that
> > +command.  A server SHOULD initiate hard disconnect if a client sets
> > +the `NBD_CMD_FLAG_PAYLOAD_LEN` flag and uses a *length* larger than
> > +a server's advertised or default maximum payload length (capped at
> > +32 bits by the constraints of `NBD_INFO_BLOCK_SIZE`); in all other
> > +cases, a server SHOULD gracefully consume *length* bytes of payload
> > +(even if it then replies with an `NBD_EINVAL` failure because the
> > +particular command was not expecting a payload), and proceed with
> > +the next client command.  Thus, only when *length* is used as an
> > +effective length will it utilize a full 64-bit value.
> 
> Should this not say "effect length" rather than "effective length"?

Yes, I like that wording, will incorporate.

> 
> [...]
> >  #### Terminating the transmission phase
> > 
> >  There are two methods of terminating the transmission phase:
> > @@ -843,22 +941,22 @@ client controls the payload length (`NBD_CMD_WRITE`, or `NBD_CMD_READ`
> >  with simple replies), the client MUST NOT request a length larger than
> >  the maximum payload size. For replies where the payload length is
> >  controlled by the server (`NBD_CMD_BLOCK_STATUS` without the flag
> > -`NBD_CMD_FLAG_REQ_ONE`, or `NBD_CMD_READ` when structured replies are
> > -negotiated), the server MAY exceed the maximum payload by the fixed
> > -amount of overhead required in the structured reply (for example, a
> > -server that advertises a maximum payload of 2^25 bytes may return
> > -2^25+8 payload bytes in a single `NBD_REPLY_TYPE_OFFSET_DATA` chunk,
> > -rather than splitting the reply across two chunks), although it MUST
> > -honor any additional payload constraints documented for a particular
> > -command.  For commands that do not require a payload in either
> > -direction (such as `NBD_CMD_TRIM` or `NBD_CMD_WRITE_ZEROES`), the
> > -client MAY request an effect length larger than the maximum payload
> > -size; the server SHOULD NOT disconnect, but MAY reply with an
> > -`NBD_EOVERFLOW` or `NBD_EINVAL` error if the oversize request would
> > -require too many server resources when compared to the same command
> > -with an effect length limited to the maximum payload size (such as an
> > -implementation of `NBD_CMD_WRITE_ZEROES` that utilizes a scratch
> > -buffer).
> > +`NBD_CMD_FLAG_REQ_ONE`, or `NBD_CMD_READ` when structured replies or
> > +extended headers are negotiated), the server MAY exceed the maximum
> > +payload by the fixed amount of overhead required in the structured
> > +reply (for example, a server that advertises a maximum payload of 2^25
> > +bytes may return 2^25+8 payload bytes in a single
> > +`NBD_REPLY_TYPE_OFFSET_DATA` chunk, rather than splitting the reply
> > +across two chunks), although it MUST honor any additional payload
> > +constraints documented for a particular command.  For commands that do
> > +not require a payload in either direction (such as `NBD_CMD_TRIM` or
> > +`NBD_CMD_WRITE_ZEROES`), the client MAY request an effect length
> > +larger than the maximum payload size; the server SHOULD NOT
> > +disconnect, but MAY reply with an `NBD_EOVERFLOW` or `NBD_EINVAL`
> 
> Should we perhaps encourage NBD_EOVERFLOW over NBD_EINVAL here? Overflow
> seems clearer on what the reason is for the rejection.

NBD_EOVERFLOW is newer; we have to tolerate NBD_EINVAL for back-compat
reasons, but I do like the idea of stressing EOVERFLOW as providing
more useful information to the client.

> 
> [...]
> > @@ -1852,6 +2043,43 @@ small amount of fixed-length overhead inherent in the chunk type).
> >    extent information at the first offset not covered by a
> >    reduced-length reply.
> > 
> > +* `NBD_REPLY_TYPE_BLOCK_STATUS_EXT` (6)
> > +
> > +  This chunk type is in the status chunk category.  *length* MUST be
> > +  8 + (a positive multiple of 16).  The semantics of this chunk mirror
> > +  those of `NBD_REPLY_TYPE_BLOCK_STATUS`, other than the use of a
> > +  larger *extent length* field, added padding in each descriptor to
> > +  ease alignment, and the addition of a *descriptor count* field that
> > +  can be used for easier client processing.  This chunk type MUST NOT
> > +  be used unless extended headers were negotiated with
> > +  `NBD_OPT_EXTENDED_HEADERS`.
> > +
> > +  If the *descriptor count* field contains 0, the number of subsequent
> > +  descriptors is determined solely by the *length* field of the reply
> > +  header.  However, the server MAY populate the *descriptor count*
> > +  field with the number of descriptors that follow; when doing this,
> > +  the server MUST ensure that the header *length* is equal to
> > +  *descriptor count* * 16 + 8.
> 
> This feels superfluous to me.
> 
> Descriptor count may be zero, in which case the length is relevant. If
> descriptor count is not zero, then length is *also* relevant, because we
> need to check the payload length anyway.
> 
> So why do we have descriptor count in the first place? I don't see the
> benefit. A client cannot ignore the length, because some servers may not
> send a descriptor count to begin with. If a client receives a message
> with a descriptor count that does not match the length it received, it
> cannot send an error to the server, and there would be little point in
> doing so anyway. The most it can do is abort the connection for what
> would be a bug in the server, and/or tell the user.
> 
> I think the only thing this will do is introduce a potential for errors.
> Do we need it? Personally, I don't think we do. Am I missing something?
> 
> I think a descriptor count is useful if we guarantee that it will always
> be there. Otherwise, I'm not convinced it's worth adding.

When I first designed the reply, I noticed that the 64-bit members
were not naturally aligned unless I added padding; then in
implementing things, I determined that the padding actually proved
useful.  I agree with your assessment that ALWAYS providing a
descriptor count is going to be fewer corner cases to worry about than
letting servers not have to worry about a descriptor count.

If we argue that a descriptor count is easier to use, that also lends
a stronger argument to your claim that once extended headers are
negotiated, a server MUST use only the 64-bit block status reply chunk
(again, fewer corner case tests of how to populate the missing
descriptor count field of 32-bit block length).

So, here's two proposed followups to squash in.  The first is obvious:
======

diff --git i/doc/proto.md w/doc/proto.md
index 7918179..14f9bba 100644
--- i/doc/proto.md
+++ w/doc/proto.md
@@ -952,7 +952,8 @@ constraints documented for a particular command.  For commands that do
 not require a payload in either direction (such as `NBD_CMD_TRIM` or
 `NBD_CMD_WRITE_ZEROES`), the client MAY request an effect length
 larger than the maximum payload size; the server SHOULD NOT
-disconnect, but MAY reply with an `NBD_EOVERFLOW` or `NBD_EINVAL`
+disconnect, but MAY reply with an `NBD_EOVERFLOW` (preferred)
+or `NBD_EINVAL` (for backwards compatibility)
 error if the oversize request would require too many server resources
 when compared to the same command with an effect length limited to the
 maximum payload size (such as an implementation of
@@ -2054,17 +2055,14 @@ small amount of fixed-length overhead inherent in the chunk type).
   be used unless extended headers were negotiated with
   `NBD_OPT_EXTENDED_HEADERS`.

-  If the *descriptor count* field contains 0, the number of subsequent
-  descriptors is determined solely by the *length* field of the reply
-  header.  However, the server MAY populate the *descriptor count*
-  field with the number of descriptors that follow; when doing this,
-  the server MUST ensure that the header *length* is equal to
+  The *descriptor count* field MUST correspond to the number of subsequent
+  descriptors, such that the header *length* is equal to
   *descriptor count* * 16 + 8.

   The payload starts with:

   32 bits, metadata context ID  
-  32 bits, descriptor count  
+  32 bits, descriptor count (MUST be nonzero)  

   and is followed by a list of one or more descriptors, each with this
   layout:
@@ -2480,8 +2480,8 @@ The following request types exist:

     A client MAY initiate a hard disconnect if it detects that the
     server has sent an invalid chunk. The server SHOULD return
-    `NBD_EINVAL` if it receives a `NBD_CMD_BLOCK_STATUS` request including
-    one or more sectors beyond the size of the device.
+    `NBD_EINVAL` if it receives a `NBD_CMD_BLOCK_STATUS` request with
+    an effect length exceeding the size of the export.

 * `NBD_CMD_RESIZE` (8)


======

while the second is a bit stricter (I'm not sure if I would have done
it on my own, but I don't mind the fallout that it implies to my proof
of concept patches to qemu and libnbd if we want it):

======


diff --git i/doc/proto.md w/doc/proto.md
index 14f9bba..8b68c98 100644
--- i/doc/proto.md
+++ w/doc/proto.md
@@ -1997,7 +1997,9 @@ small amount of fixed-length overhead inherent in the chunk type).

 * `NBD_REPLY_TYPE_BLOCK_STATUS` (5)

-  This chunk type is in the status chunk category.  *length* MUST be
+  This chunk type is in the status chunk category, and a server may
+  only use this type if extended headers were not negotiated via
+  `NBD_OPT_EXTENDED_HEADERS`.  *length* MUST be
   4 + (a positive integer multiple of 8).  This reply represents a
   series of consecutive block descriptors where the sum of the length
   fields within the descriptors is subject to further constraints
@@ -2072,11 +2074,9 @@ small amount of fixed-length overhead inherent in the chunk type).
   32 bits, padding (MUST be zero)  
   32 bits, status flags  

-  Note that when extended headers are in use, the client MUST be
-  prepared for the server to use either the compact or extended chunk
-  type, regardless of whether the client's hinted effect length was
-  more or less than 32 bits; but the server MUST use exactly one of
-  the two chunk types per negotiated metacontext ID.
+  Note that when extended headers are in use, the extended reply chunk
+  MUST be used even when the client's hinted effect length was less
+  than 32 bits.

 All error chunk types have bit 15 set, and begin with the same
 *error*, *message length*, and optional *message* fields as
@@ -2433,8 +2433,8 @@ The following request types exist:
     This in turn requires the client to first negotiate structured
     replies or extended headers. For a successful return, the server
     MUST use one reply chunk per selected context id (only
-    `NBD_REPLY_TYPE_BLOCK_STATUS` for structured replies, and either
-    `NBD_REPLY_TYPE_BLOCK_STATUS` or `NBD_REPLY_TYPE_BLOCK_STATUS_EXT`
+    `NBD_REPLY_TYPE_BLOCK_STATUS` for structured replies, and only
+    `NBD_REPLY_TYPE_BLOCK_STATUS_EXT`
     for extended headers).  The status field of each descriptor is
     determined by the flags field as defined by the metadata context.
     The server MAY send chunks in a different order than the context



-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

