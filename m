Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00F40048A
	for <lists+nbd@lfdr.de>; Fri,  3 Sep 2021 20:09:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9502120BB1; Fri,  3 Sep 2021 18:09:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Sep  3 18:09:09 2021
Old-Return-Path: <mcgrof@infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 33A1620BD1
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Sep 2021 17:51:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.03 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WDefhouVGTpb for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Sep 2021 17:50:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 3F71220BA6
	for <nbd@other.debian.org>; Fri,  3 Sep 2021 17:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8d6TF6gEzt/bLBDBT7/dwKDzpSyi+F3JgqBwYZEf3pI=; b=BzXBp76Q8/+GmKvP5r/qfVcB8/
	253ifDyUtu69SCG7rIfdHwRRn3W9I1rqFf5efUhtvgMIeRoogE8M2w0yqpeWzBYFpMGKloPXFOfIq
	I7id0iSuOSBOOOAnWXPH8AJ1/gaUZxnKfywjamjGqOs7JmUa5zXdUKZXYPYB02/XOf/W+fRFK6Hx7
	p9X7eYsRbUPQmv9miiNvkAdHfXttaO9/ZMYVFFbNvs2JGjeQd/bLEUDiJpmcQjygiSZlm6UkxIRym
	wfNyVZSRH39H/k5kWMMWVkdu0m1eSIyF/k90DQvDQYsJlzhC/vupUdZ/aU6O2rFLCksym1VBhhf88
	ZNB53qyw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMDKv-00CVhx-I6; Fri, 03 Sep 2021 17:50:45 +0000
Date: Fri, 3 Sep 2021 10:50:45 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Wouter Verhelst <w@uter.be>
Cc: Eric Blake <eblake@redhat.com>, nbd@other.debian.org
Subject: Re: [PATCH] maint: Nicer warning if autoconf-archive not available
Message-ID: <YTJgdbdT1RMHh6ED@bombadil.infradead.org>
References: <20210902181743.935724-1-eblake@redhat.com>
 <YTHzGiXennqn+nDc@pc181009.grep.be>
 <YTH0CKuBJJyneQAa@pc181009.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTH0CKuBJJyneQAa@pc181009.grep.be>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <xSCPiWS6znM.A.YNE.FTmMhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1373
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTJgdbdT1RMHh6ED@bombadil.infradead.org
Resent-Date: Fri,  3 Sep 2021 18:09:09 +0000 (UTC)

On Fri, Sep 03, 2021 at 12:08:08PM +0200, Wouter Verhelst wrote:
> Sigh.
> 
> On Fri, Sep 03, 2021 at 12:04:10PM +0200, Wouter Verhelst wrote:
> > I just committed something similar here (with AX_PROG_BISON rather than
> > AX_CXX_COMPILER_STDCXX_11, obviously):
> > 
> > wouter@pc181009:~/nbd$ autoreconf -f -i
> > configure.ac:114: error: The m4 macro AX_PROG_BISON has not been defined. Please install the autoconf-archive package.
> > configure.ac:114: the top level
> > autom4te: /usr/bin/m4 failed with exit status: 1
> > aclocal: error: /usr/bin/autom4te failed with exit status: 1
> > autoreconf: aclocal failed with exit status: 1
> > wouter@pc181009:~/nbd$ sudo apt install autoconf-archive
> > [...]
> > wouter@pc181009:~/nbd$ autoreconf -f -i
> > configure.ac:114: error: The m4 macro AX_PROG_BISON has not been defined. Please install the autoconf-archive package.
> > configure.ac:114: the top level
> > autom4te: /usr/bin/m4 failed with exit status: 1
> > aclocal: error: /usr/bin/autom4te failed with exit status: 1
> > autoreconf: aclocal failed with exit status: 1
> 
> This was obviously a copy/paste error; the second time should have given
> the regular "everything's fine" output from autoreconf.
> 
> Anyway, you get the point ;-)

Thanks for the new warning, its very much welcomed. I had no idea of
such a package. At least for SUSE SLE15-SP2 release there actually
two products which need to be registered to be able to get such package :P

SUSEConnect -p sle-module-desktop-applications/15.3/x86_64                 
SUSEConnect -p sle-module-development-tools/15.3/x86_64

Oy vei.

  Luis

