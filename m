Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A993E9218
	for <lists+nbd@lfdr.de>; Wed, 11 Aug 2021 15:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9F4062029D; Wed, 11 Aug 2021 13:03:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 11 13:03:09 2021
Old-Return-Path: <BATV+fa63ca7dd370ca608068+6562+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 253722030F
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Aug 2021 12:45:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.131 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id oJQsrV6mVIH5 for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Aug 2021 12:45:39 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 552792030C
	for <nbd@other.debian.org>; Wed, 11 Aug 2021 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7exWYwWdX/mv9kmXqGggLCNL3l1kVcMUuVRwKGhNT5E=; b=CnY08ocpUvwr/BCpB5fZPnaLiD
	+GLqcWfqC5YcqvvVjdGi1BXD92OQT4Epi8udeWTOlITReYGt3pmPSfkNJikW/OavRgqKRO8deBGp7
	+ilzX3RLxW/M1un6O1F0p/4vzPw0iZji4Desakjox32ZOnfWYCmtDKWeRQ31hI5Gjmdsi16Sn/L4+
	edugwLDW5SHvw176fG86O/PLFYKYg5OJ7AkoJx/lxJmXN4yNUQk6fJyQtdMr6YpVHL2W2qNBCd37A
	QH5b55oaLaAUQ+x5rJNd2BGDnftcpxwn6VL83H28YEdyOf9C6AClt00ERKLhixq8X/NJerzuojNRM
	XugHuVlA==;
Received: from [2001:4bb8:184:6215:7ee3:d0e9:131a:82ff] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDnav-00DPV8-Jt; Wed, 11 Aug 2021 12:44:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Tao <houtao1@huawei.com>
Subject: nbd locking fixups
Date: Wed, 11 Aug 2021 14:44:22 +0200
Message-Id: <20210811124428.2368491-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OZ1h-5obnBJ.A.dPH.Nq8EhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1264
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210811124428.2368491-1-hch@lst.de
Resent-Date: Wed, 11 Aug 2021 13:03:09 +0000 (UTC)

Hi Josef and Jens,

this series fixed the lock order reversal that is showing up with
nbd lately.  The first patch contains the asynchronous deletion
from Hou which is needed as a baseline.

