Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D1B3F09C2
	for <lists+nbd@lfdr.de>; Wed, 18 Aug 2021 19:00:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5CFB42074E; Wed, 18 Aug 2021 17:00:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 18 17:00:11 2021
Old-Return-Path: <berrange@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FUZZY_OFFERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9C9E720744
	for <lists-other-nbd@bendel.debian.org>; Wed, 18 Aug 2021 16:44:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.255 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 31_NeLW0zwmm for <lists-other-nbd@bendel.debian.org>;
	Wed, 18 Aug 2021 16:44:33 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 7B2C920743
	for <nbd@other.debian.org>; Wed, 18 Aug 2021 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629305068;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BvrjmtWqEVErIoCMmKDEkBxr3JvHQupcm4Irn1Uws10=;
	b=I/13LCjcGp+ay2fNbDW0QNS0s5hv7KL5x59wGJ+O8sZhjKNUHxCrJaoM3Ppoy3StBdoJ14
	8KCsFIC+zzCYJnWICpPOC+7wxoUwpd2d9GBt3lz0EdN3wBMhQ9URCCzr6eU2SCkxQXs9RA
	RdJiGuM0VrahS79DSozBzUbM2s4xqSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-vyApQlZ0NnWN7aAIHD0YeA-1; Wed, 18 Aug 2021 12:13:34 -0400
X-MC-Unique: vyApQlZ0NnWN7aAIHD0YeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA8921018F74;
	Wed, 18 Aug 2021 16:13:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.153])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C77B60C81;
	Wed, 18 Aug 2021 16:13:27 +0000 (UTC)
Date: Wed, 18 Aug 2021 17:13:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Wouter Verhelst <w@uter.be>, nbd@other.debian.org,
	libguestfs@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH] docs: Link to protocol security considerations in uri
 docs
Message-ID: <YR0xpK5FNA1lEWx6@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210810180859.2100611-1-eblake@redhat.com>
 <20210812143924.sliiwlp6nhxlzy34@redhat.com>
 <YRqDTsGF5/5nKQto@pc181009.grep.be>
 <20210818160248.pz2i6n2oolp7hpwv@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210818160248.pz2i6n2oolp7hpwv@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <m1n7IHsv-uL.A.JbF.byTHhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1302
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YR0xpK5FNA1lEWx6@redhat.com
Resent-Date: Wed, 18 Aug 2021 17:00:11 +0000 (UTC)

On Wed, Aug 18, 2021 at 11:02:48AM -0500, Eric Blake wrote:
> On Mon, Aug 16, 2021 at 05:25:02PM +0200, Wouter Verhelst wrote:
> > > As a followup, I got this reply from Hanno Böck on oss-security:
> > > 
> > > https://www.openwall.com/lists/oss-security/2021/08/11/8
> > > | The buffering vulnerabilities we found are in STARTTLS implementations
> > > | that have the expectation to enforce a secure connection, but suffer
> > > | from various vulnerabilities in the implementation.
> > > 
> > > One of the reasons that SMTP and IMAP were particularly problematic in
> > > implementations is that they are line-based protocols, with
> > > arbitrary-sized packets where the length isn't known until the \n is
> > > reached.  Both clients and servers have to choose whether to read one
> > > character at a time (painfully slow) or read ahead into a buffer and
> > > then processing what is in the buffer.  Many of the CVEs raised were
> > > in regards to mishandling such buffers, such as acting on
> > > previously-buffered plaintext even after the switch to encryption.
> > > 
> > > Thankfully, the NBD protocol has a much more structured handshake
> > > (while different NBD_OPT commands can have different payload lenghts,
> > > at least the header of each packet designates the length in advance,
> > > reducing the need for read-ahead buffering), as well as documentation
> > > that the NBD_OPT_ phase is a lockstep algorithm (neither client nor
> > > server should be building up a buffer of more than one
> > > command/response).
> > > 
> > > Another aspect of the SMTP/IMAP security holes came from incorrectly
> > > carrying state across the transition to encryption (making a false
> > > assumption that the answer made in plaintext will be the same when
> > > encrypted).  Unfortunately, I have realized that the NBD spec has one
> > > bit of state (NBD_OPT_SET_META_CONTEXT) where it is currently silent
> > > on how to handle that state across a transition to encrypted.  So I
> > > plan on posting a followup patch that matches the actual
> > > implementation of nbdkit in opportunistic mode (qemu-nbd does not
> > > offer opportunistic mode, and nbd-server does not suport
> > > NBD_OPT_SET_META_CONTEXT): a server in opportunistic mode MUST treat
> > > the NBD_OPT_STARTTLS command as wiping out any earlier
> > > NBD_OPT_SET_META_CONTEXT.
> > 
> > This all makes sense, thanks.
> 
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

Yes, I think we should.

The 'flag' bits are lightweight as they're simple bitmaskes, not adding
any roundtrips, as a NBD_OPT would likely require. In the unlikely event
that we came up with a use case where we can't accept the overhead of
many extra NBD_OPTs, we could add flags re-verification post-STARTTLS.
I don't tink it is worth doing that today though. The simple approach
is to just document our future intents in a simple way like

  "No additional capability flags will be defined in the NBD protocol
   since this phase is susceptible to MITM downgrade attacks when using
   TLS. Future features will be negotiated using protocol options."

and then document the impact of MITM on the current two pre-existing
flags.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

