Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id D866431F393
	for <lists+nbd@lfdr.de>; Fri, 19 Feb 2021 02:24:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B57A4202E8; Fri, 19 Feb 2021 01:24:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Feb 19 01:24:09 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4548D205B7
	for <lists-other-nbd@bendel.debian.org>; Fri, 19 Feb 2021 01:08:12 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id truTRyIgir_B for <lists-other-nbd@bendel.debian.org>;
	Fri, 19 Feb 2021 01:08:07 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pl1-x631.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 7FF0E205D5
	for <nbd@other.debian.org>; Fri, 19 Feb 2021 01:08:06 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id s16so2406901plr.9
        for <nbd@other.debian.org>; Thu, 18 Feb 2021 17:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gtRvuZllWLJvgWkeOsFOqRZkywemAhOtgZ0A+r5rKzo=;
        b=1rCm2Q6LKW2K4r62YbXikCf6EHSI+PRLfvD0EeO6aVgu0VWCMbnaswKJ1KxPknmeur
         eyMW2XR0k1h1e+NdfgndIBdoxZUjL9kF9TaH4X42BTdnit/KY/WuBYHfUK+UVdipQUGn
         oL2OkOMHz5t1KDX/ReKBX/8x99NdwJVSVr9A8Fi62rOeHAgyrLSNRJzXw+60h9Kw7bmm
         xFdfmJj6Q0IRkQSTH9c3SBz0AL6ZP8Y+VnaYE6w86XZkmsqNZtXzx+7iDpfsxvuxUlwH
         KhTXhyn2gPbsihEtDpAeg9hN82jsDzPcyemAl2c2Hw4RMCdER8Ox0GPzHOmxfAd+yNr8
         hsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gtRvuZllWLJvgWkeOsFOqRZkywemAhOtgZ0A+r5rKzo=;
        b=aaZK7iFR1dkMSpYhMVUEj+74mdSlrud41LlErQXnEmOqkrINYllmbNdt38bMpichKT
         eajTIejJGH48Id1Sd9RaUsMk/cLoFFBeu5TfSOTon4n0afesO09NZ8JpURWt3nkUN1/V
         ZushPrTOj/GYkXicSUi7ZrVa1YAA2eMGXn2eVR7kXGgu9Lukwylmg2qnyKn3LA7IElOx
         32Cr0PurEfNjxSb2NRLOS0xYe88I81bymiEjKLptMHXmKIIkWFfSsYj2GV06+LVMvaOl
         /hjfuhm96bvrSaBYW4PyUG4Jn0+BioOdHzgoSx0dT9Q+x/gxg/9M0797LWbC3FJBf9pc
         D/hQ==
X-Gm-Message-State: AOAM531tegWnqGVm1FJNYAohcIw11+nio9Vy5BSfpNB2+l76jGbFK8/g
	y2h1pJDUsFESy2KDAbuozVEMpA==
X-Google-Smtp-Source: ABdhPJziquv0hmp3TbynLdn+U1SvAQttZ4o7yWpkhxeqGtYB4aKOtXYhWdB87Ue2cR3BnkJf+jXw5g==
X-Received: by 2002:a17:902:7887:b029:e3:8ef0:9a9d with SMTP id q7-20020a1709027887b02900e38ef09a9dmr6351472pll.2.1613696881718;
        Thu, 18 Feb 2021 17:08:01 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id h11sm6387043pjc.27.2021.02.18.17.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Feb 2021 17:08:01 -0800 (PST)
Subject: Re: [PATCH v6 0/2] fix a NULL pointer bug and simplify the code
To: Sun Ke <sunke32@huawei.com>, josef@toxicpanda.com, Markus.Elfring@web.de
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20210218122620.228375-1-sunke32@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <6df9a13d-b876-976f-ad48-884c88815269@kernel.dk>
Date: Thu, 18 Feb 2021 18:07:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210218122620.228375-1-sunke32@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Oy8JNm1SeBO.A.N_D.5MxLgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1137
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6df9a13d-b876-976f-ad48-884c88815269@kernel.dk
Resent-Date: Fri, 19 Feb 2021 01:24:09 +0000 (UTC)

On 2/18/21 5:26 AM, Sun Ke wrote:
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
>   nbd: Fix NULL pointer in flush_workqueue
>   nbd: share nbd_put and return by goto put_nbd
> 
>  drivers/block/nbd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied for 5.12, thanks.

-- 
Jens Axboe

