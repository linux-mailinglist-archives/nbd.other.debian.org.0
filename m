Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B20B8447D5
	for <lists+nbd@lfdr.de>; Wed, 31 Jan 2024 20:14:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A96B320763; Wed, 31 Jan 2024 19:14:42 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan 31 19:14:42 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,MD5_SHA1_SUM,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 52D1A20760
	for <lists-other-nbd@bendel.debian.org>; Wed, 31 Jan 2024 19:14:30 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.21 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aZfDhTH1ujaW for <lists-other-nbd@bendel.debian.org>;
	Wed, 31 Jan 2024 19:14:21 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5E89F2074E
	for <nbd@other.debian.org>; Wed, 31 Jan 2024 19:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1JLgTd7EsQq2tOr7Qr3jgKrr+EQOE4Pz5LqwlI0CNYw=; b=P59shnNjHA8o2LHY6/F8TLwGHN
	/yfBEaygAf/szTEIAwCzdLN7iOwDY/SaGtAbtaI+NVg244Y7cdmJW3r93PgWfYIyHh7Jsf85lF4re
	HrHwZDccTuyIFfAspU5+JLSjyR+nONgmC5fZSAZBl99mPVX4iBSe0j5ihg+5R/5XvAb8VJnJsHtEV
	nlj/0DtIAFoli9kVvJpO3FlPQ8k7cSw4vKHi5ycgikiJIQ429PuDJAa05r6LTniCOxLnWbQxHkBZL
	Ofrq5iwbHv1puFlxlOtMqp3+84KCT+rEWm3MdafdoWT3keYh0VUhba8c4Oxbe9tCR9eUOlckl6Sdv
	DmwJhrNQ==;
Received: from [213.172.149.157] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1rVG2M-006nNv-0j;
	Wed, 31 Jan 2024 20:14:18 +0100
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1rVG2D-00000001TNc-15HV;
	Wed, 31 Jan 2024 21:14:09 +0200
Date: Wed, 31 Jan 2024 21:14:09 +0200
From: Wouter Verhelst <w@uter.be>
To: Lukasz Stelmach <l.stelmach@samsung.com>
Cc: nbd@other.debian.org, Karol Lewandowski <k.lewandowsk@samsung.com>,
	=?utf-8?B?7J6s7ZuIIOyglQ==?= <jh80.chung@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marek Pikula <m.pikula@partner.samsung.com>
Subject: Re: Fixes after static code analysis
Message-ID: <ZbqcASAmWxQMuM4Q@pc220518.home.grep.be>
References: <CGME20240122115235eucas1p1f313da18ba39fa558ccc7ff600d8ea73@eucas1p1.samsung.com>
 <oypijdplxttwjs.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <oypijdplxttwjs.fsf%l.stelmach@samsung.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <QGIala7E1wI.A.YjD.iwpulB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2723
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZbqcASAmWxQMuM4Q@pc220518.home.grep.be
Resent-Date: Wed, 31 Jan 2024 19:14:42 +0000 (UTC)

Hi Lukasz,

On Mon, Jan 22, 2024 at 12:52:23PM +0100, Lukasz Stelmach wrote:
> Hi,
> 
> Last year we decided to include nbd package in Tizen. Every package we
> use gets a periodic treatment with static analysis tools (Coverity,
> SVACE). There were some problems detected in nbd and we've developed a
> number of patches[1] to fix them. Please take a look at them as well as
> the eariler patch[1] I posted.
> 
> [1] https://git.tizen.org/cgit/platform/upstream/nbd/log/?h=tizen&id=2c54e25b0cea8d30f7958fa2d17c67b91867aff6

Is this available in some public repository that I can just pull from? I
tried "https://git.tizen.org/platform/upstream/nbd", which seemed the
most obvious, but that didn't work.

> [2] https://lists.debian.org/nbd/2023/08/msg00046.html

I looked at that when you sent it, didn't like it, was going to reply,
but then apparently forgot to do that. Sorry about that.

I didn't like this because there are some autoconf variables that (by
default) have other variables in them, in ways that expose them as shell
variables; e.g., the default setting for sysconfdir is "${prefix}/etc",
which means that if you run "./configure" with no arguments,
nbd-server(5) will mention that the configuration file is
"${prefix}/etc/nbd-server/config", which I think is a bit ugly.

That's why I did it that way.

I don't think your version does that? But I could be wrong, of course;
in which case, please explain :)

Thanks,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

