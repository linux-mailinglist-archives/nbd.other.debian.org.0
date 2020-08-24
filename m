Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC9B24F198
	for <lists+nbd@lfdr.de>; Mon, 24 Aug 2020 05:39:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5F3C82044E; Mon, 24 Aug 2020 03:39:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Aug 24 03:39:10 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CC3D620443
	for <lists-other-nbd@bendel.debian.org>; Mon, 24 Aug 2020 03:23:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.413 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.107,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id H0oAGf0mLaQV for <lists-other-nbd@bendel.debian.org>;
	Mon, 24 Aug 2020 03:23:27 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pf1-x443.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 89BEE20417
	for <nbd@other.debian.org>; Mon, 24 Aug 2020 03:23:26 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id f193so4082525pfa.12
        for <nbd@other.debian.org>; Sun, 23 Aug 2020 20:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+JiC0giJA0MYcrcSlbtahDIbX8SVKKSEEk+p4agMCXM=;
        b=PyvL2DEN6k9wYXpr0eLynqAd6kGdGZ7XKvmJvqWA/7FXrk4nSefuPIxgKEwN92dCNY
         LpAf7x0teP88TPt/0pj9nPDIa6xCMBrNzwRLc94H0tviRh4wXssoYy9jXMISepe6VFiw
         /9u9QebEzdPGrpQEgQjSiiS6MJdHu+BaLycV5Ag2wZa/GL16a3DgKSg4LHo01fNby+o9
         X0xFkHN7XcXc7LseZbS1d1j9NjEXZxNGY6WpHAZg4Te1aKjemZsGCjUPqjVmn9z2STOC
         XoeIuFE7XdXDZX8PkFC/L5muVsGIE2WIF8Vg3hDLiaabI35BavaTgnyd+aLb0E+OudBO
         PBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+JiC0giJA0MYcrcSlbtahDIbX8SVKKSEEk+p4agMCXM=;
        b=btxfdEDI4NEp+5d9q4eOpcQZwIaNfmenVlHiZ3AQRZHn2vgw1HR7Z4AG6CPGAwIGTE
         JGKtfQ/0G09gTwlUlfmjLlCQw228zmYtIB9eBdQ/U0gQvoM+60CYKGOvR3B7uE8jlbzF
         g80eSQL47YLeppgn+N25N/qL6pMM180fmK88EOwdyqt/L4H6hVCPmrdKuV/Z8vywiM6u
         OHu/H9T8/RCh28Br+c2eTJP+eChnSD16WZTN6EdH6zo+PXaSV48cbbyL0OXNHohQjndQ
         GdiZwHejhD3knzEbAFiVoRjXZZd6HG/kPf5xX1t2ImhZp9KjCKVb9DY1yvDx1ib0/v4I
         MfpQ==
X-Gm-Message-State: AOAM533hLsvJ9lFuKHXsEkKlltct9lM6YQFfchgpl5Z3s634h8r8Z8EQ
	buGykOCNLQriRS7E1QnFfrox45tQN337Ug==
X-Google-Smtp-Source: ABdhPJyoEJnl0jhMrOYWAJqVSAFEPTXmvN2ilNwVpyKxZbf8KCzi5xHACRoNam5jzbEjDPsaqLSLZA==
X-Received: by 2002:a63:ce15:: with SMTP id y21mr2298850pgf.163.1598239403257;
        Sun, 23 Aug 2020 20:23:23 -0700 (PDT)
Received: from houpudeMacBook-Pro.local ([61.120.150.74])
        by smtp.gmail.com with ESMTPSA id go12sm7815366pjb.2.2020.08.23.20.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2020 20:23:22 -0700 (PDT)
Subject: Re: [PATCH] nbd: restore default timeout when setting it to zero
To: Josef Bacik <josef@toxicpanda.com>, axboe@kernel.dk, mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200810120044.2152-1-houpu@bytedance.com>
 <38b9de9e-38fe-3090-cea0-377c605c86d4@toxicpanda.com>
 <4e78e4b3-e75b-7428-703d-d8543bcfe348@bytedance.com>
 <1accbf37-1a57-f072-7dc4-063fee991189@toxicpanda.com>
From: Hou Pu <houpu@bytedance.com>
Message-ID: <701eaeb7-8b91-baa5-ebba-468f890c4cc5@bytedance.com>
Date: Mon, 24 Aug 2020 11:23:18 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1accbf37-1a57-f072-7dc4-063fee991189@toxicpanda.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <DbFCS6kiK8O.A.UpD.eZzQfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/946
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/701eaeb7-8b91-baa5-ebba-468f890c4cc5@bytedance.com
Resent-Date: Mon, 24 Aug 2020 03:39:10 +0000 (UTC)



On 2020/8/21 9:57 PM, Josef Bacik wrote:
> On 8/21/20 3:21 AM, Hou Pu wrote:
>>
>>
>> On 2020/8/21 3:03 AM, Josef Bacik wrote:
>>> On 8/10/20 8:00 AM, Hou Pu wrote:
>>>> If we configured io timeout of nbd0 to 100s. Later after we
>>>> finished using it, we configured nbd0 again and set the io
>>>> timeout to 0. We expect it would timeout after 30 seconds
>>>> and keep retry. But in fact we could not change the timeout
>>>> when we set it to 0. the timeout is still the original 100s.
>>>>
>>>> So change the timeout to default 30s when we set it to zero.
>>>> It also behaves same as commit 2da22da57348 ("nbd: fix zero
>>>> cmd timeout handling v2").
>>>>
>>>> It becomes more important if we were reconfigure a nbd device
>>>> and the io timeout it set to zero. Because it could take 30s
>>>> to detect the new socket and thus io could be completed more
>>>> quickly compared to 100s.
>>>>
>>>> Signed-off-by: Hou Pu <houpu@bytedance.com>
>>>> ---
>>>>   drivers/block/nbd.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>>>> index ce7e9f223b20..bc9dc1f847e1 100644
>>>> --- a/drivers/block/nbd.c
>>>> +++ b/drivers/block/nbd.c
>>>> @@ -1360,6 +1360,8 @@ static void nbd_set_cmd_timeout(struct 
>>>> nbd_device *nbd, u64 timeout)
>>>>       nbd->tag_set.timeout = timeout * HZ;
>>>>       if (timeout)
>>>>           blk_queue_rq_timeout(nbd->disk->queue, timeout * HZ);
>>>> +    else
>>>> +        blk_queue_rq_timeout(nbd->disk->queue, 30 * HZ);
>>>>   }
>>>>   /* Must be called with config_lock held */
>>>>
>>>
>>> What about the tag_set.timeout?  Thanks,
>>
>> I think user space could set io timeout to 0, thus we set 
>> tag_set.timeout = 0 here and also we should tell the block layer
>> to restore 30s timeout in case it is not. tag_set.timeout == 0
>> imply 30s io timeout and retrying after timeout.
>>
>> (Sorry, I am not sure if I understand your question here. Could
>> you explain a little more if needed?)
>>
> 
> I misunderstood what I was using the tagset timeout for.  We don't want 
> this here, if we're dropping a config for an nbd device and we want to 
> reset it to defaults then we need to add this to nbd_config_put().  Thanks,

AFAIK If we killed a nbd server, then restarted it and reconfigured
the nbd socket, I think we might not reconfigure IO timeout to 0 since
nbd_config_put() is not called in such case. So could we still
restore default timeout here. Or am I missing something?

Thanks,
Hou

> 
> Josef

