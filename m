Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD1D2EA38
	for <lists+nbd@lfdr.de>; Thu, 30 May 2019 03:28:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CD3032084B; Thu, 30 May 2019 01:28:27 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May 30 01:28:27 2019
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=4.0 tests=DIGITS_LETTERS,LDOSUBSCRIBER,
	LDO_WHITELIST,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id D8C6B20833
	for <lists-other-nbd@bendel.debian.org>; Thu, 30 May 2019 01:28:20 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-10.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, LDO_WHITELIST=-5,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_HI=-5]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id v1BFiDyYJfP9 for <lists-other-nbd@bendel.debian.org>;
	Thu, 30 May 2019 01:28:17 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -4.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id C250720822
	for <nbd@other.debian.org>; Thu, 30 May 2019 01:28:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A40A083F44;
	Thu, 30 May 2019 01:28:13 +0000 (UTC)
Received: from [10.72.12.96] (ovpn-12-96.pek2.redhat.com [10.72.12.96])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4323B19C70;
	Thu, 30 May 2019 01:28:10 +0000 (UTC)
Subject: Re: [PATCH] nbd: fix crash when the blksize is zero
To: Mike Christie <mchristi@redhat.com>, josef@toxicpanda.com,
 axboe@kernel.dk, nbd@other.debian.org
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 atumball@redhat.com
References: <20190527054438.13548-1-xiubli@redhat.com>
 <5CEED598.7080703@redhat.com>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <3a7e1aed-c07a-8338-73a5-8389a2fe78dc@redhat.com>
Date: Thu, 30 May 2019 09:28:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CEED598.7080703@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 30 May 2019 01:28:13 +0000 (UTC)
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Ck4cz9eYL-C.A.wQD.7Gz7cB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/554
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3a7e1aed-c07a-8338-73a5-8389a2fe78dc@redhat.com
Resent-Date: Thu, 30 May 2019 01:28:27 +0000 (UTC)

On 2019/5/30 2:55, Mike Christie wrote:
> On 05/27/2019 12:44 AM, xiubli@redhat.com wrote:
>> From: Xiubo Li <xiubli@redhat.com>
>>
>> This will allow the blksize to be set zero and then use 1024 as
>> default.
>>
>> Signed-off-by: Xiubo Li <xiubli@redhat.com>
>> ---
>>   drivers/block/nbd.c | 21 ++++++++++++++++++---
>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index 053958a..4c1de1c 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -135,6 +135,8 @@ struct nbd_cmd {
>>   
>>   #define NBD_MAGIC 0x68797548
>>   
>> +#define NBD_DEF_BLKSIZE 1024
>> +
>>   static unsigned int nbds_max = 16;
>>   static int max_part = 16;
>>   static struct workqueue_struct *recv_workqueue;
>> @@ -1237,6 +1239,14 @@ static void nbd_clear_sock_ioctl(struct nbd_device *nbd,
>>   		nbd_config_put(nbd);
>>   }
>>   
>> +static bool nbd_is_valid_blksize(unsigned long blksize)
>> +{
>> +	if (!blksize || !is_power_of_2(blksize) || blksize < 512 ||
>> +		blksize > PAGE_SIZE)
>> +		return false;
>> +	return true;
>> +}
>> +
>>   /* Must be called with config_lock held */
>>   static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
>>   		       unsigned int cmd, unsigned long arg)
>> @@ -1252,8 +1262,9 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
>>   	case NBD_SET_SOCK:
>>   		return nbd_add_socket(nbd, arg, false);
>>   	case NBD_SET_BLKSIZE:
>> -		if (!arg || !is_power_of_2(arg) || arg < 512 ||
>> -		    arg > PAGE_SIZE)
>> +		if (!arg)
>> +			arg = NBD_DEF_BLKSIZE;
>> +		if (!nbd_is_valid_blksize(arg))
>>   			return -EINVAL;
>>   		nbd_size_set(nbd, arg,
>>   			     div_s64(config->bytesize, arg));
>> @@ -1333,7 +1344,7 @@ static struct nbd_config *nbd_alloc_config(void)
>>   	atomic_set(&config->recv_threads, 0);
>>   	init_waitqueue_head(&config->recv_wq);
>>   	init_waitqueue_head(&config->conn_wait);
>> -	config->blksize = 1024;
>> +	config->blksize = NBD_DEF_BLKSIZE;
>>   	atomic_set(&config->live_connections, 0);
>>   	try_module_get(THIS_MODULE);
>>   	return config;
>> @@ -1769,6 +1780,10 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
>>   	if (info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]) {
>>   		u64 bsize =
>>   			nla_get_u64(info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]);
>> +		if (!bsize)
>> +			bsize = NBD_DEF_BLKSIZE;
>> +		if (!nbd_is_valid_blksize(bsize))
>> +			return -EINVAL;
> You can't only return here. You need to also drop the mutex, do
> nbd_put, and drop config_refs reference.
>
> Maybe you want to move this check to the beginning of the function with
> the NBD_ATTR_SIZE_BYTES sanity check since the error handling is easier
> there.

Yeah, right.

I saw your resend patch of this and that looks good to me.

Thanks
BRs
Xiubo


>
>>   		nbd_size_set(nbd, bsize, div64_u64(config->bytesize, bsize));
>>   	}
>>   	if (info->attrs[NBD_ATTR_TIMEOUT]) {
>>

