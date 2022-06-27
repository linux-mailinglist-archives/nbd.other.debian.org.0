Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A0F55BA3A
	for <lists+nbd@lfdr.de>; Mon, 27 Jun 2022 16:03:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D6F2920412; Mon, 27 Jun 2022 14:03:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 27 14:03:35 2022
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
	by bendel.debian.org (Postfix) with ESMTP id DB919203EB
	for <lists-other-nbd@bendel.debian.org>; Mon, 27 Jun 2022 14:03:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.21 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JMlbr0fj0Jxz for <lists-other-nbd@bendel.debian.org>;
	Mon, 27 Jun 2022 14:03:23 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 16A0A203E5
	for <nbd@other.debian.org>; Mon, 27 Jun 2022 14:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=c56KvzFpbIZlalGY82aafnF8GUMKP1FCWcGyKPtTz6I=; b=JyKtqIwtrCziHmknyNSOZdxkAG
	J9l6dHXsCJD8WZpVsc7a6ET+FxQACyJu1zfOtX/EXMB1caHFOIUMA6SWqy/C1Qql/Mwk2GfC0EGMj
	+hzc6zmLJSkU1BlOsc6elNFXYsNweUVT0QrTM7UB+JpISp48YjYF57DLxeOjJWSWktRH2M5+VJDt8
	F3XqGENrbdHCMJ2bAARpcoHWR8fxWrDkMkVK0dwh/Lc0hk9w5QxBmSr3tDs7oM/oEAkA2lPwmdMDR
	eUMbB4yxheDEg10afSBhHJqcJHLs74XEvPucCB2kWiRR38HpDEOzYKig0OpKDVpfqDoIfWCvYEA7M
	uTVgqAgw==;
Received: from [102.39.138.29] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1o5pKi-00GR3R-5S; Mon, 27 Jun 2022 16:03:20 +0200
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1o5pKW-0010tb-1q;
	Mon, 27 Jun 2022 16:03:08 +0200
Date: Mon, 27 Jun 2022 16:03:07 +0200
From: Wouter Verhelst <w@uter.be>
To: Rohan Khanna <rohan.khanna@thoughtworks.com>
Cc: nbd@other.debian.org
Subject: Re: Requesting some information regarding building nbd-client for
 macos
Message-ID: <Yrm4m3xVIjGMDSLG@pc220518.home.grep.be>
References: <CAGx2udZv9_umjYk2Ot_QsNAMQ4sY7OJX=sFrTW=1L5kmb6PgHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGx2udZv9_umjYk2Ot_QsNAMQ4sY7OJX=sFrTW=1L5kmb6PgHA@mail.gmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <UbetTkFTCeN.A.-r.3ibuiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2181
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Yrm4m3xVIjGMDSLG@pc220518.home.grep.be
Resent-Date: Mon, 27 Jun 2022 14:03:35 +0000 (UTC)

Hi Rohan,

On Thu, Jun 23, 2022 at 06:40:46PM +0200, Rohan Khanna wrote:
>    Hello
>    I am writing to you requesting for some information as to how may I go
>    about building nbd-client for macos. Anything to point me in the right
>    direction would be greatly appreciated.

It's not that simple.

The Linux nbd-client program doesn't actually speak the NBD protocol; it
does the handshake, and then hands the connected socket to the kernel.
It is then the kernel which implements the NBD protocol, using the
already set up socket from user space.

If you're going to port NBD to macOS (which would be awesome!), you'll
need to do something in kernel space to mirror the Linux nbd.ko module.
To the best of my knowledge, nobody has done the necessary work for now,
so you'll have your work cut out for you.

Should you wish to take on this challenge, note that the NBD protocol
documentation is at
<https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md>.

Kind regards,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

