Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F904E720E
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 12:12:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 595912046F; Fri, 25 Mar 2022 11:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 11:12:09 2022
Old-Return-Path: <penguin-kernel@I-love.SAKURA.ne.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 969CB20322
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 10:54:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.991 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HEsnZFKSEFhu for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 10:54:32 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 661ED20303
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 10:54:32 +0000 (UTC)
Received: from fsav118.sakura.ne.jp (fsav118.sakura.ne.jp [27.133.134.245])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 22PAsGdB013656;
	Fri, 25 Mar 2022 19:54:16 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav118.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp);
 Fri, 25 Mar 2022 19:54:16 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav118.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 22PAsGaj013653
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 25 Mar 2022 19:54:16 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <0b47dbee-ce17-7502-6bf3-fad939f89bb7@I-love.SAKURA.ne.jp>
Date: Fri, 25 Mar 2022 19:54:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 12/13] loop: remove lo_refcount and avoid lo_mutex in
 ->open / ->release
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Dave Chinner <david@fromorbit.com>
Cc: Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>,
        Josef Bacik <josef@toxicpanda.com>, Minchan Kim <minchan@kernel.org>,
        Nitin Gupta <ngupta@vflare.org>,
        "Darrick J . Wong" <djwong@kernel.org>, Ming Lei <ming.lei@redhat.com>,
        linux-block@vger.kernel.org, nbd@other.debian.org
References: <20220324075119.1556334-1-hch@lst.de>
 <20220324075119.1556334-13-hch@lst.de>
 <20220324141321.pqesnshaswwk3svk@quack3.lan>
 <96a4e2e7-e16e-7e89-255d-8aa29ffca68b@I-love.SAKURA.ne.jp>
 <20220324172335.GA28299@lst.de>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20220324172335.GA28299@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_Ta8ivqnv1B.A.gnE.JOaPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1802
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/0b47dbee-ce17-7502-6bf3-fad939f89bb7@I-love.SAKURA.ne.jp
Resent-Date: Fri, 25 Mar 2022 11:12:09 +0000 (UTC)

On 2022/03/25 2:23, Christoph Hellwig wrote:
> On Thu, Mar 24, 2022 at 11:24:43PM +0900, Tetsuo Handa wrote:
>> On 2022/03/24 23:13, Jan Kara wrote:
>>>> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
>>>> index b3170e8cdbe95..e1eb925d3f855 100644
>>>> --- a/drivers/block/loop.c
>>>> +++ b/drivers/block/loop.c
>>>> @@ -1244,7 +1244,7 @@ static int loop_clr_fd(struct loop_device *lo)
>>>>  	 * <dev>/do something like mkfs/losetup -d <dev> causing the losetup -d
>>>>  	 * command to fail with EBUSY.
>>>>  	 */
>>>> -	if (atomic_read(&lo->lo_refcnt) > 1) {
>>>> +	if (disk_openers(lo->lo_disk) > 1) {
>>
>> This is sometimes "if (0) {" due to not holding disk->open_mutex.
> 
> Yes, as clearly documented in the commit log.  In fact turning it
> into an explicit if 0 (that is removing this code) might be a not
> bad idea either - the code was added to work around a
> 
> 	if (lo->lo_refcnt > 1)  /* we needed one fd for the ioctl */
> 		return -EBUSY;
> 
> that already did not make much sense to start with (but goes
> back to before git history).
> 
> But for now I'd really prefer to stop moving the goalpost further and
> further.

Then, why not kill this code?

 drivers/block/loop.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 3e636a75c83a..26c8808d02d0 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1205,30 +1205,15 @@ static int loop_clr_fd(struct loop_device *lo)
 	err = mutex_lock_killable(&lo->lo_mutex);
 	if (err)
 		return err;
-	if (lo->lo_state != Lo_bound) {
-		mutex_unlock(&lo->lo_mutex);
-		return -ENXIO;
-	}
-	/*
-	 * If we've explicitly asked to tear down the loop device,
-	 * and it has an elevated reference count, set it for auto-teardown when
-	 * the last reference goes away. This stops $!~#$@ udev from
-	 * preventing teardown because it decided that it needs to run blkid on
-	 * the loopback device whenever they appear. xfstests is notorious for
-	 * failing tests because blkid via udev races with a losetup
-	 * <dev>/do something like mkfs/losetup -d <dev> causing the losetup -d
-	 * command to fail with EBUSY.
-	 */
-	if (atomic_read(&lo->lo_refcnt) > 1) {
-		lo->lo_flags |= LO_FLAGS_AUTOCLEAR;
-		mutex_unlock(&lo->lo_mutex);
-		return 0;
-	}
-	lo->lo_state = Lo_rundown;
+	if (lo->lo_state != Lo_bound)
+		err = -ENXIO;
+	else
+		lo->lo_state = Lo_rundown;
 	mutex_unlock(&lo->lo_mutex);
 
-	__loop_clr_fd(lo, false);
-	return 0;
+	if (!err)
+		__loop_clr_fd(lo, false);
+	return err;
 }
 
 static int
-- 
2.32.0

