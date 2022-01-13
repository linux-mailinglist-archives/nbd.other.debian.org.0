Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D9E48D3D5
	for <lists+nbd@lfdr.de>; Thu, 13 Jan 2022 09:49:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3F40C20381; Thu, 13 Jan 2022 08:49:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 13 08:49:52 2022
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C95D2203C8
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jan 2022 08:49:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id nKEjTt60WJem for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jan 2022 08:49:38 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7851C20372
	for <nbd@other.debian.org>; Thu, 13 Jan 2022 08:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0rcbBEjjvuSnRrFECE2LCnM0Tgchaep1jmzDgG+zTIs=; b=SHS7R7ddNu9Vh2zS2jnKLaS/pJ
	Mrbav7wWCGJGACbw8UgQ78dkLhapW8tZNGnFvh/aloXjkxvLobLDzqSTr2X3gnpQMkhyjpYZXPdm5
	70zkTM40FmRRdvP9uUQUTPmSxBo82L5faP2lyxGAbEj+Njo/2q2uuWqQ3flswftUD/lp//pQAujVw
	QB0+KmMi6OVkipP3nuqR6Sz1EkshIO6JEhbOWJQF0+Eg2/8GsW2JpwXzaybyye5wNC/4SK0eGEdFu
	cOo9u/rrqTykwkeHmGLCEDOgdbCeWvArC31cXu50mrYtO5BIsVVBk2udqJ4CidJL60mDl7BWm0Pzi
	GYZLC98A==;
Received: from [196.251.239.242] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1n7vnb-00HPjB-Mm; Thu, 13 Jan 2022 09:49:35 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1n7vCF-001S2N-07;
	Thu, 13 Jan 2022 10:10:59 +0200
Date: Thu, 13 Jan 2022 10:10:58 +0200
From: Wouter Verhelst <w@uter.be>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH 0/7] Add data to datalog, add replay tool
Message-ID: <Yd/ekhjCT8Ewp2e4@pc181009.grep.be>
References: <20220113073407.4742-1-manfred@colorfullife.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113073407.4742-1-manfred@colorfullife.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aLR1ELqPbnD.A.cQ.we-3hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1684
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Yd/ekhjCT8Ewp2e4@pc181009.grep.be
Resent-Date: Thu, 13 Jan 2022 08:49:52 +0000 (UTC)

Hi Manfred,

On Thu, Jan 13, 2022 at 08:34:00AM +0100, Manfred Spraul wrote:
> Hi,
> 
> As announced, here is the initial series for adding a replay tool.
> 
> Patch 1: Add support for pretty-printing WRITE_ZEROS and TRIM to
>         nbd-trdump. I've added a 'static inline' helper function to a
>         new header file.
> 	Is the approacch good? As alternative, I could add the function
> 	to e.g. cliserv.{c,h}. Would that be preferred?

It might make sense to add it there, but I have no strong preference
either way.

> Patch 2: Add actual data logging to nbd-server
> 	I've defined a new flag to indicate that actual data will follow.
> 	Any better ideas?

This changing of the protocol format for on-disk logging rubs me the
wrong way. I don't think that's the best way forward.

I think adding a header to the file to describe its format is a better
idea. If it started with a magic number that is different from any of
the NBD magic numbers (but is in the same location), then nbd-trdump
(and your new nbd-trplay) could switch on that to decide whether to
read/parse the header.

> Patch 3: Add locking.
> 	Is sem_open() portable enough? Should I add a few fallbacks?

It seems like it's defined by POSIX.1-2001? Should be fine.

This will slow things down somewhat if you're using the transaction log,
but we can document that easily (and it's meant as a debugging/hacking
tool, anyway).

> Patch 4: Add logging of the replies to nbd-server.
> 
> Patch 5: Add a new tool nbd-trplay
> 	Did I update Makefile.am correctly?

Yes.

> Patch 6: Initial CLI.
> Patch 7: Actual implementation.

Could you add a man page as well?

> I've used the code a bit, and it seems that it finds at least
> one suspicious case with ext4:
> https://lore.kernel.org/all/baa3101d-e2f7-823e-040f-8739ab610419@colorfullife.com/

Interesting :)

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

