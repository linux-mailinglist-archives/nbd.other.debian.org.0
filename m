Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE494E7EB9
	for <lists+nbd@lfdr.de>; Sat, 26 Mar 2022 04:09:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C3845205A4; Sat, 26 Mar 2022 03:09:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Mar 26 03:09:09 2022
Old-Return-Path: <penguin-kernel@I-love.SAKURA.ne.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B8A2020540
	for <lists-other-nbd@bendel.debian.org>; Sat, 26 Mar 2022 02:53:03 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.991 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iocVmO9ruZGW for <lists-other-nbd@bendel.debian.org>;
	Sat, 26 Mar 2022 02:52:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4A5EB203CA
	for <nbd@other.debian.org>; Sat, 26 Mar 2022 02:52:56 +0000 (UTC)
Received: from fsav312.sakura.ne.jp (fsav312.sakura.ne.jp [153.120.85.143])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 22Q2qaEv006264;
	Sat, 26 Mar 2022 11:52:36 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav312.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav312.sakura.ne.jp);
 Sat, 26 Mar 2022 11:52:36 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav312.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 22Q2qaQI006261
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 26 Mar 2022 11:52:36 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <03628e13-ca56-4ed0-da5a-ee698c83f48d@I-love.SAKURA.ne.jp>
Date: Sat, 26 Mar 2022 11:52:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 13/14] loop: remove lo_refcount and avoid lo_mutex in
 ->open / ->release
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        Josef Bacik <josef@toxicpanda.com>, Minchan Kim <minchan@kernel.org>,
        Nitin Gupta <ngupta@vflare.org>
Cc: Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
        Ming Lei <ming.lei@redhat.com>, Matteo Croce <mcroce@microsoft.com>,
        linux-block@vger.kernel.org, nbd@other.debian.org
References: <20220325063929.1773899-1-hch@lst.de>
 <20220325063929.1773899-14-hch@lst.de>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20220325063929.1773899-14-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <G2ENQUWY9SP.A.H6B.VPoPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1813
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/03628e13-ca56-4ed0-da5a-ee698c83f48d@I-love.SAKURA.ne.jp
Resent-Date: Sat, 26 Mar 2022 03:09:09 +0000 (UTC)

Since __loop_clr_fd() is currently holding loop_validate_mutex and lo->lo_mutex,
"avoid lo_mutex in ->release" part is incomplete.

The intent of holding loop_validate_mutex (which causes disk->open_mutex =>
loop_validate_mutex => lo->lo_mutex => blk_mq_freeze_queue()/blk_mq_unfreeze_queue()
chain) is to make loop_validate_file() traversal safe.

Since ->release is called with disk->open_mutex held, and __loop_clr_fd() from
lo_release() is called via ->release when disk_openers() == 0, we are guaranteed
that "struct file" which will be passed to loop_validate_file() via fget() cannot
be the loop device __loop_clr_fd(lo, true) will clear. Thus, there is no need to
hold loop_validate_mutex and lo->lo_mutex from __loop_clr_fd() if release == true.

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 2506193a4fd1..d47f3d86dd55 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1136,25 +1136,26 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
 	gfp_t gfp = lo->old_gfp_mask;
 
 	/*
-	 * Flush loop_configure() and loop_change_fd(). It is acceptable for
-	 * loop_validate_file() to succeed, for actual clear operation has not
-	 * started yet.
-	 */
-	mutex_lock(&loop_validate_mutex);
-	mutex_unlock(&loop_validate_mutex);
-	/*
-	 * loop_validate_file() now fails because l->lo_state != Lo_bound
-	 * became visible.
+	 * Make sure that Lo_rundown state becomes visible to loop_configure()
+	 * and loop_change_fd(). When called from ->release, we are guaranteed
+	 * that the "struct file" which loop_configure()/loop_change_fd() found
+	 * via fget() is not this loop device.
 	 */
+	if (!release) {
+		mutex_lock(&loop_validate_mutex);
+		mutex_unlock(&loop_validate_mutex);
+	}
 
 	/*
-	 * Since this function is called upon "ioctl(LOOP_CLR_FD)" xor "close()
-	 * after ioctl(LOOP_CLR_FD)", it is a sign of something going wrong if
-	 * lo->lo_state has changed while waiting for lo->lo_mutex.
+	 * It is a sign of something going wrong if lo->lo_state has changed
+	 * while waiting for lo->lo_mutex. When called from ->release, we are
+	 * guaranteed that the nobody is using this loop device.
 	 */
