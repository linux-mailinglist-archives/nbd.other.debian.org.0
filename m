Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id C607A4EBA5F
	for <lists+nbd@lfdr.de>; Wed, 30 Mar 2022 07:47:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 97396203B3; Wed, 30 Mar 2022 05:47:35 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Mar 30 05:47:35 2022
Old-Return-Path: <BATV+ea9b0106c62401bc49c3+6793+infradead.org+hch@bombadil.srs.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 695E721540
	for <lists-other-nbd@bendel.debian.org>; Wed, 30 Mar 2022 05:30:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.141 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id z2aVJaQuFC6C for <lists-other-nbd@bendel.debian.org>;
	Wed, 30 Mar 2022 05:30:21 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id E8E9F20143
	for <nbd@other.debian.org>; Wed, 30 Mar 2022 05:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=inZgRH/VQqpVhXfSjPUuygGe7itzqA0Jg1nFKnMMG+M=; b=bs7Hx7jhp3kVrf0SoLIsNgzsfa
	MPMiLZw01yoDoytV4Qktgy7UGzdCJHioKr0HfzT+Glg5+oFhgsIARXMueNnmJEuqHOuSwZ/bdYWnH
	yRS/mVjvPH/oyAPjXBlE2+G6renfMGLNOcMGzhpwWpkrwqbMN9j3oNk/S8RB4tfiITxMfuNGlTnUn
	Xzi2XVKzboruqiuUasthYjKOHhL+QzvGXHWnPpNM7i5uACYcRSDe3EMGc8AjQQU83oVxUGVOdhcVm
	k7Alib1LNUzis7jgmwVpZ70GDAt41adBfM5r98W/xDE8/uWpsL3JWmOF9RvGXKpRBqswOkNpe4sfy
	tMLrFK2w==;
Received: from 213-225-15-62.nat.highway.a1.net ([213.225.15.62] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZQuH-00ELTP-Qi; Wed, 30 Mar 2022 05:30:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Jan Kara <jack@suse.cz>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	Matteo Croce <mcroce@microsoft.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Subject: [PATCH 13/15] loop: avoid loop_validate_mutex/lo_mutex in ->release
Date: Wed, 30 Mar 2022 07:29:15 +0200
Message-Id: <20220330052917.2566582-14-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220330052917.2566582-1-hch@lst.de>
References: <20220330052917.2566582-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <O0_VKyfP3LM.A.-EB.37-QiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1836
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220330052917.2566582-14-hch@lst.de
Resent-Date: Wed, 30 Mar 2022 05:47:35 +0000 (UTC)

From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

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

Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/loop.c | 38 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index bfd21af7aa38b..ea3b0e055657f 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1137,27 +1137,6 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
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
 
@@ -1244,11 +1223,20 @@ static int loop_clr_fd(struct loop_device *lo)
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
@@ -1263,11 +1251,11 @@ static int loop_clr_fd(struct loop_device *lo)
 	 */
 	if (atomic_read(&lo->lo_refcnt) > 1) {
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
2.30.2

