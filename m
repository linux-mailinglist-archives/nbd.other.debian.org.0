Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A924E67D7
	for <lists+nbd@lfdr.de>; Thu, 24 Mar 2022 18:32:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0D99220341; Thu, 24 Mar 2022 17:32:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Mar 24 17:32:19 2022
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=4.0 tests=CR_SYSTEM8,DIGITS_LETTERS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 45E8920330
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Mar 2022 17:32:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.09 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CR_SYSTEM8=3, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DHyZQDJsmZoA for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Mar 2022 17:32:04 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DE00B20309
	for <nbd@other.debian.org>; Thu, 24 Mar 2022 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=u5sPssR6LFWnK8abW58smZkWt9oyANLFAfbGfMaOlfY=; b=dHezyUlaBK99GqS+jl+cUQL/ie
	Q+rpSoDYwquBEuYRQaT897LCB6l6juGtkXVnQPhHzNhglhhIa8DqoH8Gp6n+GQqpo313+eDJfVyuH
	mPMiAswRg6r1W/RPcFVlCPMWzu9z1Dlf1Lj5u73rTvveSwUSG1pLBvm9sOf5lqvqFX92O/w7WunPm
	b8w0RKsdBIBP+/nwyDhW4NqP3QHuhdMlK+5OiyLMK3x9UAEP/lCQ0fTgQbMcIJkRBEPvRjFs881sO
	PypvwRn5hbmoEapjBTVYtAW+8zxGspQ6gjYaXWwpmT9JNsd1iX14cO5tTMkDyffizq7BQoN3yLaeZ
	N+tQ6BhQ==;
Received: from [197.245.197.46] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1nXRJZ-009awk-73; Thu, 24 Mar 2022 18:32:01 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1nXRJM-0002by-Ah;
	Thu, 24 Mar 2022 19:31:48 +0200
Date: Thu, 24 Mar 2022 19:31:48 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	vsementsov@virtuozzo.com, libguestfs@redhat.com, nsoffer@redhat.com
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <YjyrBLhG5ph6UA/E@pc181009.grep.be>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203231434.3900824-1-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xzzGyOELzdC.A.fTG.jsKPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1774
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YjyrBLhG5ph6UA/E@pc181009.grep.be
Resent-Date: Thu, 24 Mar 2022 17:32:19 +0000 (UTC)

Hi Eric,

Thanks for the ping; it had slipped my mind.

On Fri, Dec 03, 2021 at 05:14:34PM -0600, Eric Blake wrote:
>  #### Request message
> 
> -The request message, sent by the client, looks as follows:
> +The compact request message, sent by the client when extended
> +transactions are not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> +looks as follows:
> 
>  C: 32 bits, 0x25609513, magic (`NBD_REQUEST_MAGIC`)  
>  C: 16 bits, command flags  
> @@ -353,14 +370,26 @@ C: 64 bits, offset (unsigned)
>  C: 32 bits, length (unsigned)  
>  C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  
> 
> +If negotiation agreed on extended transactions with
> +`NBD_OPT_EXTENDED_HEADERS`, the client instead uses extended requests:
> +
> +C: 32 bits, 0x21e41c71, magic (`NBD_REQUEST_EXT_MAGIC`)  
> +C: 16 bits, command flags  
> +C: 16 bits, type  
> +C: 64 bits, handle  
> +C: 64 bits, offset (unsigned)  
> +C: 64 bits, length (unsigned)  
> +C: (*length* bytes of data if the request is of type `NBD_CMD_WRITE`)  
> +

Perhaps we should decouple the ideas of "effect length" and "payload
length"? As in,

C: 32 bits, 0x21e41c71, magic (`NBD_REQUEST_EXT_MAGIC`)
C: 16 bits, command flags
C: 16 bits, type
C: 64 bits, handle
C: 64 bits, offset
C: 64 bits, effect length
C: 64 bits, payload length
C: (*payload length* bytes of data)

This makes the protocol more context free. With the current set of
commands, only NBD_CMD_WRITE would have payload length be nonzero, but
that doesn't have to remain the case forever; e.g., we could have a
command that extends NBD_CMD_BLOCK_STATUS to only query a subset of the
metadata contexts that we declared (if that is wanted, of course).

Of course, that does have the annoying side effect of no longer fitting
in 32 bytes, requiring a 40-byte header instead. I think it would be
worth it though.

(This is obviously not relevant for reply messages, only for request
messages)

>  #### Simple reply message
> 
>  The simple reply message MUST be sent by the server in response to all
>  requests if structured replies have not been negotiated using
> -`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been negotiated, a simple
> -reply MAY be used as a reply to any request other than `NBD_CMD_READ`,
> -but only if the reply has no data payload.  The message looks as
> -follows:
> +`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been
> +negotiated, a simple reply MAY be used as a reply to any request other
> +than `NBD_CMD_READ`, but only if the reply has no data payload.  If
> +extended headers were not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> +the message looks as follows:
> 
>  S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
>     `NBD_REPLY_MAGIC`)  
> @@ -369,6 +398,16 @@ S: 64 bits, handle
>  S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
>      *error* is zero)  
> 
> +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> +the message looks like:
> +
> +S: 32 bits, 0x60d12fd6, magic (`NBD_SIMPLE_REPLY_EXT_MAGIC`)  
> +S: 32 bits, error (MAY be zero)  
> +S: 64 bits, handle  
> +S: 128 bits, padding (MUST be zero)  

Should all these requirements about padding not be a SHOULD rather than
a MUST?

[...]
> +* `NBD_OPT_EXTENDED_HEADERS` (11)
> +
> +    The client wishes to use extended headers during the transmission
> +    phase.  The client MUST NOT send any additional data with the
> +    option, and the server SHOULD reject a request that includes data
> +    with `NBD_REP_ERR_INVALID`.
> +
> +    The server replies with the following, or with an error permitted
> +    elsewhere in this document:
> +
> +    - `NBD_REP_ACK`: Extended headers have been negotiated; the client
> +      MUST use the 32-byte extended request header, and the server
> +      MUST use the 32-byte extended reply header.
> +    - For backwards compatibility, clients SHOULD be prepared to also
> +      handle `NBD_REP_ERR_UNSUP`; in this case, only the compact
> +      transmission headers will be used.
> +
> +    If the client requests `NBD_OPT_STARTTLS` after this option, it
> +    MUST renegotiate extended headers.
> +

Two thoughts here:

- We should probably allow NBD_REP_ERR_BLOCK_SIZE_REQD as a reply to
  this message; I could imagine a server might not want to talk 64-bit
  lengths if it doesn't know that block sizes are going to be
  reasonable.
- In the same vein, should we perhaps also add an error message for when
  extended headers are negotiated without structured replies? Perhaps a
  server implementation might not want to implement the "extended
  headers but no structured replies" message format.

On that note, while I know I had said earlier that I would prefer not
making this new extension depend on structured replies, in hindsight
perhaps it *is* a good idea to add that dependency; otherwise we create
an extra message format that is really a degenerate case of "we want to
be modern in one way but not in another", and that screams out to me
"I'm not going to be used much, look at me for security issues!"

Which perhaps is not a very good idea.

[...]
-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

