Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7A88301EC
	for <lists+nbd@lfdr.de>; Wed, 17 Jan 2024 10:10:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A1ED22093C; Wed, 17 Jan 2024 09:10:36 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan 17 09:10:36 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0DCB92085F
	for <lists-other-nbd@bendel.debian.org>; Wed, 17 Jan 2024 09:10:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.11 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HeZr80ow7BjV for <lists-other-nbd@bendel.debian.org>;
	Wed, 17 Jan 2024 09:10:18 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 79FF9208A4
	for <nbd@other.debian.org>; Wed, 17 Jan 2024 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xOyZZVEaP9aaaDdFHXxDjU/Eedw2q0FuN3c3ZqCZSE8=; b=FvjFe+eDczGSorYdnirCRIMU1p
	/eTrtxgk99ptIgISpkhHhUxCso89MfAuvgbv8cOjvAQvux+qL3OFS6Dkkm6/Nq3Kw78ZqdPjyw6B1
	z9Ic1Mi/hbXVpjsHoi4CqMpvWNqBN8YZ8/tDtchlnWEoXi4j7E/SQ/FLI2SUBvvEZCQ+C9VQlq49Y
	RPx8h/Q57z/P8Cz1m+VvJZEsgtbMANDK13EgU5NGLWyHJwXfcVepaYo7jXF1AGy3twyztl2hjUcSk
	jsoFvfT48x66121C/Nm4LuWkqzINQ/1NpbMu4jqNWEKQB+db0d5J22UMBxQYrttNteTofQ1jFAuV5
	cyuaHEWg==;
Received: from [102.39.158.142] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1rQ1w7-007N0K-19;
	Wed, 17 Jan 2024 10:10:15 +0100
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1rQ1vs-000000009AF-05g8;
	Wed, 17 Jan 2024 11:10:00 +0200
Date: Wed, 17 Jan 2024 11:09:49 +0200
From: Wouter Verhelst <w@uter.be>
To: Lars Rohwedder <roker@pep-project.org>
Cc: nbd@other.debian.org
Subject: Re: Can dependency to "docbook-utils" be made optional?
Message-ID: <ZaeZXU9HZx3IAMvS@pc220518.home.grep.be>
References: <19b8472a-305c-4f23-a985-c5567a10b5df@pep-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19b8472a-305c-4f23-a985-c5567a10b5df@pep-project.org>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <l7NR7xCE7r.A.JSG.Mm5plB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2711
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZaeZXU9HZx3IAMvS@pc220518.home.grep.be
Resent-Date: Wed, 17 Jan 2024 09:10:36 +0000 (UTC)

Hi Lars,

On Tue, Jan 16, 2024 at 10:40:03PM +0100, Lars Rohwedder wrote:
> Hi there,
> 
> I just wanted to build nbd from the github repo, and as described in the
> README.md it depends on the SGML tools, which are in "docbook-utils" on
> Debian.
> 
> So I started to install it and was really surprised about its irritating
> huge dependency list and its size:
[...]
> 641 MB!? Seriously? Just to generate man pages from XML files?
> *sigh*
> 
> So my question is: Is it possible to get rid of this dependency or at least
> make the generation of man pages optional?

It kinda is, actually, if you just touch the .sh.in files. I've just
made that a bit more explicit in the autogen.sh script.

Thanks for the suggestion.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

