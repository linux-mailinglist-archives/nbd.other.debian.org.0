Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id E74CD24C63C
	for <lists+nbd@lfdr.de>; Thu, 20 Aug 2020 21:21:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B42F020935; Thu, 20 Aug 2020 19:21:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 20 19:21:09 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 89E6F208DF
	for <lists-other-nbd@bendel.debian.org>; Thu, 20 Aug 2020 19:04:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.087 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.107,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id yzYzQ-AY_Oob for <lists-other-nbd@bendel.debian.org>;
	Thu, 20 Aug 2020 19:04:03 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x741.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D9785208BA
	for <nbd@other.debian.org>; Thu, 20 Aug 2020 19:04:00 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 77so2482387qkm.5
        for <nbd@other.debian.org>; Thu, 20 Aug 2020 12:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IeFPzbP1/2uAC63tpGSICX90ZeHerr1PdZBO6JLKSEc=;
        b=IQ7r/nEK7QULQRgUruYtViggIk0yrhBkkQm+CAUw5a8EkOnP3Z3Obwe+AO0CkVc/+y
         ckR7dGWSlFKb29QS0VaoqtV5YPbCz6ErkAeZPa2IRaPAfSWfvMP3eicS9eJsmAbu8gne
         /7p2ywSqzlkFqVg1j+WcXM5mn+AoWMbN976tyr2/amy+IMQWGtkTs2oeWfEgjtOnZyuR
         NuMolaRSNG8pjgUGCo2/n4f2E4wCSaTOeyB0PpHm3ee4kLIBtZQSDaWXNvfaJw6vwdYL
         MOswIkvUu4TrXsqotNQwjrIdVNX6Soz9+HzRrTovFXuxLF6As6m+Yu/UMrlHE78YSkOr
         cAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IeFPzbP1/2uAC63tpGSICX90ZeHerr1PdZBO6JLKSEc=;
        b=YmNN1JhCCGmpAw9dOmBak2l91k8YfVQ526s5W1966vxl2vl05lSYWxkvC2kLwJ9g7a
         GtrYtEVTk5y+EhLVZS2CMOPwt07id97ID+dxFsMekkl3vn/2i/xKX72mnmcHz77/cHJC
         Q9MYyCw9eyeePht+1RXEc6B53TRD0pY7TgdzHhyZ6b0vj8dhdfmBwUnfgIcJPy/l+3ay
         C2O1Q4RV/9J+SmLuvnPkXiYNnv0fbtMzE2Us04XM86YdTotDvwDvA/bCQ7wUBlvbJFxf
         +Sn4o3KNsdIiTW5bFGcALhR0B3l+d/foGUBtlb7k2wFJ6y6jhah8MVqDhHOkvVsaAUkf
         e8vA==
X-Gm-Message-State: AOAM532DRFUmJo53P+iaDuflcFT5qn/eSe4UuJ1RlDB8IiW8Q+Aorrov
	Bi/wS7D632CwO0vWfmLMqDKIzxWit2ghs3/b
X-Google-Smtp-Source: ABdhPJxmqy7dS0O0hH738bLfEgtU0qr9+TxisyoIN9ytnGIneRTmRoQgQqgQOxuELiy3Yqq1QNdKpw==
X-Received: by 2002:a05:620a:1436:: with SMTP id k22mr3751412qkj.308.1597950236554;
        Thu, 20 Aug 2020 12:03:56 -0700 (PDT)
Received: from ?IPv6:2620:10d:c0a8:11d1::113c? ([2620:10d:c091:480::1:2623])
        by smtp.gmail.com with ESMTPSA id o17sm3740176qtr.13.2020.08.20.12.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 12:03:55 -0700 (PDT)
Subject: Re: [PATCH] nbd: restore default timeout when setting it to zero
To: Hou Pu <houpu@bytedance.com>, axboe@kernel.dk, mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200810120044.2152-1-houpu@bytedance.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <38b9de9e-38fe-3090-cea0-377c605c86d4@toxicpanda.com>
Date: Thu, 20 Aug 2020 15:03:54 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200810120044.2152-1-houpu@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <O53Pt8bDZKG.A.hpC.l0sPfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/938
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/38b9de9e-38fe-3090-cea0-377c605c86d4@toxicpanda.com
Resent-Date: Thu, 20 Aug 2020 19:21:09 +0000 (UTC)

On 8/10/20 8:00 AM, Hou Pu wrote:
> If we configured io timeout of nbd0 to 100s. Later after we
> finished using it, we configured nbd0 again and set the io
> timeout to 0. We expect it would timeout after 30 seconds
> and keep retry. But in fact we could not change the timeout
> when we set it to 0. the timeout is still the original 100s.
> 
> So change the timeout to default 30s when we set it to zero.
> It also behaves same as commit 2da22da57348 ("nbd: fix zero
> cmd timeout handling v2").
> 
> It becomes more important if we were reconfigure a nbd device
> and the io timeout it set to zero. Because it could take 30s
> to detect the new socket and thus io could be completed more
> quickly compared to 100s.
> 
> Signed-off-by: Hou Pu <houpu@bytedance.com>
> ---
>   drivers/block/nbd.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index ce7e9f223b20..bc9dc1f847e1 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1360,6 +1360,8 @@ static void nbd_set_cmd_timeout(struct nbd_device *nbd, u64 timeout)
>   	nbd->tag_set.timeout = timeout * HZ;
>   	if (timeout)
>   		blk_queue_rq_timeout(nbd->disk->queue, timeout * HZ);
> +	else
> +		blk_queue_rq_timeout(nbd->disk->queue, 30 * HZ);
>   }
>   
>   /* Must be called with config_lock held */
> 

What about the tag_set.timeout?  Thanks,

Josef

