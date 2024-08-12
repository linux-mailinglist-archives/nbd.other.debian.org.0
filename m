Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B6D94EEE5
	for <lists+nbd@lfdr.de>; Mon, 12 Aug 2024 15:55:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1BF852058C; Mon, 12 Aug 2024 13:55:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 12 13:55:26 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 663E220589
	for <lists-other-nbd@bendel.debian.org>; Mon, 12 Aug 2024 13:55:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QNWcnbZwURUu for <lists-other-nbd@bendel.debian.org>;
	Mon, 12 Aug 2024 13:55:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 71F9320581
	for <nbd@other.debian.org>; Mon, 12 Aug 2024 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=tsOaNUnXsW8E+PfttAxy3/HK27PU6Ot2r+AEqAMuPS0=; b=muIgzAd7z2Rrw4e5+fjQK9d4nq
	Csa6WTM0ct0M8SFKikpETUDEtg+RZrsERFdS4aPh1CDhygeVDd78aSXZ3eEr8c8BwNr9I+AKKcDsn
	thLbNmEitzcrxADd+wz42zQ32bYeDeyktXIrdDVQuHMxHR6ILyYXp1aJIqu7G43hbgnT94RXP2S7H
	TV1tS4dqFcHbXqrtalY1HVsDBeuLvh9+c+8fviS7EOtMZiuUOerZC8XANq6L4Pw2VwPQXSY/98vA1
	Yjyran9KjtgRtEo0rbrWIKuehyd/6JBUHeUA73nWdMQVly2iq7dRSv+indXCtPvKd+JdS1cDJ8z8Q
	ZI3L/KRw==;
Received: from vc-gp-n-105-245-229-160.umts.vodacom.co.za ([105.245.229.160] helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1sdVVw-009ZOe-0f;
	Mon, 12 Aug 2024 15:55:12 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <w@uter.be>)
	id 1sdUyk-00000000Twm-1jVC;
	Mon, 12 Aug 2024 15:20:54 +0200
Date: Mon, 12 Aug 2024 15:20:22 +0200
From: Wouter Verhelst <w@uter.be>
To: Jens Axboe <axboe@kernel.dk>
Cc: Josef Bacik <josef@toxicpanda.com>, Damien Le Moal <dlemoal@kernel.org>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] nbd: correct the maximum value for discard sectors
Message-ID: <ZroMFpaP69uUfC14@pc220518.home.grep.be>
References: <20240803130432.5952-1-w@uter.be>
 <20240808070604.179799-1-w@uter.be>
 <20240808070604.179799-3-w@uter.be>
 <584a1774-0268-4b3c-9a78-0f00073b9d74@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <584a1774-0268-4b3c-9a78-0f00073b9d74@kernel.dk>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XE5mPZxuNQD.A.DluC.ORhumB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3136
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZroMFpaP69uUfC14@pc220518.home.grep.be
Resent-Date: Mon, 12 Aug 2024 13:55:26 +0000 (UTC)

On Fri, Aug 09, 2024 at 09:34:55AM -0600, Jens Axboe wrote:
> On 8/8/24 1:06 AM, Wouter Verhelst wrote:
> > Fixes: 268283244c0f018dec8bf4a9c69ce50684561f46
> 
> This isn't the correct way to have a fixes line.

Apologies Jens; beginner's mistake.

> In general, please don't nest next versions under the previous posting,
> and it's strongly recommended to have a cover letter that includes that
> changed from version N to N+1. Otherwise we have to guess... So please
> include that when posting v4.

Right, sorry. "git help send-email" gave an example of how to do
something like this for a "v2" patch series, which made me assume
(incorrectly) that this is what would be wanted. I should have checked
first, I guess.

Will send v4 (hopefully the last one) shortly with those fixes.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

