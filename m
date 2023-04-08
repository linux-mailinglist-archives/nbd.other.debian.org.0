Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2286DBA1B
	for <lists+nbd@lfdr.de>; Sat,  8 Apr 2023 12:39:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5591C20669; Sat,  8 Apr 2023 10:39:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Apr  8 10:39:31 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0DC5A20662
	for <lists-other-nbd@bendel.debian.org>; Sat,  8 Apr 2023 10:39:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RrbU_gu5fupt for <lists-other-nbd@bendel.debian.org>;
	Sat,  8 Apr 2023 10:39:14 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F3E5C20655
	for <nbd@other.debian.org>; Sat,  8 Apr 2023 10:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nnTgB/8BBTIq7m6UrfU8y+yctgQpYDSefnqtFrdp8ss=; b=ZEEz0tTBf6VMBZpfpmoOaaK7Er
	RZ+Q9/E1Rby5GexesoV8DCgjAJlMypW8WPjnvQdrvz/AB1TfWDeASZfiL/S+UZT2Ix3tUQwL70xt4
	CZIC+Hj2WvBe0Io2fWnM15kc7pcLCN9Dg8mKIOd7yUtm0GiWrmUh4UwnjtjJqtlqk53CQyyf4Q9xA
	Gp8ROFPxH3wkUafXEPjjxATd1bjo+GgRuThFAxbR2F6nd336IZjxhVSgLw4eUP6drmOiC34pIRRgI
	6q3wCHc7UiRa+NCjx1DT3HzUQugY4Im860brdhCMgfpdG/Lhiq1uObQCFY2cXGt/Ln95CMnWvxgGg
	Q3FzAjIw==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pl5yO-00EC4w-SC
	for nbd@other.debian.org; Sat, 08 Apr 2023 12:39:08 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pl5yG-000DJ9-2F
	for nbd@other.debian.org;
	Sat, 08 Apr 2023 12:39:00 +0200
Date: Sat, 8 Apr 2023 12:39:00 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: Re: [PATCH v2] nbd-server: Implement structured replies
Message-ID: <ZDFERKb1FlQ6WBPl@pc220518.home.grep.be>
References: <20230311130705.253855-1-w@uter.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230311130705.253855-1-w@uter.be>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <4a7P-ogUer.A.YfB.jRUMkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2415
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZDFERKb1FlQ6WBPl@pc220518.home.grep.be
Resent-Date: Sat,  8 Apr 2023 10:39:31 +0000 (UTC)

FYI: this has now (with fixes for issues pointed out) been merged to
master.

On Sat, Mar 11, 2023 at 03:07:01PM +0200, w@uter.be wrote:
> This series implements structured replies for nbd-server.
> 
> Changes from v1:
> - Ensure we write to the transactionlog in the case of structured
>   replies, too (had overlooked that, whoops)
> - Add missing checks for malloc() failure
> - Removal of unnecessary variables (or moved them to a more limited
>   scope)
> - Wipe the correct value upon STARTTLS
> - Consume unused values on error
> 
> 
> 

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

