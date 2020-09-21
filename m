Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F942731CD
	for <lists+nbd@lfdr.de>; Mon, 21 Sep 2020 20:21:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 12CBB2037F; Mon, 21 Sep 2020 18:21:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 21 18:21:10 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B689C20372
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Sep 2020 18:04:00 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.11 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.13,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 14Q_7CBIwN2m for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Sep 2020 18:03:56 +0000 (UTC)
X-policyd-weight: using cached result; rate: -3.5
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id A3CC420353
	for <nbd@other.debian.org>; Mon, 21 Sep 2020 18:03:56 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d1so703461qtr.6
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 11:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r//0o/XWd8URpctj3JPXfpTU1RAK9bKNJbZkVi4S2sQ=;
        b=ouPaSesD+PwTUVNfOZBG7gfFoebajvxMnFMJJGhbtP0SfZJMpzRl+LRhCJP5xKUgaa
         BiOuJNMdkdOfeE9D4ZpPm7UtiPfkhZnmN1Ei7CWMIH+b6wgGrRb8FV2+/mptEvzF/Ttv
         HzkisWYywvqjs9NGOeI8LwCypBjQlA0ehqfseNCk5rGKXhkbO8ARjQGMDd+4YQ3u4DVL
         QnY0Bu2iRWGEIiqxSTxIGhMjhDaWldB0Q4FQLqlETrmqd6qbhGDe1NU+4xgb8fIFBBhS
         AYo1O0wJfN/a4EPqgtd6xBHjscaJtxn2K6iBCK+Q5wlZa30KIfzTdkwcyU4BF2tblMMC
         kuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r//0o/XWd8URpctj3JPXfpTU1RAK9bKNJbZkVi4S2sQ=;
        b=rEVnCUEM+QMRH9wOBMD3/5gvozYzaYvLIsAGaNeiiVqAO7VIhk5SYHwVEoaUuB7cJ2
         CySIeXtRJ4FkKDZgPtwNCN8+r7pgPhrk3jIx2NV1Ymc8NLwoYkxD82vQ6TV8F641elcJ
         QxmEj8oVtJLLuBrDnCh6MA1zmyMMoJh+J27j9V/1ry5ceSlyAFlZ7pUGO1HWeRcZdw8w
         am0rHIraHqttqbukJKiGF9sVNWQeWvp34JzjYk84FwTho0Por7tt2IKPXX1g1jvLPWQR
         gCQmkFc1lKA+3B/UYGXulwJb3kR6U20NCipng+x9mbkygcuyCYvxbBSrEtY8BcySSnrZ
         Yn6g==
X-Gm-Message-State: AOAM531zvlMM61js9a5B8k/yaFKaQYO+mc9G71+IFOD2oHo+IuCIGBjG
	6ofdnJoL1xuIuGfuqylVoCaxAfJE1nPO01xe
X-Google-Smtp-Source: ABdhPJyoPBgtJa+ce3Q+lGXEmKuOzIIwWIkgG/Gz+QQJRcvqCjdRf9fmMjwacFpgPFDufXj9dTbf0Q==
X-Received: by 2002:ac8:7388:: with SMTP id t8mr746977qtp.187.1600711433232;
        Mon, 21 Sep 2020 11:03:53 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id v16sm9452685qkg.37.2020.09.21.11.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 11:03:52 -0700 (PDT)
Subject: Re: [PATCH 3/3] nbd: introduce a client flag to do zero timeout
 handling
To: Hou Pu <houpu@bytedance.com>, axboe@kernel.dk
Cc: mchristi@redhat.com, linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200921105718.29006-1-houpu@bytedance.com>
 <20200921105718.29006-4-houpu@bytedance.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <7f680bff-a19e-3aff-c91e-98b2933826a9@toxicpanda.com>
Date: Mon, 21 Sep 2020 14:03:51 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200921105718.29006-4-houpu@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <vM186HExDTB.A.PpG.W8OafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/994
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/7f680bff-a19e-3aff-c91e-98b2933826a9@toxicpanda.com
Resent-Date: Mon, 21 Sep 2020 18:21:10 +0000 (UTC)

On 9/21/20 6:57 AM, Hou Pu wrote:
> Introduce a dedicated client flag NBD_RT_WAIT_ON_TIMEOUT to reset
> timer in nbd_xmit_timer instead of depending on tag_set.timeout == 0.
> So that the timeout value could be configured by the user to
> whatever they like instead of the default 30s. A smaller timeout
> value allow us to detect if a new socket is reconfigured in a
> shorter time. Thus the io could be requeued more quickly.
> 
> The tag_set.timeout == 0 setting still works like before.
> 
> Signed-off-by: Hou Pu <houpu@bytedance.com>

I like this idea in general, just a few comments below.

> ---
>   drivers/block/nbd.c      | 25 ++++++++++++++++++++++++-
>   include/uapi/linux/nbd.h |  4 ++++
>   2 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 4c0bbb981cbc..1d7a9de7bdcc 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -80,6 +80,7 @@ struct link_dead_args {
>   #define NBD_RT_BOUND			5
>   #define NBD_RT_DESTROY_ON_DISCONNECT	6
>   #define NBD_RT_DISCONNECT_ON_CLOSE	7
> +#define NBD_RT_WAIT_ON_TIMEOUT		8
>   
>   #define NBD_DESTROY_ON_DISCONNECT	0
>   #define NBD_DISCONNECT_REQUESTED	1
> @@ -378,6 +379,16 @@ static u32 req_to_nbd_cmd_type(struct request *req)
>   	}
>   }
>   
> +static inline bool wait_on_timeout(struct nbd_device *nbd,
> +				   struct nbd_config *config)
> +{
> +	if (test_bit(NBD_RT_WAIT_ON_TIMEOUT, &config->runtime_flags) ||
> +	    nbd->tag_set.timeout == 0)
> +		return true;
> +	else
> +		return false;
> +}
> +

This obviously needs to be updated to match my comments from the previous patch.

>   static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>   						 bool reserved)
>   {
> @@ -400,7 +411,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>   	    nbd->tag_set.timeout)
>   		goto error_out;
>   
> -	if (nbd->tag_set.timeout) {
> +	if (!wait_on_timeout(nbd, config)) {
>   		dev_err_ratelimited(nbd_to_dev(nbd),
>   				    "Connection timed out, retrying (%d/%d alive)\n",
>   				    atomic_read(&config->live_connections),
> @@ -1953,6 +1964,10 @@ static int nbd_genl_connect(struct sk_buff *skb, struct genl_info *info)
>   			set_bit(NBD_RT_DISCONNECT_ON_CLOSE,
>   				&config->runtime_flags);
>   		}
> +		if (flags & NBD_CFLAG_WAIT_ON_TIMEOUT) {
> +			set_bit(NBD_RT_WAIT_ON_TIMEOUT,
> +				&config->runtime_flags);
> +		}

Documentation/process/coding-style.rst

"Do not unnecessarily use braces where a single statement will do."

same goes for below.  Thanks,

Josef

