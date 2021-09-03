Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B0D3FFDCF
	for <lists+nbd@lfdr.de>; Fri,  3 Sep 2021 12:04:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9D88C20ADA; Fri,  3 Sep 2021 10:04:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Sep  3 10:04:35 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8 autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 162CB20AD7
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Sep 2021 10:04:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NjdjYoF_nMWj for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Sep 2021 10:04:22 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8BE5320AD4
	for <nbd@other.debian.org>; Fri,  3 Sep 2021 10:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UUY1CtsVhTlKwnVwOFG6/LtE1tFfGKjzzmhax5RAfSI=; b=Y82ajtSpPk6k//9AbRJ7w9pJBl
	hBniZEzldwOQ2qr3VNIUaKNh7iYtYVg8UFqeYd3DhKE6qQINUOdn0TFMTvOXsAS3zf6b4ivL54HZ4
	TAUBLf2ahkl9xUrqJ5Wkf89AwF6/MJ27IxT70L+jbHzlxdAOlGjoPqtVdMIFP9Rp9JnakP4XaOQwf
	IQFG5cM0Y+nwc6u/Wh18PEefwioTuxVxsF8DvPPIzsJx4FygrE0bAZ24/xbyYKHw6rL2Gs8eaWN7S
	MpGltmlTgPGW7wHXWk9euhtAPumyq/LnTJlKKrotOM7RywJFfuLecFbCzaQxvvXoSqcCQVTXpfByE
	HrC15EjQ==;
Received: from [102.39.40.13] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mM63X-007TvG-K2; Fri, 03 Sep 2021 12:04:19 +0200
Received: from wouter by pc181009 with local (Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mM63O-0001re-Bj; Fri, 03 Sep 2021 12:04:10 +0200
Date: Fri, 3 Sep 2021 12:04:10 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH] maint: Nicer warning if autoconf-archive not available
Message-ID: <YTHzGiXennqn+nDc@pc181009.grep.be>
References: <20210902181743.935724-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902181743.935724-1-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3bFcqyQuHaD.A.sLG.zMfMhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1367
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTHzGiXennqn+nDc@pc181009.grep.be
Resent-Date: Fri,  3 Sep 2021 10:04:35 +0000 (UTC)

Hi Eric,

On Thu, Sep 02, 2021 at 01:17:43PM -0500, Eric Blake wrote:
> Prior to this patch, failure to install autoconf-archives prior to
> running 'autoreconf' produces the confusing:
> 
> Makefile.am: error: Yacc source seen but 'YACC' is undefined
> Makefile.am:   The usual way to define 'YACC' is to add 'AC_PROG_YACC'
> Makefile.am:   to 'configure.ac' and run 'autoconf' again.
> 
> With this change, the error changes to:
> 
> configure.ac:117: error: possibly undefined macro: AX_PROG_BISON
>       If this token and others are legitimate, please use m4_pattern_allow.
>       See the Autoconf documentation.
> 
> which is still not a direct finger pointing to missing
> autoconf-archives, but at least provides more relevant hits in a
> google search for how to resolve it (compared to recommended remedies
> for the first message).

I've used

m4_ifdef([AX_CXX_COMPILE_STDCXX_11],,
 [m4_fatal([The m4 macro AX_CXX_COMPILE_STDCXX_11 has not been defined. Please install the autoconf-archive package.])])

in a different project, which produces a more helpful error message that
does point directly to the missing package and the correct solution.

I just committed something similar here (with AX_PROG_BISON rather than
AX_CXX_COMPILER_STDCXX_11, obviously):

wouter@pc181009:~/nbd$ autoreconf -f -i
configure.ac:114: error: The m4 macro AX_PROG_BISON has not been defined. Please install the autoconf-archive package.
configure.ac:114: the top level
autom4te: /usr/bin/m4 failed with exit status: 1
aclocal: error: /usr/bin/autom4te failed with exit status: 1
autoreconf: aclocal failed with exit status: 1
wouter@pc181009:~/nbd$ sudo apt install autoconf-archive
[...]
wouter@pc181009:~/nbd$ autoreconf -f -i
configure.ac:114: error: The m4 macro AX_PROG_BISON has not been defined. Please install the autoconf-archive package.
configure.ac:114: the top level
autom4te: /usr/bin/m4 failed with exit status: 1
aclocal: error: /usr/bin/autom4te failed with exit status: 1
autoreconf: aclocal failed with exit status: 1

I suppose I should've done that in the first place...

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

