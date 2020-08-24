Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B524FFAE
	for <lists+nbd@lfdr.de>; Mon, 24 Aug 2020 16:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id AC20B2039C; Mon, 24 Aug 2020 14:18:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 24 14:18:11 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 86AAC203D7
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Aug 2020 14:02:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.413 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.107,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id VJUuY_8xcMAI for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Aug 2020 14:02:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x844.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D8B99203CD
	for <nbd@other.debian.org>; Mon, 24 Aug 2020 14:02:53 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id v91so812397qte.2
        for <nbd@other.debian.org>; Mon, 24 Aug 2020 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SmCXwO9+2QUe5/jHo85GDFvGgT3nxZNKM053yNO6sE8=;
        b=LRcIbwUtWpk653iVTg1ZngI9kNr4SXeOUl+O4EqQXEmAjV7eXn9e7Ou6AJLy0GVdVs
         n4Ev/PBQ1NmCOELHbplLHLlgI4wNyTH5dsjis33voncQr55UaUnMfv4DaaAUum4Er6y6
         UDGe/cWsl3UixiVfZzQMaSvzVC72ygAn+rxLL9stWix1e/g2Mxa9NNEIfcz5sxIBUMNc
         LypJ89bxvUWpUHic/acQG8LYGYEgnFawH60PBA0Iv1FlM76X55OG6Va+u7TLuPjsnUGE
         AGQuUVSZcd9h9FC15f2085q91Ob9+GNLP98Sdn8uZScr4KVmlFcTKXFxp07OjSUcVsvE
         f4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SmCXwO9+2QUe5/jHo85GDFvGgT3nxZNKM053yNO6sE8=;
        b=umOxvxF3281Gq9S1SqB14mhO29md2yVLMMEC8bm6C6ATy9d5Pbm9aaz3Qfx41gVZZF
         uYa2oKjH78sFRKfnR2fJfw5VtTDj6XZz5SdqQMrh8Hxf3ZoHG27NKbC3vTNDSqnxxoF1
         Vhv9IBdqiLnMJAVFqW1sN7qGoYo13AF9bUoXKvGrpTgojnnjuF0WtlHJd7HAEk8O+ITP
         oXdKRIZeyRDg6cdSyQ/t+0v9N/4OlM/r8OLgH6xSj+Yx2EcpXDksr4CVEas/tk8UC1x6
         y2Z+1PJ2d3vIODpgaeW1mblTSAqXPVnxkLn9YdzNughzidqQVJ9D3ZvL9/bxHY7dYfxJ
         tCmQ==
X-Gm-Message-State: AOAM5332ErRscEcGSzQ3SpWmb/wWKItUJm/flhzYz6a1Y/DLW33XPJ3g
	f3wCdsMM7ySgOA4LuDs0Ixor3xCNvCJoOUAG
X-Google-Smtp-Source: ABdhPJwS4PWlHFsjOgC0j8hNjllW1qMrU+jU50Kwe6oO5bSUg6mOlOAAZdNCuFOea7G56S3L+7H2Yg==
X-Received: by 2002:ac8:4b52:: with SMTP id e18mr4846190qts.231.1598277769476;
        Mon, 24 Aug 2020 07:02:49 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id o72sm9657501qka.113.2020.08.24.07.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 07:02:48 -0700 (PDT)
Subject: Re: [PATCH] nbd: restore default timeout when setting it to zero
To: Hou Pu <houpu@bytedance.com>, axboe@kernel.dk, mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200810120044.2152-1-houpu@bytedance.com>
 <38b9de9e-38fe-3090-cea0-377c605c86d4@toxicpanda.com>
 <4e78e4b3-e75b-7428-703d-d8543bcfe348@bytedance.com>
 <1accbf37-1a57-f072-7dc4-063fee991189@toxicpanda.com>
 <701eaeb7-8b91-baa5-ebba-468f890c4cc5@bytedance.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <59db0b1d-4b2c-7966-9c38-929083e7b8f1@toxicpanda.com>
