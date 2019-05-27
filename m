Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 272692AE45
	for <lists+nbd@lfdr.de>; Mon, 27 May 2019 07:46:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DE15120411; Mon, 27 May 2019 05:46:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon May 27 05:46:26 2019
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=4.0 tests=DIGITS_LETTERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9208F2059D
	for <lists-other-nbd@bendel.debian.org>; Mon, 27 May 2019 05:46:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Lj938d9yWmRq for <lists-other-nbd@bendel.debian.org>;
	Mon, 27 May 2019 05:46:15 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D0B8B20411
	for <nbd@other.debian.org>; Mon, 27 May 2019 05:46:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22F1330820C9;
	Mon, 27 May 2019 05:46:11 +0000 (UTC)
Received: from rhel3.localdomain (ovpn-12-147.pek2.redhat.com [10.72.12.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30B5560C9B;
	Mon, 27 May 2019 05:46:07 +0000 (UTC)
From: xiubli@redhat.com
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	nbd@other.debian.org
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	atumball@redhat.com,
	Xiubo Li <xiubli@redhat.com>
Subject: [PATCH] nbd: fix crash when the blksize is zero
Date: Mon, 27 May 2019 13:44:38 +0800
Message-Id: <20190527054438.13548-1-xiubli@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 27 May 2019 05:46:11 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pRrLdF8c_7L.A.2SC.ym36cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/535
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190527054438.13548-1-xiubli@redhat.com
Resent-Date: Mon, 27 May 2019 05:46:26 +0000 (UTC)

From: Xiubo Li <xiubli@redhat.com>

This will allow the blksize to be set zero and then use 1024 as
default.

Signed-off-by: Xiubo Li <xiubli@redhat.com>
---
 drivers/block/nbd.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 053958a..4c1de1c 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -135,6 +135,8 @@ struct nbd_cmd {
 
 #define NBD_MAGIC 0x68797548
 
+#define NBD_DEF_BLKSIZE 1024
+
 static unsigned int nbds_max = 16;
 static int max_part = 16;
 static struct workqueue_struct *recv_workqueue;
@@ -1237,6 +1239,14 @@ static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
 		nbd_config_put(nbd);
 }
 
+static bool nbd_is_valid_blksize(unsigned long blksize)
+{
+	if (!blksize || !is_power_of_2(blksize) || blksize < 512 ||
+		blksize > PAGE_SIZE)
+		return false;
+	return true;
+}
+
 /* Must be called with config_lock held */
 static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 		       unsigned int cmd, unsigned long arg)
@@ -1252,8 +1262,9 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 	case NBD_SET_SOCK:
 		return nbd_add_socket(nbd, arg, false);
 	case NBD_SET_BLKSIZE:
-		if (!arg || !is_power_of_2(arg) || arg < 512 ||
-		    arg > PAGE_SIZE)
+		if (!arg)
+			arg = NBD_DEF_BLKSIZE;
+		if (!nbd_is_valid_blksize(arg))
 			return -EINVAL;
 		nbd_size_set(nbd, arg,
 			     div_s64(config->bytesize, arg));
@@ -1333,7 +1344,7 @@ static struct nbd_config *nbd_alloc_config(void)
 	atomic_set(&config->recv_threads, 0);
 	init_waitqueue_head(&config->recv_wq);
 	init_waitqueue_head(&config->conn_wait);
-	config->blksize = 1024;
+	config->blksize = NBD_DEF_BLKSIZE;
 	atomic_set(&config->live_connections, 0);
 	try_module_get(THIS_MODULE);
 	return config;
@@ -1769,6 +1780,10 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 	if (info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]) {
 		u64 bsize =
 			nla_get_u64(info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]);
+		if (!bsize)
+			bsize = NBD_DEF_BLKSIZE;
+		if (!nbd_is_valid_blksize(bsize))
+			return -EINVAL;
 		nbd_size_set(nbd, bsize, div64_u64(config->bytesize, bsize));
 	}
 	if (info->attrs[NBD_ATTR_TIMEOUT]) {
-- 
1.8.3.1

