Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJGEHPdxpWlsBQYAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Mon, 02 Mar 2026 12:18:15 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0291D7554
	for <lists+nbd@lfdr.de>; Mon, 02 Mar 2026 12:18:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 586A620696; Mon,  2 Mar 2026 11:18:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Mar  2 11:18:14 2026
Old-Return-Path: <leon@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MD5_SHA1_SUM,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 775F620585
	for <lists-other-nbd@bendel.debian.org>; Mon,  2 Mar 2026 11:00:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.148 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MD5_SHA1_SUM=-1, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.717,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.236] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LShILbonNbHL for <lists-other-nbd@bendel.debian.org>;
	Mon,  2 Mar 2026 11:00:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 582 seconds by postgrey-1.36 at bendel; Mon, 02 Mar 2026 11:00:40 UTC
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8F1F22056E
	for <nbd@other.debian.org>; Mon,  2 Mar 2026 11:00:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2E6960008;
	Mon,  2 Mar 2026 10:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63631C19423;
	Mon,  2 Mar 2026 10:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772448655;
	bh=ooCwVMtMeof9eUg55NNUtPSMrUI5IYvsBBfPpUNmiu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fHKvAGlV1PYQM4oFzHWWPRF/Yv3lsn7pHbcI4wEPesGHyt//zusRP7n9wglL7LoOI
	 ZhCK58mOpx9cjjpITbEgzKyqV8Ml0pgYDx3WyVQrsAPALthSB4y74AGT934IURginD
	 S7LDUJ/n1/2o2lmF2Tg4568RN/JKwd+ULiEM0XODU4Xm0DNwN1w3/iQQlPMhM/XO8q
	 9KzuIHHM1A9UUjdjpOWQ/NtY8TfKfyVjVycIgth2dFNViaI0QB3GPKr1jibnDZHDbJ
	 uJuryc73Di6wnU+FHiy9nsYte5yb3BVgKohfue+dztdcVYxfNPAZlOKIrXGrEIlveJ
	 xGjmTzNbjr2FA==
Date: Mon, 2 Mar 2026 12:50:51 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Subject: Re: blktests failures with v7.0-rc1 kernel
Message-ID: <20260302105051.GP12611@unreal>
References: <aZ_-cH8euZLySxdD@shinmob>
 <4c7aea9f-ae97-43c8-8b08-905696303978@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c7aea9f-ae97-43c8-8b08-905696303978@nvidia.com>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fPN2JpgXlnB.A.ENaG.2HXppB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3506
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20260302105051.GP12611@unreal
Resent-Date: Mon,  2 Mar 2026 11:18:14 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[82.195.75.100:from];
	HAS_LIST_UNSUB(-0.01)[];
	R_SPF_NA(0.00)[no SPF record];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chaitanyak@nvidia.com,m:shinichiro.kawasaki@wdc.com,m:linux-block@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:nbd@other.debian.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER(0.00)[leon@kernel.org,bounce-nbd=lists@other.debian.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	ASN(0.00)[asn:8365, ipnet:82.195.64.0/19, country:DE];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,bendel.debian.org:helo,bendel.debian.org:rdns,qemu.org:url]
