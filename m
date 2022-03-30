Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D91C4EBA5D
	for <lists+nbd@lfdr.de>; Wed, 30 Mar 2022 07:47:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 064F321543; Wed, 30 Mar 2022 05:47:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 30 05:47:12 2022
Old-Return-Path: <BATV+ea9b0106c62401bc49c3+6793+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 23C9621540
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Mar 2022 05:30:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.141 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mBb5RLwbGLj0 for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Mar 2022 05:30:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C904620143
	for <nbd@other.debian.org>; Wed, 30 Mar 2022 05:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=MuFp2PEYVgAJNpwoksEBN8g5TKJG7AFoiRM8TdlFZDA=; b=OZp2DQSYOmf7uBkzH5buwuK6eo
	TjHODBgAsiiYLrKZjBnqdY097SC41tRar3dyJlLwfk4O5WR6YDkseqbvkuTCopbmbIoy3JQc0g6rg
	SBjWUQtKdDyH4QbV/ZVVkeAKtpFugU7sqpGZq7TuHiXR5FmFJWm2nZ0AFulm5FTiN0Y0kYwl4drwb
	TisumE0K4RjjDmy5joA9GRr9NWvsdyFeDttlhA80A3xBYZDBZfz7oK3IQJlkrpIuytzTbL81w/cU9
	afZlFMsdSkNI8pz8B9NDS2BUx5KvBnowB0jyQk+vltH5lzq9Z6SEnsqBwWaZV2NoOCwm0rqyOAmpr
	cSWZ9PQA==;
Received: from 213-225-15-62.nat.highway.a1.net ([213.225.15.62] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZQuB-00ELRA-9Q; Wed, 30 Mar 2022 05:30:03 +0000
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
Subject: [PATCH 11/15] loop: implement ->free_disk
Date: Wed, 30 Mar 2022 07:29:13 +0200
Message-Id: <20220330052917.2566582-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220330052917.2566582-1-hch@lst.de>
References: <20220330052917.2566582-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zL0oKs59CIO.A.z_.g7-QiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1834
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220330052917.2566582-12-hch@lst.de
Resent-Date: Wed, 30 Mar 2022 05:47:13 +0000 (UTC)

Ensure that the lo_device which is stored in the gendisk private
data is valid until the gendisk is freed.  Currently the loop driver
uses a lot of effort to make sure a device is not freed when it is
still in use, but to to fix a potential deadlock this will be relaxed
a bit soon.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 drivers/block/loop.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index a5dd259958ee2..b3170e8cdbe95 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1765,6 +1765,14 @@ static void lo_release(struct gendisk *disk, fmode_t mode)
 	mutex_unlock(&lo->lo_mutex);
 }
 
+static void lo_free_disk(struct gendisk *disk)
+{
+	struct loop_device *lo = disk->private_data;
+
+	mutex_destroy(&lo->lo_mutex);
+	kfree(lo);
+}
+
 static const struct block_device_operations lo_fops = {
 	.owner =	THIS_MODULE,
 	.open =		lo_open,
@@ -1773,6 +1781,7 @@ static const struct block_device_operations lo_fops = {
 #ifdef CONFIG_COMPAT
 	.compat_ioctl =	lo_compat_ioctl,
 #endif
+	.free_disk =	lo_free_disk,
 };
 
 /*
@@ -2064,15 +2073,14 @@ static void loop_remove(struct loop_device *lo)
 {
 	/* Make this loop device unreachable from pathname. */
 	del_gendisk(lo->lo_disk);
-	blk_cleanup_disk(lo->lo_disk);
+	blk_cleanup_queue(lo->lo_disk->queue);
 	blk_mq_free_tag_set(&lo->tag_set);
 
 	mutex_lock(&loop_ctl_mutex);
 	idr_remove(&loop_index_idr, lo->lo_number);
 	mutex_unlock(&loop_ctl_mutex);
-	/* There is no route which can find this loop device. */
-	mutex_destroy(&lo->lo_mutex);
-	kfree(lo);
+
+	put_disk(lo->lo_disk);
 }
 
 static void loop_probe(dev_t dev)
-- 
2.30.2

