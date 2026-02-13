Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F4rKHr6jmljGwEAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Fri, 13 Feb 2026 11:18:34 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 6477B134F8A
	for <lists+nbd@lfdr.de>; Fri, 13 Feb 2026 11:18:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0A47C20878; Fri, 13 Feb 2026 10:18:34 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 13 10:18:33 2026
Old-Return-Path: <dwagner@suse.de>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 04A1B20829
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Feb 2026 10:02:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.1 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id M85CZcGsKGlt for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Feb 2026 10:02:14 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 358 seconds by postgrey-1.36 at bendel; Fri, 13 Feb 2026 10:02:14 UTC
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id BA93F20703
	for <nbd@other.debian.org>; Fri, 13 Feb 2026 10:02:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9ADC45BCC4;
	Fri, 13 Feb 2026 09:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770976572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qBJp+W6+w4hpK1AOjuJLBK8cne5W/Y5VssQKf43ZEcM=;
	b=BUrXuVrU4Uj6JeWVtHNxu88KEqTAApBzpLUGAKfVFe2/TCfmIgy6NE5QzmaDN7DKMBOsGG
	ZckVaiWgkkpXmcY97TGZ4774iAyr3Var34MEz9aYElUmwWpVZkMwG/fGjrNKdd43FcMP0X
	bKV/xb9tVwCcknG0GeL6ZpYq+lL8Y5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770976572;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qBJp+W6+w4hpK1AOjuJLBK8cne5W/Y5VssQKf43ZEcM=;
	b=Ds5zlB7bv4vIWUQYT40lau/zwk7JiXqptX+FGL1vAdKrX94QpSG11m2XlfY0lzWbZ059rP
	xa9emAAylTWn18Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BUrXuVrU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ds5zlB7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770976572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qBJp+W6+w4hpK1AOjuJLBK8cne5W/Y5VssQKf43ZEcM=;
	b=BUrXuVrU4Uj6JeWVtHNxu88KEqTAApBzpLUGAKfVFe2/TCfmIgy6NE5QzmaDN7DKMBOsGG
	ZckVaiWgkkpXmcY97TGZ4774iAyr3Var34MEz9aYElUmwWpVZkMwG/fGjrNKdd43FcMP0X
	bKV/xb9tVwCcknG0GeL6ZpYq+lL8Y5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770976572;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qBJp+W6+w4hpK1AOjuJLBK8cne5W/Y5VssQKf43ZEcM=;
	b=Ds5zlB7bv4vIWUQYT40lau/zwk7JiXqptX+FGL1vAdKrX94QpSG11m2XlfY0lzWbZ059rP
	xa9emAAylTWn18Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 813873EA62;
	Fri, 13 Feb 2026 09:56:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5S3eHjz1jmngDgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Fri, 13 Feb 2026 09:56:12 +0000
