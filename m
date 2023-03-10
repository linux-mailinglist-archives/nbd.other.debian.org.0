Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5DB6B3B56
	for <lists+nbd@lfdr.de>; Fri, 10 Mar 2023 10:50:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 535ED206D8; Fri, 10 Mar 2023 09:50:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 10 09:50:40 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9153C206D7
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Mar 2023 09:50:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lmr6Ym8dVp9a for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Mar 2023 09:50:21 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CD120205F6
	for <nbd@other.debian.org>; Fri, 10 Mar 2023 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zz/ezQGfQGxUjxpH2w6aynFLRW0EGn461p6uNMJAIO8=; b=FYu5e+yaRsAu/qKtUx5DBukH49
	hboRqLYgvlN/qwN7DH4Avfmk9f66lP2dVY1uC9OqvZ3tirS0PtApBztDkwI4Mb7R7H4qs1pxhQNiG
	ZsS3xP6Pzqh9VMlLCqDNcPD6Ee43NgK6odo67+CGX4rBwhtJSE+4/4/yhqCSN++c/e8rV3ZtNthRf
	8dqHHT3O22lKofJxYSdn9XHophmmHsH5komlCDWU1S2yqdufYhvKvX1h3STQmo6aZ3sHN7TvRCjLa
	SCUUhqQ4py73Fhxi1aHQS7+bYo/jW36WY//uT8ITZ8yKbx1k6giOqC+fTN+8OGW96m6p5E+jOS9uB
	1CPL5cmQ==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1paZOF-00CaeE-FO; Fri, 10 Mar 2023 10:50:19 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1paZO8-0008Pm-0k;
	Fri, 10 Mar 2023 11:50:12 +0200
Date: Fri, 10 Mar 2023 11:50:12 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org
Subject: Re: Structured replies in nbd-server
Message-ID: <ZAr9VCytT5awNF/Y@pc220518.home.grep.be>
References: <ZAdyUMh80sxzluyX@pc220518.home.grep.be>
 <20230309211913.wptrs2u4amjsq5re@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309211913.wptrs2u4amjsq5re@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LcsIDvWDA-O.A.osC.w1vCkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2367
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZAr9VCytT5awNF/Y@pc220518.home.grep.be
Resent-Date: Fri, 10 Mar 2023 09:50:40 +0000 (UTC)

Hi Eric,

On Thu, Mar 09, 2023 at 03:19:13PM -0600, Eric Blake wrote:
> On Tue, Mar 07, 2023 at 07:20:16PM +0200, Wouter Verhelst wrote:
> > Hi,
> > 
> > I've finally been working on structured replies in nbd-server (what?
> > it's only been 7 years), and today I managed to make it go through
> > nbdkit's "nbddump" without crashing. (yay!)
> 
> 'nbddump' comes from the libnbd project (client side), not nbdkit
> (server side).  But the two are closely related ;) And I'm glad to see
> that it helped you!
> 
> > 
> > I'm currently not (yet) implementing any other features that depend on
> > structured replies, but would like to see if people can poke holes in
> > what I've done so far -- I'd like to find bugs before release, rather
> > than after ;-)
> > 
> > The code is in the "structured" branch of
> > https://github.com/NetworkBlockDevice/nbd and feedback is more than
> > welcome.
> 
> Since you didn't post the code to the list, I've likewise only left my
> review comments on the patches on github.  If we want to copy the
> discussion to the list, I can do that too.

Well, I mostly expected people to try it out, but yeah, I suppose I
should have sent it to the list :-)

v2 will be sent here.

Thanks for the feedback, you caught a few things that I didn't think of.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

