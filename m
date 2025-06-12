Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 19335AD72FC
	for <lists+nbd@lfdr.de>; Thu, 12 Jun 2025 16:03:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EA02520593; Thu, 12 Jun 2025 14:03:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 12 14:03:10 2025
Old-Return-Path: <zhengqixing@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=4.0 tests=FOURLA,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5A7B12058B
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Jun 2025 13:46:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.198 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Yf1bqiUDmQ7B for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Jun 2025 13:46:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 985 seconds by postgrey-1.36 at bendel; Thu, 12 Jun 2025 13:46:35 UTC
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 5621B2058A
	for <nbd@other.debian.org>; Thu, 12 Jun 2025 13:46:35 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bJ3L355cJzYQvLf
	for <nbd@other.debian.org>; Thu, 12 Jun 2025 21:30:03 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id AFB421A0E4B
	for <nbd@other.debian.org>; Thu, 12 Jun 2025 21:30:02 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP4 (Coremail) with SMTP id gCh0CgBXul5Z1kpoBZgwPQ--.19631S4;
	Thu, 12 Jun 2025 21:30:02 +0800 (CST)
From: Zheng Qixing <zhengqixing@huaweicloud.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	xiubli@redhat.com,
	prasanna.kalever@redhat.com,
	ming.lei@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	yukuai3@huawei.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com,
	zhengqixing@huawei.com
Subject: [PATCH] nbd: fix uaf in nbd_genl_connect() error path
Date: Thu, 12 Jun 2025 21:24:05 +0800
Message-Id: <20250612132405.364904-1-zhengqixing@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgBXul5Z1kpoBZgwPQ--.19631S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGFWktw4ktr4Uuw4DZry5urg_yoW5ZF18pF
	sxGFZ7CrW8ua40gFWkAw18ZFy5t3W5Xry7Kr97Gw1YvryfAr4j9F9YkF90qF98KryrCF9r
	AF1qqry8KF1UGrDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU0rhL5UUUUU==
X-CM-SenderInfo: x2kh0wptl0x03j6k3tpzhluzxrxghudrp/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <kt5ZBFlMVrH.A.uB3G.e4tSoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3388
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20250612132405.364904-1-zhengqixing@huaweicloud.com
Resent-Date: Thu, 12 Jun 2025 14:03:10 +0000 (UTC)

From: Zheng Qixing <zhengqixing@huawei.com>

There is a use-after-free issue in nbd:

block nbd6: Receive control failed (result -104)
block nbd6: shutting down sockets
==================================================================
BUG: KASAN: slab-use-after-free in recv_work+0x694/0xa80 drivers/block/nbd.c:1022
Write of size 4 at addr ffff8880295de478 by task kworker/u33:0/67

CPU: 2 UID: 0 PID: 67 Comm: kworker/u33:0 Not tainted 6.15.0-rc5-syzkaller-00123-g2c89c1b655c0 #0 PREEMPT(full)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: nbd6-recv recv_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xc3/0x670 mm/kasan/report.c:521
 kasan_report+0xe0/0x110 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0xef/0x1a0 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
 recv_work+0x694/0xa80 drivers/block/nbd.c:1022
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

nbd_genl_connect() does not properly stop the device on certain
error paths after nbd_start_device() has been called. This causes
the error path to put nbd->config while recv_work continue to use
the config after putting it, leading to use-after-free in recv_work.

This patch moves nbd_start_device() after the backend file creation.

Reported-by: syzbot+48240bab47e705c53126@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/68227a04.050a0220.f2294.00b5.GAE@google.com/T/
Fixes: 6497ef8df568 ("nbd: provide a way for userspace processes to identify device backends")
Signed-off-by: Zheng Qixing <zhengqixing@huawei.com>
---
 drivers/block/nbd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 7bdc7eb808ea..2592bd19ebc1 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2198,9 +2198,7 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 				goto out;
 		}
 	}
-	ret = nbd_start_device(nbd);
-	if (ret)
-		goto out;
+
 	if (info->attrs[NBD_ATTR_BACKEND_IDENTIFIER]) {
 		nbd->backend = nla_strdup(info->attrs[NBD_ATTR_BACKEND_IDENTIFIER],
 					  GFP_KERNEL);
@@ -2216,6 +2214,8 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
 		goto out;
 	}
 	set_bit(NBD_RT_HAS_BACKEND_FILE, &config->runtime_flags);
+
+	ret = nbd_start_device(nbd);
 out:
 	mutex_unlock(&nbd->config_lock);
 	if (!ret) {
-- 
2.39.2

