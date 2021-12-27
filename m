Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0267647FB54
	for <lists+nbd@lfdr.de>; Mon, 27 Dec 2021 10:30:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B31612039C; Mon, 27 Dec 2021 09:30:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Dec 27 09:30:16 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,PHONENUMBER,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DAD79203B2
	for <lists-other-nbd@bendel.debian.org>; Mon, 27 Dec 2021 09:13:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.64 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02,
	MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NVQYaAy6AUgB for <lists-other-nbd@bendel.debian.org>;
	Mon, 27 Dec 2021 09:13:35 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pf1-x431.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4F2752039C
	for <nbd@other.debian.org>; Mon, 27 Dec 2021 09:13:34 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id k64so13180859pfd.11
        for <nbd@other.debian.org>; Mon, 27 Dec 2021 01:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RCiFLv0kUNDa03tFrYQemsW+z+Tyz2IxoYAt9DnOKgo=;
        b=JZz2X2wCV6kr4cbfiC68gk4fPdQuaT3HieyBTfs9Nezr1ZOF97TjqtH86WbA/F9eSZ
         VfsxK6RxCNgXl9kphiwr55ZLoh+B/PeeuxdIo6ROwbTI1Pcqk0xKEFUIeXtOfw+Uv+N2
         tUZbWL4AkFn2UQmhLBgI7lrXKRWE0eorrL92wqxkpurAECCAbciKuwIoc/mTT8I5qTAo
         QmsiAZVazVlBrU96MUp7sPY8YjjTQaTMnHYLf0+L7nM+FXBpjx6bg+OcglLp0Ta7ZINS
         p6YtbIQymKvk7xA6sK+hLTfvoHyHbj6OJY7D/k/tATfULDpSM5LGrjhtQdZgs88h1HE4
         pW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RCiFLv0kUNDa03tFrYQemsW+z+Tyz2IxoYAt9DnOKgo=;
        b=EMEA8Xl4pYfJaobfJt8SapnC3HFFyK4vczdOO0hW+sK7r3ak9CqD9zZbTKspFUFNls
         e7hiji9lXb1+pm35E0rZt2CgvjKoXDTpWE0h+1cuorNy1g97Q8GRFy7b4HA+oHbg9L57
         3vmjExTxx/IL586Cikw6njLyAI6yV2EdMZy0RFc3gs1yV5YLCLyQOl7fcdt2/kP1dvm1
         uPXUUd+1A5zBS/NedIUzI6ffhqCrvNKTtevMaGqVer3NXal9svJEgk7EL2vvsrEUqtzT
         dO3077mdL48CoWTC4tFLBYD2D1rQQqrEKhPUJcxmtpAoZtl/g7IQP/b+r8PlwQQZZYE1
         1OFA==
X-Gm-Message-State: AOAM530CQZA5vBESVNz4yewiBJJuAHfHMqXvN7uJmaqsj5h4+JhBCPI9
	tBJ0FNY4oIN64Jq+CfyBgTex
X-Google-Smtp-Source: ABdhPJzBwOKIBG/9l+UwCTnBnGxcV3N9ZcRK/acsoyWt6GozuvwQm7E9wV96lDiNs2KsPmJKetXZqw==
X-Received: by 2002:a63:8b4c:: with SMTP id j73mr14696480pge.81.1640596410606;
        Mon, 27 Dec 2021 01:13:30 -0800 (PST)
Received: from localhost ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id t4sm16377314pfj.168.2021.12.27.01.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 01:13:29 -0800 (PST)
From: Xie Yongji <xieyongji@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: bvanassche@acm.org,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] nbd: Don't use workqueue to handle recv work
Date: Mon, 27 Dec 2021 17:12:41 +0800
Message-Id: <20211227091241.103-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hutUuC79TRB.A.RXD.oeYyhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1663
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211227091241.103-1-xieyongji@bytedance.com
Resent-Date: Mon, 27 Dec 2021 09:30:16 +0000 (UTC)

The rescuer thread might take over the works queued on
the workqueue when the worker thread creation timed out.
If this happens, we have no chance to create multiple
recv threads which causes I/O hung on this nbd device.

To fix it, we can not simply remove the WQ_MEM_RECLAIM
flag since the recv work is in the memory reclaim path.
So this patch tries to create kthreads directly to
handle the recv work instead of using workqueue.

Fixes: 124d6db07c3b ("nbd: use our own workqueue for recv threads")
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/block/nbd.c | 95 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 56 insertions(+), 39 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5a1f98494ddd..e572d1dc20b4 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -63,7 +63,6 @@ struct nbd_sock {
 };
 
 struct recv_thread_args {
-	struct work_struct work;
 	struct nbd_device *nbd;
 	int index;
 };
