Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5EA96E576
	for <lists+nbd@lfdr.de>; Fri,  6 Sep 2024 00:01:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E8E3B20B65; Thu,  5 Sep 2024 22:01:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  5 22:01:23 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1D62920ADE
	for <lists-other-nbd@bendel.debian.org>; Thu,  5 Sep 2024 22:01:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.21 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wOCDkvN1vHxW for <lists-other-nbd@bendel.debian.org>;
	Thu,  5 Sep 2024 22:01:11 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 630B820AB1
	for <nbd@other.debian.org>; Thu,  5 Sep 2024 22:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jM70IaqB9BGHYnrOZoKLUhqPTN3IEuxRbg88d5FNPPY=; b=Lv0fHl/a5D5K+IfJJMIUdUPH1T
	iL2NxSkhrzIq5xWEJC0Npme9vpGttHO9tSrsdvR1MuqdDkssYSVYkZrnNoijFMKtJzKnkmLTHeahM
	pP7Ipf11/8Af7uY1fFTwDRnv/QGrLMXNXSsDSIYRON9CdkbJZxbK8LJlXtfDrTZycgceW17RDp0ug
	JPLutyQyP5w8yCfzErw17la1TXy/FpW+SS0Lut/ziWsloADxCUoCBA+bUNnEMducQNls0LoqYltnp
	aJkhgqFjyVh4yq44EyGw95vy+EYuVfJCZBdCdxlI9/34CFPQaPm1cA73PDyAuWj1lW/7/mkquo1re
	gtUJAWwA==;
Received: from [102.39.140.57] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1smKXA-00CRS7-0H;
	Fri, 06 Sep 2024 00:00:56 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <w@uter.be>)
	id 1smKX2-000000003EE-0qNM;
	Fri, 06 Sep 2024 00:00:48 +0200
Date: Fri, 6 Sep 2024 00:00:47 +0200
From: Wouter Verhelst <w@uter.be>
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>
Cc: Eric Blake <eblake@redhat.com>, Damien Le Moal <dlemoal@kernel.org>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] nbd: WRITE_ZEROES and a few fixes
Message-ID: <ZtoqD0ObBsZJQEKy@pc220518.home.grep.be>
References: <20240812133032.115134-1-w@uter.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812133032.115134-1-w@uter.be>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-8_7u82Bz7B.A.rUT.zoi2mB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3145
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZtoqD0ObBsZJQEKy@pc220518.home.grep.be
Resent-Date: Thu,  5 Sep 2024 22:01:23 +0000 (UTC)

Hi Jens,

Has been a few weeks since I sent this. Friendly ping?

On Mon, Aug 12, 2024 at 03:20:35PM +0200, Wouter Verhelst wrote:
> Implement the WRITE_ZEROES command for the NBD kernel driver. While
> here, add NBD_FLAG_ROTATIONAL to the function that decodes our flags for
> debugfs.
> 
> ---
> v2: Divide UINT_MAX by blksize for the maximum number of sectors
> supported by trim/discard and write_zeroes commands, as NBD uses 32-bit
> values for byte lengths, and otherwise that wouldn't fit.
> v3: Use the SECTOR_SHIFT value as a right-shift operand, rather than the
> blksize value, to get the correct operand.
> v4: Fix commit messages to use correct style. Thanks, Jens.
> ---
>  drivers/block/nbd.c      |   12 +++++++++++-
>  include/uapi/linux/nbd.h |    5 ++++-
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

