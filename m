Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEEF1059FF
	for <lists+nbd@lfdr.de>; Thu, 21 Nov 2019 19:54:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 75C57204AA; Thu, 21 Nov 2019 18:54:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov 21 18:54:09 2019
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,GMAIL,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1D0E520483
	for <lists-other-nbd@bendel.debian.org>; Thu, 21 Nov 2019 18:37:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, GMAIL=1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fwEPLZrOyqSn for <lists-other-nbd@bendel.debian.org>;
	Thu, 21 Nov 2019 18:37:30 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x141.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id CAA4E20482
	for <nbd@other.debian.org>; Thu, 21 Nov 2019 18:37:29 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id o18so4249388ils.12
        for <nbd@other.debian.org>; Thu, 21 Nov 2019 10:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=faq1HCiwAUKpn9KibrFveIIN8Gq95mpKVvXAdv0gtDk=;
        b=EJjPbSz0Y6tDOEGVI+1jJ8atWnfgVSawkkT8eN6V6cCPix2Oo1Ul5auUyUzMkYlDoK
         3qNVcfI7jBdMccdBn/qZtJ6b635qSK6GyU075QBm/DiZL+E8zm9p4ZUKRL1MoOZVUo9N
         hoLYwkn2XLv87sQlikDmsBXss5UhTiaeuDHLmSWYC9JxUub0lmUUW2xZVXJnpyOXNaGw
         y82WJV8Pyc4iflpx/NYF12hA4nSerOKHfUJ23hnfkFrUUUVENyO4lqlRhEgEEDYvonHB
         7Ro2z4dGPGwjzFmYorVFleDJuov531ZDGun6BqLfvQZGB8jgtd1IecdJaPKyCHOmApK5
         PRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=faq1HCiwAUKpn9KibrFveIIN8Gq95mpKVvXAdv0gtDk=;
        b=Z2XQoHxD3JoSdTEJ005QusCxXkwLduPw7FA1BrJI+OyNvnGTabez0KDb27G6JucErY
         VPAkxWwUDMmTnwujYeQ0DcMtxjJpweTfAcc15MK62ovv462RPHgOSSEIbytbDhW2NLoZ
         jEG6dS7IGxb+jsqun+6ekJJCiXbm6w0ciZ3aBG7Pe0rEtF6wle0d9AoO/NVytUZtEsem
         Z+jjZcCdEtFBibMQ9Bxlodsse5RQg8RcmGHsOqhu8Jl31Vhno791DqsZjNmfpbX0Gfog
         RBEMspwPjFVxlLs/rvkeC9MsztYC0Jd/2qvL+OxHpjoi7d+x/oxhd75sxUO9hsoED9SH
         zdAw==
X-Gm-Message-State: APjAAAXXXCqUMeDu/rHclmjinQGiHp2kiXhfHsrAdEW5eM9/MJnTOv2d
	v48S55v1J7sW02BlLi53QIwrhg==
X-Google-Smtp-Source: APXvYqwleGilbYtjejG0htBS2Id79yaqhJ2aVAJKwRv51I6HzmumqzuaenMu1RY8209HZRrCTLCAsA==
X-Received: by 2002:a92:b686:: with SMTP id m6mr11013166ill.35.1574361446126;
        Thu, 21 Nov 2019 10:37:26 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id s11sm1518746ilh.54.2019.11.21.10.37.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Nov 2019 10:37:25 -0800 (PST)
Subject: Re: [PATCH] nbd: prevent memory leak
To: Josef Bacik <josef@toxicpanda.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Cc: emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20190923200959.29643-1-navid.emamdoost@gmail.com>
 <20191121183017.h3qkpib5re27ty3b@MacBook-Pro-91.local>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <ae75694c-02a5-6f7f-c812-1350512490da@kernel.dk>
Date: Thu, 21 Nov 2019 11:37:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121183017.h3qkpib5re27ty3b@MacBook-Pro-91.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <lrCiE_1np3G.A.A3F.R1t1dB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/747
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ae75694c-02a5-6f7f-c812-1350512490da@kernel.dk
Resent-Date: Thu, 21 Nov 2019 18:54:09 +0000 (UTC)

On 11/21/19 11:30 AM, Josef Bacik wrote:
> On Mon, Sep 23, 2019 at 03:09:58PM -0500, Navid Emamdoost wrote:
>> In nbd_add_socket when krealloc succeeds, if nsock's allocation fail the
>> reallocted memory is leak. The correct behaviour should be assigning the
>> reallocted memory to config->socks right after success.
>>
>> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
>> ---
> 
> Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Now applied, thanks.

-- 
Jens Axboe

