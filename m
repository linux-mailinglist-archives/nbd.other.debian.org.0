Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 908233EB9B6
	for <lists+nbd@lfdr.de>; Fri, 13 Aug 2021 18:03:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6754320426; Fri, 13 Aug 2021 16:03:23 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug 13 16:03:23 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B5990203FF
	for <lists-other-nbd@bendel.debian.org>; Fri, 13 Aug 2021 15:47:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id buEz4O1UZwG3 for <lists-other-nbd@bendel.debian.org>;
	Fri, 13 Aug 2021 15:47:35 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pl1-x62b.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 1B99520416
	for <nbd@other.debian.org>; Fri, 13 Aug 2021 15:47:34 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e19so12474418pla.10
        for <nbd@other.debian.org>; Fri, 13 Aug 2021 08:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TAHZ9xtB9D+0vRE/S8GTVqJgU+M+H3OBUaxsP5GUUy0=;
        b=zVjjfXmmFL6uWMbplx8qwZpKz/qocv3OVo5bNSrKq2e6ZZYOqKGKmh7AfjPTlW0Zf8
         SrSGtTajDjFnJNra5e8EzvyCTOSQ+ZjqioJL7JaMl8wnMkaxidHfr8kkQzb3RP7+fmKL
         yf08NXmMWpdfesnTrEVBz6hLoRCoqeirvNUFFZP7mmdof0SOJnFTgvkJdj0l+TGvcE3o
         pXmAb+gj8p6VESU6aff0hxI5l23p3/R1gQSmP+gbfj6m1nEXgBmwp/sUaVG5F1dAG9LQ
         vHtN0c3sSPTGOaXib1ipAuP+5FAy9rG1q1Ll5IOEgs5ndNLXeNGEeUPZJJDXB9itiizA
         lfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TAHZ9xtB9D+0vRE/S8GTVqJgU+M+H3OBUaxsP5GUUy0=;
        b=o+/RjMXKJCWzU7wMAyknq3evUwgpNxuUaxD6xvXldGLRLWAZ0omDJR7dCbNMhYDCwU
         cx/8Ioii9Xw6e0K9ig6yhvT8MvfUcUDkSShhOi9+T9fxb2ifK9GJaz7OqtrX6Sq3sACx
         nfoRAkYPBHRRLNln1XXYCZTEgwr4dD58/0u+Lv6e2XJ8eibLy/1b/rzBalnl8H1uexjw
         xqyib4lb+I+DNv/zVnBtukREbsN3qG4ZNICWGrz2pOlIss4aNoH5I1/xrCfLwpRbydCt
         PDYbuGLwULG846ee1T86v/Gczdzb5M9HILFYRYl9m5zyiRO1i6hcKp+GVqIZ3nLSFKXK
         zjkQ==
X-Gm-Message-State: AOAM533pWekrFOT+FQga2qEqCPy7o0xz0mwvVvBchzuTSl0quEsFH1E+
	pqMAS82gkV5/XONeTv/gymO5bb+LaQdjvFXb
X-Google-Smtp-Source: ABdhPJxu6iFt3It7c7oZuenO9Kkj1tWXwzMyk2OuNiEAvBiV7YGUQDEIvvCICn8DBh7RyvJAj9Xf0w==
X-Received: by 2002:a17:90a:6684:: with SMTP id m4mr3230706pjj.127.1628869650611;
        Fri, 13 Aug 2021 08:47:30 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id i6sm2768562pfa.44.2021.08.13.08.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 08:47:30 -0700 (PDT)
Subject: Re: [PATCH RESEND] nbd: Aovid double completion of a request
To: Xie Yongji <xieyongji@bytedance.com>, josef@toxicpanda.com
Cc: jiangyadong@bytedance.com, linux-block@vger.kernel.org,
 nbd@other.debian.org
References: <20210813151330.96-1-xieyongji@bytedance.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <2b10e7bd-f00f-33de-5e53-38947b270fe3@kernel.dk>
Date: Fri, 13 Aug 2021 09:47:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210813151330.96-1-xieyongji@bytedance.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <TESRK-mhTwH.A.ffC.LfpFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1285
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2b10e7bd-f00f-33de-5e53-38947b270fe3@kernel.dk
Resent-Date: Fri, 13 Aug 2021 16:03:23 +0000 (UTC)

On 8/13/21 9:13 AM, Xie Yongji wrote:
> There is a race between iterating over requests in
> nbd_clear_que() and completing requests in recv_work(),
> which can lead to double completion of a request.
> 
> To fix it, flush the recv worker before iterating over
> the requests and don't abort the completed request
> while iterating.

Applied, thanks.

-- 
Jens Axboe

