Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9294D3F9
	for <lists+nbd@lfdr.de>; Fri,  9 Aug 2024 17:51:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 68BF220491; Fri,  9 Aug 2024 15:51:22 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Aug  9 15:51:22 2024
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3A3382048C
	for <lists-other-nbd@bendel.debian.org>; Fri,  9 Aug 2024 15:35:04 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, MD5_SHA1_SUM=-1,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id SqQchgCXaFcY for <lists-other-nbd@bendel.debian.org>;
	Fri,  9 Aug 2024 15:35:00 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x130.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "WR4" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 9F0702048B
	for <nbd@other.debian.org>; Fri,  9 Aug 2024 15:35:00 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-39aeccc63deso1086795ab.2
        for <nbd@other.debian.org>; Fri, 09 Aug 2024 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1723217697; x=1723822497; darn=other.debian.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oId9STgLfdIGQ+LhZbW6hxg3skZFfi+5Ez0mg+R4Joc=;
        b=MWg2/yZr4SXnGyJ7s8lp5B5d5+siJudxBDpK4BRVdZpNRonz3RIKzxAUMXT2SVw3JJ
         LMRoCEZNMCfIsrE2KCwM8WowcCL7EdaqFcpWIQ4MqLLvoZAh4649KjV9xd8OXia54bhK
         xpGe4EnpfVVF73ehJi17OW8auZK41dGbDau7Tr6Ycn2l9qofswvTWi+u48Gew6dAnwgu
         SL54RdQpw4ROrMws1w1N0KBBykoGEMtmYGijl3KThIuHxR3So9PNdJhY2CeO1mMsx33k
         0o5PXXQlgzOnM8S51hztczZ/kUiq2MrtyQQamaE6kvJ00ExlEeV2HoUbuQk0dx7eIoyU
         omJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723217697; x=1723822497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oId9STgLfdIGQ+LhZbW6hxg3skZFfi+5Ez0mg+R4Joc=;
        b=aS3kCvC+0Xl+Rwv5qPgGI7Q4RLjRNQpT2cnhNoTyADxCvL5KjX/9WgNQ+GhfNKjjMR
         F1ZqaO9TUi681a8wPsxtsjUGT5gRwRnRgzSMHZHk/fdFlST4kuVt+VaC1d3/05EyzjIO
         1MZCuWEMfVGnNqu46q0M3AFKYg+cthfJDNlWIFrsN03E2ZiGPeqfktbBQtcT7yhBZgoC
         nR+ytuuWLeR+2yM5gGg/rx2K3kI12pZDsbMLQIZ2AxurDLwAAvDf8r8W1tChrrFFh3Oz
         AgVbL2QDfnfkUtVcJoBUjivrOhQ5ORnuO1+wmX/D1HsSPUct+keQuQRRjAKCX6DO4UpH
         7QMA==
X-Forwarded-Encrypted: i=1; AJvYcCU0oLJ1wXN8KUaX2cxpEa/GYbth8dHEmw+7iBf6QASlbFO81Imcgo5TM8WtXFKjdWjDHQxUxHlzR3djLQniVdoX1B/Adg==
X-Gm-Message-State: AOJu0YzaXOVvkGHE8ejUBtBZljpMMQe7hRas3913CHgFCrY5ckD2SaBX
	Jv21YD+Ej7rtUFKrGEDOQMDKzGKKoNdW9MMFX36t+lCKSF4+GRjt2NuP0lb84iU=
X-Google-Smtp-Source: AGHT+IFLRZmDl+ZxbjcJJ8qEWSq27UMzqEjFndcG5q43EFzp3g4B7kGjU8tgMo9TiYr31X2+hClk/A==
X-Received: by 2002:a05:6e02:1d0b:b0:39a:ef62:4eb2 with SMTP id e9e14a558f8ab-39b8134a5eamr16121925ab.4.1723217696883;
        Fri, 09 Aug 2024 08:34:56 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c8d69878d2sm4188811173.26.2024.08.09.08.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 08:34:56 -0700 (PDT)
Message-ID: <584a1774-0268-4b3c-9a78-0f00073b9d74@kernel.dk>
Date: Fri, 9 Aug 2024 09:34:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] nbd: correct the maximum value for discard sectors
To: Wouter Verhelst <w@uter.be>, Josef Bacik <josef@toxicpanda.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-block@vger.kernel.org,
 nbd@other.debian.org, linux-kernel@vger.kernel.org
References: <20240803130432.5952-1-w@uter.be>
 <20240808070604.179799-1-w@uter.be> <20240808070604.179799-3-w@uter.be>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240808070604.179799-3-w@uter.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <q0NZ0-WSvPI.A.XVsI.6rjtmB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3132
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/584a1774-0268-4b3c-9a78-0f00073b9d74@kernel.dk
Resent-Date: Fri,  9 Aug 2024 15:51:22 +0000 (UTC)

On 8/8/24 1:06 AM, Wouter Verhelst wrote:
> The version of the NBD protocol implemented by the kernel driver
> currently has a 32 bit field for length values. As the NBD protocol uses
> bytes as a unit of length, length values larger than 2^32 bytes cannot
> be expressed.
> 
> Update the max_hw_discard_sectors field to match that.
> 
> Signed-off-by: Wouter Verhelst <w@uter.be>
> Fixes: 268283244c0f018dec8bf4a9c69ce50684561f46

This isn't the correct way to have a fixes line.

In general, please don't nest next versions under the previous posting,
and it's strongly recommended to have a cover letter that includes that
changed from version N to N+1. Otherwise we have to guess... So please
include that when posting v4.

-- 
Jens Axboe

