Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B66524CF71
	for <lists+nbd@lfdr.de>; Fri, 21 Aug 2020 09:39:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8D0F220A21; Fri, 21 Aug 2020 07:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 21 07:39:09 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 982A420A85
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Aug 2020 07:22:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.413 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.107,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id iXbQzsexF3b7 for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Aug 2020 07:22:05 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pg1-x542.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 175AB20A92
	for <nbd@other.debian.org>; Fri, 21 Aug 2020 07:22:04 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id h12so591418pgm.7
        for <nbd@other.debian.org>; Fri, 21 Aug 2020 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eTj4sOtsBgduTA8LS1xMja6ajQx/O8048Q0MLc3qi0o=;
        b=vlbqyzcgb7nws3A7MQCOO/leq4sFDvEby+SI2KOjrSK4RLQf6jgm6yUiogV07JzgHx
         5cQw7RI61uyXDb9vSh/pfn8o+knBga9WHaeK6zRTBcrFkEy3v1IFmQNsOfvG8ETE/HqD
         4Ny4MdJX7WFXhlSwMhVLo74IsIcFZzVzlikEVFRGrnLvah7B6KblOTiGeic7qGKKaXZG
         iXNqjE50uUPDRNGbU/PMg9BY0P9zaq+AS5UbRQWLhv0j+q2oallqaj06zX9x50ubU7lH
         mHdbHfpYzgG8+6E5hFdP0qixaAS2keHTdB6XHVgBRV4BSVKC8NlZm3rzzhcNnn0lVpr2
         2WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eTj4sOtsBgduTA8LS1xMja6ajQx/O8048Q0MLc3qi0o=;
        b=bM7o3ShCaSVf+Yo1m2hnhc6lIXKo7GGshxbk2KIP6KPpQe8O5Oq32p3pLrcIhHzGba
         nHsslTtziIqjFjrQXc4KbRrTuv/xTVot8Jg/4aSYV+SXbCY6j19/PUeWUFDQKpzRJBkR
         ondsNBRBwWnq9cqeqeR7sjq4+I2hEuRZRp61c7b3IpFpqDAwuqJvffOZFVTLorpbvrKB
         H+5aku2HbuoNkoskEp2fzi12Xg7r+tH0cjgONxozx+z5plfI3beMqWnqD6aPI2ZEOvf+
         oUoBj6Nn7YXmz8LwGnyVxCf+w0OuxsO98XkFr/VB5MghBVbITfHl7yKN1l/LR/8ZMSnv
         BTsw==
X-Gm-Message-State: AOAM531++xVsKbe3fDFtW01N0yQ6OW/GE8zUTfrpIPb7azdtpePsulJe
	r4E5MyqSnkw9FgwetF+19p9bHK8IcbbSCw==
X-Google-Smtp-Source: ABdhPJzarJgZXmeauttgW+isUhElUak/ija4XMgGoVt+m7CW/sZQPmpWDz2dB93lwn2OX/m2eyzrhQ==
X-Received: by 2002:a63:541e:: with SMTP id i30mr1428677pgb.47.1597994520294;
        Fri, 21 Aug 2020 00:22:00 -0700 (PDT)
Received: from houpudeMacBook-Pro.local ([61.120.150.74])
        by smtp.gmail.com with ESMTPSA id b6sm1149853pgt.17.2020.08.21.00.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 00:21:59 -0700 (PDT)
Subject: Re: [PATCH] nbd: restore default timeout when setting it to zero
To: Josef Bacik <josef@toxicpanda.com>, axboe@kernel.dk, mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200810120044.2152-1-houpu@bytedance.com>
 <38b9de9e-38fe-3090-cea0-377c605c86d4@toxicpanda.com>
From: Hou Pu <houpu@bytedance.com>
Message-ID: <4e78e4b3-e75b-7428-703d-d8543bcfe348@bytedance.com>
Date: Fri, 21 Aug 2020 15:21:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <38b9de9e-38fe-3090-cea0-377c605c86d4@toxicpanda.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <VKp6lixmvYD.A.BlF.do3PfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/939
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4e78e4b3-e75b-7428-703d-d8543bcfe348@bytedance.com
Resent-Date: Fri, 21 Aug 2020 07:39:09 +0000 (UTC)



On 2020/8/21 3:03 AM, Josef Bacik wrote:
> On 8/10/20 8:00 AM, Hou Pu wrote:
>> If we configured io timeout of nbd0 to 100s. Later after we
>> finished using it, we configured nbd0 again and set the io
>> timeout to 0. We expect it would timeout after 30 seconds
>> and keep retry. But in fact we could not change the timeout
>> when we set it to 0. the timeout is still the original 100s.
>>
>> So change the timeout to default 30s when we set it to zero.
>> It also behaves same as commit 2da22da57348 ("nbd: fix zero
>> cmd timeout handling v2").
>>
>> It becomes more important if we were reconfigure a nbd device
>> and the io timeout it set to zero. Because it could take 30s
>> to detect the new socket and thus io could be completed more
>> quickly compared to 100s.
>>
>> Signed-off-by: Hou Pu <houpu@bytedance.com>
>> ---
>>   drivers/block/nbd.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index ce7e9f223b20..bc9dc1f847e1 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -1360,6 +1360,8 @@ static void nbd_set_cmd_timeout(struct 
>> nbd_device *nbd, u64 timeout)
>>       nbd->tag_set.timeout = timeout * HZ;
>>       if (timeout)
>>           blk_queue_rq_timeout(nbd->disk->queue, timeout * HZ);
>> +    else
>> +        blk_queue_rq_timeout(nbd->disk->queue, 30 * HZ);
>>   }
>>   /* Must be called with config_lock held */
>>
> 
> What about the tag_set.timeout?  Thanks,

I think user space could set io timeout to 0, thus we set 
tag_set.timeout = 0 here and also we should tell the block layer
to restore 30s timeout in case it is not. tag_set.timeout == 0
imply 30s io timeout and retrying after timeout.

(Sorry, I am not sure if I understand your question here. Could
you explain a little more if needed?)

Thanks,
Hou

> 
> Josef

