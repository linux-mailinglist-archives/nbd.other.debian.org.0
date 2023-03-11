Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBA76B5C17
	for <lists+nbd@lfdr.de>; Sat, 11 Mar 2023 14:07:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 90C2420633; Sat, 11 Mar 2023 13:07:56 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 11 13:07:56 2023
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8 autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A9C3C205EA
	for <lists-other-nbd@bendel.debian.org>; Sat, 11 Mar 2023 13:07:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.83 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ZdL7QlgSJW58 for <lists-other-nbd@bendel.debian.org>;
	Sat, 11 Mar 2023 13:07:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 347632062C
	for <nbd@other.debian.org>; Sat, 11 Mar 2023 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qyGY9Kgq4SvQmXEd109Qmor156RlTTRE9ZcxxWo2KkM=; b=iY8x7rBtJwcSBmkR7rTUdWATJ5
	tkCKLzorasqwuplkOYMlYvrqpSgckttjPQGI7grx7/w2h7MSVaD16m5BxeOlwo66iLX2NTahbucS9
	ItlTTixKQqvNpFG3+ZeLbmhEQtfcz9Kh7VA0eHqlvj+0txHKfhPAPtvMfqoLI3VVsBSBstxXnJm9Z
	4Sv7Ig8d6aWe3/wfuF/KQUkxP+MCsqqwH6Z3HLf2Rqb1aId6yXOArh2GDckiGC4FKHBqKzSILzJ5P
	yy/WH38EfzW88cPKDmOX829ItBfw6L0yj4za8rLGdbn/L6zk/lURq/nrYvDdWg1lfKsMDD066g/Zy
	qef7t8bQ==;
Received: from [102.39.141.34] (helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <wouter@grep.be>)
	id 1paywZ-005Upw-6t
	for nbd@other.debian.org; Sat, 11 Mar 2023 14:07:27 +0100
Received: from wouter by pc220518 with local (Exim 4.96)
	(envelope-from <wouter@grep.be>)
	id 1paywQ-0014JD-24
	for nbd@other.debian.org;
	Sat, 11 Mar 2023 15:07:18 +0200
From: w@uter.be
To: nbd@other.debian.org
Subject: [PATCH v2] nbd-server: Implement structured replies
Date: Sat, 11 Mar 2023 15:07:01 +0200
Message-Id: <20230311130705.253855-1-w@uter.be>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WEVbXPXMXkC.A.UfH.s0HDkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2378
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230311130705.253855-1-w@uter.be
Resent-Date: Sat, 11 Mar 2023 13:07:56 +0000 (UTC)

This series implements structured replies for nbd-server.

Changes from v1:
- Ensure we write to the transactionlog in the case of structured
  replies, too (had overlooked that, whoops)
- Add missing checks for malloc() failure
- Removal of unnecessary variables (or moved them to a more limited
  scope)
- Wipe the correct value upon STARTTLS
- Consume unused values on error


