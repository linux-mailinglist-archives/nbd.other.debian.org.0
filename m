Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
Delivered-To: lists+nbd@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HCIJsdoj2lHQwEAu9opvQ
	(envelope-from <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>)
	for <lists+nbd@lfdr.de>; Fri, 13 Feb 2026 19:09:11 +0100
X-Original-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ECF138D21
	for <lists+nbd@lfdr.de>; Fri, 13 Feb 2026 19:09:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E9F6020673; Fri, 13 Feb 2026 18:09:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 13 18:09:10 2026
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_LOW,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	TO_TOO_MANY autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id DDB9420705
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Feb 2026 17:51:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.798 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
	RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UhU5jjb7FR_h for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Feb 2026 17:51:09 +0000 (UTC)
X-policyd-weight: using cached result; rate: -6.6
X-Greylist: delayed 414 seconds by postgrey-1.36 at bendel; Fri, 13 Feb 2026 17:51:08 UTC
Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R13" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id ED09920793
	for <nbd@other.debian.org>; Fri, 13 Feb 2026 17:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fCKKj6mlFzlgqwF;
	Fri, 13 Feb 2026 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1771004648; x=1773596649; bh=t9RzRfvwbSgpAAn+57L/twMb
	K6THI0fSwkzw1UKZRes=; b=QzNyeC+78j+FCizjBSZLWJPixMNPatJ8HNzEwubp
	yRQdiq+UcNG4TgXbrCcSBO+1U5RLvQF2JDPAWNVvrEr9kjznYAo+foAHwGGzPjK2
	8iNettCMNTrcbNYGdjuD6pbrRwHvT07kkG+TTiCX6wWnUDwHG+0J+H4goOL9P1lh
	ey4fyk4jg112tX+f2Ac+RqUjOivwmP4IltVmK6Fk1BvJjCIe418yhhV7GOZV7IK0
	GF7K2kY2+RDX9ynJ2WTrhSKVHXX2gD16iDiIbiXGi7BvEh0+Zgid3FSsfUv10bFq
	Snt3Pp7CNxP2zBTqV4ydz3FCoyDTnnOozvhyQU0r7U2m/A==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 8XnJ08o8QUxG; Fri, 13 Feb 2026 17:44:08 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fCKKg1FjCzlfgPZ;
	Fri, 13 Feb 2026 17:44:06 +0000 (UTC)
