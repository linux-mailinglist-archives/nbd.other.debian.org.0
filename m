Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FFC90A569
	for <lists+nbd@lfdr.de>; Mon, 17 Jun 2024 08:23:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9206021064; Mon, 17 Jun 2024 06:23:28 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jun 17 06:23:28 2024
Old-Return-Path: <BATV+625ba2f6da96caf54eae+7603+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5F07A21197
	for <lists-other-nbd@bendel.debian.org>; Mon, 17 Jun 2024 06:06:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.161 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id PQyrFpEnGpMa for <lists-other-nbd@bendel.debian.org>;
	Mon, 17 Jun 2024 06:06:28 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C859021184
	for <nbd@other.debian.org>; Mon, 17 Jun 2024 06:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=nxrpabn3Yr7lfkqLutYlwz8cLBay3S4a7er01YqK4F0=; b=3GbbfR6oFpvEzbS2oqb0oMYMb+
	vqbV+2hZnIKX5lmR5QgZlLvnc0rJ2iit5xTHKYaGb9SJqJcZlOfTA6zcbvntPb1Mru5TE9/q6H45n
	19Qfjq1hppB4GOL4exJE6AwoSdINllOz9afFax9HKV1yIlpLy6TmyrnAQy5qwQMQNr7wNK53aH1xH
	SISmmh7ZH7/J6+77ZtbQLY1fpW/7mGqQvnVPmK8FpFL6vWGEFgZQxWrh6KnYBifPtspD+lbza+mC3
	/LOD/BEvCMU6Az9Z7rUSmmuvgHWX5bBPf/2gvUdUSDM49z0i7Rb2ZQwMZLDJBbnCqWBn8gW4Op6iX
	HXdocZug==;
Received: from [91.187.204.140] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ5VG-00000009IXq-2cbZ;
	Mon, 17 Jun 2024 06:06:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>
Subject: [PATCH 11/26] block: freeze the queue in queue_attr_store
Date: Mon, 17 Jun 2024 08:04:38 +0200
Message-ID: <20240617060532.127975-12-hch@lst.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617060532.127975-1-hch@lst.de>
References: <20240617060532.127975-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OhgX5cgfquP.A.UwWD.gZ9bmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3024
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20240617060532.127975-12-hch@lst.de
Resent-Date: Mon, 17 Jun 2024 06:23:28 +0000 (UTC)

queue_attr_store updates attributes used to control generating I/O, and
can cause malformed bios if changed with I/O in flight.  Freeze the queue
in common code instead of adding it to almost every attribute.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/blk-mq.c    | 5 +++--
 block/blk-sysfs.c | 9 ++-------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 0d4cd39c3d25da..58b0d6c7cc34d6 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -4631,13 +4631,15 @@ int blk_mq_update_nr_requests(struct request_queue *q, unsigned int nr)
 	int ret;
 	unsigned long i;
 
+	if (WARN_ON_ONCE(!q->mq_freeze_depth))
+		return -EINVAL;
+
 	if (!set)
 		return -EINVAL;
 
 	if (q->nr_requests == nr)
 		return 0;
 
-	blk_mq_freeze_queue(q);
 	blk_mq_quiesce_queue(q);
 
 	ret = 0;
@@ -4671,7 +4673,6 @@ int blk_mq_update_nr_requests(struct request_queue *q, unsigned int nr)
 	}
 
 	blk_mq_unquiesce_queue(q);
-	blk_mq_unfreeze_queue(q);
 
 	return ret;
 }
diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index f0f9314ab65c61..5c787965b7d09e 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -189,12 +189,9 @@ static ssize_t queue_discard_max_store(struct request_queue *q,
 	if ((max_discard_bytes >> SECTOR_SHIFT) > UINT_MAX)
 		return -EINVAL;
 
-	blk_mq_freeze_queue(q);
 	lim = queue_limits_start_update(q);
 	lim.max_user_discard_sectors = max_discard_bytes >> SECTOR_SHIFT;
 	err = queue_limits_commit_update(q, &lim);
-	blk_mq_unfreeze_queue(q);
-
 	if (err)
 		return err;
 	return ret;
@@ -241,11 +238,9 @@ queue_max_sectors_store(struct request_queue *q, const char *page, size_t count)
 	if (ret < 0)
 		return ret;
 
-	blk_mq_freeze_queue(q);
 	lim = queue_limits_start_update(q);
 	lim.max_user_sectors = max_sectors_kb << 1;
 	err = queue_limits_commit_update(q, &lim);
-	blk_mq_unfreeze_queue(q);
 	if (err)
 		return err;
 	return ret;
@@ -585,13 +580,11 @@ static ssize_t queue_wb_lat_store(struct request_queue *q, const char *page,
 	 * ends up either enabling or disabling wbt completely. We can't
 	 * have IO inflight if that happens.
 	 */
-	blk_mq_freeze_queue(q);
 	blk_mq_quiesce_queue(q);
 
 	wbt_set_min_lat(q, val);
 
 	blk_mq_unquiesce_queue(q);
-	blk_mq_unfreeze_queue(q);
 
 	return count;
 }
@@ -722,9 +715,11 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
 	if (!entry->store)
 		return -EIO;
 
+	blk_mq_freeze_queue(q);
 	mutex_lock(&q->sysfs_lock);
 	res = entry->store(q, page, length);
 	mutex_unlock(&q->sysfs_lock);
+	blk_mq_unfreeze_queue(q);
 	return res;
 }
 
-- 
2.43.0

