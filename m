Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE5FA03835
	for <lists+nbd@lfdr.de>; Tue,  7 Jan 2025 07:54:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 44732206DB; Tue,  7 Jan 2025 06:54:58 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jan  7 06:54:58 2025
Old-Return-Path: <BATV+ca79fa4415f544dfc9f5+7807+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	WORD_WITHOUT_VOWELS autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 868F820676
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Jan 2025 06:31:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.121 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	RCVD_IN_DNSWL_MED=-2.3, UNWANTED_LANGUAGE_BODY=0.03,
	WORD_WITHOUT_VOWELS=1] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id sbaXt-t1_o14 for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Jan 2025 06:31:39 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 9A3DB206C0
	for <nbd@other.debian.org>; Tue,  7 Jan 2025 06:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3/a6WiD4jfiuSLJg/6epzPSF4U+qaAs8qx6yJ1YrGdA=; b=NA2RsE+6ayFvAf0wKMfLEYqEd8
	FSDkRit+vyuA82uGdGNcllCjCc3tT4WrA5xctp934d70LegvtpY4fAGcEbSzalqAFysi7O/otKLhg
	mFapmcKQ0U94xm6ywkiVgpzXvQq+YzjxV3DZ8ybJ0MhUCimkdzE1qbp9RK67u58W1R7wxjoFvO9p6
	ZB1qM+eTd07UehUfLQkyhOuc7srFsrluNiRvKG8/1TN6n+nI1v1m7XWbnRsYNLDjxGC1HpU7E0O8G
	VQ5VYjP2wkvqV6gbeX62sTJZhMWYxI2RMh7yCvOuXDtsH6fLL8+PgQ6oZy2GGu2KE4xIiHE+UOtgI
	ekQ9svEg==;
Received: from 2a02-8389-2341-5b80-d467-d75d-35bf-0eb6.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d467:d75d:35bf:eb6] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tV37m-00000003dtU-20Vi;
	Tue, 07 Jan 2025 06:31:35 +0000
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
Subject: [PATCH 4/8] block: add a store_limit operations for sysfs entries
Date: Tue,  7 Jan 2025 07:30:36 +0100
Message-ID: <20250107063120.1011593-5-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250107063120.1011593-1-hch@lst.de>
References: <20250107063120.1011593-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <XZkq78IK6VD.A.Qp1E.C_MfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3239
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250107063120.1011593-5-hch@lst.de
Resent-Date: Tue,  7 Jan 2025 06:54:58 +0000 (UTC)

De-duplicate the code for updating queue limits by adding a store_limit
method that allows having common code handle the actual queue limits
update.

Note that this is a pure refactoring patch and does not address the
existing freeze vs limits lock order problem in the refactored code,
which will be addressed next.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-sysfs.c | 128 ++++++++++++++++++++++------------------------
 1 file changed, 61 insertions(+), 67 deletions(-)

diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 767598e719ab..8d69315e986d 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -24,6 +24,8 @@ struct queue_sysfs_entry {
 	struct attribute attr;
 	ssize_t (*show)(struct gendisk *disk, char *page);
 	ssize_t (*store)(struct gendisk *disk, const char *page, size_t count);
+	int (*store_limit)(struct gendisk *disk, const char *page,
+			size_t count, struct queue_limits *lim);
 	void (*load_module)(struct gendisk *disk, const char *page, size_t count);
 };
 
@@ -153,13 +155,11 @@ QUEUE_SYSFS_SHOW_CONST(discard_zeroes_data, 0)
 QUEUE_SYSFS_SHOW_CONST(write_same_max, 0)
 QUEUE_SYSFS_SHOW_CONST(poll_delay, -1)
 
