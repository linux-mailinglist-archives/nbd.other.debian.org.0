Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB6B8E27D
	for <lists+nbd@lfdr.de>; Thu, 15 Aug 2019 03:45:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5904C20A08; Thu, 15 Aug 2019 01:45:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 15 01:45:10 2019
Old-Return-Path: <sunke32@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1C166209F3
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Aug 2019 01:27:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.26 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MIME_CHARSET_FARAWAY=0.02,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VfzbFad6Si7u for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Aug 2019 01:27:25 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 HELO_IP_IN_CL_SUBNET=-1.2 (check from: .huawei. - helo: .huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -4.7
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id EB02B209CA
	for <nbd@other.debian.org>; Thu, 15 Aug 2019 01:27:22 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 8239D636284E109C16C6;
	Thu, 15 Aug 2019 09:27:18 +0800 (CST)
Received: from [127.0.0.1] (10.184.194.169) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Thu, 15 Aug 2019
 09:27:14 +0800
Subject: Re: [PATCH] nbd: add a missed nbd_config_put() in nbd_xmit_timeout()
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <linux-block@vger.kernel.org>,
	<nbd@other.debian.org>, <linux-kernel@vger.kernel.org>
References: <1565613086-13776-1-git-send-email-sunke32@huawei.com>
From: "sunke (E)" <sunke32@huawei.com>
Message-ID: <05b3cd4a-d2c1-5ad7-7a39-64bac470032a@huawei.com>
Date: Thu, 15 Aug 2019 09:27:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565613086-13776-1-git-send-email-sunke32@huawei.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.184.194.169]
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gGnFKfZ2LNC.A.70.mkLVdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/619
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/05b3cd4a-d2c1-5ad7-7a39-64bac470032a@huawei.com
Resent-Date: Thu, 15 Aug 2019 01:45:10 +0000 (UTC)

ping

ÔÚ 2019/8/12 20:31, Sun Ke Ð´µÀ:
> When try to get the lock failed, before return, execute the
> nbd_config_put() to decrease the nbd->config_refs.
> 
> If the nbd->config_refs is added but not decreased. Then will not
> execute nbd_clear_sock() in nbd_config_put(). bd->task_setup will
> not be cleared away. Finally, print"Device being setup by another
> task" in nbd_add_sock() and nbd device can not be reused.
> 
> Fixes: 8f3ea35929a0 ("nbd: handle unexpected replies better")
> Signed-off-by: Sun Ke <sunke32@huawei.com>
> ---
>   drivers/block/nbd.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index e21d2de..a69a90a 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -357,8 +357,10 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>   	}
>   	config = nbd->config;
>   
> -	if (!mutex_trylock(&cmd->lock))
> +	if (!mutex_trylock(&cmd->lock)) {
> +		nbd_config_put(nbd);
>   		return BLK_EH_RESET_TIMER;
> +	}
>   
>   	if (config->num_connections > 1) {
>   		dev_err_ratelimited(nbd_to_dev(nbd),
> 

