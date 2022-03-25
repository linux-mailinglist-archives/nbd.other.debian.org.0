Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id E75074E6E66
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 07:57:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CE69920458; Fri, 25 Mar 2022 06:57:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 06:57:35 2022
Old-Return-Path: <BATV+8af3a5752749cd19e826+6788+infradead.org+hch@bombadil.srs.infradead.org>
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 88D5E202E2
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 06:40:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Spam-Flag: NO
X-Spam-Score: -4.161
X-Spam-Level:
X-Amavis-Spam-Status: No, score=-4.161 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id aSrKNUi6l1td for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 06:39:58 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E6EE820452
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 06:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=GZoXaYyF7vEJO3Tu4Gtd0TaYRNuVudX60qmzVoPMimI=; b=eRzr4xdNNrKyrjzXNs4dzDIOa6
	I1HYdNEP6UBHi9Th1ebhX+M+5iMryuPTociS5EDycWJvWaguE1A1nd/I7AQUhc0XPnVh5SpQbfx8W
	ZEGadEmp6h+UtGMDz4+NH9F4PrBvZ89vkim53AqTbfwqIjCZBlcv8vqhyVJVm1Ugs9b4WGZENDZ3k
	ptmMuAx33R8xUr3MHTHF3eqkwaMAstnjlMXTRGK5z1/5W1dNaCjku2rb+0QmYx/AthwcBSaCJB8Rd
	nxjnff7SYl0qM9qBthWYXF3XyMFi3idGl6NzXxoY1Vc2pvXMbG7bLAPIrS62eO58PHgDFhHLpHKcj
	oYieguxw==;
Received: from 089144194144.atnat0003.highway.a1.net ([89.144.194.144] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXdbh-001HFl-6C; Fri, 25 Mar 2022 06:39:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	Matteo Croce <mcroce@microsoft.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: yet another approach to fix the loop lock order inversions v5
Date: Fri, 25 Mar 2022 07:39:15 +0100
Message-Id: <20220325063929.1773899-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <b02qvica2oD.A.IhH.ffWPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1785
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220325063929.1773899-1-hch@lst.de
Resent-Date: Fri, 25 Mar 2022 06:57:35 +0000 (UTC)

Hi all,

this series uses the approach from Tetsuo to delay the destroy_workueue
call, extended by a delayed teardown of the workers to fix a potential
race window then the workqueue can be still round after finishing the
commands. 

Changes since v4:
 - keep the (questionable) __invalidate_device call in nbd as-is for now
 - suppress uevents while reconfiguring

Changes since v3:
 - change bd_openers into a atomic_t, including a bunch of cleanups
   and fix found while adding those

Changes since v2:
 - rebased to the lastest block for-next tree, which has the async
   clear reverted and ->free_disk
 - impkement ->free_disk for loop to handle open vs delete races
   more gracefully
 - get rid of lo_refcnt entirely

Changes since v1:
 - add comments to document the lo_refcnt synchronization
 - fix comment typos

