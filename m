Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PyLFlSSFWovWgcAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Tue, 26 May 2026 14:30:12 +0200
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 052E55D58F0
	for <lists+nbd@lfdr.de>; Tue, 26 May 2026 14:30:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A348920697; Tue, 26 May 2026 12:30:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 26 12:30:11 2026
Old-Return-Path: <yangerkun@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=4.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8A8B3204FF
	for <lists-other-nbd@bendel.debian.org>; Tue, 26 May 2026 12:14:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.051 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RrwtAsHHhk9x for <lists-other-nbd@bendel.debian.org>;
	Tue, 26 May 2026 12:14:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 944 seconds by postgrey-1.36 at bendel; Tue, 26 May 2026 12:14:11 UTC
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 33722204FD
	for <nbd@other.debian.org>; Tue, 26 May 2026 12:14:10 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gPrpX3XKWzYQv3v
	for <nbd@other.debian.org>; Tue, 26 May 2026 19:57:24 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 169394056B
	for <nbd@other.debian.org>; Tue, 26 May 2026 19:58:19 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP4 (Coremail) with SMTP id gCh0CgC3f1vTihVqw3fQDg--.30881S4;
	Tue, 26 May 2026 19:58:16 +0800 (CST)
From: Yang Erkun <yangerkun@huawei.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH] Revert "nbd: freeze the queue while we're adding connections"
Date: Tue, 26 May 2026 19:52:52 +0800
Message-ID: <20260526115253.746625-1-yangerkun@huawei.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgC3f1vTihVqw3fQDg--.30881S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy3tw1rAFWrJryDXry7Jrb_yoW5ZF48pF
	W3Gay7Gr4jvF48urs5ZayxXFyfAwnxK347W3y7J34SvrsxCa4Fva4IyayrWFy8JrWqqr47
	ZrW5Kw4vyw1UZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY64kExVAv
	wVAq07x20xyl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
	026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
	0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
	vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
	6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUz3kuDUUUU
Sender: yangerkun@huaweicloud.com
X-CM-SenderInfo: 51dqwvhunx0q5kxd4v5lfo033gof0z/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <95Zf8-RPmrP.A.JXhG.TJZFqB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3543
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260526115253.746625-1-yangerkun@huawei.com
Resent-Date: Tue, 26 May 2026 12:30:11 +0000 (UTC)
X-Spamd-Result: default: False [2.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : No valid SPF, No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:josef@toxicpanda.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:nbd@other.debian.org,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	FORGED_SENDER(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangerkun@huawei.com,bounce-nbd=lists@other.debian.org];
	NEURAL_HAM(-0.00)[-0.874];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Queue-Id: 052E55D58F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This reverts commit b98e762e3d71e893b221f871825dc64694cfb258.

Commit b98e762e3d71 ("nbd: freeze the queue while we're adding
connections") added blk_mq_freeze_queue/blk_mq_unfreeze_queue in
nbd_add_socket() to protect krealloc(config->socks) from concurrent I/O
that could cause a Use-After-Free.

However, analysis shows that in all current code paths, concurrent I/O
cannot actually reach nbd_add_socket():

1. nbd_genl_connect() path:
   nbd_add_socket() is called first, and nbd_start_device() -- which
   starts the queue and enables I/O -- is called only after all sockets
   have been added. So the freeze/unfreeze runs against an idle queue,
   marking then waiting on a percpu_ref that is already zero, and then
   resurrecting it -- a pure no-op that burns an RCU grace period per
   socket on multi-core systems.

2. nbd_ioctl(NBD_SET_SOCK) path:
   The task_setup check enforces that only the thread which performed
   the first NBD_SET_SOCK can call NBD_SET_SOCK again. That thread is
   blocked in NBD_DO_IT's wait_event_interruptible, so it cannot issue
   another NBD_SET_SOCK concurrently with I/O. Other threads are
   rejected by the task_setup != current check.

3. nbd_genl_reconfigure() does not call nbd_add_socket() at all; it
   uses nbd_reconnect_socket() which replaces a dead socket in-place
   without reallocating config->socks.

Therefore the freeze/unfreeze provides no actual protection in any
reachable code path, while imposing the cost of blk_mq_freeze_queue
(percpu_ref_kill + RCU grace period wait + percpu_ref_resurrect) on
every socket addition during device setup[1].

Revert the change to eliminate the unnecessary overhead.

Link: https://lore.kernel.org/all/20260327091223.4147956-1-leo.lilong@huaweicloud.com/ [1]
Signed-off-by: Yang Erkun <yangerkun@huawei.com>
---
 drivers/block/nbd.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index fe63f3c55d0d..9033d996c9a9 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1245,22 +1245,16 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	struct socket *sock;
 	struct nbd_sock **socks;
 	struct nbd_sock *nsock;
-	unsigned int memflags;
 	int err;
 
 	/* Arg will be cast to int, check it to avoid overflow */
 	if (arg > INT_MAX)
 		return -EINVAL;
+
 	sock = nbd_get_socket(nbd, arg, &err);
 	if (!sock)
 		return err;
 
-	/*
-	 * We need to make sure we don't get any errant requests while we're
-	 * reallocating the ->socks array.
-	 */
-	memflags = blk_mq_freeze_queue(nbd->disk->queue);
-
 	if (!netlink && !nbd->task_setup &&
 	    !test_bit(NBD_RT_BOUND, &config->runtime_flags))
 		nbd->task_setup = current;
@@ -1300,12 +1294,9 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	INIT_WORK(&nsock->work, nbd_pending_cmd_work);
 	socks[config->num_connections++] = nsock;
 	atomic_inc(&config->live_connections);
-	blk_mq_unfreeze_queue(nbd->disk->queue, memflags);
-
 	return 0;
 
 put_socket:
-	blk_mq_unfreeze_queue(nbd->disk->queue, memflags);
 	sockfd_put(sock);
 	return err;
 }
-- 
2.52.0

