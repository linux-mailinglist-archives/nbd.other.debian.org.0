Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AA93EDE81
	for <lists+nbd@lfdr.de>; Mon, 16 Aug 2021 22:19:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id ABCA8205D3; Mon, 16 Aug 2021 20:19:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 16 20:19:11 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 4EC13205D0
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Aug 2021 20:19:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jF7G9bup8qja for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Aug 2021 20:19:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B9FB9205C4
	for <nbd@other.debian.org>; Mon, 16 Aug 2021 20:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+4RlGg5UwkNBuVACpKhL7qfTrW0hnPqB52wSbBpgMMI=; b=OLvdkSazQ8bj86AyFxvdm2FYjM
	6pV7LxQk6nPeR2Dp1NHZA56cKesXPLhijXIac1vRWePLlCRejvKqzA1wAJvO09uWoG3f8p3Ka5dK/
	jLCoPyLY6eAs6weK/vT5QMc5RhWLfK4oXnez5sTCPwAUDc7cAlLjKPcdirs4IEg12/m2QqdMiU/ho
	NGWhug9wBE5jQ7C+VNShP3GjzSZwpLW4VgPAY3gQLyGo8bMoBgShlsMW+9axvUrrRHPqDkc0uZGgg
	FuEnz/8/eys6Iew47wjjEHkSYhSpetRk3SK3SjMaE6oDYHFozbuMaFUFNIcAwI3Fzm3kGc7QlIXO4
	Z2D5u+Lg==;
Received: from [102.39.40.13] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mFj4S-005rhw-RW; Mon, 16 Aug 2021 22:18:56 +0200
Received: from wouter by pc181009 with local (Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mFj4H-000WfP-Fx; Mon, 16 Aug 2021 22:18:45 +0200
Date: Mon, 16 Aug 2021 22:18:44 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-block@nongnu.org, libguestfs@redhat.com
Subject: Re: [PATCH] spec: Clarify STARTTLS vs. SET_META_CONTEXT interaction
Message-ID: <YRrIJMUxKgeAHXEF@pc181009.grep.be>
References: <20210812152040.2752184-1-eblake@redhat.com>
 <YRqEvhxOoytetJfo@pc181009.grep.be>
 <20210816180255.xawv3s4f6rletqcp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816180255.xawv3s4f6rletqcp@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9dniW52r6GK.A.PXF._gsGhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1298
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YRrIJMUxKgeAHXEF@pc181009.grep.be
Resent-Date: Mon, 16 Aug 2021 20:19:11 +0000 (UTC)

On Mon, Aug 16, 2021 at 01:02:55PM -0500, Eric Blake wrote:
> On Mon, Aug 16, 2021 at 05:31:10PM +0200, Wouter Verhelst wrote:
> 
> > > +++ b/doc/proto.md
> > > @@ -1165,6 +1165,14 @@ of the newstyle negotiation.
> > >      permitted by this document (for example, `NBD_REP_ERR_INVALID` if
> > >      the client included data).
> > > 
> > > +    When this command succeeds, the server MUST NOT preserve any
> > > +    per-export state (such as metadata contexts from
> > > +    `NBD_OPT_SET_META_CONTEXT`) issued before this command.  The
> > > +    server MAY preserve global state such as a client request for
> > > +    `NBD_OPT_STRUCTURED_REPLY`; however, a client SHOULD defer other
> > > +    stateful option requests until after it determines whether
> > > +    encryption is available.
> > 
> > I'm not sure I think that makes sense. It's safer to require that
> > STARTTLS wipes out everything.
> > 
> > There are two reasonable ways of communicating with a server that
> > supports opportunistic TLS: either you enable TLS as soon as possible
> > after opening the connection (and then you should do any state
> > modification after the STARTTLS command), or you don't do any STARTTLS
> > at all, ever (and then all state settings are done in the unencrypted
> > connection). Anything else seems like a silly idea.
> 
> Concur.
> 
> > 
> > As such, I think trying to support ways in which you configure things
> > before STARTTLS, then do STARTTLS, and then expect things to retain
> > state, is bound to invite security issues, and we should not even try to
> > support it.
> 
> Okay, how about this wording:
> 
> +When this command succeeds, the server MUST NOT preserve any
> +negotiation state (such as a request for `NBD_OPT_STRUCTURED_REPLY`,
> +or metadata contexts from `NBD_OPT_SET_META_CONTEXT`) issued before
> +this command.  A client SHOULD defer all stateful option requests
> +until after it determines whether encryption is available.

Yeah, that seems better.

> Unfortunately, nbdkit in opportunistic mode does not (yet) obey that:
> a request for structured replies prior to starttls is currently
> preserved across the jump into encryption - which may result in the
> server sending structured replies to a client not expecting them due
> to a MitM plaintext injection.  I'll be submitting a patch for that
> soon; sounds like we found a CVE in nbdkit.
> 
> On the other hand, qemu as NBD client always sends NBD_OPT_STARTTLS
> first (disconnecting rather than falling back to plaintext).  libnbd
> as NBD client does not (yet) expose any way to attempt starttls after
> other negotiation commands: in opportunistic mode, it currently probes
> for encryption before giving the user any control over other NBD_OPT_
> commands.  At one point, I had the idea of expanding the libnbd API to
> make it easier to try even NBD_OPT_STARTTLS under user control (which
> would make it easier to test issues like how servers behave with
> clients that don't lead off with STARTTLS), but that has not been
> implemented yet, so at the moment, we don't have clients in the wild
> that were relying on nbdkit's stateful behavior.

OK, that's great -- otherwise this would have been far more difficult to
fix.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

