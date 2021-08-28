Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9F03FA6D7
	for <lists+nbd@lfdr.de>; Sat, 28 Aug 2021 19:13:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4647E205A6; Sat, 28 Aug 2021 17:13:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Aug 28 17:13:31 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 5E70320592
	for <lists-other-nbd@bendel.debian.org>; Sat, 28 Aug 2021 17:13:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id A4HnDj6W9y1L for <lists-other-nbd@bendel.debian.org>;
	Sat, 28 Aug 2021 17:13:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 723D420463
	for <nbd@other.debian.org>; Sat, 28 Aug 2021 17:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=chTaeWunkq1B6o5icDN4xFp/ehVy798aTOygxYjxlpw=; b=S5WQqY2fuCfxwOy5b2oL9+2rip
	pdw9X5qUp7paz5ekKLw/ey0Hoyy5XPgDat3yDje73G0zcinOlNs+iNG5URVN9xKkicJHok3dC8rZN
	zY6SLhT3Gt29PAihTb9d45P9YyzI42qogFASGZN2IKyiz+y8QFZPj41mCLqeqJu9mwQZzCSzjqRos
	c5WW5tWq0tXu9rIfWnmngCs27Ic0XJyy7VnnkR9mIFGgumm3dsTpmNjP/jTOSUApWjwMpfNVYt7Au
	f8TtgkBAejVbcA2++pDRjWj0B2GrhfNiJHnwZ23yTDl5AMIqCaRkNHU9y+H4FlpwwiJ1Avtw8QvgY
	AebmT9Rg==;
Received: from [102.39.40.13] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mK1tL-006ByZ-T2; Sat, 28 Aug 2021 19:13:15 +0200
Received: from wouter by pc181009 with local (Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mK1tD-000GFD-4T; Sat, 28 Aug 2021 19:13:07 +0200
Date: Sat, 28 Aug 2021 19:13:07 +0200
From: Wouter Verhelst <w@uter.be>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: nbd@other.debian.org
Subject: Re: [PATCH] configure.ac: fix complaint by automake of missing
 AC_PROG_YACC
Message-ID: <YSpuo+PUXSb0cOjp@pc181009.grep.be>
References: <20210826193727.2578866-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826193727.2578866-1-mcgrof@kernel.org>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TmHIYkG2nyK.A.PWG.76mKhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1356
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YSpuo+PUXSb0cOjp@pc181009.grep.be
Resent-Date: Sat, 28 Aug 2021 17:13:31 +0000 (UTC)

Hi Luis,

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

We already have that? It assumes you have the "autoconf-archive"
library[1] of m4 macros installed, though.

[1] https://www.gnu.org/software/autoconf-archive/, or as packaged in
most distributions.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

