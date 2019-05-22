Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 270B8262B4
	for <lists+nbd@lfdr.de>; Wed, 22 May 2019 13:04:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E3ABC2042F; Wed, 22 May 2019 11:04:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 22 11:04:30 2019
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9A5F3203C9
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 May 2019 11:04:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lFpcplx9y0Ps for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 May 2019 11:04:19 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0AF9220646
	for <nbd@other.debian.org>; Wed, 22 May 2019 11:04:18 +0000 (UTC)
Received: from [105.228.48.136] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <w@uter.be>)
	id 1hTP2d-0004WV-Rd; Wed, 22 May 2019 13:04:16 +0200
Received: from wouter by gangtai.home.grep.be with local (Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1hTP2V-0008Fb-1r; Wed, 22 May 2019 13:04:07 +0200
Date: Wed, 22 May 2019 13:04:06 +0200
From: Wouter Verhelst <w@uter.be>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Nir Soffer <nsoffer@redhat.com>, nbd@other.debian.org,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>
Subject: Re: Standard NBD URL syntax (again)
Message-ID: <20190522110406.GE24332@grep.be>
References: <20190520092056.GA9368@redhat.com>
 <20190521203036.GA24332@grep.be>
 <20190521212701.GS9582@redhat.com>
 <20190522064220.GB24332@grep.be>
 <CAMRbyytPDfg-usi20x_hua=x-48ceOKj3oaTGUK6oHpgnzDvpg@mail.gmail.com>
 <20190522095545.GY9582@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190522095545.GY9582@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4jjOe1TubaF.A.gDF.-yS5cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/511
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190522110406.GE24332@grep.be
Resent-Date: Wed, 22 May 2019 11:04:30 +0000 (UTC)

On Wed, May 22, 2019 at 10:55:45AM +0100, Richard W.M. Jones wrote:
> So last night I had an important thought about this:
> 
>  * What existing export names are people using in real life?

Good point.

> nbdkit doesn't use export names for anything - you can pass
> anything you like.
> 
> qemu-nbd has an odd system where the export name must match what was
> specified on the command line, but AFAIK it doesn't care about it
> otherwise.
> 
> qemu's internal NBD server may permit multiple export names, but I'm
> not totally sure about that.  What do they look like?  Arbitrary
> strings?  Absolute paths?  Relative paths?
> 
> nbd-server supports multiple export names, and it does appear to want
> absolute paths.

You're confusing two things here.

In nbd-server, the section name is used as the export name; and the
configuration line that starts with 'export=' is used as the path of the
file or device that is exported, but not as the export name.

i.e., in a configuration like this:

[mydevice]
export=/home/wouter/device

the exportname is "mydevice", not "/home/wouter/device".

Beyond that, nbd-server does support all characters as the exportname
that GKeyFile would support in a section name, and e.g., the LTSP people
use something that looks like a path as an export name:

[/opt/ltsp/i386]
exportname = /opt/ltsp/i386.img

With the benefit of hindsight, I've often thought that it was a mistake
to call the device to be served "export=" in the configuration, but now
it's probably way too late to change that anymore.

> Can it use arbitrary strings too, or are absolute paths the only
> option?  How about relative paths?
> 
> Basically, I think what we most commonly use export names for should
> influence how we decide to use them in URLs.

That certainly does make sense.

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

