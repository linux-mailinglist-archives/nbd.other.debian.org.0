Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB00452EB1
	for <lists+nbd@lfdr.de>; Tue, 16 Nov 2021 11:09:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7D3572035A; Tue, 16 Nov 2021 10:09:52 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 16 10:09:52 2021
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D88FC2030A
	for <lists-other-nbd@bendel.debian.org>; Tue, 16 Nov 2021 10:09:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lTRHWkT5vMMP for <lists-other-nbd@bendel.debian.org>;
	Tue, 16 Nov 2021 10:09:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A861D201EC
	for <nbd@other.debian.org>; Tue, 16 Nov 2021 10:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WxIBobJjssTxln0VphfBdGyQr4kVcHUKjCfTYdlbnMY=; b=nlWoyWF+oTY1P/605VVmbwaZC7
	ZSN8CZKYUL24bbW8iN2Gk1dTPM96EvoPg3/fujqwTnJZ+RPFdSSxjtpuGluS2uIlu6imUzEofNA3R
	MORQ359tbeIBqKTVej6iGhXANh8PvJrC6B12xBqXlEMrceTLoI7eW98t5bi7qR5CMLH1nmRJxRT7a
	BlRyOQVtaqBrWsi7HYr82ELzTNjPJQa/Uh0UJsjtTxWwbQwDi1I2qBNxcFJhY3IDeY94DutqhW1j7
	nKtLWnXEMk8zBiaVMPCekUhX3Os3uen6H+fuzCWkWC3sGgjr0CKsygvcUKICwdXbCiTMJ41Sl5G8z
	SEBs9f4g==;
Received: from [209.203.16.11] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1mmvPF-00ELWW-1L
	for nbd@other.debian.org; Tue, 16 Nov 2021 11:09:37 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1mmvP6-000E77-MM
	for nbd@other.debian.org;
	Tue, 16 Nov 2021 12:09:28 +0200
Date: Tue, 16 Nov 2021 12:09:28 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: NBD 3.23
Message-ID: <YZODWCQS+9+JiVpi@pc181009.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <MshLcNJJjcC.A.WYB.wN4khB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1613
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YZODWCQS+9+JiVpi@pc181009.grep.be
Resent-Date: Tue, 16 Nov 2021 10:09:52 +0000 (UTC)

Hi,

There was a small but crucial bug in NBD 3.22, which meant that the
client would only connect to localhost (🤦). I've uploaded a new version
of NBD to the usual spot to fix that issue.

If anyone can come up with a good way to test that nbd-client actually
connects to a host that is *not* localhost which we can add to the test
suite, that'd be nice :) otherwise, I'll try to remember to test this
manually from now on.

Thanks,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

