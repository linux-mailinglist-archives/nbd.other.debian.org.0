Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CAF559CA8
	for <lists+nbd@lfdr.de>; Fri, 24 Jun 2022 16:50:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 93A3E20444; Fri, 24 Jun 2022 14:50:00 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 24 14:50:00 2022
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3E11B20436
	for <lists-other-nbd@bendel.debian.org>; Fri, 24 Jun 2022 14:49:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.19 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 9YlA0a22tLNA for <lists-other-nbd@bendel.debian.org>;
	Fri, 24 Jun 2022 14:49:46 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 2463 seconds by postgrey-1.36 at bendel; Fri, 24 Jun 2022 14:49:46 UTC
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3B11420345
	for <nbd@other.debian.org>; Fri, 24 Jun 2022 14:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=okVoW3coGsj92b0uQX3QABTSFN/ShjVxlxWt4Cg34NM=; b=OdgDByPkM61YGfv+kPMzjxyoxp
	7Ch0/pMENwrwZ0w91LQPLsRcD/nVKZ9CB9xpx4VOD5ObsixSvmq5RDqKVb3gaf3TFfs48PKZA30to
	105yJwQl6pf+V8JcFTDABphOegXGk9yBi8245f/2xWp60e1bJttt8RZv2P0PNbsE/K6Sy8OjoAI20
	UQcU0CT2jF26tKVzn2tEZG0goK4IiRB2fyXxKeuWtDzaJ6mvy+Fsczq+Sc5Ih8QPLnSs7TODAuebx
	sNggTv4qa5JfzRUDr/IgGP/bWgu2JaT4vOSyUJ0bmsQMjaA1+Z/ljNItFRioPbKKfeQ8HbAtKtiDo
	pPX4bZuQ==;
Received: from [102.39.138.29] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1o4jzE-003Llb-Kn; Fri, 24 Jun 2022 16:08:40 +0200
Received: from wouter by pc220518 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1o4jz7-0001bN-B3;
	Fri, 24 Jun 2022 16:08:33 +0200
Date: Fri, 24 Jun 2022 16:08:33 +0200
From: Wouter Verhelst <w@uter.be>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, nbd@other.debian.org,
	libguestfs@redhat.com, Nikolaus Rath <Nikolaus@rath.org>
Subject: Re: Kernel driver I/O block size hinting
Message-ID: <YrXFYf+6aVUNyIhi@pc220518.home.grep.be>
References: <20220614143819.GX8021@redhat.com>
 <Yqxed4R13WgNjzky@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqxed4R13WgNjzky@pc220518.home.grep.be>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <n5jbp9eeUIP.A.nMG.Y8ctiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2179
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YrXFYf+6aVUNyIhi@pc220518.home.grep.be
Resent-Date: Fri, 24 Jun 2022 14:50:00 +0000 (UTC)

Sorry for the late reply.

I just noticed that my mail config was borked; I was happily sending out
emails, but none of them reached anyone :-/

Fixed now.

On Fri, Jun 17, 2022 at 12:59:04PM +0200, Wouter Verhelst wrote:
> Hi,
> 
> On Tue, Jun 14, 2022 at 03:38:19PM +0100, Richard W.M. Jones wrote:
> > This is a follow-up to this thread:
> > 
> >   https://listman.redhat.com/archives/libguestfs/2022-June/thread.html#29210
> > 
> > about getting the kernel client (nbd.ko) to obey block size
> > constraints sent by the NBD server:
> > 
> >   https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md#block-size-constraints
> > 
> > I was sent this very interesting design document about the original
> > intent behind the kernel's I/O limits:
> > 
> >   https://people.redhat.com/msnitzer/docs/io-limits.txt
> > 
> > There are four or five kernel block layer settings we could usefully
> > adjust, and there are three NBD block size constraints, and in my
> > opinion there's not a very clear mapping between them.  But I'll have
> > a go at what I think we should do.
> > 
> > 	- - -
> > 
> > (1) Kernel physical_block_size & logical_block_size: The example given
> > is of a hard disk with 4K physical sectors (AF) which can nevertheless
> > emulate 512-byte sectors.  In this case you'd set physical_block_size
> > = 4K, logical_block_size = 512b.
> > 
> > Data structures (partition tables, etc) should be aligned to
> > physical_block_size to avoid unnecessary RMW cycles.  But the
> > fundamental until of I/O is logical_block_size.
> > 
> > Current behaviour of nbd.ko is that logical_block_size ==
> > physical_block_size == the nbd-client "-b" option (default: 512 bytes,
> > contradicting the documentation).
> 
> Whoops, indeed. Fixed in git.
> 
> > I think we should set logical_block_size == physical_block_size ==
> > MAX (512, NBD minimum block size constraint).
> > 
> > What should happen to the nbd-client -b option?
> 
> I believe it remains useful to have an override for exceptional
> situations. I think I'll leave it (but we can provide an appropriate
> warning about this possibly being a bad idea in the man page)
> 
> It might be useful to extend the syntax to specify more than one block
> size, given that there are going to be multiple ones now.
> 
> > (2) Kernel minimum_io_size: The documentation says this is the
> > "preferred minimum unit for random I/O".
> > 
> > Current behaviour of nbd.ko is this is not set.
> > 
> > I think the NBD's preferred block size should map to minimum_io_size.
> > 
> > 
> > (3) Kernel optimal_io_size: The documentation says this is the
> > "[preferred] streaming I/O [size]".
> > 
> > Current behaviour of nbd.ko is this is not set.
> > 
> > NBD doesn't really have the concept of streaming vs random I/O, so we
> > could either ignore this or set it to the same value as
> > minimum_io_size.
> > 
> > I have a kernel patch allowing nbd-client to set both minimum_io_size
> > and optimal_io_size from userspace.
> > 
> > 
> > (4) Kernel blk_queue_max_hw_sectors: This is documented as: "set max
> > sectors for a request ... Enables a low level driver to set a hard
> > upper limit, max_hw_sectors, on the size of requests."
> > 
> > Current behaviour of nbd.ko is that we set this to 65536 (sectors?
> > blocks?), which for 512b sectors is 32M.
> > 
> > I think we could set this to MIN (32M, NBD maximum block size constraint),
> > converting the result to sectors.
> > 
> > 	- - -
> > 
> > What do people think?
> 
> Yes, this all looks reasonable to me. Thanks.
> 
> -- 
>      w@uter.{be,co.za}
> wouter@{grep.be,fosdem.org,debian.org}

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

