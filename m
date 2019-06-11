Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A60543D46A
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2019 19:40:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8DF06203EA; Tue, 11 Jun 2019 17:40:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 17:40:52 2019
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8449320149
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2019 17:40:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Bb6J0_BSx0qL for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2019 17:40:41 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id BAFA9203A6
	for <nbd@other.debian.org>; Tue, 11 Jun 2019 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Ilxpm6IrMEuqyQbz7EdbS8TgAuXadrlr4HviXjhKC/I=; b=gX/9c70w/wDi8mYffAaEWHM2Oj
	iSGWWOwzVE9NYFx9ZtIQ5qbCaKpFpFd0Vy/i/i9B8UaXQOzMGxre+zVMdMGOFR/McmS0QyaQ1LnoD
	5CeBa+ACJbPHSBiNvdU1dkTT5xNT0CL9rMYbuBKVXtxuZk7YWRZMOjbJoMequ+RzD0SplDga5Eq6i
	gJjuwZLRPaao7XNF1zX37u5NfZMDU3qa7Xq8CJ6kSf1GmxzT+B/XIBd1/DpF8Mlj1KNtk2lcJ3NIj
	O2pHS2S6KE8gp+LMy9i44d2ELQGW8fmHNErckyZmsHAiFOR/6kP/+V4hhiRSXl3ZaKwbf2w4caRMw
	m/H126GA==;
Received: from wouter by latin.grep.be with local (Exim 4.89)
	(envelope-from <wouter@grep.be>)
	id 1haklC-0008Ej-HW; Tue, 11 Jun 2019 19:40:38 +0200
Date: Tue, 11 Jun 2019 19:40:38 +0200
From: Wouter Verhelst <wouter@grep.be>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, w@uter.be, eblake@redhat.com, berrange@redhat.com,
	mkletzan@redhat.com
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190611174038.bggo3rdmxrq5p3kl@grep.be>
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com>
 <20190611132903.5e2vdq2ng27vlhtd@grep.be>
 <20190611135147.GO3888@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611135147.GO3888@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
User-Agent: NeoMutt/20170113 (1.7.2)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9XLMwCg--CH.A.d0H.ke-_cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/576
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190611174038.bggo3rdmxrq5p3kl@grep.be
Resent-Date: Tue, 11 Jun 2019 17:40:52 +0000 (UTC)

On Tue, Jun 11, 2019 at 02:51:47PM +0100, Richard W.M. Jones wrote:
> On Tue, Jun 11, 2019 at 03:29:03PM +0200, Wouter Verhelst wrote:
> > Hi Richard,
> > 
> > LGTM, for the most part. One minor detail: should we document that the
> > URLs should only be used for newstyle connections? I don't honestly
> > think that using oldstyle is a good idea anymore, so we might as well
> > drop it and assume that people don't want to try oldstyle anymore, but
> > then...
> 
> We support it in libnbd and nbdkit!
> 
> Longer more serious answer: I don't think we should stop people using
> oldstyle even though I agree that newstyle is the superior choice in
> every respect.

I agree with that.

However, oldstyle and newstyle are not compatible[1]; so it may be
necessary for the URI to specify whether the connection should use
oldstyle or newstyle.

My first suggestion was going to be that we add a parameter to specify
oldstyle (the default should be newstyle); but then I was thinking that
not many servers would implement oldstyle anymore. Hence that
suggestion.

> One actual reason to still be using oldstyle is
> because you've got some old server which you can't / don't want to
> update.  I have encountered a few of these in niche places (VMware is
> one, and just about any hit for "NBD" on github that was started
> before 2010 will be using oldstyle).

Sure.

We can still add a "?oldstyle" parameter to specify oldstyle, or some
such. I just don't know whether it's worth it.

[1] theoretically it should be possible to detect the oldstyle magic
    number and fall back to oldstyle if supported, but that's a bit ugly
    and I don't want to write that in stone for clients/libraries that
    support it. It makes sense to require that oldstyle/newstyle is
    explicitly selected in the URI instead.

-- 
<Lo-lan-do> Home is where you have to wash the dishes.
  -- #debian-devel, Freenode, 2004-09-22

