Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD903D453
	for <lists+nbd@lfdr.de>; Tue, 11 Jun 2019 19:36:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3D887203E7; Tue, 11 Jun 2019 17:36:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jun 11 17:36:06 2019
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
	by bendel.debian.org (Postfix) with ESMTP id D0F1A203DD
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 Jun 2019 17:35:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gCkf2JjlSpTT for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 Jun 2019 17:35:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B4652203A6
	for <nbd@other.debian.org>; Tue, 11 Jun 2019 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nLYc0il2tbGY7pMyVvrJ/tGYhQu1w5rPNwVu/Xf/Smk=; b=HdHIcK3O/xoEVkfU3RSekigsGO
	Es6PtjxInV4vr8KDnZL1M8BoVnynhiqkJdDOtdqkwndJf3Er5JYUahx/iB/5MIKiNnbJBWWJhxAJp
	jrAdtLSX8DtwzTD8q6Iun9AXC/qldDWNkvB4tFJmcUHx6tQ215wcJ0gkAaFKS6+VzHgjjmb7cUfcK
	mk3m8+Nl841+kU7FiItQrMXdAealfAphsX9PaXWMgqqhr1PL3Wxp5nUfUBK+rQ9We9VG82dzE7jY1
	Ejbuuys4J9WReH+eBc2DSt4KqdqZPd6+LEaCEAFL/mmCVZM6Ad3xiGtKG6A+tam87drf2tg9Df7tr
	r66YIvYQ==;
Received: from wouter by latin.grep.be with local (Exim 4.89)
	(envelope-from <wouter@grep.be>)
	id 1hakgY-0004BR-FA; Tue, 11 Jun 2019 19:35:51 +0200
Date: Tue, 11 Jun 2019 19:35:50 +0200
From: Wouter Verhelst <wouter@grep.be>
To: Eric Blake <eblake@redhat.com>
Cc: Martin Kletzander <mkletzan@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org,
	w@uter.be, berrange@redhat.com
Subject: Re: [PATCH v3] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190611173543.msj6s6fwambak5wu@grep.be>
References: <20190611115330.6842-1-rjones@redhat.com>
 <20190611115330.6842-2-rjones@redhat.com>
 <20190611142259.GG29602@wheatley>
 <cda4d898-39c7-1d76-8dd3-e0067d2cbce8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cda4d898-39c7-1d76-8dd3-e0067d2cbce8@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
User-Agent: NeoMutt/20170113 (1.7.2)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0q7ihvdJ0SK.A.wOH.Ga-_cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/575
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190611173543.msj6s6fwambak5wu@grep.be
Resent-Date: Tue, 11 Jun 2019 17:36:06 +0000 (UTC)

On Tue, Jun 11, 2019 at 11:31:08AM -0500, Eric Blake wrote:
> On 6/11/19 9:22 AM, Martin Kletzander wrote:
> > On Tue, Jun 11, 2019 at 12:53:30PM +0100, Richard W.M. Jones wrote:
> >> For further information about discussion around this standard, see
> >> this thread on the mailing list:
> >> https://lists.debian.org/nbd/2019/05/msg00013.html
> >>
> 
> >> +## Other NBD URI query parameters
> >> +
> >> +Clients SHOULD prefix experimental query parameters using `x-`.  This
> >> +SHOULD NOT be used for query parameters which are expected to be
> >> +widely used.
> >> +
> >> +Any other query parameters which the client does not understand SHOULD
> >> +be ignored by the parser.
> >> +
> > 
> > Everything seems good to me, I just have one "idea".  I, however, am not
> > sure
> > whether it might be helpful or utterly stupid.  But since I would never
> > forgive
> > myself not mentioning it, here goes:
> > 
> > TL;DR: Is it worth to care about
> > versioning/some-kind-of-forward-compatibility?
> 
> That may actually be a good idea.

I'm not sure it is, tbh.

> > If there is a new query parameter added later on, which would significantly
> > change the behaviour (or security), then a client might want to depend
> > on it not
> > being ignored by the parser (e.g. if just ignoring it would cause a
> > security
> > concern).
> > 
> > What I thought of would be another parameter that would specify which other
> > parameters must be supported, so that the client quits if any of them is
> > unknown.  On the other hand it should be perfectly fine to make sure new
> > enough
> > version of the client is used.
> 
> So, you're asking for some way to know that ?foo=bar is supported by the
> client, by having a way to fail if the client doesn't know how to parse
> the foo query.  What if we document mandatory support for a parameter
> '?features=comma,list,of,names', where a client MUST fail to parse the
> URI if it does not recognize one of the feature names from the list
> given to features?  Then we can have:
> 
> nbd://host/?foo=bar
>  - okay to ignore query foo= as unknown
> nbd://host/?foo=bar&features=foo
>  - client MUST fail to parse URI unless it also knows how to parse the
> foo query parameter
> 
> The initial set of features mandated by the NBD URI spec is 'features'
> for self-description, as well as 'socket' for Unix but not necessarily
> TCP.  Then the queries '?features=' and '?features=features' must both
> succeed, the query '?features=socket' depends on the scheme, and any
> other '?features=...' query becomes a feature probe.

I think you're overthinking it here. We could just say that a client
which does not recognize a parameter should just balk? After all, a URI
is something that in most cases would be passed on the command line, or
some such; the feedback to the user would be fairly quick. Additionally,
I can't think of any extra feature that we might want to add to the URL
but which might be optional...

-- 
<Lo-lan-do> Home is where you have to wash the dishes.
  -- #debian-devel, Freenode, 2004-09-22

