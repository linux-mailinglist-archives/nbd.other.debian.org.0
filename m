Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AF4778BF8
	for <lists+nbd@lfdr.de>; Fri, 11 Aug 2023 12:25:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5CFFD20639; Fri, 11 Aug 2023 10:25:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 11 10:25:14 2023
Old-Return-Path: <BATV+10530082ca17b6f7899b+7292+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=4.0 tests=ATTENDEES_DBSPAM_BODY3,
	CC_TOO_MANY,DIGITS_LETTERS,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FOURLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3E44F20613
	for <lists-other-nbd@bendel.debian.org>; Fri, 11 Aug 2023 10:09:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.969 tagged_above=-10000 required=5.3
	tests=[ATTENDEES_DBSPAM_BODY3=1, BAYES_00=-2, CC_TOO_MANY=3,
	DIGITS_LETTERS=1, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id vWTerIr7BSyw for <lists-other-nbd@bendel.debian.org>;
	Fri, 11 Aug 2023 10:09:00 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4F13320631
	for <nbd@other.debian.org>; Fri, 11 Aug 2023 10:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=G5wFZqrNN2Zky0KlYoq/2FSZYr23+UpMaPMZmuKO/fg=; b=DSJg9AaoLRSDPfwDhpCRuzCfu6
	nOHA3s1SGXSJ3nmeelWIHN3XOBOkaunJdKly2KkRdkuMXeTxYABV9gdStlPZsPlc3c3lUxq8B4HLu
	jST/9KizR8cMMPIIkSDhnh5d0v/5IvJvK46PuMatmJ8JMrg0nLo2jqM2Tx+x09g6X3W152V1Pctya
	IOISTZkXLuibJspnpmF85zSND/RF7ez/xrO22U4jZBAmESYXcfmCaFDFWtMPJwuqDJQPXmluqSfjP
	EWEF6NM7+Cs9+wFmayF2TJFndksnAY629lPLXRwJ1hQqk6mCVjkMWzdm8kRv9K4ny+sMmjEr6ofKB
	mbEvi0rg==;
Received: from [88.128.92.63] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qUP4U-00A5ce-1n;
	Fri, 11 Aug 2023 10:08:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-s390@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 04/17] btrfs: split btrfs_fs_devices.opened
Date: Fri, 11 Aug 2023 12:08:15 +0200
Message-Id: <20230811100828.1897174-5-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230811100828.1897174-1-hch@lst.de>
References: <20230811100828.1897174-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gJsZDcfsc1.A.Yo.Kyg1kB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2601
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230811100828.1897174-5-hch@lst.de
Resent-Date: Fri, 11 Aug 2023 10:25:14 +0000 (UTC)

