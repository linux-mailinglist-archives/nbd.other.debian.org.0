Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F3943637A
	for <lists+nbd@lfdr.de>; Thu, 21 Oct 2021 15:54:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CA90E202BA; Thu, 21 Oct 2021 13:54:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 21 13:54:10 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D28D620288
	for <lists-other-nbd@bendel.debian.org>; Thu, 21 Oct 2021 13:37:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.182 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id bFwtJIdI8LmF for <lists-other-nbd@bendel.debian.org>;
	Thu, 21 Oct 2021 13:37:33 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 1E3EB2024F
	for <nbd@other.debian.org>; Thu, 21 Oct 2021 13:37:33 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HZpM93TLYzbnJG;
	Thu, 21 Oct 2021 21:32:53 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 21:37:27 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Thu, 21 Oct 2021 21:37:27 +0800
Subject: Re: [PATCH 0/2] nbd: fix sanity check for first_minor
From: "yukuai (C)" <yukuai3@huawei.com>
To: Pavel Skripkin <paskripkin@gmail.com>, <josef@toxicpanda.com>,
	<axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>,
	<luomeng12@huawei.com>, Christoph Hellwig <hch@lst.de>
References: <20211021122936.758221-1-yukuai3@huawei.com>
 <72fb140d-609b-c035-bdd6-d2b8639c116b@gmail.com>
 <17182476-e5bf-f493-9d9b-fedb2d9c8e1a@huawei.com>
Message-ID: <92d9f001-f77b-8263-53a6-aab83daccef9@huawei.com>
Date: Thu, 21 Oct 2021 21:37:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <17182476-e5bf-f493-9d9b-fedb2d9c8e1a@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <zXhhoKu2WBF.A.lqD.CEXchB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1558
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/92d9f001-f77b-8263-53a6-aab83daccef9@huawei.com
Resent-Date: Thu, 21 Oct 2021 13:54:10 +0000 (UTC)

On 2021/10/21 21:13, yukuai (C) wrote:
> On 2021/10/21 20:35, Pavel Skripkin wrote:
>> On 10/21/21 15:29, Yu Kuai wrote:
>>> Yu Kuai (2):
>>>    nbd: fix max value for 'first_minor'
>>>    nbd: fix possible overflow for 'first_minor' in nbd_dev_add()
>>>
>>>   drivers/block/nbd.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>
>> Hi, Yu!
>>
>> Thank you for the fix, but this wrong check should be just removed, 
>> since root case of wrong sysfs file creation was fixed, as Christoph 
>> said [1]

Hi, Christoph

By the way, if we remove the checking, there will be two kernel warnings
when the problem happens. Maybe keeping the checking is better?