-static ssize_t queue_max_discard_sectors_store(struct gendisk *disk,
-		const char *page, size_t count)
+static int queue_max_discard_sectors_store(struct gendisk *disk,
+		const char *page, size_t count, struct queue_limits *lim)
 {
 	unsigned long max_discard_bytes;
-	struct queue_limits lim;
 	ssize_t ret;
-	int err;
 
 	ret = queue_var_store(&max_discard_bytes, page, count);
 	if (ret < 0)
@@ -171,38 +171,28 @@ static ssize_t queue_max_discard_sectors_store(struct gendisk *disk,
 	if ((max_discard_bytes >> SECTOR_SHIFT) > UINT_MAX)
 		return -EINVAL;
 
-	lim = queue_limits_start_update(disk->queue);
-	lim.max_user_discard_sectors = max_discard_bytes >> SECTOR_SHIFT;
-	err = queue_limits_commit_update(disk->queue, &lim);
-	if (err)
-		return err;
-	return ret;
+	lim->max_user_discard_sectors = max_discard_bytes >> SECTOR_SHIFT;
+	return 0;
 }
 
-static ssize_t
-queue_max_sectors_store(struct gendisk *disk, const char *page, size_t count)
+static int
+queue_max_sectors_store(struct gendisk *disk, const char *page, size_t count,
+		struct queue_limits *lim)
 {
 	unsigned long max_sectors_kb;
-	struct queue_limits lim;
 	ssize_t ret;
-	int err;
 
 	ret = queue_var_store(&max_sectors_kb, page, count);
 	if (ret < 0)
 		return ret;
 
-	lim = queue_limits_start_update(disk->queue);
-	lim.max_user_sectors = max_sectors_kb << 1;
-	err = queue_limits_commit_update(disk->queue, &lim);
-	if (err)
-		return err;
-	return ret;
+	lim->max_user_sectors = max_sectors_kb << 1;
+	return 0;
 }
 
 static ssize_t queue_feature_store(struct gendisk *disk, const char *page,
-		size_t count, blk_features_t feature)
+		size_t count, struct queue_limits *lim, blk_features_t feature)
 {
-	struct queue_limits lim;
 	unsigned long val;
 	ssize_t ret;
 
@@ -210,15 +200,11 @@ static ssize_t queue_feature_store(struct gendisk *disk, const char *page,
 	if (ret < 0)
 		return ret;
 
-	lim = queue_limits_start_update(disk->queue);
 	if (val)
-		lim.features |= feature;
+		lim->features |= feature;
 	else
-		lim.features &= ~feature;
-	ret = queue_limits_commit_update(disk->queue, &lim);
-	if (ret)
-		return ret;
-	return count;
+		lim->features &= ~feature;
+	return 0;
 }
 
 #define QUEUE_SYSFS_FEATURE(_name, _feature)				\
@@ -227,10 +213,10 @@ static ssize_t queue_##_name##_show(struct gendisk *disk, char *page)	\
 	return sysfs_emit(page, "%u\n",					\
 		!!(disk->queue->limits.features & _feature));		\
 }									\
-static ssize_t queue_##_name##_store(struct gendisk *disk,		\
-		const char *page, size_t count)				\
+static int queue_##_name##_store(struct gendisk *disk,			\
+		const char *page, size_t count, struct queue_limits *lim) \
 {									\
-	return queue_feature_store(disk, page, count, _feature);	\
+	return queue_feature_store(disk, page, count, lim, _feature);	\
 }
 
 QUEUE_SYSFS_FEATURE(rotational, BLK_FEAT_ROTATIONAL)
@@ -266,10 +252,9 @@ static ssize_t queue_iostats_passthrough_show(struct gendisk *disk, char *page)
 	return queue_var_show(!!blk_queue_passthrough_stat(disk->queue), page);
 }
 
