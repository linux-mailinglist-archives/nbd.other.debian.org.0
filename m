Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 434DF2AC389
	for <lists+nbd@lfdr.de>; Mon,  9 Nov 2020 19:18:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0E8D120174; Mon,  9 Nov 2020 18:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov  9 18:18:09 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CD03720192
	for <lists-other-nbd@bendel.debian.org>; Mon,  9 Nov 2020 18:02:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DJm1v8rJrTv5 for <lists-other-nbd@bendel.debian.org>;
	Mon,  9 Nov 2020 18:02:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x741.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 280DF20187
	for <nbd@other.debian.org>; Mon,  9 Nov 2020 18:02:37 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id v143so4242779qkb.2
        for <nbd@other.debian.org>; Mon, 09 Nov 2020 10:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4+wJvodj8QGA3+lx46g9VLVUXUE4sXqbQye56BRZMT4=;
        b=nSvFzbiJKVhU09cCGGVNSYHbbmTJkjuubXVygWLThsMfy/tc+I2j/FbKAFmSC0EIZ7
         f5TGaTgQKeRqbTnJajqJsqJtdlpCbME1Vpys9kTJ47XAGP9mgoMM62qWhSUyhuFX6WI7
         5PTVI6M9t82MpAa2fKaynglPY2MY+yUTIHI3u5F3A9qwme4bnyDvSJLMnRspqf31Z0Mi
         rJRHAJKajfZOdEGp+M16BxoczhboCyhTxBq07DlDtXj4zkG4d43jHMuvQOVk+O2YvUox
         5ZnnZ2JGkPMeej/FEEZZz8qN2SdupTHAR0iagSqlSpwEe/1RtHzYBa8ipLn/BaHTJvci
         4oOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4+wJvodj8QGA3+lx46g9VLVUXUE4sXqbQye56BRZMT4=;
        b=DfzzR9hwxBNM4Poa+3F8cX/Ob7g2a1lwKCuE/sIrsjOSYIu2oa8472XYJ82A3IMpVb
         WZcf2w14gQbhS9vtlS10Eddnpcr0m3mTpEhK3W8I5VZjll5cql7wFfrxrk+sg5mwHPb+
         MWrqByuyWVgRXw2SnTpAQiJoPDx5WUvZfy93Y9ocmXJMPBcxoZDWVZfgbaS8S80OI0Nr
         5BwA8mYZkVEnlSTccEuf8IOmps0azOTX6sx24utZEVQ4r5urwTGTYRFW9G7+CpUm7YMU
         BXuleUZpMmblCTq3kX1ecsp5OXuaNGijBRfjXZDls53odOps6/+EtkYDqlIRYNzCSk8t
         x6zA==
X-Gm-Message-State: AOAM532Gq7rmyr3Jt88BTZGfrM5v/x0XRObJtj+a49nZym9CnyKcGmtZ
	aeSAoki0u1qhVQVpxuy9M3cJ03KC6sGkt1Al
X-Google-Smtp-Source: ABdhPJzbVHuDdC2HNtZXp5HDnyFsLFdjIfYuZlbtcZBEn3OetSCdeOgcEoq0mosskMTCZPW1/Lj/KA==
X-Received: by 2002:a37:de17:: with SMTP id h23mr14834955qkj.267.1604944953998;
        Mon, 09 Nov 2020 10:02:33 -0800 (PST)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id q20sm6270879qtl.69.2020.11.09.10.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 10:02:33 -0800 (PST)
Subject: Re: [PATCH] nbd: fix a block_device refcount leak in nbd_release
To: Christoph Hellwig <hch@lst.de>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org
References: <20201109173059.2500429-1-hch@lst.de>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <00a2ebc2-95f2-eeb0-cbf8-cb4a5a198996@toxicpanda.com>
Date: Mon, 9 Nov 2020 13:02:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <20201109173059.2500429-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <hx8JpYsv_eJ.A.YSE.hfYqfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1049
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/00a2ebc2-95f2-eeb0-cbf8-cb4a5a198996@toxicpanda.com
Resent-Date: Mon,  9 Nov 2020 18:18:09 +0000 (UTC)

On 11/9/20 12:30 PM, Christoph Hellwig wrote:
> bdget_disk needs to be paired with bdput to not leak a reference
> on the block device inode.
> 
> Fixes: 08ba91ee6e2c ("nbd: Add the nbd NBD_DISCONNECT_ON_CLOSE config flag.")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

