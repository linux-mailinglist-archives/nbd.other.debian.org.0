Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F93A0383D
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 07:55:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6A6CD206C0; Tue,  7 Jan 2025 06:55:43 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 06:55:43 2025
Old-Return-Path: <BATV+ca79fa4415f544dfc9f5+7807+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A881420598
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 06:31:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.151 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0kPGm8C_SNI0 for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 06:31:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 655452060F
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 06:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=SAyM51ZMh2WQCIzVgXjOQiiOuyowXnbXZDM9r17qCgg=; b=OXU130PLjBQ8bGHx7V3SAk3u3v
	aUJX4jjoLYATF7yHULvhQdnm2dNYadsRXz9xLjwmBPW4NH4VWw1zs4LZdxxLNyHhPt1TQNHn1CPf/
	Ar5DIGXC+iWMKLlQVjIUQLxSUZ39BMprBjbjEl7/5r7aj2JHSJFvAsbBBw8x5e21W+yk3fGuwobD9
	W1bASWms8XrdTE9VtCKIXodCIi15HsNIrcQTldhY2jbdUfyNQvNQxJXjsOnVA44tuFn5o6Nc40HUE
	n8Xx9TJWWCGc2ZwioO/vpp4DCmUitG5eQk8s15CHQKs3+d0XhwtAuWhTqVX90+dmxF2itNIx/Wphz
	2HsF5XTA==;
Received: from 2a02-8389-2341-5b80-d467-d75d-35bf-0eb6.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d467:d75d:35bf:eb6] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tV37y-00000003e4Z-3ejf;
	Tue, 07 Jan 2025 06:31:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	nbd@other.debian.org,
	linux-scsi@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: [PATCH 8/8] usb-storage:fix queue freeze vs limits lock order
Date: Tue,  7 Jan 2025 07:30:40 +0100
Message-ID: <20250107063120.1011593-9-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107063120.1011593-1-hch@lst.de>
References: <20250107063120.1011593-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <6OG85PGKPdL.A.x81E.v_MfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3243
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250107063120.1011593-9-hch@lst.de
Resent-Date: Tue,  7 Jan 2025 06:55:43 +0000 (UTC)

Match the locking order used by the core block code by only freezing
the queue after taking the limits lock using the
queue_limits_commit_update_frozen helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/usb/storage/scsiglue.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
index 8c8b5e6041cc..dc98ceecb724 100644
--- a/drivers/usb/storage/scsiglue.c
+++ b/drivers/usb/storage/scsiglue.c
@@ -592,12 +592,9 @@ static ssize_t max_sectors_store(struct device *dev, struct device_attribute *at
 	if (sscanf(buf, "%hu", &ms) <= 0)
 		return -EINVAL;
 
-	blk_mq_freeze_queue(sdev->request_queue);
 	lim = queue_limits_start_update(sdev->request_queue);
 	lim.max_hw_sectors = ms;
-	ret = queue_limits_commit_update(sdev->request_queue, &lim);
-	blk_mq_unfreeze_queue(sdev->request_queue);
-
+	ret = queue_limits_commit_update_frozen(sdev->request_queue, &lim);
 	if (ret)
 		return ret;
 	return count;
-- 
2.45.2

