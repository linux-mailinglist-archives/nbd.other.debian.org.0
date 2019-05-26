Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id F29522A942
	for <lists+nbd@lfdr.de>; Sun, 26 May 2019 12:26:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D7D89204C3; Sun, 26 May 2019 10:26:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun May 26 10:26:17 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,MURPHY_DRUGS_REL8
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 74B20204A8
	for <lists-other-nbd@bendel.debian.org>; Sun, 26 May 2019 10:26:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.88 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id d_slrskmEP2r for <lists-other-nbd@bendel.debian.org>;
	Sun, 26 May 2019 10:26:06 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0D4C02049B
	for <nbd@other.debian.org>; Sun, 26 May 2019 10:26:06 +0000 (UTC)
Received: from [197.89.111.44] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <w@uter.be>)
	id 1hUqLn-0006SI-DR; Sun, 26 May 2019 12:26:03 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1hUqLR-0003Tl-1G; Sun, 26 May 2019 12:25:37 +0200
Date: Sun, 26 May 2019 12:25:36 +0200
From: Wouter Verhelst <w@uter.be>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: nbd@other.debian.org, eblake@redhat.com, nsoffer@redhat.com,
	berrange@redhat.com, mkletzan@redhat.com
Subject: Re: [PATCH for discussion] doc: Define a standard URI syntax for NBD
 URIs.
Message-ID: <20190526102536.GD6936@grep.be>
References: <20190525170518.4799-1-rjones@redhat.com>
 <20190526081532.GA6936@grep.be>
 <20190526090018.GO9582@redhat.com>
 <20190526092411.GB9368@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190526092411.GB9368@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TxLJIvaytcO.A.1WC.Jnm6cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/526
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190526102536.GD6936@grep.be
Resent-Date: Sun, 26 May 2019 10:26:17 +0000 (UTC)

On Sun, May 26, 2019 at 10:24:11AM +0100, Richard W.M. Jones wrote:
> On Sun, May 26, 2019 at 10:00:18AM +0100, Richard W.M. Jones wrote:
> > I intended to write a cover letter, got distracted while sending it
> > and forgot ...
> > 
> > Anyway I was going to say:
> > 
> >  - There's no way to specify abstract Unix domain sockets.  Should
> >    there be?  I'm not aware of any server that supports them.  Luckily
> >    the common approach of using `@` at the beginning should work:
> >    https://unix.stackexchange.com/questions/206386/what-does-the-symbol-denote-in-the-beginning-of-a-unix-domain-socket-path-in-l
> > 
> >  - As Wouter already picked up in his review, should we allow a
> >    default Unix domain socket?  The corollary to this is: Should we
> >    make the authority mandatory for TCP/IP sockets?  Are there
> >    sensible defaults for the authority (localhost:10809 probably).
> > 
> >  - I notice that proto.md has a text symlink (proto.txt).  Would we
> >    need one for url.txt -> url.md?
> 
> A few more things:
> 
>  - I wrote a libnbd implementation of NBD URIs last night:
>    https://github.com/libguestfs/libnbd/commit/d2dfefcefdf64864acae7a75c30d3f54e9a63ea6
>    Of course thisis based off the draft spec, but I can amend this
>    implementation as we work towards a final spec.  One annoying thing
>    is that libxml2 provides no support for parsing the query
>    parameters, and doing it by hand in C is a PITA ...

Yeah, I was actually hoping there might be a "liburi" or some such to leech URI
parsing off of...

>  - libnbd supports `nbds+unix` (ie. require TLS over a Unix domain
>    socket).  We use this for testing, and of course it's "useless" for
>    real life, which is why I omitted it from the spec.  (QEMU doesn't
>    support TLS over Unix domain sockets; nbd-server looks like it
>    could support it, but I didn't test it).

I haven't tested it myself either, TBH, but I suspect it might magically
work. I agree it doesn't make much sense other than for test suites etc.

>  - On the subject of requiring TLS, I made `nbds` mean that TLS is
>    required, while `nbd` means that TLS can be used opportunistically
>    but is not required.  Not sure what people think about that.
>    There's no "definitely don't use TLS" setting, but given we have
>    observed a 10x slowdown when TLS is enabled on a Unix domain socket
>    between libnbd & nbdkit[*] maybe there should be.

Yeah, I think that's perfectly reasonable. I liked that.

"nbd://" means you're allowed to use TLS if it's available, but won't
break if not. "nbds://" means you will.

Why would you ever forbid using TLS in a URL? That seems silly. There
are implementation details where using TLS is not a good idea
(i.e., kernel NBD), but I think those are the exception rather than the
rule, and we shouldn't build toward them. Besides, there is now an
in-kernel TLS implementation that I've been planning to add support for
to nbd-client[1], so that's also helpful, and once that's done I would
probably lean towards making TLS the default in nbd-server, too.

[1] that does require support from a userland TLS implementation though,
    which OpenSSL has but GnuTLS, TTBOMK, does not. I'd probably have to
    add that before I can look at adding kernel TLS support to
    nbd-client...

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

