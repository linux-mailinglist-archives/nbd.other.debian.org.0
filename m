Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D9B31F174
	for <lists+nbd@lfdr.de>; Thu, 18 Feb 2021 21:57:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DC790204CD; Thu, 18 Feb 2021 20:57:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Feb 18 20:57:08 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BF07520407
	for <lists-other-nbd@bendel.debian.org>; Thu, 18 Feb 2021 20:39:52 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id j8JLTX0WsMJB for <lists-other-nbd@bendel.debian.org>;
	Thu, 18 Feb 2021 20:39:47 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qv1-xf2e.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C475B20446
	for <nbd@other.debian.org>; Thu, 18 Feb 2021 20:39:47 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id s12so961449qvq.4
        for <nbd@other.debian.org>; Thu, 18 Feb 2021 12:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=izMGeH6dYVvvRYrg+SR4dkbWf4tBjA1jwd/PyFi3k5E=;
        b=wvbQo9QE9Wp3Chgcgpv7CYoqwp7kuaqfdQiTlgUq1h2J0aIotvMIuP5ipnZFwbxCik
         8+fQDHd+5vQn9VJ9W7BEr6EmbrgE6VqkqCNPBdmPmWEIUk60ccqRFE1k7UM3MXNmEgDA
         b05+G2h4KJBlkqJQq9vMrgGM9SoyfU9dQzuhXajoxI2uvdnURdWWsa6wm08CK5jYHofJ
         yfhVgjvI4gye1JSSsSR8UHHdUyNq1LYs2H+H5JzmMRcxr+CNIUXUaNcNkbCNBvI7+Q93
         hBouq+CbswlkAnbHkan+su0ONtwzeDED5Vc0O4tZ5i22dBVOlbxXIbSagal8+HQyYlIM
         5RUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=izMGeH6dYVvvRYrg+SR4dkbWf4tBjA1jwd/PyFi3k5E=;
        b=jYzDmGaJpK4gwieeal2Rc9bXhPJIskCT1P2E+2kcNOttmcMcVeOqMmDEGf9LNhuAe5
         TlErA+SZUzBo8hoxqOk1tNStJlJ1KA5lEff1yQsVezvqzIqd2lGELQz7yUm3G+/ytGEo
         mLgCqb992ISd5S/h/win2QzhnqIK0ohUcjUdYYQz4srECgHsL01OzEyL0lt+wUv9k9j7
         CLMyT2J8kaxGPR39NQJom/M/Lk6l7nNJHVluq9GjT7aPgFfJbqTTKSLAr3UkhHJbOd1A
         j91jwMZiQM5YAipUdUKoaD+wyXVArRYc5O4QK6nZ+CILkkzpac07FNqrFaZUW87C9AgY
         dSWQ==
X-Gm-Message-State: AOAM533E+lhJDHjqMCP5IkyFdIe2KjKQ1Xl5uFIDBrImeiLjjsBFbHq8
	Oc2gCkkk6TZqaxIncAaR1+S20A==
X-Google-Smtp-Source: ABdhPJxztKx9mX1HlP26QR3/cQf+f3xOlIqt2zgVBzeiQy++BDSTSrLA4mV45L/nyeRanv+vk9XGhw==
X-Received: by 2002:a0c:fc44:: with SMTP id w4mr5848013qvp.55.1613680783943;
        Thu, 18 Feb 2021 12:39:43 -0800 (PST)
Received: from ?IPv6:2620:10d:c0a8:11d9::1105? ([2620:10d:c091:480::1:bcfb])
        by smtp.gmail.com with ESMTPSA id s14sm4068292qtq.97.2021.02.18.12.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Feb 2021 12:39:42 -0800 (PST)
Subject: Re: [PATCH v6 0/2] fix a NULL pointer bug and simplify the code
To: Sun Ke <sunke32@huawei.com>, axboe@kernel.dk, Markus.Elfring@web.de
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20210218122620.228375-1-sunke32@huawei.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <4f9d9983-2409-301d-73da-94f0f58c8782@toxicpanda.com>
Date: Thu, 18 Feb 2021 15:39:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218122620.228375-1-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0U8hKvT_XjB.A.1NE.kStLgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1136
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/4f9d9983-2409-301d-73da-94f0f58c8782@toxicpanda.com
Resent-Date: Thu, 18 Feb 2021 20:57:08 +0000 (UTC)

On 2/18/21 7:26 AM, Sun Ke wrote:
> fix a NULL pointer bug and simplify the code
> 
> v6: Just add if (nbd->recv_workq) to nbd_disconnect_and_put().
> v5: Adjust the title and add “Suggested-by”.
> v4: Share exception handling code for if branches and
> 	move put_nbd adjustment to a separate patch.
> v3: Do not use unlock and add put_nbd.
> v2: Use jump target unlock.
> 
> Sun Ke (2):
>    nbd: Fix NULL pointer in flush_workqueue
>    nbd: share nbd_put and return by goto put_nbd
> 
>   drivers/block/nbd.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 

You can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

to both of these, thanks,

Josef

