Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0176D86F692
	for <lists+nbd@lfdr.de>; Sun,  3 Mar 2024 19:37:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D23EA206D0; Sun,  3 Mar 2024 18:37:49 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Mar  3 18:37:49 2024
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D9210205B8
	for <lists-other-nbd@bendel.debian.org>; Sun,  3 Mar 2024 18:37:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.21 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 8PsV7PG96kIC for <lists-other-nbd@bendel.debian.org>;
	Sun,  3 Mar 2024 18:37:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2391220674
	for <nbd@other.debian.org>; Sun,  3 Mar 2024 18:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0+RxmCayiN+cnBscoLYyMb5zWRNlcL8Q9txHADqyX60=; b=BPhUE5zJ2zshTKIgK37F9hJAXk
	c0dNeC2D2Q5g5VesAYxet2t0IPqkXedfgwZ4z51HOcBAlK447O/ziBB29ts/v+1g1DXlYuzFPtSJd
	5j1eKuIINee6o0LvSb7XXwmWptXMyx3q5nFWiG7IoIdTDwfZ2v9C8cTk7cpeQ5sDHycVP3V3pu3SA
	53wCDVE/1q8OfFVTGab6iTBzNL8Sc+wCtOFRkz8clQHkw+NQSQzT5GHM6krhpj7UdTXvBcSiVVh6X
	/Wfv+IJXSQFoCuHIFOTF0lSZxVPWwuf6JAtgzzyYpGIrz6/FqqFY5rr3vbpd6JEoUU5WcxAwg0cdH
	/d5W8NPg==;
Received: from [102.39.148.255] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1rgqiE-00AhPq-2C
	for nbd@other.debian.org;
	Sun, 03 Mar 2024 19:37:26 +0100
Received: from wouter by pc220518 with local (Exim 4.97)
	(envelope-from <w@uter.be>)
	id 1rgqi6-00000008xrQ-2qHW
	for nbd@other.debian.org;
	Sun, 03 Mar 2024 20:37:18 +0200
Date: Sun, 3 Mar 2024 20:37:18 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: NBD 3.26
Message-ID: <ZeTDXhhbyszsF-4Z@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <1OKRcYNJAnH.A.FYF.9NM5lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2779
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZeTDXhhbyszsF-4Z@pc220518.home.grep.be
Resent-Date: Sun,  3 Mar 2024 18:37:49 +0000 (UTC)

Hi all,

I just released NBD 3.26. This is mostly a bugfix release, with very few
new features. The one new feature is the ability to specify a GnuTLS
priority string in the NBD client (the server already had that
functionality).

Unfortunately, immediately afterwards I noticed that there is a minor
bug in configure.ac which prevents the building of man pages. So there
is now also an NBD 3.26.1. Yes, this is a bit silly :)

At any rate, you can download at
https://github.com/NetworkBlockDevice/nbd/releases/tag/nbd-3.26.1

Kind regards,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

