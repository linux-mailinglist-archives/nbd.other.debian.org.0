Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C2774A976
	for <lists+nbd@lfdr.de>; Fri,  7 Jul 2023 05:51:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4045820503; Fri,  7 Jul 2023 03:51:26 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jul  7 03:51:26 2023
Old-Return-Path: <zhongjinghua@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,RDNS_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2A7E920543
	for <lists-other-nbd@bendel.debian.org>; Fri,  7 Jul 2023 03:36:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.097 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RDNS_NONE=0.793, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Pm6H48v9xc3O for <lists-other-nbd@bendel.debian.org>;
	Fri,  7 Jul 2023 03:35:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dggsgout12.his.huawei.com (unknown [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C38AD20541
	for <nbd@other.debian.org>; Fri,  7 Jul 2023 03:35:53 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Qxz9q4Vs2z4f3nyN
	for <nbd@other.debian.org>; Fri,  7 Jul 2023 11:18:07 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.127.227])
	by APP4 (Coremail) with SMTP id gCh0CgD3mp7vg6dk0X+NNQ--.406S7;
	Fri, 07 Jul 2023 11:18:09 +0800 (CST)
From: Zhong Jinghua <zhongjinghua@huaweicloud.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	zhongjinghua@huaweicloud.com,
	yi.zhang@huawei.com,
	yukuai3@huawei.com
Subject: [PATCH -next 3/3] nbd: fix null-ptr-dereference while accessing 'nbd->config'
Date: Fri,  7 Jul 2023 11:15:36 +0800
Message-Id: <20230707031536.666482-4-zhongjinghua@huaweicloud.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230707031536.666482-1-zhongjinghua@huaweicloud.com>
References: <20230707031536.666482-1-zhongjinghua@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgD3mp7vg6dk0X+NNQ--.406S7
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4kXF1fAr1fKry7Ar1UZFb_yoW8tryDpF
	4UAFy5G3yUJF43GFWkA348Wr15J3Z7AryxGry7G3s5Zr9xCrySyrykK34xXF1UAr9xJF45
	JFWrGa4IkFy8GFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9m14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
	0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU=
X-CM-SenderInfo: x2kr0wpmlqwxtxd6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8Fd-Dv4o9HF.A.zoD.-u4pkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2564
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230707031536.666482-4-zhongjinghua@huaweicloud.com
Resent-Date: Fri,  7 Jul 2023 03:51:26 +0000 (UTC)

From: Zhong Jinghua <zhongjinghua@huawei.com>

nbd->config = config and refcount_set(&nbd->config_refs, 1) in
nbd_genl_connect may be out of order, causing config_refs to be set to 1
first, and then nbd_open accessing nbd->config reports a null pointer
reference.
   T1                      T2
vfs_open
  do_dentry_open
    blkdev_open
      blkdev_get
        __blkdev_get
          nbd_open
           nbd_get_config_unlocked
                        genl_rcv_msg
                          genl_family_rcv_msg
                            genl_family_rcv_msg_doit
                              nbd_genl_connect
                                nbd_alloc_and_init_config
                                  // out of order execution
                                  refcount_set(&nbd->config_refs, 1); // 2
             nbd->config
             // null point
                                  nbd->config = config; // 1

Fix it by adding a cpu memory barrier to guarantee sequential execution.

Signed-off-by: Zhong Jinghua <zhongjinghua@huawei.com>
---
 drivers/block/nbd.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 7186a9a49445..c410cf29fb0c 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -395,8 +395,16 @@ static u32 req_to_nbd_cmd_type(struct request *req)
 
 static struct nbd_config *nbd_get_config_unlocked(struct nbd_device *nbd)
 {
-	if (refcount_inc_not_zero(&nbd->config_refs))
+	if (refcount_inc_not_zero(&nbd->config_refs)) {
+		/*
+		 * Add smp_mb__after_atomic to ensure that reading nbd->config_refs
+		 * and reading nbd->config is ordered. The pair is the barrier in
+		 * nbd_alloc_and_init_config(), avoid nbd->config_refs is set
+		 * before nbd->config.
+		 */
+		smp_mb__after_atomic();
 		return nbd->config;
+	}
 
 	return NULL;
 }
@@ -1555,7 +1563,15 @@ static int nbd_alloc_and_init_config(struct nbd_device *nbd)
 	init_waitqueue_head(&config->conn_wait);
 	config->blksize_bits = NBD_DEF_BLKSIZE_BITS;
 	atomic_set(&config->live_connections, 0);
+
 	nbd->config = config;
+	/*
+	 * Order refcount_set(&nbd->config_refs, 1) and nbd->config assignment,
+	 * its pair is the barrier in nbd_get_config_unlocked().
+	 * So nbd_get_config_unlocked() won't see nbd->config as null after
+	 * refcount_inc_not_zero() succeed.
+	 */
+	smp_mb__before_atomic();
 	refcount_set(&nbd->config_refs, 1);
 
 	return 0;
-- 
2.31.1

