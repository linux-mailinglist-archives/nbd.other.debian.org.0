Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 290474E6E6A
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 07:58:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0A4A820456; Fri, 25 Mar 2022 06:58:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 06:58:20 2022
Old-Return-Path: <BATV+8af3a5752749cd19e826+6788+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FVGT_m_MULTI_ODD,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CA859202E2
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 06:40:13 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.121 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id O4qVbtUSoZUw for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 06:40:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 287792029C
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 06:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7FMB8k2k//bismCMyEKOPHTN0G4yEkkiK6b/Aojd8lY=; b=YFPMjeapYMc1BJfRKqe5pkbIT9
	9ae1qwjJMEmJ3kAr7+oGQjh6G4rfZYabvx2GXaPu01KzC8da8/dh0amcSLJhbHFCrh4Ah2TmV/6ad
	s9uLYmXtt293HrlTw1vkvhDfl3RCZlP6vqhc3FW1nAu9HHh84jZGzr6Hi9VpQNwNOIwZkRH/tyoDU
	+p9xVT6WWVargDeFTAsyw5PwluIEJOBfEV8Z52gX3VT5W7uX5rlWZFo6T8uVrI9kwxpqtjuSXgx+a
	0Anr+31JZfc/W2BolxwbaIQnDlzZXfqD2O6unH6PNkOOTiQlVWXXCfVeivvE/uwDRSpIGADq5KPD3
	Axb4hUHw==;
Received: from 089144194144.atnat0003.highway.a1.net ([89.144.194.144] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXdc7-001HME-DI; Fri, 25 Mar 2022 06:40:00 +0000
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
	nbd@other.debian.org,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: [PATCH 07/14] loop: initialize the worker tracking fields once
Date: Fri, 25 Mar 2022 07:39:22 +0100
Message-Id: <20220325063929.1773899-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325063929.1773899-1-hch@lst.de>
References: <20220325063929.1773899-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <--28ERrAccH.A.KrH.LgWPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1789
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220325063929.1773899-8-hch@lst.de
Resent-Date: Fri, 25 Mar 2022 06:58:20 +0000 (UTC)

There is no need to reinitialize idle_worker_list, worker_tree and timer
every time a loop device is configured.  Just initialize them once at
allocation time.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Tested-by: Darrick J. Wong <djwong@kernel.org>
---
 drivers/block/loop.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 762f0a18295d7..d1c1086beedce 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1057,10 +1057,6 @@ static int loop_configure(struct loop_device *lo, fmode_t mode,
 
 	INIT_WORK(&lo->rootcg_work, loop_rootcg_workfn);
 	INIT_LIST_HEAD(&lo->rootcg_cmd_list);
-	INIT_LIST_HEAD(&lo->idle_worker_list);
-	lo->worker_tree = RB_ROOT;
-	timer_setup(&lo->timer, loop_free_idle_workers_timer,
-		TIMER_DEFERRABLE);
 	lo->use_dio = lo->lo_flags & LO_FLAGS_DIRECT_IO;
 	lo->lo_device = bdev;
 	lo->lo_backing_file = file;
@@ -1973,6 +1969,9 @@ static int loop_add(int i)
 	lo = kzalloc(sizeof(*lo), GFP_KERNEL);
 	if (!lo)
 		goto out;
+	lo->worker_tree = RB_ROOT;
+	INIT_LIST_HEAD(&lo->idle_worker_list);
+	timer_setup(&lo->timer, loop_free_idle_workers_timer, TIMER_DEFERRABLE);
 	lo->lo_state = Lo_unbound;
 
 	err = mutex_lock_killable(&loop_ctl_mutex);
-- 
2.30.2

