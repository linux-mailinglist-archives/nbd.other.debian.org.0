Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6DA37EFC
	for <lists+nbd@lfdr.de>; Thu,  6 Jun 2019 22:52:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6C58A20485; Thu,  6 Jun 2019 20:52:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun  6 20:52:31 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 910D92047F
	for <lists-other-nbd@bendel.debian.org>; Thu,  6 Jun 2019 20:52:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id BdHO6r9BdQAE for <lists-other-nbd@bendel.debian.org>;
	Thu,  6 Jun 2019 20:52:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B0CE120483
	for <nbd@other.debian.org>; Thu,  6 Jun 2019 20:52:20 +0000 (UTC)
Received: from [197.83.227.238] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <w@uter.be>)
	id 1hYzMv-0007hD-2q; Thu, 06 Jun 2019 22:52:17 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1hYzMk-0006Tp-1j; Thu, 06 Jun 2019 22:52:06 +0200
Date: Thu, 6 Jun 2019 22:52:05 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>, nbd@other.debian.org,
	mkletzan@redhat.com
Subject: Re: [PATCH v2] doc: Define a standard URI syntax for NBD URIs.
Message-ID: <20190606205205.GA23266@grep.be>
References: <20190528103537.15081-1-rjones@redhat.com>
 <20190528103537.15081-2-rjones@redhat.com>
 <20190605171920.GB12691@redhat.com>
 <3b439521-a1c9-5409-9694-31d50e048dd7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b439521-a1c9-5409-9694-31d50e048dd7@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rdOl_IN2uOC.A.djF.P0X-cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/564
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190606205205.GA23266@grep.be
Resent-Date: Thu,  6 Jun 2019 20:52:31 +0000 (UTC)

On Wed, Jun 05, 2019 at 01:27:48PM -0500, Eric Blake wrote:
> We could, of course, teach qemu to support whatever this spec ends up
> with in addition to everything else; but there's also the point that the
> qemu code uses a consistent model for TLS across multiple entities (not
> just NBD, but also Spice, chardevs, ...), and then there's the question
> of whether a compatibility hack should be global to all of them or just
> to the NBD code.

I'm starting to think more and more that TLS certificate things should
not be part of the URL. If you think about it, all URLs are portable;
that is, you can take a URL from one host to the next, and it will just
work, and you don't need to change it. If you point to files on the
local file system from the URL, then that doesn't work anymore, which I
think breaks the paradigm of the URL. Of course with the obvious
exception of the file:// URL, which is supposed to point to a local
file...

Yes, in TLS you sometimes need to pass authentication tokens, but *how*
you do that is an implementation detail of the software you're using,
and I think standardizing that is a bad idea. After all, browsers also
don't standardize how you specify a client certificate to authenticate
with, and I think neither should we. I think it feels like a mistake to
do so.

(yes, I know I made the initial suggestion, but still)

[...]
> > There ought to be a way to specify the TLS priority string to control
> > what valid cipher settings are.

I think that too is not something that needs to be done as part of the
URL. After all, if you want to set a TLS priority string on one
connection, you probably want to set it on *all* connections, so it's
not something specific to a particular connection, which it would be for
options you specify in a URL.

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

