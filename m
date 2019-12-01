Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 284D810E2C2
	for <lists+nbd@lfdr.de>; Sun,  1 Dec 2019 18:27:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E5EB020732; Sun,  1 Dec 2019 17:27:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sun Dec  1 17:27:11 2019
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,
	MIXEDBDN,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E99C82071C
	for <lists-other-nbd@bendel.debian.org>; Sun,  1 Dec 2019 17:11:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.481 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MIXEDBDN=1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_MED=-2.3] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id jj6dkmZr9Fee for <lists-other-nbd@bendel.debian.org>;
	Sun,  1 Dec 2019 17:11:43 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by bendel.debian.org (Postfix) with ESMTP id 84F482072A
	for <nbd@other.debian.org>; Sun,  1 Dec 2019 17:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575220297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vIboseq0fDMMwBbrkH9pSvbsR619q2chHbtWr6BrOkg=;
	b=gGOtMYssTp0GKSTsktbkkSXb3yUiiDdopePu5Ywp6OCfmsJG+4hl8kWukXGoIINRDdeqOg
	NIdflpfBlnssEDyWSIVS6wIBBi0tHzw2fw+POWl793bf1JbtxZydNUMIUG2wtM3ghwqnkx
	9B//xl9OLRvQHc5jMbqFz1MjKJz1xL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-oE2aqEnnP_mRPMcbYHMNXA-1; Sun, 01 Dec 2019 12:11:36 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DD7110054E3;
	Sun,  1 Dec 2019 17:11:33 +0000 (UTC)
Received: from [10.10.121.37] (ovpn-121-37.rdu2.redhat.com [10.10.121.37])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7130B5D9E5;
	Sun,  1 Dec 2019 17:11:32 +0000 (UTC)
Subject: Re: [PATCH] nbd: fix potential deadlock in nbd_config_put()
To: Sun Ke <sunke32@huawei.com>, josef@toxicpanda.com
References: <1574937951-92828-1-git-send-email-sunke32@huawei.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5DE3F444.9080706@redhat.com>
Date: Sun, 1 Dec 2019 11:11:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1574937951-92828-1-git-send-email-sunke32@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: oE2aqEnnP_mRPMcbYHMNXA-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/mixed;
 boundary="------------080507070007010002020405"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bgdVoCyDv4H.A.-8D.vf_4dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/751
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5DE3F444.9080706@redhat.com
Resent-Date: Sun,  1 Dec 2019 17:27:11 +0000 (UTC)

