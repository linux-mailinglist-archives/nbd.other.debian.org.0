Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8093E921E
	for <lists+nbd@lfdr.de>; Wed, 11 Aug 2021 15:03:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C013720263; Wed, 11 Aug 2021 13:03:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 11 13:03:20 2021
Old-Return-Path: <BATV+fa63ca7dd370ca608068+6562+infradead.org+hch@casper.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8C7062030F
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Aug 2021 12:46:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.031 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id CGong-GZCBEw for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Aug 2021 12:46:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C30752030C
	for <nbd@other.debian.org>; Wed, 11 Aug 2021 12:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cIUK0aaMQW9BckdQbOlBTTsFDnO26gLO3lzd4SPHWNQ=; b=aFzU4DYpbTJDHpjDm4P9LbNxwd
	7qnc6zxlIeQRb5ButUU4M/EAIzK0Qt69xLr29dSd2UVqydfvaKa3Lcarj65EoSjbY0CCr5kxDRDkR
	xBgAAYzScM91IxdRzoLddWS7VNE1kiwfm51XVSuIUHEFYwFxej0Fbj2p8Qm0ebJ/1yOqqJAzz2lQ+
	zeZnwIWfJxQ4KGFVY1FCtM+qrPpx+DFm6z2+wvXhBbvM8YITonA3OsdkgMRfp9udqBxC4z1LU94nn
	kf+GzjxYSkp1E5Og9+p6kcAUUash863cnwG8mMNzHdCaCUtChsCDTo/psLc2VAHbOYbhQHN1vmkXn
	MlYsECaQ==;
Received: from [2001:4bb8:184:6215:7ee3:d0e9:131a:82ff] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDnbm-00DPct-9G; Wed, 11 Aug 2021 12:45:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Tao <houtao1@huawei.com>,
	syzbot+0fe7752e52337864d29b@syzkaller.appspotmail.com
Subject: [PATCH 1/6] nbd: do del_gendisk() asynchronously for NBD_DESTROY_ON_DISCONNECT
Date: Wed, 11 Aug 2021 14:44:23 +0200
Message-Id: <20210811124428.2368491-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811124428.2368491-1-hch@lst.de>
References: <20210811124428.2368491-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ay10HjxfWr.A.ROE.Yq8EhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1265
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210811124428.2368491-2-hch@lst.de
Resent-Date: Wed, 11 Aug 2021 13:03:20 +0000 (UTC)

From: Hou Tao <houtao1@huawei.com>

Now open_mutex is used to synchronize partition operations (e.g,
blk_drop_partitions() and blkdev_reread_part()), however it makes
nbd driver broken, because nbd may call del_gendisk() in nbd_release()
or nbd_genl_disconnect() if NBD_CFLAG_DESTROY_ON_DISCONNECT is enabled,
and deadlock occurs, as shown below:

// AB-BA dead-lock
nbd_genl_disconnect            blkdev_open
  nbd_disconnect_and_put
                                 lock bd_mutex
  // last ref
  nbd_put
    lock nbd_index_mutex
      del_gendisk
                                   nbd_open
                                     try lock nbd_index_mutex
        try lock bd_mutex

 or

// AA dead-lock
nbd_release
  lock bd_mutex
    nbd_put
      try lock bd_mutex

Instead of fixing block layer (e.g, introduce another lock), fixing
the nbd driver to call del_gendisk() in a kworker when
NBD_DESTROY_ON_DISCONNECT is enabled. When NBD_DESTROY_ON_DISCONNECT
is disabled, nbd device will always be destroy through module removal,
and there is no risky of deadlock.

To ensure the reuse of nbd index succeeds, moving the calling of
idr_remove() after del_gendisk(), so if the reused index is not found
in nbd_index_idr, the old disk must have been deleted. And reusing
the existing destroy_complete mechanism to ensure nbd_genl_connect()
will wait for the completion of del_gendisk().

Also adding a new workqueue for nbd removal, so nbd_cleanup()
can ensure all removals complete before exits.

Reported-by: syzbot+0fe7752e52337864d29b@syzkaller.appspotmail.com
Fixes: c76f48eb5c08 ("block: take bd_mutex around delete_partitions in del_gendisk")
Signed-off-by: Hou Tao <houtao1@huawei.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/nbd.c | 70 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 61 insertions(+), 9 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index c38317979f74..9a7c9a425ab0 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -49,6 +49,7 @@
 
 static DEFINE_IDR(nbd_index_idr);
 static DEFINE_MUTEX(nbd_index_mutex);
