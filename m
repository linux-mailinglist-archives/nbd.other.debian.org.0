Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF8E252567
	for <lists+nbd@lfdr.de>; Wed, 26 Aug 2020 04:09:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 13E4E202E8; Wed, 26 Aug 2020 02:09:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 26 02:09:10 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4BE9A20230
	for <lists-other-nbd@bendel.debian.org>; Wed, 26 Aug 2020 01:51:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.413 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.107,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Jibm2e97jQTJ for <lists-other-nbd@bendel.debian.org>;
	Wed, 26 Aug 2020 01:51:27 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pl1-x643.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5EEE9202DF
	for <nbd@other.debian.org>; Wed, 26 Aug 2020 01:51:26 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id q3so139098pls.11
        for <nbd@other.debian.org>; Tue, 25 Aug 2020 18:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D6zd+eMJDrxgksdnuWcDok6ltzheKvzsGPgIwYZuV30=;
        b=SUdqlK1jq4iKcQCVr3kB7/ZP/dl0cZ1kyr1AiKSpTqTD/bThmL/KGq+pUqxUsJoL0I
         qGaavHuuHM2JwSZenoTGoCnpjJ9Xh+bVp4DPzTpUIL8mtPzP2NcAuIeMUqxY0ecQXb+R
         Ktt9mHxPB2e8oJK1yTsMG6Qh3w2AKRSWyB4Hip4x/BDJmInWPGBJQ5EgNBvRzD+Kryqr
         CzIAyINGnBv2ekhOUv5YH6ev/atvHEoZFFVCoxR4U/jvdfmk6Dz/b/i0ovdd0T1pc8r4
         thySfGyBz/eEB6xJUd/yyNfjK/dJHBZA1RktDZ55/d50BrqBUFCKtsq7uxU38yVfP0TV
         MUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D6zd+eMJDrxgksdnuWcDok6ltzheKvzsGPgIwYZuV30=;
        b=aV6KVTBN9IFDw9XW3ZzfP9ex5ywfC5NwNS1Ek3CV9iOCSQoLduGijm/LEdmJLOvp+A
         ZzraPpJtql/OAVLLadMvDnFF4hzC9QQSHAhSINvrL71UP0ZauN7ESMzzstvDZH9e+Rpe
         J/LqJ2eCYQipOP8DqcjDog4gJ6FguM+fcmunnpcpHuxubTbgZPT3sjMJS3xJp1hSUkhH
         Dl4kOiUHxbjy62mxCo9PCU1IlEamQX+TjAkTBUJ6S5owWdrSmjzz6lgsbmKVV9Z8rPvT
         lX1cohdFs9U8ZRY6bncP8f8syQhhgnhLji1diMtCIe+IrE8z/r4BkXCJXF6SH+jlB7k/
         8Mvg==
X-Gm-Message-State: AOAM530Hup2rPLcWeesIbDI9ECf/w6g0dcsFTJu1sXemlbG+TKS20Zu3
	Qr2ka+TFl6jWkFzxA+4kGjhKHbEZ0CbJRw==
X-Google-Smtp-Source: ABdhPJyrSWTevU8p1J7WmxJzDCq2EOddbWVYtW+8gSEBckB++VadXyTAur6e0RDtH6kD+NI3JKNisA==
X-Received: by 2002:a17:90a:a10c:: with SMTP id s12mr3941970pjp.32.1598406682385;
        Tue, 25 Aug 2020 18:51:22 -0700 (PDT)
Received: from houpudeMacBook-Pro.local ([61.120.150.74])
        by smtp.gmail.com with ESMTPSA id t10sm579859pfq.52.2020.08.25.18.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 18:51:21 -0700 (PDT)
Subject: Re: [PATCH] nbd: restore default timeout when setting it to zero
To: Josef Bacik <josef@toxicpanda.com>, axboe@kernel.dk
Cc: mchristi@redhat.com, linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200810120044.2152-1-houpu@bytedance.com>
 <38b9de9e-38fe-3090-cea0-377c605c86d4@toxicpanda.com>
 <4e78e4b3-e75b-7428-703d-d8543bcfe348@bytedance.com>
 <1accbf37-1a57-f072-7dc4-063fee991189@toxicpanda.com>
 <701eaeb7-8b91-baa5-ebba-468f890c4cc5@bytedance.com>
 <59db0b1d-4b2c-7966-9c38-929083e7b8f1@toxicpanda.com>
 <6f81b077-e722-1d0e-a506-5507f71540cd@bytedance.com>
 <27dc0e8c-e13b-4671-b739-30628696db7e@toxicpanda.com>
From: Hou Pu <houpu@bytedance.com>
Message-ID: <b527a43f-e6eb-6b80-6c61-e96c738a3bbc@bytedance.com>
Date: Wed, 26 Aug 2020 09:51:17 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <27dc0e8c-e13b-4671-b739-30628696db7e@toxicpanda.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <RgZhTu-Ob3G.A.iME.FRcRfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/956
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b527a43f-e6eb-6b80-6c61-e96c738a3bbc@bytedance.com
Resent-Date: Wed, 26 Aug 2020 02:09:10 +0000 (UTC)



