Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB94E4336
	for <lists+nbd@lfdr.de>; Tue, 22 Mar 2022 16:41:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4EE3D203E9; Tue, 22 Mar 2022 15:41:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 22 15:41:40 2022
Old-Return-Path: <eblake@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 30B322033E
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Mar 2022 15:41:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.605 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-1.517,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id AYlj8wf9kdW4 for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Mar 2022 15:41:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id A0EEE2031D
	for <nbd@other.debian.org>; Tue, 22 Mar 2022 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647963681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=24vopU2nCxpNO0/WjXJ4JxhnGnriAqV7Xv6XhexP7q0=;
	b=aGpYBptmcL5Ix1gDn52OyLSJyVOVfZ6ywDvq863KUaCV140MJ2EaHsVoSHPPfxmAhmUfNL
	bAl9tmoxltO4WOSrWQ8LmZQCxawn0nmiR+V3kupQ2mC1KBaF8hjaNPmAfEx8MhWLobHDiB
	1yKJJZeBE5MLorIrYGy7EdDpMqs1lG4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-xiSBH1iNP0WuZtfQuI4ZHg-1; Tue, 22 Mar 2022 11:10:48 -0400
X-MC-Unique: xiSBH1iNP0WuZtfQuI4ZHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 124A380159B;
	Tue, 22 Mar 2022 15:10:48 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2071112132C;
	Tue, 22 Mar 2022 15:10:40 +0000 (UTC)
Date: Tue, 22 Mar 2022 10:10:38 -0500
From: Eric Blake <eblake@redhat.com>
To: Wouter Verhelst <w@uter.be>
Cc: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
	nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
	libguestfs@redhat.com, nsoffer@redhat.com
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Message-ID: <20220322151038.hjfcvhdxbfy5jjid@redhat.com>
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
 <f05c680a-73c3-b0d2-dbdf-c0bcf1ca3530@virtuozzo.com>
 <20211206230047.q5xc5enodbicf3gw@redhat.com>
 <Ya+IXzVAfS98M0dq@pc181009.grep.be>
MIME-Version: 1.0
In-Reply-To: <Ya+IXzVAfS98M0dq@pc181009.grep.be>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4sroXvoOtjF.A.PWH.04eOiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1743
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220322151038.hjfcvhdxbfy5jjid@redhat.com
Resent-Date: Tue, 22 Mar 2022 15:41:40 +0000 (UTC)

On Tue, Dec 07, 2021 at 06:14:23PM +0200, Wouter Verhelst wrote:
> On Mon, Dec 06, 2021 at 05:00:47PM -0600, Eric Blake wrote:
> > On Mon, Dec 06, 2021 at 02:40:45PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > >   #### Simple reply message
> > > > 
> > > >   The simple reply message MUST be sent by the server in response to all
> > > >   requests if structured replies have not been negotiated using
> > > > -`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been negotiated, a simple
> > > > -reply MAY be used as a reply to any request other than `NBD_CMD_READ`,
> > > > -but only if the reply has no data payload.  The message looks as
> > > > -follows:
> > > > +`NBD_OPT_STRUCTURED_REPLY`. If structured replies have been
> > > > +negotiated, a simple reply MAY be used as a reply to any request other
> > > > +than `NBD_CMD_READ`, but only if the reply has no data payload.  If
> > > > +extended headers were not negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > > > +the message looks as follows:
> > > > 
> > > >   S: 32 bits, 0x67446698, magic (`NBD_SIMPLE_REPLY_MAGIC`; used to be
> > > >      `NBD_REPLY_MAGIC`)
> > > > @@ -369,6 +398,16 @@ S: 64 bits, handle
> > > >   S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
> > > >       *error* is zero)
> > > > 
> > > > +If extended headers were negotiated using `NBD_OPT_EXTENDED_HEADERS`,
> > > > +the message looks like:
> > > > +
> > > > +S: 32 bits, 0x60d12fd6, magic (`NBD_SIMPLE_REPLY_EXT_MAGIC`)
> > > > +S: 32 bits, error (MAY be zero)
> > > > +S: 64 bits, handle
> > > > +S: 128 bits, padding (MUST be zero)
> > > > +S: (*length* bytes of data if the request is of type `NBD_CMD_READ` and
> > > > +    *error* is zero)
> > > > +
> > > 
> > > If we go this way, let's put payload length into padding: it will help to make the protocol context-independent and less error-prone.
> 
> Agreed.
> 
> > Easy enough to do (the payload length will be 0 except for
> > NBD_CMD_READ).
> 
> Indeed.
> 
> > > Or, the otherway, may be just forbid the payload for simple-64bit ? What's the reason to allow 64bit requests without structured reply negotiation?
> > 
> > The two happened to be orthogonal enough in my implementation.  It was
> > easy to demonstrate either one without the other, and it IS easier to
> > write a client using non-structured replies (structured reads ARE
> > tougher than simple reads, even if it is less efficient when it comes
> > to reading zeros).  But you are also right that we could require
> > structured reads prior to allowing 64-bit operations, and then have
> > only one supported reply type on the wire when negotiated.  Wouter,
> > which way do you prefer?
> 
> Given that I *still* haven't gotten around to implementing structured
> replies for nbd-server, I'd prefer not to require it, but that's not
> really a decent argument IMO :-)
> 
> [... I haven't read this in much detail yet, intend to do that later...]

Ping - any other responses on this thread, before I start working on
version 2 of the cross-project patches?

And repeating a comment from my original cover letter:

> with 64-bit commands, we may want to also make it easier to let
> servers advertise an actual maximum size they are willing to accept
> for the commands in question (for example, a server may be happy with
> a full 64-bit block status, but still want to limit non-fast zero and
> cache to a smaller limit to avoid denial of service).

Is it worth enhancing NBD_OPT_INFO in my v2?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

