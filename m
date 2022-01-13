Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A99F48D379
	for <lists+nbd@lfdr.de>; Thu, 13 Jan 2022 09:20:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2FB9C20607; Thu, 13 Jan 2022 08:20:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 13 08:20:14 2022
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A99C92058E
	for <lists-other-nbd@bendel.debian.org>; Thu, 13 Jan 2022 08:20:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vAJIVtH2cha6 for <lists-other-nbd@bendel.debian.org>;
	Thu, 13 Jan 2022 08:19:59 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E0FB42057C
	for <nbd@other.debian.org>; Thu, 13 Jan 2022 08:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FvwxQVH8Iu+qaejA86cn7ydlAOWXRK7iqVaVHQCZqFQ=; b=oYs/HRlacnows9fvvhhgQRF7GA
	iDTOCCsaeI4UeaqBDL22SbtA+l6RP4pypHRn7AA0UkUHEtuqRxuOwHZdzcdWU+9MX4G+zZoRiC1NK
	W4flbEjJxBHtYwNAtNrby6inXZMreWE5XBh9ZvRMf7tWiPfPfok55Q6Qz1VWd2obLm4+XHgiodWZk
	Aqjy74+ZxAyY11FHekCFxr88RWfpMldXfzPopys+BZma4ROb+W6gwKJw1/LbqG0Z57rAdz5ILNluz
	lD6Ko/CRzE2iIzAv8HY6z3Vxo5Idnj5qLTSDvP/WHwk/fvBmEZwclhKQ24BVxIuxZbosJj2lZgtVj
	d0Rc81xw==;
Received: from [209.203.16.11] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1n7ut4-00EzMj-A3; Thu, 13 Jan 2022 08:51:10 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1n7usx-001Rdb-J8;
	Thu, 13 Jan 2022 09:51:03 +0200
Date: Thu, 13 Jan 2022 09:51:03 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: Manfred Spraul <manfred@colorfullife.com>, nbd@other.debian.org
Subject: Re: datalog including written data?
Message-ID: <Yd/Z5xJNS2cIElHi@pc181009.grep.be>
References: <fe55642d-be5c-5800-88a2-6fb13c2d2004@colorfullife.com>
 <Yc7mIwx/k0/TS/1q@pc181009.grep.be>
 <20220111204214.dswtdkpa3mfgvsbc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111204214.dswtdkpa3mfgvsbc@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2IfmvXUPnrH.A.PVE.-C-3hB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1683
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Yd/Z5xJNS2cIElHi@pc181009.grep.be
Resent-Date: Thu, 13 Jan 2022 08:20:14 +0000 (UTC)

On Tue, Jan 11, 2022 at 02:42:14PM -0600, Eric Blake wrote:
> On Fri, Dec 31, 2021 at 01:14:43PM +0200, Wouter Verhelst wrote:
> > 
> > > b) As first observation:
> > > 
> > > https://github.com/NetworkBlockDevice/nbd/blob/master/nbd-server.c#L294
> > > 
> > > The server supports
> > > 
> > > NBD_CMD_READ, NBD_CMD_WRITE, NBD_CMD_DISC, NBD_CMD_FLUSH, NBD_CMD_TRIM,
> > > NBD_CMD_WRITE_ZEROES
> > > 
> > > https://github.com/NetworkBlockDevice/nbd/blob/master/nbd-trdump.c#L71
> > > 
> > > The trace dump utility supports
> > > 
> > > NBD_CMD_READ, NBD_CMD_WRITE, NBD_CMD_DISC, NBD_CMD_FLUSH
> > > 
> > > -> TRIM and WRITE_ZEROES is missing.
> > > 
> > > 
> > > Should I create a patch that adds TRIM and WRITE_ZEROES to nbd-trdump?
> > 
> > Yes, that might be nice. nbd-trdump hasn't been looked at in a while,
> > which is why TRIM and WRITE_ZEROES haven't been added to it yet.
> 
> It may also be worth adding NBD_CMD_CACHE trace support, even if that
> is not yet implemented in nbd-server.

Yeah, sounds like a good idea.

> That said, it looks like your use of nbd-server transactionlog and
> nbd-trdump is to analyze what happened after the fact.

That is the main use, yes, although it can also be used to debug issues
live, and it's used in the test suite as well.

> It would also be possible to achieve the same goal (with trim and
> write_zeroes support already working) by using nbdkit's log filter[1],
> where you may also use nbdkit's nbd plugin[2] as an intermediary
> between any NBD server and client in order to inject arbitrary nbdkit
> filters in the chain.

While this is no doubt accurate, I think nbd-server should be
self-contained; that is, features implemented in nbd-server should not
depend on other NBD implementations :)

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