[   19.860640] sysfs: cannot create duplicate filename '/dev/block/43:0'
[   19.861659] CPU: 1 PID: 872 Comm: modprobe Not tainted 
5.15.0-rc6-next-20211020-00001-g2f1
[   19.863175] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
BIOS ?-20190727_0738364
[   19.865183] Call Trace:
[   19.866512]  <TASK>
[   19.866863]  ? dump_stack_lvl+0x73/0x9f
[   19.867941]  ? dump_stack+0x13/0x1b
[   19.868475]  ? sysfs_warn_dup.cold+0x27/0x45
[   19.869075]  ? sysfs_do_create_link_sd.isra.0+0x131/0x150
[   19.869818]  ? sysfs_create_link+0x29/0x60
[   19.870459]  ? device_add+0xbd6/0xf60
[   19.871032]  ? _printk+0x5f/0x7d
[   19.871518]  ? device_add_disk+0x153/0x5d0
[   19.872160]  ? nbd_dev_add+0x30e/0x470 [nbd]
[   19.872828]  ? 0xffffffffc0060000
[   19.873332]  ? nbd_init+0x1dc/0x1000 [nbd]
[   19.873924]  ? do_one_initcall+0x71/0x3a0
[   19.874534]  ? gcov_event+0x70/0x690
[   19.875058]  ? do_init_module+0xa6/0x350
[   19.875587]  ? load_module+0x2587/0x2720
[   19.876130]  ? kernel_read+0x31/0xb0
[   19.876638]  ? kernel_read_file+0x15a/0x360
[   19.877271]  ? __do_sys_finit_module+0xe5/0x190
[   19.877951]  ? __do_sys_finit_module+0xe5/0x190
[   19.878563]  ? __x64_sys_finit_module+0x1e/0x30
[   19.879182]  ? do_syscall_64+0x35/0x80
[   19.879700]  ? entry_SYSCALL_64_after_hwframe+0x44/0xae
[   19.880413]  </TASK>
[   19.880806] ------------[ cut here ]------------
[   19.881502] WARNING: CPU: 1 PID: 872 at block/genhd.c:543 
device_add_disk+0x2af/0x5d0
[   19.882695] Modules linked in: nbd(+)
[   19.883290] CPU: 1 PID: 872 Comm: modprobe Not tainted 
5.15.0-rc6-next-20211020-00001-g2f1
[   19.884823] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), 
BIOS ?-20190727_0738364
[   19.886866] RIP: 0010:device_add_disk+0x2af/0x5d0
[   19.887606] Code: 6e f2 f2 0b 01 49 8b 76 48 48 8b 3d db 03 f3 0b e8 
f6 ec a9 ff 48 83 050
[   19.890456] RSP: 0018:ffffc90000e47c70 EFLAGS: 00010202
[   19.891293] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
00000000000ae001
[   19.892274] RDX: 00000000000ac001 RSI: ffffffff91b5906b RDI: 
0000000000000000
[   19.893318] RBP: ffff8881034ad600 R08: 0000000000000000 R09: 
ffffffff915e2e69
[   19.894425] R10: 0000000000000014 R11: 0000000000000001 R12: 
00000000ffffffef
[   19.895544] R13: 0000000000000000 R14: ffff88817d720600 R15: 
ffff88817d720648
[   19.896652] FS:  00007fc08c7a7040(0000) GS:ffff88882f640000(0000) 
knlGS:0000000000000000
[   19.897902] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   19.898768] CR2: 00007fc08bcf0395 CR3: 000000017c467000 CR4: 
00000000000006e0
[   19.899754] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
0000000000000000
[   19.900856] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
0000000000000400
[   19.901989] Call Trace:
[   19.902387]  <TASK>
[   19.902732]  nbd_dev_add+0x30e/0x470 [nbd]
[   19.903395]  ? 0xffffffffc0060000
[   19.903917]  nbd_init+0x1dc/0x1000 [nbd]
[   19.904536]  do_one_initcall+0x71/0x3a0
[   19.905166]  ? gcov_event+0x70/0x690
[   19.905745]  do_init_module+0xa6/0x350
[   19.906351]  load_module+0x2587/0x2720
[   19.906932]  ? kernel_read+0x31/0xb0
[   19.907509]  ? kernel_read_file+0x15a/0x360
[   19.908195]  ? __do_sys_finit_module+0xe5/0x190
[   19.908894]  __do_sys_finit_module+0xe5/0x190
[   19.909591]  __x64_sys_finit_module+0x1e/0x30
[   19.910289]  do_syscall_64+0x35/0x80
[   19.910855]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   19.911652] RIP: 0033:0x7fc08bc7a4e9
[   19.912231] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 
48 89 f8 48 89 f7 488
[   19.915026] RSP: 002b:00007fff0ddf6fd8 EFLAGS: 00000246 ORIG_RAX: 
0000000000000139
[   19.916080] RAX: ffffffffffffffda RBX: 00005596400853e0 RCX: 
00007fc08bc7a4e9
[   19.917180] RDX: 0000000000000000 RSI: 000055963fe1bc26 RDI: 
0000000000000003
[   19.918302] RBP: 000055963fe1bc26 R08: 0000000000000000 R09: 
0000000000000000
[   19.919412] R10: 0000000000000003 R11: 0000000000000246 R12: 
0000000000000000
[   19.920524] R13: 00005596400854f0 R14: 0000000000040000 R15: 
00005596400853e0
[   19.921629]  </TASK>
[   19.922005] ---[ end trace e09ecf130812479d ]---

Thanks,
Kuai
> 
> Hi, Pavel
> 
> Thanks for your response, with the root cause fixed, patch 1 is not
> needed anymore. However, the overflow case in patch 2 is still
> possible.
> 
> Does anyone plan to remove the checking?
> 
> Thanks,
> Kuai
>>
>>
>>
>>
>> [1] https://lore.kernel.org/lkml/20211011073556.GA10735@lst.de/
>>
>>
>>
>> With regards,
>> Pavel Skripkin
>> .
>>

