Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CDE2DD3D3
	for <lists+nbd@lfdr.de>; Thu, 17 Dec 2020 16:12:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4855E20036; Thu, 17 Dec 2020 15:12:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Dec 17 15:12:12 2020
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C371D20925
	for <lists-other-nbd@bendel.debian.org>; Thu, 17 Dec 2020 14:55:19 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.981 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.001,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id tM0e2ZSfFPSF for <lists-other-nbd@bendel.debian.org>;
	Thu, 17 Dec 2020 14:55:15 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-io1-xd32.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 831BE208D2
	for <nbd@other.debian.org>; Thu, 17 Dec 2020 14:55:11 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id m23so12971028ioy.2
        for <nbd@other.debian.org>; Thu, 17 Dec 2020 06:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AppbOyrBaJen3npr6us/u+3s8pRHAJIQTjC/7eMkWrY=;
        b=qIsNU8MNaXfORjHakfIhVA6M0I+jhauT8ujQjdTh9pltOmusTdjtS6vAZtGFqUKa+h
         1djBuHsK4XxRHHLJzWI3bGidYfLa3CWko/3FVyNpI3oJJYnYAVLWJBKKhi3VfLGOs7dX
         W1X16QmHGd/vEu/IxDQxMe5iJvYn1J/20qdKaMkr/uFQe1EDwdejrAd911mA6PbqjulD
         PwkyKPXO0j4zqejFvZzCV51KA5NnIcxg87o90ufkWZY8neAizIwC0A8kiIdXUb/QGyGo
         MEmaiaZzG/uVrv4jVgLnAQ8QYEJYDHAUzeoVUvCp4fNKcqWiBLD1fxGUdXNsbjG0Keqx
         ZY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AppbOyrBaJen3npr6us/u+3s8pRHAJIQTjC/7eMkWrY=;
        b=ZJx1gmpL3omwRJuK55f2HxlNcRkrT5/qLOAc1BR1VpqR2uymiV8i4ZjYXehzl/5DUV
         ywAEbw6l5Ik4c5p1aWNN3nhHU6ky2gshFRBstWz1/OwXMw+dGzEU37Wd22dApEY1LRv/
         hLbGAKtq00KmhzJpuetso088dVkmRKD778RShtPcATKaOw610FJAWyrnht4iwzoZKik+
         O8+sUkDnBeOsSwUXb8nECiIRWRpVdidnBwxjXKJG0Zu31dkcbAF473lgQTcYvwC+EzxS
         v9W2Tf1HSVcxCp1WCUHcJydRwe9QM7R+2HIyLv2cutmc/+UCk2vJNr48yP9KdO80sj35
         swSg==
X-Gm-Message-State: AOAM532vQi+rnb5/DPblWn5CnBcgZcHA4HV5oGjXLwzD7ZV2qPp8tkUb
	7hlpETLdmu96rwMMogmSZ5/btQ==
X-Google-Smtp-Source: ABdhPJwfMNgZvVnqWHpCY0jEbFdtpsS2a0qvoidjGtaw1ygKCvI5Uzf8bManknMBHDhGm/ob4gK8MA==
X-Received: by 2002:a05:6602:2e81:: with SMTP id m1mr45693684iow.131.1608216908061;
        Thu, 17 Dec 2020 06:55:08 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id p11sm1762461ilb.13.2020.12.17.06.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 06:55:07 -0800 (PST)
Subject: Re: [PATCH] nbd: Respect max_part for all partition scans
To: Josh Triplett <josh@joshtriplett.org>, Josef Bacik <josef@toxicpanda.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <86d03378210ddac44eb07ebb78c9b0f32c56fe96.1608195087.git.josh@joshtriplett.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <2a3c0b4b-52d0-b4e0-182e-c15f2a80d348@kernel.dk>
Date: Thu, 17 Dec 2020 07:55:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <86d03378210ddac44eb07ebb78c9b0f32c56fe96.1608195087.git.josh@joshtriplett.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <gIyGBg-6mt.A.orH.MV32fB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1103
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/2a3c0b4b-52d0-b4e0-182e-c15f2a80d348@kernel.dk
Resent-Date: Thu, 17 Dec 2020 15:12:12 +0000 (UTC)

On 12/17/20 1:58 AM, Josh Triplett wrote:
> The creation path of the NBD device respects max_part and only scans for
> partitions if max_part is not 0. However, some other code paths ignore
> max_part, and unconditionally scan for partitions. Add a check for
> max_part on each partition scan.

Applied, thanks.

-- 
Jens Axboe