-static ssize_t queue_iostats_passthrough_store(struct gendisk *disk,
-					       const char *page, size_t count)
+static int queue_iostats_passthrough_store(struct gendisk *disk,
+		const char *page, size_t count, struct queue_limits *lim)
 {
-	struct queue_limits lim;
 	unsigned long ios;
 	ssize_t ret;
 
@@ -277,18 +262,13 @@ static ssize_t queue_iostats_passthrough_store(struct gendisk *disk,
 	if (ret < 0)
 		return ret;
 
-	lim = queue_limits_start_update(disk->queue);
 	if (ios)
-		lim.flags |= BLK_FLAG_IOSTATS_PASSTHROUGH;
+		lim->flags |= BLK_FLAG_IOSTATS_PASSTHROUGH;
 	else
-		lim.flags &= ~BLK_FLAG_IOSTATS_PASSTHROUGH;
-
-	ret = queue_limits_commit_update(disk->queue, &lim);
-	if (ret)
-		return ret;
-
-	return count;
+		lim->flags &= ~BLK_FLAG_IOSTATS_PASSTHROUGH;
+	return 0;
 }
+
 static ssize_t queue_nomerges_show(struct gendisk *disk, char *page)
 {
 	return queue_var_show((blk_queue_nomerges(disk->queue) << 1) |
@@ -391,12 +371,10 @@ static ssize_t queue_wc_show(struct gendisk *disk, char *page)
 	return sysfs_emit(page, "write through\n");
 }
 
-static ssize_t queue_wc_store(struct gendisk *disk, const char *page,
-			      size_t count)
+static int queue_wc_store(struct gendisk *disk, const char *page,
+		size_t count, struct queue_limits *lim)
 {
-	struct queue_limits lim;
 	bool disable;
-	int err;
 
 	if (!strncmp(page, "write back", 10)) {
 		disable = false;
@@ -407,15 +385,11 @@ static ssize_t queue_wc_store(struct gendisk *disk, const char *page,
 		return -EINVAL;
 	}
 
-	lim = queue_limits_start_update(disk->queue);
 	if (disable)
-		lim.flags |= BLK_FLAG_WRITE_CACHE_DISABLED;
+		lim->flags |= BLK_FLAG_WRITE_CACHE_DISABLED;
 	else
-		lim.flags &= ~BLK_FLAG_WRITE_CACHE_DISABLED;
-	err = queue_limits_commit_update(disk->queue, &lim);
-	if (err)
-		return err;
-	return count;
+		lim->flags &= ~BLK_FLAG_WRITE_CACHE_DISABLED;
+	return 0;
 }
 
 #define QUEUE_RO_ENTRY(_prefix, _name)			\
@@ -431,6 +405,13 @@ static struct queue_sysfs_entry _prefix##_entry = {	\
 	.store	= _prefix##_store,			\
 };
 
+#define QUEUE_LIM_RW_ENTRY(_prefix, _name)			\
+static struct queue_sysfs_entry _prefix##_entry = {	\
+	.attr		= { .name = _name, .mode = 0644 },	\
+	.show		= _prefix##_show,			\
+	.store_limit	= _prefix##_store,			\
+}
+
 #define QUEUE_RW_LOAD_MODULE_ENTRY(_prefix, _name)		\
 static struct queue_sysfs_entry _prefix##_entry = {		\
 	.attr		= { .name = _name, .mode = 0644 },	\
@@ -441,7 +422,7 @@ static struct queue_sysfs_entry _prefix##_entry = {		\
 
 QUEUE_RW_ENTRY(queue_requests, "nr_requests");
 QUEUE_RW_ENTRY(queue_ra, "read_ahead_kb");
-QUEUE_RW_ENTRY(queue_max_sectors, "max_sectors_kb");
+QUEUE_LIM_RW_ENTRY(queue_max_sectors, "max_sectors_kb");
 QUEUE_RO_ENTRY(queue_max_hw_sectors, "max_hw_sectors_kb");
 QUEUE_RO_ENTRY(queue_max_segments, "max_segments");
 QUEUE_RO_ENTRY(queue_max_integrity_segments, "max_integrity_segments");
@@ -457,7 +438,7 @@ QUEUE_RO_ENTRY(queue_io_opt, "optimal_io_size");
 QUEUE_RO_ENTRY(queue_max_discard_segments, "max_discard_segments");
 QUEUE_RO_ENTRY(queue_discard_granularity, "discard_granularity");
 QUEUE_RO_ENTRY(queue_max_hw_discard_sectors, "discard_max_hw_bytes");
-QUEUE_RW_ENTRY(queue_max_discard_sectors, "discard_max_bytes");
+QUEUE_LIM_RW_ENTRY(queue_max_discard_sectors, "discard_max_bytes");
 QUEUE_RO_ENTRY(queue_discard_zeroes_data, "discard_zeroes_data");
 
 QUEUE_RO_ENTRY(queue_atomic_write_max_sectors, "atomic_write_max_bytes");
@@ -477,11 +458,11 @@ QUEUE_RO_ENTRY(queue_max_open_zones, "max_open_zones");
 QUEUE_RO_ENTRY(queue_max_active_zones, "max_active_zones");
 
 QUEUE_RW_ENTRY(queue_nomerges, "nomerges");
-QUEUE_RW_ENTRY(queue_iostats_passthrough, "iostats_passthrough");
+QUEUE_LIM_RW_ENTRY(queue_iostats_passthrough, "iostats_passthrough");
 QUEUE_RW_ENTRY(queue_rq_affinity, "rq_affinity");
 QUEUE_RW_ENTRY(queue_poll, "io_poll");
 QUEUE_RW_ENTRY(queue_poll_delay, "io_poll_delay");
-QUEUE_RW_ENTRY(queue_wc, "write_cache");
+QUEUE_LIM_RW_ENTRY(queue_wc, "write_cache");
 QUEUE_RO_ENTRY(queue_fua, "fua");
 QUEUE_RO_ENTRY(queue_dax, "dax");
 QUEUE_RW_ENTRY(queue_io_timeout, "io_timeout");
@@ -494,10 +475,10 @@ static struct queue_sysfs_entry queue_hw_sector_size_entry = {
 	.show = queue_logical_block_size_show,
 };
 
-QUEUE_RW_ENTRY(queue_rotational, "rotational");
-QUEUE_RW_ENTRY(queue_iostats, "iostats");
-QUEUE_RW_ENTRY(queue_add_random, "add_random");
-QUEUE_RW_ENTRY(queue_stable_writes, "stable_writes");
+QUEUE_LIM_RW_ENTRY(queue_rotational, "rotational");
+QUEUE_LIM_RW_ENTRY(queue_iostats, "iostats");
+QUEUE_LIM_RW_ENTRY(queue_add_random, "add_random");
+QUEUE_LIM_RW_ENTRY(queue_stable_writes, "stable_writes");
 
 #ifdef CONFIG_BLK_WBT
 static ssize_t queue_var_store64(s64 *var, const char *page)
@@ -695,7 +676,7 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
 	struct request_queue *q = disk->queue;
 	ssize_t res;
 
-	if (!entry->store)
+	if (!entry->store_limit && !entry->store)
 		return -EIO;
 
 	/*
@@ -706,11 +687,24 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
 	if (entry->load_module)
 		entry->load_module(disk, page, length);
 
-	blk_mq_freeze_queue(q);
 	mutex_lock(&q->sysfs_lock);
-	res = entry->store(disk, page, length);
-	mutex_unlock(&q->sysfs_lock);
+	blk_mq_freeze_queue(q);
+	if (entry->store_limit) {
+		struct queue_limits lim = queue_limits_start_update(q);
+
+		res = entry->store_limit(disk, page, length, &lim);
+		if (res < 0) {
+			queue_limits_cancel_update(q);
+		} else {
+			res = queue_limits_commit_update(q, &lim);
+			if (!res)
+				res = length;
+		}
+	} else {
+		res = entry->store(disk, page, length);
+	}
 	blk_mq_unfreeze_queue(q);
+	mutex_unlock(&q->sysfs_lock);
 	return res;
 }
 
-- 
2.45.2

