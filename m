Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1E73ED9D5
	for <lists+nbd@lfdr.de>; Mon, 16 Aug 2021 17:26:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6893F206BB; Mon, 16 Aug 2021 15:26:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 16 15:26:56 2021
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
	by bendel.debian.org (Postfix) with ESMTP id 42DB9206B9
	for <lists-other-nbd@bendel.debian.org>; Mon, 16 Aug 2021 15:26:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.08 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id V396R4nySHbo for <lists-other-nbd@bendel.debian.org>;
	Mon, 16 Aug 2021 15:26:43 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D2A33206A3
	for <nbd@other.debian.org>; Mon, 16 Aug 2021 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vmThffkGGDgcWcG0Dk35BzlpwCbQj80Wk0DEcCCbVK8=; b=h3dSssa2xKXPzlkXUPxsujpovQ
	xZdcqiP40AquCSI/eUYTz59WMBzqnGOolC/9EAvHoAppQty/bmdfNZpnLp4tUnym+TXUBr4QiEcBv
	iq6sEDb3WCbNdBszNbDtd9/GIN/k6r6XPQWCst2g7ln2dXtsABC1oJ+RGqKnPT0/mJL/BnCdUrDgF
	NiZPhcof8aZoQ9HNHeUgdMPMXrRorUkfI7KO7GXhGzxkFV9VfnmiDmq1jb5D0eVGVKUmJfRQAF3af
	Z3wbdgqxdt/sBQ/XXLVDPVlcWALll2Ib9eJprVvHUQZaf+FHPL8t7MbUaM/VuwKqipoW9R47OMKLD
	WgGD8T0w==;
Received: from [102.39.40.13] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mFeVY-003uLJ-Tc; Mon, 16 Aug 2021 17:26:36 +0200
Received: from wouter by pc181009 with local (Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mFeVM-000K3X-FY; Mon, 16 Aug 2021 17:26:24 +0200
Date: Mon, 16 Aug 2021 17:26:23 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Cc: Pavel Skripkin <paskripkin@gmail.com>, josef@toxicpanda.com,
	axboe@kernel.dk, hch@lst.de, linux-block@vger.kernel.org,
	nbd@other.debian.org, linux-kernel@vger.kernel.org,
	syzbot+9937dc42271cd87d4b98@syzkaller.appspotmail.com
Subject: Re: [PATCH] block: nbd: add sanity check for first_minor
Message-ID: <YRqDn2AVd3ApchWF@pc181009.grep.be>
References: <20210812091501.22648-1-paskripkin@gmail.com>
 <7f9a6877-12d9-0177-d09a-6522e5a557ec@gmail.com>
 <20210812153525.hlged76ivhqtffyg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812153525.hlged76ivhqtffyg@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7O2T0UJ7L7G.A.r8.APoGhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1290
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YRqDn2AVd3ApchWF@pc181009.grep.be
Resent-Date: Mon, 16 Aug 2021 15:26:56 +0000 (UTC)

On Thu, Aug 12, 2021 at 10:35:25AM -0500, Eric Blake wrote:
> On Thu, Aug 12, 2021 at 12:42:38PM +0300, Pavel Skripkin wrote:
> > 
> > Fun thing: I got a reply to this email from
> > nsd-public@police.gov.hk, which is Hong Kong Police office email. Does
> > anyone know what is going on? :) It's a bit scary...
> 
> You are not alone.  Apparently, someone subscribed that address to the
> nbd@other.debian.org list and it is auto-responding to every message
> it receives; hopefully, a list administrator (I am not one) will be
> willing to forcefully unsubscribe that address.

FWIW, this has now happened, so you should no longer see such autoreplies.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

