Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1C214D849
	for <lists+nbd@lfdr.de>; Thu, 30 Jan 2020 10:35:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AB8B520425; Thu, 30 Jan 2020 09:35:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 30 09:35:23 2020
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=4.0 tests=LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 82D99203CB
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 Jan 2020 09:35:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, LDO_WHITELIST=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 2GBG6mhiW7Pw for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 Jan 2020 09:35:12 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 90155202A0
	for <nbd@other.debian.org>; Thu, 30 Jan 2020 09:35:12 +0000 (UTC)
Received: from [105.187.34.86] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1ix6E9-00079X-M3; Thu, 30 Jan 2020 10:35:09 +0100
Received: from wouter by gangtai.home.grep.be with local (Exim 4.93-RC4)
	(envelope-from <w@uter.be>)
	id 1ix6E0-0003EO-FE; Thu, 30 Jan 2020 11:35:00 +0200
Date: Thu, 30 Jan 2020 11:35:00 +0200
From: Wouter Verhelst <w@uter.be>
To: Vladimir Zhelezarov <jelezarov.vladimir@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: Is there a limit on the count of the exported devices?
Message-ID: <20200130093500.GD25550@grep.be>
References: <8ceb098b-7a80-03be-64cf-7d8def8f6907@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ceb098b-7a80-03be-64cf-7d8def8f6907@gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9ef2rxq5PUI.A.3bD.bNqMeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/784
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200130093500.GD25550@grep.be
Resent-Date: Thu, 30 Jan 2020 09:35:23 +0000 (UTC)

On Sat, Jan 04, 2020 at 09:20:40PM +0100, Vladimir Zhelezarov wrote:
> Hi,
> 
> independent of the size of the combined block device, I am unable to use more
> than 1018 devices with the "-m" option in nbd-server. So for example:
> 
> 
>     for i in {0..1999}; do truncate -s 1M mm.$i; done
>     sudo nbd-server -C /dev/null localhost@33333 -m /home/user/nbd/mm
>     sudo nbd-client localhost 33333 /dev/nbd0
> 
> 
> Then it says:
> 
>     Negotiation: ..size = 1018MB
>     bs=1024, sz=1067450368 bytes
> 
> which can also be confirmed by mounting /dev/nbd0.
> 
> 
> Another example with 5000 files of 500K gives:
> 
>     Negotiation: ..size = 497MB
>     bs=1024, sz=521216000 bytes
> 
> which gives the same 521216000/1024/500 = 1018 used files.
> 
> 
> The same happens when using different sizes or combinations of sizes and
> file-counts. I am using nbd 3.20 on x64 Ubuntu 18.04. Using a configuration
> file makes no difference. Different hardware with the same OS and nbd version
> neither.
> 
> 
> Can someone give me some pointers?

As you found out in the mean time, nbd-server doesn't impose a limit,
but the OS might.

The limits can be configured on Linux with "sysctl -w
fs.file-max=<number>", where you replace <number> by the number of files
you need (plus a small margin).

Thanks,

-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

