Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC33F7D34
	for <lists+nbd@lfdr.de>; Wed, 25 Aug 2021 22:33:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D0AA12095B; Wed, 25 Aug 2021 20:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Aug 25 20:33:09 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 61942208E5
	for <lists-other-nbd@bendel.debian.org>; Wed, 25 Aug 2021 20:15:09 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.285 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.305,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id HvCl0E5vEEin for <lists-other-nbd@bendel.debian.org>;
	Wed, 25 Aug 2021 20:15:04 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x733.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 24E13208EE
	for <nbd@other.debian.org>; Wed, 25 Aug 2021 20:15:03 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id a10so733921qka.12
        for <nbd@other.debian.org>; Wed, 25 Aug 2021 13:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7JUe9utKIklg7WbbREol5f/k2StuipgLZg/3eym4DS4=;
        b=HiQQEhCyUu5BIN42qNWJg8J5kWmSQNWBbTEnyKng+eBnCt4JZvBY+/JqBa3P1nrTXp
         8q8TFb3+QL57fkQIO29ILeT3QbCJFz6ltjahxGwqzUqZI22s+Q1c1CKF8CxsKqDpWmRf
         Itvsb0B5DlGNYp+BSPxJF5GXraN2WYh2ErnHxUv+4SXPqSO93nqJFZsFdVb/tuhp0ne+
         nXaX0Do4ihSLGfh1rVxLCM5bfa1dHA1a6JiCiJ+8yaPfCnQxw0R9gZATiDcLLwczOMti
         xmXDnY/8ROk/PrTGTEBeJAR42+usIy4pW8ppky8Jsb3SzZQ1CrKxRNDRxH4x6wwi854M
         IeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7JUe9utKIklg7WbbREol5f/k2StuipgLZg/3eym4DS4=;
        b=GD2TDvlR6dAKmc+uSCiPyiUiDunHbjI2iuvdiLT6UINv+eDEOryQTjlHVLSJWzLvQh
         AJcp5CDxNXcyfKEC1ISZmUn5XDN42hn6T/5NnmZcs43OT0a+Q/C8//ttVjyAE+ptfVdL
         grkQz5xPghtE2I6+B7N2QbYJ63jYUAPFB7e3+JohZg3s1Uk9J2kC04guMGsyZE3XY1NS
         J5cnUfr+lNBEATeJEXVbZFKcweR9HHRUQd3ezNNistlMWsJJj7xLNgwAUATZKm2XwaCc
         oHsWuQlFkM/o/iJ9zrPSqdVanbwAVLZBc8nroC/wvvr2k+eK5EgB2jUsf/2/k/EDjl5L
         VhlA==
X-Gm-Message-State: AOAM5327czFKyP+sQaQkHoni3rSB/fBbmjXrZE2PFUeoFKRmepNIKrp0
	PwnL/cXrU91G8Sdyxpp8uT3GSQ==
X-Google-Smtp-Source: ABdhPJznD+HfZVv+ttHkdzt0+Qvgl7BZglrYwPLehfVZ8hUl3QNf8vcQHrvGPBjohBzcpVluGYvuMA==
X-Received: by 2002:a05:620a:4151:: with SMTP id k17mr314635qko.51.1629922500094;
        Wed, 25 Aug 2021 13:15:00 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id n5sm509518qtp.35.2021.08.25.13.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Aug 2021 13:14:59 -0700 (PDT)
Subject: Re: nbd lifetimes fixes
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 Xiubo Li <xiubli@redhat.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
References: <20210825163108.50713-1-hch@lst.de>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <78dad9ba-c89e-2a30-c083-16ef0324b48e@toxicpanda.com>
Date: Wed, 25 Aug 2021 16:14:58 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210825163108.50713-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <bmHmvNKFc0P.A.8jE.FkqJhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1337
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/78dad9ba-c89e-2a30-c083-16ef0324b48e@toxicpanda.com
Resent-Date: Wed, 25 Aug 2021 20:33:09 +0000 (UTC)

On 8/25/21 12:31 PM, Christoph Hellwig wrote:
> Hi Josef and Jens,
> 
> this series tries to deal with the fallout of the recent lock scope
> reduction as pointed out by Tetsuo and szybot and inspired by /
> reused from the catchall patch by Tetsuo.  One big change is that
> I finally decided to kill off the ->destroy_complete scheme entirely
> because I'm pretty sure it is not needed with the various fixes and
> we can just return an error for the tiny race condition where it
> matters.  Xiubo, can you double check this with your nbd-runner
> setup?  nbd-runner itself seems pretty generic and not directly
> reproduce anything here.
> 
> Note that the syzbot reproduer still fails eventually, but in
> devtmpfsd in a way that does not look related to the loop code
> at all.
> 

Looks good to me, you can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

