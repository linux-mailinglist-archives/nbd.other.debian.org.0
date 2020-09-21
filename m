Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB62731BF
	for <lists+nbd@lfdr.de>; Mon, 21 Sep 2020 20:18:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 19B2020381; Mon, 21 Sep 2020 18:18:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 21 18:18:09 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8FDED2037F
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Sep 2020 18:01:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.11 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.13,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LmD9dU02vSQ9 for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Sep 2020 18:01:33 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x742.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4621B2037A
	for <nbd@other.debian.org>; Mon, 21 Sep 2020 18:01:32 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id o5so16062190qke.12
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BEKm5BdGZ0I7bWDny206FOs0HiTvM3zZllXglCtiZJc=;
        b=ouqtkDDpVA1XvQn42tRtsgrQyDq59fmp1feQ1VewFq7N+FiT1OR1Zj1+sZg6bGiZVj
         RLPLDVD9brj5X6pphFfzsGm+zyOraO61NQtMplmQbEExaWMqAAoB23EitMOFqMXtDzMm
         agV0K81f/9GzFgr2hFyE1/fIa4UXYgsUJ6EFQKhU5Z4BcVF7NquDyWpiUPKZ3bX8+XOZ
         pIMx/cHfRPXmxcYdd74scsePr82c2OJss53qzhVs/ilCjD4s3AA6vhDZulDT1+sCTXDE
         +bTnM78qm+MIagvun9PHv3AMZ4Sq/ssvI6H/9DtHqQw8VuqFP8lsX91abEgCXUXh4l1y
         X5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BEKm5BdGZ0I7bWDny206FOs0HiTvM3zZllXglCtiZJc=;
        b=jY6gN4uZeSOVO0/DGdlOs0wgRTewopBDYD+3d+/tt6bpEMqzzMUJat5bqtvxlPrYIK
         gR1MQF56igRBpuiCGog0t7XOHSIRP/ksTGUVUt7bcCyNBCVDay5mX6EGb6SOQULpp3LQ
         XcLANTAyPCUUMbdC0J5pGf69cnpG94c3g0XF72UX21skt1WVq9AhYJivDayf5nIz/d/K
         9rP0Xiw9KE4cXaZgkaaoELrF1SMbZClM1ppcHpxO5hlN16nOFKW4+dC+1WU9kSQeFezg
         OVWpkYjZeRh/1ULGhm/JYHKaGeznCr/jZOmH//6sbDQK7nE4FqjmUKDfkyV+OY/RctZu
         cabw==
X-Gm-Message-State: AOAM531rRZIhyrdGxCkNQ0gTeZ48kD1FHKpYlzyzRnKacDySR99/+br+
	3thoXnL5DIKyBepNml8O4xZTtXV6SNPCdNF4
X-Google-Smtp-Source: ABdhPJxSB7rwOqzDUgtBFa98VCKM6R/xVW5x+xBn+1OZMRjGnNceaFk3Fnemyi36NBk07nFeFS8nmg==
X-Received: by 2002:a05:620a:a10:: with SMTP id i16mr1001418qka.31.1600711289343;
        Mon, 21 Sep 2020 11:01:29 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id f189sm9876417qkd.20.2020.09.21.11.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 11:01:28 -0700 (PDT)
Subject: Re: [PATCH 2/3] nbd: unify behavior in timeout no matter how many
 sockets is configured
To: Hou Pu <houpu@bytedance.com>, axboe@kernel.dk
Cc: mchristi@redhat.com, linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200921105718.29006-1-houpu@bytedance.com>
 <20200921105718.29006-3-houpu@bytedance.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <7f56fc84-5fbd-cf4a-e1d7-c6a75396a6bf@toxicpanda.com>
Date: Mon, 21 Sep 2020 14:01:27 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200921105718.29006-3-houpu@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <G3aCcdC7-CN.A.EGG.h5OafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/993
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/7f56fc84-5fbd-cf4a-e1d7-c6a75396a6bf@toxicpanda.com
Resent-Date: Mon, 21 Sep 2020 18:18:10 +0000 (UTC)

On 9/21/20 6:57 AM, Hou Pu wrote:
> When an nbd device is configured with multiple sockets, the request
> is requeued to an active socket in xmit_timeout, the original socket
> is closed if not.
> 
> Some time, the backend nbd server hang, thus all sockets will be
> dropped and the nbd device is not usable. It would be better to have an
> option to wait for more time (just reset timer in nbd_xmit_timeout).
> Like what we do if we only have one socket. This patch allows it.
> 
> Signed-off-by: Hou Pu <houpu@bytedance.com>
> ---
>   drivers/block/nbd.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 538e9dcf5bf2..4c0bbb981cbc 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -400,8 +400,7 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req,
>   	    nbd->tag_set.timeout)
>   		goto error_out;
>   
> -	if (config->num_connections > 1 ||
> -	    (config->num_connections == 1 && nbd->tag_set.timeout)) {
> +	if (nbd->tag_set.timeout) {

So now if you don't set a .timeout and have num_connections > 1 we don't close 
the socket, so this won't work.  Thanks,

Josef

