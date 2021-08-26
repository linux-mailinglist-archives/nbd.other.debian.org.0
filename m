Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2783F906B
	for <lists+nbd@lfdr.de>; Fri, 27 Aug 2021 00:12:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AB69520A42; Thu, 26 Aug 2021 22:12:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 26 22:12:13 2021
Old-Return-Path: <mcgrof@infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7AC3D20A01
	for <lists-other-nbd@bendel.debian.org>; Thu, 26 Aug 2021 21:56:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.03 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ZdNDxR5mGRxb for <lists-other-nbd@bendel.debian.org>;
	Thu, 26 Aug 2021 21:55:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 554D320908
	for <nbd@other.debian.org>; Thu, 26 Aug 2021 21:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3m9FkekTGzH6SzstjsfakHMzijJ/n/Zv865R1c9rFLw=; b=uozn2UJDv96LZ72yucxcboA3Gc
	k0gB5BsTc8qD9fAGyeCUIo83PVMT9yc2+DzwpExrd9FwL0e2tupA6Jh6LmbWuwpa03roojPYw+108
	Oa1q92j1lor1tlDDfOt4WPl+9xpYGZnh/5pj/8z9Dmr2dBuRFt1f6OWkDAPFFnSIYl3Kfp2I5PUUg
	/WI3C7WqwOSDjeaNSACRiw1dh2r3Q51qLXz+5j+FN4bMCX6gZgczhgxpHrbILR7oAdKuKAKKjpk8g
	Z+/zqp0hqDdVYRPasQGbujOc4vmqzXeid8fPAI2EmZv/+/NsYKtRcxPAvGTtsKnQBWWt7pspycr6b
	r0isYAJg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJNLj-00AylC-QD; Thu, 26 Aug 2021 21:55:51 +0000
Date: Thu, 26 Aug 2021 14:55:51 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: nbd@other.debian.org
Cc: mcgrof@kernel.org
Subject: Re: [PATCH] configure.ac: fix complaint by automake of missing
 AC_PROG_YACC
Message-ID: <YSgN5+r8WHufhUOR@bombadil.infradead.org>
References: <20210826193727.2578866-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826193727.2578866-1-mcgrof@kernel.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DNpHrgOZP_L.A.Q1.9GBKhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1344
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSgN5+r8WHufhUOR@bombadil.infradead.org
Resent-Date: Thu, 26 Aug 2021 22:12:13 +0000 (UTC)

On Thu, Aug 26, 2021 at 12:37:27PM -0700, Luis Chamberlain wrote:
> If automake sees you have a Yacc source but YACC is undefined
> it will complain.
> 
> Makefile.am: error: Yacc source seen but 'YACC' is undefined
> Makefile.am:   The usual way to define 'YACC' is to add 'AC_PROG_YACC'
> Makefile.am:   to 'configure.ac' and run 'autoconf' again.
> autoreconf: automake failed with exit status:
> 
> The recommended way to resolve this is to use AC_PROG_YACC on configure.ac,
> but that is only if we care for yacc. Since we clearly are not fans of
> it and seem to prefer bison, add the missing m4 helper which defines
> AX_PROG_BISON().
> 
> I've taken this from the mesa project [0].
> 
> [0] https://gitlab.collabora.com/spurv/mesa/-/blob/collabora_master/m4/ax_prog_bison.m4
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

So even with this, then I run into a compile issue:

make  all-recursive
make[1]: Entering directory '/data/nbd'
Making all in .
make[2]: Entering directory '/data/nbd'
  YACC     nbdtab_parser.c
  updating nbdtab_parser.tab.c
    CC       nbdtab_parser.lo
    gcc: error: nbdtab_parser.c: No such file or directory
    gcc: fatal error: no input files
    compilation terminated.
    make[2]: *** [Makefile:726: nbdtab_parser.lo] Error 1
    make[2]: Leaving directory '/data/nbd'
    make[1]: *** [Makefile:860: all-recursive] Error 1
    make[1]: Leaving directory '/data/nbd'
    make: *** [Makefile:499: all] Error 2

It would be nice if you could run compile tests of nbd against
a few distributions as part of a ci stuff.

  Luis

