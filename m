Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D19A04CE9DC
	for <lists+nbd@lfdr.de>; Sun,  6 Mar 2022 08:14:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 680A3202FE; Sun,  6 Mar 2022 07:14:59 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Mar  6 07:14:59 2022
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
	by bendel.debian.org (Postfix) with ESMTP id 22813202C3
	for <lists-other-nbd@bendel.debian.org>; Sun,  6 Mar 2022 07:14:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.21 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id KoCenoaCBfb7 for <lists-other-nbd@bendel.debian.org>;
	Sun,  6 Mar 2022 07:14:45 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C7CE4202C2
	for <nbd@other.debian.org>; Sun,  6 Mar 2022 07:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=JcOOaXQkiWbiDGoTs+IXVsVXG0/H2VyhZEt/zYFwztY=; b=WRo/stqHbT3jK1tHptvQgBqRJv
	TK1WjktAtRhgxIl73/fsljdw6NMzQm3pmmwCB2ds8P7iesMre0fjik+erTMD3MUiicf2neJ1xmgCl
	RqR6ZmRnswf/9mOjyw/FOhjGZwfnnxWhE5ay1v8eWPNDZ/9AAozSptuzTut5n/OHnGrnLwdjigLlQ
	Zgca9hqHAuU0rea2HJixJB8ztmx4zU+uIwW1D+esC+HhveVMcIONav5wb2mBhonh3sUI9eqrPPk80
	nQxmNUyi/EHlRzJVWi7HtC1W+CSRMNFrG9z6SrVQsUmeW2hSdHKlmm0nppRTN2V1CC0XHRPwqAHw8
	GK6cckAQ==;
Received: from [197.245.197.46] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1nQl6I-00HL02-Cg; Sun, 06 Mar 2022 08:14:42 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1nQl68-0001nb-IA;
	Sun, 06 Mar 2022 09:14:32 +0200
Date: Sun, 6 Mar 2022 09:14:32 +0200
From: Wouter Verhelst <w@uter.be>
To: Dialluvioso <dialluvioso@protonmail.com>
Cc: "nbd@other.debian.org" <nbd@other.debian.org>
Subject: Re: [BUG] nbd-server: Remote stack-based buffer overflow
Message-ID: <YiRfWASIIQhyULM2@pc181009.grep.be>
References: <dubhYNvh2heXj7wtg2sSTwouzZOAk4uzHtra2MPWnuH2iSGKLlQphnI-jt-wH-8SKSpo2LOU7H1qz4XfRwOMhamPuYCLBydRuyhdLpL2qfk=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dubhYNvh2heXj7wtg2sSTwouzZOAk4uzHtra2MPWnuH2iSGKLlQphnI-jt-wH-8SKSpo2LOU7H1qz4XfRwOMhamPuYCLBydRuyhdLpL2qfk=@protonmail.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bRiFXq6BDeO.A._mF.z9FJiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1724
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YiRfWASIIQhyULM2@pc181009.grep.be
Resent-Date: Sun,  6 Mar 2022 07:14:59 +0000 (UTC)

Hi,

Thanks; sorry for the delay.

On Sun, Jan 23, 2022 at 02:10:18PM +0000, Dialluvioso wrote:
>    There is a remote exploitable stack-based buffer overflow in line 2299
>    `handle_info` (`nbd-server.c`), fields `len` and `namelen` aren't properly
>    checked therefore `socked_read` will overflow local buffer `buf` (max size
>    1024 bytes).
>    For reproducing the issue, you only need to perform the negotiation of the
>    protocol and send a `NB_OPT_INFO` or `NBD_OPT_GO` request with a malformed
>    `len`.

This is now CVE-2022-26496, and has been fixed on git master (I will
release a new NBD package later today).

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

