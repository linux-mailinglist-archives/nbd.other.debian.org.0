Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id EE02C434E14
	for <lists+nbd@lfdr.de>; Wed, 20 Oct 2021 16:39:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D5A152034D; Wed, 20 Oct 2021 14:39:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 20 14:39:20 2021
Old-Return-Path: <yebin10@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=4.0 tests=DIGITS_LETTERS,FOURLA,
	FVGT_m_MULTI_ODD,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 351852037E
	for <lists-other-nbd@bendel.debian.org>; Wed, 20 Oct 2021 14:23:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.162 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OF6vyH3jLPrC for <lists-other-nbd@bendel.debian.org>;
	Wed, 20 Oct 2021 14:23:52 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B6D592037D
	for <nbd@other.debian.org>; Wed, 20 Oct 2021 14:23:51 +0000 (UTC)
Received: from dggeme754-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HZCVv52JDz8tjk;
	Wed, 20 Oct 2021 22:22:31 +0800 (CST)
Received: from [10.174.178.185] (10.174.178.185) by
 dggeme754-chm.china.huawei.com (10.3.19.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.15; Wed, 20 Oct 2021 22:23:45 +0800
Subject: Re: [PATCH -next] nbd: Fix hungtask when nbd_config_put
To: Josef Bacik <josef@toxicpanda.com>
References: <20211020094830.3056325-1-yebin10@huawei.com>
 <YXAh7tWFbpukMi6+@localhost.localdomain>
CC: <axboe@kernel.dk>, <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
From: yebin <yebin10@huawei.com>
Message-ID: <61702671.6050807@huawei.com>
Date: Wed, 20 Oct 2021 22:23:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <YXAh7tWFbpukMi6+@localhost.localdomain>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.185]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme754-chm.china.huawei.com (10.3.19.100)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YL82ihm16EM.A.MHF.YoCchB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1548
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/61702671.6050807@huawei.com
Resent-Date: Wed, 20 Oct 2021 14:39:20 +0000 (UTC)



On 2021/10/20 22:04, Josef Bacik wrote:
> On Wed, Oct 20, 2021 at 05:48:30PM +0800, Ye Bin wrote:
>> I got follow issue:
>> [  247.381177] INFO: task kworker/u10:0:47 blocked for more than 120 seconds.
>> [  247.382644]       Not tainted 4.19.90-dirty #140
>> [  247.383502] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> [  247.385027] Call Trace:
>> [  247.388384]  schedule+0xb8/0x3c0
>> [  247.388966]  schedule_timeout+0x2b4/0x380
>> [  247.392815]  wait_for_completion+0x367/0x510
>> [  247.397713]  flush_workqueue+0x32b/0x1340
>> [  247.402700]  drain_workqueue+0xda/0x3c0
>> [  247.403442]  destroy_workqueue+0x7b/0x690
>> [  247.405014]  nbd_config_put.cold+0x2f9/0x5b6
>> [  247.405823]  recv_work+0x1fd/0x2b0
>> [  247.406485]  process_one_work+0x70b/0x1610
>> [  247.407262]  worker_thread+0x5a9/0x1060
>> [  247.408699]  kthread+0x35e/0x430
>> [  247.410918]  ret_from_fork+0x1f/0x30
>>
>> We can reprodeuce issue as follows:
>> 1. Inject memory fault in nbd_start_device
>> @@ -1244,10 +1248,18 @@ static int nbd_start_device(struct nbd_device *nbd)
>>          nbd_dev_dbg_init(nbd);
>>          for (i = 0; i < num_connections; i++) {
>>                  struct recv_thread_args *args;
>> -
>> -               args = kzalloc(sizeof(*args), GFP_KERNEL);
>> +
>> +               if (i == 1) {
>> +                       args = NULL;
>> +                       printk("%s: inject malloc error\n", __func__);
>> +               }
>> +               else
>> +                       args = kzalloc(sizeof(*args), GFP_KERNEL);
>> 2. Inject delay in recv_work
>> @@ -757,6 +760,8 @@ static void recv_work(struct work_struct *work)
>>
>>                  blk_mq_complete_request(blk_mq_rq_from_pdu(cmd));
>>          }
>> +       printk("%s: comm=%s pid=%d\n", __func__, current->comm, current->pid);
>> +       mdelay(5 * 1000);
>>          nbd_config_put(nbd);
>>          atomic_dec(&config->recv_threads);
>>          wake_up(&config->recv_wq);
>> 3. Create nbd server
>> nbd-server 8000 /tmp/disk
>> 4. Create nbd client
>> nbd-client localhost 8000 /dev/nbd1
>> Then will trigger above issue.
>>
>> Reason is when add delay in recv_work, lead to relase the last reference
>> of 'nbd->config_refs'. nbd_config_put will call flush_workqueue to make
>> all work finish. Obviously, it will lead to deadloop.
>> To solve this issue, we must ensure 'recv_work' all exit before release
>> the last 'nbd->config_refs' reference count.
>>
>> Signed-off-by: Ye Bin <yebin10@huawei.com>
> This isn't the way to fix this.  The crux of the problem is the fact that we
> destroy the recv_workq at config time anyway, since it is tied to the nbd
> device.
>
> Fix this instead by getting rid of that, and have the nbd device teardown the
> recv_workq when we destory the nbd device.  Alloc it on device allocation and
> stop alloc'ing it with the config.  That way we don't have this weird thing
> where we need recv threads to drop their config before the last thing.
>
> And while you're at it would you fix recv_work() so it doesn't modify config
> after it drops it's reference?  Thanks,
>
> Josef
> .
Thank you for your reply, I'll make another patch according to your 
suggestion.

