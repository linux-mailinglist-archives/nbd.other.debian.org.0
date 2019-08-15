Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 505368E32F
	for <lists+nbd@lfdr.de>; Thu, 15 Aug 2019 05:30:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1544920965; Thu, 15 Aug 2019 03:30:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 15 03:30:09 2019
Old-Return-Path: <mchristi@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BF62E208D9
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Aug 2019 03:13:29 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-4.96 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MIME_CHARSET_FARAWAY=0.02,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id dbyhOi0XuE-9 for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Aug 2019 03:13:25 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_FROM_MX=-3.1; rate: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 6AE48208CB
	for <nbd@other.debian.org>; Thu, 15 Aug 2019 03:13:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05BC74628B;
	Thu, 15 Aug 2019 03:13:22 +0000 (UTC)
Received: from [10.10.120.60] (ovpn-120-60.rdu2.redhat.com [10.10.120.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E90D1001B02;
	Thu, 15 Aug 2019 03:13:21 +0000 (UTC)
Subject: Re: [PATCH] nbd: add a missed nbd_config_put() in nbd_xmit_timeout()
To: "sunke (E)" <sunke32@huawei.com>, josef@toxicpanda.com, axboe@kernel.dk,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <1565613086-13776-1-git-send-email-sunke32@huawei.com>
 <05b3cd4a-d2c1-5ad7-7a39-64bac470032a@huawei.com>
From: Mike Christie <mchristi@redhat.com>
Message-ID: <5D54CDD0.1010701@redhat.com>
Date: Wed, 14 Aug 2019 22:13:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <05b3cd4a-d2c1-5ad7-7a39-64bac470032a@huawei.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 15 Aug 2019 03:13:22 +0000 (UTC)
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <x_Gn5IXoS4K.A.buF.BHNVdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/620
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/5D54CDD0.1010701@redhat.com
Resent-Date: Thu, 15 Aug 2019 03:30:09 +0000 (UTC)

Josef had ackd my patch for the same thing here:

https://www.spinics.net/lists/linux-block/msg43800.html

so maybe Jens will pick that up with the rest of the set Josef had acked:

https://www.spinics.net/lists/linux-block/msg43809.html

to make it easier.

On 08/14/2019 08:27 PM, sunke (E) wrote:
> ping
> 
> ÔÚ 2019/8/12 20:31, Sun Ke Ð´µÀ:
>> When try to get the lock failed, before return, execute the
>> nbd_config_put() to decrease the nbd->config_refs.
>>
>> If the nbd->config_refs is added but not decreased. Then will not
>> execute nbd_clear_sock() in nbd_config_put(). bd->task_setup will
>> not be cleared away. Finally, print"Device being setup by another
>> task" in nbd_add_sock() and nbd device can not be reused.
>>
>> Fixes: 8f3ea35929a0 ("nbd: handle unexpected replies better")
>> Signed-off-by: Sun Ke <sunke32@huawei.com>
>> ---
>>   drivers/block/nbd.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index e21d2de..a69a90a 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -357,8 +357,10 @@ static enum blk_eh_timer_return
>> nbd_xmit_timeout(struct request *req,
>>       }
>>       config = nbd->config;
>>   -    if (!mutex_trylock(&cmd->lock))
>> +    if (!mutex_trylock(&cmd->lock)) {
>> +        nbd_config_put(nbd);
>>           return BLK_EH_RESET_TIMER;
>> +    }
>>         if (config->num_connections > 1) {
>>           dev_err_ratelimited(nbd_to_dev(nbd),
>>
> 

