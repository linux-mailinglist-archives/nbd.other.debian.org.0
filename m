Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E1517482398
	for <lists+nbd@lfdr.de>; Fri, 31 Dec 2021 12:15:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id BE8F3201EC; Fri, 31 Dec 2021 11:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Dec 31 11:15:10 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 895C720178
	for <lists-other-nbd@bendel.debian.org>; Fri, 31 Dec 2021 11:15:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Kprt7KWvvCEA for <lists-other-nbd@bendel.debian.org>;
	Fri, 31 Dec 2021 11:14:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8321520166
	for <nbd@other.debian.org>; Fri, 31 Dec 2021 11:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qRqQ5tSM/Xr11wd4y/0i4Hhmbz+H70rccp1exAQCW5s=; b=eV4TP1AiZKTpfhfeH2I3MzLp1k
	2KnaFO/G541Kc2y85JJ2y+DN6/NtePbWmoXtvOsEkkfISlMuhBNhC2LkRz0xF6gBJ1tYlz5Lmd8dk
	280IwL6c4CZGogy5Pta5mdeWTB7wCTniSGMmIzVw8bXUdCn99ShQU9vt9mIpT1iaJPEvEAjrUd1As
	ayUAaL3MALZabWiExkGISZ8HqdU+/zz+8594V08/w69TXfgzizxfU9c2AICqHXZM0by6G09eNU3Hg
	MWi1kgqHURo8+GyrmbR3nTSV1kV8erdvBZJjsVaYeZxFnuoFF0LDmw0knt7aR6BzthZPn/vPry+3t
	TzAzkdVA==;
Received: from [209.203.16.11] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1n3Fs4-003yof-NF; Fri, 31 Dec 2021 12:14:52 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1n3Frv-0005UE-NA;
	Fri, 31 Dec 2021 13:14:43 +0200
Date: Fri, 31 Dec 2021 13:14:43 +0200
From: Wouter Verhelst <w@uter.be>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: nbd@other.debian.org
Subject: Re: datalog including written data?
Message-ID: <Yc7mIwx/k0/TS/1q@pc181009.grep.be>
References: <fe55642d-be5c-5800-88a2-6fb13c2d2004@colorfullife.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe55642d-be5c-5800-88a2-6fb13c2d2004@colorfullife.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2FS6UfJvnKL.A.syG.-YuzhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1666
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Yc7mIwx/k0/TS/1q@pc181009.grep.be
Resent-Date: Fri, 31 Dec 2021 11:15:10 +0000 (UTC)

Hi Manfred,

On Mon, Dec 20, 2021 at 05:48:35PM +0100, Manfred Spraul wrote:
> Hello together,
> 
> for a stress test application, I would like to extend the datalog to include
> the actual written data.
> 
> The use case is to replay parts of the log, similar to what I wrote for a
> NAND driver a few years ago:
> 
> https://patchwork.ozlabs.org/project/linux-mtd/cover/20171206085039.27164-1-dirk.behme@de.bosch.com/
> 
> a) Has anyone done that before?

Not me.

> b) As first observation:
> 
> https://github.com/NetworkBlockDevice/nbd/blob/master/nbd-server.c#L294
> 
> The server supports
> 
> NBD_CMD_READ, NBD_CMD_WRITE, NBD_CMD_DISC, NBD_CMD_FLUSH, NBD_CMD_TRIM,
> NBD_CMD_WRITE_ZEROES
> 
> https://github.com/NetworkBlockDevice/nbd/blob/master/nbd-trdump.c#L71
> 
> The trace dump utility supports
> 
> NBD_CMD_READ, NBD_CMD_WRITE, NBD_CMD_DISC, NBD_CMD_FLUSH
> 
> -> TRIM and WRITE_ZEROES is missing.
> 
> 
> Should I create a patch that adds TRIM and WRITE_ZEROES to nbd-trdump?

Yes, that might be nice. nbd-trdump hasn't been looked at in a while,
which is why TRIM and WRITE_ZEROES haven't been added to it yet.

Thanks for your effort,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

