Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D77DFE75
	for <lists+nbd@lfdr.de>; Fri,  3 Nov 2023 04:48:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 860F22070D; Fri,  3 Nov 2023 03:48:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov  3 03:48:10 2023
Old-Return-Path: <yukuai1@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=4.0 tests=CC_TOO_MANY,FOURLA,
	NICE_REPLY_A,RCVD_IN_MSPIKE_H2,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4EBB120647
	for <lists-other-nbd@bendel.debian.org>; Fri,  3 Nov 2023 03:30:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.456 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FOURLA=0.1,
	MIME_CHARSET_FARAWAY=0.02, NICE_REPLY_A=-3.058,
	RCVD_IN_MSPIKE_H2=-0.518] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Rc8BVIccaSGX for <lists-other-nbd@bendel.debian.org>;
	Fri,  3 Nov 2023 03:30:38 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6CBA820641
	for <nbd@other.debian.org>; Fri,  3 Nov 2023 03:30:38 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SM5q80VB2z4f3kpc
	for <nbd@other.debian.org>; Fri,  3 Nov 2023 11:30:28 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 3BC931A0175
	for <nbd@other.debian.org>; Fri,  3 Nov 2023 11:30:30 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP4 (Coremail) with SMTP id gCh0CgAnt9ZUaURlM4vDEg--.56230S3;
	Fri, 03 Nov 2023 11:30:30 +0800 (CST)
Subject: Re: [PATCH] nbd: fix uaf in nbd_open
To: Li Lingfeng <lilingfeng@huaweicloud.com>, josef@toxicpanda.com
Cc: linux-kernel@vger.kernel.org, hch@lst.de, linux-block@vger.kernel.org,
 nbd@other.debian.org, axboe@kernel.dk, chaitanya.kulkarni@wdc.com,
 yukuai1@huaweicloud.com, houtao1@huawei.com, yi.zhang@huawei.com,
 yangerkun@huawei.com, lilingfeng3@huawei.com, "yukuai (C)"
 <yukuai3@huawei.com>
References: <20231103101334.1750094-1-lilingfeng@huaweicloud.com>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <07045515-6668-19bc-def8-45fb0e9fe2ed@huaweicloud.com>
Date: Fri, 3 Nov 2023 11:30:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20231103101334.1750094-1-lilingfeng@huaweicloud.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAnt9ZUaURlM4vDEg--.56230S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4fKw17Jr47uw4fCry7Awb_yoW8GrW3pF
	Z8GF1qk3y8Wr43Ka1xJw17ZF1rXw1UW348uFnru3sI9F9xKr9I9r48GF95WFn8tr47Arsr
	XFWqqw18Z3Z7CrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E
	3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <E1dwTYgS-YD.A.FTE.61GRlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2665
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/07045515-6668-19bc-def8-45fb0e9fe2ed@huaweicloud.com
Resent-Date: Fri,  3 Nov 2023 03:48:10 +0000 (UTC)

Hi,

ÔÚ 2023/11/03 18:13, Li Lingfeng Ð´µÀ:
> From: Li Lingfeng <lilingfeng3@huawei.com>
> 
> Commit 4af5f2e03013 ("nbd: use blk_mq_alloc_disk and
> blk_cleanup_disk") cleans up disk by blk_cleanup_disk() and it won't set
> disk->private_data as NULL as before. UAF may be triggered in nbd_open()
> if someone tries to open nbd device right after nbd_put() since refcount
> of nbd device is zero and private_data is not NULL.
> 
Do you mean that nbd_open concurrent with nbd_dev_remove?

nbd_open		nbd_dev_remove
			 del_gendisk
			 kfree(nbd)
  mutex_lock
  nbd = disk->private_data
  -> UAF
  refcount_inc_not_zero

Looks like it's possible, but you should use READ/WRITE_ONCE() here,
because disk->pravate_data can be accessed concurrently.

Thanks,
Kuai

> Fixes: 4af5f2e03013 ("nbd: use blk_mq_alloc_disk and blk_cleanup_disk")
> Signed-off-by: Li Lingfeng <lilingfeng3@huawei.com>
> ---
>   drivers/block/nbd.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 800f131222fc..aab93b836e84 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -250,6 +250,7 @@ static void nbd_dev_remove(struct nbd_device *nbd)
>   	struct gendisk *disk = nbd->disk;
>   
>   	del_gendisk(disk);
> +	disk->private_data = NULL;
>   	put_disk(disk);
>   	blk_mq_free_tag_set(&nbd->tag_set);
>   
> 