-	mutex_lock(&lo->lo_mutex);
-	BUG_ON(lo->lo_state != Lo_rundown);
-	mutex_unlock(&lo->lo_mutex);
+	if (!release) {
+		mutex_lock(&lo->lo_mutex);
+		BUG_ON(lo->lo_state != Lo_rundown);
+		mutex_unlock(&lo->lo_mutex);
+	}
 
 	if (test_bit(QUEUE_FLAG_WC, &lo->lo_queue->queue_flags))
 		blk_queue_write_cache(lo->lo_queue, false, false);

But thinking again about release == false case, which I wrote "It is acceptable
for loop_validate_file() to succeed, for actual clear operation has not started
yet.", I came to feel why it is acceptable to succeed.

Even if loop_validate_file() was safely traversed due to serialization via
loop_validate_mutex, I/O requests after loop_configure()/loop_change_fd() completed
will fail. Is this behavior what we want?

If we don't want I/O requests after loop_configure()/loop_change_fd() completed
fail due to __loop_clr_fd(), it is not acceptable for loop_validate_file() to
succeed. We should hold loop_validate_mutex before setting Lo_rundown in order to
make sure that loop_validate_file() will see Lo_rundown state. That is, something
like below will be expected?

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 2506193a4fd1..a4ff94ca654f 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1135,27 +1135,6 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
 	struct file *filp;
 	gfp_t gfp = lo->old_gfp_mask;
 
-	/*
-	 * Flush loop_configure() and loop_change_fd(). It is acceptable for
-	 * loop_validate_file() to succeed, for actual clear operation has not
-	 * started yet.
-	 */
-	mutex_lock(&loop_validate_mutex);
-	mutex_unlock(&loop_validate_mutex);
-	/*
-	 * loop_validate_file() now fails because l->lo_state != Lo_bound
-	 * became visible.
-	 */
-
-	/*
-	 * Since this function is called upon "ioctl(LOOP_CLR_FD)" xor "close()
-	 * after ioctl(LOOP_CLR_FD)", it is a sign of something going wrong if
-	 * lo->lo_state has changed while waiting for lo->lo_mutex.
-	 */
-	mutex_lock(&lo->lo_mutex);
-	BUG_ON(lo->lo_state != Lo_rundown);
-	mutex_unlock(&lo->lo_mutex);
-
 	if (test_bit(QUEUE_FLAG_WC, &lo->lo_queue->queue_flags))
 		blk_queue_write_cache(lo->lo_queue, false, false);
 
@@ -1238,11 +1217,18 @@ static int loop_clr_fd(struct loop_device *lo)
 {
 	int err;
 
-	err = mutex_lock_killable(&lo->lo_mutex);
+	/*
+	 * Use global lock when setting Lo_rundown state in order to make sure
+	 * that loop_validate_file() will fail if the "struct file" which
+	 * loop_configure()/loop_change_fd() found via fget() was this loop
+	 * device. The disk_openers(lo->lo_disk) > 1 test below guarantees that
+	 * fget() did not return this loop device.
+	 */
+	err = loop_global_lock_killable(lo, true);
 	if (err)
 		return err;
 	if (lo->lo_state != Lo_bound) {
-		mutex_unlock(&lo->lo_mutex);
+		loop_global_unlock(lo, true);
 		return -ENXIO;
 	}
 	/*
@@ -1257,11 +1243,11 @@ static int loop_clr_fd(struct loop_device *lo)
 	 */
 	if (disk_openers(lo->lo_disk) > 1) {
 		lo->lo_flags |= LO_FLAGS_AUTOCLEAR;
-		mutex_unlock(&lo->lo_mutex);
+		loop_global_unlock(lo, true);
 		return 0;
 	}
 	lo->lo_state = Lo_rundown;
-	mutex_unlock(&lo->lo_mutex);
+	loop_global_unlock(lo, true);
 
 	__loop_clr_fd(lo, false);
 	return 0;

