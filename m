Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C8276BE91
	for <lists+nbd@lfdr.de>; Tue,  1 Aug 2023 22:40:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 15665203DE; Tue,  1 Aug 2023 20:40:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Aug  1 20:40:19 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=4.0 tests=ATTENDEES_DBSPAM_BODY6,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 191CE203D7
	for <lists-other-nbd@bendel.debian.org>; Tue,  1 Aug 2023 20:40:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.09 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY6=1, BAYES_00=-2, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id A87_DW0YPQ0K for <lists-other-nbd@bendel.debian.org>;
	Tue,  1 Aug 2023 20:40:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B168B203D6
	for <nbd@other.debian.org>; Tue,  1 Aug 2023 20:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IVQfRFVPrDQaCvjG+NOGr1moe0GXidlkCMxSo49G4Wc=; b=aEDBNyWnOCXimcJHLz22AWWUrx
	MAlh2ubrLZv1yCM604fUqqG0BVR7DKwXz+9F33DxtPKMjF8ZvL+lzi4mY0gxk+hfuIRuuHsEtTuBz
	nBSvl3BZlDYKlyoXvWzaogWe9si/5I8qCxnPyAy5xNfVjBzqP2PgBphmse6eOtE3fqlZBQHb/9tUu
	lxsoqwifKBnj+Xqtg0cEKkSI0hLPxCbJmSyx4fH95tJ2XhBGQSyAx7Uq+6tcejYVB9GLOPyfc013i
	4Ac+Ww7iagYE71jHUzjh4CngzKckgjy7m0jle7vwdDvIA3qe8rbYfDeOJycjzyDfdHJkOYG8uYagM
	tMojwudg==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1qQw9u-009i58-Q0; Tue, 01 Aug 2023 22:39:58 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1qQw9l-0005uB-2O;
	Tue, 01 Aug 2023 22:39:49 +0200
Date: Tue, 1 Aug 2023 22:39:49 +0200
From: Wouter Verhelst <w@uter.be>
To: Matt Panaro <matt.panaro@gmail.com>
Cc: nbd@other.debian.org
Subject: Re: [PATCH] fix missing -F short-option for certfile [version 2]
Message-ID: <ZMltlQYyv+X+CWYN@pc220518.home.grep.be>
References: <CAAki=DV0ZV1SLr7GcFZ3mv5XHn342Lw+1KQsrfcE7h-Mvbvfyg@mail.gmail.com>
 <ZMkHk3buC5qskubT@pc220518.home.grep.be>
 <CAAki=DVAvo3OxusJDkErPifHwnPOgW=SEj=5zja34Djr9ARajQ@mail.gmail.com>
 <ZMltOf3PhVyI4jhI@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMltOf3PhVyI4jhI@pc220518.home.grep.be>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0f9fkhm3yKL.A.x_G.y2WykB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2589
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZMltlQYyv+X+CWYN@pc220518.home.grep.be
Resent-Date: Tue,  1 Aug 2023 20:40:19 +0000 (UTC)

On Tue, Aug 01, 2023 at 10:38:17PM +0200, Wouter Verhelst wrote:
> The easiest way around this is to use "git send-email", which takes the
> output of "git format-patch" and sends it to the recipient without any
> mangling going on, either through /usr/bin/sendmail, or (if you haven't
> configured that, which is very reasonable in today's world) through a
> direct SMTP connection (with support for pretty much all types of SMTP
> authentication that may be required in today's world).

Oh, and before I forget; since you use gmail:

https://support.google.com/mail/answer/7126229

You can absolutely use IMAP/SMTP to send mails from a gmail account.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

