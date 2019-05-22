Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D340A25E45
	for <lists+nbd@lfdr.de>; Wed, 22 May 2019 08:42:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 708152058C; Wed, 22 May 2019 06:42:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 22 06:42:41 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7978920585
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 May 2019 06:42:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id P8ggHdGNdMSX for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 May 2019 06:42:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 94F9B20547
	for <nbd@other.debian.org>; Wed, 22 May 2019 06:42:30 +0000 (UTC)
Received: from [105.228.48.136] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <w@uter.be>)
	id 1hTKxH-0000js-BA; Wed, 22 May 2019 08:42:27 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1hTKxA-00049f-8A; Wed, 22 May 2019 08:42:20 +0200
Date: Wed, 22 May 2019 08:42:20 +0200
From: Wouter Verhelst <w@uter.be>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, berrange@redhat.com, eblake@redhat.com
Subject: Re: Standard NBD URL syntax (again)
Message-ID: <20190522064220.GB24332@grep.be>
References: <20190520092056.GA9368@redhat.com>
 <20190521203036.GA24332@grep.be>
 <20190521212701.GS9582@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521212701.GS9582@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4lYpc6_uPYP.A.MHF.h9O5cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/505
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190522064220.GB24332@grep.be
Resent-Date: Wed, 22 May 2019 06:42:41 +0000 (UTC)

On Tue, May 21, 2019 at 10:27:01PM +0100, Richard W.M. Jones wrote:
> On Tue, May 21, 2019 at 10:30:36PM +0200, Wouter Verhelst wrote:
> > On Mon, May 20, 2019 at 10:20:56AM +0100, Richard W.M. Jones wrote:
> > > The leading problem with the "obvious" NBD URL format seems to be that
> > > it's impossible to specify empty export names or export names which
> > > don't start with a '/' character.
> > 
> > Not sure? We can just define the / as a separator character, rather than
> > as part of the name. That would then result in:
> > 
> > nbd://nbd-server.example.com:12345/foo
> > 
> > for "the export called 'foo' at nbd-server.example.com on port 12345"
> > 
> > nbd://nbd-server.example.com//foo
> > 
> > for "the export called '/foo' at nbd-server.example.com on the default
> > port"
> 
> This is what qemu uses, but it does seem a little awkward?  It would
> be easy to make the naive assumption that given an export called
> "/foo" you'd write the URL "nbd://server/foo".

That really depends on how you interpret the / character, but yeah,
that's possible. We'll just have to make sure to document that well,
then.

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

