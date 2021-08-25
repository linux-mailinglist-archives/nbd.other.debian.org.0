Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A043F7AEE
	for <lists+nbd@lfdr.de>; Wed, 25 Aug 2021 18:51:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A845E207C7; Wed, 25 Aug 2021 16:51:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 25 16:51:19 2021
Old-Return-Path: <BATV+524259e6bed01b826d00+6576+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,MONOTONE_WORDS_2_15,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1D2C32086F
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Aug 2021 16:34:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.13 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
	MONOTONE_WORDS_2_15=1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ldJHx8nR_MTF for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Aug 2021 16:34:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 79CF520872
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 16:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=G65DHKLMstwkPiDtcSUQByx9gy0ElEP9CPMbq2ngRyM=; b=pHfNg9s0hEvAqhPn/rOBKd8Vfd
	vsqV2EoilE0qZSFqA78bS6wm3+n21q1cRsrQQgZgiiqmGxVyHgcEJLkFq6/t3S1t/2YpWh3BvtTCr
	AVPPWJTFzmZ1pWYzhdTbxiFlFoyExpV0igfcvgrqv2Nrnt0NYpHUde0ldq6Wdd+PpZ0Jx8OqB6wA/
	OrSU5tvlYMhrWlD2sDriGPHbfF9ic41VLaHWCqweD0uYsLDQofxg9O46kSXUe8kJxOFGAjuJv2Ii6
	1MWFFy4hv+axP/vrb0EsakRJHJNpfUP4/tGnMWZYS4W0fQhoe1aQohuu6H7AT1E5Q+6PJfJklOt5z
	7z+2TbUg==;
Received: from [2001:4bb8:193:fd10:a3f9:5689:21a4:711f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIvnx-00CTaV-Bq; Wed, 25 Aug 2021 16:33:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Xiubo Li <xiubli@redhat.com>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: nbd lifetimes fixes
Date: Wed, 25 Aug 2021 18:31:02 +0200
Message-Id: <20210825163108.50713-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vgl3iIGu9qP.A.woE.HUnJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1329
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210825163108.50713-1-hch@lst.de
Resent-Date: Wed, 25 Aug 2021 16:51:19 +0000 (UTC)

Hi Josef and Jens,

this series tries to deal with the fallout of the recent lock scope
reduction as pointed out by Tetsuo and szybot and inspired by /
reused from the catchall patch by Tetsuo.  One big change is that
I finally decided to kill off the ->destroy_complete scheme entirely
because I'm pretty sure it is not needed with the various fixes and
we can just return an error for the tiny race condition where it
matters.  Xiubo, can you double check this with your nbd-runner
setup?  nbd-runner itself seems pretty generic and not directly
reproduce anything here.

Note that the syzbot reproduer still fails eventually, but in
devtmpfsd in a way that does not look related to the loop code
at all.

