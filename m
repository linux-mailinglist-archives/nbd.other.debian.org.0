Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 553EA6B5C32
	for <lists+nbd@lfdr.de>; Sat, 11 Mar 2023 14:22:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 14E2F2062C; Sat, 11 Mar 2023 13:22:31 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 11 13:22:31 2023
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_FINANCE10 autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8439C2062A
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 Mar 2023 13:22:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.7 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	MURPHY_FINANCE10=0.5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bN02c7aVvE_z for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 Mar 2023 13:22:13 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 83EA620627
	for <nbd@other.debian.org>; Sat, 11 Mar 2023 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IdBdhMyytPprLhvmwH0QAEbMk/enH69jbhBiFJLO9mk=; b=XTiCvEZdkANORiKCfWUpe73rsn
	gw7fYcWdv8IxzjFo+s37bK3h7TOvhlg42S+W6B73XyRzi6pj4mEC+Y3tjxlp7hRUXDP8UuZeGTir/
	Pm9EWNd0iOMJPoMqucVY8S1gUsZdmJx7HCyWnbmQ7V2jAbtLyFujhJjIKcA7TcKf3AzO/V7304DSS
	/ytaQ3DISxrSh2qu+LLmgumwHcPwqfGdPDIaJYdpbQtRzLHJJDqXu3Yl54T1MD4bq3Wk+U7WvDYN4
	hIstpsdkkDzCAeHR9ahahfc6FXFAEMRe44sxs47LT2n9NzIAVzxA3IcxUkfO+9SV9qEVWSSojBa+J
	CTBJG3Iw==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1pazAk-005byT-D3; Sat, 11 Mar 2023 14:22:06 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <w@uter.be>)
	id 1pazAd-0014wX-0u;
	Sat, 11 Mar 2023 15:21:59 +0200
Date: Sat, 11 Mar 2023 15:21:59 +0200
From: Wouter Verhelst <w@uter.be>
To: Ming Lei <ming.lei@redhat.com>
Cc: io-uring@vger.kernel.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org
Subject: Re: ublk-nbd: ublk-nbd is avaialbe
Message-ID: <ZAyAdwWdw0I034IZ@pc220518.home.grep.be>
References: <Y8lSYBU9q5fjs7jS@T590>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8lSYBU9q5fjs7jS@T590>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <truEyhe5exN.A.tAC.XCIDkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2381
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZAyAdwWdw0I034IZ@pc220518.home.grep.be
Resent-Date: Sat, 11 Mar 2023 13:22:31 +0000 (UTC)

Hi,

On Thu, Jan 19, 2023 at 10:23:28PM +0800, Ming Lei wrote:
> The handshake implementation is borrowed from nbd project[2], so
> basically ublk-nbd just adds new code for implementing transmission
> phase, and it can be thought as moving linux block nbd driver into
> userspace.
[...]
> Any comments are welcome!

I see you copied nbd-client.c and modified it, but removed all the
author information from it (including mine).

Please don't do that. nbd-client is not public domain, it is GPLv2,
which means you need to keep copyright statements around somewhere. You
can move them into an AUTHORS file or some such if you prefer, but you
can't just remove them blindly.

Thanks.

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

