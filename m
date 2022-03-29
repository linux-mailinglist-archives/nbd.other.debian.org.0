Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C00EF4EAF1F
	for <lists+nbd@lfdr.de>; Tue, 29 Mar 2022 16:18:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id A27E021067; Tue, 29 Mar 2022 14:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 29 14:18:10 2022
Old-Return-Path: <penguin-kernel@I-love.SAKURA.ne.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 05BB821117
	for <lists-other-nbd@bendel.debian.org>; Tue, 29 Mar 2022 14:02:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.991 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4iM56PXAiush for <lists-other-nbd@bendel.debian.org>;
	Tue, 29 Mar 2022 14:02:41 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1D7AD21106
	for <nbd@other.debian.org>; Tue, 29 Mar 2022 14:02:40 +0000 (UTC)
Received: from fsav413.sakura.ne.jp (fsav413.sakura.ne.jp [133.242.250.112])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 22TE2JfJ065629;
	Tue, 29 Mar 2022 23:02:19 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav413.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav413.sakura.ne.jp);
 Tue, 29 Mar 2022 23:02:19 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav413.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 22TE2J4c065626
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 29 Mar 2022 23:02:19 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <6a383515-e2c0-9200-85b0-067238934b10@I-love.SAKURA.ne.jp>
Date: Tue, 29 Mar 2022 23:02:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 13/14] loop: remove lo_refcount and avoid lo_mutex in
 ->open / ->release
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
        Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
        Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
        Ming Lei <ming.lei@redhat.com>, Matteo Croce <mcroce@microsoft.com>,
        linux-block@vger.kernel.org, nbd@other.debian.org
References: <20220325063929.1773899-1-hch@lst.de>
 <20220325063929.1773899-14-hch@lst.de>
 <03628e13-ca56-4ed0-da5a-ee698c83f48d@I-love.SAKURA.ne.jp>
 <20220329065234.GA20006@lst.de> <20220329132502.GA2024@lst.de>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20220329132502.GA2024@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jwSO9t0MagK.A.3dE.iUxQiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1820
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6a383515-e2c0-9200-85b0-067238934b10@I-love.SAKURA.ne.jp
Resent-Date: Tue, 29 Mar 2022 14:18:10 +0000 (UTC)

On 2022/03/29 22:25, Christoph Hellwig wrote:
> Thinking a bit more, I really don't think the existing any refcount
> check protects us against a different tread modifying the backing
> file.  When a process has a file descriptor to a loop device open
> and is multithreaded (or forks) we can still have multiple threads
> manipulating the loop state.

Yes, I came to that answer. But

> 
> That being said I do not think we really need that refcount check
> at all - once loop_clr_fd set lo->lo_state to Lo_rundown under the
> global lock we know that loop_validate_file will error out on it
> due to the lo_state != Lo_bound check.

if I think about non "a file descriptor to a loop device" case, I
came to the opposite answer. Rather, shouldn't we check the refcount
strictly like below?

[PATCH] loop: avoid loop_validate_mutex/lo_mutex in ->release

Since ->release is called with disk->open_mutex held, and __loop_clr_fd()
 from lo_release() is called via ->release when disk_openers() == 0, we are
guaranteed that "struct file" which will be passed to loop_validate_file()
via fget() cannot be the loop device __loop_clr_fd(lo, true) will clear.
Thus, there is no need to hold loop_validate_mutex from __loop_clr_fd()
if release == true.

When I made commit 3ce6e1f662a91097 ("loop: reintroduce global lock for
safe loop_validate_file() traversal"), I wrote "It is acceptable for
loop_validate_file() to succeed, for actual clear operation has not started
yet.". But now I came to feel why it is acceptable to succeed.

It seems that the loop driver was added in Linux 1.3.68, and

  if (lo->lo_refcnt > 1)
    return -EBUSY;

check in loop_clr_fd() was there from the beginning. The intent of this
check was unclear. But now I think that current

  disk_openers(lo->lo_disk) > 1

form is there for three reasons.

(1) Avoid I/O errors when some process which opens and reads from this
    loop device in response to uevent notification (e.g. systemd-udevd),
    as described in commit a1ecac3b0656a682 ("loop: Make explicit loop
    device destruction lazy"). This opener is short-lived because it is
    likely that the file descriptor used by that process is closed soon.

(2) Avoid I/O errors caused by underlying layer of stacked loop devices
    (i.e. ioctl(some_loop_fd, LOOP_SET_FD, other_loop_fd)) being suddenly
    disappeared. This opener is long-lived because this reference is
    associated with not a file descriptor but lo->lo_backing_file.

(3) Avoid I/O errors caused by underlying layer of mounted loop device
    (i.e. mount(some_loop_device, some_mount_point)) being suddenly
    disappeared. This opener is long-lived because this reference is
    associated with not a file descriptor but mount.

While race in (1) might be acceptable, (2) and (3) should be checked
racelessly. That is, make sure that __loop_clr_fd() will not run if
loop_validate_file() succeeds, by doing refcount check with global lock
held when explicit loop device destruction is requested.

As a result of no longer waiting for lo->lo_mutex after setting Lo_rundown,
we can remove pointless BUG_ON(lo->lo_state != Lo_rundown) check.

Not-yet-signed-off. ;-)
---
 drivers/block/loop.c | 38 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 2506193a4fd1..6b813c592159 100644
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
 
@@ -1238,11 +1217,20 @@ static int loop_clr_fd(struct loop_device *lo)
 {
 	int err;
 
-	err = mutex_lock_killable(&lo->lo_mutex);
+	/*
+	 * Since lo_ioctl() is called without locks held, it is possible that
+	 * loop_configure()/loop_change_fd() and loop_clr_fd() run in parallel.
+	 *
+	 * Therefore, use global lock when setting Lo_rundown state in order to
+	 * make sure that loop_validate_file() will fail if the "struct file"
+	 * which loop_configure()/loop_change_fd() found via fget() was this
+	 * loop device.
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
@@ -1257,11 +1245,11 @@ static int loop_clr_fd(struct loop_device *lo)
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
-- 
2.32.0

