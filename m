Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356D400B55
	for <lists+nbd@lfdr.de>; Sat,  4 Sep 2021 14:30:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id F169120D8A; Sat,  4 Sep 2021 12:30:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Sep  4 12:30:21 2021
Old-Return-Path: <houtao1@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9932320D26
	for <lists-other-nbd@bendel.debian.org>; Sat,  4 Sep 2021 12:12:45 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.281 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ZdZRxqP5vwvj for <lists-other-nbd@bendel.debian.org>;
	Sat,  4 Sep 2021 12:12:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga03-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 48DCD20D39
	for <nbd@other.debian.org>; Sat,  4 Sep 2021 12:12:40 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4H1tnj44jhz8spF;
	Sat,  4 Sep 2021 20:12:09 +0800 (CST)
Received: from dggpeml500025.china.huawei.com (7.185.36.35) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 4 Sep 2021 20:12:35 +0800
Received: from huawei.com (10.175.124.27) by dggpeml500025.china.huawei.com
 (7.185.36.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Sat, 4 Sep 2021
 20:12:34 +0800
From: Hou Tao <houtao1@huawei.com>
To: Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>,
	<linux-block@vger.kernel.org>
CC: <nbd@other.debian.org>, <hch@lst.de>, <houtao1@huawei.com>
Subject: [PATCH v2 1/3] nbd: use pr_err to output error message
Date: Sat, 4 Sep 2021 20:25:17 +0800
Message-ID: <20210904122519.1963983-2-houtao1@huawei.com>
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
Resent-Message-ID: <QhqNteHbHrJ.A.sYD.db2MhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1375
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210904122519.1963983-2-houtao1@huawei.com
Resent-Date: Sat,  4 Sep 2021 12:30:21 +0000 (UTC)

Instead of using the long printk(KERN_ERR "nbd: ...") to
output error message, defining pr_fmt and using
the short pr_err("") to do that. The replacemen is done
by using the following command:

  sed -i 's/printk(KERN_ERR "nbd: /pr_err("/g' \
		  drivers/block/nbd.c

Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 drivers/block/nbd.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5170a630778d..ef94f62895d6 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -44,6 +44,9 @@
 #include <linux/nbd-netlink.h>
 #include <net/genetlink.h>
 
+#undef pr_fmt
+#define pr_fmt(fmt) "nbd: " fmt
+
 #define CREATE_TRACE_POINTS
 #include <trace/events/nbd.h>
 
@@ -1854,11 +1857,11 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 	if (info->attrs[NBD_ATTR_INDEX])
 		index = nla_get_u32(info->attrs[NBD_ATTR_INDEX]);
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
@@ -1894,7 +1897,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 		nbd_put(nbd);
 		if (index == -1)
 			goto again;
-		printk(KERN_ERR "nbd: nbd%d already in use\n", index);
+		pr_err("nbd%d already in use\n", index);
 		return -EBUSY;
 	}
 	if (WARN_ON(nbd->config)) {
@@ -1906,7 +1909,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 	if (!nbd->config) {
 		mutex_unlock(&nbd->config_lock);
 		nbd_put(nbd);
-		printk(KERN_ERR "nbd: couldn't allocate config\n");
+		pr_err("nbd: couldn't allocate config\n");
 		return -ENOMEM;
 	}
 	refcount_set(&nbd->config_refs, 1);
@@ -1961,7 +1964,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 			struct nlattr *socks[NBD_SOCK_MAX+1];
 
 			if (nla_type(attr) != NBD_SOCK_ITEM) {
-				printk(KERN_ERR "nbd: socks must be embedded in a SOCK_ITEM attr\n");
+				pr_err("socks must be embedded in a SOCK_ITEM attr\n");
 				ret = -EINVAL;
 				goto out;
 			}
@@ -1970,7 +1973,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 							  nbd_sock_policy,
 							  info->extack);
 			if (ret != 0) {
-				printk(KERN_ERR "nbd: error processing sock list\n");
+				pr_err("error processing sock list\n");
 				ret = -EINVAL;
 				goto out;
 			}
@@ -2044,7 +2047,7 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
 		return -EPERM;
 
 	if (!info->attrs[NBD_ATTR_INDEX]) {
-		printk(KERN_ERR "nbd: must specify an index to disconnect\n");
+		pr_err("must specify an index to disconnect\n");
 		return -EINVAL;
 	}
 	index = nla_get_u32(info->attrs[NBD_ATTR_INDEX]);
@@ -2052,13 +2055,13 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
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
@@ -2084,7 +2087,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 		return -EPERM;
 
 	if (!info->attrs[NBD_ATTR_INDEX]) {
-		printk(KERN_ERR "nbd: must specify a device to reconfigure\n");
+		pr_err("must specify a device to reconfigure\n");
 		return -EINVAL;
 	}
 	index = nla_get_u32(info->attrs[NBD_ATTR_INDEX]);
@@ -2092,7 +2095,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	nbd = idr_find(&nbd_index_idr, index);
 	if (!nbd) {
 		mutex_unlock(&nbd_index_mutex);
-		printk(KERN_ERR "nbd: couldn't find a device at index %d\n",
+		pr_err("couldn't find a device at index %d\n",
 		       index);
 		return -EINVAL;
 	}
@@ -2114,7 +2117,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 	}
 	if (!refcount_inc_not_zero(&nbd->refs)) {
 		mutex_unlock(&nbd_index_mutex);
-		printk(KERN_ERR "nbd: device at index %d is going down\n",
+		pr_err("device at index %d is going down\n",
 		       index);
 		return -EINVAL;
 	}
@@ -2179,7 +2182,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 			struct nlattr *socks[NBD_SOCK_MAX+1];
 
 			if (nla_type(attr) != NBD_SOCK_ITEM) {
-				printk(KERN_ERR "nbd: socks must be embedded in a SOCK_ITEM attr\n");
+				pr_err("socks must be embedded in a SOCK_ITEM attr\n");
 				ret = -EINVAL;
 				goto out;
 			}
@@ -2188,7 +2191,7 @@ static int nbd_genl_reconfigure(struct sk_buff *skb, struct genl_info *info)
 							  nbd_sock_policy,
 							  info->extack);
 			if (ret != 0) {
-				printk(KERN_ERR "nbd: error processing sock list\n");
+				pr_err("error processing sock list\n");
 				ret = -EINVAL;
 				goto out;
 			}
@@ -2405,7 +2408,7 @@ static int __init nbd_init(void)
 	BUILD_BUG_ON(sizeof(struct nbd_request) != 28);
 
 	if (max_part < 0) {
-		printk(KERN_ERR "nbd: max_part must be >= 0\n");
+		pr_err("max_part must be >= 0\n");
 		return -EINVAL;
 	}
 
@@ -2478,7 +2481,7 @@ static void __exit nbd_cleanup(void)
 		nbd = list_first_entry(&del_list, struct nbd_device, list);
 		list_del_init(&nbd->list);
 		if (refcount_read(&nbd->refs) != 1)
-			printk(KERN_ERR "nbd: possibly leaking a device\n");
+			pr_err("possibly leaking a device\n");
 		nbd_put(nbd);
 	}
 
-- 
2.29.2

