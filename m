Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B99FE94EEC2
	for <lists+nbd@lfdr.de>; Mon, 12 Aug 2024 15:52:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A49B22057E; Mon, 12 Aug 2024 13:52:30 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 12 13:52:30 2024
Old-Return-Path: <wouter@grep.be>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=4.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,LDOSUBSCRIBER,LDO_WHITELIST,
	T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3E01920564
	for <lists-other-nbd@bendel.debian.org>; Mon, 12 Aug 2024 13:52:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.799 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_INVALID=0.1, DKIM_SIGNED=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.001, LDO_WHITELIST=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wXESQpFQ6h3Q for <lists-other-nbd@bendel.debian.org>;
	Mon, 12 Aug 2024 13:52:14 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from lounge.grep.be (lounge.grep.be [IPv6:2a01:4f8:200:91e8::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6C7CE2053E
	for <nbd@other.debian.org>; Mon, 12 Aug 2024 13:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
	s=2017.latin; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A+4sBfKWeCfbuDkaZhU1Kf4QCY1Wd5VUFDYqssjztWM=; b=D9ZrLrhogWPSlsuueziK3CCG8L
	AskBvCoEspbaccPX9fDLjgjNgpCVk1JKlE3spb7r5yH3QvaxpZOcu6ByVGnzSeiku8U/J6Jo5/1XK
	XB2dBuEgzLtLgMc7wUq+9fVF3EIdqibz2IYzH9aJnP45SRpgTA8mOMuhMbB0Wbr7AzMF3qThNaRvP
	9Jn5xB7lMin6eQLdgzC+YyZf8CSADkL8WlWLkekSn9cUjSM2q8kG3ZvF3Nr47Ph6yuaC/6CxvR+u8
	b38W7bHfjPwEGQUX1WQ+Va8CGJj3X2Mq8TYDr3BffWE4djseVHnT/g+lK0S15onfY/rE7OKB+7fRY
	C633ennw==;
Received: from vc-gp-n-105-245-229-160.umts.vodacom.co.za ([105.245.229.160] helo=pc220518)
	by lounge.grep.be with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <wouter@grep.be>)
	id 1sdVSv-009Xo8-1x;
	Mon, 12 Aug 2024 15:52:05 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <wouter@grep.be>)
	id 1sdV9C-00000000V5W-0Nos;
	Mon, 12 Aug 2024 15:31:42 +0200
From: Wouter Verhelst <w@uter.be>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Wouter Verhelst <w@uter.be>,
	Eric Blake <eblake@redhat.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] nbd: WRITE_ZEROES and a few fixes
Date: Mon, 12 Aug 2024 15:20:35 +0200
Message-ID: <20240812133032.115134-1-w@uter.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jQAjz6mMCxO.A.jFuC.eOhumB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3134
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240812133032.115134-1-w@uter.be
Resent-Date: Mon, 12 Aug 2024 13:52:30 +0000 (UTC)

Implement the WRITE_ZEROES command for the NBD kernel driver. While
here, add NBD_FLAG_ROTATIONAL to the function that decodes our flags for
debugfs.

---
v2: Divide UINT_MAX by blksize for the maximum number of sectors
supported by trim/discard and write_zeroes commands, as NBD uses 32-bit
values for byte lengths, and otherwise that wouldn't fit.
v3: Use the SECTOR_SHIFT value as a right-shift operand, rather than the
blksize value, to get the correct operand.
v4: Fix commit messages to use correct style. Thanks, Jens.
---
 drivers/block/nbd.c      |   12 +++++++++++-
 include/uapi/linux/nbd.h |    5 ++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

