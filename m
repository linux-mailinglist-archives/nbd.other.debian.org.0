Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A62425F61
	for <lists+nbd@lfdr.de>; Wed, 22 May 2019 10:21:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 20E1D2061A; Wed, 22 May 2019 08:21:37 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 22 08:21:37 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2935F205F6
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 May 2019 08:21:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fzjp7zWqgZcy for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 May 2019 08:21:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 20E99205EE
	for <nbd@other.debian.org>; Wed, 22 May 2019 08:21:26 +0000 (UTC)
Received: from [105.228.48.136] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <w@uter.be>)
	id 1hTMUz-0000lY-Vk; Wed, 22 May 2019 10:21:22 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1hTMUq-0005lI-SF; Wed, 22 May 2019 10:21:12 +0200
Date: Wed, 22 May 2019 10:21:12 +0200
From: Wouter Verhelst <w@uter.be>
To: Nir Soffer <nsoffer@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>
Subject: Re: Standard NBD URL syntax (again)
Message-ID: <20190522082112.GC24332@grep.be>
References: <20190520092056.GA9368@redhat.com>
 <20190521203036.GA24332@grep.be>
 <20190521212701.GS9582@redhat.com>
 <20190522064220.GB24332@grep.be>
 <CAMRbyytPDfg-usi20x_hua=x-48ceOKj3oaTGUK6oHpgnzDvpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRbyytPDfg-usi20x_hua=x-48ceOKj3oaTGUK6oHpgnzDvpg@mail.gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xsOj7p5WojL.A.ByG.RaQ5cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/507
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190522082112.GC24332@grep.be
Resent-Date: Wed, 22 May 2019 08:21:37 +0000 (UTC)

Hi,

On Wed, May 22, 2019 at 10:37:54AM +0300, Nir Soffer wrote:
> On Wed, May 22, 2019 at 9:42 AM Wouter Verhelst <w@uter.be> wrote:
>     That really depends on how you interpret the / character, but yeah,
>     that's possible. We'll just have to make sure to document that well,
>     then.
> 
> 
> The value of using a URL is user being able to use existing URL parsers.

Sure.

> >>> from urllib.parse import urlparse
> >>> urlparse("nbd://nbd-server.example.com:12345/foo")
> ParseResult(scheme='nbd', netloc='nbd-server.example.com:12345', path='/foo',
> params='', query='', fragment='')
> >>> urlparse("nbd://nbd-server.example.com:12345//foo")
> ParseResult(scheme='nbd', netloc='nbd-server.example.com:12345', path='//foo',
> params='', query='', fragment='')
> 
> So users will mostly likely use //path when accessing the server with the
> second URL.
> 
> Multiple separator are typically normalized to single one, both in web
> applications
> and when accessing the file system:
> 
>     >>> os.path.samefile("/tmp/file", "/tmp///file")
>     True
> 
> Same behavior with:
> 
>     ls /tmp/file
>     ls /tmp//file

The point is that in NBD, the "path" part of the URL, as I proposed it,
isn't a path; it's a free-form name. Where a / is typically a directory
separator in other URLs, it wouldn't be for NBD, since NBD doesn't have
a concept of directories (and I think it would be a bad idea to
introduce one).

So I think it's perfectly fine to state that, after regular URL parsing:

- The first / in the "path" part of the URL (if any) must be dropped
- Duplicate / characters should not be normalized away.

That would allow parsing the URL with python's urllib, because as you've
shown it does not normalize away duplicate / characters.

> I think that the way to think about it is that export names are always
> relative to the server root, so

In NBD, there is no "server root", so this does not compute.

>     nbd://nbd-server.example.com:12345/foo
> 
> maps to the export name "foo" and "/foo".

This would require that a client would add heuristic code to figure out
the right name. It would also fail on servers that have both.

> And both:
> 
>     nbd://nbd-server.example.com:12345/
>     nbd://nbd-server.example.com:12345
> 
> mapped to the empty export name.

That would certainly make sense.

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