Date: Mon, 24 Aug 2020 10:02:47 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <701eaeb7-8b91-baa5-ebba-468f890c4cc5@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <8RFgmJVU2hN.A.TcH.jw8QfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/952
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/59db0b1d-4b2c-7966-9c38-929083e7b8f1@toxicpanda.com
Resent-Date: Mon, 24 Aug 2020 14:18:11 +0000 (UTC)

On 8/23/20 11:23 PM, Hou Pu wrote:
> 
> 
> On 2020/8/21 9:57 PM, Josef Bacik wrote:
>> On 8/21/20 3:21 AM, Hou Pu wrote:
>>>
>>>
>>> On 2020/8/21 3:03 AM, Josef Bacik wrote:
>>>> On 8/10/20 8:00 AM, Hou Pu wrote:
>>>>> If we configured io timeout of nbd0 to 100s. Later after we
>>>>> finished using it, we configured nbd0 again and set the io
>>>>> timeout to 0. We expect it would timeout after 30 seconds
>>>>> and keep retry. But in fact we could not change the timeout
>>>>> when we set it to 0. the timeout is still the original 100s.
>>>>>
>>>>> So change the timeout to default 30s when we set it to zero.
>>>>> It also behaves same as commit 2da22da57348 ("nbd: fix zero
>>>>> cmd timeout handling v2").
>>>>>
>>>>> It becomes more important if we were reconfigure a nbd device
>>>>> and the io timeout it set to zero. Because it could take 30s
>>>>> to detect the new socket and thus io could be completed more
>>>>> quickly compared to 100s.
>>>>>
>>>>> Signed-off-by: Hou Pu <houpu@bytedance.com>
>>>>> ---
>>>>>   drivers/block/nbd.c | 2 ++
>>>>>   1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>>>> index ce7e9f223b20..bc9dc1f847e1 100644
>>>>> --- a/drivers/block/nbd.c
>>>>> +++ b/drivers/block/nbd.c
>>>>> @@ -1360,6 +1360,8 @@ static void nbd_set_cmd_timeout(struct nbd_device 
>>>>> *nbd, u64 timeout)
>>>>>       nbd->tag_set.timeout = timeout * HZ;
>>>>>       if (timeout)
>>>>>           blk_queue_rq_timeout(nbd->disk->queue, timeout * HZ);
>>>>> +    else
>>>>> +        blk_queue_rq_timeout(nbd->disk->queue, 30 * HZ);
>>>>>   }
>>>>>   /* Must be called with config_lock held */
>>>>>
>>>>
>>>> What about the tag_set.timeout?  Thanks,
>>>
>>> I think user space could set io timeout to 0, thus we set tag_set.timeout = 0 
>>> here and also we should tell the block layer
>>> to restore 30s timeout in case it is not. tag_set.timeout == 0
>>> imply 30s io timeout and retrying after timeout.
>>>
>>> (Sorry, I am not sure if I understand your question here. Could
>>> you explain a little more if needed?)
>>>
>>
>> I misunderstood what I was using the tagset timeout for.  We don't want this 
>> here, if we're dropping a config for an nbd device and we want to reset it to 
>> defaults then we need to add this to nbd_config_put().  Thanks,
> 
> AFAIK If we killed a nbd server, then restarted it and reconfigured
> the nbd socket, I think we might not reconfigure IO timeout to 0 since
> nbd_config_put() is not called in such case. So could we still
> restore default timeout here. Or am I missing something?
> 

If you kill the NBD server then the config is going to be dropped and need to be 
reconfigured, so nbd_config_put() will definitely be called.  The only case it 
wouldn't be is if you are using the netlink interface, in which case the device 
is going to keep all of its original settings.  Are you not seeing the final 
nbd_config_put() being done when you kill the nbd server?  That seems like a bug 
if not, and that should be fixed, and then this timeout thing going in there 
will fix your issue.  Thanks,

Josef

