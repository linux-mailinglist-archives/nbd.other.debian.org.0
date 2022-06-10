Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EEA545C2B
	for <lists+nbd@lfdr.de>; Fri, 10 Jun 2022 08:24:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2F4FF20525; Fri, 10 Jun 2022 06:24:06 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jun 10 06:24:06 2022
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4487D20526
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Jun 2022 06:07:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.462 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MIME_CHARSET_FARAWAY=0.02,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.192, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id deqliYYQ1gMS for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Jun 2022 06:07:49 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id CE21320525
	for <nbd@other.debian.org>; Fri, 10 Jun 2022 06:07:48 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LK9Qj3k6szRhWb;
	Fri, 10 Jun 2022 14:04:29 +0800 (CST)
Received: from kwepemm600009.china.huawei.com (7.193.23.164) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 10 Jun 2022 14:07:43 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 kwepemm600009.china.huawei.com (7.193.23.164) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 10 Jun 2022 14:07:42 +0800
Subject: Re: [PATCH -next v4 3/6] nbd: don't clear 'NBD_CMD_INFLIGHT' flag if
 request is not completed
To: <josef@toxicpanda.com>, <axboe@kernel.dk>, <ming.lei@redhat.com>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>
References: <20220528021235.2120995-1-yukuai3@huawei.com>
 <20220528021235.2120995-4-yukuai3@huawei.com>
From: Yu Kuai <yukuai3@huawei.com>
Message-ID: <43a7b24c-6fd1-d6bd-4466-284d3a0962ac@huawei.com>
Date: Fri, 10 Jun 2022 14:07:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20220528021235.2120995-4-yukuai3@huawei.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600009.china.huawei.com (7.193.23.164)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <rEglr-X3L2M.A.wOH.GOuoiB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2136
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/43a7b24c-6fd1-d6bd-4466-284d3a0962ac@huawei.com
Resent-Date: Fri, 10 Jun 2022 06:24:06 +0000 (UTC)

ÔÚ 2022/05/28 10:12, Yu Kuai Ð´µÀ:
> Otherwise io will hung because request will only be completed if the
> cmd has the flag 'NBD_CMD_INFLIGHT'.
> 
> Fixes: 07175cb1baf4 ("nbd: make sure request completion won't concurrent")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>   drivers/block/nbd.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 2ee1e376d5c4..a673a97b9b6b 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -403,13 +403,14 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>   	if (!mutex_trylock(&cmd->lock))
>   		return BLK_EH_RESET_TIMER;
>   
> -	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
> +	if (!test_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
>   		mutex_unlock(&cmd->lock);
>   		return BLK_EH_DONE;
>   	}
>   
>   	if (!refcount_inc_not_zero(&nbd->config_refs)) {
>   		cmd->status = BLK_STS_TIMEOUT;
> +		__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
>   		mutex_unlock(&cmd->lock);
>   		goto done;
>   	}
> @@ -478,6 +479,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>   	dev_err_ratelimited(nbd_to_dev(nbd), "Connection timed out\n");
>   	set_bit(NBD_RT_TIMEDOUT, &config->runtime_flags);
>   	cmd->status = BLK_STS_IOERR;
> +	__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
>   	mutex_unlock(&cmd->lock);
>   	sock_shutdown(nbd);
>   	nbd_config_put(nbd);
> @@ -745,7 +747,7 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
>   	cmd = blk_mq_rq_to_pdu(req);
>   
>   	mutex_lock(&cmd->lock);
> -	if (!__test_and_clear_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
> +	if (!test_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
>   		dev_err(disk_to_dev(nbd->disk), "Suspicious reply %d (status %u flags %lu)",
>   			tag, cmd->status, cmd->flags);
>   		ret = -ENOENT;
> @@ -813,6 +815,10 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
>   	}
>   out:
>   	trace_nbd_payload_received(req, handle);
> +	if (!ret && likely(!blk_should_fake_timeout(req->q)))
> +		__clear_bit(NBD_CMD_INFLIGHT, &cmd->flags);
> +	else if (!ret)
> +		ret = -ENOENT;

Hi, Josef

Do you prefer to move blk_should_fake_time() into nbd_handle_reply()
like this ? Code is a litter simplier.

Thanks,
Kuai
>   	mutex_unlock(&cmd->lock);
>   	return ret ? ERR_PTR(ret) : cmd;
>   }
> @@ -854,8 +860,7 @@ static void recv_work(struct work_struct *work)
>   		}
>   
>   		rq = blk_mq_rq_from_pdu(cmd);
> -		if (likely(!blk_should_fake_timeout(rq->q)))
> -			blk_mq_complete_request(rq);
> +		blk_mq_complete_request(rq);
>   		percpu_ref_put(&q->q_usage_counter);
>   	}
>   
> 