Date: Fri, 13 Feb 2026 10:56:11 +0100
From: Daniel Wagner <dwagner@suse.de>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	"nbd@other.debian.org" <nbd@other.debian.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v6.19 kernel
Message-ID: <6ad314f7-f3d2-495a-b1ef-a81a06498952@flourine.local>
References: <aY7ZBfMjVIhe_wh3@shinmob>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aY7ZBfMjVIhe_wh3@shinmob>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Bn1i0-vhOkM.A.SydN.5pvjpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3486
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6ad314f7-f3d2-495a-b1ef-a81a06498952@flourine.local
Resent-Date: Fri, 13 Feb 2026 10:18:34 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shinichiro.kawasaki@wdc.com,m:linux-block@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:nbd@other.debian.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	FORGED_SENDER(0.00)[dwagner@suse.de,bounce-nbd=lists@other.debian.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	DKIM_TRACE(0.00)[suse.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dwagner@suse.de,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6477B134F8A
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 07:57:58AM +0000, Shinichiro Kawasaki wrote:
> [3] lockdep WARN during nvme/058 with fc transport
> 
> [  409.028219] [     T95] ============================================
> [  409.029133] [     T95] WARNING: possible recursive locking detected
> [  409.030058] [     T95] 6.19.0+ #575 Not tainted
> [  409.030892] [     T95] --------------------------------------------
> [  409.031801] [     T95] kworker/u16:9/95 is trying to acquire lock:
> [  409.032691] [     T95] ffff88813ba54948 ((wq_completion)nvmet-wq){+.+.}-{0:0}, at: touch_wq_lockdep_map+0x7e/0x1a0
> [  409.033869] [     T95] 
>                           but task is already holding lock:
> [  409.035254] [     T95] ffff88813ba54948 ((wq_completion)nvmet-wq){+.+.}-{0:0}, at: process_one_work+0xeef/0x1480
> [  409.036383] [     T95] 
>                           other info that might help us debug this:
> [  409.037769] [     T95]  Possible unsafe locking scenario:
> 
> [  409.039113] [     T95]        CPU0
> [  409.039781] [     T95]        ----
> [  409.040406] [     T95]   lock((wq_completion)nvmet-wq);
> [  409.041154] [     T95]   lock((wq_completion)nvmet-wq);
> [  409.041898] [     T95] 
>                            *** DEADLOCK ***
> 
> [  409.043609] [     T95]  May be due to missing lock nesting notation
> 
> [  409.044960] [     T95] 3 locks held by kworker/u16:9/95:
> [  409.045721] [     T95]  #0: ffff88813ba54948 ((wq_completion)nvmet-wq){+.+.}-{0:0}, at: process_one_work+0xeef/0x1480
> [  409.046845] [     T95]  #1: ffff888109797ca8 ((work_completion)(&assoc->del_work)){+.+.}-{0:0}, at: process_one_work+0x7e4/0x1480
> [  409.048063] [     T95]  #2: ffffffffac481480 (rcu_read_lock){....}-{1:3}, at: __flush_work+0xe3/0xc70
> [  409.049128] [     T95] 
>                           stack backtrace:
> [  409.050366] [     T95] CPU: 1 UID: 0 PID: 95 Comm: kworker/u16:9 Not tainted 6.19.0+ #575 PREEMPT(voluntary) 
> [  409.050370] [     T95] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-4.fc42 04/01/2014
> [  409.050373] [     T95] Workqueue: nvmet-wq nvmet_fc_delete_assoc_work [nvmet_fc]
> [  409.050384] [     T95] Call Trace:
> [  409.050386] [     T95]  <TASK>
> [  409.050388] [     T95]  dump_stack_lvl+0x6a/0x90
> [  409.050393] [     T95]  print_deadlock_bug.cold+0xc0/0xcd
> [  409.050401] [     T95]  __lock_acquire+0x1312/0x2230
> [  409.050408] [     T95]  ? lockdep_unlock+0x5e/0xc0
> [  409.050410] [     T95]  ? __lock_acquire+0xd03/0x2230
> [  409.050413] [     T95]  lock_acquire+0x170/0x300
> [  409.050415] [     T95]  ? touch_wq_lockdep_map+0x7e/0x1a0
> [  409.050418] [     T95]  ? __flush_work+0x4e8/0xc70
> [  409.050420] [     T95]  ? find_held_lock+0x2b/0x80
> [  409.050423] [     T95]  ? touch_wq_lockdep_map+0x7e/0x1a0
> [  409.050425] [     T95]  touch_wq_lockdep_map+0x97/0x1a0
> [  409.050428] [     T95]  ? touch_wq_lockdep_map+0x7e/0x1a0
> [  409.050430] [     T95]  ? __flush_work+0x4e8/0xc70
> [  409.050432] [     T95]  __flush_work+0x5c1/0xc70
> [  409.050434] [     T95]  ? __pfx___flush_work+0x10/0x10
> [  409.050436] [     T95]  ? __pfx___flush_work+0x10/0x10
> [  409.050439] [     T95]  ? __pfx_wq_barrier_func+0x10/0x10
> [  409.050444] [     T95]  ? __pfx___might_resched+0x10/0x10
> [  409.050454] [     T95]  nvmet_ctrl_free+0x2e9/0x810 [nvmet]
> [  409.050474] [     T95]  ? __pfx___cancel_work+0x10/0x10
> [  409.050479] [     T95]  ? __pfx_nvmet_ctrl_free+0x10/0x10 [nvmet]
> [  409.050498] [     T95]  nvmet_cq_put+0x136/0x180 [nvmet]
> [  409.050515] [     T95]  nvmet_fc_target_assoc_free+0x398/0x2040 [nvmet_fc]
> [  409.050522] [     T95]  ? __pfx_nvmet_fc_target_assoc_free+0x10/0x10 [nvmet_fc]
> [  409.050528] [     T95]  nvmet_fc_delete_assoc_work.cold+0x82/0xff [nvmet_fc]
> [  409.050533] [     T95]  process_one_work+0x868/0x1480
> [  409.050538] [     T95]  ? __pfx_process_one_work+0x10/0x10
> [  409.050541] [     T95]  ? lock_acquire+0x170/0x300
> [  409.050545] [     T95]  ? assign_work+0x156/0x390
> [  409.050548] [     T95]  worker_thread+0x5ee/0xfd0
> [  409.050553] [     T95]  ? __pfx_worker_thread+0x10/0x10
> [  409.050555] [     T95]  kthread+0x3af/0x770
> [  409.050560] [     T95]  ? lock_acquire+0x180/0x300
> [  409.050563] [     T95]  ? __pfx_kthread+0x10/0x10
> [  409.050565] [     T95]  ? __pfx_kthread+0x10/0x10
> [  409.050568] [     T95]  ? ret_from_fork+0x6e/0x810
> [  409.050576] [     T95]  ? lock_release+0x1ab/0x2f0
> [  409.050578] [     T95]  ? rcu_is_watching+0x11/0xb0
> [  409.050582] [     T95]  ? __pfx_kthread+0x10/0x10
> [  409.050585] [     T95]  ret_from_fork+0x55c/0x810
> [  409.050588] [     T95]  ? __pfx_ret_from_fork+0x10/0x10
> [  409.050590] [     T95]  ? __switch_to+0x10a/0xda0
> [  409.050598] [     T95]  ? __switch_to_asm+0x33/0x70
> [  409.050602] [     T95]  ? __pfx_kthread+0x10/0x10
> [  409.050605] [     T95]  ret_from_fork_asm+0x1a/0x30
> [  409.050610] [     T95]  </TASK>

nvmet_fc_target_assoc_free runs in the nvmet_wq context and calls

  nvmet_fc_delete_target_queue
    nvmet_cq_put
      nvmet_cq_destroy
        nvmet_ctrl_put
         nvmet_ctrl_free
           flush_work(&ctrl->async_event_work);
           cancel_work_sync(&ctrl->fatal_err_work);
 
The async_event_work could be running on nvmet_wq. So this deadlock is
real. No idea how to fix it yet.

> [4] WARN during nvme/058 fc transport
> 
> [ 1410.913156] [   T1369] WARNING: block/genhd.c:463 at __add_disk+0x87b/0xd50, CPU#0: kworker/u16:12/1369

	/*
	 * If the driver provides an explicit major number it also must provide
	 * the number of minors numbers supported, and those will be used to
	 * setup the gendisk.
	 * Otherwise just allocate the device numbers for both the whole device
	 * and all partitions from the extended dev_t space.
	 */
	ret = -EINVAL;
	if (disk->major) {
		if (WARN_ON(!disk->minors))
			goto out;

If I read the correct, the gendisk is allocated in nvme_mpath_alloc_disk
and then added due the ANA change in nvme_update_ana_state. Not sure if
this is really fc related but I haven't really figured out how this part
of the code yet.

