Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AB53DCE9F
	for <lists+nbd@lfdr.de>; Mon,  2 Aug 2021 04:12:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EF19D203BC; Mon,  2 Aug 2021 02:12:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug  2 02:12:09 2021
Old-Return-Path: <libaokun1@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=4.0 tests=DIGITS_LETTERS,HTML_MESSAGE,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 78E99203B6
	for <lists-other-nbd@bendel.debian.org>; Mon,  2 Aug 2021 01:55:55 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.279 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, HTML_MESSAGE=2,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7TmnsMW3z87I for <lists-other-nbd@bendel.debian.org>;
	Mon,  2 Aug 2021 01:55:50 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga08-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 36B9A20350
	for <nbd@other.debian.org>; Mon,  2 Aug 2021 01:55:47 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GdLgZ4BkHz1CRSW;
	Mon,  2 Aug 2021 09:55:38 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 2 Aug 2021 09:55:41 +0800
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 2 Aug 2021 09:55:40 +0800
Subject: Re: [PATCH -next] nbd: add the check to prevent overflow in
 __nbd_ioctl()
To: Jens Axboe <axboe@kernel.dk>, <josef@toxicpanda.com>,
	<linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>
CC: <patchwork@huawei.com>, Hulk Robot <hulkci@huawei.com>, Baokun Li
	<libaokun1@huawei.com>
References: <20210731014854.3953274-1-libaokun1@huawei.com>
 <b2582b8f-7cb8-f936-2d78-4d8b5feb0c12@kernel.dk>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <dd454cda-e50b-e358-a5cb-be04db2d4737@huawei.com>
Date: Mon, 2 Aug 2021 09:55:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b2582b8f-7cb8-f936-2d78-4d8b5feb0c12@kernel.dk>
Content-Type: multipart/alternative;
	boundary="------------1CE0860EE30B49B5ACA95A9A"
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qt9j4zO8tQP.A.6j.5R1BhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1232
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/dd454cda-e50b-e358-a5cb-be04db2d4737@huawei.com
Resent-Date: Mon,  2 Aug 2021 02:12:09 +0000 (UTC)

--------------1CE0860EE30B49B5ACA95A9A
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

在 2021/7/31 22:57, Jens Axboe 写道:
> On 7/30/21 7:48 PM, Baokun Li wrote:
>> If user specify a large enough value of NBD blocks option, it may trigger
>> signed integer overflow which may lead to nbd->config->bytesize becomes a
>> large or small value, zero in particular.
>>
>> UBSAN: Undefined behaviour in drivers/block/nbd.c:325:31
>> signed integer overflow:
>> 1024 * 4611686155866341414 cannot be represented in type 'long long int'
>> [...]
>> Call trace:
>> [...]
>>   handle_overflow+0x188/0x1dc lib/ubsan.c:192
>>   __ubsan_handle_mul_overflow+0x34/0x44 lib/ubsan.c:213
>>   nbd_size_set drivers/block/nbd.c:325 [inline]
>>   __nbd_ioctl drivers/block/nbd.c:1342 [inline]
>>   nbd_ioctl+0x998/0xa10 drivers/block/nbd.c:1395
>>   __blkdev_driver_ioctl block/ioctl.c:311 [inline]
>> [...]
>>
>> Although it is not a big deal, still silence the UBSAN by limit
>> the input value.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Baokun Li <libaokun1@huawei.com>
>> ---
>>   drivers/block/nbd.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index c38317979f74..7c838bf8cc31 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -1398,6 +1398,8 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
>>   	case NBD_SET_SIZE:
>>   		return nbd_set_size(nbd, arg, config->blksize);
>>   	case NBD_SET_SIZE_BLOCKS:
>> +		if (arg && (LLONG_MAX / arg <= config->blksize))
>> +			return -EINVAL;
> Use check_mul_overflow() instead?
>
Thank you for your advice.

I'm about to send a patch v2 with the changes suggested by you.

-- 
With Best Regards,
Baokun Li


--------------1CE0860EE30B49B5ACA95A9A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">在 2021/7/31 22:57, Jens Axboe 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b2582b8f-7cb8-f936-2d78-4d8b5feb0c12@kernel.dk">
      <pre class="moz-quote-pre" wrap="">On 7/30/21 7:48 PM, Baokun Li wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">If user specify a large enough value of NBD blocks option, it may trigger
signed integer overflow which may lead to nbd-&gt;config-&gt;bytesize becomes a
large or small value, zero in particular.

UBSAN: Undefined behaviour in drivers/block/nbd.c:325:31
signed integer overflow:
1024 * 4611686155866341414 cannot be represented in type 'long long int'
[...]
Call trace:
[...]
 handle_overflow+0x188/0x1dc lib/ubsan.c:192
 __ubsan_handle_mul_overflow+0x34/0x44 lib/ubsan.c:213
 nbd_size_set drivers/block/nbd.c:325 [inline]
 __nbd_ioctl drivers/block/nbd.c:1342 [inline]
 nbd_ioctl+0x998/0xa10 drivers/block/nbd.c:1395
 __blkdev_driver_ioctl block/ioctl.c:311 [inline]
[...]

Although it is not a big deal, still silence the UBSAN by limit
the input value.

Reported-by: Hulk Robot <a class="moz-txt-link-rfc2396E" href="mailto:hulkci@huawei.com">&lt;hulkci@huawei.com&gt;</a>
Signed-off-by: Baokun Li <a class="moz-txt-link-rfc2396E" href="mailto:libaokun1@huawei.com">&lt;libaokun1@huawei.com&gt;</a>
---
 drivers/block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index c38317979f74..7c838bf8cc31 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1398,6 +1398,8 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 	case NBD_SET_SIZE:
 		return nbd_set_size(nbd, arg, config-&gt;blksize);
 	case NBD_SET_SIZE_BLOCKS:
+		if (arg &amp;&amp; (LLONG_MAX / arg &lt;= config-&gt;blksize))
+			return -EINVAL;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Use check_mul_overflow() instead?

</pre>
    </blockquote>
    <p>Thank you for your advice.
      <br>
      <br>
      I'm about to send a patch v2 with the changes suggested by you. <br>
    </p>
    <pre>-- 
With Best Regards,
Baokun Li
</pre>
  </body>
</html>

--------------1CE0860EE30B49B5ACA95A9A--

