Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNaUBg+7j2mmTAEAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Sat, 14 Feb 2026 01:00:15 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE8213A171
	for <lists+nbd@lfdr.de>; Sat, 14 Feb 2026 01:00:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 42F5120608; Sat, 14 Feb 2026 00:00:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Feb 14 00:00:14 2026
Old-Return-Path: <yanjun.zhu@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TO_TOO_MANY autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 240A82081B
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Feb 2026 23:44:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.298 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id t6wPF8JbVP7c for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Feb 2026 23:44:33 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .linux. - helo: .out-189.mta0.migadu. - helo-domain: .migadu.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
X-Greylist: delayed 375 seconds by postgrey-1.36 at bendel; Fri, 13 Feb 2026 23:44:33 UTC
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D479D20643
	for <nbd@other.debian.org>; Fri, 13 Feb 2026 23:44:33 +0000 (UTC)
Message-ID: <b8589b6b-504c-4fdb-b73b-83b9c97e65df@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771025893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0u/IuCNWvSJPlla9QPP4kMmxoVzieNBHkIWAmPtgRc=;
	b=P7NNcXIdPcDZ58+AYdPbw5Z3ONI++aHW/pw1hK92qtUQMed4x8YZOqThUAXbMtzoF/5eoy
	JdtATkM0c7QB5T58X1JzqDFMmCFWJLc0kTEhJ/uJ8B9Lpi8Wd1Y44a+kyOPj6/Z1w7WCc2
	HR+DVY84GEc/kkzdnSO3Rs6ns34Rcvo=
Date: Fri, 13 Feb 2026 15:38:08 -0800
MIME-Version: 1.0
Subject: Re: blktests failures with v6.19 kernel
To: Bart Van Assche <bvanassche@acm.org>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <aY7ZBfMjVIhe_wh3@shinmob>
 <5157497a-3536-4187-883e-19a54167955a@acm.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "yanjun.zhu" <yanjun.zhu@linux.dev>
In-Reply-To: <5157497a-3536-4187-883e-19a54167955a@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <OaZHRaltYIG.A.yf-H.Os7jpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3488
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b8589b6b-504c-4fdb-b73b-83b9c97e65df@linux.dev
Resent-Date: Sat, 14 Feb 2026 00:00:14 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:shinichiro.kawasaki@wdc.com,m:linux-block@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:nbd@other.debian.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yanjun.zhu@linux.dev,bounce-nbd=lists@other.debian.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yanjun.zhu@linux.dev,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	TAGGED_RCPT(0.00)[nbd];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,bendel.debian.org:helo,bendel.debian.org:rdns]
X-Rspamd-Queue-Id: ACE8213A171
X-Rspamd-Action: no action

On 2/13/26 9:44 AM, Bart Van Assche wrote:
> On 2/12/26 11:57 PM, Shinichiro Kawasaki wrote:
>> [5] kmemleak at nvme/061 wiht rdma transport and siw driver
>>
>> unreferenced object 0xffff888114792600 (size 32):
>>    comm "kworker/2:1H", pid 66, jiffies 4295489358
>>    hex dump (first 32 bytes):
>>      c2 f6 83 05 00 ea ff ff 00 00 00 00 00 10 00 00  ................
>>      00 b0 fd 60 81 88 ff ff 00 10 00 00 00 00 00 00  ...`............
>>    backtrace (crc 3dbac61d):
>>      __kmalloc_noprof+0x62f/0x8b0
>>      sgl_alloc_order+0x74/0x330
>>      0xffffffffc1b73433
>>      0xffffffffc1bc1f0d
>>      0xffffffffc1bc8064
>>      __ib_process_cq+0x14f/0x3e0 [ib_core]
>>      ib_cq_poll_work+0x49/0x160 [ib_core]
>>      process_one_work+0x868/0x1480
>>      worker_thread+0x5ee/0xfd0
>>      kthread+0x3af/0x770
>>      ret_from_fork+0x55c/0x810
>>      ret_from_fork_asm+0x1a/0x30
> 
> There are no sgl_alloc() calls in the RDMA subsystem. I think the above
> indicates a memory leak in either the RDMA NVMe target driver or in the
> NVMe target core.

3a2c32d357db RDMA/siw: reclassify sockets in order to avoid false 
positives from lockdep
85cb0757d7e1 net: Convert proto_ops connect() callbacks to use 
sockaddr_unsized
0e50474fa514 net: Convert proto_ops bind() callbacks to use sockaddr_unsized

There are only three commits touching the siw driver between v6.18 and 
v6.19. I therefore suspect the issue is more likely in the NVMe side.

Best Regards,
Zhu Yanjun

> 
>> [7] kmemleak at zbd/009
>>
>> unreferenced object 0xffff88815f1f1280 (size 32):
>>    comm "mount", pid 1745, jiffies 4294866235
>>    hex dump (first 32 bytes):
>>      6d 65 74 61 64 61 74 61 2d 74 72 65 65 6c 6f 67  metadata-treelog
>>      00 93 9c fb af bb ae 00 00 00 00 00 00 00 00 00  ................
>>    backtrace (crc 2ee03cc2):
>>      __kmalloc_node_track_caller_noprof+0x66b/0x8c0
>>      kstrdup+0x42/0xc0
>>      kobject_set_name_vargs+0x44/0x110
>>      kobject_init_and_add+0xcf/0x140
>>      btrfs_sysfs_add_space_info_type+0xf2/0x200 [btrfs]
>>      create_space_info_sub_group.constprop.0+0xfb/0x1b0 [btrfs]
>>      create_space_info+0x247/0x320 [btrfs]
>>      btrfs_init_space_info+0x143/0x1b0 [btrfs]
>>      open_ctree+0x2eed/0x43fe [btrfs]
>>      btrfs_get_tree.cold+0x90/0x1da [btrfs]
>>      vfs_get_tree+0x87/0x2f0
>>      vfs_cmd_create+0xbd/0x280
>>      __do_sys_fsconfig+0x64f/0xa30
>>      do_syscall_64+0x95/0x540
>>      entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> unreferenced object 0xffff888128d80000 (size 16):
>>    comm "mount", pid 1745, jiffies 4294866237
>>    hex dump (first 16 bytes):
>>      64 61 74 61 2d 72 65 6c 6f 63 00 4b 96 f6 48 82  data-reloc.K..H.
>>    backtrace (crc 1598f702):
>>      __kmalloc_node_track_caller_noprof+0x66b/0x8c0
>>      kstrdup+0x42/0xc0
>>      kobject_set_name_vargs+0x44/0x110
>>      kobject_init_and_add+0xcf/0x140
>>      btrfs_sysfs_add_space_info_type+0xf2/0x200 [btrfs]
>>      create_space_info_sub_group.constprop.0+0xfb/0x1b0 [btrfs]
>>      create_space_info+0x211/0x320 [btrfs]
>>      open_ctree+0x2eed/0x43fe [btrfs]
>>      btrfs_get_tree.cold+0x90/0x1da [btrfs]
>>      vfs_get_tree+0x87/0x2f0
>>      vfs_cmd_create+0xbd/0x280
>>      __do_sys_fsconfig+0x64f/0xa30
>>      do_syscall_64+0x95/0x540
>>      entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> Please report the above to the BTRFS maintainers.
> 
> Thanks,
> 
> Bart.

