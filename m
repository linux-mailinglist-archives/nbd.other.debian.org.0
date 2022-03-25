Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id F08624E7759
	for <lists+nbd@lfdr.de>; Fri, 25 Mar 2022 16:27:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D2EDE204C0; Fri, 25 Mar 2022 15:27:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Mar 25 15:27:09 2022
Old-Return-Path: <penguin-kernel@I-love.SAKURA.ne.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=MURPHY_DRUGS_REL8,NICE_REPLY_A,
	T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 22EFE20411
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Mar 2022 15:11:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.991 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id lKL78fYQklnl for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Mar 2022 15:11:25 +0000 (UTC)
X-policyd-weight: using cached result; rate: -4.6
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 490FF204CE
	for <nbd@other.debian.org>; Fri, 25 Mar 2022 15:11:24 +0000 (UTC)
Received: from fsav119.sakura.ne.jp (fsav119.sakura.ne.jp [27.133.134.246])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 22PFAnvA081406;
	Sat, 26 Mar 2022 00:10:49 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav119.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav119.sakura.ne.jp);
 Sat, 26 Mar 2022 00:10:49 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav119.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 22PFAmHD081402
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 26 Mar 2022 00:10:49 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <23a87135-7f6c-0f0d-a054-e596114ea97b@I-love.SAKURA.ne.jp>
Date: Sat, 26 Mar 2022 00:10:48 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 11/14] loop: implement ->free_disk
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        Josef Bacik <josef@toxicpanda.com>, Minchan Kim <minchan@kernel.org>,
        Nitin Gupta <ngupta@vflare.org>
Cc: Jan Kara <jack@suse.cz>, "Darrick J . Wong" <djwong@kernel.org>,
        Ming Lei <ming.lei@redhat.com>, Matteo Croce <mcroce@microsoft.com>,
        linux-block@vger.kernel.org, nbd@other.debian.org
References: <20220325063929.1773899-1-hch@lst.de>
 <20220325063929.1773899-12-hch@lst.de>
 <53c6c4b8-0aad-c882-d2e9-91eb9533aa21@I-love.SAKURA.ne.jp>
In-Reply-To: <53c6c4b8-0aad-c882-d2e9-91eb9533aa21@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <wnfnPjgUzZG.A.-BC.N9dPiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1807
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/23a87135-7f6c-0f0d-a054-e596114ea97b@I-love.SAKURA.ne.jp
Resent-Date: Fri, 25 Mar 2022 15:27:09 +0000 (UTC)

On 2022/03/25 19:42, Tetsuo Handa wrote:
> On 2022/03/25 15:39, Christoph Hellwig wrote:
>> Ensure that the lo_device which is stored in the gendisk private
>> data is valid until the gendisk is freed.  Currently the loop driver
>> uses a lot of effort to make sure a device is not freed when it is
>> still in use, but to to fix a potential deadlock this will be relaxed
>> a bit soon.
> 
> This patch breaks blk_cleanup_disk() into blk_cleanup_queue() and put_disk() on
> loop_remove() side only. But there is blk_cleanup_disk() in the error path of
> loop_add() side. Don't we need to rewrite the error path of loop_add() side, for
> put_disk() from blk_cleanup_disk() from loop_add() calls kfree() via lo_free_disk()
> but out_cleanup_disk: label falls through to blk_mq_free_tag_set() (which seems to
> be UAF read) and kfree() (which seems to be double kfree()) ?
> 

Ah, since set_bit(GD_ADDED, &disk->state) is not called unless
device_add_disk() from add_disk() succeeds, disk->fops->free_disk
will not be called unless add_disk() succeeds. Thus, it is OK for
the error path of loop_add(). Tricky call...