This is a multi-part message in MIME format.
--------------080507070007010002020405
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 11/28/2019 04:45 AM, Sun Ke wrote:
> I got a deadlock report from syzkaller:
> 
> [  234.427696] ============================================
> [  234.428327] WARNING: possible recursive locking detected
> [  234.429011] 5.4.0-rc4+ #1 Not tainted
> [  234.429528] --------------------------------------------
> [  234.430162] kworker/u9:0/894 is trying to acquire lock:
> [  234.430911] ffff0000d3aca128 ((wq_completion)knbd0-recv){+.+.}, at: flush_workqueue+0xbc/0xfe8
> [  234.432330]
> [  234.432330] but task is already holding lock:
> [  234.432927] ffff0000d3aca128 ((wq_completion)knbd0-recv){+.+.}, at: process_one_work+0x6a0/0x17e8
> [  234.433983]
> [  234.433983] other info that might help us debug this:
> [  234.434615]  Possible unsafe locking scenario:
> [  234.434615]
> [  234.435263]        CPU0
> [  234.435613]        ----
> [  234.436019]   lock((wq_completion)knbd0-recv);
> [  234.436521]   lock((wq_completion)knbd0-recv);
> [  234.437166]
> [  234.437166]  *** DEADLOCK ***
> [  234.437166]
> [  234.437763]  May be due to missing lock nesting notation
> [  234.437763]
> [  234.438559] 3 locks held by kworker/u9:0/894:
> [  234.439040]  #0: ffff0000d3aca128 ((wq_completion)knbd0-recv){+.+.}, at: process_one_work+0x6a0/0x17e8
> [  234.440185]  #1: ffff0000d344fd50 ((work_completion)(&args->work)){+.+.}, at: process_one_work+0x6a0/0x17e8
> [  234.442209]  #2: ffff0000d723cd78 (&nbd->config_lock){+.+.}, at: refcount_dec_and_mutex_lock+0x5c/0x128
> [  234.443380]
> [  234.443380] stack backtrace:
> [  234.444271] CPU: 3 PID: 894 Comm: kworker/u9:0 Not tainted 5.4.0-rc4+ #1
> [  234.444989] Hardware name: linux,dummy-virt (DT)
> [  234.446077] Workqueue: knbd0-recv recv_work
> [  234.446909] Call trace:
> [  234.447372]  dump_backtrace+0x0/0x358
> [  234.447877]  show_stack+0x28/0x38
> [  234.448347]  dump_stack+0x15c/0x1ec
> [  234.448838]  __lock_acquire+0x12ec/0x2f78
> [  234.449474]  lock_acquire+0x180/0x590
> [  234.450075]  flush_workqueue+0x104/0xfe8
> [  234.450587]  drain_workqueue+0x164/0x390
> [  234.451090]  destroy_workqueue+0x30/0x560
> [  234.451598]  nbd_config_put+0x308/0x700
> [  234.452093]  recv_work+0x198/0x1f0
> [  234.452556]  process_one_work+0x7ac/0x17e8
> [  234.453189]  worker_thread+0x36c/0xb70
> [  234.453788]  kthread+0x2f4/0x378
> [  234.454257]  ret_from_fork+0x10/0x18
> 
> The root cause is recv_work() is the last one to drop the config
> ref and try to destroy the workqueue from inside the work queue.
> 
> There are two ways to fix the bug. The first way is flushing the
> workqueue before dropping the initial refcount and making sure
> recv_work() will not be the last owner of nbd_config. However it
> is hard for ioctl interface. Because nbd_clear_sock_ioctl() may
> not be invoked, so we need to flush the workqueue in nbd_release()
> and that will lead to another deadlock because recv_work can not
> exit from nbd_read_stat() loop.
> 
> The second way is using another work to put nbd_config asynchronously
> for recv_work().
> 

Can we also increment the refcount before we do wait_event_interruptible
in nbd_start_device_ioctl, always flush the workqueue then drop the
refcount after the flush? See compile tested only patch.

We will then also know the recv side has stopped after
nbd_start_device_ioctl has returned, so new NBD_DO_IT calls for the same
device do not race with shutdowns of previous uses.



--------------080507070007010002020405
Content-Type: text/x-patch;
 name="nbd-move-flush.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="nbd-move-flush.patch"

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 57532465fb83..f8597d2fb365 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1293,13 +1293,15 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *b
 
 	if (max_part)
 		bdev->bd_invalidated = 1;
+
+	refcount_inc(&nbd->config_refs);
 	mutex_unlock(&nbd->config_lock);
 	ret = wait_event_interruptible(config->recv_wq,
 					 atomic_read(&config->recv_threads) == 0);
-	if (ret) {
+	if (ret)
 		sock_shutdown(nbd);
-		flush_workqueue(nbd->recv_workq);
-	}
+	flush_workqueue(nbd->recv_workq);
+
 	mutex_lock(&nbd->config_lock);
 	nbd_bdev_reset(bdev);
 	/* user requested, ignore socket errors */
@@ -1307,6 +1309,7 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *b
 		ret = 0;
 	if (test_bit(NBD_RT_TIMEDOUT, &config->runtime_flags))
 		ret = -ETIMEDOUT;
+	nbd_config_put(nbd);
 	return ret;
 }
 

--------------080507070007010002020405--

