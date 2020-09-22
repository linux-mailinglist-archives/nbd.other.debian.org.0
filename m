Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B977D273944
	for <lists+nbd@lfdr.de>; Tue, 22 Sep 2020 05:30:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 88CB020410; Tue, 22 Sep 2020 03:30:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep 22 03:30:09 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BF22B2040D
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Sep 2020 03:14:57 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.61 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, BODY_8BITS=1.5, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.13,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id MO4qPLPKh8Lr for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Sep 2020 03:14:52 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pf1-x442.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 751A42040A
	for <nbd@other.debian.org>; Tue, 22 Sep 2020 03:14:51 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id z18so11160374pfg.0
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 20:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4YXVximMVBk4Q6UzqjVcDGCl1/Wd0o9kuGFpPERfHQI=;
        b=Z+SpVVb7Ij+Y8UgdGhnnLcMTZiwFcxCcyvE7Byzj6qfh76qUkM++CVmQYT1fx22cJy
         nNFVtRFF28PFYk/9CFscq9z7//ZQvZ9uRNn8P8bBfY3TlhcVSrV8LVdzhFsF7EMYmm/C
         zrhLkGttmamKTFKtxNgLCqn8iABzKBl3mXbFSyiXI7J2PQuxjvkWHpzmYfV6vQWXuaTv
         Ra8XtuFx+lL8wiyGZsen4f+VjPXV7PiX0Rm1VgMjx4aGNk6kGVVxtVINfgwuGH1Tp4Yj
         1WjZZ90W9wZqToa8ZbEpOtKxYU6p56mh5asK8HpsrfZBYXdhcdv6CZnUYNC7MTWx8lNK
         FnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4YXVximMVBk4Q6UzqjVcDGCl1/Wd0o9kuGFpPERfHQI=;
        b=fmCs8sORWprO8fMWq/LxhF4kRZq5AluOqwgZTn51bHICe97zo/Tb/td12qZjX1tEeD
         K40AWhCKJINQ8C3cxQ8tuy7Zhdz4D1LWpkZiUduLXV2nACq7mdKMjIgrArkRe7uBZ3PD
         JBcuDI1g/viZssZXFLZrYKKIvx8dcGa/w4/HfLcc+ClqwisfelL7UK16Y8bXmpsJOu9g
         o7vIBWnGKb3oDIg1mDydyIUL3kK7XBCec9ZP0PqGv3aqDnGxhVyW32BW1rNzxYA2HPTH
         9wd6QlVv68zmZ06A6GKTqCMgjjetnqL/56kDpDFx+nuy43b/NPHZQFrlZPnnsV4fwW2O
         Nq7Q==
X-Gm-Message-State: AOAM530WR6d0wZBQzGazShtYeLUjKuiEDQrdxs2hzuzvb+1qh9zEF3dN
	dh88ETYWi8OpyMEjs+oIDACnDkCOnUfoPnhI
X-Google-Smtp-Source: ABdhPJy6DP8TrYoPxogFHwh1oyuiWXMB3U0lGvHgdorQR4n8kCfVq556Xs6gZDR4Sc+ZYsUkpVV7cQ==
X-Received: by 2002:a63:4a43:: with SMTP id j3mr2045193pgl.42.1600744487410;
        Mon, 21 Sep 2020 20:14:47 -0700 (PDT)
Received: from houpudeMacBook-Pro.local ([61.120.150.74])
        by smtp.gmail.com with ESMTPSA id l78sm13145241pfd.26.2020.09.21.20.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 20:14:46 -0700 (PDT)
Subject: Re: [PATCH 2/3] nbd: unify behavior in timeout no matter how many
 sockets is configured
To: Josef Bacik <josef@toxicpanda.com>, axboe@kernel.dk
Cc: mchristi@redhat.com, linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200921105718.29006-1-houpu@bytedance.com>
 <20200921105718.29006-3-houpu@bytedance.com>
 <7f56fc84-5fbd-cf4a-e1d7-c6a75396a6bf@toxicpanda.com>
From: Hou Pu <houpu@bytedance.com>
Message-ID: <b451f14d-3ed1-e746-21c3-8dcf766ec91a@bytedance.com>
Date: Tue, 22 Sep 2020 11:14:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <7f56fc84-5fbd-cf4a-e1d7-c6a75396a6bf@toxicpanda.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7iRvBNgAaLL.A.eeC.B_WafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/997
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b451f14d-3ed1-e746-21c3-8dcf766ec91a@bytedance.com
Resent-Date: Tue, 22 Sep 2020 03:30:09 +0000 (UTC)



On 2020/9/22 2:01 AM, Josef Bacik wrote:
> On 9/21/20 6:57 AM, Hou Pu wrote:
>> When an nbd device is configured with multiple sockets, the request
>> is requeued to an active socket in xmit_timeout, the original socket
>> is closed if not.
>>
>> Some time, the backend nbd server hang, thus all sockets will be
>> dropped and the nbd device is not usable. It would be better to have an
>> option to wait for more time (just reset timer in nbd_xmit_timeout).
>> Like what we do if we only have one socket. This patch allows it.
>>
>> Signed-off-by: Hou Pu <houpu@bytedance.com>
>> ---
>>   drivers/block/nbd.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
>> index 538e9dcf5bf2..4c0bbb981cbc 100644
>> --- a/drivers/block/nbd.c
>> +++ b/drivers/block/nbd.c
>> @@ -400,8 +400,7 @@ static enum blk_eh_timer_return 
>> nbd_xmit_timeout(struct request *req,
>>           nbd->tag_set.timeout)
>>           goto error_out;
>> -    if (config->num_connections > 1 ||
>> -        (config->num_connections == 1 && nbd->tag_set.timeout)) {
>> +    if (nbd->tag_set.timeout) {
> 
> So now if you don't set a .timeout and have num_connections > 1 we don't 
> close the socket, so this won't work.  Thanks,
> 
> Josef

OK, will keep the behavior same as before when we don't set a .timeout
and num_connections > 1. And there is not need to keep this patch.
Will remove it in v2.

Thanks,
Hou

