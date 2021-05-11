Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D50537A870
	for <lists+nbd@lfdr.de>; Tue, 11 May 2021 16:06:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 5390120276; Tue, 11 May 2021 14:06:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue May 11 14:06:09 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,FOURLA,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6AFE3202C1
	for <lists-other-nbd@bendel.debian.org>; Tue, 11 May 2021 13:48:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id UfVTxC8ZvEs8 for <lists-other-nbd@bendel.debian.org>;
	Tue, 11 May 2021 13:48:32 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pg1-x52e.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CA5B520282
	for <nbd@other.debian.org>; Tue, 11 May 2021 13:48:29 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id l70so1086371pga.1
        for <nbd@other.debian.org>; Tue, 11 May 2021 06:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Mo+U9QAR21yaX72b0ALo/LmNCSm3uwdtfXj48gyyn9s=;
        b=rHpv6wiFztE9P7VXL2P+E3fTJwJku3yR5LcPHyCr3OqTjbdS5jo7JCEpXkIhYPhy+2
         3R/dR3Xq9y+68SrRyHhe1uBBqGl1FBCtc98HXr3J2Yt4kPKjie0mPUeBByBgx4v0Yd8q
         GYAblKoOfaxjS/8KYACqefENPPz8pVrknqxywsz+HzK1GfpRO6OxMNpvgUB0Fq0xKdUw
         FjAwoM+qnnVc9Us2n+YBHtMZ7rKrMnoWW4k2UTdxrhIkOPq9mxxt6NjlqU/niQDDfwOm
         egXJw0csmOBjblajxkrlzSmDkKIEU8jxFUixb4ACA16gRHJ+2+G1EjjuR2b5e+kt9yQW
         0/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mo+U9QAR21yaX72b0ALo/LmNCSm3uwdtfXj48gyyn9s=;
        b=YOT8OwLqGcJuak0kdxnAD/XGwYZaGgIBsvXjRqE2EwIpYm/HTdMrYsHho494YYWAnB
         f6rzkgwc+xpzR7r3t9UPsE74JS8NB7nLmNPJgZzsFdWsvzVAWZzl0R5qFWlLNAbJY2BS
         oECId+nB3K0azPvVoM+09pH3s5QRjuO9V+VgKHDqMU0qUPYhP5vLbe7qFLDH1m46tS5N
         YS+cCEVtkdASeRaD+ldJQTIIHOEirjw50NcVYpSDnaWpu0P7GuASwwTWawxnoyJL1/ma
         zeo+XyixUi2PjaCiklTVUo2837dQ2rrKK9r0oVGBt+4tMld2P78RoKhm2wyCtREDnDzB
         cDiw==
X-Gm-Message-State: AOAM531elP9vFbHvPdrPrKdZ5m3nl3zp+7YocUQ75k8YWymj1bBaX3J9
	xY+WMBmjvk2brKjkGAf/97+jgw==
X-Google-Smtp-Source: ABdhPJzOdeKU451hMKMemeI66d1trTy70/4aIUBfcyyoHV9k1KCJ59/fvR3Ky6gc319AF7TEhidLxg==
X-Received: by 2002:a05:6a00:78e:b029:28e:62a4:5f3 with SMTP id g14-20020a056a00078eb029028e62a405f3mr30302561pfu.19.1620740905302;
        Tue, 11 May 2021 06:48:25 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id e20sm2314126pjt.8.2021.05.11.06.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 06:48:24 -0700 (PDT)
Subject: Re: [PATCH v6 0/2] fix a NULL pointer bug and simplify the code
To: Sun Ke <sunke32@huawei.com>, josef@toxicpanda.com, Markus.Elfring@web.de
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20210218122620.228375-1-sunke32@huawei.com>
 <6df9a13d-b876-976f-ad48-884c88815269@kernel.dk>
 <aa80f848-c895-4478-f582-10a57a1166c3@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <6ab031d5-f836-77c9-8be0-7b3e82a087a8@kernel.dk>
Date: Tue, 11 May 2021 07:48:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <aa80f848-c895-4478-f582-10a57a1166c3@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZrR0z82bsNG.A.AEC.R9omgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1152
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/6ab031d5-f836-77c9-8be0-7b3e82a087a8@kernel.dk
Resent-Date: Tue, 11 May 2021 14:06:09 +0000 (UTC)

On 5/11/21 12:59 AM, Sun Ke wrote:
> 
> 在 2021/2/19 9:07, Jens Axboe 写道:
>> On 2/18/21 5:26 AM, Sun Ke wrote:
>>> fix a NULL pointer bug and simplify the code
>>>
>>> v6: Just add if (nbd->recv_workq) to nbd_disconnect_and_put().
>>> v5: Adjust the title and add “Suggested-by”.
>>> v4: Share exception handling code for if branches and 
>>> 	move put_nbd adjustment to a separate patch.
>>> v3: Do not use unlock and add put_nbd.
>>> v2: Use jump target unlock.
>>>
>>> Sun Ke (2):
>>>   nbd: Fix NULL pointer in flush_workqueue
>>>   nbd: share nbd_put and return by goto put_nbd
>>>
>>>  drivers/block/nbd.c | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>> Applied for 5.12, thanks.
> 
> Hi Jens,
> 
> I do not see the patches merged yet, is there anything wrong?

Huh, that's very strange. Not sure what happened here, care to
resend them?

-- 
Jens Axboe

