Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EC83ED9E5
	for <lists+nbd@lfdr.de>; Mon, 16 Aug 2021 17:31:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 07AC920680; Mon, 16 Aug 2021 15:31:39 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 16 15:31:38 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9FF1B20384
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Aug 2021 15:31:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rzYzYZ51yyjj for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Aug 2021 15:31:25 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id EF67520059
	for <nbd@other.debian.org>; Mon, 16 Aug 2021 15:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=e4FWYkGre1yDbaWZTOBPKeYng7wtqhGNrIJ5/gir4/I=; b=QMcvJzkEcCzL0Z7iETmz8rugFa
	7r7JFpuTTspdx9d1CYkydSru8WJd5TBnlHL7KVVSXrUEVuTro5fBeX0W6PDdFd+R+UIDAUQfOdh1k
	zdsCAmrR04WTsTqW1NCKqRIKi9HQb7I2A0pp6yUyC1XKgA1bqLxNpkZGdM8pVsCdclFdChjSwui64
	K3Khpcnj+PIk3gZUgAC7v0WbcQGeVQhXIyjJXMc7bAZltnOcj7yKFXacSZorgdEdWadh7e7bDE/bp
	qWwiYQEL2RR145NSlYLPHJvR1Ius/IC2EhCn9hJLUEzhIZ3IeqaGozhSM3haOXsVG94/LIiKCIwHT
	S9Xra0tA==;
Received: from [102.39.40.13] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mFeaB-003wNW-A4; Mon, 16 Aug 2021 17:31:23 +0200
Received: from wouter by pc181009 with local (Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mFeZz-000KDb-4h; Mon, 16 Aug 2021 17:31:11 +0200
Date: Mon, 16 Aug 2021 17:31:10 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com
Subject: Re: [PATCH] spec: Clarify STARTTLS vs. SET_META_CONTEXT interaction
Message-ID: <YRqEvhxOoytetJfo@pc181009.grep.be>
References: <20210812152040.2752184-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812152040.2752184-1-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RCYjipRjaGG.A.JhC.aToGhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1291
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YRqEvhxOoytetJfo@pc181009.grep.be
Resent-Date: Mon, 16 Aug 2021 15:31:39 +0000 (UTC)

On Thu, Aug 12, 2021 at 10:20:40AM -0500, Eric Blake wrote:
> Consider a SELECTIVETLS server and a MitM attacker, under the
> following NBD_OPT_ handshake scenario:
> 
>  client:                  mitm:                    server:
>  > _STARTTLS
>                           > _SET_META_CONTEXT("A")
>                                                    < _REP_META_CONTEXT
>                                                    < _REP_ACK
>                           > _STARTTLS
>                                                    < _REP_ACK
>                           < _REP_ACK
>  > _SET_META_CONTEXT("B")
>                           < _REP_META_CONTEXT
>                           < _REP_ACK
>  > _GO
>                           > _GO
>                                                    < _REP_ACK
>                           < _REP_ACK
>  > NBD_CMD_BLOCK_STATUS
> 
> While this scenario requires the MitM to be able to use encryption to
> speak to the client (and thus a less likely scenario than a true
> protocol downgrade or plaintext buffering attack), it results in a
> situation where the client is asking for information on context "B",
> but where the server only saw a request for context "A", which may
> result in the client interpreting the results of BLOCK_STATUS
> incorrectly even though it is coming over an encrypted connection.
> 
> The safest fix to this is to require that a server cannot use any meta
> context requests from prior to enabling encryption with any successful
> NBD_OPT_GO after encryption.  At this point, the spec already states
> that the server should then return an error (the client is asking for
> block status without proper negotiation), which is better than letting
> the client blindly misinterpret a response sent for a different meta
> context.
> 
> To date, the only known server that has implemented TLS with
> SELECTIVETLS mode as well as support for NBD_OPT_SET_META_CONTEXT is
> nbdkit (qemu-nbd only has FORCEDTLS mode, and nbd-server lacks meta
> context support); thankfully, that implementation is in already line
> with this stricter requirement.
> ---
>  doc/proto.md | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/doc/proto.md b/doc/proto.md
> index 61d57b5..7155b42 100644
> --- a/doc/proto.md
> +++ b/doc/proto.md
> @@ -1165,6 +1165,14 @@ of the newstyle negotiation.
>      permitted by this document (for example, `NBD_REP_ERR_INVALID` if
>      the client included data).
> 
> +    When this command succeeds, the server MUST NOT preserve any
> +    per-export state (such as metadata contexts from
> +    `NBD_OPT_SET_META_CONTEXT`) issued before this command.  The
> +    server MAY preserve global state such as a client request for
> +    `NBD_OPT_STRUCTURED_REPLY`; however, a client SHOULD defer other
> +    stateful option requests until after it determines whether
> +    encryption is available.

I'm not sure I think that makes sense. It's safer to require that
STARTTLS wipes out everything.

There are two reasonable ways of communicating with a server that
supports opportunistic TLS: either you enable TLS as soon as possible
after opening the connection (and then you should do any state
modification after the STARTTLS command), or you don't do any STARTTLS
at all, ever (and then all state settings are done in the unencrypted
connection). Anything else seems like a silly idea.

As such, I think trying to support ways in which you configure things
before STARTTLS, then do STARTTLS, and then expect things to retain
state, is bound to invite security issues, and we should not even try to
support it.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

