Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id socTGbVsmWmrTwMAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Sat, 21 Feb 2026 09:28:37 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F01AE16C694
	for <lists+nbd@lfdr.de>; Sat, 21 Feb 2026 09:28:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8864420693; Sat, 21 Feb 2026 08:28:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Feb 21 08:28:36 2026
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 96BAE20686
	for <lists-other-nbd@bendel.debian.org>; Sat, 21 Feb 2026 08:28:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id l8wDeU2w7Nck for <lists-other-nbd@bendel.debian.org>;
	Sat, 21 Feb 2026 08:28:21 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
X-Greylist: delayed 1851 seconds by postgrey-1.36 at bendel; Sat, 21 Feb 2026 08:28:21 UTC
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 7B96D20664
	for <nbd@other.debian.org>; Sat, 21 Feb 2026 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xtxUAsT59NPs6gzYy9X1hD5odOkEUKtFULKq8kOaxHU=; b=Oc66e8GX0ESqK9U7HCeTXnLlp2
	fRN6dOOHNMVE7Ia74gTLHVCP3TzNmcktT2DJgntOrdT4Wr/xqMr35NHLPUc5FQCelURSLnmuKXt0N
	E1qM6y/MpwuH6QhJ4WGlO/HpN1gqmA9BVHdyfgC5cml8BaQs/yv3t+nFAw6GVmnjTj4b61WM6KFSi
	bD8ey+0EU77rua3ZWBKiPgDgt/lShsWHaPtKcSRBt0SAJzedPcGmmivyYtMcXzH2wudMLmaT7CCKL
	hwPi29zYQBDWhMoHvsGHWkrn6ksUAuwEGvCZWmvOtL/p1JtfpOXB3DFXPBO3wwOLamHobydVCzyIe
	4UalJdOw==;
Received: from [102.39.233.88] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <w@uter.be>)
	id 1vthrj-0000000BpKA-1bn2;
	Sat, 21 Feb 2026 08:57:27 +0100
Received: from wouter by pc220518 with local (Exim 4.99.1)
	(envelope-from <w@uter.be>)
	id 1vthrX-00000009QBy-1IIi;
	Sat, 21 Feb 2026 09:57:15 +0200
Date: Sat, 21 Feb 2026 09:57:15 +0200
From: Wouter Verhelst <w@uter.be>
To: Yunseong Kim <ysk@kzalloc.com>
Cc: Eric Blake <eblake@redhat.com>, Pavel Machek <pavel@kernel.org>,
	nbd@other.debian.org
Subject: Re: [PATCH] nbd: fix build failure after openunix/opennet refactor
Message-ID: <aZllW3C5XsdxC-l5@pc220518.home.grep.be>
References: <20250915002941.937139-2-ysk@kzalloc.com>
 <aVDkryhNK5xNcOGF@pc220518.home.grep.be>
 <a482c91f-4acd-4799-88bd-ce9c6c0f53b1@kzalloc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a482c91f-4acd-4799-88bd-ce9c6c0f53b1@kzalloc.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <w6vkjCZhRlF.A.BAjL.0yWmpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3499
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aZllW3C5XsdxC-l5@pc220518.home.grep.be
Resent-Date: Sat, 21 Feb 2026 08:28:36 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	R_DKIM_REJECT(1.00)[uter.be:s=2021.lounge];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[uter.be : No valid SPF,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ysk@kzalloc.com,m:eblake@redhat.com,m:pavel@kernel.org,m:nbd@other.debian.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_SENDER(0.00)[w@uter.be,bounce-nbd=lists@other.debian.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[uter.be:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[w@uter.be,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[nbd];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[]
X-Rspamd-Queue-Id: F01AE16C694
X-Rspamd-Action: no action

On Mon, Dec 29, 2025 at 12:31:41AM +0900, Yunseong Kim wrote:
> Hi Wouter,
> 
> On 12/28/25 5:05 PM, Wouter Verhelst wrote:
> > Hi there,
> > 
> > Sorry for the late reply; applied.
> No problem, I'd love to get involved with the NBD subsystem!
> 
> I'm interested in improving NBD robustness and security. Which communication
> channels are most active for the NBD subsystem? I'm currently diving into
> the NBD kernel code and would appreciate any guidance on where to start.

The mailinglist, but I've been somewhat inactive about NBD (case in
point: this also took me a few months to reply to).

The reason is that I've been swamped with various other things I am or
used to be involved in, but I recently decided to step down from a few
roles that I was holding, and hopefully that should make me have more
time to deal with NBD.

Thanks for your interest, and don't be discouraged by my inaction! I'd
love to see more people work on NBD, and yes I do realize that's not
going to happen if I don't stay active at least for reviewing things
myself.

I'll try to do better from now on :)

-- 
"I never had a C in history!"
"Yeah, but there was so much less of it when you were my age!"
 -- Joe Brockmeier recounting a conversation with his father, cfgmgmtcamp 2026, Ghent

