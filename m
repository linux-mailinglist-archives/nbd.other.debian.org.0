Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCAB43689B
	for <lists+nbd@lfdr.de>; Thu, 21 Oct 2021 19:03:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 981EA2025E; Thu, 21 Oct 2021 17:03:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 21 17:03:12 2021
Old-Return-Path: <paskripkin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9E99720270
	for <lists-other-nbd@bendel.debian.org>; Thu, 21 Oct 2021 16:48:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WsBatzwgGFHs for <lists-other-nbd@bendel.debian.org>;
	Thu, 21 Oct 2021 16:47:57 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 2A0772024C
	for <nbd@other.debian.org>; Thu, 21 Oct 2021 16:47:57 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id n7so982147ljp.5
        for <nbd@other.debian.org>; Thu, 21 Oct 2021 09:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=teoHzi6Hmm/OVFrA0e8JXtWu9N4wtV6Jv4Y9vx/yxR0=;
        b=Ke7CiYkPNKFISeqO2ZhVh8+k0kvSAIk683PKPVHhtsHDtLhVwn2f+0hQSJJ7r6orGa
         B7BfSVZoqpWcB5YqNDCuDGJER0BOzTnlUMKZa9tsTfEfZEHCcfLce7MCivrazcR5Tnd3
         SMS4TH7DYlBA7ePK8tge9BjdQon1+5LLQHE17eN7i5JbEC9zfejp+6wbwSCyDBv2C43r
         z7fYucPtrEa1/61dIb/hM86y0hhxKSbbpEsVuOT3+9gNpfGUIxkSyjANFOwaH2SIQwq0
         DGdt/pm2SEMvQZJ7YthPL5Je99dXF8sOqm4+IMv+79hL6yaHt8Kmst0GGoPAlL+bA+AV
         ouDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=teoHzi6Hmm/OVFrA0e8JXtWu9N4wtV6Jv4Y9vx/yxR0=;
        b=jZraDtCV4JNg7YuBJIVR3gvyYUHMcz4yN9/v8pCRClhMoc6yCi1OM3lhk/Z+UThYsn
         Nv2RIq1TOP5GoIStVG6n17cfph2/CF5iZQRaHJM+7S+dZsUeCVunbrgEVUNGi1Wqefg7
         qXRtZg7d9RReE45a8W230mr0q9FmQQmXvxknJJ2hONT4jan1RKkbNcZouLDLabz6FTGa
         YBMOgII8FrzXlD2Kc2fh2vDOHSxqWQ3FOee3+AVZf12QB6BKGc3eWx0n+mA7LmklC4yr
         a/LU6L3wU4MSYbAEU8HnZwufxEpbpPYpLSPiBNRc//icmMC57muL5zqf6qtUwmR+T+3s
         ulzg==
X-Gm-Message-State: AOAM533kvkQcxXm9sUzuWpYf720Kwprv+pIasCIGfjq5xORU36aDKA0O
	N43p/s6HhDdtzTR5JZQk5H0=
X-Google-Smtp-Source: ABdhPJxytDT9pDTb/bTC5dE5btSmvHObDmj7vUPhohHmYJletZw2VYtYZK0DWFzBUGXcNRT8AnkTrA==
X-Received: by 2002:a05:651c:32f:: with SMTP id b15mr6862293ljp.318.1634834874386;
        Thu, 21 Oct 2021 09:47:54 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.181])
        by smtp.gmail.com with ESMTPSA id o6sm507091lfr.19.2021.10.21.09.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 09:47:53 -0700 (PDT)
Message-ID: <8f6f738b-2d74-1778-648a-dc62603319d0@gmail.com>
Date: Thu, 21 Oct 2021 19:47:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 0/2] nbd: fix sanity check for first_minor
Content-Language: en-US
To: "yukuai (C)" <yukuai3@huawei.com>, josef@toxicpanda.com, axboe@kernel.dk
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com, luomeng12@huawei.com,
 Christoph Hellwig <hch@lst.de>
References: <20211021122936.758221-1-yukuai3@huawei.com>
 <72fb140d-609b-c035-bdd6-d2b8639c116b@gmail.com>
 <17182476-e5bf-f493-9d9b-fedb2d9c8e1a@huawei.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <17182476-e5bf-f493-9d9b-fedb2d9c8e1a@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Ol3NfK6mOzI.A.u_H.Q1ZchB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1560
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/8f6f738b-2d74-1778-648a-dc62603319d0@gmail.com
Resent-Date: Thu, 21 Oct 2021 17:03:12 +0000 (UTC)

On 10/21/21 16:13, yukuai (C) wrote:
> On 2021/10/21 20:35, Pavel Skripkin wrote:
>> On 10/21/21 15:29, Yu Kuai wrote:
>>> Yu Kuai (2):
>>>    nbd: fix max value for 'first_minor'
>>>    nbd: fix possible overflow for 'first_minor' in nbd_dev_add()
>>>
>>>   drivers/block/nbd.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>> 
>> Hi, Yu!
>> 
>> Thank you for the fix, but this wrong check should be just removed, 
>> since root case of wrong sysfs file creation was fixed, as Christoph 
>> said [1]
> 
> Hi, Pavel
> 
> Thanks for your response, with the root cause fixed, patch 1 is not
> needed anymore. However, the overflow case in patch 2 is still
> possible.
> 
> Does anyone plan to remove the checking?
> 


Hm, I thought it was already removed, but I was wrong, I guess. Let's 
see what Christoph thinks about this check.

Maybe add_disk() error handling is still not in Linus tree, I haven't 
checked yet. Sysfs warnings _should_ be fixed by proper error handling, 
but maybe there is another problem somewhere...




With regards,
Pavel Skripkin

