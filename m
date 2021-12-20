Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F25547B217
	for <lists+nbd@lfdr.de>; Mon, 20 Dec 2021 18:27:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4C69C2023B; Mon, 20 Dec 2021 17:27:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Dec 20 17:27:12 2021
Old-Return-Path: <bart.vanassche@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=4.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BC3FB2021A
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 Dec 2021 17:10:25 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.479 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, FREEMAIL_FORGED_FROMDOMAIN=0.25,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id gk6HNLxl_1a9 for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 Dec 2021 17:10:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .gmail. - helo: .mail-pg1-f173.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 8A74320219
	for <nbd@other.debian.org>; Mon, 20 Dec 2021 17:10:20 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id r5so9950779pgi.6
        for <nbd@other.debian.org>; Mon, 20 Dec 2021 09:10:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tJqbUHV90MYT7sauKSyrvUY9zVpGUS3+UEyHIr2dLnY=;
        b=BLkCFjo3gkX7fSFBkfJIGnhpcrXxN1pq75i2605nXoijZ0R8fBxJFXY16lskx6stdl
         XQxGPeCljX+RxdVPg0JGK6e+RJiwSEOvMAOxYrNK1OC7rDdMqf4t2Oi0icq5o+opWHkn
         Ak0566EkUzwG+oiGuqzfNaZ/7NUPU4yxzg6sUl4hOZm8OL6w4Qsw3Nkw8jCuW6iey45w
         hAshiVN/RX4KfbVHaM5zGUh3d4LQNpeys2yzdJurugJbMfjG/j4gR0ZtOm/prGpEm9jC
         fJcFV/4QKnvd6aIkkUOrFeXjKUHqkJDnrdFZ+p4L8JJfTr8MP4xdjfw7Uh5AwOWz7yXG
         ALpw==
X-Gm-Message-State: AOAM532It6bEjNUnp9XXQTy26p++kHM5RjjXk2+FiPxY60840glBLGld
	kf/LjDXjssCiW32LHGP/J9o=
X-Google-Smtp-Source: ABdhPJxwOSjE1jdX7wbjjGBxvw5S+FLJAIe83DDBI6cya2hxJp0wNz/zciDp+jHSlP+7qyAUAlUVLw==
X-Received: by 2002:a63:8ac2:: with SMTP id y185mr15868960pgd.205.1640020216814;
        Mon, 20 Dec 2021 09:10:16 -0800 (PST)
Received: from ?IPV6:2601:647:4000:d7:feaa:14ff:fe9d:6dbd? ([2601:647:4000:d7:feaa:14ff:fe9d:6dbd])
        by smtp.gmail.com with ESMTPSA id x33sm9549361pfh.212.2021.12.20.09.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Dec 2021 09:10:16 -0800 (PST)
Message-ID: <a4ba2441-83eb-dde2-09ae-7c5f42ff6ad3@acm.org>
Date: Mon, 20 Dec 2021 09:10:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] nbd: Don't use workqueue to handle recv work
Content-Language: en-US
To: Xie Yongji <xieyongji@bytedance.com>, josef@toxicpanda.com,
 axboe@kernel.dk
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20211220122241.150-1-xieyongji@bytedance.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20211220122241.150-1-xieyongji@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <5kb-bxH8UfM.A.teB.wzLwhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1661
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a4ba2441-83eb-dde2-09ae-7c5f42ff6ad3@acm.org
Resent-Date: Mon, 20 Dec 2021 17:27:12 +0000 (UTC)

On 12/20/21 04:22, Xie Yongji wrote:
> The rescuer thread might take over the works queued on
> the workqueue when the worker thread creation timed out.
> If this happens, we have no chance to create multiple
> recv threads which causes I/O hung on this nbd device.
> 
> To fix it, this tries to create kthreads directly to
> handle the recv work instead of using workqueue.

Why a kthread instead of only removing the WQ_MEM_RECLAIM flag from the 
alloc_workqueue() call? This should have been explained in the patch 
description. Additionally, a Fixes: tag is missing.

Thanks,

Bart.

