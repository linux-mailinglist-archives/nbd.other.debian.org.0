Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD9150FF04
	for <lists+nbd@lfdr.de>; Tue, 26 Apr 2022 15:27:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8A784203A8; Tue, 26 Apr 2022 13:27:47 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Apr 26 13:27:47 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8CF52203CA
	for <lists-other-nbd@bendel.debian.org>; Tue, 26 Apr 2022 13:11:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.29 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ECG6v3W_WtHr for <lists-other-nbd@bendel.debian.org>;
	Tue, 26 Apr 2022 13:11:28 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2EDF820342
	for <nbd@other.debian.org>; Tue, 26 Apr 2022 13:11:28 +0000 (UTC)
Received: from kwepemi100023.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KnhdJ1r9yzhYmK;
	Tue, 26 Apr 2022 20:53:24 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 kwepemi100023.china.huawei.com (7.221.188.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 20:53:36 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600009.china.huawei.com
 (7.193.23.164) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 26 Apr
 2022 20:53:35 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH -next 6/6] nbd: use pr_err to output error message
Date: Tue, 26 Apr 2022 21:07:46 +0800
Message-ID: <20220426130746.885140-7-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220426130746.885140-1-yukuai3@huawei.com>
References: <20220426130746.885140-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_EyoMpTwHkI.A.8cE.TN_ZiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2052
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220426130746.885140-7-yukuai3@huawei.com
Resent-Date: Tue, 26 Apr 2022 13:27:47 +0000 (UTC)

Instead of using the long printk(KERN_ERR "nbd: ...") to
output error message, defining pr_fmt and using
the short pr_err("") to do that. The replacemen is done
by using the following command:

  sed -i 's/printk(KERN_ERR "nbd: /pr_err("/g' \
		  drivers/block/nbd.c

Signed-off-by: Hou Tao <houtao1@huawei.com>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/nbd.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 566aabcaff51..8d15a9d929c7 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1930,16 +1930,16 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 		 * MKDEV() expect that the max bits of first_minor is 20.
 		 */
 		if (index < 0 || index > MINORMASK >> part_shift) {
-			printk(KERN_ERR "nbd: illegal input index %d\n", index);
+			pr_err("illegal input index %d\n", index);
 			return -EINVAL;
 		}
 	}
 	if (!info->attrs[NBD_ATTR_SOCKETS]) {
-		printk(KERN_ERR "nbd: must specify at least one socket\n");
+		pr_err("must specify at least one socket\n");
 		return -EINVAL;
 	}
 	if (!info->attrs[NBD_ATTR_SIZE_BYTES]) {
-		printk(KERN_ERR "nbd: must specify a size in bytes for the device\n");
+		pr_err("must specify a size in bytes for the device\n");
 		return -EINVAL;
 	}
 again:
@@ -1975,7 +1975,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 		nbd_put(nbd);
 		if (index == -1)
 			goto again;
-		printk(KERN_ERR "nbd: nbd%d already in use\n", index);
+		pr_err("nbd%d already in use\n", index);
 		return -EBUSY;
 	}
 	if (WARN_ON(nbd->config)) {
@@ -1987,7 +1987,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 	if (IS_ERR(config)) {
 		mutex_unlock(&nbd->config_lock);
 		nbd_put(nbd);
-		printk(KERN_ERR "nbd: couldn't allocate config\n");
+		pr_err("couldn't allocate config\n");
 		return PTR_ERR(config);
 	}
 	nbd->config = config;
@@ -2043,7 +2043,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 			struct nlattr *socks[NBD_SOCK_MAX+1];
 
 			if (nla_type(attr) != NBD_SOCK_ITEM) {
-				printk(KERN_ERR "nbd: socks must be embedded in a SOCK_ITEM attr\n");
+				pr_err("socks must be embedded in a SOCK_ITEM attr\n");
 				ret = -EINVAL;
 				goto out;
 			}
@@ -2052,7 +2052,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 							  nbd_sock_policy,
 							  info->extack);
 			if (ret != 0) {
-				printk(KERN_ERR "nbd: error processing sock list\n");
+				pr_err("error processing sock list\n");
 				ret = -EINVAL;
 				goto out;
 			}
