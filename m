Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E730376659B
	for <lists+nbd@lfdr.de>; Fri, 28 Jul 2023 09:45:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7AC8B20882; Fri, 28 Jul 2023 07:45:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jul 28 07:45:08 2023
Old-Return-Path: <yukuai1@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RDNS_NONE,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 995C32087D
	for <lists-other-nbd@bendel.debian.org>; Fri, 28 Jul 2023 07:29:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.17 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MIME_CHARSET_FARAWAY=0.02, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.093, RDNS_NONE=0.793, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id EpvyPKkM5Hkt for <lists-other-nbd@bendel.debian.org>;
	Fri, 28 Jul 2023 07:29:29 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
X-Greylist: delayed 1122 seconds by postgrey-1.36 at bendel; Fri, 28 Jul 2023 07:29:28 UTC
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B699C2087C
	for <nbd@other.debian.org>; Fri, 28 Jul 2023 07:29:28 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.143])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4RBzLQ4cK5z4f3jM3
	for <nbd@other.debian.org>; Fri, 28 Jul 2023 15:10:38 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP4 (Coremail) with SMTP id gCh0CgAHoZTuacNknej3Ow--.21788S3;
	Fri, 28 Jul 2023 15:10:39 +0800 (CST)
Subject: Re: [PATCH -next] nbd: get config_lock before sock_shutdown
To: Zhong Jinghua <zhongjinghua@huaweicloud.com>, josef@toxicpanda.com,
 axboe@kernel.dk
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20230707062256.1271948-1-zhongjinghua@huaweicloud.com>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <779966af-844a-3dba-93f8-9daabde8c85b@huaweicloud.com>
Date: Fri, 28 Jul 2023 15:10:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20230707062256.1271948-1-zhongjinghua@huaweicloud.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAHoZTuacNknej3Ow--.21788S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWkCFWkuFWruw47uw45KFg_yoW8Cry3pF
	4UCF4DCr4rWa1S9FZ5G34xWr1UG343Ka17Gry8Zw1qvr93CrWI93WDKF1fCFyUKwnrJr4S
	qFyrKF95C3y3JrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42
	xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbPEf5UUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VR3--6I94DO.A.BGG.EI3wkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2582
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/779966af-844a-3dba-93f8-9daabde8c85b@huaweicloud.com
Resent-Date: Fri, 28 Jul 2023 07:45:08 +0000 (UTC)

�� 2023/07/07 14:22, Zhong Jinghua д��:
> Config->socks in sock_shutdown may trigger a UAF problem.
> The reason is that sock_shutdown does not hold the config_lock,
> so that nbd_ioctl can release config->socks at this time.
> 
> T0: NBD_SET_SOCK
> T1: NBD_DO_IT
> 
> T0						T1
> 
> nbd_ioctl
>    mutex_lock(&nbd->config_lock)
>    // get lock
>    __nbd_ioctl
>      nbd_start_device_ioctl
>        nbd_start_device
>         mutex_unlock(&nbd->config_lock)
>           // relase lock
>           wait_event_interruptible
>           (kill, enter sock_shutdown)
>           sock_shutdown
> 					nbd_ioctl
> 					  mutex_lock(&nbd->config_lock)
> 					  // get lock
> 					  __nbd_ioctl
> 					    nbd_add_socket
> 					      krealloc
> 						kfree(p)
> 					        //config->socks is NULL
>             nbd_sock *nsock = config->socks // error
> 
> Fix it by moving config_lock up before sock_shutdown.

LGTM
Reviewed-by: Yu Kuai <yukuai3@huawei.com>

> 
> Signed-off-by: Zhong Jinghua <zhongjinghua@huaweicloud.com>
> ---
>   drivers/block/nbd.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index c410cf29fb0c..accbe99ebb7e 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1428,13 +1428,18 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd)
>   	mutex_unlock(&nbd->config_lock);
>   	ret = wait_event_interruptible(config->recv_wq,
>   					 atomic_read(&config->recv_threads) == 0);
> +
> +	/*
> +	 * recv_work in flush_workqueue will not get this lock, because nbd_open
> +	 * will hold nbd->config_refs
> +	 */
> +	mutex_lock(&nbd->config_lock);
>   	if (ret) {
>   		sock_shutdown(nbd);
>   		nbd_clear_que(nbd);
>   	}
>   
>   	flush_workqueue(nbd->recv_workq);
> -	mutex_lock(&nbd->config_lock);
>   	nbd_bdev_reset(nbd);
>   	/* user requested, ignore socket errors */
>   	if (test_bit(NBD_RT_DISCONNECT_REQUESTED, &config->runtime_flags))
> 

