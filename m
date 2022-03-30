Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE494EBA4D
	for <lists+nbd@lfdr.de>; Wed, 30 Mar 2022 07:45:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A5F2421543; Wed, 30 Mar 2022 05:45:32 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 30 05:45:32 2022
Old-Return-Path: <BATV+ea9b0106c62401bc49c3+6793+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 22D9120143
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Mar 2022 05:29:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.141 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id JG2oOFWsgLL5 for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Mar 2022 05:29:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id F3EAF21540
	for <nbd@other.debian.org>; Wed, 30 Mar 2022 05:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=R/r2J1/UolIwnStPTem0XheNOSdc4/WKmXK56uoOTmM=; b=TnbAAZSIZf8DT9VUvmjUcjlr4R
	oVvia+ZceqHSye/60UJMhtE+vtSnfZtC2OrClZSdFYD2+HUSOtVJrGmq3ApwsIo2Gzq+tofmhhCRU
	pAqstSFaSvyFPXUz5lxoW1yhTHtHxlMLhQeoQ8ENP2ZRPrv/zu2PBj1g+QOd/Dx4Xa0ea39948Jxq
	KJltydArw/IlXit79pocrO4S5KkCVJyjzX/TTIFXoJKjG6UfTglo5vIi1454rgipkRyDWneVcUsr7
	CN2IPvEVxOZT1G2h7lQlEzfczybUJywhg+2D1yo5Jo8+jAedpoRW3JzDRCPYnQMHfFCgdAfz4XYQN
	CVD5J7aw==;
Received: from 213-225-15-62.nat.highway.a1.net ([213.225.15.62] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZQtU-00EL8p-Ay; Wed, 30 Mar 2022 05:29:21 +0000
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
Subject: yet another approach to fix the loop lock order inversions v6
Date: Wed, 30 Mar 2022 07:29:02 +0200
Message-Id: <20220330052917.2566582-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GNFHFw8xb3.A.5p.85-QiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1825
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220330052917.2566582-1-hch@lst.de
Resent-Date: Wed, 30 Mar 2022 05:45:32 +0000 (UTC)

Hi all,

this series uses the approach from Tetsuo to delay the destroy_workueue
call, extended by a delayed teardown of the workers to fix a potential
race window then the workqueue can be still round after finishing the
commands. 

Changes since v5:
 - add a patch from Tesuo to move the global lock from __loop_clr_fd
   to loop_clr_fd

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