@@ -97,6 +96,7 @@ struct nbd_config {
 
 	atomic_t recv_threads;
 	wait_queue_head_t recv_wq;
+	spinlock_t recv_lock;
 	unsigned int blksize_bits;
 	loff_t bytesize;
 #if IS_ENABLED(CONFIG_DEBUG_FS)
@@ -118,7 +118,6 @@ struct nbd_device {
 	struct nbd_config *config;
 	struct mutex config_lock;
 	struct gendisk *disk;
-	struct workqueue_struct *recv_workq;
 	struct work_struct remove_work;
 
 	struct list_head list;
@@ -260,7 +259,6 @@ static void nbd_dev_remove(struct nbd_device *nbd)
 	mutex_lock(&nbd_index_mutex);
 	idr_remove(&nbd_index_idr, nbd->index);
 	mutex_unlock(&nbd_index_mutex);
-	destroy_workqueue(nbd->recv_workq);
 	kfree(nbd);
 }
 
@@ -818,11 +816,19 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
 	return ret ? ERR_PTR(ret) : cmd;
 }
 
-static void recv_work(struct work_struct *work)
+static void flush_recv_works(struct nbd_device *nbd)
 {
-	struct recv_thread_args *args = container_of(work,
-						     struct recv_thread_args,
-						     work);
+	wait_event(nbd->config->recv_wq,
+		   atomic_read(&nbd->config->recv_threads) == 0);
+
+	/* Make sure recv threads have no reference to nbd->config */
+	spin_lock(&nbd->config->recv_lock);
+	spin_unlock(&nbd->config->recv_lock);
+}
+
+static int recv_work(void *data)
+{
+	struct recv_thread_args *args = (struct recv_thread_args *)data;
 	struct nbd_device *nbd = args->nbd;
 	struct nbd_config *config = nbd->config;
 	struct request_queue *q = nbd->disk->queue;
@@ -866,9 +872,14 @@ static void recv_work(struct work_struct *work)
 	mutex_unlock(&nsock->tx_lock);
 
 	nbd_config_put(nbd);
+
+	spin_lock(&config->recv_lock);
 	atomic_dec(&config->recv_threads);
 	wake_up(&config->recv_wq);
+	spin_unlock(&config->recv_lock);
 	kfree(args);
+
+	return 0;
 }
 
 static bool nbd_clear_req(struct request *req, void *data, bool reserved)
@@ -1176,6 +1187,7 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 
 	for (i = 0; i < config->num_connections; i++) {
 		struct nbd_sock *nsock = config->socks[i];
+		struct task_struct *worker;
 
 		if (!nsock->dead)
 			continue;
@@ -1185,6 +1197,14 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 			mutex_unlock(&nsock->tx_lock);
 			continue;
 		}
+		worker = kthread_create(recv_work, args, "knbd%d.%d-recv",
+					nbd->index, i);
+		if (!worker) {
+			sockfd_put(sock);
+			kfree(args);
+			return -ENOMEM;
+		}
+
 		sk_set_memalloc(sock->sk);
 		if (nbd->tag_set.timeout)
 			sock->sk->sk_sndtimeo = nbd->tag_set.timeout;
@@ -1194,7 +1214,6 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 		nsock->fallback_index = -1;
 		nsock->sock = sock;
 		nsock->dead = false;
-		INIT_WORK(&args->work, recv_work);
 		args->index = i;
 		args->nbd = nbd;
 		nsock->cookie++;
@@ -1206,7 +1225,7 @@ static int nbd_reconnect_socket(struct nbd_device *nbd, unsigned long arg)
 		/* We take the tx_mutex in an error path in the recv_work, so we
 		 * need to queue_work outside of the tx_mutex.
 		 */
-		queue_work(nbd->recv_workq, &args->work);
+		wake_up_process(worker);
 
 		atomic_inc(&config->live_connections);
 		wake_up(&config->conn_wait);
