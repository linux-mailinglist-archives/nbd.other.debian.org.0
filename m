Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 882493F1AFA
	for <lists+nbd@lfdr.de>; Thu, 19 Aug 2021 15:55:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 372BA208F7; Thu, 19 Aug 2021 13:55:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 19 13:55:08 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8B193208F6
	for <lists-other-nbd@bendel.debian.org>; Thu, 19 Aug 2021 13:54:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LlOd5qgHtSrI for <lists-other-nbd@bendel.debian.org>;
	Thu, 19 Aug 2021 13:54:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A9A7F208F2
	for <nbd@other.debian.org>; Thu, 19 Aug 2021 13:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lDqh1vAsrHhDvfFFFtw33z05vDPoS085AVogLT8b1Pw=; b=iU7igrBcDmw/n777DRHrZu3s24
	WhxjVqlBlYaX8amAotv0fUpxy4nu0u1yKfd5M4Ak6xYNDwmmiLVBeP50NFpHu9qIbWOYd2pLJ9f3Y
	kL6kStYF6GdA+n6IWEL0z6nlffwPSTfPRBRv8BIwCEXygPFff55DQWyRet+bThE+fuO7E1zoBcL8l
	AvYbUTdHuI4C31qHEIR0RTtN2ivAke6JFtIXakkBhdewpOhQQxEK89/1nJZigFfnF7O3hKSPpcLPc
	6jg/VqQ460esuXjDNZ5zAJUkLdw3gILSCEXPcGzQvtDbpZ5ovlwO9TaTlwIegABRbqjnoQD577qPM
	VpeZ4LQQ==;
Received: from [102.39.40.13] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mGiVO-00CILK-T8; Thu, 19 Aug 2021 15:54:50 +0200
Received: from wouter by pc181009 with local (Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mGiV4-0006aZ-VM; Thu, 19 Aug 2021 15:54:31 +0200
Date: Thu, 19 Aug 2021 15:54:22 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, libguestfs@redhat.com, qemu-block@nongnu.org,
	berrange@redhat.com
Subject: Re: [PATCH] docs: Link to protocol security considerations in uri
 docs
Message-ID: <YR5ijiVQ+yjf2/bG@pc181009.grep.be>
References: <20210810180859.2100611-1-eblake@redhat.com>
 <20210812143924.sliiwlp6nhxlzy34@redhat.com>
 <YRqDTsGF5/5nKQto@pc181009.grep.be>
 <20210818160248.pz2i6n2oolp7hpwv@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210818160248.pz2i6n2oolp7hpwv@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WNA3bVBcJ1G.A.lT.8KmHhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1305
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YR5ijiVQ+yjf2/bG@pc181009.grep.be
Resent-Date: Thu, 19 Aug 2021 13:55:08 +0000 (UTC)

Hi Eric,

On Wed, Aug 18, 2021 at 11:02:48AM -0500, Eric Blake wrote:
> Dan Berrangé and I thought about some more potential future problems:
> right now, even with FORCEDTLS mode (in both client and server), we
> have NO way to validate that the initial NBD_FLAG_[C_] bits advertised
> between client and server were not tampered with by a MitM during the
> plaintext portion of the exchange.  The flags field is 16 bits sent
> from the server, and 16 bits mirrored back by the client, to determine
> which protocol features will be in use the remainder of the
> connection.  Right now, exactly two of those bits are defined:
> 
> NBD_FLAG_FIXED_NEWSTYLE - the spec is clear that NBD_OPT_STARTTLS
> should not be sent unless this bit was negotiated.  Thus, both client
> and server will be sending the bit set, and absence of the bit will be
> evidence of a MitM attempting a downgrade attack, and there's nothing
> further to worry about in the protocol.  Once STARTTLS is executed, we
> already know this capability was available, so we don't need a way to
> re-verify it while encrypted.
> 
> NBD_FLAG_NO_ZEROES - this bit controls how the server will respond to
> NBD_OPT_EXPORT_NAME.  A mismatch between this bit (whether the MitM
> strips or adds the bit) will only be observable if the client uses
> NBD_OPT_EXPORT_NAME, but all clients that use STARTTLS are already
> encouraged to use NBD_OPT_GO.  We may want to tighten the security
> portion of the spec to make this recommendation even stronger (that
> is, any client that wants to ensure there is no MitM downgrade attack
> MUST use NBD_OPT_GO rather than NBD_OPT_EXPORT_NAME; and all servers
> that support TLS MUST support NBD_OPT_GO), but once a client uses the
> modern export selection code, we no longer care about mismatches in
> this bit, and therefore we don't need a way to re-verify it while
> encrypted.
> 
> However, I'm also worried about future extensions.  For example, we
> have been considering the addition of a way for clients to make 64-bit
> requests (basically, allowing NBD_OPT_WRITE_ZEROES to become a
> single-transaction bulk-zero for an export larger than 4G).  If the
> way this extension is haggled between client and server utilizes only
> a new NBD_FLAG_*, then we have introduced a potential security hole,
> because we are back in the situation of having a MitM flip bits prior
> to STARTTLS so that client and server do not agree on which protocol
> changes to use.  We can avoid this by adding a way to validate which
> capability bits are actually common between client and server via a
> new NBD_OPT_ sent after STARTTLS.  But rather than needing a way to
> re-verify which flags are common, it is just as easy to merely declare
> that ALL future protocol extensions will be haggled via NBD_OPT_ in
> the first place (and not by adding new NBD_FLAG_ bits).  That way,
> there will be no further places in the NBD protocol where a MitM
> plaintext injection can interfere with what the client and server use
> to talk to one another post-encryption.
> 
> Is it worth formalizing this decision into the NBD spec, so that we
> remember down the road that adding new NBD_FLAG_ bits is an inherent
> security risk thanks to the presence of STARTTLS?

I see the flags field as a way to negotiate incompatible changes *during
the negotiation phase*. This is true for both current flags:
FIXED_NEWSTYLE is supposed to fix the newstyle negotiation, and
NO_ZEROES changes the format of the reply to the EXPORT_NAME option,
which if used is the final message exchange during the negotiation
phase. Other protocol differences are negotiated with options or with
per-export flags (which are sent in the TLS part of the connection).

The only situation that I can think of in which we would need a new flag
is if for some reason we had to change the message format of the
NBD_OPT_* messages.  I don't see this happening. Even if we did have to
change that format, there are 2^32 option numbers available, which means
they are effectively unlimited; so if for whatever reason we had a
situation where the NBD_OPT_* message format is not flexible enough, we
could use a new option to signal "enable the new message format", which
would be written in the "old" format; if that new option number returns
NBD_REP_ERR_UNSUP, then we know the new message format is not supported
and we fall back to the old message format. That's slightly less
efficient than just setting a flag, but then who cares about a few bytes
in a protocol like NBD, which is expected to transfer large amounts of
data down the line.

I think we can indeed decide that we won't add any global flags anymore.

Thanks,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

