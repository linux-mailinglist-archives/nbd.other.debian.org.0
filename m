Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C847A9C7
	for <lists+nbd@lfdr.de>; Mon, 20 Dec 2021 13:39:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A9776202E4; Mon, 20 Dec 2021 12:39:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Dec 20 12:39:10 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,PHONENUMBER,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 67C5F202CD
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 Dec 2021 12:23:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.64 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, FVGT_m_MULTI_ODD=0.02,
	MURPHY_DRUGS_REL8=0.02, PHONENUMBER=1.5, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id XZw65XZqZYNF for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 Dec 2021 12:23:18 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pj1-x1035.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 47AC2202C3
	for <nbd@other.debian.org>; Mon, 20 Dec 2021 12:23:14 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id n15-20020a17090a160f00b001a75089daa3so12712137pja.1
        for <nbd@other.debian.org>; Mon, 20 Dec 2021 04:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lsgIL1tDtOBFrpOspcS2K2I6OHy7UCaW1Rph+orChAs=;
        b=GXO6ig5L1U27xWqp0VUQcsmGEsk1G6nBK9/KrDH8zpUWvR3CW7T0qExr2heJCnrv1t
         jScBMnJKJJ2/C6tYDb8SGcwXPvpsSGJw8gxyr7+3dQhQsbcq+p7Xzs4lpxbSH4sijvjS
         R/PFxmtcMKd+wWEo2Abytjo5M+aSqSHLE8zuwshbmsMyzyWLS7veie4rECCRN6ghCS6K
         V5o8ogAULtggJ451Y+vTfVj9MsraxHGhQj0DQzNPHva2kJ9Q85g6ISvo+IosDkciaNJr
         KEuc6Jv1lIOHHo0XJ9sRYkyhjLDdBn88p1e5nXBrfOKWX8hjdcX8f6GF2ygSSwMHj53P
         YP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lsgIL1tDtOBFrpOspcS2K2I6OHy7UCaW1Rph+orChAs=;
        b=3dWNTif0U/NVso62nx1ZdBGPWIfFoPatHSWqZm5YaIDZV2pjdc7rQLAgo9vIDVcLOj
         llAI66dALGymNHFhPAOaCFo4WiV80TzKGt6WPjskN4/K/feMV711BvPduSA6uSVhEFCG
         VJhJgGrlnIyLa6BEgoWzY6sboEaSCYKpsOE8nl325eT8lgfVDseO+sqf0aBAF+3Fe5fy
         XYPJcP/QNXXuHbs/vEsowzH9fJENd1zotoGfH97SaFpY7ju6JU3oBlX9XwxWHQxdLy/x
         t0bH95Fr67sBmb26wJgnz2Fw6jqbG/TXfN/fatAmdJj4qD1DPpi9D335dG7MOejys1hk
         ZImA==
X-Gm-Message-State: AOAM530/dVDz1CRXEFR0PWHLdrNUQG2ZJsYva5AoqHECs2K0js1+KMrj
	JJ0ljlvZ4+Lw161NGhmtwBXs
X-Google-Smtp-Source: ABdhPJzHl5RE3y85EcZXnrvWRI5P8OiaYQAkte8wCBy6l7L9SzAGXn28+KrNbDnNbqw7JaJIOr7zSw==
X-Received: by 2002:a17:902:c60b:b0:149:2afe:489f with SMTP id r11-20020a170902c60b00b001492afe489fmr109271plr.104.1640002991024;
        Mon, 20 Dec 2021 04:23:11 -0800 (PST)
Received: from localhost ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id s4sm12994731pjg.54.2021.12.20.04.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 04:23:10 -0800 (PST)
From: Xie Yongji <xieyongji@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nbd: Don't use workqueue to handle recv work
Date: Mon, 20 Dec 2021 20:22:41 +0800
Message-Id: <20211220122241.150-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rp3djlMA8oI.A.VNG.ulHwhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1659
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20211220122241.150-1-xieyongji@bytedance.com
Resent-Date: Mon, 20 Dec 2021 12:39:10 +0000 (UTC)

The rescuer thread might take over the works queued on
the workqueue when the worker thread creation timed out.
If this happens, we have no chance to create multiple
recv threads which causes I/O hung on this nbd device.

To fix it, this tries to create kthreads directly to
handle the recv work instead of using workqueue.

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