@@ -1359,34 +1378,42 @@ static int nbd_start_device(struct nbd_device *nbd)
 	nbd_dev_dbg_init(nbd);
 	for (i = 0; i < num_connections; i++) {
 		struct recv_thread_args *args;
+		struct task_struct *worker;
 
 		args = kzalloc(sizeof(*args), GFP_KERNEL);
-		if (!args) {
-			sock_shutdown(nbd);
-			/*
-			 * If num_connections is m (2 < m),
-			 * and NO.1 ~ NO.n(1 < n < m) kzallocs are successful.
-			 * But NO.(n + 1) failed. We still have n recv threads.
-			 * So, add flush_workqueue here to prevent recv threads
-			 * dropping the last config_refs and trying to destroy
-			 * the workqueue from inside the workqueue.
-			 */
-			if (i)
-				flush_workqueue(nbd->recv_workq);
-			return -ENOMEM;
+		if (!args)
+			goto err;
+
+		worker = kthread_create(recv_work, args, "knbd%d.%d-recv",
+					nbd->index, i);
+		if (!worker) {
+			kfree(args);
+			goto err;
 		}
+
 		sk_set_memalloc(config->socks[i]->sock->sk);
 		if (nbd->tag_set.timeout)
 			config->socks[i]->sock->sk->sk_sndtimeo =
 				nbd->tag_set.timeout;
 		atomic_inc(&config->recv_threads);
 		refcount_inc(&nbd->config_refs);
-		INIT_WORK(&args->work, recv_work);
 		args->nbd = nbd;
 		args->index = i;
-		queue_work(nbd->recv_workq, &args->work);
+		wake_up_process(worker);
 	}
 	return nbd_set_size(nbd, config->bytesize, nbd_blksize(config));
+err:
+	sock_shutdown(nbd);
+	/*
+	 * If num_connections is m (2 < m),
+	 * and NO.1 ~ NO.n(1 < n < m) connections are successful.
+	 * But NO.(n + 1) failed. We still have n recv threads.
+	 * So, add flush_recv_works here to prevent recv threads
+	 * dropping the last config_refs.
+	 */
+	flush_recv_works(nbd);
+
+	return -ENOMEM;
 }
 
 static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *bdev)
@@ -1405,7 +1432,7 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *b
 					 atomic_read(&config->recv_threads) == 0);
 	if (ret)
 		sock_shutdown(nbd);
-	flush_workqueue(nbd->recv_workq);
+	flush_recv_works(nbd);
 
 	mutex_lock(&nbd->config_lock);
 	nbd_bdev_reset(bdev);
@@ -1525,6 +1552,7 @@ static struct nbd_config *nbd_alloc_config(void)
 	atomic_set(&config->recv_threads, 0);
 	init_waitqueue_head(&config->recv_wq);
 	init_waitqueue_head(&config->conn_wait);
+	spin_lock_init(&config->recv_lock);
 	config->blksize_bits = NBD_DEF_BLKSIZE_BITS;
 	atomic_set(&config->live_connections, 0);
 	try_module_get(THIS_MODULE);
@@ -1769,15 +1797,6 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	}
 	nbd->disk = disk;
 
-	nbd->recv_workq = alloc_workqueue("nbd%d-recv",
-					  WQ_MEM_RECLAIM | WQ_HIGHPRI |
-					  WQ_UNBOUND, 0, nbd->index);
-	if (!nbd->recv_workq) {
-		dev_err(disk_to_dev(nbd->disk), "Could not allocate knbd recv work queue.\n");
-		err = -ENOMEM;
-		goto out_err_disk;
-	}
-
 	/*
 	 * Tell the block layer that we are not a rotational device
 	 */
@@ -1808,7 +1827,7 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	disk->first_minor = index << part_shift;
 	if (disk->first_minor < index || disk->first_minor > MINORMASK) {
 		err = -EINVAL;
-		goto out_free_work;
+		goto out_err_disk;
 	}
 
 	disk->minors = 1 << part_shift;
@@ -1817,7 +1836,7 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	sprintf(disk->disk_name, "nbd%d", index);
 	err = add_disk(disk);
 	if (err)
-		goto out_free_work;
+		goto out_err_disk;
 
 	/*
 	 * Now publish the device.
@@ -1826,8 +1845,6 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	nbd_total_devices++;
 	return nbd;
 
-out_free_work:
-	destroy_workqueue(nbd->recv_workq);
 out_err_disk:
 	blk_cleanup_disk(disk);
 out_free_idr:
@@ -2086,7 +2103,7 @@ static void nbd_disconnect_and_put(struct nbd_device *nbd)
 	 * Make sure recv thread has finished, we can safely call nbd_clear_que()
 	 * to cancel the inflight I/Os.
 	 */
-	flush_workqueue(nbd->recv_workq);
+	flush_recv_works(nbd);
 	nbd_clear_que(nbd);
 	nbd->task_setup = NULL;
 	mutex_unlock(&nbd->config_lock);
-- 
2.11.0

