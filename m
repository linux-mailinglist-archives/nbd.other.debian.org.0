Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ED627394C
	for <lists+nbd@lfdr.de>; Tue, 22 Sep 2020 05:33:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1B159203E2; Tue, 22 Sep 2020 03:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 22 03:33:09 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 72A8E2040D
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Sep 2020 03:17:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.61 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.13,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6D6Nai-8ve_y for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Sep 2020 03:16:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 090C52040A
	for <nbd@other.debian.org>; Tue, 22 Sep 2020 03:16:57 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id z19so11135378pfn.8
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 20:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W+JMCm/7C+eeBdc2FIHlSoejawqCGvJ6dxmgCl2tchk=;
        b=O2cQ4DuQFGwDIsmWH+MPBntdlaKVB5sGKnDSKhLwEaoCVAmR1/+xDefyCnfSM9CalR
         RGxywuecGkTavwgZyXNHLkaOp2Uxmhq+WQWEupDzFWeuovcobTJJ5BngSMqjPjEuDKkq
         xnrqAZKNhyxNcOg6aQRgmcM4/O2XFuvEe8U1/gWvtcFiYHh6aaMQxJJdXdkHYuXDr7+d
         ZB7HdlvOZLfSiJCViFn6sW7JpCekP28P8ethSgEHluv5M26yHaP0XvSz880ODnv4GlrJ
         eLnF2iDg4r//QPNDxdWtGlUNACajBu9kzMkDbAGMLm/qAd5eQXQ3hC+aGFJ5HUgzvST0
         +lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W+JMCm/7C+eeBdc2FIHlSoejawqCGvJ6dxmgCl2tchk=;
        b=Tb+yIm0gkzbPpmQ7L5Iz3zB07Bmapu2CfgAdXHuTCJ4kcAuXRIX1jHzHGozwQ93LdK
         X6nXviz5qHQyJudGuSCVe6fmZ3i0wGPGuosOl2rt5WZj0IDua6iBuwFGG06GYuuUA2fY
         bKuy1NURwTccRUOLE+cibw6E3oWlkLcX1970WuTPiqEjufwSoLN/EUp7UYd1RFRiclCT
         n9MW1uytETbncVdSIIMlh5PQMO+n7AZoslZBo7nTYHi1TMkbJMFFLFcONtv7p8BRagKD
         mMVcUP8vpfywhnh5cZSVY77bG3F6SE5BuYnRsrz+V3yvjjq+XvVFsMfHXDwYr2rK3nCn
         aoaQ==
X-Gm-Message-State: AOAM530SRW+p7P+uFtTqTaC0nIBvtfaIdhNHoKN+vO+4Ut3NiwtK26Ic
	oocdL8B+7Y5Hjlr2EMhf9A37lWxUNep+BiZ7
X-Google-Smtp-Source: ABdhPJymm4UXc37ailVQHPxR98BCoUrBmrkycwOCv+TeTYnwdT13RT5KwoAilUXQMgs71DGPTyjbsQ==
X-Received: by 2002:a63:fe49:: with SMTP id x9mr1937157pgj.446.1600744613159;
        Mon, 21 Sep 2020 20:16:53 -0700 (PDT)
Received: from houpudeMacBook-Pro.local ([61.120.150.74])
        by smtp.gmail.com with ESMTPSA id ep4sm675369pjb.39.2020.09.21.20.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 20:16:52 -0700 (PDT)
Subject: Re: [PATCH 3/3] nbd: introduce a client flag to do zero timeout
 handling
To: Josef Bacik <josef@toxicpanda.com>, axboe@kernel.dk
Cc: mchristi@redhat.com, linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200921105718.29006-1-houpu@bytedance.com>
 <20200921105718.29006-4-houpu@bytedance.com>
 <7f680bff-a19e-3aff-c91e-98b2933826a9@toxicpanda.com>
