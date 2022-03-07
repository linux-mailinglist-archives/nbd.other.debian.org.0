Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2000B4CFF58
	for <lists+nbd@lfdr.de>; Mon,  7 Mar 2022 13:59:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EE8362034A; Mon,  7 Mar 2022 12:59:47 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar  7 12:59:47 2022
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
	by bendel.debian.org (Postfix) with ESMTP id CECD0200FE
	for <lists-other-nbd@bendel.debian.org>; Mon,  7 Mar 2022 12:59:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.21 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rtAzzx7t-xST for <lists-other-nbd@bendel.debian.org>;
	Mon,  7 Mar 2022 12:59:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A49E02027D
	for <nbd@other.debian.org>; Mon,  7 Mar 2022 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=eDaitXZ24Ve4bTKaDRlr7O+jDIT/yuAyrdkFnt3Unpg=; b=LwuF6N9WW7PI9SpkmjmKKPsBuw
	m1pdqLP9ePFRAaa1r3vUY3SzwCWvnNTGvZZVmMcxMbXQzafrfgVrVxiVFv4oomTlB/wY0h8URSYuX
	KQVmtF6hEz2GflA2OsfEjNbA+GK1pA29Wb3JR3aUfy2Gogyfh1zmVgMkmxtfeMPv+65jksHIeTnrY
	IeSUTe89AGp7x5XCB4N7xrUfrHYvbVVLzjhW4f9b707cMSQDQaRpqhclG5LSrGZggP1af7T9IxWu3
	xa0ROKNpRv7SDhjoCL+fAIHfRo/ZechaKdVyDvEkNvjC22u9xcbHyZdu8Ijx+dGlC8SWCtFWbpIbk
	pJXm1fwQ==;
Received: from [196.251.239.242] (helo=pc181009)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <w@uter.be>)
	id 1nRCxY-00C4uJ-1h
	for nbd@other.debian.org; Mon, 07 Mar 2022 13:59:32 +0100
Received: from wouter by pc181009 with local (Exim 4.95)
	(envelope-from <w@uter.be>)
	id 1nRCxU-000GWb-FB
	for nbd@other.debian.org;
	Mon, 07 Mar 2022 14:59:28 +0200
Date: Mon, 7 Mar 2022 14:59:28 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: NBD 3.24 released
Message-ID: <YiYBsMY4VjVFVEuT@pc181009.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Dq3yr9Ml6nO.A.nME.DHgJiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1726
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YiYBsMY4VjVFVEuT@pc181009.grep.be
Resent-Date: Mon,  7 Mar 2022 12:59:47 +0000 (UTC)

Hi all,

NBD 3.24 is out.

This is mainly for the two security issues that were found, but there
are a few other fixes and new features as well.

Get it at the usual place:

https://sourceforge.net/projects/nbd/files

Kind regards,

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

