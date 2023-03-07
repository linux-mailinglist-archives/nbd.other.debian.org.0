Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7D86AE911
	for <lists+nbd@lfdr.de>; Tue,  7 Mar 2023 18:20:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E1FAC20481; Tue,  7 Mar 2023 17:20:46 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar  7 17:20:46 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 504DC20474
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Mar 2023 17:20:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id l3G8mJSEhfLK for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Mar 2023 17:20:28 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 651E82047D
	for <nbd@other.debian.org>; Tue,  7 Mar 2023 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TH4U0L8wdIhZLVKbioXg/GXiCk0MB0C9a9/otyjRzT0=; b=RKTSuUHDAnwLTJ1UjsCBIgE1Fv
	tdeaLxtSk0AZPlpOjsm+sjZt2D9p9xj18w4+fhB+4WsJDMHQQfy1Bvov/z8hICkFzpqpfdHaHf29G
	F4xu/BabQrHPJvxoCFlnDJDKvNShMbPvrzSdhaiFJ93v9s5RCZr857oKFsbeJzo2DOxidtf/Tre73
	cYjrEAsoVBctT9IapJWu6Rv5e1f+NFlchwUFuDpwHA26AcESDIVGjaYMz6AfapCD1N5bgTqNx8fTP
	a/OUyaKBm7PgQHUBT54IDekauInMKwyaE6w6gicYm1wIBfGJ2EP9aHAeKkpBF7kACNGQ/0cdDyBeh
	nTQ2XFOQ==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pZazB-00CBOA-9o
	for nbd@other.debian.org; Tue, 07 Mar 2023 18:20:25 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pZaz2-0018hQ-2Z
	for nbd@other.debian.org;
	Tue, 07 Mar 2023 19:20:16 +0200
Date: Tue, 7 Mar 2023 19:20:16 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: Structured replies in nbd-server
Message-ID: <ZAdyUMh80sxzluyX@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Ai4fPqWMdNB.A.4IG.uJ3BkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2357
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZAdyUMh80sxzluyX@pc220518.home.grep.be
Resent-Date: Tue,  7 Mar 2023 17:20:46 +0000 (UTC)

Hi,

I've finally been working on structured replies in nbd-server (what?
it's only been 7 years), and today I managed to make it go through
nbdkit's "nbddump" without crashing. (yay!)

I'm currently not (yet) implementing any other features that depend on
structured replies, but would like to see if people can poke holes in
what I've done so far -- I'd like to find bugs before release, rather
than after ;-)

The code is in the "structured" branch of
https://github.com/NetworkBlockDevice/nbd and feedback is more than
welcome.

Thanks in advance,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

