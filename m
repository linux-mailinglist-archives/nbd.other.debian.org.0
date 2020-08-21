Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id CA11224D71F
	for <lists+nbd@lfdr.de>; Fri, 21 Aug 2020 16:15:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id C23D2209FF; Fri, 21 Aug 2020 14:15:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 21 14:15:09 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 502A7209FC
	for <lists-other-nbd@bendel.debian.org>; Fri, 21 Aug 2020 13:57:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.413 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.107,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id wIrh-7qFbTUA for <lists-other-nbd@bendel.debian.org>;
	Fri, 21 Aug 2020 13:57:47 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf42.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DB203209F2
	for <nbd@other.debian.org>; Fri, 21 Aug 2020 13:57:47 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id l13so648330qvt.10
        for <nbd@other.debian.org>; Fri, 21 Aug 2020 06:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vt8B4qHdUal95IqaET3W02YCHjGO9PrSEH2rm63LReQ=;
        b=bsVrk+FarUU3KMxx1IVcbNBj1HCftpAuXBu5+HZPxVOb+4NdmQcIst5W3PKaVqy1Vy
         CgfRFA9hULwq/i9VBM5Do5C3gQdFPxQzTV5HhulCBHfU/gCNuqWZFl2yMTjbHZybTqGP
         nathFYZiuMbseGIgXeauFCJo6q1/vAnSYjceMvKzLoEyJQkhsTjKStP8VzQRpclrT3Gi
         QJ6lmMBuXrwDbUdo3rTLpgFfxX1yzdDXANKNN7EPHjKPIUE2lcZ7pBAaDZLUqQqAP3fW
         svIm45bxhxce3gpHOXVFsTF6ou7gHOopixkgGUDJkp1ZWkojAqyscwPo00znMch6oTnc
         sM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vt8B4qHdUal95IqaET3W02YCHjGO9PrSEH2rm63LReQ=;
        b=p6dpKMBGiPo2gE4bR/gX7I/F6AydcqNXYXU3kXiJsnYGg50uczEZ+e3K3u09O7TQWZ
         5YpVr+WcOXtIv+EEVZ3ndpbwVa6kTt3ji4QU5kQ79DrKL1vcZmZqE09+u2w9POsn6O9p
         2qSdd2g5eT4cZu6H8+G7TeY1sE+wgVm4Yic9++LGmhTk2uv4aaG16eEMV+CmJFzmkZpj
         502VxWWaTgC5dvkqHTbea0mh+kHLNq+PAWuhDUw4N48vCgNqEMuYjq4rZr3YjojUFLON
         aRvjtRj1gs/mmxQ+JFXBOBSiBKoybUNkZ1/wgiyaA3tAxb1sBOhnfP/zuI9RW/42SGII
         UNlw==
X-Gm-Message-State: AOAM533u3s5/DxWXoLU3Yv8mtFHfTfstocl3bYRS6AFAQ0UXOCUZ0J0Q
	GsPnZ4STXd59hGuR3CTi6HjBN5eidLWHSTYo
X-Google-Smtp-Source: ABdhPJzi+FSEkO899fPqlo4IH6gvoK7KIZ6VvuWK95Z3bE8kE+NfQKmA2dafOT9PMOs3O8marQv+yg==
X-Received: by 2002:a0c:fbd1:: with SMTP id n17mr2539337qvp.4.1598018263498;
        Fri, 21 Aug 2020 06:57:43 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id s4sm2093473qtn.34.2020.08.21.06.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 06:57:42 -0700 (PDT)
Subject: Re: [PATCH] nbd: restore default timeout when setting it to zero
To: Hou Pu <houpu@bytedance.com>, axboe@kernel.dk, mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200810120044.2152-1-houpu@bytedance.com>
 <38b9de9e-38fe-3090-cea0-377c605c86d4@toxicpanda.com>
 <4e78e4b3-e75b-7428-703d-d8543bcfe348@bytedance.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <1accbf37-1a57-f072-7dc4-063fee991189@toxicpanda.com>
Date: Fri, 21 Aug 2020 09:57:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4e78e4b3-e75b-7428-703d-d8543bcfe348@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <s3oQ0GefgeD.A.cgH.tb9PfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/943
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/1accbf37-1a57-f072-7dc4-063fee991189@toxicpanda.com
Resent-Date: Fri, 21 Aug 2020 14:15:09 +0000 (UTC)

On 8/21/20 3:21 AM, Hou Pu wrote:
> 
> 
> On 2020/8/21 3:03 AM, Josef Bacik wrote:
>> On 8/10/20 8:00 AM, Hou Pu wrote:
>>> If we configured io timeout of nbd0 to 100s. Later after we
>>> finished using it, we configured nbd0 again and set the io
>>> timeout to 0. We expect it would timeout after 30 seconds
>>> and keep retry. But in fact we could not change the timeout
>>> when we set it to 0. the timeout is still the original 100s.
>>>
>>> So change the timeout to default 30s when we set it to zero.
>>> It also behaves same as commit 2da22da57348 ("nbd: fix zero
>>> cmd timeout handling v2").
>>>
>>> It becomes more important if we were reconfigure a nbd device
>>> and the io timeout it set to zero. Because it could take 30s
>>> to detect the new socket and thus io could be completed more
>>> quickly compared to 100s.
>>>
>>> Signed-off-by: Hou Pu <houpu@bytedance.com>
>>> ---
>>>   drivers/block/nbd.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>> index ce7e9f223b20..bc9dc1f847e1 100644
>>> --- a/drivers/block/nbd.c
>>> +++ b/drivers/block/nbd.c
>>> @@ -1360,6 +1360,8 @@ static void nbd_set_cmd_timeout(struct 
>>> nbd_device *nbd, u64 timeout)
>>>       nbd->tag_set.timeout = timeout * HZ;
>>>       if (timeout)
>>>           blk_queue_rq_timeout(nbd->disk->queue, timeout * HZ);
>>> +    else
>>> +        blk_queue_rq_timeout(nbd->disk->queue, 30 * HZ);
>>>   }
>>>   /* Must be called with config_lock held */
>>>
>>
>> What about the tag_set.timeout?  Thanks,
> 
> I think user space could set io timeout to 0, thus we set 
> tag_set.timeout = 0 here and also we should tell the block layer
> to restore 30s timeout in case it is not. tag_set.timeout == 0
> imply 30s io timeout and retrying after timeout.
> 
> (Sorry, I am not sure if I understand your question here. Could
> you explain a little more if needed?)
> 

I misunderstood what I was using the tagset timeout for.  We don't want 
this here, if we're dropping a config for an nbd device and we want to 
reset it to defaults then we need to add this to nbd_config_put().  Thanks,

Josef