On 2020/8/26 1:29 上午, Josef Bacik wrote:
> On 8/25/20 4:27 AM, Hou Pu wrote:
>>
>>
>> On 2020/8/24 10:02 PM, Josef Bacik wrote:
>>> On 8/23/20 11:23 PM, Hou Pu wrote:
>>>>
>>>>
>>>> On 2020/8/21 9:57 PM, Josef Bacik wrote:
>>>>> On 8/21/20 3:21 AM, Hou Pu wrote:
>>>>>>
>>>>>>
>>>>>> On 2020/8/21 3:03 AM, Josef Bacik wrote:
>>>>>>> On 8/10/20 8:00 AM, Hou Pu wrote:
>>>>>>>> If we configured io timeout of nbd0 to 100s. Later after we
>>>>>>>> finished using it, we configured nbd0 again and set the io
>>>>>>>> timeout to 0. We expect it would timeout after 30 seconds
>>>>>>>> and keep retry. But in fact we could not change the timeout
>>>>>>>> when we set it to 0. the timeout is still the original 100s.
>>>>>>>>
>>>>>>>> So change the timeout to default 30s when we set it to zero.
>>>>>>>> It also behaves same as commit 2da22da57348 ("nbd: fix zero
>>>>>>>> cmd timeout handling v2").
>>>>>>>>
>>>>>>>> It becomes more important if we were reconfigure a nbd device
>>>>>>>> and the io timeout it set to zero. Because it could take 30s
>>>>>>>> to detect the new socket and thus io could be completed more
>>>>>>>> quickly compared to 100s.
>>>>>>>>
>>>>>>>> Signed-off-by: Hou Pu <houpu@bytedance.com>
>>>>>>>> ---
>>>>>>>>   drivers/block/nbd.c | 2 ++
>>>>>>>>   1 file changed, 2 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>>>>>>> index ce7e9f223b20..bc9dc1f847e1 100644
>>>>>>>> --- a/drivers/block/nbd.c
>>>>>>>> +++ b/drivers/block/nbd.c
>>>>>>>> @@ -1360,6 +1360,8 @@ static void nbd_set_cmd_timeout(struct 
>>>>>>>> nbd_device *nbd, u64 timeout)
>>>>>>>>       nbd->tag_set.timeout = timeout * HZ;
>>>>>>>>       if (timeout)
>>>>>>>>           blk_queue_rq_timeout(nbd->disk->queue, timeout * HZ);
>>>>>>>> +    else
>>>>>>>> +        blk_queue_rq_timeout(nbd->disk->queue, 30 * HZ);
>>>>>>>>   }
>>>>>>>>   /* Must be called with config_lock held */
>>>>>>>>
>>>>>>>
>>>>>>> What about the tag_set.timeout?  Thanks,
>>>>>>
>>>>>> I think user space could set io timeout to 0, thus we set 
>>>>>> tag_set.timeout = 0 here and also we should tell the block layer
>>>>>> to restore 30s timeout in case it is not. tag_set.timeout == 0
>>>>>> imply 30s io timeout and retrying after timeout.
>>>>>>
>>>>>> (Sorry, I am not sure if I understand your question here. Could
>>>>>> you explain a little more if needed?)
>>>>>>
>>>>>
>>>>> I misunderstood what I was using the tagset timeout for.  We don't 
>>>>> want this here, if we're dropping a config for an nbd device and we 
>>>>> want to reset it to defaults then we need to add this to 
>>>>> nbd_config_put().  Thanks,
>>>>
>>>> AFAIK If we killed a nbd server, then restarted it and reconfigured
>>>> the nbd socket, I think we might not reconfigure IO timeout to 0 since
>>>> nbd_config_put() is not called in such case. So could we still
>>>> restore default timeout here. Or am I missing something?
>>>>
>>>
>>> If you kill the NBD server then the config is going to be dropped and 
>>> need to be reconfigured, so nbd_config_put() will definitely be 
>>> called. The only case it wouldn't be is if you are using the netlink 
>>> interface, in which case the device is going to keep all of its 
>>> original settings. Are you not seeing the final nbd_config_put() 
>>> being done when you kill the nbd server?  That seems like a bug if 
>>> not, and that should be fixed, and then this timeout thing going in 
>>> there will fix your issue.  Thanks,
>>
>> I was using the netlink interface. So I could use the reconnect
>> feature to update the nbd server without impacting the user of
>> nbd device.
>>
>> I did not see the final nbd_config_put() when I killed the nbd server.
>> After I killed the nbd server, the recv_work() put 1 config_ref.
>> Another ref count is still held by nbd_genl_connect(). I thought it
>> was as expected.
>>
>> Beside in nbd_genl_reconfigure(), it is checked nbd->config_refs should
>> not be zero by:
>>          if (!refcount_inc_not_zero(&nbd->config_refs)) {
>>                  dev_err(nbd_to_dev(nbd),
>>                          "not configured, cannot reconfigure\n");
>>                  nbd_put(nbd);
>>                  return -EINVAL;
>>          }
>> So AFAIK this behavior is as expected.
> 
> Ahh ok I see what you're getting at.  Ok I agree, you can add
> 
> Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks for your review,
Hou
> 
> Thanks,
> 
> Josef