Message-ID: <5157497a-3536-4187-883e-19a54167955a@acm.org>
Date: Fri, 13 Feb 2026 09:44:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: blktests failures with v6.19 kernel
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
References: <aY7ZBfMjVIhe_wh3@shinmob>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <aY7ZBfMjVIhe_wh3@shinmob>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <3W6AV3GSwfJ.A.pa8D.Gj2jpB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3487
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5157497a-3536-4187-883e-19a54167955a@acm.org
Resent-Date: Fri, 13 Feb 2026 18:09:10 +0000 (UTC)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[acm.org,reject];
	R_DKIM_ALLOW(-0.20)[acm.org:s=mr01];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[bvanassche@acm.org,bounce-nbd=lists@other.debian.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shinichiro.kawasaki@wdc.com,m:linux-block@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-scsi@vger.kernel.org,m:nbd@other.debian.org,m:linux-rdma@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists-other-nbd@bendel.debian.org];
	TAGGED_FROM(0.00)[nbd=lfdr.de];
	R_SPF_NA(0.00)[no SPF record];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bendel.debian.org:helo,bendel.debian.org:rdns,acm.org:mid,acm.org:dkim];
	FROM_NEQ_ENVFROM(0.00)[bvanassche@acm.org,bounce-nbd=lists@other.debian.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[acm.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[nbd];
	ASN(0.00)[asn:8365, ipnet:2001:41b8::/29, country:DE];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47ECF138D21
X-Rspamd-Action: no action

On 2/12/26 11:57 PM, Shinichiro Kawasaki wrote:
> [5] kmemleak at nvme/061 wiht rdma transport and siw driver
> 
> unreferenced object 0xffff888114792600 (size 32):
>    comm "kworker/2:1H", pid 66, jiffies 4295489358
>    hex dump (first 32 bytes):
>      c2 f6 83 05 00 ea ff ff 00 00 00 00 00 10 00 00  ................
>      00 b0 fd 60 81 88 ff ff 00 10 00 00 00 00 00 00  ...`............
>    backtrace (crc 3dbac61d):
>      __kmalloc_noprof+0x62f/0x8b0
>      sgl_alloc_order+0x74/0x330
>      0xffffffffc1b73433
>      0xffffffffc1bc1f0d
>      0xffffffffc1bc8064
>      __ib_process_cq+0x14f/0x3e0 [ib_core]
>      ib_cq_poll_work+0x49/0x160 [ib_core]
>      process_one_work+0x868/0x1480
>      worker_thread+0x5ee/0xfd0
>      kthread+0x3af/0x770
>      ret_from_fork+0x55c/0x810
>      ret_from_fork_asm+0x1a/0x30

There are no sgl_alloc() calls in the RDMA subsystem. I think the above
indicates a memory leak in either the RDMA NVMe target driver or in the
NVMe target core.

> [7] kmemleak at zbd/009
> 
> unreferenced object 0xffff88815f1f1280 (size 32):
>    comm "mount", pid 1745, jiffies 4294866235
>    hex dump (first 32 bytes):
>      6d 65 74 61 64 61 74 61 2d 74 72 65 65 6c 6f 67  metadata-treelog
>      00 93 9c fb af bb ae 00 00 00 00 00 00 00 00 00  ................
>    backtrace (crc 2ee03cc2):
>      __kmalloc_node_track_caller_noprof+0x66b/0x8c0
>      kstrdup+0x42/0xc0
>      kobject_set_name_vargs+0x44/0x110
>      kobject_init_and_add+0xcf/0x140
>      btrfs_sysfs_add_space_info_type+0xf2/0x200 [btrfs]
>      create_space_info_sub_group.constprop.0+0xfb/0x1b0 [btrfs]
>      create_space_info+0x247/0x320 [btrfs]
>      btrfs_init_space_info+0x143/0x1b0 [btrfs]
>      open_ctree+0x2eed/0x43fe [btrfs]
>      btrfs_get_tree.cold+0x90/0x1da [btrfs]
>      vfs_get_tree+0x87/0x2f0
>      vfs_cmd_create+0xbd/0x280
>      __do_sys_fsconfig+0x64f/0xa30
>      do_syscall_64+0x95/0x540
>      entry_SYSCALL_64_after_hwframe+0x76/0x7e
> unreferenced object 0xffff888128d80000 (size 16):
>    comm "mount", pid 1745, jiffies 4294866237
>    hex dump (first 16 bytes):
>      64 61 74 61 2d 72 65 6c 6f 63 00 4b 96 f6 48 82  data-reloc.K..H.
>    backtrace (crc 1598f702):
>      __kmalloc_node_track_caller_noprof+0x66b/0x8c0
>      kstrdup+0x42/0xc0
>      kobject_set_name_vargs+0x44/0x110
>      kobject_init_and_add+0xcf/0x140
>      btrfs_sysfs_add_space_info_type+0xf2/0x200 [btrfs]
>      create_space_info_sub_group.constprop.0+0xfb/0x1b0 [btrfs]
>      create_space_info+0x211/0x320 [btrfs]
>      open_ctree+0x2eed/0x43fe [btrfs]
>      btrfs_get_tree.cold+0x90/0x1da [btrfs]
>      vfs_get_tree+0x87/0x2f0
>      vfs_cmd_create+0xbd/0x280
>      __do_sys_fsconfig+0x64f/0xa30
>      do_syscall_64+0x95/0x540
>      entry_SYSCALL_64_after_hwframe+0x76/0x7e

Please report the above to the BTRFS maintainers.

Thanks,

Bart.