From: Hou Pu <houpu@bytedance.com>
Message-ID: <516e86aa-42d7-1820-600e-fba8d2e05882@bytedance.com>
Date: Tue, 22 Sep 2020 11:16:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7f680bff-a19e-3aff-c91e-98b2933826a9@toxicpanda.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aj27_Ji86hL.A.lmC.1BXafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/998
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/516e86aa-42d7-1820-600e-fba8d2e05882@bytedance.com
Resent-Date: Tue, 22 Sep 2020 03:33:09 +0000 (UTC)



On 2020/9/22 2:03 AM, Josef Bacik wrote:
> On 9/21/20 6:57 AM, Hou Pu wrote:
>> Introduce a dedicated client flag NBD_RT_WAIT_ON_TIMEOUT to reset
>> timer in nbd_xmit_timer instead of depending on tag_set.timeout == 0.
>> So that the timeout value could be configured by the user to
>> whatever they like instead of the default 30s. A smaller timeout
>> value allow us to detect if a new socket is reconfigured in a
>> shorter time. Thus the io could be requeued more quickly.
>>
>> The tag_set.timeout == 0 setting still works like before.
>>
>> Signed-off-by: Hou Pu <houpu@bytedance.com>
> 
> I like this idea in general, just a few comments below.

Thanks,
Hou

> 
>> ---
>>   drivers/block/nbd.c      | 25 ++++++++++++++++++++++++-
>>   include/uapi/linux/nbd.h |  4 ++++
>>   2 files changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index 4c0bbb981cbc..1d7a9de7bdcc 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -80,6 +80,7 @@ struct link_dead_args {
>>   #define NBD_RT_BOUND            5
>>   #define NBD_RT_DESTROY_ON_DISCONNECT    6
>>   #define NBD_RT_DISCONNECT_ON_CLOSE    7
>> +#define NBD_RT_WAIT_ON_TIMEOUT        8
>>   #define NBD_DESTROY_ON_DISCONNECT    0
>>   #define NBD_DISCONNECT_REQUESTED    1
>> @@ -378,6 +379,16 @@ static u32 req_to_nbd_cmd_type(struct request *req)
>>       }
>>   }
>> +static inline bool wait_on_timeout(struct nbd_device *nbd,
>> +                   struct nbd_config *config)
>> +{
>> +    if (test_bit(NBD_RT_WAIT_ON_TIMEOUT, &config->runtime_flags) ||
>> +        nbd->tag_set.timeout == 0)
>> +        return true;
>> +    else
>> +        return false;
>> +}
>> +
> 
> This obviously needs to be updated to match my comments from the 
> previous patch.

Thanks. Please see v2 latter.

> 
>>   static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>>                            bool reserved)
>>   {
>> @@ -400,7 +411,7 @@ static enum blk_eh_timer_return 
>> nbd_xmit_timeout(struct request *req,
>>           nbd->tag_set.timeout)
>>           goto error_out;
>> -    if (nbd->tag_set.timeout) {
>> +    if (!wait_on_timeout(nbd, config)) {
>>           dev_err_ratelimited(nbd_to_dev(nbd),
>>                       "Connection timed out, retrying (%d/%d alive)\n",
>>                       atomic_read(&config->live_connections),
>> @@ -1953,6 +1964,10 @@ static int nbd_genl_connect(struct sk_buff 
>> *skb, struct genl_info *info)
>>               set_bit(NBD_RT_DISCONNECT_ON_CLOSE,
>>                   &config->runtime_flags);
>>           }
>> +        if (flags & NBD_CFLAG_WAIT_ON_TIMEOUT) {
>> +            set_bit(NBD_RT_WAIT_ON_TIMEOUT,
>> +                &config->runtime_flags);
>> +        }
> 
> Documentation/process/coding-style.rst
> 
> "Do not unnecessarily use braces where a single statement will do."
> 
> same goes for below.  Thanks,
> 
> Josef

Thanks. Will fix this in v2.


Thanks,
Hou

