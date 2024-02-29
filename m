Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E1E86CC33
	for <lists+nbd@lfdr.de>; Thu, 29 Feb 2024 15:57:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8FE6320787; Thu, 29 Feb 2024 14:57:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 29 14:57:25 2024
Old-Return-Path: <BATV+ba4d12e182ac9dd248a8+7494+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7C8902066C
	for <lists-other-nbd@bendel.debian.org>; Thu, 29 Feb 2024 14:39:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.161 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id x5yaObSHewSn for <lists-other-nbd@bendel.debian.org>;
	Thu, 29 Feb 2024 14:39:18 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 265B720673
	for <nbd@other.debian.org>; Thu, 29 Feb 2024 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=perIjoAUmYxlUdQxqsH8WVRP7++pJ2+r5osSF6CEQdg=; b=STH2NU4kBLeADWRl1a5Bd7hccK
	LR6xCMygraUcWNgz/ymlvwvFz4hdK1Z2oX3S3pJeEtUdg28lfoOyw7kqx2a7eih+oRH5p2HVNgjNa
	g+yfI3M5vDrhOh8sFnZMM9UPjjj20UbUy6RCJfv6aJ9A8V7Ml1dmTF+gZxDX6AR4rkjEbEHGXgjEB
	JFRfgRnqYjZRDRLRAOmtRRtiJ9EQ0faKIWjHCx6caSzCMDzWQwnwVVFGDEFSExZdz9nRgOI128ceR
	DxIGsGGVti81VCxFl/5BMWQRIW1TDFdtwST5mukZPl7ocpzUELZjeR8OIT/JbGdoMabmbQ8rEKSDt
	hNo+UQaw==;
Received: from [216.9.110.7] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhYx-0000000DtkS-2wLL;
	Thu, 29 Feb 2024 14:39:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: atomic queue limits updates for nbd
Date: Thu, 29 Feb 2024 06:38:43 -0800
Message-Id: <20240229143846.1047223-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <viqJ2f5AFIN.A.UeE.VtJ4lB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2775
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240229143846.1047223-1-hch@lst.de
Resent-Date: Thu, 29 Feb 2024 14:57:25 +0000 (UTC)

Hi Josef, hi Jens,

this series converts nbd to the atomic queue limits API.

It makes nbd/001 a lot more likely to fail due to widening an existing
race window.  I've send a blktests patch titled "nbd/001: wait for the
device node to show up before running parted" a short while ago to fix
the race in the test case.

