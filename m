Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E468A5220
	for <lists+nbd@lfdr.de>; Mon, 15 Apr 2024 15:46:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1EC542051F; Mon, 15 Apr 2024 13:46:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Apr 15 13:46:41 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1D7F72051B
	for <lists-other-nbd@bendel.debian.org>; Mon, 15 Apr 2024 13:46:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id u6NF1R9Y3-Hy for <lists-other-nbd@bendel.debian.org>;
	Mon, 15 Apr 2024 13:46:20 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CEF742051A
	for <nbd@other.debian.org>; Mon, 15 Apr 2024 13:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=R1exxGbr9Kg/N8NTYGYg74joRznqyJ78qFh6BmCLl4M=; b=lkOzsl4RPShTcctxTD3Y18ZYTL
	Kelw9TuR/GoZqMD8DKAwBvAje6ST5KLAA6yWgGjpMaWMV730RQdByh+XqGR4j9YeFMJrtRNVavoXf
	XwH4GMB+UNR+64cL+RNRilHmVZef9Hss1OSfh4KpjckcCD0oA0ODtsR4L2k6Dx089CWKQpmgZTZBc
	wrtQL5NXYtNwW+iLiEatUmUpCsQqrfblQ5JMBJZ8B0Km/fwmk8spNwgSe7tqH9KNklvZlNOF0+i+3
	zzbzJjAH+uLRpu+2hDvSceJhoOSlYeQkQov//pfm41ZBa5eExcZ52+kk/ScLC95svzKmeN5u9OCG4
	/wp4yfKg==;
Received: from [217.111.249.126] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1rwMf3-00HAlg-13;
	Mon, 15 Apr 2024 15:46:17 +0200
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1rwMex-00000000UUy-3qlp;
	Mon, 15 Apr 2024 15:46:11 +0200
Date: Mon, 15 Apr 2024 15:46:11 +0200
From: Wouter Verhelst <w@uter.be>
To: Lars Rohwedder <roker@pep-project.org>
Cc: nbd@other.debian.org
Subject: Re: Coding style question: Are self-fulfilling headers desired? Are
 u32/u64 or uint32_t/uint64_t preferred?
Message-ID: <Zh0vo1jP0eWrw8nP@pc220518.home.grep.be>
References: <ee0bb37f-9820-41d6-8303-9bcecad4f39e@pep-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee0bb37f-9820-41d6-8303-9bcecad4f39e@pep-project.org>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <yisyteESwhG.A.QfC.B_SHmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2789
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Zh0vo1jP0eWrw8nP@pc220518.home.grep.be
Resent-Date: Mon, 15 Apr 2024 13:46:41 +0000 (UTC)

Hi Lars,

On Wed, Apr 10, 2024 at 05:05:21PM +0200, Lars Rohwedder wrote:
> So my question is: Are patches / Github pull requests welcome or not, to
> clean-up stuff like this?

They would absolutely be welcome. I'll be the first one to admit that
some of the NBD code has grown a lot of hair over the years, and some
cleanup is sorely needed. I just have never gotten around to doing so.

If you're willing to work on that, then that's awesome, and I would love
to see that move forward.

I originally wrote a bit of an explanation of how we got here, but
really that doesn't matter at all; the fact is that there are a number
of inconsistencies, as you rightly point out, and we should resolve
those.

Other spaces in which cleanup could happen are:

- standardization of indentation;
- split up of nbd-server.c into a bunch of more-or-less self-contained
  files rather than the single gigantic monster that it is currently;
- refactoring of the nbdtab parsing function so that stuff is not passed
  in a gazillion of pointers to single variables, but so that instead we
  pass a single struct which has the pointers to the right locations
- ... and probably a few other things that I'm forgetting about right
  now.

I'm not saying you must definitely do that if you don't have the time,
but if you do have that time and willingness to work on this, then
that'd be awesome too.

Thanks,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