The btrfs_fs_devices.opened member mixes an in use counter for the
fs_devices structure that prevents it from being garbage collected with
a flag if the underlying devices were actually opened.  This not only
makes the code hard to follow, but also prevents btrfs from switching
to opening the block device only after super block creation.  Split it
into an in_use counter and an is_open boolean flag instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/volumes.c | 49 ++++++++++++++++++++++++++--------------------
 fs/btrfs/volumes.h |  6 ++++--
 2 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 8246578c70f55b..3ac1a3aa8939bc 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -405,7 +405,8 @@ static void free_fs_devices(struct btrfs_fs_devices *fs_devices)
 {
 	struct btrfs_device *device;
 
-	WARN_ON(fs_devices->opened);
+	WARN_ON_ONCE(fs_devices->in_use);
+	WARN_ON_ONCE(fs_devices->is_open);
 	while (!list_empty(&fs_devices->devices)) {
 		device = list_entry(fs_devices->devices.next,
 				    struct btrfs_device, dev_list);
@@ -578,7 +579,7 @@ static int btrfs_free_stale_devices(dev_t devt, struct btrfs_device *skip_device
 				continue;
 			if (devt && devt != device->devt)
 				continue;
-			if (fs_devices->opened) {
+			if (fs_devices->in_use) {
 				/* for an already deleted device return 0 */
 				if (devt && ret != 0)
 					ret = -EBUSY;
@@ -849,7 +850,7 @@ static noinline struct btrfs_device *device_list_add(const char *path,
 	if (!device) {
 		unsigned int nofs_flag;
 
-		if (fs_devices->opened) {
+		if (fs_devices->in_use) {
 			btrfs_err(NULL,
 		"device %s belongs to fsid %pU, and the fs is already mounted",
 				  path, fs_devices->fsid);
@@ -913,7 +914,7 @@ static noinline struct btrfs_device *device_list_add(const char *path,
 		 * tracking a problem where systems fail mount by subvolume id
 		 * when we reject replacement on a mounted FS.
 		 */
-		if (!fs_devices->opened && found_transid < device->generation) {
+		if (!fs_devices->in_use && found_transid < device->generation) {
 			/*
 			 * That is if the FS is _not_ mounted and if you
 			 * are here, that means there is more than one
@@ -974,7 +975,7 @@ static noinline struct btrfs_device *device_list_add(const char *path,
 	 * it back. We need it to pick the disk with largest generation
 	 * (as above).
 	 */
-	if (!fs_devices->opened) {
+	if (!fs_devices->in_use) {
 		device->generation = found_transid;
 		fs_devices->latest_generation = max_t(u64, found_transid,
 						fs_devices->latest_generation);
@@ -1172,15 +1173,19 @@ static void close_fs_devices(struct btrfs_fs_devices *fs_devices)
 
 	lockdep_assert_held(&uuid_mutex);
 
-	if (--fs_devices->opened > 0)
+	if (--fs_devices->in_use > 0)
 		return;
 
+	if (!fs_devices->is_open)
+		goto done;
+
 	list_for_each_entry_safe(device, tmp, &fs_devices->devices, dev_list)
 		btrfs_close_one_device(device);
 
 	WARN_ON(fs_devices->open_devices);
 	WARN_ON(fs_devices->rw_devices);
-	fs_devices->opened = 0;
+	fs_devices->is_open = false;
+done:
 	fs_devices->seeding = false;
 	fs_devices->fs_info = NULL;
 }
@@ -1192,7 +1197,7 @@ void btrfs_close_devices(struct btrfs_fs_devices *fs_devices)
 
 	mutex_lock(&uuid_mutex);
 	close_fs_devices(fs_devices);
-	if (!fs_devices->opened) {
+	if (!fs_devices->in_use) {
 		list_splice_init(&fs_devices->seed_list, &list);
 
 		/*
@@ -1240,7 +1245,7 @@ static int open_fs_devices(struct btrfs_fs_devices *fs_devices,
 	if (fs_devices->open_devices == 0)
 		return -EINVAL;
 
-	fs_devices->opened = 1;
+	fs_devices->is_open = true;
 	fs_devices->latest_dev = latest_dev;
 	fs_devices->total_rw_bytes = 0;
 	fs_devices->chunk_alloc_policy = BTRFS_CHUNK_ALLOC_REGULAR;
@@ -1277,16 +1282,14 @@ int btrfs_open_devices(struct btrfs_fs_devices *fs_devices,
 	 * We also don't need the lock here as this is called during mount and
 	 * exclusion is provided by uuid_mutex
 	 */
-
-	if (fs_devices->opened) {
-		fs_devices->opened++;
-		ret = 0;
-	} else {
+	if (!fs_devices->is_open) {
 		list_sort(NULL, &fs_devices->devices, devid_cmp);
 		ret = open_fs_devices(fs_devices, flags, holder);
+		if (ret)
+			return ret;
 	}
-
-	return ret;
+	fs_devices->in_use++;
+	return 0;
 }
 
 void btrfs_release_disk_super(struct btrfs_super_block *super)
@@ -2242,13 +2245,14 @@ int btrfs_rm_device(struct btrfs_fs_info *fs_info,
 	 * This can happen if cur_devices is the private seed devices list.  We
 	 * cannot call close_fs_devices() here because it expects the uuid_mutex
 	 * to be held, but in fact we don't need that for the private
-	 * seed_devices, we can simply decrement cur_devices->opened and then
+	 * seed_devices, we can simply decrement cur_devices->in_use and then
 	 * remove it from our list and free the fs_devices.
 	 */
 	if (cur_devices->num_devices == 0) {
 		list_del_init(&cur_devices->seed_list);
-		ASSERT(cur_devices->opened == 1);
-		cur_devices->opened--;
+		ASSERT(cur_devices->in_use == 1);
+		cur_devices->in_use--;
+		cur_devices->is_open = false;
 		free_fs_devices(cur_devices);
 	}
 
@@ -2478,7 +2482,8 @@ static struct btrfs_fs_devices *btrfs_init_sprout(struct btrfs_fs_info *fs_info)
 	list_add(&old_devices->fs_list, &fs_uuids);
 
 	memcpy(seed_devices, fs_devices, sizeof(*seed_devices));
-	seed_devices->opened = 1;
+	seed_devices->in_use = 1;
+	seed_devices->is_open = true;
 	INIT_LIST_HEAD(&seed_devices->devices);
 	INIT_LIST_HEAD(&seed_devices->alloc_list);
 	mutex_init(&seed_devices->device_list_mutex);
@@ -6883,7 +6888,8 @@ static struct btrfs_fs_devices *open_seed_devices(struct btrfs_fs_info *fs_info,
 			return fs_devices;
 
 		fs_devices->seeding = true;
-		fs_devices->opened = 1;
+		fs_devices->in_use = 1;
+		fs_devices->is_open = true;
 		return fs_devices;
 	}
 
@@ -6900,6 +6906,7 @@ static struct btrfs_fs_devices *open_seed_devices(struct btrfs_fs_info *fs_info,
 		free_fs_devices(fs_devices);
 		return ERR_PTR(ret);
 	}
+	fs_devices->in_use = 1;
 
 	if (!fs_devices->seeding) {
 		close_fs_devices(fs_devices);
diff --git a/fs/btrfs/volumes.h b/fs/btrfs/volumes.h
index 824161c6dd063e..f472d646715e72 100644
--- a/fs/btrfs/volumes.h
+++ b/fs/btrfs/volumes.h
@@ -346,8 +346,10 @@ struct btrfs_fs_devices {
 
 	struct list_head seed_list;
 
-	/* Count fs-devices opened. */
-	int opened;
+	/* Count if fs_device is in used. */
+	unsigned int in_use;
+	/* True if the devices were opened. */
+	bool is_open;
 
 	/* Set when we find or add a device that doesn't have the nonrot flag set. */
 	bool rotating;
-- 
2.39.2

