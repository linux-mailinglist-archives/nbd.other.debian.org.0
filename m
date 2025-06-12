Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id DE945AD734A
	for <lists+nbd@lfdr.de>; Thu, 12 Jun 2025 16:12:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9CB6A2056C; Thu, 12 Jun 2025 14:12:17 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jun 12 14:12:17 2025
Old-Return-Path: <yukuai1@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=4.0 tests=FOURLA,NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B69E620582
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Jun 2025 13:56:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.379 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FOURLA=0.1, MIME_CHARSET_FARAWAY=0.02,
	NICE_REPLY_A=-1.201, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Q-Jz-iB9z9ht for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Jun 2025 13:56:34 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 1135 seconds by postgrey-1.36 at bendel; Thu, 12 Jun 2025 13:56:33 UTC
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id D682E20462
	for <nbd@other.debian.org>; Thu, 12 Jun 2025 13:56:33 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bJ3Vh6Fz5zYQvGn
	for <nbd@other.debian.org>; Thu, 12 Jun 2025 21:37:32 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id D8FE51A13D6
	for <nbd@other.debian.org>; Thu, 12 Jun 2025 21:37:31 +0800 (CST)
Received: from [10.174.179.143] (unknown [10.174.179.143])
	by APP4 (Coremail) with SMTP id gCh0CgCnCl8a2Epo7CMxPQ--.16770S3;
	Thu, 12 Jun 2025 21:37:31 +0800 (CST)
Subject: Re: [PATCH] nbd: fix uaf in nbd_genl_connect() error path
To: Zheng Qixing <zhengqixing@huaweicloud.com>, josef@toxicpanda.com,
 axboe@kernel.dk, xiubli@redhat.com, prasanna.kalever@redhat.com,
 ming.lei@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 zhengqixing@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20250612132405.364904-1-zhengqixing@huaweicloud.com>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <c12c045b-fba4-c03d-1d2e-db90f6a5d76b@huaweicloud.com>
Date: Thu, 12 Jun 2025 21:37:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20250612132405.364904-1-zhengqixing@huaweicloud.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgCnCl8a2Epo7CMxPQ--.16770S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGFWkKr13JFW8ZFyxXw1fZwb_yoW5GrWDpa
	nxG3s7CrW8u34vy395A3W8CFy8JF43Xr4fGryxJw13uFW3Ar4j9r9Y93Z8WFyDGry0vFy5
	AF9Fqry8K3WUJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IE
	e2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4I
	kC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWU
	WwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr
	0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWU
	JVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjxUOBMKDUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gqJD__VOMCF.A.BN5G.BBuSoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3389
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c12c045b-fba4-c03d-1d2e-db90f6a5d76b@huaweicloud.com
Resent-Date: Thu, 12 Jun 2025 14:12:17 +0000 (UTC)

ÔÚ 2025/06/12 21:24, Zheng Qixing Ð´µÀ:
> From: Zheng Qixing<zhengqixing@huawei.com>
> 
> There is a use-after-free issue in nbd:
> 
> block nbd6: Receive control failed (result -104)
> block nbd6: shutting down sockets
> ==================================================================
> BUG: KASAN: slab-use-after-free in recv_work+0x694/0xa80 drivers/block/nbd.c:1022
> Write of size 4 at addr ffff8880295de478 by task kworker/u33:0/67
> 
> CPU: 2 UID: 0 PID: 67 Comm: kworker/u33:0 Not tainted 6.15.0-rc5-syzkaller-00123-g2c89c1b655c0 #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> Workqueue: nbd6-recv recv_work
> Call Trace:
>   <TASK>
>   __dump_stack lib/dump_stack.c:94 [inline]
>   dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
>   print_address_description mm/kasan/report.c:408 [inline]
>   print_report+0xc3/0x670 mm/kasan/report.c:521
>   kasan_report+0xe0/0x110 mm/kasan/report.c:634
>   check_region_inline mm/kasan/generic.c:183 [inline]
>   kasan_check_range+0xef/0x1a0 mm/kasan/generic.c:189
>   instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
>   atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
>   recv_work+0x694/0xa80 drivers/block/nbd.c:1022
>   process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
>   process_scheduled_works kernel/workqueue.c:3319 [inline]
>   worker_thread+0x6c8/0xf10 kernel/workqueue.c:3400
>   kthread+0x3c2/0x780 kernel/kthread.c:464
>   ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>   </TASK>
> 
> nbd_genl_connect() does not properly stop the device on certain
> error paths after nbd_start_device() has been called. This causes
> the error path to put nbd->config while recv_work continue to use
> the config after putting it, leading to use-after-free in recv_work.
> 
> This patch moves nbd_start_device() after the backend file creation.
> 
> Reported-by:syzbot+48240bab47e705c53126@syzkaller.appspotmail.com
> Closes:https://lore.kernel.org/all/68227a04.050a0220.f2294.00b5.GAE@google.com/T/
> Fixes: 6497ef8df568 ("nbd: provide a way for userspace processes to identify device backends")
> Signed-off-by: Zheng Qixing<zhengqixing@huawei.com>
> ---
>   drivers/block/nbd.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Yu Kuai <yukuai3@huawei.com>

