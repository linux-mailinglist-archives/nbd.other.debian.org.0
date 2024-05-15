Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CB88C62F0
	for <lists+nbd@lfdr.de>; Wed, 15 May 2024 10:38:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 476CE20717; Wed, 15 May 2024 08:38:01 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed May 15 08:38:01 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BF25620713
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 May 2024 08:37:50 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fyrh1V3s8SIk for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 May 2024 08:37:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6F545206CB
	for <nbd@other.debian.org>; Wed, 15 May 2024 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=I091kQtY1hqDjIR52eRpShUnuR3CXqOo5NR4O5BD7WI=; b=Hv0/ym3zLX23QT4wc5WYXIX+xy
	na9ssktcozmjUliKgOAAvymNNyEbKLBw8L1pKzCEiLAKfJMDY204H7bSXOfnnyXj/W91WHJYlsnWr
	irWvNffb3cIuvLrOaGRRYKvm4UM8RB+/LgFbsq+Iff0u+FBWyBZDPCEbd06UMu7080ZYOxeuh16Jn
	4lFI3kgJVwhiqjDwsIMcN7T2bMlDKeV0o4JcioWTZ50GgGjFwbqmFQgJYnJpO/LMvC+Di1AunBohk
	spdyuA1rdAHQZgBZQewo0UviwucWzUloj0qYiezxSUgjPbWs+7Pf7XUBjeBex/CWv+4nQ721ScYDn
	lhdcmADw==;
Received: from [102.39.198.120] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1s7A8r-00FQ9E-0q
	for nbd@other.debian.org;
	Wed, 15 May 2024 10:37:41 +0200
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1s7A8k-000000008kd-0EFK
	for nbd@other.debian.org;
	Wed, 15 May 2024 10:37:34 +0200
Date: Wed, 15 May 2024 10:37:34 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: Re: Replace u32 and u64 by standard compliant uint32_t, uint64_t
Message-ID: <ZkR0TlEN4T1S4IhW@pc220518.home.grep.be>
References: <5e8a46d7-d110-4760-bd63-140e39c5e45c@pep-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e8a46d7-d110-4760-bd63-140e39c5e45c@pep-project.org>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6h9Kqc_F61C.A.NrG.pRHRmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2809
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZkR0TlEN4T1S4IhW@pc220518.home.grep.be
Resent-Date: Wed, 15 May 2024 08:38:01 +0000 (UTC)

On Sun, May 12, 2024 at 12:10:36PM +0200, Lars Rohwedder wrote:
> Hi all,
> 
> I'd like to get rid of the mixture non-standard typedefs u32, u64 with
> standard-compliant uint32_t, uint64_t.
> 
> Some examples: negotiate() in nbd-client.c, ntohll() in cliserv.c or
> send_export_info() in nbd-server.c.
> 
> 
> AFAIK u32, u64 came originally from Linux kernel source but in the NBD
> source exists an additional declaration in cliserv.h which might be also
> misleading on some architectures, so I'd like to change the whole code
> base to use standard types.
> 
> What do you think?

Sure.

Part of the NBD code predates C99, which introduced stdint.h. I've never
seen it as a priority ("it works"), but we might as well.

> I also have a patch & github merge request in petto, but it depends on
> the former "const void*" patch, so I'd wait for its landing first. :-)

That has now happened. Thanks :-)

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

