Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB7A403028
	for <lists+nbd@lfdr.de>; Tue,  7 Sep 2021 23:19:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 293C520906; Tue,  7 Sep 2021 21:19:51 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  7 21:19:51 2021
Old-Return-Path: <josh@joshtriplett.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 545C520901
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Sep 2021 21:19:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id t_45mENgvpw3 for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Sep 2021 21:19:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .joshtriplett. - helo: .out5-smtp.messagingengine. - helo-domain: .messagingengine.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 23821208FA
	for <nbd@other.debian.org>; Tue,  7 Sep 2021 21:19:37 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id ACF385C01AD
	for <nbd@other.debian.org>; Tue,  7 Sep 2021 17:19:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 07 Sep 2021 17:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=date:from:to:subject:message-id:mime-version
	:content-type; s=fm1; bh=A/RyJCMFGqPfbgshmn0NqQ21K47ad8cACNeWofl
	0bRE=; b=G3eSDZTjgEFCnLGXN6uPsXnk1tzduKnjafllxZi7Bz758gRFIrDphjJ
	n1Jr4SBKPdC6PE0D5gXMlSEOYOM7q8YjTLSbJDvzPNLZ28Hd7nhJrw+G40s6pOhP
	qRClKJ8cpVSu6Zmtx7qxMbndDTb5SjymT6fV0SMJKIFit3I+LP2WBeA079FCwlnn
	kEZKvHXhpgq6caeIGrGqkHGUQHaC9VfI+6LRfOvkkl3diIjvm8xM8QiWlJHRst5Y
	rEJFfcP0e4IBkhR8wMYHRJYc+1/kth5HSTKWjKUWaTvu3fHq7ArO/6Zj05tfX/i8
	jWZqo82JlQSdeV1xYCLuvT7hjIfjpfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=A/RyJCMFGqPfbgshmn0NqQ21K47ad
	8cACNeWofl0bRE=; b=ixXFJNr2UGaQbP+pzoUdsLR2Ut0jcfoq/cHyOBZRWoCu3
	BAqxWDNTGN3qr9DnhIJO56DPNGgztaIAC9n7QfSrKe8mmhhCx4yfDvLDa4ITUgIs
	lRfp1+gSQQak6YHS3PzEGsdOtzsFw9OYe9Q9xQHEgybJIlcGnQxpjoRYWfhlbmRC
	ugNqPmPf48Vx/BB2dwrnSEoki565RwrizoGRrr8Q1OfD3Bopie4FIct9sPQlbPfa
	fA8nRdRuXMz7XYAV4xD3nEZ16suYBaOZKEMPcKm3M0i7g9HYYe5G7Kq5otBCm5Za
	uiMwhzBOBw2z6ha9lf2CJ+uZKSBXA6gpojaNxN44g==
X-ME-Sender: <xms:Ztc3YU3kxmdJ43i-Yhe1aObFoCdGQ5MaBriUBi7OG8LjMK9IC7D1Jg>
    <xme:Ztc3YfF-vmXl7EdxAN48PpGKDlXyBA_p5BDNcJEYrRpH6dfC5RhUB_sFyXpT1Q96J
    Ws8S2YBVb65xDqINFY>
X-ME-Received: <xmr:Ztc3Yc7qtHM7R-0LENivdfVOu0P5t8TPfX4qf3xDvJMaVPBiJ0CbVx28U_c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudefhedgudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehttdertd
    dttddvnecuhfhrohhmpeflohhshhcuvfhrihhplhgvthhtuceojhhoshhhsehjohhshhht
    rhhiphhlvghtthdrohhrgheqnecuggftrfgrthhtvghrnhepleelgeegtdejjeefuedvud
    efgefgkedtfeekheevueevvddvhfegfffgvdfgffeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhoshhhsehjohhshhhtrhhiphhlvghtth
    drohhrgh
X-ME-Proxy: <xmx:Ztc3Yd15yC0G2SQpWdF9TQJt6npWI18nGmOZl8MYsSFUwieyHWCiig>
    <xmx:Ztc3YXE12NVM5TGT0sA59s40xYPygDcXJV80SzNVoP3wIhHmW8kskg>
    <xmx:Ztc3YW_jJBCmZI-aLTgKSEfqc4wWYjZycN3aWCwM-7Of1ItHUSuCEw>
    <xmx:Ztc3Yew-_-VtRxwpDkCcYi5AspsMSrdOiki1BOB57mEj5Kkxk2ihKw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <nbd@other.debian.org>; Tue, 7 Sep 2021 17:19:33 -0400 (EDT)
Date: Tue, 7 Sep 2021 14:19:32 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: nbd@other.debian.org
Subject: Linux kernel NBD driver support for structured replies?
Message-ID: <YTfXZDs4YHrxHYJe@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sxOasRf2VyC.A.WfB.3d9NhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1407
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTfXZDs4YHrxHYJe@localhost
Resent-Date: Tue,  7 Sep 2021 21:19:51 +0000 (UTC)

I'm currently using the NBD client driver in the Linux kernel. At some
point, I'd be interested in adding support for structured replies,
specifically so that an NBD server can efficiently handle ranges of
zeroes (e.g.  "for the 4k block you asked for, here are 200 bytes of
data, and the rest if zero").

Does that seem reasonable to add to the kernel driver? I wanted to check
before considering development of a patch.

- Josh Triplett

