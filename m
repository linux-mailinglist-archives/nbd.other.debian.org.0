Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNeHOsfO12mrTAgAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Thu, 09 Apr 2026 18:07:35 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0073CD657
	for <lists+nbd@lfdr.de>; Thu, 09 Apr 2026 18:07:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1EA4720638; Thu,  9 Apr 2026 16:07:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Apr  9 16:07:35 2026
Old-Return-Path: <w@uter.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,SUBJ_ALL_CAPS
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D57172062C
	for <lists-other-nbd@bendel.debian.org>; Thu,  9 Apr 2026 16:07:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.2 tagged_above=-10000 required=5.3
	tests=[BAYES_05=-1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5,
	SUBJ_ALL_CAPS=0.5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id uZCM3sW5j8bL for <lists-other-nbd@bendel.debian.org>;
	Thu,  9 Apr 2026 16:07:22 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 202E32062E
	for <nbd@other.debian.org>; Thu,  9 Apr 2026 16:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ygq7WlkkOye1xQMvai0W8Df3WB2U8JJyU77mTmUpSho=; b=T1ZLcksLrleDYN/LgwGNmC7NPy
	whI3r6U7VjIg4bXd0SI1673FyP001Gu+ODmg9b8vClJpLvf9Zpb3ZyMzyQD1yfLtBobdHnWIOPEFA
	THDHNBLyd4HJAfr2Xr0A8YPL/fKpiUvoXVJjO4IZPfEmAcVa8K2IrCl+nE0+xvG0pAzmdV1SGxlWM
	ergFGjHfP0KXpPed5nAwU8LSq9XaigbjPHJGPk0muoOQuSDR+me0fN1cG3vU0y5MDOGK82Cz+uu+P
	ETN/lCjncpoXeJgJTH9lzEpbI9nsjrRKqFanCq9FzUfCHgqcVqk21JYe8xjlVW0+zQsP+m/ZwQrSt
	rWr3TqiQ==;
Received: from [102.220.209.238] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <w@uter.be>)
	id 1wAruZ-0000000BLCt-2i27
	for nbd@other.debian.org;
	Thu, 09 Apr 2026 18:07:19 +0200
Received: from wouter by pc220518 with local (Exim 4.99.1)
	(envelope-from <w@uter.be>)
	id 1wAruQ-0000000EYrk-2nE7
	for nbd@other.debian.org;
	Thu, 09 Apr 2026 18:07:10 +0200
Date: Thu, 9 Apr 2026 18:07:10 +0200
From: Wouter Verhelst <w@uter.be>
To: nbd@other.debian.org
Subject: NBD 3.27.1
Message-ID: <adfOrjanPHU4Xoiq@pc220518.home.grep.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XqDB8MA5XwI.A.RyYL.H781pB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3533
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/adfOrjanPHU4Xoiq@pc220518.home.grep.be
Resent-Date: Thu,  9 Apr 2026 16:07:35 +0000 (UTC)
X-Spamd-Result: default: False [1.54 / 15.00];
	R_DKIM_REJECT(1.00)[uter.be:s=2021.lounge];
	SUBJ_ALL_CAPS(0.75)[10];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[uter.be : No valid SPF,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nbd@other.debian.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	RCPT_COUNT_ONE(0.00)[1];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	DKIM_TRACE(0.00)[uter.be:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER(0.00)[w@uter.be,bounce-nbd=lists@other.debian.org];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@uter.be,bounce-nbd=lists@other.debian.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.867];
	TAGGED_RCPT(0.00)[nbd];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pc220518.home.grep.be:mid]
X-Rspamd-Queue-Id: 7B0073CD657
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

There was an error in the argument parsing logic of nbd-client, which is
resolved with NBD 3.27.1.

I also added a test to prevent future regressions.

Get it at the usual place.

-- 
"I never had a C in history!"
"Yeah, but there was so much less of it when you were my age!"
 -- Joe Brockmeier recounting a conversation with his father, cfgmgmtcamp 2026, Ghent

