Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E13A85BB72
	for <lists+nbd@lfdr.de>; Tue, 20 Feb 2024 13:08:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5D55820B00; Tue, 20 Feb 2024 12:08:50 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb 20 12:08:49 2024
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
	by bendel.debian.org (Postfix) with ESMTP id 5BADE20AF9
	for <lists-other-nbd@bendel.debian.org>; Tue, 20 Feb 2024 12:07:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-8.21 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MD5_SHA1_SUM=-1, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aGPX12lBRHRK for <lists-other-nbd@bendel.debian.org>;
	Tue, 20 Feb 2024 12:06:21 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0257F20AFF
	for <nbd@other.debian.org>; Tue, 20 Feb 2024 12:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QSP0b2X/DZgdZGTiyiYUcm2TrJjgmR75vYdQvidCMTI=; b=Puwgwxh5INMWCPTcmWC6ghk/zG
	5uWS2Ml/IdfW/O7XdIGtNQLzMBaeM8UqJfm6WHfBigE87xC5n/rwF0sIUtc4w7p8fwUSenzOMRqZ3
	KN0VK+soZJ06qFRK/phgxApVZdErwXzfbfLro4aSINNHKhdy8UvpQVKX1nh+z4GMtDAJc3fATd1KB
	m6mhvHfhgnxQdMUugyqYvd8YStX7tlzt6XXIodaQvgVXiYgaLfChrAQBH7q3IAKuKo43f0YsUzIaQ
	rcDZLWZIa5EwcZY3E/CsQ/JB3d3oVNvDUYErSc6BksTwcdVC47rnJXEIBEP9BJVADBzC8gP5CCak9
	WQKZOOeQ==;
Received: from [196.251.239.242] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1rcOt1-00CkoM-2J;
	Tue, 20 Feb 2024 13:06:11 +0100
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1rcOsy-00000000H3B-3Nlg;
	Tue, 20 Feb 2024 14:06:08 +0200
Date: Tue, 20 Feb 2024 14:06:08 +0200
From: Wouter Verhelst <w@uter.be>
To: Lukasz Stelmach <l.stelmach@samsung.com>
Cc: nbd@other.debian.org, Karol Lewandowski <k.lewandowsk@samsung.com>,
	=?utf-8?B?7J6s7ZuIIOyglQ==?= <jh80.chung@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marek Pikula <m.pikula@partner.samsung.com>
Subject: Re: Fixes after static code analysis
Message-ID: <ZdSVsGq3u83Z6w-V@pc220518.home.grep.be>
References: <ZbqcASAmWxQMuM4Q@pc220518.home.grep.be>
 <CGME20240201193107eucas1p2a86669add6be2a4ababb691e3cdceb4f@eucas1p2.samsung.com>
 <oypijdplxgm17d.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <oypijdplxgm17d.fsf%l.stelmach@samsung.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XkdOq5HJzpK.A.OdH.RZJ1lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2752
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZdSVsGq3u83Z6w-V@pc220518.home.grep.be
Resent-Date: Tue, 20 Feb 2024 12:08:50 +0000 (UTC)

Hi Lukasz,

I finally had time to have a look at your patches. Unfortunately, they
break the test suite; if you run "make check", the result is fairly
depressing :)

Can you have a look at what's going wrong?

Note: if you need this the "simple_test" script which sets up nbd-server
and tries to run the tests against it has the ability to set up an
environment for you to run things inside the debugger easily: just run 

bash -x ./simple_test <test name> <any second argument>

and it will invoke that test, leaving the configuration around so you
can then run nbd-server manually (as the script will have just shown
you) and do things inside a debugger.

Thanks,

On Thu, Feb 01, 2024 at 08:30:46PM +0100, Lukasz Stelmach wrote:
> It was <2024-01-31 śro 21:14>, when Wouter Verhelst wrote:
> > On Mon, Jan 22, 2024 at 12:52:23PM +0100, Lukasz Stelmach wrote:
> >> Hi,
> >> 
> >> Last year we decided to include nbd package in Tizen. Every package we
> >> use gets a periodic treatment with static analysis tools (Coverity,
> >> SVACE). There were some problems detected in nbd and we've developed a
> >> number of patches[1] to fix them. Please take a look at them as well as
> >> the eariler patch[1] I posted.
> >> 
> >> [1]
> >> https://git.tizen.org/cgit/platform/upstream/nbd/log/?h=tizen&id=2c54e25b0cea8d30f7958fa2d17c67b91867aff6
> >
> > Is this available in some public repository that I can just pull from? I
> > tried
> > "https://git.tizen.org/platform/upstream/nbd",
> > which seemed the
> > most obvious, but that didn't work.
> 
> That's
> 
>     git fetch https://git.tizen.org/cgit/platform/upstream/nbd 2c54e25b0cea8d30f7958fa2d17c67b91867aff6
> 
> with "/cgit/" between ".org" and "platform".
> 
> >> [2] https://lists.debian.org/nbd/2023/08/msg00046.html
> >
> > I looked at that when you sent it, didn't like it, was going to reply,
> > but then apparently forgot to do that. Sorry about that.
> 
> NP.
> 
> > I didn't like this because there are some autoconf variables that (by
> > default) have other variables in them, in ways that expose them as shell
> > variables; e.g., the default setting for sysconfdir is "${prefix}/etc",
> > which means that if you run "./configure" with no arguments,
> > nbd-server(5) will mention that the configuration file is
> > "${prefix}/etc/nbd-server/config", which I think is a bit ugly.
> 
> It is indeed, but I believe it's not the case.
> 
> > That's why I did it that way.
> >
> > I don't think your version does that? But I could be wrong, of course;
> > in which case, please explain :)
> 
> I wrote the patch some time ago (-; but I believe I haven't seen such
> effect. Let me try. I run:
> 
> git checkout e0a7534c74e7e21fe0be2ad55e4cbe35cef21a07
> ../autogen.sh
> configure
> grep nbd-server/config -- man/nbd-server.5.sgml
> 
>   <!ENTITY dhpackage   "/usr/local/etc/nbd-server/config">
>       <filename>/usr/local/etc/nbd-server/config</filename> is the default
> 
> Next
> 
> make -C man/ nbd-server.5
> grep nbd-server/config -- man/nbd-server.5
> 
> /usr/local/etc/nbd-server/config \- configuration file for nbd-server
> \fB/usr/local/etc/nbd-server/config \fR
> \fI/usr/local/etc/nbd-server/config\fR is the default
> 
> If there are any problems, would you mind, responding to that patch and
> pointing them out? I'd like to fix them.
> 
> PS. I received thee more bug reports to handle. I'll review them when I
> get back from FOSDEM, so you don't need to hurry with these.
> 
> PPS. If you happen to be around, Wouter, and would like to meet, try
> reaching me via Matrix @steelman:matrix.org
> -- 
> Łukasz Stelmach
> Samsung R&D Institute Poland
> Samsung Electronics



-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

