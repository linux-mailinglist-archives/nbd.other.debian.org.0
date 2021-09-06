Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8342D401CBC
	for <lists+nbd@lfdr.de>; Mon,  6 Sep 2021 16:05:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 356962134B; Mon,  6 Sep 2021 14:05:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep  6 14:05:19 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 8F74E21288
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Sep 2021 14:05:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DCRw5UoJ36FX for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Sep 2021 14:05:08 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CC7B521250
	for <nbd@other.debian.org>; Mon,  6 Sep 2021 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=p3uBV80MAsERQzoU0nvElAzu6LlilfLzD4t89UAcegg=; b=HV4vpb+qrO1BBSEZGMCSNGhjFI
	Ml1NXj9HpEmOcTNqjt7vfK1YYY7WpKbHxSjvuq5kQA+gE507Z6v8JYeTzb/jd9vZ5v4lxh8Qx1CU2
	kVcZpy5pAjHLyjwWCZA8GDGPivp+DJdijHOBXARMon0gtqws5LPDHZ958CQpimPgxMntgOdaK9LxB
	w+K4qBhELynqODv42a0ISmhGoK9r2HVubdTnfNF4ijhb0Gt4ddYeAz1G28zzcr/k6nJENVry8Dv2B
	LB3IebJxHG7ocnvS5iy9D3AY2c+WqOAqCjg4Cspk7D5Ns+tRtQrImc57Im7NdP0oaw/2nHhAoosud
	O/EYO9Iw==;
Received: from [102.39.151.73] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mNFFB-000Y2T-CJ; Mon, 06 Sep 2021 16:05:05 +0200
Received: from wouter by pc181009 with local (Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mNFEr-000349-VK; Mon, 06 Sep 2021 16:04:45 +0200
Date: Mon, 6 Sep 2021 16:04:37 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, libguestfs@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH] spec: Relax NBD_OPT_LIST_META_CONTEXTS
Message-ID: <YTYf9XFBVCwaX5yy@pc181009.grep.be>
References: <20210816184059.69709-1-eblake@redhat.com>
 <20210903123938.kkyh2o72pkrqlnua@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903123938.kkyh2o72pkrqlnua@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NKp-p42CVpD.A.CSD.fAiNhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1394
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTYf9XFBVCwaX5yy@pc181009.grep.be
Resent-Date: Mon,  6 Sep 2021 14:05:19 +0000 (UTC)

Hi Eric,

On Fri, Sep 03, 2021 at 07:39:38AM -0500, Eric Blake wrote:
> Ping.
> 
> On Mon, Aug 16, 2021 at 01:40:59PM -0500, Eric Blake wrote:
> > Using OPT_SET_META_CONTEXTS is stateful (it is documented to wipe out
> > any previously-requested contexts, and we just tightened the spec to
> > clarify that starting TLS also wipes it out).  But
> > OPT_LIST_META_CONTEXTS is not stateful; and in fact, with a
> > SELECTIVETLS server, it can be handy to list the meta contexts
> > available on an unencrypted export, then enable encryption, and then
> > further list what contexts are available on encrypted exports (as the
> > server is permitted to let them differ).  Thus, while a wise client
> > will renegotiate structured replies after the starttls, there's no
> > reason to forbid a server from answering a client that uses
> > list_meta_contexts prior to encryption without also requesting
> > structured replies.
> 
> I originally wrote this patch prior to the point where we decided that
> OPT_STARTTLS should also wipe the effects of OPT_STRUCTURED_REPLY;
> given that change in the meantime, I'm tweaking that last sentence:
> 
> Although such a client must negotiate structured replies after
> starttls if it is going to actually connect to an export, this change
> permits the client to shorten the handshake by two commands if it is
> only being used to list available exports and their meta contexts.
> 
> > ---
> >  doc/proto.md | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/doc/proto.md b/doc/proto.md
> > index 9dd59da..1586d7d 100644
> > --- a/doc/proto.md
> > +++ b/doc/proto.md
> > @@ -1325,9 +1325,9 @@ of the newstyle negotiation.
> >      Return a list of `NBD_REP_META_CONTEXT` replies, one per context,
> >      followed by an `NBD_REP_ACK` or an error.
> > 
> > -    This option MUST NOT be requested unless structured replies have
> > +    This option SHOULD NOT be requested unless structured replies have
> >      been negotiated first. If a client attempts to do so, a server
> > -    SHOULD send `NBD_REP_ERR_INVALID`.
> > +    MAY send `NBD_REP_ERR_INVALID`.

Yeah, makes sense. Setting a metadata context only makes sense once
structured replies have been negotiated, but we state that clearly
enough. Querying however doesn't set state, so that's fine.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