X-Rspamd-Queue-Id: EF0291D7554
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 03:00:40PM +0000, Chaitanya Kulkarni wrote:
> On 2/26/26 12:09 AM, Shinichiro Kawasaki wrote:
> > Failure description
> > ===================
> >
> > #1: blktrace/002
> >
> >      The test case blktrace/002 failed due to "BUG: using __this_cpu_read() in
> >      preemptible" and a following WARN [2].
> 
> I saw this last night it was pretty late, just glad to see simple 
> testcase catching bugs.
> 
> I've a patch for this I'll send out shortly :-
> 
> 
> From 6a285db1bbdbb613a85ac55a395ed2043d4eb11d Mon Sep 17 00:00:00 2001
> From: Chaitanya Kulkarni <kch@nvidia.com>
> Date: Wed, 25 Feb 2026 23:01:12 -0800
> Subject: [PATCH] blktrace: fix __this_cpu_read/write in preemptible context
> 
> 
> 
> blktrace/002 (blktrace ftrace corruption with sysfs trace)  [failed]
>      runtime  0.367s  ...  0.437s
>      something found in dmesg:
>      [   81.211018] run blktests blktrace/002 at 2026-02-25 22:24:33
>      [   81.239580] null_blk: disk nullb1 created
>      [   81.357294] BUG: using __this_cpu_read() in preemptible 
> [00000000] code: dd/2516
>      [   81.362842] caller is tracing_record_cmdline+0x10/0x40
>      [   81.362872] CPU: 16 UID: 0 PID: 2516 Comm: dd Tainted: G         
>         N  7.0.0-rc1lblk+ #84 PREEMPT(full)
>      [   81.362877] Tainted: [N]=TEST
>      [   81.362878] Hardware name: QEMU Standard PC (i440FX + PIIX, 
> 1996), BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
>      [   81.362881] Call Trace:
>      [   81.362884]  <TASK>
>      [   81.362886]  dump_stack_lvl+0x8d/0xb0
>      ...
>      (See '/mnt/sda/blktests/results/nodev/blktrace/002.dmesg' for the 
> entire message)
> 
> [   81.211018] run blktests blktrace/002 at 2026-02-25 22:24:33
> [   81.239580] null_blk: disk nullb1 created
> [   81.357294] BUG: using __this_cpu_read() in preemptible [00000000] 
> code: dd/2516
> [   81.362842] caller is tracing_record_cmdline+0x10/0x40
> [   81.362872] CPU: 16 UID: 0 PID: 2516 Comm: dd Tainted: G           
>   N  7.0.0-rc1lblk+ #84 PREEMPT(full)
> [   81.362877] Tainted: [N]=TEST
> [   81.362878] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
> BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
> [   81.362881] Call Trace:
> [   81.362884]  <TASK>
> [   81.362886]  dump_stack_lvl+0x8d/0xb0
> [   81.362895]  check_preemption_disabled+0xce/0xe0
> [   81.362902]  tracing_record_cmdline+0x10/0x40
> [   81.362923]  __blk_add_trace+0x307/0x5d0
> [   81.362934]  ? lock_acquire+0xe0/0x300
> [   81.362940]  ? iov_iter_extract_pages+0x101/0xa30
> [   81.362959]  blk_add_trace_bio+0x106/0x1e0
> [   81.362968]  submit_bio_noacct_nocheck+0x24b/0x3a0
> [   81.362979]  ? lockdep_init_map_type+0x58/0x260
> [   81.362988]  submit_bio_wait+0x56/0x90
> [   81.363009]  __blkdev_direct_IO_simple+0x16c/0x250
> [   81.363026]  ? __pfx_submit_bio_wait_endio+0x10/0x10
> [   81.363038]  ? rcu_read_lock_any_held+0x73/0xa0
> [   81.363051]  blkdev_read_iter+0xc1/0x140
> [   81.363059]  vfs_read+0x20b/0x330
> [   81.363083]  ksys_read+0x67/0xe0
> [   81.363090]  do_syscall_64+0xbf/0xf00
> [   81.363102]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   81.363106] RIP: 0033:0x7f281906029d
> [   81.363111] Code: 31 c0 e9 c6 fe ff ff 50 48 8d 3d 66 63 0a 00 e8 59 
> ff 01 00 66 0f 1f 84 00 00 00 00 00 80 3d 41 33 0e 00 00 74 17 31 c0 0f 
> 05 <48> 3d 00 f0 ff ff 77 5b c3 66 2e 0f 1f 84 00 00 00 00 00 48 83 ec
> [   81.363113] RSP: 002b:00007ffca127dd48 EFLAGS: 00000246 ORIG_RAX: 
> 0000000000000000
> [   81.363120] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 
> 00007f281906029d
> [   81.363122] RDX: 0000000000001000 RSI: 0000559f8bfae000 RDI: 
> 0000000000000000
> [   81.363123] RBP: 0000000000001000 R08: 0000002863a10a81 R09: 
> 00007f281915f000
> [   81.363124] R10: 00007f2818f77b60 R11: 0000000000000246 R12: 
> 0000559f8bfae000
> [   81.363126] R13: 0000000000000000 R14: 0000000000000000 R15: 
> 000000000000000a
> [   81.363142]  </TASK>
> [   81.363157] BUG: using __this_cpu_read() in preemptible [00000000] 
> code: dd/2516
> [   81.368486] caller is tracing_record_cmdline+0x10/0x40
> [   81.368496] CPU: 16 UID: 0 PID: 2516 Comm: dd Tainted: G           
>   N  7.0.0-rc1lblk+ #84 PREEMPT(full)
> [   81.368501] Tainted: [N]=TEST
> [   81.368502] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
> BIOS rel-1.17.0-0-gb52ca86e094d-prebuilt.qemu.org 04/01/2014
> [   81.368503] Call Trace:
> [   81.368505]  <TASK>
> [   81.368507]  dump_stack_lvl+0x8d/0xb0
> [   81.368513]  check_preemption_disabled+0xce/0xe0
> [   81.368518]  tracing_record_cmdline+0x10/0x40
> [   81.368523]  __blk_add_trace+0x307/0x5d0
> [   81.368528]  ? lock_acquire+0xe0/0x300
> [   81.368547]  blk_add_trace_bio+0x106/0x1e0
> [   81.368556]  blk_mq_submit_bio+0x63c/0xbb0
> [   81.368580]  __submit_bio+0xad/0x5c0
> [   81.368595]  ? submit_bio_noacct_nocheck+0x2b0/0x3a0
> [   81.368600]  submit_bio_noacct_nocheck+0x2b0/0x3a0
> [   81.368611]  submit_bio_wait+0x56/0x90
> [   81.368622]  __blkdev_direct_IO_simple+0x16c/0x250
> [   81.368635]  ? __pfx_submit_bio_wait_endio+0x10/0x10
> [   81.368656]  ? rcu_read_lock_any_held+0x73/0xa0
> [   81.368664]  blkdev_read_iter+0xc1/0x140
> [   81.368672]  vfs_read+0x20b/0x330
> [   81.368687]  ksys_read+0x67/0xe0
> [   81.368694]  do_syscall_64+0xbf/0xf00
> [   81.368702]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   81.368705] RIP: 0033:0x7f281906029d
> [   81.368708] Code: 31 c0 e9 c6 fe ff ff 50 48 8d 3d 66 63 0a 00 e8 59 
> ff 01 00 66 0f 1f 84 00 00 00 00 00 80 3d 41 33 0e 00 00 74 17 31 c0 0f 
> 05 <48> 3d 00 f0 ff ff 77 5b c3 66 2e 0f 1f 84 00 00 00 00 00 48 83 ec
> [   81.368710] RSP: 002b:00007ffca127dd48 EFLAGS: 00000246 ORIG_RAX: 
> 0000000000000000
> [   81.368712] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 
> 00007f281906029d
> [   81.368713] RDX: 0000000000001000 RSI: 0000559f8bfae000 RDI: 
> 0000000000000000
> [   81.368714] RBP: 0000000000001000 R08: 0000002863a10a81 R09: 
> 00007f281915f000
> [   81.368716] R10: 00007f2818f77b60 R11: 0000000000000246 R12: 
> 0000559f8bfae000
> [   81.368717] R13: 0000000000000000 R14: 0000000000000000 R15: 
> 000000000000000a
> [   81.368734]  </TASK>
> 
> The same BUG fires from blk_add_trace_plug(), blk_add_trace_unplug(),
> and blk_add_trace_rq() paths as well.
> 
> Fix by wrapping the tracing_record_cmdline() call with
> preempt_disable()/preempt_enable().  This is a best-effort "record
> the comm string for this PID" operation and briefly disabling
> preemption around it is both safe and correct.
> 
> With this patch now blktests for blktrace pass :-
> 
> blktests (master) # ./check blktrace
> blktrace/001 (blktrace zone management command tracing) [passed]
>      runtime  3.652s  ...  3.649s
> blktrace/002 (blktrace ftrace corruption with sysfs trace)  [passed]
>      runtime  0.437s  ...  0.389s
> blktests (master) #
> 
> 
> Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
> ---
>   kernel/trace/blktrace.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
> index 3b7c102a6eb3..488552036583 100644
> --- a/kernel/trace/blktrace.c
> +++ b/kernel/trace/blktrace.c
> @@ -383,7 +383,9 @@ static void __blk_add_trace(struct blk_trace *bt, 
> sector_t sector, int bytes,
>       cpu = raw_smp_processor_id();
> 
>       if (blk_tracer) {
> +        preempt_disable_notrace();
>           tracing_record_cmdline(current);
> +        preempt_enable_notrace();

These lines likely belong in tracing_record_cmdline().

Thanks

> 
>           buffer = blk_tr->array_buffer.buffer;
>           trace_ctx = tracing_gen_ctx_flags(0);
> -- 
> 2.39.5
> 
> 

