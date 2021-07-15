Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 728473CA1A9
	for <lists+nbd@lfdr.de>; Thu, 15 Jul 2021 17:48:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 59FCD2074C; Thu, 15 Jul 2021 15:48:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Jul 15 15:48:09 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,TO_TOO_MANY
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 58D802073F
	for <lists-other-nbd@bendel.debian.org>; Thu, 15 Jul 2021 15:30:10 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id C7UkeiMDN01n for <lists-other-nbd@bendel.debian.org>;
	Thu, 15 Jul 2021 15:30:05 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-oi1-x234.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 6B76C2071D
	for <nbd@other.debian.org>; Thu, 15 Jul 2021 15:30:01 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id u11so7099044oiv.1
        for <nbd@other.debian.org>; Thu, 15 Jul 2021 08:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PC2VbGgFNMREyj7t2K6qMwTJqqmujTnFnTwETsTl8KE=;
        b=ZTkEOsNFqSsyfKnxnOTBkE8/wgJ/33qsotjSIS+MPztNmZ7sxk5xxqRKgMaMmufRXq
         pGXb3buYLa8d22iZc16hKU72UJKlG9BMfGYbCJvmjr/81LJV7rfAEHCXZvtF0jhc8+BX
         IsnyzyPfaqvpuHoV96ZEOhzyhN2drYCAtdRY+8buOoI446VAreXkeMWfjFBQyrI6v5AK
         xq4SDid+0zfwHALvdfzZFJFoTPp79pdCC62oZJrUfwALZNMWwQBCatRXAmeS1S/3Ezj5
         FFjN1VZ3o/XtFaV/w75AD6GlN1RX9agFPDIlFXYh6S7hb/Yjb5ZtRb8oPEb6tfAniIMX
         IRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PC2VbGgFNMREyj7t2K6qMwTJqqmujTnFnTwETsTl8KE=;
        b=pR3aM86RLEQkZsHT+xIi/i4aJvqcLaArInO28ZyGQU2KLVAAUygWzSesE5W7vR6l6L
         Ug0f23oSAwttiyrx8FiCNToFunibtfn/6+Lep/BYz92cGOId4q+xY885BeY+rp1epMmX
         H8pm8F97uKZxStOaf5GinCP+EeLLUXoQ0mSfJykJDLurm+q/qAD69sINTpzq2vGf8HUK
         4CGYmp2SWoWSFPjanVWFv830F8WWY8ff/Y2cAG4k6hxKCu1AMVb4N3OlL9GeXCDVM5xK
         8C9awzKblgYn86vvtMi9c2ijrFAaLLtKT1C9ceSC9SAiu25fAzRn2XeIpZEAKEgM2mKJ
         +5bg==
X-Gm-Message-State: AOAM533RCKrPQSilh/rmuuTW5FWNRBSoJHRXVEm8k7pGjv+Y4XqWfghF
	Rfm/AXFnpHsS8O+u6Nlk+I6zMQ==
X-Google-Smtp-Source: ABdhPJxLUGGvParA/BhFVdZiL1shYP+EoD1vvgU3uqV+DmLA8OKC1ZEL3QwlDa5F+UBxM0EK5gM0tw==
X-Received: by 2002:aca:af91:: with SMTP id y139mr4048545oie.36.1626362998437;
        Thu, 15 Jul 2021 08:29:58 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.234.126])
        by smtp.gmail.com with ESMTPSA id k7sm778110otn.60.2021.07.15.08.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 08:29:57 -0700 (PDT)
Subject: Re: [PATCH] block: nbd: fix order of cleaning up the queue and
 freeing the tagset
To: Wang Qing <wangqing@vivo.com>, Josef Bacik <josef@toxicpanda.com>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
Cc: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
References: <1625477143-18716-1-git-send-email-wangqing@vivo.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <a5668e8c-99db-e7d2-85a5-adacbd607ef7@kernel.dk>
Date: Thu, 15 Jul 2021 09:29:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1625477143-18716-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qrvnoqIhbqO.A.GkE.5iF8gB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1222
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a5668e8c-99db-e7d2-85a5-adacbd607ef7@kernel.dk
Resent-Date: Thu, 15 Jul 2021 15:48:09 +0000 (UTC)

On 7/5/21 3:25 AM, Wang Qing wrote:
> Must release the queue before freeing the tagset.

Applied, thanks.

-- 
Jens Axboe

