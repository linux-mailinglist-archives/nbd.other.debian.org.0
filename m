Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id BF88EA022E6
	for <lists+nbd@lfdr.de>; Mon,  6 Jan 2025 11:25:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A5E40206EE; Mon,  6 Jan 2025 10:25:53 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan  6 10:25:53 2025
Old-Return-Path: <BATV+41f3ef30789274237cd7+7806+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5E5AF2068D
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Jan 2025 10:07:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.151 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XORpb5jO7ytu for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Jan 2025 10:07:16 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C072D2068B
	for <nbd@other.debian.org>; Mon,  6 Jan 2025 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3euJA8Ns15KPhEkUiWNhzNcQI81/iMSrckSXcWqOPgE=; b=uorFDHREReYWiG9VtntQ9e8Y4e
	knOrAohZ7GSdXpgJ0ql5KsoglIrI/4AQoizpvqQxtgIF9h9oX6kwTL57AqL6FYcNQ3jcMJwsXfRyw
	Ad+wn/BcsWKrad/djehuaG7sVtiswvLrQSjc7xszPjuNzxlv7xB5hLbg78XFRvwE1bpv66djMNrLv
	L91a90sN7kdq2qewGkkpbQ9Yhi6fgnbTqYLJq7xlKd+ill487SJnPqMn2MMkOk/obe9fMGukkRhaD
	XCV2m5yDT2L+bhhu+v2EOs3nkqJesZNYGP9uWl9sPlhRHST1O/ufpZ2/xjPd7toADN/8gJvnkl/Yd
	+3Ws0ylA==;
Received: from 2a02-8389-2341-5b80-db6b-99e8-3feb-3b4e.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:db6b:99e8:3feb:3b4e] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tUk0t-00000000ng8-2TWU;
	Mon, 06 Jan 2025 10:07:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	nbd@other.debian.org,
	virtualization@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: [PATCH 09/10] loop: document why loop_clear_limits updates queue limits without freezing
Date: Mon,  6 Jan 2025 11:06:22 +0100
Message-ID: <20250106100645.850445-10-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106100645.850445-1-hch@lst.de>
References: <20250106100645.850445-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AbBEv73cD2.A.YZzF.x-6enB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3216
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250106100645.850445-10-hch@lst.de
Resent-Date: Mon,  6 Jan 2025 10:25:53 +0000 (UTC)

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 836a53eef4b4..84b007b9c38c 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -311,6 +311,13 @@ static void loop_clear_limits(struct loop_device *lo, int mode)
 		lim.discard_granularity = 0;
 	}
 
+	/*
+	 * XXX: this updates the queue limits without freezing the queue, which
+	 * is against the locking protocol and dangerous.  But we can't just
+	 * freeze the queue as we're inside the ->queue_rq method here.  So this
+	 * should move out into a workqueue unless we get the file operations to
+	 * advertise if they support specific fallocate operations.
+	 */
 	queue_limits_commit_update(lo->lo_queue, &lim);
 }
 
-- 
2.45.2

