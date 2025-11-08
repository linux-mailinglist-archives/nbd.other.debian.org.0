Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 01501C428E8
	for <lists+nbd@lfdr.de>; Sat, 08 Nov 2025 08:45:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 823A9204EB; Sat,  8 Nov 2025 07:45:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Nov  8 07:45:12 2025
Old-Return-Path: <zhengqixing@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=4.0 tests=RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8E57F204E9
	for <lists-other-nbd@bendel.debian.org>; Sat,  8 Nov 2025 07:29:51 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.698 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id hyjzFAN88FvK for <lists-other-nbd@bendel.debian.org>;
	Sat,  8 Nov 2025 07:29:44 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 1139 seconds by postgrey-1.36 at bendel; Sat, 08 Nov 2025 07:29:44 UTC
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 387B6204DE
	for <nbd@other.debian.org>; Sat,  8 Nov 2025 07:29:43 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4d3Rs35YzmzYQtxl
	for <nbd@other.debian.org>; Sat,  8 Nov 2025 15:10:15 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 1BE561A135D
	for <nbd@other.debian.org>; Sat,  8 Nov 2025 15:10:37 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.129])
	by APP2 (Coremail) with SMTP id Syh0CgAHZXvp7A5pbSoQAA--.5961S4;
	Sat, 08 Nov 2025 15:10:34 +0800 (CST)
From: Zheng Qixing <zhengqixing@huaweicloud.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk,
	xiubli@redhat.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	yi.zhang@huawei.com,
	yangerkun@huawei.com,
	houtao1@huawei.com,
	linan122@h-partners.com,
	zhengqixing@huawei.com
Subject: [PATCH] nbd: defer config put in recv_work
Date: Sat,  8 Nov 2025 15:02:02 +0800
Message-Id: <20251108070202.1816004-1-zhengqixing@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgAHZXvp7A5pbSoQAA--.5961S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJFykJw43Jw18tFyUAr1xuFg_yoW5CFWDpF
	WS9F4DKF48Wrn5CF4kX34UW34DGasFgr9rW3yxA34YyrWfA3yIyrsrK3WftF1UXr1kJ3yU
	ZrWrGa42ka15GFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
	rVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4
	IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x02
	62kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07UEZXOUUUUU=
X-CM-SenderInfo: x2kh0wptl0x03j6k3tpzhluzxrxghudrp/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <cTJ7V3Yja1E.A.v3mO.IUvDpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3466
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20251108070202.1816004-1-zhengqixing@huaweicloud.com
Resent-Date: Sat,  8 Nov 2025 07:45:12 +0000 (UTC)

From: Zheng Qixing <zhengqixing@huawei.com>

There is one uaf issue in recv_work when running NBD_CLEAR_SOCK and
NBD_CMD_RECONFIGURE:
  nbd_genl_connect     // conf_ref=2 (connect and recv_work A)
  nbd_open	       // conf_ref=3
  recv_work A done     // conf_ref=2
  NBD_CLEAR_SOCK       // conf_ref=1
  nbd_genl_reconfigure // conf_ref=2 (trigger recv_work B)
  close nbd	       // conf_ref=1
  recv_work B
    config_put         // conf_ref=0
    atomic_dec(&config->recv_threads); -> UAF

Or only running NBD_CLEAR_SOCK:
  nbd_genl_connect   // conf_ref=2
  nbd_open 	     // conf_ref=3
  NBD_CLEAR_SOCK     // conf_ref=2
  close nbd
    nbd_release
      config_put     // conf_ref=1
  recv_work
    config_put 	     // conf_ref=0
    atomic_dec(&config->recv_threads); -> UAF

Commit 87aac3a80af5 ("nbd: call nbd_config_put() before notifying the
waiter") moved nbd_config_put() to run before waking up the waiter in
recv_work, in order to ensure that nbd_start_device_ioctl() would not
be woken up while nbd->task_recv was still uncleared.

However, in nbd_start_device_ioctl(), after being woken up it explicitly
calls flush_workqueue() to make sure all current works are finished.
Therefore, there is no need to move the config put ahead of the wakeup.

Move nbd_config_put() to the end of recv_work, so that the reference is
held for the whole lifetime of the worker thread. This makes sure the
config cannot be freed while recv_work is still running, even if clear
+ reconfigure interleave.

In addition, we don't need to worry about recv_work dropping the last
nbd_put (which causes deadlock):

path A (netlink with NBD_CFLAG_DESTROY_ON_DISCONNECT):
  connect  // nbd_refs=1 (trigger recv_work)
  open nbd // nbd_refs=2
  NBD_CLEAR_SOCK
  close nbd
    nbd_release
      nbd_disconnect_and_put
        flush_workqueue // recv_work done
      nbd_config_put
        nbd_put // nbd_refs=1
      nbd_put // nbd_refs=0
        queue_work

path B (netlink without NBD_CFLAG_DESTROY_ON_DISCONNECT):
  connect  // nbd_refs=2 (trigger recv_work)
  open nbd // nbd_refs=3
  NBD_CLEAR_SOCK // conf_refs=2
  close nbd
    nbd_release
      nbd_config_put // conf_refs=1
      nbd_put // nbd_refs=2
  recv_work done // conf_refs=0, nbd_refs=1
  rmmod // nbd_refs=0

Reported-by: syzbot+56fbf4c7ddf65e95c7cc@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6907edce.a70a0220.37351b.0014.GAE@google.com/T/
Fixes: 87aac3a80af5 ("nbd: make the config put is called before the notifying the waiter")
Depends-on: e2daec488c57 ("nbd: Fix hungtask when nbd_config_put")
Signed-off-by: Zheng Qixing <zhengqixing@huawei.com>
---
 drivers/block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index a853c65ac65d..215fc18115b7 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1024,9 +1024,9 @@ static void recv_work(struct work_struct *work)
 	nbd_mark_nsock_dead(nbd, nsock, 1);
 	mutex_unlock(&nsock->tx_lock);
 
-	nbd_config_put(nbd);
 	atomic_dec(&config->recv_threads);
 	wake_up(&config->recv_wq);
+	nbd_config_put(nbd);
 	kfree(args);
 }
 
-- 
2.39.2

