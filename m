Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5EF7EDD4E
	for <lists+nbd@lfdr.de>; Thu, 16 Nov 2023 10:03:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8F5C320620; Thu, 16 Nov 2023 09:03:41 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov 16 09:03:41 2023
Old-Return-Path: <linan666@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=4.0 tests=DATE_IN_FUTURE_06_12,FOURLA,
	RCVD_IN_MSPIKE_H2,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id EBEBC20616
	for <lists-other-nbd@bendel.debian.org>; Thu, 16 Nov 2023 08:46:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.036 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DATE_IN_FUTURE_06_12=1.947, FOURLA=0.1,
	RCVD_IN_MSPIKE_H2=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fDhbQff748DJ for <lists-other-nbd@bendel.debian.org>;
	Thu, 16 Nov 2023 08:46:03 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 44A6420617
	for <nbd@other.debian.org>; Thu, 16 Nov 2023 08:46:03 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4SWCqd46l8z4f3lwP
	for <nbd@other.debian.org>; Thu, 16 Nov 2023 16:29:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 05DE91A016F
	for <nbd@other.debian.org>; Thu, 16 Nov 2023 16:29:03 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgCnqxHL0lVlgbRFBA--.19869S7;
	Thu, 16 Nov 2023 16:29:02 +0800 (CST)
From: linan666@huaweicloud.com
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	linan122@huawei.com,
	yukuai3@huawei.com,
	yi.zhang@huawei.com,
	houtao1@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH 3/3] nbd: fix null-ptr-dereference while accessing 'nbd->config'
Date: Fri, 17 Nov 2023 00:23:16 +0800
Message-Id: <20231116162316.1740402-4-linan666@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231116162316.1740402-1-linan666@huaweicloud.com>
References: <20231116162316.1740402-1-linan666@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgCnqxHL0lVlgbRFBA--.19869S7
X-Coremail-Antispam: 1UD129KBjvJXoWxJry3Ww1UurWDAF1kuryDJrb_yoW8ZF47pr
	45CF98G3yUJF43JFWDA348Wr15A3Z7AryxGryxG3s8Zr9rCryayr1kK343XFyUArnxJFW5
	JFWrGa4Ika4xG3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vEnII2IxkI6r1a6r45M2
	8IrcIa0xkI8VA2jI8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK
	0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4
	x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l
	84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcx
	kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxAIw28IcxkI7VAK
	I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0gJ57UUUUU==
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <tIIXfXYbP0J.A.I3E.trdVlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2673
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20231116162316.1740402-4-linan666@huaweicloud.com
Resent-Date: Thu, 16 Nov 2023 09:03:41 +0000 (UTC)

From: Li Nan <linan122@huawei.com>

Memory reordering may occur in nbd_genl_connect(), causing config_refs
to be set to 1 while nbd->config is still empty. Opening nbd at this
time will cause null-ptr-dereference.

   T1                      T2
   nbd_open
    nbd_get_config_unlocked
                 	   nbd_genl_connect
                 	    nbd_alloc_and_init_config
                 	     //memory reordered
                  	     refcount_set(&nbd->config_refs, 1)  // 2
     nbd->config
      ->null point
			     nbd->config = config  // 1

Fix it by adding smp barrier to guarantee the execution sequence.

Signed-off-by: Li Nan <linan122@huawei.com>
---
 drivers/block/nbd.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 1b9ee96d3b8a..03f387f1abb5 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -398,8 +398,16 @@ static u32 req_to_nbd_cmd_type(struct request *req)
 
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
@@ -1559,7 +1567,15 @@ static int nbd_alloc_and_init_config(struct nbd_device *nbd)
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
2.39.2

