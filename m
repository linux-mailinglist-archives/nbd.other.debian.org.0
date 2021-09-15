Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0474B40BEA5
	for <lists+nbd@lfdr.de>; Wed, 15 Sep 2021 05:54:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9F51A20674; Wed, 15 Sep 2021 03:54:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 15 03:54:10 2021
Old-Return-Path: <yukuai3@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 536C22072E
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 Sep 2021 03:36:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.15 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NxhbF2UVYcZ2 for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 Sep 2021 03:36:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4E7DB20347
	for <nbd@other.debian.org>; Wed, 15 Sep 2021 03:36:54 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H8QlG4jPlzR9tK;
	Wed, 15 Sep 2021 11:32:42 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Wed, 15 Sep 2021 11:36:48 +0800
Received: from [10.174.176.73] (10.174.176.73) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Wed, 15 Sep 2021 11:36:48 +0800
Subject: Re: [PATCH v5 5/6] nbd: convert to use blk_mq_find_and_get_req()
To: Ming Lei <ming.lei@redhat.com>
CC: <axboe@kernel.dk>, <josef@toxicpanda.com>, <hch@infradead.org>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<nbd@other.debian.org>, <yi.zhang@huawei.com>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
 <20210909141256.2606682-6-yukuai3@huawei.com> <YT/2z4PSeW5oJWMq@T590>
 <c6af73a2-f12d-eeef-616e-ae0cdb4f6f2d@huawei.com> <YUBE4BJ7+kN1c4l8@T590>
 <374c6b37-b4b2-fe01-66be-ca2dbbc283e9@huawei.com> <YUBTVBioqJ7qas2R@T590>
 <b8301834-5541-76ee-13a9-0fa565fce7e3@huawei.com> <YUCzr2ysb+vJ1x0W@T590>
 <8f1849a3-6bf2-6b14-7ef9-4969a9a5425b@huawei.com> <YUFldgfRYrJyxFtz@T590>
From: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <60f68f6b-5fff-6a39-b77b-4bbb86f1c87e@huawei.com>
Date: Wed, 15 Sep 2021 11:36:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YUFldgfRYrJyxFtz@T590>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.176.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8RFK__47zqC.A.Y-E.i5WQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1464
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/60f68f6b-5fff-6a39-b77b-4bbb86f1c87e@huawei.com
Resent-Date: Wed, 15 Sep 2021 03:54:10 +0000 (UTC)

