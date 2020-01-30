Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2463F14D844
	for <lists+nbd@lfdr.de>; Thu, 30 Jan 2020 10:32:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 09A6920433; Thu, 30 Jan 2020 09:32:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jan 30 09:32:55 2020
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=4.0 tests=GMAIL,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EE7BE20408
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 Jan 2020 09:32:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, GMAIL=1, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VV1kaPVSw5kS for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 Jan 2020 09:32:43 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from latin.grep.be (latin.grep.be [IPv6:2a01:4f8:140:52e5::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E649220425
	for <nbd@other.debian.org>; Thu, 30 Jan 2020 09:32:43 +0000 (UTC)
Received: from [105.187.34.86] (helo=gangtai.home.grep.be)
	by latin.grep.be with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <w@uter.be>)
	id 1ix6Bk-0004om-Tp; Thu, 30 Jan 2020 10:32:41 +0100
Received: from wouter by gangtai.home.grep.be with local (Exim 4.93-RC4)
	(envelope-from <w@uter.be>)
	id 1ix6BX-00031Q-G7; Thu, 30 Jan 2020 11:32:27 +0200
Date: Thu, 30 Jan 2020 11:32:27 +0200
From: Wouter Verhelst <w@uter.be>
To: Vladimir Jelezarov <jelezarov.vladimir@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH] More debugging info when failing to open multiple files
Message-ID: <20200130093227.GC25550@grep.be>
References: <8ceb098b-7a80-03be-64cf-7d8def8f6907@gmail.com>
 <15aaa900-b5ac-f865-c8b5-e66fa078e1e2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15aaa900-b5ac-f865-c8b5-e66fa078e1e2@gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <p6p7QPNpb3I.A.r-C.HLqMeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/783
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200130093227.GC25550@grep.be
Resent-Date: Thu, 30 Jan 2020 09:32:56 +0000 (UTC)

Hi Vladimir,

Can you please send that as a unified diff?

"diff -u" produces that (or "git diff"). This makes it easier to review the patch.

Thanks,

On Sun, Jan 05, 2020 at 02:36:24PM +0100, Vladimir Jelezarov wrote:
> Hi all,
> 
> 
> When nbd-server with the "multifile = true" option is fed with more files than
> the current system's limit, it silently opens files up to the limit and then
> proceeds with no error message thrown, even in debugging mode "-d". As a
> result, not the entire expected file size shows in /dev/nbdX, which can be
> confusing.
> 
> I propose adding at least an "err_nonfatal" warning when in debug mode.
> 
> 
> 1885,1886c1885,1888
> <                 if(multifile && i>0)
> <                     break;
> ---
> >                 if(multifile && i>0) {
>                      err_nonfatal(strerror(errno));
>                      break;
> >                 }
> 
> 
> 
> Greetings
> 
> Vladimir
> 
> 
> 
> 
> 
> -------- Forwarded Message --------
> Subject: Is there a limit on the count of the exported devices?
>    Date: Sat, 4 Jan 2020 21:20:40 +0100
>    From: Vladimir Zhelezarov <jelezarov.vladimir@gmail.com>
>      To: nbd@other.debian.org
> 
> 
> 
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
> 
> 
> Vladimir
> 

> 1885,1886c1885,1888
> < 				if(multifile && i>0)
> < 					break;
> ---
> > 				if(multifile && i>0) {
>  					err_nonfatal(strerror(errno));
>  					break;
> > 				}


-- 
To the thief who stole my anti-depressants: I hope you're happy

  -- seen somewhere on the Internet on a photo of a billboard