@@ -2123,7 +2123,7 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
 		return -EPERM;
 
 	if (!info->attrs[NBD_ATTR_INDEX]) {
-		printk(KERN_ERR "nbd: must specify an index to disconnect\n");
+		pr_err("must specify an index to disconnect\n");
 		return -EINVAL;
 	}
 	index = nla_get_u32(info->attrs[NBD_ATTR_INDEX]);
@@ -2131,13 +2131,13 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
 	nbd = idr_find(&nbd_index_idr, index);
 	if (!nbd) {
 		mutex_unlock(&nbd_index_mutex);
-		printk(KERN_ERR "nbd: couldn't find device at index %d\n",
+		pr_err("couldn't find device at index %d\n",
 		       index);
 		return -EINVAL;
 	}
 	if (!refcount_inc_not_zero(&nbd->refs)) {
 		mutex_unlock(&nbd_index_mutex);
-		printk(KERN_ERR "nbd: device at index %d is going down\n",
+		pr_err("device at index %d is going down\n",
 		       index);
 		return -EINVAL;
 	}
@@ -2163,7 +2163,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 		return -EPERM;
 
 	if (!info->attrs[NBD_ATTR_INDEX]) {
-		printk(KERN_ERR "nbd: must specify a device to reconfigure\n");
+		pr_err("must specify a device to reconfigure\n");
 		return -EINVAL;
 	}
 	index = nla_get_u32(info->attrs[NBD_ATTR_INDEX]);
@@ -2171,7 +2171,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	nbd = idr_find(&nbd_index_idr, index);
 	if (!nbd) {
 		mutex_unlock(&nbd_index_mutex);
-		printk(KERN_ERR "nbd: couldn't find a device at index %d\n",
+		pr_err("couldn't find a device at index %d\n",
 		       index);
 		return -EINVAL;
 	}
@@ -2193,7 +2193,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	}
 	if (!refcount_inc_not_zero(&nbd->refs)) {
 		mutex_unlock(&nbd_index_mutex);
-		printk(KERN_ERR "nbd: device at index %d is going down\n",
+		pr_err("device at index %d is going down\n",
 		       index);
 		return -EINVAL;
 	}
@@ -2258,7 +2258,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 			struct nlattr *socks[NBD_SOCK_MAX+1];
 
 			if (nla_type(attr) != NBD_SOCK_ITEM) {
-				printk(KERN_ERR "nbd: socks must be embedded in a SOCK_ITEM attr\n");
+				pr_err("socks must be embedded in a SOCK_ITEM attr\n");
 				ret = -EINVAL;
 				goto out;
 			}
@@ -2267,7 +2267,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 							  nbd_sock_policy,
 							  info->extack);
 			if (ret != 0) {
-				printk(KERN_ERR "nbd: error processing sock list\n");
+				pr_err("error processing sock list\n");
 				ret = -EINVAL;
 				goto out;
 			}
@@ -2484,7 +2484,7 @@ static int __init nbd_init(void)
 	BUILD_BUG_ON(sizeof(struct nbd_request) != 28);
 
 	if (max_part < 0) {
-		printk(KERN_ERR "nbd: max_part must be >= 0\n");
+		pr_err("max_part must be >= 0\n");
 		return -EINVAL;
 	}
 
@@ -2563,10 +2563,10 @@ static void __exit nbd_cleanup(void)
 		nbd = list_first_entry(&del_list, struct nbd_device, list);
 		list_del_init(&nbd->list);
 		if (refcount_read(&nbd->config_refs))
-			printk(KERN_ERR "nbd: possibly leaking nbd_config (ref %d)\n",
+			pr_err("possibly leaking nbd_config (ref %d)\n",
 					refcount_read(&nbd->config_refs));
 		if (refcount_read(&nbd->refs) != 1)
-			printk(KERN_ERR "nbd: possibly leaking a device\n");
+			pr_err("possibly leaking a device\n");
 		nbd_put(nbd);
 	}
 
-- 
2.31.1

