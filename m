Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A7D94B6F7
	for <lists+nbd@lfdr.de>; Thu,  8 Aug 2024 08:55:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0D9BE2055A; Thu,  8 Aug 2024 06:55:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug  8 06:55:33 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 837A220544
	for <lists-other-nbd@bendel.debian.org>; Thu,  8 Aug 2024 06:55:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7CSeUp2QD0lp for <lists-other-nbd@bendel.debian.org>;
	Thu,  8 Aug 2024 06:55:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A5D20204C9
	for <nbd@other.debian.org>; Thu,  8 Aug 2024 06:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CkNQ++hXOcHLfwKCSMCwfF8NRO3P+JNlXngejOjZghQ=; b=S0ZvMeNnnjtmOJADtybifiI/sS
	NcmG5eoqDLvMYm8Pve9jqUor6pEvq+5JApd46AyrJ6ugV/RT0O9HNmSsrbJWbyhog3RKe/G0GZS1S
	+WsS6u3Hr5pt/u6w7tvFDkrTLY8ZhefawnhsWZJxN0Mk1vIRcVxdoTe3/RPPALZdjOf5MgGKby+p0
	dXb0w2soa8Icto3I4Nuao+PRKGrrttX/HW2OMFCE0a7cdpAGBo066Xo6P+0RuIs3H7HoebMbeU+UD
	o7fO3YVdH2NTOABarSM/MZt8O8c7cHExrdWpT+tYIXdEl9BvWmeoD8fSd2LZDZU2hVDXH3oqo5fao
	iNqIIKJg==;
Received: from [102.39.154.62] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1sbx3N-002Rr1-0o;
	Thu, 08 Aug 2024 08:55:17 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <w@uter.be>)
	id 1sbx3F-000000001HC-21dN;
	Thu, 08 Aug 2024 08:55:09 +0200
Date: Thu, 8 Aug 2024 08:55:09 +0200
From: Wouter Verhelst <w@uter.be>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] nbd: correct the maximum value for discard sectors
Message-ID: <ZrRrzTKiAVXNItFo@pc220518.home.grep.be>
References: <20240803130432.5952-1-w@uter.be>
 <20240806133058.268058-1-w@uter.be>
 <20240806133058.268058-3-w@uter.be>
 <20240807135625.GA242945@perftesting>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807135625.GA242945@perftesting>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ae5lut4Ya5K.A.Ay-L.lvGtmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3127
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZrRrzTKiAVXNItFo@pc220518.home.grep.be
Resent-Date: Thu,  8 Aug 2024 06:55:34 +0000 (UTC)

Hi Josef,

On Wed, Aug 07, 2024 at 09:56:25AM -0400, Josef Bacik wrote:
> We use 512 as the "sectors" measurement throughout the block layer, so our limit
> is actually
> 
> UINT32_MAX >> 9
> 
> since we can only send at most UINT32_MAX as our length.  Fix it to be that for
> both patches and you should be good.  Thanks,

My first stab actually used UINT32_MAX, but that didn't compile.

I investigated and found that for the kernel, UINT32_MAX and UINT_MAX
are actually the same, but in order for me to be able to use UINT32_MAX
(or U32_MAX, which is also defined to the same value), I would need
extra includes.

So I'll stick with the UINT_MAX >> SECTOR_SHIFT definition that Damien
suggested.

Thanks,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

