Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2645B46C086
	for <lists+nbd@lfdr.de>; Tue,  7 Dec 2021 17:14:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E2462201D7; Tue,  7 Dec 2021 16:14:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Dec  7 16:14:49 2021
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
	by bendel.debian.org (Postfix) with ESMTP id DDBF520330
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Dec 2021 16:14:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 27QXZ2BX6vGe for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Dec 2021 16:14:36 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id AB9DF2029D
	for <nbd@other.debian.org>; Tue,  7 Dec 2021 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=25a1o2WYOQYbCP2CdxCrYiQ1cGWDx5GwMdekaJBLEZk=; b=A9n9CPe3MJYzvynRukUGPcS0F4
	FTM60J7mAyKo+SDiz8ba+HHN4HEz9epcZgHZogUe4gjQwySxkdt8o0h4kBWNlSwMPEu1E/E4Ife5f
	0lo1zKpOTKWTfqx6xc4syuk+vPaghNbLigG2A67Zqr2X5yNKDFVzFcqAzM/RBsNNPQy603H1n3CdN
	y4H2+4dV/wu+1d0uMXZSlxStb//iMudKX11JxTqW03tjcZow9JHbYKI9TIMXWF0ILrKUzdysZBjsz
	kVMbSoNverTUu2zEeHUFzF/LsGvvnfKTVCZlyXpUGBMgg1FaLgn+aSMDMUWzToJMQAM799O/37VSK
	3SvR0iEg==;
Received: from [209.203.16.11] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mud6t-003Gd0-1A; Tue, 07 Dec 2021 17:14:31 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1mud6l-000Wf4-V0;
	Tue, 07 Dec 2021 18:14:23 +0200
Date: Tue, 7 Dec 2021 18:14:23 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	libguestfs@redhat.com, nsoffer@redhat.com
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <Ya+IXzVAfS98M0dq@pc181009.grep.be>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
 <f05c680a-73c3-b0d2-dbdf-c0bcf1ca3530@virtuozzo.com>
 <20211206230047.q5xc5enodbicf3gw@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206230047.q5xc5enodbicf3gw@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8HnX8HQGtNG.A._QD.5h4rhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1655
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Ya+IXzVAfS98M0dq@pc181009.grep.be
Resent-Date: Tue,  7 Dec 2021 16:14:49 +0000 (UTC)

On Mon, Dec 06, 2021 at 05:00:47PM -0600, Eric Blake wrote:
> On Mon, Dec 06, 2021 at 02:40:45PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > >   #### Simple reply message
> > > 
> > >   The simple reply message MUST be sent by the server in response to all
> > >   requests if structured replies have not been negotiated using
> > > -`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been negotiated, a simple
> > > -reply MAY be used as a reply to any request other than `NBD_CMD_READ`,
> > > -but only if the reply has no data payload.  The message looks as
> > > -follows:
> > > +`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been
> > > +negotiated, a simple reply MAY be used as a reply to any request other
> > > +than `NBD_CMD_READ`, but only if the reply has no data payload.  If
> > > +extended headers were not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > > +the message looks as follows:
> > > 
> > >   S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
> > >      `NBD_REPLY_MAGIC`)
> > > @@ -369,6 +398,16 @@ S: 64 bits, handle
> > >   S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
> > >       *error* is zero)
> > > 
> > > +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > > +the message looks like:
> > > +
> > > +S: 32 bits, 0x60d12fd6, magic (`NBD_SIMPLE_REPLY_EXT_MAGIC`)
> > > +S: 32 bits, error (MAY be zero)
> > > +S: 64 bits, handle
> > > +S: 128 bits, padding (MUST be zero)
> > > +S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
> > > +    *error* is zero)
> > > +
> > 
> > If we go this way, let's put payload length into padding: it will help to make the protocol context-independent and less error-prone.

Agreed.

> Easy enough to do (the payload length will be 0 except for
> NBD_CMD_READ).

Indeed.

> > Or, the otherway, may be just forbid the payload for simple-64bit ? What's the reason to allow 64bit requests without structured reply negotiation?
> 
> The two happened to be orthogonal enough in my implementation.  It was
> easy to demonstrate either one without the other, and it IS easier to
> write a client using non-structured replies (structured reads ARE
> tougher than simple reads, even if it is less efficient when it comes
> to reading zeros).  But you are also right that we could require
> structured reads prior to allowing 64-bit operations, and then have
> only one supported reply type on the wire when negotiated.  Wouter,
> which way do you prefer?

Given that I *still* haven't gotten around to implementing structured
replies for nbd-server, I'd prefer not to require it, but that's not
really a decent argument IMO :-)

[... I haven't read this in much detail yet, intend to do that later...]

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

