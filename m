Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CF28E405F15
	for <lists+nbd@lfdr.de>; Thu,  9 Sep 2021 23:52:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A9A44206EC; Thu,  9 Sep 2021 21:52:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Sep  9 21:52:06 2021
Old-Return-Path: <josh@joshtriplett.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D2C8B206E6
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Sep 2021 21:51:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.778 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gVyu-BRf41jk for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Sep 2021 21:51:51 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id DAEE5206A8
	for <nbd@other.debian.org>; Thu,  9 Sep 2021 21:51:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id D330F5C00BA;
	Thu,  9 Sep 2021 17:51:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 09 Sep 2021 17:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=fm1; bh=8W0
	4FtwcTHl64a71SfZ3bsHGoLC2nrHY1tu9T8gUBqU=; b=MKOHu3r0r+qTnHb1R0S
	4JWTLTV/GU/RA4D+TKYQN9ox1MzI75NTqm+f19u6cnXLycT34BiONvKCmp4mZOwh
	Cd+G8e5aAT+ZHoMeVKoWauEOR1j9SElrRv3HMHQwx7RoEyzjBQSPxaOJjOSNFt10
	QoVT5RzHZU1vzNE8l1CeEEfiFT+iEPAe/Rm/P8qZfy9IiwZK0w3bhQ+H7kbSY9Q+
	U+IpYqc9txW8tBZJgY+3ysVB7ghO/R6zDQPw4ECPa/eN4xiLQ/fVXSwUVcrdeUUT
	7FxNHCbXTIYJmxxtmn2bSY7M2dK+EtUjaiQ+NX/3SBAog7V+wdoNXcd6KqYUhR2I
	3nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8W04Ft
	wcTHl64a71SfZ3bsHGoLC2nrHY1tu9T8gUBqU=; b=o6v3Kc5wnlXEkHY/p7Bank
	90Y8jv+/+XoNOtwlQ4+T/Usjb/Gj8f5vFYLk8aM2mjRZzhDaP23MDdCNCQtEQl48
	4w4UOTrEdlqN2WmfUeL5HgdMk/x9pDJd+dYwaS/RTMnY3zW8IrL1K4ziFVZ/YjwY
	FLo7nF/7OLtHT0zMw5C9E9sBVokDZ4rjfA74bVgTWiNuavAuEleztKWrS7Q8DxzS
	OHQoLqQZx1L+4Cl9AEum+kX7c788oy96s1gmW7GMAw6fBf8HHpYZaEC4tKcqctaO
	G3wUlQpJQvxopWOxm26axKGZJ7bS6oYWPdYtSMJoo8A2OKT55F+N8hrk4sQ86QRQ
	==
X-ME-Sender: <xms:84E6YTo6v65gYdF7PSIqQblKjdNGTZjf9wzxkjaaWQDh4uZBU50M0w>
    <xme:84E6YdoCKneeu1sj9j6ESwZMvZZM8ppDU_E7r4lLSX95aOdLSTZLnKRnpEP6_7zsi
    vtCWxFiLNStGZfLWqw>
X-ME-Received: <xmr:84E6YQNryx9jLrIemgwWV_zrOglw_T1vAGgaQygdpp-siZuFKnvVC4JDM_M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegtddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeflohhshhcu
    vfhrihhplhgvthhtuceojhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgedtgfefgefhveeglefgfeeigeduueehkeektdeuueetgfehffev
    geeuieetheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhoshhhsehjohhshhhtrhhiphhlvghtthdrohhrgh
X-ME-Proxy: <xmx:84E6YW6uaNG_N9Jcf3L7SvvcBvyPrMNkU9pubzUV92_SsLRwudET5w>
    <xmx:84E6YS7d9KMdxMozcc-qG6jxsLgQE5iaKcIe0eih3y2xXa8yid3HSA>
    <xmx:84E6YegcSBlwTr3kyPOOmUJNfoUF9_rY5wtP40xBglAY7-XMN9n1Sg>
    <xmx:84E6YYTZEaYfEKeEDZTq0ByYKqnxBc0eXyRIHHXd-KEyqBZev2mJgw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Sep 2021 17:51:46 -0400 (EDT)
Date: Thu, 9 Sep 2021 14:51:45 -0700
From: Josh Triplett <josh@joshtriplett.org>
To: Wouter Verhelst <w@uter.be>
Cc: Eric Blake <eblake@redhat.com>, nbd@other.debian.org
Subject: Re: Linux kernel NBD driver support for structured replies?
Message-ID: <YTqB8SBd5VautXk3@localhost>
References: <YTfXZDs4YHrxHYJe@localhost>
 <20210907213513.aq5qxd3d6v3ss676@redhat.com>
 <YTirZ88kN13gqqfp@pc181009.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTirZ88kN13gqqfp@pc181009.grep.be>
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AbQDG3J5NlD.A.UyB.GIoOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1432
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTqB8SBd5VautXk3@localhost
Resent-Date: Thu,  9 Sep 2021 21:52:06 +0000 (UTC)

On Wed, Sep 08, 2021 at 02:24:07PM +0200, Wouter Verhelst wrote:
> It's been on my low-priority TODO list since essentially when we
> hammered down the spec, and even had a half-baked preliminary patch at
> one point, but other things just keep being more urgent than that. I
> won't complain if you implement it instead of me :)

:)

> Some thoughts you'll want to consider:
> 
> The kernel doesn't do the negotiation phase, only the transmission
> phase; the negotiation phase is done in user space. This means the
> client needs to figure out whether the currently-running kernel even
> supports structured replies before it can negotiate them (otherwise the
> kernel will be horribly confused). My half-baked patch would create a
> driver sysfs attribute called "features" which just shows
> "structured_replies" if they are supported by this kernel (the idea
> being that the file could be extended in the future to also show
> "metadata" if that ends up being supported, etc).

There's precedent for something similar: /sys/fs/ext4/features/ , a
directory with a file for each supported ext4 feature. I think a
comparable approach for nbd would be more convenient than doing text
parsing, and more consistent with the general sysfs philosophy (one file
per value).

- Josh Triplett