+static struct workqueue_struct *nbd_del_wq;
 static int nbd_total_devices = 0;
 
 struct nbd_sock {
@@ -113,6 +114,7 @@ struct nbd_device {
 	struct mutex config_lock;
 	struct gendisk *disk;
 	struct workqueue_struct *recv_workq;
+	struct work_struct remove_work;
 
 	struct list_head list;
 	struct task_struct *task_recv;
@@ -233,7 +235,7 @@ static const struct device_attribute backend_attr = {
 	.show = backend_show,
 };
 
-static void nbd_dev_remove(struct nbd_device *nbd)
+static void nbd_del_disk(struct nbd_device *nbd)
 {
 	struct gendisk *disk = nbd->disk;
 
@@ -242,24 +244,60 @@ static void nbd_dev_remove(struct nbd_device *nbd)
 		blk_cleanup_disk(disk);
 		blk_mq_free_tag_set(&nbd->tag_set);
 	}
+}
 
+/*
+ * Place this in the last just before the nbd is freed to
+ * make sure that the disk and the related kobject are also
+ * totally removed to avoid duplicate creation of the same
+ * one.
+ */
+static void nbd_notify_destroy_completion(struct nbd_device *nbd)
+{
+	if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags) &&
+	    nbd->destroy_complete)
+		complete(nbd->destroy_complete);
+}
+
+static void nbd_dev_remove_work(struct work_struct *work)
+{
+	struct nbd_device *nbd =
+		container_of(work, struct nbd_device, remove_work);
+
+	nbd_del_disk(nbd);
+
+	mutex_lock(&nbd_index_mutex);
 	/*
-	 * Place this in the last just before the nbd is freed to
-	 * make sure that the disk and the related kobject are also
-	 * totally removed to avoid duplicate creation of the same
-	 * one.
+	 * Remove from idr after del_gendisk() completes,
+	 * so if the same id is reused, the following
+	 * add_disk() will succeed.
 	 */
-	if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags) && nbd->destroy_complete)
-		complete(nbd->destroy_complete);
+	idr_remove(&nbd_index_idr, nbd->index);
+
+	nbd_notify_destroy_completion(nbd);
+	mutex_unlock(&nbd_index_mutex);
 
 	kfree(nbd);
 }
 
+static void nbd_dev_remove(struct nbd_device *nbd)
+{
+	/* Call del_gendisk() asynchrounously to prevent deadlock */
+	if (test_bit(NBD_DESTROY_ON_DISCONNECT, &nbd->flags)) {
+		queue_work(nbd_del_wq, &nbd->remove_work);
+		return;
+	}
+
+	nbd_del_disk(nbd);
+	idr_remove(&nbd_index_idr, nbd->index);
+	nbd_notify_destroy_completion(nbd);
+	kfree(nbd);
+}
+
 static void nbd_put(struct nbd_device *nbd)
 {
 	if (refcount_dec_and_mutex_lock(&nbd->refs,
 					&nbd_index_mutex)) {
-		idr_remove(&nbd_index_idr, nbd->index);
 		nbd_dev_remove(nbd);
 		mutex_unlock(&nbd_index_mutex);
 	}
@@ -1679,6 +1717,7 @@ static int nbd_dev_add(int index)
 	nbd->tag_set.flags = BLK_MQ_F_SHOULD_MERGE |
 		BLK_MQ_F_BLOCKING;
 	nbd->tag_set.driver_data = nbd;
+	INIT_WORK(&nbd->remove_work, nbd_dev_remove_work);
 	nbd->destroy_complete = NULL;
 	nbd->backend = NULL;
 
@@ -2416,7 +2455,14 @@ static int __init nbd_init(void)
 	if (register_blkdev(NBD_MAJOR, "nbd"))
 		return -EIO;
 
+	nbd_del_wq = alloc_workqueue("nbd-del", WQ_UNBOUND, 0);
+	if (!nbd_del_wq) {
+		unregister_blkdev(NBD_MAJOR, "nbd");
+		return -ENOMEM;
+	}
+
 	if (genl_register_family(&nbd_genl_family)) {
+		destroy_workqueue(nbd_del_wq);
 		unregister_blkdev(NBD_MAJOR, "nbd");
 		return -EINVAL;
 	}
@@ -2434,7 +2480,10 @@ static int nbd_exit_cb(int id, void *ptr, void *data)
 	struct list_head *list = (struct list_head *)data;
 	struct nbd_device *nbd = ptr;
 
-	list_add_tail(&nbd->list, list);
+	/* Skip nbd that is being removed asynchronously */
+	if (refcount_read(&nbd->refs))
+		list_add_tail(&nbd->list, list);
+
 	return 0;
 }
 
@@ -2457,6 +2506,9 @@ static void __exit nbd_cleanup(void)
 		nbd_put(nbd);
 	}
 
+	/* Also wait for nbd_dev_remove_work() completes */
+	destroy_workqueue(nbd_del_wq);
+
 	idr_destroy(&nbd_index_idr);
 	genl_unregister_family(&nbd_genl_family);
 	unregister_blkdev(NBD_MAJOR, "nbd");
-- 
2.30.2

