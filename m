Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2418B97419
	for <lists+nbd@lfdr.de>; Wed, 21 Aug 2019 09:57:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0B6DA20448; Wed, 21 Aug 2019 07:57:38 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 21 07:57:38 2019
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FVGT_m_MULTI_ODD,LDOSUBSCRIBER,LDO_WHITELIST,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id F092D20406
	for <lists-other-nbd@bendel.debian.org>; Wed, 21 Aug 2019 07:57:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.86 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_HI=-5] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iYjNRaWWEoXE for <lists-other-nbd@bendel.debian.org>;
	Wed, 21 Aug 2019 07:57:25 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 8E5EE20417
	for <nbd@other.debian.org>; Wed, 21 Aug 2019 07:57:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50C48307D88D;
	Wed, 21 Aug 2019 07:57:22 +0000 (UTC)
Received: from [10.72.12.72] (ovpn-12-72.pek2.redhat.com [10.72.12.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1D5E2C8D2;
	Wed, 21 Aug 2019 07:57:19 +0000 (UTC)
Subject: Re: [PATCH] nbd: fix possible page fault for nbd disk
To: josef@toxicpanda.com, axboe@kernel.dk
Cc: mchristi@redhat.com, linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20190821070148.8502-1-xiubli@redhat.com>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <042aed1d-9a42-a27d-fad9-47cdf35c38af@redhat.com>
Date: Wed, 21 Aug 2019 15:57:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821070148.8502-1-xiubli@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 21 Aug 2019 07:57:22 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <r2QA1K3amNC.A.atD.ylPXdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/623
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/042aed1d-9a42-a27d-fad9-47cdf35c38af@redhat.com
Resent-Date: Wed, 21 Aug 2019 07:57:38 +0000 (UTC)

FYI.

This patch still have some problems.

Will check it more.
Thanks.

On 2019/8/21 15:01, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
>
> When the NBD_CFLAG_DESTROY_ON_DISCONNECT flag is set and at the same
> time when the socket is closed due to the server daemon is restarted,
> there will be crashing randomly, like:
>
> <3>[  110.151949] block nbd1: Receive control failed (result -32)
> <1>[  110.152024] BUG: unable to handle page fault for address: 0000058000000840
> <1>[  110.152063] #PF: supervisor read access in kernel mode
> <1>[  110.152083] #PF: error_code(0x0000) - not-present page
> <6>[  110.152094] PGD 0 P4D 0
> <4>[  110.152106] Oops: 0000 [#1] SMP PTI
> <4>[  110.152120] CPU: 0 PID: 6698 Comm: kworker/u5:1 Kdump: loaded Not tainted 5.3.0-rc4+ #2
> <4>[  110.152136] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
> <4>[  110.152166] Workqueue: knbd-recv recv_work [nbd]
> <4>[  110.152187] RIP: 0010:__dev_printk+0xd/0x67
> <4>[  110.152206] Code: 10 e8 c5 fd ff ff 48 8b 4c 24 18 65 48 33 0c 25 28 00 [...]
> <4>[  110.152244] RSP: 0018:ffffa41581f13d18 EFLAGS: 00010206
> <4>[  110.152256] RAX: ffffa41581f13d30 RBX: ffff96dd7374e900 RCX: 0000000000000000
> <4>[  110.152271] RDX: ffffa41581f13d20 RSI: 00000580000007f0 RDI: ffffffff970ec24f
> <4>[  110.152285] RBP: ffffa41581f13d80 R08: ffff96dd7fc17908 R09: 0000000000002e56
> <4>[  110.152299] R10: ffffffff970ec24f R11: 0000000000000003 R12: ffff96dd7374e900
> <4>[  110.152313] R13: 0000000000000000 R14: ffff96dd7374e9d8 R15: ffff96dd6e3b02c8
> <4>[  110.152329] FS:  0000000000000000(0000) GS:ffff96dd7fc00000(0000) knlGS:0000000000000000
> <4>[  110.152362] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4>[  110.152383] CR2: 0000058000000840 CR3: 0000000067cc6002 CR4: 00000000001606f0
> <4>[  110.152401] Call Trace:
> <4>[  110.152422]  _dev_err+0x6c/0x83
> <4>[  110.152435]  nbd_read_stat.cold+0xda/0x578 [nbd]
> <4>[  110.152448]  ? __switch_to_asm+0x34/0x70
> <4>[  110.152468]  ? __switch_to_asm+0x40/0x70
> <4>[  110.152478]  ? __switch_to_asm+0x34/0x70
> <4>[  110.152491]  ? __switch_to_asm+0x40/0x70
> <4>[  110.152501]  ? __switch_to_asm+0x34/0x70
> <4>[  110.152511]  ? __switch_to_asm+0x40/0x70
> <4>[  110.152522]  ? __switch_to_asm+0x34/0x70
> <4>[  110.152533]  recv_work+0x35/0x9e [nbd]
> <4>[  110.152547]  process_one_work+0x19d/0x340
> <4>[  110.152558]  worker_thread+0x50/0x3b0
> <4>[  110.152568]  kthread+0xfb/0x130
> <4>[  110.152577]  ? process_one_work+0x340/0x340
> <4>[  110.152609]  ? kthread_park+0x80/0x80
> <4>[  110.152637]  ret_from_fork+0x35/0x40
>
> This is very easy to reproduce by running the nbd-runner.
>
> Signed-off-by: Xiubo Li <xiubli@redhat.com>
> ---
>   drivers/block/nbd.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index e21d2ded732b..bf5e4227c54d 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -26,6 +26,7 @@
>   #include <linux/ioctl.h>
>   #include <linux/mutex.h>
>   #include <linux/compiler.h>
> +#include <linux/completion.h>
>   #include <linux/err.h>
>   #include <linux/kernel.h>
>   #include <linux/slab.h>
> @@ -112,6 +113,8 @@ struct nbd_device {
>   	struct list_head list;
>   	struct task_struct *task_recv;
>   	struct task_struct *task_setup;
> +
> +	struct completion complete;
>   };
>   
>   #define NBD_CMD_REQUEUED	1
> @@ -231,6 +234,13 @@ static void nbd_put(struct nbd_device *nbd)
>   					&nbd_index_mutex)) {
>   		idr_remove(&nbd_index_idr, nbd->index);
>   		mutex_unlock(&nbd_index_mutex);
> +
> +		/* Wait untill the recv_work exit */
> +		wait_for_completion(&nbd->complete);
> +
> +		kfree(nbd->config);
> +		nbd->config = NULL;
> +
>   		nbd_dev_remove(nbd);
>   	}
>   }
> @@ -1134,8 +1144,6 @@ static void nbd_config_put(struct nbd_device *nbd)
>   			}
>   			kfree(config->socks);
>   		}
> -		kfree(nbd->config);
> -		nbd->config = NULL;
>   
>   		nbd->tag_set.timeout = 0;
>   		nbd->disk->queue->limits.discard_granularity = 0;
> @@ -1143,6 +1151,8 @@ static void nbd_config_put(struct nbd_device *nbd)
>   		blk_queue_max_discard_sectors(nbd->disk->queue, UINT_MAX);
>   		blk_queue_flag_clear(QUEUE_FLAG_DISCARD, nbd->disk->queue);
>   
> +		complete(&nbd->complete);
> +
>   		mutex_unlock(&nbd->config_lock);
>   		nbd_put(nbd);
>   		module_put(THIS_MODULE);
> @@ -1596,6 +1606,7 @@ static int nbd_dev_add(int index)
>   	nbd->tag_set.flags = BLK_MQ_F_SHOULD_MERGE |
>   		BLK_MQ_F_BLOCKING;
>   	nbd->tag_set.driver_data = nbd;
> +	init_completion(&nbd->complete);
>   
>   	err = blk_mq_alloc_tag_set(&nbd->tag_set);
>   	if (err)


