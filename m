Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E00400B57
	for <lists+nbd@lfdr.de>; Sat,  4 Sep 2021 14:30:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 76CB320D89; Sat,  4 Sep 2021 12:30:44 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Sep  4 12:30:44 2021
Old-Return-Path: <houtao1@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 64A5220453
	for <lists-other-nbd@bendel.debian.org>; Sat,  4 Sep 2021 12:12:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.158 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 15j3jH8Ofprr for <lists-other-nbd@bendel.debian.org>;
	Sat,  4 Sep 2021 12:12:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga08-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 48EDF20D3F
	for <nbd@other.debian.org>; Sat,  4 Sep 2021 12:12:40 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4H1tnK4hCwz1DDrN;
	Sat,  4 Sep 2021 20:11:49 +0800 (CST)
Received: from dggpeml500025.china.huawei.com (7.185.36.35) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 4 Sep 2021 20:12:35 +0800
Received: from huawei.com (10.175.124.27) by dggpeml500025.china.huawei.com
 (7.185.36.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 4 Sep 2021
 20:12:35 +0800
From: Hou Tao <houtao1@huawei.com>
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>
CC: <nbd@other.debian.org>, <hch@lst.de>, <houtao1@huawei.com>
Subject: [PATCH v2 3/3] nbd: fix race between nbd_alloc_config() and module removal
Date: Sat, 4 Sep 2021 20:25:19 +0800
Message-ID: <20210904122519.1963983-4-houtao1@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210904122519.1963983-1-houtao1@huawei.com>
References: <20210904122519.1963983-1-houtao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500025.china.huawei.com (7.185.36.35)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nvNdHB7paTB.A.6cD.0b2MhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1377
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210904122519.1963983-4-houtao1@huawei.com
Resent-Date: Sat,  4 Sep 2021 12:30:44 +0000 (UTC)

When nbd module is being removing, nbd_alloc_config() may be
called concurrently by nbd_genl_connect(), although try_module_get()
will return false, but nbd_alloc_config() doesn't handle it.

The race may lead to the leak of nbd_config and its related
resources (e.g, recv_workq) and oops in nbd_read_stat() due
to the unload of nbd module as shown below:

  BUG: kernel NULL pointer dereference, address: 0000000000000040
  Oops: 0000 [#1] SMP PTI
  CPU: 5 PID: 13840 Comm: kworker/u17:33 Not tainted 5.14.0+ #1
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
  Workqueue: knbd16-recv recv_work [nbd]
  RIP: 0010:nbd_read_stat.cold+0x130/0x1a4 [nbd]
  Call Trace:
   recv_work+0x3b/0xb0 [nbd]
   process_one_work+0x1ed/0x390
   worker_thread+0x4a/0x3d0
   kthread+0x12a/0x150
   ret_from_fork+0x22/0x30

Fixing it by checking the return value of try_module_get()
in nbd_alloc_config(). As nbd_alloc_config() may return ERR_PTR(-ENODEV),
assign nbd->config only when nbd_alloc_config() succeeds to ensure
the value of nbd->config is binary (valid or NULL).

Also adding a debug message to check the reference counter
of nbd_config during module removal.

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 drivers/block/nbd.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index cedd3648e1a7..fa6c069b79dc 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1473,15 +1473,20 @@ static struct nbd_config *nbd_alloc_config(void)
 {
 	struct nbd_config *config;
 
+	if (!try_module_get(THIS_MODULE))
+		return ERR_PTR(-ENODEV);
+
 	config = kzalloc(sizeof(struct nbd_config), GFP_NOFS);
-	if (!config)
-		return NULL;
+	if (!config) {
+		module_put(THIS_MODULE);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	atomic_set(&config->recv_threads, 0);
 	init_waitqueue_head(&config->recv_wq);
 	init_waitqueue_head(&config->conn_wait);
 	config->blksize = NBD_DEF_BLKSIZE;
 	atomic_set(&config->live_connections, 0);
-	try_module_get(THIS_MODULE);
 	return config;
 }
 
@@ -1508,12 +1513,13 @@ static int nbd_open(struct block_device *bdev, fmode_t mode)
 			mutex_unlock(&nbd->config_lock);
 			goto out;
 		}
-		config = nbd->config = nbd_alloc_config();
-		if (!config) {
-			ret = -ENOMEM;
+		config = nbd_alloc_config();
+		if (IS_ERR(config)) {
+			ret = PTR_ERR(config);
 			mutex_unlock(&nbd->config_lock);
 			goto out;
 		}
+		nbd->config = config;
 		refcount_set(&nbd->config_refs, 1);
 		refcount_inc(&nbd->refs);
 		mutex_unlock(&nbd->config_lock);
@@ -1905,13 +1911,14 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 		nbd_put(nbd);
 		return -EINVAL;
 	}
-	config = nbd->config = nbd_alloc_config();
-	if (!nbd->config) {
+	config = nbd_alloc_config();
+	if (IS_ERR(config)) {
 		mutex_unlock(&nbd->config_lock);
 		nbd_put(nbd);
 		pr_err("nbd: couldn't allocate config\n");
-		return -ENOMEM;
+		return PTR_ERR(config);
 	}
+	nbd->config = config;
 	refcount_set(&nbd->config_refs, 1);
 	set_bit(NBD_RT_BOUND, &config->runtime_flags);
 
@@ -2486,6 +2493,9 @@ static void __exit nbd_cleanup(void)
 	while (!list_empty(&del_list)) {
 		nbd = list_first_entry(&del_list, struct nbd_device, list);
 		list_del_init(&nbd->list);
+		if (refcount_read(&nbd->config_refs))
+			pr_err("possibly leaking nbd_config (ref %d)\n",
+			       refcount_read(&nbd->config_refs));
 		if (refcount_read(&nbd->refs) != 1)
 			pr_err("possibly leaking a device\n");
 		nbd_put(nbd);
-- 
2.29.2

