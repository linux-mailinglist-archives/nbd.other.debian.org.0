Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B27C3436217
	for <lists+nbd@lfdr.de>; Thu, 21 Oct 2021 14:51:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 729922025E; Thu, 21 Oct 2021 12:51:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 21 12:51:12 2021
Old-Return-Path: <paskripkin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MURPHY_DRUGS_REL8,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 039A720257
	for <lists-other-nbd@bendel.debian.org>; Thu, 21 Oct 2021 12:35:38 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.18 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id IVuhr2546b7h for <lists-other-nbd@bendel.debian.org>;
	Thu, 21 Oct 2021 12:35:33 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3FCE320251
	for <nbd@other.debian.org>; Thu, 21 Oct 2021 12:35:30 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bq11so1078164lfb.10
        for <nbd@other.debian.org>; Thu, 21 Oct 2021 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=djL1u8g2d1mzvxl7mcP/d2ka8TxkLu44HSU+KH0/+KU=;
        b=BGwQzsa/KoBGHlx9Q4qeFljfwXl3n9uXuSL18M8XNihfPAi5f3K9F+KhymS9lf/XfK
         gx+8a3geIEylLBS8Vh6Oze2MWGp1Y6ALa0QDFB2Zmg90IO8WLGiThm2KgVlNpGScGIQr
         +OqftyNs2Rc0k0cVXtMXEpBRYQc+lDeWkZZIdqICgRF6BvwJMCvA3UvduWwEqJbZsNop
         Xodl5pEUeh7q4eu1akP9q5138DD59hf2Xj27X9yMRu37xbewq0BiZYmV+Dra8UUTwM9W
         Sx5HFBt0hJJpFwxsYPMYXTS0yYlvpuV1eBzQK6t8toUjtq2Ob1R4zMighq+Dpca/KB/n
         e98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=djL1u8g2d1mzvxl7mcP/d2ka8TxkLu44HSU+KH0/+KU=;
        b=BTmG/n7gqM1Ae6ITBHXF0rfZp0dAkxYjlWthsPHbHoXRQAtHy/58EvdGg6NwJp2B7O
         DVrGw4Tq7xqP8DaOHj/kWVGU73evAkkjMaAKVyYfz66k6MaDDLSaHsBB3OMINRDLIKA2
         /7nB+V6RWL7pesfy1ema+JOJ32eBmyJqs+XPM+Lb8R+JcyukPJnTHXeauhv5uR7qCLfW
         I5yT2+mPbMRV4t5gmZUb/a0kKf8/LIEQvXD/7ML1R/nqq00bjtJgdoK2a8pAe8G6lPqK
         wIHwp7WtBBeDShKY8vWEKcuxknUiSlMrf77WDK3vDTaUazMhp/GqhcOqZQhfR/nSbmw6
         xgkA==
X-Gm-Message-State: AOAM53142im9KwiBK6t4Y5H9b+tTrlM/seIcuOtkroWBxxxNULZRPYfL
	62QdcPFRppGHuKFWZIx4LEQ=
X-Google-Smtp-Source: ABdhPJwT4vVVC8Giu0b7GadMQnCCCvxsfpCJxfvQ942Xcd//Y/8HTezqBL6s9POmO8LRNuN8p26zzQ==
X-Received: by 2002:a05:6512:acd:: with SMTP id n13mr5329525lfu.524.1634819727348;
        Thu, 21 Oct 2021 05:35:27 -0700 (PDT)
Received: from [192.168.1.11] ([94.103.235.181])
        by smtp.gmail.com with ESMTPSA id b10sm545150ljo.14.2021.10.21.05.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 05:35:26 -0700 (PDT)
Message-ID: <72fb140d-609b-c035-bdd6-d2b8639c116b@gmail.com>
Date: Thu, 21 Oct 2021 15:35:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 0/2] nbd: fix sanity check for first_minor
Content-Language: en-US
To: Yu Kuai <yukuai3@huawei.com>, josef@toxicpanda.com, axboe@kernel.dk
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com, luomeng12@huawei.com,
 Christoph Hellwig <hch@lst.de>
References: <20211021122936.758221-1-yukuai3@huawei.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211021122936.758221-1-yukuai3@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <18JOTmt3iID.A.OwG.AJWchB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1553
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/72fb140d-609b-c035-bdd6-d2b8639c116b@gmail.com
Resent-Date: Thu, 21 Oct 2021 12:51:12 +0000 (UTC)

On 10/21/21 15:29, Yu Kuai wrote:
> Yu Kuai (2):
>    nbd: fix max value for 'first_minor'
>    nbd: fix possible overflow for 'first_minor' in nbd_dev_add()
> 
>   drivers/block/nbd.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 

Hi, Yu!

Thank you for the fix, but this wrong check should be just removed, 
since root case of wrong sysfs file creation was fixed, as Christoph 
said [1]




[1] https://lore.kernel.org/lkml/20211011073556.GA10735@lst.de/



With regards,
Pavel Skripkin

