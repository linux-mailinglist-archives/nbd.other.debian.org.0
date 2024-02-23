Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E58860D53
	for <lists+nbd@lfdr.de>; Fri, 23 Feb 2024 09:55:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D0F2A220AB; Fri, 23 Feb 2024 08:55:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 23 08:55:58 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MD5_SHA1_SUM,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 88B57220A9
	for <lists-other-nbd@bendel.debian.org>; Fri, 23 Feb 2024 08:55:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.11 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id g43ScI_60mRb for <lists-other-nbd@bendel.debian.org>;
	Fri, 23 Feb 2024 08:55:38 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E87AE220A8
	for <nbd@other.debian.org>; Fri, 23 Feb 2024 08:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kjpyUQVsz8BiPJYM/RnTAocoHTRggvXSqrvEArM5Gsw=; b=OUChvajiWxt3lP62eFnY9nMAI1
	JqQTkjWvmOimOIdSI1yd9Ahy5JLYzhF56h0++PGWzK1Akywl4o7DVeXjz40p6Jni4RtIb6n0RtJcd
	aEH5y7coDOTASOgIKL87VgQ1gI5e7xVSxhRZdH4MrCInRTOq30QaPT4q2s+Ajw6MJ5YmeA1FOkfzj
	3obuD3MRCxx9rvhHWPBMxoCnjr+tB/oJUKwmqwgpGOObXRl32cqBXzEpAiikVgTBksjeSt373KfgR
	sQoLjaPY8ri0fyOvWshDVZMPitVvMXC8Y19FX/cWylwDhUpzKwtwMDx3CJBswT3x3Pfx9D0uUid8E
	pSdQPFDA==;
Received: from [102.39.148.255] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1rdRLE-0093JR-0p;
	Fri, 23 Feb 2024 09:55:36 +0100
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1rdRKy-000000004qV-3mz5;
	Fri, 23 Feb 2024 10:55:20 +0200
Date: Fri, 23 Feb 2024 10:55:20 +0200
From: Wouter Verhelst <w@uter.be>
To: Lukasz Stelmach <l.stelmach@samsung.com>
Cc: nbd@other.debian.org, Karol Lewandowski <k.lewandowsk@samsung.com>,
	=?utf-8?B?7J6s7ZuIIOyglQ==?= <jh80.chung@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marek Pikula <m.pikula@partner.samsung.com>
Subject: Re: Fixes after static code analysis
Message-ID: <ZdhdeAVU9u1ZWnI4@pc220518.home.grep.be>
References: <ZdSVsGq3u83Z6w-V@pc220518.home.grep.be>
 <CGME20240222113509eucas1p1f1590778e4d4144d19b6a2d6df65fba5@eucas1p1.samsung.com>
 <oypijdcysohgv1.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <oypijdcysohgv1.fsf%l.stelmach@samsung.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7dDvVi79XpE.A.yfG.e2F2lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2768
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZdhdeAVU9u1ZWnI4@pc220518.home.grep.be
Resent-Date: Fri, 23 Feb 2024 08:55:58 +0000 (UTC)

Hi Lukasz,

On Thu, Feb 22, 2024 at 12:34:58PM +0100, Lukasz Stelmach wrote:
> Hello Wouter,
> 
> It was <2024-02-20 wto 14:06>, when Wouter Verhelst wrote:
> > I finally had time to have a look at your patches. Unfortunately, they
> > break the test suite; if you run "make check", the result is fairly
> > depressing :)
> >
> > Can you have a look at what's going wrong?
> 
> I "fixed" one too many memory leaks reported by Coverity. I'd reverted[1]
> it and it helped
> 
> --8<---------------cut here---------------start------------->8---
> $ make check
> make  check-recursive
> […]
> ==================
> All 5 tests passed
> ==================
> […]
> ../inetd
> Error: inetd mode not supported without syslog support
> SKIP: inetd
> […]
> ====================
> All 18 tests passed
> (1 test was not run)
> ====================
> --8<---------------cut here---------------end--------------->8---

Thanks.

I've merged your branch, but removed those two commits (the original and
the revert).

> >> PS. I received thee more bug reports to handle. I'll review them when I
> >> get back from FOSDEM, so you don't need to hurry with these.
> 
> Below the revert there are two more commits ("Fix out-of-bounds access")
> I created after 2c54e25b0c we talked about last time.
> 
> [1] https://git.tizen.org/cgit/platform/upstream/nbd/log/?id=9e25a075173345410de58ac9406a464fce929531

These were merged too.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