On 2021/09/15 11:16, Ming Lei wrote:
> On Wed, Sep 15, 2021 at 09:54:09AM +0800, yukuai (C) wrote:
>> On 2021/09/14 22:37, Ming Lei wrote:
>>> On Tue, Sep 14, 2021 at 05:19:31PM +0800, yukuai (C) wrote:
>>>> On 在 2021/09/14 15:46, Ming Lei wrote:
>>>>
>>>>> If the above can happen, blk_mq_find_and_get_req() may not fix it too, just
>>>>> wondering why not take the following simpler way for avoiding the UAF?
>>>>>
>>>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>>>> index 5170a630778d..dfa5cce71f66 100644
>>>>> --- a/drivers/block/nbd.c
>>>>> +++ b/drivers/block/nbd.c
>>>>> @@ -795,9 +795,13 @@ static void recv_work(struct work_struct *work)
>>>>>     						     work);
>>>>>     	struct nbd_device *nbd = args->nbd;
>>>>>     	struct nbd_config *config = nbd->config;
>>>>> +	struct request_queue *q = nbd->disk->queue;
>>>>>     	struct nbd_cmd *cmd;
>>>>>     	struct request *rq;
>>>>> +	if (!percpu_ref_tryget(&q->q_usage_counter))
>>>>> +                return;
>>>>> +
>>>>>     	while (1) {
>>>>>     		cmd = nbd_read_stat(nbd, args->index);
>>>>>     		if (IS_ERR(cmd)) {
>>>>> @@ -813,6 +817,7 @@ static void recv_work(struct work_struct *work)
>>>>>     		if (likely(!blk_should_fake_timeout(rq->q)))
>>>>>     			blk_mq_complete_request(rq);
>>>>>     	}
>>>>> +	blk_queue_exit(q);
>>>>>     	nbd_config_put(nbd);
>>>>>     	atomic_dec(&config->recv_threads);
>>>>>     	wake_up(&config->recv_wq);
>>>>>
>>>>
>>>> Hi, Ming
>>>>
>>>> This apporch is wrong.
>>>>
>>>> If blk_mq_freeze_queue() is called, and nbd is waiting for all
>>>> request to complete. percpu_ref_tryget() will fail here, and deadlock
>>>> will occur because request can't complete in recv_work().
>>>
>>> No, percpu_ref_tryget() won't fail until ->q_usage_counter is zero, when
>>> it is perfectly fine to do nothing in recv_work().
>>>
>>
>> Hi Ming
>>
>> This apporch is a good idea, however we should not get q_usage_counter
>> in reccv_work(), because It will block freeze queue.
>>
>> How about get q_usage_counter in nbd_read_stat(), and put in error path
>> or after request completion?
> 
> OK, looks I missed that nbd_read_stat() needs to wait for incoming reply
> first, so how about the following change by partitioning nbd_read_stat()
> into nbd_read_reply() and nbd_handle_reply()?

Hi, Ming

The change looks good to me.

Do you want to send a patch to fix this?

Thanks,
Kuai
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 5170a630778d..477fe057fc93 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -683,38 +683,47 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
>   	return 0;
>   }
>   
> -/* NULL returned = something went wrong, inform userspace */
> -static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
> +static int nbd_read_reply(struct nbd_device *nbd, int index,
> +		struct nbd_reply *reply)
>   {
> -	struct nbd_config *config = nbd->config;
>   	int result;
> -	struct nbd_reply reply;
> -	struct nbd_cmd *cmd;
> -	struct request *req = NULL;
> -	u64 handle;
> -	u16 hwq;
> -	u32 tag;
> -	struct kvec iov = {.iov_base = &reply, .iov_len = sizeof(reply)};
> +	struct kvec iov = {.iov_base = reply, .iov_len = sizeof(*reply)};
>   	struct iov_iter to;
> -	int ret = 0;
>   
> -	reply.magic = 0;
> +	reply->magic = 0;
>   	iov_iter_kvec(&to, READ, &iov, 1, sizeof(reply));
>   	result = sock_xmit(nbd, index, 0, &to, MSG_WAITALL, NULL);
> -	if (result <= 0) {
> -		if (!nbd_disconnected(config))
> +	if (result < 0) {
> +		if (!nbd_disconnected(nbd->config))
>   			dev_err(disk_to_dev(nbd->disk),
>   				"Receive control failed (result %d)\n", result);
> -		return ERR_PTR(result);
> +		return result;
>   	}
>   
> -	if (ntohl(reply.magic) != NBD_REPLY_MAGIC) {
> +	if (ntohl(reply->magic) != NBD_REPLY_MAGIC) {
>   		dev_err(disk_to_dev(nbd->disk), "Wrong magic (0x%lx)\n",
> -				(unsigned long)ntohl(reply.magic));
> -		return ERR_PTR(-EPROTO);
> +				(unsigned long)ntohl(reply->magic));
> +		return -EPROTO;
>   	}
>   
> -	memcpy(&handle, reply.handle, sizeof(handle));
> +	return 0;
> +}
> +
> +/* NULL returned = something went wrong, inform userspace */
> +static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
> +		struct nbd_reply *reply)
> +{
> +	struct nbd_config *config = nbd->config;
> +	int result;
> +	struct nbd_cmd *cmd;
> +	struct request *req = NULL;
> +	u64 handle;
> +	u16 hwq;
> +	u32 tag;
> +	struct iov_iter to;
> +	int ret = 0;
> +
> +	memcpy(&handle, reply->handle, sizeof(handle));
>   	tag = nbd_handle_to_tag(handle);
>   	hwq = blk_mq_unique_tag_to_hwq(tag);
>   	if (hwq < nbd->tag_set.nr_hw_queues)
> @@ -747,9 +756,9 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
>   		ret = -ENOENT;
>   		goto out;
>   	}
> -	if (ntohl(reply.error)) {
> +	if (ntohl(reply->error)) {
>   		dev_err(disk_to_dev(nbd->disk), "Other side returned error (%d)\n",
> -			ntohl(reply.error));
> +			ntohl(reply->error));
>   		cmd->status = BLK_STS_IOERR;
>   		goto out;
>   	}
> @@ -795,24 +804,36 @@ static void recv_work(struct work_struct *work)
>   						     work);
>   	struct nbd_device *nbd = args->nbd;
>   	struct nbd_config *config = nbd->config;
> +	struct request_queue *q = nbd->disk->queue;
> +	struct nbd_sock *nsock;
>   	struct nbd_cmd *cmd;
>   	struct request *rq;
>   
>   	while (1) {
> -		cmd = nbd_read_stat(nbd, args->index);
> -		if (IS_ERR(cmd)) {
> -			struct nbd_sock *nsock = config->socks[args->index];
> +		struct nbd_reply reply;
>   
> -			mutex_lock(&nsock->tx_lock);
> -			nbd_mark_nsock_dead(nbd, nsock, 1);
> -			mutex_unlock(&nsock->tx_lock);
> +		if (nbd_read_reply(nbd, args->index, &reply))
>   			break;
> -		}
>   
> +		if (!percpu_ref_tryget(&q->q_usage_counter))
> +			break;
> +
> +		cmd = nbd_handle_reply(nbd, args->index, &reply);
> +		if (IS_ERR(cmd)) {
> +			blk_queue_exit(q);
> +			break;
> +		}
>   		rq = blk_mq_rq_from_pdu(cmd);
>   		if (likely(!blk_should_fake_timeout(rq->q)))
>   			blk_mq_complete_request(rq);
> +		blk_queue_exit(q);
>   	}
> +
> +	nsock = config->socks[args->index];
> +	mutex_lock(&nsock->tx_lock);
> +	nbd_mark_nsock_dead(nbd, nsock, 1);
> +	mutex_unlock(&nsock->tx_lock);
> +
>   	nbd_config_put(nbd);
>   	atomic_dec(&config->recv_threads);
>   	wake_up(&config->recv_wq);
> 
> 
> Thanks,
> Ming
> 
> .
> 

